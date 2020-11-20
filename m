Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1116173lfb;
        Fri, 20 Nov 2020 00:53:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqxilcs3bY/kyOWeJFpOwxP0ukj62Kgn2GfsXFxnY8/jqWjiN8l3vjMjrFGFeZL4PtVUHy
X-Received: by 2002:a05:6902:102a:: with SMTP id x10mr16893501ybt.130.1605862409447;
        Fri, 20 Nov 2020 00:53:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605862409; cv=none;
        d=google.com; s=arc-20160816;
        b=RWIZM9361g9YDp78w3RxGhVz5pjKnn68zOETQBbjan3a5+xeqfH8zVFqSSy9Z67Fm9
         MWxYLgYJ6Dwk9ThJxuYaJkxiHAhl7MeVT+Y/VaXGDGanPG8cawh15Q/T0Gcx5aQde0Gy
         Gzi/NOeV3vS12uYa6I7h4pizIADQMK6TZ54DmcnBTNMpC/sdkYmunXKqzJ9jBynLt/eZ
         8A2wtrzi0E6E9bU998NMBcE0yOE+7WyOO9DrzqK8PWhtXKlUFC7vFKBXnMVvRLltfNG0
         cfBX4k94Nt3RFUcRI8DQDi1w+2q3ZNSck0+OTzp8XUKZIsZBpEapq7Tzulbnx2BOZRUS
         4O8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=QJVEt1Sb/Y2mqI5Z8hNBHjHUki/iQBkRi0p0tC3pPIs=;
        b=oGlvQtJdedIejZP0R/tjSxbBh6xfG38aQm7Y0YTcrtc+HQB4mHAAEH3xGSj/Eg/nub
         vtmooO8zqAgVHZcc5PIa5OrN+xdETUCmPA2DNO90Nq5BU3ccq4NouG1bCj/BHEK7FuAT
         2lf/j9d05MS4kq5LMbU4y+hgfY+prAEK93otJOgBltAH4dRQaer/tFxKLL1p1aNE3+mC
         jLy6QtjKYq998O2aEHj2YpOrsUn9kA8wLUWNSrPeAgRvUNHPL3i390yFCOz1QsG6K2Jw
         vQ/NFCx9cbrwWihgp5CJC7OjWF0n7zJnjD6T2D8O8CgrxAgH7U7oz0juJicUxr6P7YZ6
         ftag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si1971561ybi.57.2020.11.20.00.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 00:53:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg2Aa-0005qQ-Pk
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 03:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kg2AQ-0005p2-Ex; Fri, 20 Nov 2020 03:53:18 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kg2AN-0001Uj-Oh; Fri, 20 Nov 2020 03:53:17 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ccr0W0Yh1zhdXB;
 Fri, 20 Nov 2020 16:52:43 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Fri, 20 Nov 2020 16:52:52 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>
Subject: [RFC PATCH 2/2] ramlist: Resize dirty bitmap blocks after remove
 ramblock
Date: Fri, 20 Nov 2020 16:51:57 +0800
Message-ID: <20201120085157.7136-3-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20201120085157.7136-1-zhukeqian1@huawei.com>
References: <20201120085157.7136-1-zhukeqian1@huawei.com>
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
X-TUID: QkJBtz3mheHw

Use the new "dirty_bitmap_resize" interface to reduce dirty bitmap
blocks after we remove a ramblock from ramlist.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 softmmu/physmem.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index f6ff78378e..2a17e0a89a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2131,6 +2131,8 @@ static void reclaim_ramblock(RAMBlock *block)
 
 void qemu_ram_free(RAMBlock *block)
 {
+    ram_addr_t old_ram_size, new_ram_size;
+
     if (!block) {
         return;
     }
@@ -2140,12 +2142,18 @@ void qemu_ram_free(RAMBlock *block)
     }
 
     qemu_mutex_lock_ramlist();
+
+    old_ram_size = last_ram_page();
     QLIST_REMOVE_RCU(block, next);
+    new_ram_size = last_ram_page();
+    dirty_bitmap_resize(old_ram_size, new_ram_size);
+
     ram_list.mru_block = NULL;
     /* Write list before version */
     smp_wmb();
     ram_list.version++;
     call_rcu(block, reclaim_ramblock, rcu);
+
     qemu_mutex_unlock_ramlist();
 }
 
-- 
2.23.0

