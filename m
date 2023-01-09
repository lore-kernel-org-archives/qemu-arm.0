Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2698160ejc;
        Tue, 17 Jan 2023 11:44:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvqTak6bvINUxtp/fcFFwTIksycysoGiehoOnZw4PtFG7sHebEwShh8xMgu1HV6BRllhTRe
X-Received: by 2002:ac8:4c84:0:b0:3b4:d5be:a2e0 with SMTP id j4-20020ac84c84000000b003b4d5bea2e0mr4628422qtv.20.1673984656304;
        Tue, 17 Jan 2023 11:44:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673984656; cv=none;
        d=google.com; s=arc-20160816;
        b=P+36lTOHf1Ss6Lik4DcdghUU1glL+3UgK+VTbmMuc77PLWb7vBvgl3btLP04gNTVcK
         c+EqOZAJGJe1n63nu/a7LNZwMTiIndR4Up75v4PPlZJVoZEevG/1jzdl4I7mwhyWdhPE
         o8h5oiKfbypnznFTdLi8KMPB8LaF+oKgtL+Xeypl0UbO2RLjRzOPlsQRDqQpiIC1T4UN
         qQDEp8VkNiQeLN50OiSswPB7RvThyI3BP8pIsSeKrK+N7OzhfoqBh/bAf2P1Wkegaamf
         deJq0FoobrrkVS3iDtDoywBoN6b8dDwAbbC6qPJ0QOmxI8DRbdZUYjrxicAfUwdwrHXC
         RV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=yAERrynEgTDx/AK3BhXYC8sDN2ux49nEJrgP+B3bBMQ=;
        b=VNiRJqKZjMs8NKQDBnM7U5DHExjw8qsegxKWcaWcHDMEieRGFlIVB0LcuNEnlxmhc3
         YwT3e9L4iseVirt0IKzk5pYtTgnkgbln9/1pH6cco4yAVOwU78d2MYuyqxF3jboYcJYi
         Ne8odgJ2YQsHjNoYC6c4TE8bmmtP3zV0SEJ1kIiArry8MKgYj6Bx+yAOgMpoqqh+g/Ko
         OGEHFe8t3+t6/g1F0uobR6bMn5dwSq/1vWZZYzNMVir8/V3VVhqC65lrYcOSB4igcpPL
         RjhShFKPDDLgn/xQhgu1Egq4go7vawuajiqjPWiZ8TFy0E+QoyzFYB5KRIyZMC5Fy2CS
         0XwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k18-20020ac84752000000b003930a3a5869si18665789qtp.324.2023.01.17.11.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 11:44:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHrsP-0000C7-Nh; Tue, 17 Jan 2023 14:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pHrsP-0000Bg-1b; Tue, 17 Jan 2023 14:44:09 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pHrsN-0001HF-Fe; Tue, 17 Jan 2023 14:44:08 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 60BA511EF96;
 Tue, 17 Jan 2023 19:44:06 +0000 (UTC)
From: ~dreiss-meta <dreiss-meta@git.sr.ht>
Date: Mon, 09 Jan 2023 15:05:19 -0800
Subject: [PATCH qemu v2 1/3] target/arm: Unify checking for M Main Extension
 in MRS/MSR
Message-ID: <167398464577.10345.18365355650640365165-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167398464577.10345.18365355650640365165-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~dreiss-meta <dreiss@meta.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NLkUGjCb/4Oy

From: David Reiss <dreiss@meta.com>

BASEPRI, FAULTMASK, and their _NS equivalents only exist on devices with
the Main Extension.  However, the MRS instruction did not check this,
and the MSR instruction handled it inconsistently (warning BASEPRI, but
silently ignoring writes to BASEPRI_NS).  Unify this behavior and always
warn when reading or writing any of these registers if the extension is
not present.

Signed-off-by: David Reiss <dreiss@meta.com>
---
 target/arm/m_helper.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 033a4d9261..d87b9ecd12 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2465,11 +2465,17 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t r=
eg)
             }
             return env->v7m.primask[M_REG_NS];
         case 0x91: /* BASEPRI_NS */
+            if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+                goto bad_reg;
+            }
             if (!env->v7m.secure) {
                 return 0;
             }
             return env->v7m.basepri[M_REG_NS];
         case 0x93: /* FAULTMASK_NS */
+            if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+                goto bad_reg;
+            }
             if (!env->v7m.secure) {
                 return 0;
             }
@@ -2515,8 +2521,14 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t re=
g)
         return env->v7m.primask[env->v7m.secure];
     case 17: /* BASEPRI */
     case 18: /* BASEPRI_MAX */
+        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            goto bad_reg;
+        }
         return env->v7m.basepri[env->v7m.secure];
     case 19: /* FAULTMASK */
+        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            goto bad_reg;
+        }
         return env->v7m.faultmask[env->v7m.secure];
     default:
     bad_reg:
@@ -2581,13 +2593,19 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskr=
eg, uint32_t val)
             env->v7m.primask[M_REG_NS] =3D val & 1;
             return;
         case 0x91: /* BASEPRI_NS */
-            if (!env->v7m.secure || !arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+                goto bad_reg;
+            }
+            if (!env->v7m.secure) {
                 return;
             }
             env->v7m.basepri[M_REG_NS] =3D val & 0xff;
             return;
         case 0x93: /* FAULTMASK_NS */
-            if (!env->v7m.secure || !arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+                goto bad_reg;
+            }
+            if (!env->v7m.secure) {
                 return;
             }
             env->v7m.faultmask[M_REG_NS] =3D val & 1;
--=20
2.34.5

