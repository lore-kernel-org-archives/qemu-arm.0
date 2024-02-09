Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp863319ejb;
        Fri, 9 Feb 2024 08:01:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUPS67BKKX2rYytIcEof4XJVs0ggbSG5ELCwAbYGpKp+EFeMWIIju59jpYaHGyBKBjLg7BnhaUFFX53YiVzkeEMLhFHsd3/
X-Google-Smtp-Source: AGHT+IEB+Z7Sx3shukgfEAdbs4L+hGtyhbYlfrdQz2RcP/Qsdvf9wvWtboee2Ji8KN2hwNodIIQ3
X-Received: by 2002:a0c:f291:0:b0:68c:a4a8:b134 with SMTP id k17-20020a0cf291000000b0068ca4a8b134mr2038212qvl.45.1707494503794;
        Fri, 09 Feb 2024 08:01:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707494503; cv=none;
        d=google.com; s=arc-20160816;
        b=jveR7tor7OaS9GHxd5W9LDu7xKEuCuSAn51zBBrIBxR2iNpuk/7Gqi/jdogO/zj7s/
         ipZCcTSOUjX5TETKqBNAPsiuDzSZHEEo/YkNpow237uGezOuiw+agkFB5qI2ACl+nK0h
         AxI4qXjOr2OVtBJ4luJkKKNhhpZcEHN3ur4TZpZJf6THNdREXR6g37enuYOMwoPznE1w
         wWu+kACFOJAuMMuCdIRNnjS9WpRsPXnEK1xuO2f4tr8jTnnCT2IsFj9r8K596laX9IHU
         wQQ/ZrLmGDnmPEInweRg+fnFb3HF9uGaz7FT/EKq6LfGdNj22PcbJ7b+dXZdrtKhYp+E
         5OYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NBtPtUTLr4gACY8ONXPAct8+BhGOhDuuMtWRt+FduVo=;
        fh=flBayqCcpGH27+q0z3bhhxslZoS8n0NxpkLBPyjHTlE=;
        b=Cq3hr/f4HkjtuAPQeA4cIsSpPoiXbTs/XJ/wd5VhOx9ez40Ms8O9TIOWAFtl1t1gWj
         3uQj58ZN2rAfJp/NN/1xfjjTuJF4UBiFVe4I2JIna7Ez7lDhsHSd/Dugfki5k0jmzV0C
         pjzTcJAPZNt4lQtzwhUHYrf5OygvuMYtNSHPOXyHcFOi1c+cvEjvg6VkCpph6lqsG8E7
         ERdlrvHpEqjH3iHzAh1pt+XI01R3IEBmYg6i80vhg36/joX0+JVeT6+Gv4Zd/mZGiVrq
         PWBpAzGaUxL3oOZvRZEQRijw/XVQxNgOM34JfMIfffjIu51HBaQ60X+nla8FwiWG++i7
         Oa5g==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dLHvi3gS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCVprl3oxPCemXx504PsFYOo0aPNuP71sN9LNjYK5u0eIS/xR26GdNjepTtfcYzzJa2wWLGLvkAheazTELCfWeVjWm/hfR5W
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu10-20020ad45cca000000b0068cc029025fsi2218428qvb.304.2024.02.09.08.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Feb 2024 08:01:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dLHvi3gS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rYTJX-000186-EJ; Fri, 09 Feb 2024 11:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rYTJQ-00016h-P3
 for qemu-arm@nongnu.org; Fri, 09 Feb 2024 11:01:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rYTJC-000655-7L
 for qemu-arm@nongnu.org; Fri, 09 Feb 2024 11:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707494457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBtPtUTLr4gACY8ONXPAct8+BhGOhDuuMtWRt+FduVo=;
 b=dLHvi3gSBwgZwAc/BSXaX//O/wM6fjcDrECX33z6a6TYioo8zYHzYrf06PhUiYecsYMBpk
 2SMW5uwCuRJ1/C+NeyvRnA3rwx96ScGYOJT2Ddxihb7dvDVyz6mLLWsh7agd/oMq3+kUnh
 M2v7cV6Es8Q9hoke4NPffex0GY4fG8Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-LLLbaW6yNa-XtsvAFpG_rw-1; Fri, 09 Feb 2024 11:00:54 -0500
X-MC-Unique: LLLbaW6yNa-XtsvAFpG_rw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F8E48489A0;
 Fri,  9 Feb 2024 16:00:50 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A82BF492BC6;
 Fri,  9 Feb 2024 16:00:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, haibo.xu@linaro.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com
Subject: [RFC v2 3/5] target/arm/kvm: Add helper to detect EL2 when using KVM
Date: Fri,  9 Feb 2024 16:59:15 +0100
Message-ID: <20240209160039.677865-4-eric.auger@redhat.com>
In-Reply-To: <20240209160039.677865-1-eric.auger@redhat.com>
References: <20240209160039.677865-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.269,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9li8HprjpTY0

From: Haibo Xu <haibo.xu@linaro.org>

Introduce query support for KVM_CAP_ARM_EL2.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm.c     |  5 +++++
 target/arm/kvm_arm.h | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 81813030a5..0996866afe 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1791,6 +1791,11 @@ bool kvm_arm_aarch32_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL1_32BIT);
 }
 
+bool kvm_arm_el2_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL2);
+}
+
 bool kvm_arm_sve_supported(void)
 {
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index cfaa0d9bc7..36e4b37ec0 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -188,6 +188,13 @@ bool kvm_arm_pmu_supported(void);
  */
 bool kvm_arm_sve_supported(void);
 
+/**
+ * kvm_arm_el2_supported:
+ *
+ * Returns true if KVM can enable EL2 and false otherwise.
+ */
+bool kvm_arm_el2_supported(void);
+
 /**
  * kvm_arm_get_max_vm_ipa_size:
  * @ms: Machine state handle
@@ -235,6 +242,11 @@ static inline bool kvm_arm_sve_supported(void)
     return false;
 }
 
+static inline bool kvm_arm_el2_supported(void)
+{
+    return false;
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
-- 
2.41.0

