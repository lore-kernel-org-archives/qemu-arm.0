Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1517072lfc;
        Wed, 10 Feb 2021 10:05:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzq3eh8beqptZFo2lo0z+TUChsMwSOCHYKyzGPguByUYuc2X0s7AijyrW0UBNsCcWrP3oxc
X-Received: by 2002:a25:70c5:: with SMTP id l188mr5997088ybc.45.1612980310994;
        Wed, 10 Feb 2021 10:05:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612980310; cv=none;
        d=google.com; s=arc-20160816;
        b=c+h/OX2naeokDmb+w2Kgh0rowi855pFwflCz1yZJEtNVekZqLEvFC5MZ3o5iWcoj5c
         INm8WondQ7o+NlxbZtW+rSOH3wwrQKmMK4T5T3f1QWgvpDFUT1eKFhMRXtzOxfCVZrCR
         OLt+wvFSg7zaCgJkDme3a8PW6Z636t3Y6A7BX9UWK/UTS126u7r1uxIDFFISEpeeaPwr
         WYDnKv+w2Y2tUiVNLwfLoQMw2Hbc/TYAGLueSdxxr3NLAT8SJTOeb7ToZPUu1gum7zOg
         okgG50MRZMMXI7k+ayD1bulsvgXBEuNYQNwg6509UDBLtH/YlVgGpjhjDXffawPBXbk+
         0BHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=eNjsFYwO+tcwntcJ4FGeCgVPTtZNdXtn2p32ocgpeHY=;
        b=MpR5hgNb/AxuEyPw+sVtmhXlTvJnXVXkX6jZAc4SM+uM0ocaFald/cPE0yQqOOuT11
         xJevQXMNMtdequXvTq2rbsyYM17K0gHwhvEZaiHl500ZAnYfugo/OTNEqmRNChb3kZ+8
         4Un3DbfQB/dVc+XSivI4z1FaSIvyJi9sgYVK2FOFB+eyRQGzdIFhS0YD3HfQpAPIVbMl
         wZK0U641Ykv1jDIyOtUdYa+p2LI5+wm1w4FCFZDbaCRsY76vOfQFb0p9aBvlRJ8NH864
         Z50/exLw/ygVdJQE5Z1I5Jr1roEQij3OQbZtv3TwRUgxM6YcUH5lGtZxbDy9/G2annfZ
         61ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si2528843ybj.361.2021.02.10.10.05.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 10:05:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:53200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9trS-0004r9-DN
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 13:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muellerd@devvm1718.prn0.facebook.com>)
 id 1l9tkc-0000cR-3f
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:58:06 -0500
Received: from 66-220-144-178.mail-mxout.facebook.com ([66.220.144.178]:35447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <muellerd@devvm1718.prn0.facebook.com>)
 id 1l9tka-0004BP-IN
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:58:05 -0500
Received: by devvm1718.prn0.facebook.com (Postfix, from userid 221162)
 id 46DF4A6F731; Wed, 10 Feb 2021 09:41:27 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20M=C3=BCller?= <muellerd@fb.com>
Subject: [PATCH v2] target/arm: Correctly initialize MDCR_EL2.HPMN
Date: Wed, 10 Feb 2021 09:41:22 -0800
Message-Id: <20210210174122.410690-1-muellerd@fb.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=66.220.144.178;
 envelope-from=muellerd@devvm1718.prn0.facebook.com;
 helo=66-220-144-178.mail-mxout.facebook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NO_DNS_FOR_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_DYNAMIC=0.982, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001, TVD_RCVD_IP=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?q?Daniel=20M=C3=BCller?= <muellerd@fb.com>
From:  =?UTF-8?q?Daniel=20M=C3=BCller?= via <qemu-devel@nongnu.org>
X-TUID: jC4PK0oz3DGH

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
---
 target/arm/helper.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 38cd35c049..4a5d512b51 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -37,6 +37,7 @@
 #endif
=20
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable =
*/
+#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
=20
 #ifndef CONFIG_USER_ONLY
=20
@@ -5662,13 +5663,11 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {
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
+      .access =3D PL2_RW, .resetvalue =3D PMCR_NUM_COUNTERS,
       .fieldoffset =3D offsetof(CPUARMState, cp15.mdcr_el2), },
     { .name =3D "HPFAR", .state =3D ARM_CP_STATE_AA32,
       .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 0, .opc2 =3D 4,
@@ -6566,7 +6565,7 @@ static void define_pmu_regs(ARMCPU *cpu)
      * field as main ID register, and we implement four counters in
      * addition to the cycle count register.
      */
-    unsigned int i, pmcrn =3D 4;
+    unsigned int i, pmcrn =3D PMCR_NUM_COUNTERS;
     ARMCPRegInfo pmcr =3D {
         .name =3D "PMCR", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =3D=
 0, .opc2 =3D 0,
         .access =3D PL0_RW,
--=20
2.27.0

