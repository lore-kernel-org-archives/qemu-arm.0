Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2766994ejc;
        Mon, 9 Jan 2023 17:41:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXteGCK0ftDDOHAeIu5fj6IgVqaAePRwiKlSQs7oAwrT7VqyDXevUHcX65B2ulCKfpqNIUcm
X-Received: by 2002:a05:622a:4d47:b0:3a6:46b4:2a6b with SMTP id fe7-20020a05622a4d4700b003a646b42a6bmr104106777qtb.27.1673314890082;
        Mon, 09 Jan 2023 17:41:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673314890; cv=none;
        d=google.com; s=arc-20160816;
        b=LonL+LGjn0YNwbnGkcFloGLC5UGEOpbK642kvWtwRsip5da3Kobo9kbxk8EqZiX5Lm
         t/bow6vW5PR3AbX80rnv2FcI2IBvCNKU8e+SwxNqpRohppHmSvREFmjxKXLcZdeWF7Ix
         ISqmnQI2VPuS69OykCIUw48ffHK24t/vkiX0o96K9toPLHRmlSgDwdf1k+XbL6UmXuQT
         8vJCeMHLXPn+X4gZRMEzF78in1v2ltSzScRiZfYpg6kuYCls8Y6vTXsyt7pWpjJYUA9A
         UnFO0lHa3mqyADBmZdZo0oRW2+UFKt8Q6W7tPfr8wElYvpshIpCrJe+Bv/3hrwM2r3Ft
         NK/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:message-id:subject:date:from;
        bh=kMNSHYxjJR566f1QbEbgR1E62KLfM3wYKY7DlVQTlOA=;
        b=fbQSs8BYtG+dLx3ztI6KHlNXmPczyD784SKsFUJ19BJhGuNw40qGzubRE/rsAZyRnU
         E9wD0x7DMlKA+6+E8zvJlopqo28sgdUZC0kIhOkxCzkd2wwR6r6E+YwqmPAD3ADS9Oll
         QNeFatL9/8D9+92EjV1RfhgEBITifxtNzpM5F1HTlZpBXhtlHfhjZb9cIfxFTXjYLDmh
         XOOJ9H+I9fbmbPHsMFIBUob9mTQRQ2wqF5mXyHhKtq1/zpkQFr5iHgFD6ViystUOTMAs
         cOH2I5op30JPQRFAq5qVSzrIiQ6yFeBNUorZDLND7YMmPz53rzJ5xXoIfOHnefhfWTlL
         PN9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ez4-20020a05622a4c8400b003a526a0b50esi5695667qtb.307.2023.01.09.17.41.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 17:41:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF3dC-0003gx-4s; Mon, 09 Jan 2023 20:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pF1PH-0004hk-SZ; Mon, 09 Jan 2023 18:18:23 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pF1PA-0006NU-Hy; Mon, 09 Jan 2023 18:18:18 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 49CB511EE06;
 Mon,  9 Jan 2023 23:18:05 +0000 (UTC)
From: ~dreiss-meta <dreiss-meta@git.sr.ht>
Date: Mon, 09 Jan 2023 15:05:19 -0800
Subject: [PATCH qemu 1/3] target/arm: Unify checking for M Main Extension in
 MRS/MSR
Message-ID: <167330628518.10497.13100425787268927786-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 09 Jan 2023 20:40:44 -0500
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
Reply-To: ~dreiss-meta <dreiss@meta.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vBMa63J6TwOn

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
index 355cd4d60a..e5ccfa9615 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2481,11 +2481,17 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t r=
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
@@ -2531,8 +2537,14 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t re=
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
@@ -2597,13 +2609,19 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskr=
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

