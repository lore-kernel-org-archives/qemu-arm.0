Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1116251lfb;
        Fri, 20 Nov 2020 00:53:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXcQAAFmZKDW59pnu/VOBgFYuLuSEFHBLgJuI0N3+uTf0qYBpfF8ADRGkO8Pl162IzjZPz
X-Received: by 2002:a25:bd7:: with SMTP id 206mr20613294ybl.84.1605862417999;
        Fri, 20 Nov 2020 00:53:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605862417; cv=none;
        d=google.com; s=arc-20160816;
        b=KEtrgXEV5sXtl0J8803Qtw2n6MKQv72uktKzRulQdVyLqZgwhoFwKOEfzzYNJXyhN4
         is4fLtLcqI151A5/D8i0RQjQAVfG9WI8FaXtDqnys9wmq0yHOHYWD2isL3W0Ht8Dz80h
         PUMOGTv9/E1RaNJzQUc1nAUpPs5D7fAfR8EgSyCUGu2Q0nf8ymM/FnG86bWcXdMiIEYQ
         lPgf9okwRAuhCCRJJI38HosjFfjqnspECvE/DulmBLvet4DVr2hzxUllXp1kw08IzLSR
         w5POdNbPD6hzAoOIGYJoLWgqeAWvMds78NqbxJ3xxxvCGM8bjYi08q/1CDJyK/eoYd5/
         g93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=4arQomiTsXkKV9kMWLI13Vvc95Zu05uKLua2WPru/P4=;
        b=yaX/x2XgpDqC0RQ4FnupLBnNAt4ZP9olwyWS03FiGsUdpJdPReZ1pRfj5Ssqs8uUq8
         v5sSO5hk0IoVmw8YsrBOFYIspsg5OJBJo4jYEi3ibFdD3nNz79ZKiP8qTYmB7kSKNBu8
         w0rOqRS7YdAdPUocoV7hcl7JM4vZDI8k25su6ubjUA3bwnon4HkF9qsS8Mg4zqzJYZeL
         OZ4Om/WZ3KX5aMEiFjpkKd+wo8fropQma8H/57kvMRTSpptA6gslygHVaik2RmJSSvlu
         Pm1xoQt5k7ilpJM0OyrXR8jtOIaKr2z/XxodLp0bUrK3loVFCljCSfEgeKuWrGhPCiFw
         dIvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h97si3054089ybi.405.2020.11.20.00.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 00:53:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg2Aj-000691-DP
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 03:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kg2AR-0005pT-QJ; Fri, 20 Nov 2020 03:53:19 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kg2AN-0001Ui-VB; Fri, 20 Nov 2020 03:53:19 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ccr0W0MTdzhdX3;
 Fri, 20 Nov 2020 16:52:43 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Fri, 20 Nov 2020 16:52:51 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>
Subject: [RFC PATCH 0/2] bugfix: Decrease dirty bitmap blocks after we remove
 ramblock
Date: Fri, 20 Nov 2020 16:51:55 +0800
Message-ID: <20201120085157.7136-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: sLs2cDd+xi4u

Hi all,

I failed to find where we free dirty bitmap blocks of ramlist. If this is a
memory leakage problem, I hope this patch series can fix it properly :-).

Thanks,
Keqian.

Keqian Zhu (2):
  ramlist: Make dirty bitmap blocks of ramlist resizable
  ramlist: Resize dirty bitmap blocks after remove ramblock

 softmmu/physmem.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

-- 
2.23.0

