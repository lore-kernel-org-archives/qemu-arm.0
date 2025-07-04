Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1248678dyc;
        Fri, 4 Jul 2025 07:20:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+OSJG3eYUS4f2zAMQ4pcQMOavK9MGs2v02Vle5eqoTvUiRuQR57Hj3GY0Y252Tjb6lV/MM0TmLI2AcA==@linaro.org
X-Google-Smtp-Source: AGHT+IE+DMgcuM49xy5t/iFpJ0LAcLCbd8MhIpQrbxbjmfsIo/dr1o4E7Vlcpm64eqacYqOK6sF0
X-Received: by 2002:a05:620a:2a07:b0:7d4:1e32:5421 with SMTP id af79cd13be357-7d5dcc8506fmr513046485a.5.1751638848221;
        Fri, 04 Jul 2025 07:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751638848; cv=none;
        d=google.com; s=arc-20240605;
        b=JPBv6iyKmS6iMuSePGVI/mRn29827FHj77YBrKcROTsa6tc9l2l33dEFNBZ4kd1ntp
         o1zNys2yPCbRq5mmNqSax4tML63yk6fCQmOUlOroJPRG6sYF9cdJWvM71IhlU34WkFk1
         4mnPixNqVh3fGg4F0/jmbpor8CnUMVECxb3yIMvqjm9XmwQS5R2C+EuAuFJxCyoirz6o
         H7rOU8q0Txpofxl3pyZoSwpLOoP0Oid3KH3Soxy+2k88EOKe5lnuWvPHsa6lfifuVw0s
         I3VY4qfl8Oh2RxMxXJ00Lq/TxnkGeeUnyhETkfTg/RHffi9aNeenuQcgayFSpZdmsS0y
         BJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=n2kRUzYPTC/n4SfRCWO7fDcrjC69vo57xK5Uhch7b8Y=;
        fh=47nbNcdFoHdx4vFkcZle5phKNunXZjbcCr/4dP29blM=;
        b=aP5y0JZG9SRNamVjOMijq101TtnBaszNBEMY5j6HO6db57+abAM7gVNIx/x8uKFNn4
         Wj6QcWfHSvOxHRScLr+Sy+Tk3Ct3m3QxcubBS/816Ruhlm4IBHtRzj8uaiTIEr/6/+Ey
         HVJ9SI5hDeEv2G2XGpL9e9m1N3HSnlMQIKp8kDdSwMdK9d1g5kdJTngFGSIyl8u6SJd1
         t9ZYeZOD+DHdXcWZUMFEPKTn6Pm8XWHnl9HdRBPqjc/lA/vUqFFUKJ9m2aBhOrQI1ZD1
         m2BMn5m6HedgQ8Mi7I6NpqPD8KwC8s1LN8c4gqu9SHiITY5aWtuGMLFs0gpdSuHeUa0W
         DyhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Re6Gjp1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbe92d39si241183885a.163.2025.07.04.07.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:20:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Re6Gjp1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhGo-0003ZK-6x; Fri, 04 Jul 2025 10:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1uXhGU-0003Sq-Eg
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:19:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1uXhGS-0003LH-B3
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751638783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2kRUzYPTC/n4SfRCWO7fDcrjC69vo57xK5Uhch7b8Y=;
 b=Re6Gjp1YIVxs2oWjwk8Am+xS8jzOpfFWdh60yL71yAnVl7HVktGGOgWOU1fYpk4wN4wjqa
 G99T2ylszv1ZC6CoUU9VMjjO9YAMIKH7GCTB3NEBsz5pCRZ/Lqr4mBdk2nDX0iD5+evQeI
 yQYJcoZdaiinXpxcth8l1xkOwhlPQwo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-gftMFrXFO-KFogJVyhj6xQ-1; Fri,
 04 Jul 2025 10:19:40 -0400
X-MC-Unique: gftMFrXFO-KFogJVyhj6xQ-1
X-Mimecast-MFC-AGG-ID: gftMFrXFO-KFogJVyhj6xQ_1751638779
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 645461800268; Fri,  4 Jul 2025 14:19:39 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.44.34.37])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1786C195608F; Fri,  4 Jul 2025 14:19:36 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Sebastian Ott <sebott@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 2/5] arm/cpu: store id_aa64afr{0,1} into the idregs array
Date: Fri,  4 Jul 2025 16:19:24 +0200
Message-ID: <20250704141927.38963-3-cohuck@redhat.com>
In-Reply-To: <20250704141927.38963-1-cohuck@redhat.com>
References: <20250704141927.38963-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.218, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: V7yy31CEDusx

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-sysregs.h.inc |  2 ++
 target/arm/cpu.h             |  2 --
 target/arm/helper.c          |  4 ++--
 target/arm/tcg/cpu64.c       | 16 ++++++++--------
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
index b96a35880430..44c877245eea 100644
--- a/target/arm/cpu-sysregs.h.inc
+++ b/target/arm/cpu-sysregs.h.inc
@@ -4,6 +4,8 @@ DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
 DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
 DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
 DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
+DEF(ID_AA64AFR0_EL1, 3, 0, 0, 5, 4)
+DEF(ID_AA64AFR1_EL1, 3, 0, 0, 5, 5)
 DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
 DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
 DEF(ID_AA64ISAR2_EL1, 3, 0, 0, 6, 2)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ca8ad1cc27a8..793c157d873e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1066,8 +1066,6 @@ struct ArchCPU {
     uint32_t reset_sctlr;
     uint64_t pmceid0;
     uint64_t pmceid1;
-    uint64_t id_aa64afr0;
-    uint64_t id_aa64afr1;
     uint64_t clidr;
     uint64_t mp_affinity; /* MP ID without feature bits */
     /* The elements of this array are the CCSIDR values for each cache,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2f57ab4d87da..6acbb2bcd9bd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7983,12 +7983,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 4,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->id_aa64afr0 },
+              .resetvalue = GET_IDREG(isar, ID_AA64AFR0) },
             { .name = "ID_AA64AFR1_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->id_aa64afr1 },
+              .resetvalue = GET_IDREG(isar, ID_AA64AFR1) },
             { .name = "ID_AA64AFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 3f4fb003f440..00e12ed44ae8 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -428,8 +428,8 @@ static void aarch64_a64fx_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000000);
     SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408),
     SET_IDREG(isar, ID_AA64DFR1, 0x0000000000000000),
-    cpu->id_aa64afr0 = 0x0000000000000000;
-    cpu->id_aa64afr1 = 0x0000000000000000;
+    SET_IDREG(isar, ID_AA64AFR0, 0x0000000000000000);
+    SET_IDREG(isar, ID_AA64AFR1, 0x0000000000000000);
     SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000001122);
     SET_IDREG(isar, ID_AA64MMFR1, 0x0000000011212100);
     SET_IDREG(isar, ID_AA64MMFR2, 0x0000000000001011);
@@ -676,8 +676,8 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     cpu->clidr = 0x82000023;
     cpu->ctr = 0xb444c004; /* With DIC and IDC set */
     cpu->dcz_blocksize = 4;
-    cpu->id_aa64afr0 = 0x00000000;
-    cpu->id_aa64afr1 = 0x00000000;
+    SET_IDREG(isar, ID_AA64AFR0, 0x00000000);
+    SET_IDREG(isar, ID_AA64AFR1, 0x00000000);
     SET_IDREG(isar, ID_AA64DFR0, 0x000001f210305519ull),
     SET_IDREG(isar, ID_AA64DFR1, 0x00000000),
     SET_IDREG(isar, ID_AA64ISAR0, 0x1011111110212120ull); /* with FEAT_RNG */
@@ -927,8 +927,8 @@ static void aarch64_a710_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
     SET_IDREG(isar, ID_AA64DFR0, 0x000011f010305619ull);
     SET_IDREG(isar, ID_AA64DFR1, 0);
-    cpu->id_aa64afr0       = 0;
-    cpu->id_aa64afr1       = 0;
+    SET_IDREG(isar, ID_AA64AFR0, 0);
+    SET_IDREG(isar, ID_AA64AFR1, 0);
     SET_IDREG(isar, ID_AA64ISAR0, 0x0221111110212120ull); /* with Crypto */
     SET_IDREG(isar, ID_AA64ISAR1, 0x0010111101211052ull);
     SET_IDREG(isar, ID_AA64MMFR0, 0x0000022200101122ull);
@@ -1029,8 +1029,8 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
     SET_IDREG(isar, ID_AA64DFR0, 0x000011f210305619ull);
     SET_IDREG(isar, ID_AA64DFR1, 0);
-    cpu->id_aa64afr0       = 0;
-    cpu->id_aa64afr1       = 0;
+    SET_IDREG(isar, ID_AA64AFR0, 0);
+    SET_IDREG(isar, ID_AA64AFR1, 0);
     SET_IDREG(isar, ID_AA64ISAR0, 0x1221111110212120ull); /* with Crypto and FEAT_RNG */
     SET_IDREG(isar, ID_AA64ISAR1, 0x0011111101211052ull);
     SET_IDREG(isar, ID_AA64MMFR0, 0x0000022200101125ull);
-- 
2.50.0

