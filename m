Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA1F10F284B
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:46:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AJo-00072e-4R; Fri, 27 Mar 2026 12:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AJ3-0006eb-Ny
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:45:11 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AIz-0003AB-IK
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:45:09 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2b0b0064027so14893945ad.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774629901; x=1775234701; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YgQl5yPsWs4mu3exjzDTSuGdX6yFtjVmfC62Efiw0bA=;
 b=C3Av8bWBnKZG0hTUwrIGoNM65JwGQIOzivLG1p8Vypm7vP6kkeEbxIfaXCRPgc/WUM
 2/YQaMM+v/6w5LJrgb4u2B0Ys91fIjCOdLTaNC3zWvowvRljFIXGhtHhZFYVbzLQnjug
 FB12x3VVzLIvrB/r4skFiKBqJkcVgvxYurmOYj/R1Pjv3YPNtT1GXRnia6oC2v/fY8vC
 Ym+n46F87egL/ZWR2X8Q6z4BLfr5I5zFA8cJVk+vY/82Hymq8uOYFGJNwnNLTK0KN2YE
 xpbzvZldgOw7bgidWGvgX0Rx7q/TjIoDJjyLQB6B2i52iE5CPB1RSDa7TmiUagKsVjFq
 0Ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774629901; x=1775234701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YgQl5yPsWs4mu3exjzDTSuGdX6yFtjVmfC62Efiw0bA=;
 b=ZGXshHvo9WPTNP4o0rb31+o+qDqIWrcjI2DHR2HXQg+iDDc+JIgoKxlz/W297/VcOH
 XVUWME/n9re3DK8eIUxIvR7HkHFj8qPqZHpD5G3S3PqIxNzaSpK3UIsE1HmQeFLrQGZo
 4mHVkcXdkpwvM7lZr5JhmxwAmDCvLOCcvcWi3yfHi0q5FzxmBtviqGkscRdNvgHFmMcE
 xrmom44hapgH8MFteyfzXL3Dn5O2kviqCFG2JYFJOhW8Uad6OqKmKeoqxZMz6d6iMgcR
 ec1nVI4UnFmCfJxGc3NXgk1jYHAF3Ge46/7dP9wYH2RoUWySFjqXDbbawqg9bnfSNBYi
 SzWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsl/gcEf0/Gk2y1bJlqJ5zGo5OMuM649g5EYQZess60oPoEH8BzQnrlDjZOQbGMdTeToTI2cyRdQ==@nongnu.org
X-Gm-Message-State: AOJu0YzTTfvVPGp8RbTOnbQvLTN03zft358rm1lT4xAUAxSo1Fws5RBz
 s2LKQ+6erObtpoNxc7aQdruoCid7wBR06HSDhPGir9oFdwtfTQsb5UE0bjhKTnHnc/M=
X-Gm-Gg: ATEYQzwei5xsBW5hHDaDZN3qhHiTnfLsRVbcNdH8BYZNXIADB8XXI/kboqGqfFMgotM
 TovghysL6F6m7+hDliilYg3xvD8NKuP6cXL+MopMvrANsop/E9Cngi1fkfxyPuhfaBHR61S7Jk8
 XNji6KNjGvW89ZBQhfEswWNlluKIEWXmok+0ieUGobNwVD34rU71mfc9bE1BOh56N4C+5HX9TNE
 iBxyDQYr6OyZj0djqEyCjYwsziQrVqQPgRKSJRHU1+XMCbvWac1vvrDxM7PL4BG47i4yr5g/w1/
 iScQaHGR97/FrlRaXmCbnuWtt+3TcTuWdJXOS4It8cgGnvjac+nWzuGs8UzyOFWLo47CtjcR5zH
 rF+wn9S+qwy39NRVtD7Ku8i3Njqf5VTcg1iA/p3v7oSxYOPDpxEzxWk2s/AZcQ57jj2DMeugQIA
 Vm4ass0FOhwPfcNEGyR6YbSEXMiTL0uny5s0wTBsoy7aSbK+Wo5m/ECAhRS9HZIHtEduKGl7Cgm
 b7h
X-Received: by 2002:a17:902:ea05:b0:2b0:5dcb:84cb with SMTP id
 d9443c01a7336-2b0cdc240c6mr32508775ad.2.1774629901325; 
 Fri, 27 Mar 2026 09:45:01 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0bc882339sm63890655ad.43.2026.03.27.09.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:45:00 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org, philmd@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 07/12] target/arm/tcg/translate-mve.c: make compilation unit
 common
Date: Fri, 27 Mar 2026 09:44:44 -0700
Message-ID: <20260327164449.596767-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327164449.596767-1-pierrick.bouvier@linaro.org>
References: <20260327164449.596767-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index c14c9242df5..1e9c147e4d2 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -28,7 +28,6 @@ arm_ss.add(files(
   'gengvec.c',
   'translate.c',
   'translate-m-nocp.c',
-  'translate-mve.c',
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
@@ -59,6 +58,7 @@ arm_common_ss.add(files(
 ))
 
 arm_common_system_ss.add(
+  decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
   decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
   decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
   decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
@@ -72,6 +72,7 @@ arm_common_system_ss.add(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
@@ -82,6 +83,7 @@ arm_user_ss.add(files(
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
-- 
2.47.3


