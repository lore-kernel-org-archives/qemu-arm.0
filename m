Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp225915lfg;
        Wed, 17 Mar 2021 02:29:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyt64842/VbaSuRgVVV+c04jGBxhy+m0ATjDZN6sEgJxdBzYL1jIpvbIQjABfBVEfEKNefM
X-Received: by 2002:a25:3bc2:: with SMTP id i185mr3284146yba.87.1615973344776;
        Wed, 17 Mar 2021 02:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615973344; cv=none;
        d=google.com; s=arc-20160816;
        b=Pm9Dg1MKp88pg+zaX10r5iW1i6mvUprbbOw/msJDkcZZYRilCCO/r5i8k93bz5+SCV
         6aOnB3EmFr9vpmnKSXRf9SxL+lgS9s3i84NKRq523du0zRC+Os+oGkyueRZ/z6lMhzM5
         awFmU60b6UohxPICrQsfAHEjuWSpi9vqu4h4uODZDjMMV89JbQVznmgfSx9xUsXkuMEu
         PijyK/h8iT3ufH3zsuPD6XKqCDEJ1h/tUb21yrmtCNoIok3GejIsx4YhsXSCYwDpsKbR
         fM0JsX2naeeOA9ay62sI41rqAFYOhzcvFYJRe/IU33mkbycxFXGA7NPh2hS/LGKnUW4L
         vAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Q+3SQ1h/ZiK+NQG+zSbCG676wEEMohnKSXfyBletwdI=;
        b=Ly2UxTF7ryIH5zGB21AOHWY1+svgr0PGnHn4CuLhW2s2n89Hs3OuzskJQ6T9mEI9zC
         DhpDWWiEjETsYjFgq9gAgkT/6eujUT1DHTmp4v+R6o6LftRpUk4weX/3qzZyzr7H3l3i
         oNr8O88nso+sPUoA3qX1gXVQZznVQSB2/WoO9Y/bDSxPGlBDocG+8SUOXG01yggpTvjT
         x39MkL7QyNcQw4pPRLVwEBmLhxtriL5gkgig9hOvdLpWm99MBR5TCZo4PQmC1as578gc
         VyTbFkJ7ZTxcYdq0BeYs8rNHpZH0aALn87CcOYYWZlzsNj8dREbDUqDuVRygvMRJWfke
         6uFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mo3EXAXS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si20877480ybp.89.2021.03.17.02.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 02:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mo3EXAXS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMSUC-0001p8-2n
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 05:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSTw-0001lo-Fa
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 05:28:48 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSTu-00013c-7g
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 05:28:48 -0400
Received: by mail-pf1-x436.google.com with SMTP id c204so697232pfc.4
 for <qemu-arm@nongnu.org>; Wed, 17 Mar 2021 02:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q+3SQ1h/ZiK+NQG+zSbCG676wEEMohnKSXfyBletwdI=;
 b=Mo3EXAXS9ISjyYdntIfJ2GRk1WZJZkm0kOxi4kC0l2UQz6SCoxLUHssI5zKspwxoss
 OWP9VHNroyIMuZrCYIlIAoS9wvmEBskBf2xW7vzn7QMVfUU4ZmbZb4YbEG3YseFjp+tf
 CfB2ZiqHOdNGj9Dv+3/NI9ibLoBxfBi3ywlQNo+2V4iGpI/VEnZg9GfHsghhKhTViWDU
 kb4G6BSyhywEttloJN5L3R4bmfkmwMy7GD8uZ0QnGjk95lytohdRBA1rC25OHV9XpFTs
 E+0bDW9M+85TFG0sDr5Dag1pbQyZewgnXPHgrNe+9GlKNL42NLcgbrK/dL4Tu2x0ySNW
 AZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q+3SQ1h/ZiK+NQG+zSbCG676wEEMohnKSXfyBletwdI=;
 b=luYp+2kCrLYwK24+S3aotufGTCfCf0LFGhegvOi1iwtuKjwKChO1B/eiK0xt4dlirR
 PzHnS3VJn2ME32O1rCxQiT2JWxJ53W/VLKdShk7QRhMgW82Nn6vdxKotF8fQRoQzRREE
 OxgiG6Lz2EXLTkArBKv1sseUpxH9qOiXlt8rDXC25JsnQzWA3R0b7tVgckimRbPslL2/
 82iaZH9F8O3D5ceGKb92W4E7p/V68057QbVNiOQ8tW8Jnpu1cBXxMxMZ45zizq7xzawa
 x/lHp75vfsJiTjl7dAS2gbX/2up/q5Q8tDaVoGfrshLzP+t3NoDDDX6aPw2/gsisKbd+
 gdBg==
X-Gm-Message-State: AOAM531KiI8k//f1RFLD79499ExdAnEEuDy08Wj5dQM5tzmz9//IwWcE
 SkEqYVNSMyjTBkZTmHtoi1X5n3afkGX6P4s=
X-Received: by 2002:a62:e90c:0:b029:203:90f:6f34 with SMTP id
 j12-20020a62e90c0000b0290203090f6f34mr3401533pfh.29.1615973324687; 
 Wed, 17 Mar 2021 02:28:44 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id r30sm18630163pgu.86.2021.03.17.02.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:28:40 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: dgilbert@redhat.com, quintela@redhat.com, drjones@redhat.com,
 richard.henderson@linaro.org
Subject: [RFC PATCH v2 1/5] Update Linux headers with new MTE support
Date: Wed, 17 Mar 2021 09:28:20 +0000
Message-Id: <a3cdacb0fb46d8e1dd7215800b9abf5b14fa4b86.1615972140.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615972140.git.haibo.xu@linaro.org>
References: <cover.1615972140.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=haibo.xu@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SSG3oAYo9/Kj

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 linux-headers/linux/kvm.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 020b62a619..941743b3a7 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1056,6 +1056,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
 #define KVM_CAP_SYS_HYPERV_CPUID 191
 #define KVM_CAP_DIRTY_LOG_RING 192
+#define KVM_CAP_ARM_MTE 195
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1241,6 +1242,20 @@ struct kvm_arm_device_addr {
 	__u64 addr;
 };
 
+#define KVM_ARM_TAGS_TO_GUEST           0
+#define KVM_ARM_TAGS_FROM_GUEST         1
+
+struct kvm_arm_copy_mte_tags {
+	__u64 guest_ipa;
+	__u64 length;
+	union {
+		void *addr;
+		__u64 padding;
+	};
+	__u64 flags;
+	__u64 reserved[2];
+};
+
 /*
  * Device control API, available with KVM_CAP_DEVICE_CTRL
  */
@@ -1396,6 +1411,7 @@ struct kvm_s390_ucas_mapping {
 /* Available with KVM_CAP_PMU_EVENT_FILTER */
 #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_event_filter)
 #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
+#define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
 
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
-- 
2.17.1

