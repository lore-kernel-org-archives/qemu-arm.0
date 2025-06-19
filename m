Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp313727njc;
        Thu, 19 Jun 2025 07:52:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWysIxBVdokZVHcAH7Ta0l5X0K/VmT3W4iDAI33FCN/xkjdyaO0NP40hh2JSDB8Fg6fkJr5iiYHqkILCA==@linaro.org
X-Google-Smtp-Source: AGHT+IG6+cACBkkVH5H4zsqkLsbv+9xfi/rUtoqCFR25Go9L4Mk6l3E9zeY/yf5o/PCYSn3e/Tou
X-Received: by 2002:a05:622a:28c:b0:4a3:800d:2a9a with SMTP id d75a77b69052e-4a73c575059mr304400781cf.6.1750344747027;
        Thu, 19 Jun 2025 07:52:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750344747; cv=none;
        d=google.com; s=arc-20240605;
        b=WQXueh+xJdRLvkx6rnBYWDgsZ1AabstJK6+LYTBq/rPUu60zbd4cAqFC+4/mx+22gM
         Eo6osA7IxCsBJ35u590MU2MJrRKT7XLQ9Wxn1jAq1piWNFDai9bzW2qyAO4q5US1UmOm
         fpS8LBFfnIP/VPnPIB4ZkXOUiyRoVIps1wpGpoCETx6debQM092hxlpIkVl/7V3pJtsV
         Bng5Nux0c1Cs1sC3HDdETWS3QKFqFEbApHhBiuSE5ETPZwbA3T00yNOnGFuo6VhF2nv6
         mAOxPyjNmzVZAIOF3ETTvvLkz36uUavxioQOz+b8sBE3Yxdxo77xhEEfW0kFoXJscZDe
         kD5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qBJvlCS+bjfhWfa+jzKmV6Al9Zocv6O1Di26gkSB0hw=;
        fh=UVrGBnfE9R8/5nTz0HPCluylUu4vXq1b0MPFtmDhPnc=;
        b=HyHkdMDMdP44ev3lUHnZwX+K7gkM189AkUhq4scoZKbfvefLNn7YERiSbc4YClNTH5
         bYHWXv+xY2WmdO/pax1AxOr/w6ZKtz3pw1w7LdDM2RlvYH3jWgMGKkhh47hOdEOBHxLY
         ddg19VQLLdBf+oVpO2QJpNtFjAyCOYeFL3UPuFX6ePC/jed3dRSRYt0w61pWjfObz865
         jEx7n+oc/oIOZuuwDq82wt1unxZdRGZwkF0ClCQraYBXT+jo5ZoEYm3lIp/fYcX2pXme
         AK/rcPwWnbmGZSGJlNsJNyIfCZTBf3gc6BmsyvXn8/54jNT+jlIvgs6Do2WNBDN77kuE
         mxfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=grrVu0KO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7785ebd80si151441cf.397.2025.06.19.07.52.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jun 2025 07:52:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=grrVu0KO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uSGcB-0000CG-13; Thu, 19 Jun 2025 10:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uSGc9-0000Bg-Bf
 for qemu-arm@nongnu.org; Thu, 19 Jun 2025 10:51:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uSGc0-0006SN-3Z
 for qemu-arm@nongnu.org; Thu, 19 Jun 2025 10:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750344679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qBJvlCS+bjfhWfa+jzKmV6Al9Zocv6O1Di26gkSB0hw=;
 b=grrVu0KO4ODgsfwm0urSnWghvy86j3wCd5jjFAoPYugQMVFoRb74Fis7HvuaHZOcq0wnry
 B3piewJY+t3gWOefhvUW01eCmzb6Fis7ycl0FWIuv5crsVNI4O3av5CdLd5ZN1kd7xjp3O
 IFFAdHum7t5dhxLrBQ53G1SgzMdpfpE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-dK92cJO4OJWBZCAABF_DjA-1; Thu,
 19 Jun 2025 10:51:14 -0400
X-MC-Unique: dK92cJO4OJWBZCAABF_DjA-1
X-Mimecast-MFC-AGG-ID: dK92cJO4OJWBZCAABF_DjA_1750344672
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4E2FC195608A; Thu, 19 Jun 2025 14:51:12 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7C35F19560A3; Thu, 19 Jun 2025 14:51:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Cc: hi@alyssa.is
Subject: [PATCH v6 3/5] target/arm/kvm: Add helper to detect EL2 when using KVM
Date: Thu, 19 Jun 2025 16:50:01 +0200
Message-ID: <20250619145047.1669471-4-eric.auger@redhat.com>
In-Reply-To: <20250619145047.1669471-1-eric.auger@redhat.com>
References: <20250619145047.1669471-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.897,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TfyawkeZeUoX

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
index 74fda8b809..54e50796b4 100644
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

