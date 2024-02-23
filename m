Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp475764ejf;
        Fri, 23 Feb 2024 02:36:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXBpp/BPfbvklJ3HAfIw1hnbpOY+QeML948h5qy8NsUCpuOxlwVnQllUcXaGgRg1siK73mPt4WHUdyOMwBTC9YpKDyIfCXJ
X-Google-Smtp-Source: AGHT+IEA7YFam04Qdn2aDMzl4ZUN0e3Ox5I7Zu6326id2NO2SzZaP+ffpAL9MnHL+IIblT+v1a8a
X-Received: by 2002:a05:620a:4ad9:b0:787:34f6:a706 with SMTP id sq25-20020a05620a4ad900b0078734f6a706mr1604249qkn.28.1708684575356;
        Fri, 23 Feb 2024 02:36:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684575; cv=none;
        d=google.com; s=arc-20160816;
        b=l4ZXhtheqOvRmI9q9n1Stedoj1g1EDUzGun9NDLHh3cCeQo48rbrsCXCP/M7m2WLqe
         xeGCMSEYQXxEKu5sP2ylTSPoxFfcjD3xNFrq+QPq7pjLdTT5O5wQMKwU0I0tsNa5QO/W
         w7Cmmsjf+3R4bJg5W0mVCHC3P4QZmHO6bmzSeUmXwQPuzIOgZmidQ/L36Xg1gdJ4DkE9
         xX4Fput/Gv0buNCoAO4NE0EFjcwDXOUBg9pOi1+vyG/2dOXYw2PkERHA84MZlrx3nL9j
         AcVNV0f9J2rRgll0io2X3Sn7opLl6j/1Xg3j/KCj36Zo+UfgaLDSpKnlqu1mfVntzCN1
         2Yhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=eRsUkGa7Jvv79xD9g59IGAS3tdFCCgpcqm7xCLyO4I4=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=Rux5D9AV/i3GPV/Pg0C3CqtCLn+eBT/fCiXXmre2cGd+VOh+wxKGdQOYi2/p6QH1jZ
         4cygIPcWHwkRaQ9kgZ8LObsllZCV1UvWC8qs8oO41GIK532Z7ei+iDgs/3barpSQ2p3B
         9XXYy+6CCaDFbghTplddGdarbOR/1rY9p8Z3PIHjdXa+I9EmXJ9okCKHYnhFnnNMt1kP
         joH47NXCELk63e50SuBnDP8G0HWZcmmziek3Xo3Gq+Lcp0TB9fJTC65yuqYk0wa7l/In
         AmO6emtGS5gqBLNU0I6dh8XdAd/V3kNp98rNJHrE8Nn9T8i+Yok3Qs4lLLOHxeiZwaHC
         qYzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id os9-20020a05620a810900b0078734fe5612si14793482qkn.656.2024.02.23.02.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:36:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdSsv-0003r6-VN; Fri, 23 Feb 2024 05:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsY-0003eK-Oe; Fri, 23 Feb 2024 05:34:08 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsP-0001wP-PO; Fri, 23 Feb 2024 05:34:06 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Th5sJ2bZ3z1h05D;
 Fri, 23 Feb 2024 18:31:32 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id C420F1400CC;
 Fri, 23 Feb 2024 18:33:42 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:42 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 09/21] target/arm: Handle PSTATE.ALLINT on taking an
 exception
Date: Fri, 23 Feb 2024 10:32:09 +0000
Message-ID: <20240223103221.1142518-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lu0zLDfxwA6z

Set or clear PSTATE.ALLINT on taking an exception to ELx according to the
SCTLR_ELx.SPINTMASK bit.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v3:
- Add Reviewed-by.
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index eb97ce0356..0a69638651 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11532,6 +11532,15 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         }
     }
 
+    if (cpu_isar_feature(aa64_nmi, cpu) &&
+        (env->cp15.sctlr_el[new_el] & SCTLR_NMI)) {
+        if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPINTMASK)) {
+            new_mode |= PSTATE_ALLINT;
+        } else {
+            new_mode &= ~PSTATE_ALLINT;
+        }
+    }
+
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = true;
     aarch64_restore_sp(env, new_el);
-- 
2.34.1

