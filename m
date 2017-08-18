Received: by 10.223.188.70 with SMTP id a6csp409734wrh;
        Fri, 18 Aug 2017 07:01:45 -0700 (PDT)
X-Received: by 10.99.190.69 with SMTP id g5mr8775800pgo.152.1503064905706;
        Fri, 18 Aug 2017 07:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503064905; cv=none;
        d=google.com; s=arc-20160816;
        b=kODY1ngQqGB7dB6GsB6ipUYgRpktRZKUBcHjOjlWO9t/A9PXnLE2leXfedl8GP7Buz
         ytTFDB7olMrInhcC01pWNrz/z7rE3xK/QeeA5B2/0xOTeUC5nO/qvl1ingw/latAY+4q
         tC5JzLGcnZRKzISGyC1wbJx0c55HBzeyuS0jJg/Iq5qtZXaIJum6d9VkkNE2LRvPSy9P
         MuVLY5yp27mL6N+8PnomYqp15BxTAtSYxalzTLZTOkrhV06skzGGM8ukR57/htih9NXy
         So+GzgaYs3fUyHTr2tFakRzkGJFHEy7AwzikPZoW5rxY4HOlqPCGm8Zs0mCieFJo/cO7
         u4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:dkim-signature:arc-authentication-results;
        bh=GkrySu/lr9rMyiXyTVMUZ/kImBZEzhynaAFa13kfwiE=;
        b=N7tQuzoxBgHoy1WkridhVbb97sqqjgmtkStHCCh5yWnd7h4JQsDt7tdFiNQjQpozNR
         7rG2kZrjFhdOpqTNYjrFV8q3A/+XvaDgLqJTZrn9sUyozybkmCSEY2sfiWjDS132iboQ
         iQVjmGBw7Eb6FzGLGbPeYwKDfFtUjmneEANFGB/AxzupZz3iNhDJwCXvJiVeGbY8zEMr
         St2wp7u85lUKtaDDcGBDur1os93e/l7CWN06P9Bu8SFHDYYQVW4GO57hJp9mq63I7kot
         XoQwZaULy/zymk//GMEM9Yj0JXlliYjTFVpAO1fc4eWxIEUs90pnmJJIYB4koqObd9qV
         FMIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@lists.infradead.org header.s=bombadil.20170209 header.b=GQBwzYyx;
       spf=pass (google.com: best guess record for domain of linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org designates 65.50.211.133 as permitted sender) smtp.mailfrom=linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org
Return-Path: <linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org>
Received: from bombadil.infradead.org (bombadil.infradead.org. [65.50.211.133])
        by mx.google.com with ESMTPS id s11si3887461plj.789.2017.08.18.07.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Aug 2017 07:01:45 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org designates 65.50.211.133 as permitted sender) client-ip=65.50.211.133;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@lists.infradead.org header.s=bombadil.20170209 header.b=GQBwzYyx;
       spf=pass (google.com: best guess record for domain of linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org designates 65.50.211.133 as permitted sender) smtp.mailfrom=linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GkrySu/lr9rMyiXyTVMUZ/kImBZEzhynaAFa13kfwiE=; b=GQBwzYyx8Fhspv
	IoYyIiq8YLOQo/GfNVx8DFlhpUGdCV8HOSZNFvxUaYeUo8x4xBEo71WWOQecw7FeewgCukceyD30l
	aTo2uVqRHK0L00wS0HsR7FbXCYmlhhc2U6mIMtXgCsqDmMCxK1M27wQ0TfykAsauJQJGxJnZSBdEA
	z5ufcnodAnlaqXf9/gPfpzJP1CHXVKMospcS7OoxO3BYVK3hl2st0jGu276w0x7e/CHx/bqFIvRbu
	gkTLx0O2pEzeeIoHyyjCTNvhrGR7A8xfYhUxzSYXQ5AgDcFeSAEs1MZ6YC90SmJJo640O84SLbfOs
	Y6HPoP0gZklrVW6qapvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
	id 1dihqG-0004AQ-7T; Fri, 18 Aug 2017 14:01:40 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dihq8-00041I-IJ
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Aug 2017 14:01:34 +0000
Received: from 172.30.72.58 (EHLO DGGEMS411-HUB.china.huawei.com)
 ([172.30.72.58])
 by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
 with ESMTP id DFM74404; Fri, 18 Aug 2017 22:00:47 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.301.0; Fri, 18 Aug 2017 22:00:13 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <mst@redhat.com>, <imammedo@redhat.com>, <zhaoshenglong@huawei.com>,
 <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <kvm@vger.kernel.org>,
 <edk2-devel@lists.01.org>, <christoffer.dall@linaro.org>,
 <marc.zyngier@arm.com>, <will.deacon@arm.com>, <james.morse@arm.com>,
 <tbaicar@codeaurora.org>, <ard.biesheuvel@linaro.org>,
 <mingo@kernel.org>, <bp@suse.de>, <shiju.jose@huawei.com>,
 <zjzhang@codeaurora.org>, <linux-arm-kernel@lists.infradead.org>,
 <kvmarm@lists.cs.columbia.edu>, <linux-kernel@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <devel@acpica.org>,
 <john.garry@huawei.com>, <jonathan.cameron@huawei.com>,
 <shameerali.kolothum.thodi@huawei.com>, <huangdaode@hisilicon.com>,
 <wangzhou1@hisilicon.com>
Subject: [PATCH v11 4/6] target-arm: kvm64: detect guest RAS EXTENSION feature
Date: Fri, 18 Aug 2017 22:23:45 +0800
Message-ID: <1503066227-18251-5-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com>
References: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A020201.5996F30F.02DB, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 888d5f8d1e081f94f5dc4a02f078723a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20170818_070132_944138_06D2B936 
X-CRM114-Status: GOOD (  10.58  )
X-Spam-Score: -1.9 (-)
X-Spam-Report: SpamAssassin version 3.4.1 on bombadil.infradead.org summary:
 Content analysis details:   (-1.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RP_MATCHES_RCVD Envelope sender domain matches handover relay domain
 -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
 [score: 0.0000]
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: zhengqiang10@huawei.com, wuquanming@huawei.com, huangshaoyu@huawei.com,
 linuxarm@huawei.com, gengdongjiu@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org
X-TUID: znlPK6MQchMS

check if kvm supports guest RAS EXTENSION. if so, set
corresponding feature bit for vcpu.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 linux-headers/linux/kvm.h | 1 +
 target/arm/cpu.h          | 3 +++
 target/arm/kvm64.c        | 8 ++++++++
 3 files changed, 12 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 7971a4f..2aa176e 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -929,6 +929,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PPC_SMT_POSSIBLE 147
 #define KVM_CAP_HYPERV_SYNIC2 148
 #define KVM_CAP_HYPERV_VP_INDEX 149
+#define KVM_CAP_ARM_RAS_EXTENSION 150
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b39d64a..6b0961b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -611,6 +611,8 @@ struct ARMCPU {
 
     /* CPU has memory protection unit */
     bool has_mpu;
+    /* CPU has ras extension unit */
+    bool has_ras_extension;
     /* PMSAv7 MPU number of supported regions */
     uint32_t pmsav7_dregion;
 
@@ -1229,6 +1231,7 @@ enum arm_features {
     ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings */
     ARM_FEATURE_PMU, /* has PMU support */
     ARM_FEATURE_VBAR, /* has cp15 VBAR */
+    ARM_FEATURE_RAS_EXTENSION, /*has RAS extension support */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index a16abc8..0781367 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -518,6 +518,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
         unset_feature(&env->features, ARM_FEATURE_PMU);
     }
 
+    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_RAS_EXTENSION)) {
+        cpu->has_ras_extension = true;
+        set_feature(&env->features, ARM_FEATURE_RAS_EXTENSION);
+    } else {
+        cpu->has_ras_extension = false;
+        unset_feature(&env->features, ARM_FEATURE_RAS_EXTENSION);
+    }
+
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cs);
     if (ret) {
-- 
1.8.3.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
