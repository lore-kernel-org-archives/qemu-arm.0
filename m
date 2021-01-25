Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp828390lfd;
        Mon, 25 Jan 2021 13:48:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2DeV83tExrFQmvneWHDTibtEPWlvD4+qWuhbiZiptn7HPQOYUlLhSORI5c+1i0l572saG
X-Received: by 2002:a25:8882:: with SMTP id d2mr3725151ybl.7.1611611286419;
        Mon, 25 Jan 2021 13:48:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611611286; cv=none;
        d=google.com; s=arc-20160816;
        b=X9aIKkdrdlWLVyhQSEF+VnWRmGQnyWm8qLoBL8GODRMf567pYdOstnX/tqk5+H55Mk
         fDem//+6/5xPDZy1/qoXdEwtSrepLw8qpdedqRIluEVkQYkYyvIWSqxwxKYL9F1qShql
         3NjR1FxCfjBTd5vI/+rfnfxTB0Ydc3mlaOqE5GnGNXcKc859GgxrKifereirjfMRxqws
         UixUGc+zyZkafh8Nm1+P+ayVoHI+PZp8OpbFAVgO/4MLtYG2/gEvdaHfsFWsvOQkU7mb
         vFCXGyoGxl4LhkKtfqh4OOBjzQAnCAgWctoR1EnHr/woUemd5nDYLf/EFJUJTr6QpmPv
         3UIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:to;
        bh=w1V4mj1z/Kz8Bnn6mnDCrIbxMHe+gydXyRmOlgtQvYw=;
        b=NJyFmadIEtRXZaOlLws0M9T7P5VoE7s+BWmcHyMPJvmJOBBPgVlAo2rpUbnglEIyoj
         8OU7oHE5azjj5REuvretbuiygISeVZbw0db9vDy0tNORwMFfZUi2h9msSwHhdstkFs67
         BD9iUmwC7QNDxLPB9+PzDxQa86uDd1LoXtH/s/GJ8fOlVLxbk7meEjHsj4ynOesUpod7
         tgnxRJpGV1m4QyQBM0cxj39GnuHvao4wVw8gzJTrIHt/+H4dgL65CG0ZuqoIzz2Q55GM
         JGnPv5xWV4iDOFFxdqqM1l2k1Af6q96ckSzVdOGeIqR/H4CfbrhmHw6XPUcKYl12W39o
         Dsrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si19616936ybb.191.2021.01.25.13.48.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 13:48:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l49iP-0008N7-Pv
	for alex.bennee@linaro.org; Mon, 25 Jan 2021 16:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muellerd@devvm2477.prn0.facebook.com>)
 id 1l49Tp-0004dO-BB
 for qemu-arm@nongnu.org; Mon, 25 Jan 2021 16:33:01 -0500
Received: from 66-220-144-178.mail-mxout.facebook.com ([66.220.144.178]:37861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <muellerd@devvm2477.prn0.facebook.com>)
 id 1l49Tn-0002zB-S4
 for qemu-arm@nongnu.org; Mon, 25 Jan 2021 16:33:01 -0500
Received: by devvm2477.prn0.facebook.com (Postfix, from userid 221162)
 id C517B43DB0C7; Mon, 25 Jan 2021 13:08:42 -0800 (PST)
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Correctly initialize MDCR_EL2.HPMN
Date: Mon, 25 Jan 2021 13:08:17 -0800
Message-Id: <20210125210817.2564212-1-muellerd@fb.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=66.220.144.178;
 envelope-from=muellerd@devvm2477.prn0.facebook.com;
 helo=66-220-144-178.mail-mxout.facebook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NO_DNS_FOR_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_DYNAMIC=0.982, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001, TVD_RCVD_IP=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 25 Jan 2021 16:47:12 -0500
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
Cc: =?UTF-8?q?Daniel=20M=C3=BCller?= <muellerd@fb.com>,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?q?Daniel=20M=C3=BCller?= <muellerd@fb.com>
From: muellerd--- via <qemu-arm@nongnu.org>
X-TUID: DowfYC/U8VDf

When working with performance monitoring counters, we look at
MDCR_EL2.HPMN as part of the check whether a counter is enabled. This
check fails, because MDCR_EL2.HPMN is reset to 0, meaning that no
counters are "enabled" for < EL2.
That's in violation of the Arm specification, which states that

> On a Warm reset, this field [MDCR_EL2.HPMN] resets to the value in
> PMCR_EL0.N

That's also what a comment in the code acknowledges, but the necessary
adjustment seems to have been forgotten when support for more counters
was added.
This change fixes the issue by setting the reset value to PMCR.N, which
is four.

Signed-off-by: Daniel M=C3=BCller <muellerd@fb.com>
---
 target/arm/helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d2ead3fcbd..195db4d378 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5705,13 +5705,11 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {
       .writefn =3D gt_hyp_ctl_write, .raw_writefn =3D raw_write },
 #endif
     /* The only field of MDCR_EL2 that has a defined architectural reset=
 value
-     * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N; b=
ut we
-     * don't implement any PMU event counters, so using zero as a reset
-     * value for MDCR_EL2 is okay
+     * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
      */
     { .name =3D "MDCR_EL2", .state =3D ARM_CP_STATE_BOTH,
       .opc0 =3D 3, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 1,
-      .access =3D PL2_RW, .resetvalue =3D 0,
+      .access =3D PL2_RW, .resetvalue =3D 4,
       .fieldoffset =3D offsetof(CPUARMState, cp15.mdcr_el2), },
     { .name =3D "HPFAR", .state =3D ARM_CP_STATE_AA32,
       .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 0, .opc2 =3D 4,
--=20
2.24.1

