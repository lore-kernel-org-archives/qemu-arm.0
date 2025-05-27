Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4619951njc;
        Mon, 26 May 2025 23:26:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUzmKS0g23zg8gBq+Ee+BdV6P8mPbMyNUJM+nIT9fxXvuadEOa/YM/wRo7yqDziEMqI8QP1EnMfd0a8gw==@linaro.org
X-Google-Smtp-Source: AGHT+IFx5J0x+tnvdDb5stvt1Y6+Je1P+dRs0hc1LhbXmAhoeCbOfChJTilhQ8UYKr+49lQMvamE
X-Received: by 2002:a05:620a:430e:b0:7c9:2612:32db with SMTP id af79cd13be357-7ceecbf94d0mr1935019985a.49.1748327218403;
        Mon, 26 May 2025 23:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748327218; cv=none;
        d=google.com; s=arc-20240605;
        b=XqDtnVZ5/15HKSD5JqgtaKFqP5k5b5Uc/w7sVXbd7yIusWHZFjPtzZs690eFlW8Hu8
         dd5XF+1ofFmIHG2Zl34cRhKq1qkpOY62HInAYHfMrlBTssjE13pYCeW4HSPAYiTtQTst
         x3nAhkzW7K14MKucGOzBlAJAyV4HD0hnZ4GZhKxT6JlR/Xpe/QQIdD1xcY1heDM0HlIk
         GnO/kLwyZypWFqJnVmddOyGnD27qN5USu0oH1oeww7T2Y4j9+apBW/36XRnr0zqoZJZT
         u/BXkV5dzWRj79Cx/PGtgKDXB+OGMjQTYH8tNNeBWnQa7RA49BM/N6J7aYjmM4/oJUpS
         w/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OwXRUYGEcqpoZmr/FSWnrZk6+qLGgRDaOJC3jaAb3mc=;
        fh=+QYT5ic2V0JVqAzRbmJQwTxDwhWoCj38euddbeXj624=;
        b=eQSwG/KkOSXQbbrT3nLT+XXttT3W3CGB7pNXALPn6tQdG2rq8sDWmit2JfhctkR2Go
         XFrzeIt/vVoC1lI2xnOm6vE6njMJuGQaKvpfEfvrDsJb3J+5sBCQKY2IIRv5DhmOhZb/
         vzeRbSuy0PlFc89qeS2GL6+TEAADwQ5rKBrkmndfk7CPeUSCvXtsc+/7W9M+rL/popaW
         r0LzDsH2fmX+P9EHwyZNbVWqi1A/eWX4O7ZlBaB+hd9WvlJE5gnl2A2KZNFIf50af+Rx
         kW7czZHpPAbukqT6mOsLuvudfVqFGqs6S9tbIO7Xlw1YHsaJsKCn/zGIDmqKhkav7Dwc
         RZJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S0y011x0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468f31ebsi2745281985a.629.2025.05.26.23.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 23:26:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S0y011x0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uJnlS-0000K9-BA; Tue, 27 May 2025 02:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJnlH-00009k-4g
 for qemu-devel@nongnu.org; Tue, 27 May 2025 02:26:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJnlA-0005nA-G7
 for qemu-devel@nongnu.org; Tue, 27 May 2025 02:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748327159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwXRUYGEcqpoZmr/FSWnrZk6+qLGgRDaOJC3jaAb3mc=;
 b=S0y011x006Rw5uu3NwEQQdEMsZyW/N3pWg1eZaQuutr6gg0m71eNFm+2FXu2W3JSCwROfn
 646Y+IULobsVxyxcbdn1H2Bhp/0ErA135lVJjMtmB4B6B4vpsIWta49x3HbeSYNy62T66f
 DgfBkc/ssWDbfzJlja0N7VVbwvLCFHM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-662-8fhoadfnPtiVTa6-nD9VJg-1; Tue,
 27 May 2025 02:25:55 -0400
X-MC-Unique: 8fhoadfnPtiVTa6-nD9VJg-1
X-Mimecast-MFC-AGG-ID: 8fhoadfnPtiVTa6-nD9VJg_1748327154
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 615D919560B5; Tue, 27 May 2025 06:25:54 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 022C5195608F; Tue, 27 May 2025 06:25:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: [PATCH v5 3/5] target/arm/kvm: Add helper to detect EL2 when using KVM
Date: Tue, 27 May 2025 08:24:35 +0200
Message-ID: <20250527062534.1186004-4-eric.auger@redhat.com>
In-Reply-To: <20250527062534.1186004-1-eric.auger@redhat.com>
References: <20250527062534.1186004-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: igP3JsGGXtqm

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
index c4178d1327..445cf9a0a3 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -190,6 +190,13 @@ bool kvm_arm_sve_supported(void);
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
index a2791aa866..ad6c80dd49 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1769,6 +1769,11 @@ bool kvm_arm_aarch32_supported(void)
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

