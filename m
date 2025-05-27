Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4619792njc;
        Mon, 26 May 2025 23:26:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVU85aomecpFqBugTgKe9TJB6muxKiKEg7ZuHc9rHnN4fnadrZTmkrIx8ssookNjbUPDGorWOYXyaTXA==@linaro.org
X-Google-Smtp-Source: AGHT+IF9fTBIzS+cup+y04IZPCcd331jYbf9G3lG4sMRzHxsKKCBjb7SN7SUK10Pw/z7tm1HnRqZ
X-Received: by 2002:a05:620a:2546:b0:7cd:45ec:aac6 with SMTP id af79cd13be357-7ceec4b6955mr1653917785a.24.1748327183703;
        Mon, 26 May 2025 23:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748327183; cv=none;
        d=google.com; s=arc-20240605;
        b=ctK7/1ca4vrbi6+9VED1BtKAIxwW0pfAG2yS/OMT7a2lca35n8+eeF84kqddnfQVHX
         KqZhuCTzeUnrG7PfQ9Gc6jic/DY1csWxvu9IO9Qb8pyAOhmqSUo5OZuH+X/HwQQUrnmB
         TQhruyvkHF7iW+k0S5sjLuAkBe2AYn+s2zqFBeUplX2f6Zt7ugyRecMTuPzPW58Mz4zz
         NumgoomtLLV0HxnSaRjZaI9VU0JCNEvo3y9v96GDFaIqTnaDf97LIFKI/fGjHSNX6f3y
         1AVrNovXlkz2jrjVwuig8notS5y8SvVgHhio0+eMUbHr35smHOiupFsfjNdn1rJNAqmq
         YZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=r7AlY5DuvlpGUmOxegRb6Vcqr+33treq3S+6FWzdPX4=;
        fh=+QYT5ic2V0JVqAzRbmJQwTxDwhWoCj38euddbeXj624=;
        b=TbLUC202MlDlygwLB1sON0dJDhydBBxO8icgxH7XZqIABsU8UKom6jwYeBwYJQqW29
         SOV3FBT6SQCgTOUuvXmbVuJ17OB9F9uWjOcGwkD0oesJhzG+9AmCJHnehT881OUMwXBZ
         3TgfYarGntUH5MaaLrbDiPKi9ai3C7H9LjVTaOmjCy2IU/uXGJSFQEOxUX4z4BbT164e
         S1pbE4EMLc0xGRsxcnrxDpGscS0IKOWaiHm2qfuwjATaMwTy79Ym2MtIWxpLqF+IYQuO
         cXIjwFCH34w/Ki9c9E+xFsKQfB8FbJ4YR1QaxarwsuWwP9mXLEmStpaWDWFiexUAgk0j
         hn/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="d/1/srP/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd467cefb1si2772516985a.108.2025.05.26.23.26.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 23:26:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="d/1/srP/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJnlQ-0000Jh-UN; Tue, 27 May 2025 02:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJnlM-0000GL-Ov
 for qemu-arm@nongnu.org; Tue, 27 May 2025 02:26:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJnlI-0005oI-34
 for qemu-arm@nongnu.org; Tue, 27 May 2025 02:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748327167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7AlY5DuvlpGUmOxegRb6Vcqr+33treq3S+6FWzdPX4=;
 b=d/1/srP/FYn40nCYbl7tudSwYEvk8TsoaGDmFJkM7QLDxU10ZexmiuM7Efy8TQo0LzEjRL
 6oWcYyVVOzh+RptH12+ShS5stAZ7VFKY9fLTmM24Xy4MSvL1SpyrkDWECyfHxBLUoSOtCk
 lVHLWKlHe3oA4tC/eorWncfEIwW6puI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-232-0_1k7neONr67eYc7GtsPXw-1; Tue,
 27 May 2025 02:26:03 -0400
X-MC-Unique: 0_1k7neONr67eYc7GtsPXw-1
X-Mimecast-MFC-AGG-ID: 0_1k7neONr67eYc7GtsPXw_1748327162
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 31B391955D83; Tue, 27 May 2025 06:26:02 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D08A0195608D; Tue, 27 May 2025 06:25:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: [PATCH v5 5/5] hw/arm/virt: Allow virt extensions with KVM
Date: Tue, 27 May 2025 08:24:37 +0200
Message-ID: <20250527062534.1186004-6-eric.auger@redhat.com>
In-Reply-To: <20250527062534.1186004-1-eric.auger@redhat.com>
References: <20250527062534.1186004-1-eric.auger@redhat.com>
MIME-Version: 1.0
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
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: nPw0ai83luPg

From: Haibo Xu <haibo.xu@linaro.org>

Up to now virt support on guest has been only supported with TCG.
Now it becomes feasible to use it with KVM acceleration.

Also check only in-kernel GICv3 is used along with KVM EL2.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---
v2 -> v3:
- check gic version/in-kernel implementation when kvm el2 is set (Peter)

v1 -> v2:
- fixed test ordering: virt && ((kvm && !kvm_el2) || hvf) [Richard]
- tweeked the commit title & message
---
 hw/arm/virt.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 675ddeec14..06a57380b8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -795,6 +795,13 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     default:
         g_assert_not_reached();
     }
+
+    if (kvm_enabled() && vms->virt &&
+        (revision != 3 || !kvm_irqchip_in_kernel())) {
+        error_report("KVM EL2 only is supported with in-kernel GICv3");
+        exit(1);
+    }
+
     vms->gic = qdev_new(gictype);
     qdev_prop_set_uint32(vms->gic, "revision", revision);
     qdev_prop_set_uint32(vms->gic, "num-cpu", smp_cpus);
@@ -2208,7 +2215,8 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->virt && (kvm_enabled() || hvf_enabled())) {
+    if (vms->virt &&
+        ((kvm_enabled() && !kvm_arm_el2_supported()) || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
                      current_accel_name());
-- 
2.49.0

