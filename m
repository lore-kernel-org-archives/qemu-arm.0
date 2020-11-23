Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3340699lfb;
        Sun, 22 Nov 2020 22:30:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0RMtl88i9TWJSmxySyaxISMinnd3/ePwRT6C6FAt4LxJ+keXwb/tNmSSET025rI8IkOhx
X-Received: by 2002:a25:7608:: with SMTP id r8mr43574560ybc.131.1606113040737;
        Sun, 22 Nov 2020 22:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606113040; cv=none;
        d=google.com; s=arc-20160816;
        b=fBvreRBydDTl2iAN79BgNS2BHWyISToee3GhYPpqeAjE8SIgJ70DV/wObImhtfr943
         JZSVj7E4XaXIHorDavgacMz8eTgf6/jEzXywmZ/Kq2Zcji8N/1OC+1r5lg6SGmkejfTJ
         TpezvXbomC0s7DwVvILlZVa7nNswntiQ8n4ko0/W2hGiBcB/K/JINgOfnIXOPrghq1E/
         33oQjaLrc1MbZKpR11qi9ZK54mpWEIvkTamq/UtSuq1JvwVJ2W57QmTiUXXksuuZI68L
         zpM1K9oqlIh+qRg5TCSwC3Ekc8hLiEKivfke97oegNUJ8AZawNaZNtK+2vI8xAzCYfEx
         HnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=MP6pD1QX/GCDRO1Bk4Fr58yYL7Ako2jzP3X2Ph2gy6M=;
        b=I9EGRUizIolKLBW+/7T6JShebIZh/1fovOVrG7flvynwnIdFjunmJMIytLpoyqKMil
         K/H39yBk34L7TLScNrsV1QVVWZzrUf+PlkS+U94od6L5PuXOuW6ViVJYXPCvt0blpPAF
         O7aGKFKcCf95bGy1lz5MItvOxq9Rn0CanmeVVmQf32x7aC6Z2b23a0NXEANHHx8gfcw+
         t3cPPPqTdsY4sxJbOSZcKf47Dovd7Vn7iPmfS3mSUMaAIEis9HUpt23zBWqykMxSj2Dm
         zQNcfEU7NTsdmmM5VDMK8nQjjAdm3BYuZE0n5OPza/gSil6NuwMxDEfacu6v/+ezaf4W
         Wulw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si14010620ybt.432.2020.11.22.22.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Nov 2020 22:30:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kh5N2-0007u7-4I
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 01:30:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kh5Ms-0007rm-8N; Mon, 23 Nov 2020 01:30:30 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kh5Mp-0005ZS-Ng; Mon, 23 Nov 2020 01:30:30 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cfch83r1czkdbr;
 Mon, 23 Nov 2020 14:29:44 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Mon, 23 Nov 2020 14:30:02 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: [PATCH] net: Use correct default-path macro for downscript
Date: Mon, 23 Nov 2020 14:29:54 +0800
Message-ID: <20201123062954.9680-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: it7zF94wNIE3

Fixes: 63c4db4c2e6d (net: relocate paths to helpers and scripts)
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 net/tap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/tap.c b/net/tap.c
index c46ff66184..b8e5cca51c 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -951,7 +951,8 @@ free_fail:
             script = default_script = get_relocated_path(DEFAULT_NETWORK_SCRIPT);
         }
         if (!downscript) {
-            downscript = default_downscript = get_relocated_path(DEFAULT_NETWORK_SCRIPT);
+            downscript = default_downscript =
+                                 get_relocated_path(DEFAULT_NETWORK_DOWN_SCRIPT);
         }
 
         if (tap->has_ifname) {
-- 
2.23.0

