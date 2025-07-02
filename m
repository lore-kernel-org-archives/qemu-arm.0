Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3934151dye;
        Wed, 2 Jul 2025 09:32:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOrj/u7pbpvxW/xCtIhs3ES3Lubf80Gfi42yO/kytOKTGCRIJGlWjcTlJy+kUHdTXNQaNsx2SVGpErjA==@linaro.org
X-Google-Smtp-Source: AGHT+IGudIfftospcF5qmv1XbwZwo0fpjVSVfrOYbJIUo1D9CxWGNal2k2JdFJfZ5V2axfGiHw+S
X-Received: by 2002:a05:6102:41ab:b0:4ec:c50c:399f with SMTP id ada2fe7eead31-4f16117a294mr2398767137.11.1751473956100;
        Wed, 02 Jul 2025 09:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751473956; cv=none;
        d=google.com; s=arc-20240605;
        b=RFT3gJJijuG6yFw6EgywUmgVlvGayHqeBgQhxkwTavbuSfTqcAEo7TxQJbUKve3PaV
         eEDsMqU2tOP7gIuGkmK3Loj39n2rE3JPovyZqP+7ohXSJ5wSDfoPfb7vZQ1Zoyxwwpcf
         GESjbhov8m40SyfMcq7Q+X6JAFJIp/Q3qE25Nw8W22qpDLu/UVbKRZHYf45+CSrcNGhY
         TY3Q1i1W4mNlziov0lT7xSZMk6dwyk/icoTdIk9EfYQsc/0hRbO69/aLXuV9dByfEDAf
         /+8XyPCAiojTNeiXqwyi0KW8QMyASIlpQs/bifJE6s58ymfb8B8B/Z/HwtIYIzyeLORi
         ULLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Y7zgkic6Vn3Gg62tyqYV3n0+jagdb6H2rJ2Bf3rpzog=;
        fh=UVrGBnfE9R8/5nTz0HPCluylUu4vXq1b0MPFtmDhPnc=;
        b=dA2ytAabfWtlQsBSUhs4jku+m10KlzAFuoa0FZ78lFbMixiVmwgs/90yvrudtAdUZI
         Bd8RuJfwZAWZOawjNNQo4xgqk4vhMQ+IFyoX3NhOgp5x7i2Vwus75PjIKZVtVie/sdgA
         PdCIhZ59NPZXkXio8NyrggVhMi6Jk6e8AHfJGHhPKEmRnEcGQl/FgllZVFbWP3B1wdoz
         9SeP4VXSn/YJRRZ2FXPgGzgNIlkBu6cGxk+sHJRja90ZZwm1oYc9OqBjmM7Scaj/FIT0
         f4/J0DYE76HcE5qlYhFu/FRJvjiqMhb64tOV0nI8B/IwZ3SMW69nCxnXEKgGnpsRud1K
         im2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aMzgJ/iw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ee4cbc2331si2910588137.480.2025.07.02.09.32.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 09:32:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aMzgJ/iw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uX0NP-0001GF-H4; Wed, 02 Jul 2025 12:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uX0ND-0001Bx-7b
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 12:31:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uX0N4-0006EU-D0
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 12:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751473897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7zgkic6Vn3Gg62tyqYV3n0+jagdb6H2rJ2Bf3rpzog=;
 b=aMzgJ/iwJb0q7QwAwcUUALLkDWYHTW+bE4XvnB0RHwXwtN3RccIf8zda6RHy1PN2aCQwhc
 QS7LcQKU6KGNgvLMRfiJ9+UzU3oVVaxwRg+iqPPKLGKA4EQ4ER8KKcYozLHB1UUbqV+jV0
 VNORprUpL8Yrfm6h/Eb7/2i2qcy2HlM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-279-pftlK1FvO-SWviDCSSS81A-1; Wed,
 02 Jul 2025 12:31:34 -0400
X-MC-Unique: pftlK1FvO-SWviDCSSS81A-1
X-Mimecast-MFC-AGG-ID: pftlK1FvO-SWviDCSSS81A_1751473893
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9495D19560B4; Wed,  2 Jul 2025 16:31:32 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EC5FE195608F; Wed,  2 Jul 2025 16:31:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Cc: hi@alyssa.is
Subject: [PATCH v7 2/4] target/arm/kvm: Add helper to detect EL2 when using KVM
Date: Wed,  2 Jul 2025 18:30:41 +0200
Message-ID: <20250702163115.251445-3-eric.auger@redhat.com>
In-Reply-To: <20250702163115.251445-1-eric.auger@redhat.com>
References: <20250702163115.251445-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: MT3GS9aEqznG

From: Haibo Xu <haibo.xu@linaro.org>

Introduce query support for KVM_CAP_ARM_EL2.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm_arm.h  | 7 +++++++
 target/arm/kvm-stub.c | 5 +++++
 target/arm/kvm.c      | 5 +++++
 3 files changed, 17 insertions(+)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 7dc83caed5..b4cad05155 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -191,6 +191,13 @@ bool kvm_arm_sve_supported(void);
  */
 bool kvm_arm_mte_supported(void);
 
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
diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 34e57fab01..c93462c5b9 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -47,6 +47,11 @@ bool kvm_arm_mte_supported(void)
     return false;
 }
 
+bool kvm_arm_el2_supported(void)
+{
+    return false;
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 426f8b159e..e5708e54ae 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1762,6 +1762,11 @@ bool kvm_arm_aarch32_supported(void)
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
-- 
2.49.0

