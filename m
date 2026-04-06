Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662C8F46C69
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 18:30:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9oej-0007Ql-1K; Mon, 06 Apr 2026 14:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oeY-0007Ke-Mt
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:26 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oeX-0002MP-18
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:26 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-c70ea5e9e9dso1676741a12.1
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 11:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775499983; x=1776104783; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uukBbBYYNyrggNOyo7VdnlUk/PBaz4ldLT648BT7MPc=;
 b=JdoyJ59I+Ot9fdvJUjNsEH9saVBqHnqbHc3p1Vz2ro/74nVDoGON8zEvA77c8Nlsmi
 qXwLgin6Rr731HmyzgBij+pjlg38QxsBf6TUzHCKgO+sdAVaVN749CAqAxpe/KOehZ2S
 jG4YxTwFkeLffDCDJZteXixo9rHAVRJo3bNHhkr9bHUNk6UguegSG4LteBzX2lkp+4S7
 JJbNAk3YuPA6xZh59QrLJfWfe3mpL4j58ZJsjAHcPajLnBREwxw3kRI7qYfUyIcR+fB0
 iSyBA7p5eTsF1LwNGBljmppNTsJcDg6+WFfqZV9zdCQ5tyWu09Q4/T8YdxHgf+yAioOS
 QcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775499983; x=1776104783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uukBbBYYNyrggNOyo7VdnlUk/PBaz4ldLT648BT7MPc=;
 b=L5jbT87FFn+qFmuldq2XJE4PdyX2MRk3B6nzQFS1BDXzWR2sqkOb9aJOpWzWEuG3e5
 mxnzHex+fCZ70KKhpr++Hr+otzLKTabRaw7WcIQMGNdpmlS6Gm5cEfPsuwlzJTu28maT
 VmI2JVsxfPhIGDxg26HKdeWMxiPNRl+aN+J56ChjWYPWRtli5wyI+GqZOJC8PviolzU5
 wjfhsecBP4qX7w5UGueMa5EE363AvIEblegSaiQIGQB31YJAEs7hLPfT5VkWGBprsSpH
 5Sdf+ttKSmMu0bulXPL4rHa79Tiz84L5may2+s7sQni7hvyAhridteLI+R9xvMULOfDG
 DKXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe19SF7DcdlzyUmOzvS8i/45U/2drJmSAXQP/O9vSIzAjJ6NaTIzonDDg8HkGHchyj/P+YL8bC0g==@nongnu.org
X-Gm-Message-State: AOJu0Yxs3BI+EKCIuslJrtVXVcwOzdaSRAAVHXnB59fxWnyuuIyGOt9B
 ZrO0EX7BE2DjEbXOhZMwOn45txecjXZ9/8ukHZkLk2s2gixY8fXNUP5qjXH5SJBN3SU=
X-Gm-Gg: AeBDietEV3YIwqMw1wLXAMJNDC81n9wFyPCLIO9f3TCqoIfVUTSZV/Vx+AJGAdAZ16U
 eRh6CZavEzHYJ5mJ60ZOTWKyh8fIPjSRiRkkREssoIRV86ZO51R8niT6lpod1SzPV7vvJO40gFc
 N5a9xjyWQNyjT+m4vmA+rSElTEMPC3cZ+KVNU3CDCnEkrBWtJ2+SNsmsGNPv4GDu3z0BSbINU2I
 1Kj4kA0ym8TArAAuKxQ5M/A51PFguHJMU5mqUtwTQr/xUdXr3iWJlQPJ0YwKm1v6zrzPXlh9CGL
 lfEZ9eU/7xBAwGIDWnPP33FAhGI44eA3UBr6QCNOaaZPB2yw+zM0RNmST6whqAN0wg8ExLFuM1J
 ctAsui9fcCENr/fhNZ+HTdOIfTob3xnw1Vm1V2+gfuIk5r90nhACcN7JAILyCEBC+nD6O5AFICT
 cyyRQkQJvpj1s9bJrTBy5uC1imSp9QClV4gbqdC/++8JFWw0yfcVlR+PMYkG+mZX34A2uEaEmd5
 1lt
X-Received: by 2002:a05:6a21:3285:b0:39c:235:c5d7 with SMTP id
 adf61e73a8af0-39f2f01ecadmr14259282637.39.1775499983483; 
 Mon, 06 Apr 2026 11:26:23 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6561fe9sm12765080a12.15.2026.04.06.11.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 11:26:22 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
Subject: [PATCH v8 06/20] target/arm/tcg/translate-neon.c: make compilation
 unit common
Date: Mon,  6 Apr 2026 11:25:55 -0700
Message-ID: <20260406182609.193886-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 5f33ecd76e0..8d9112f6da2 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -10,10 +10,13 @@ vfp_d = [
   decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
 ]
 
-gen_a32 = [
+neon_d = [
   decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
   decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
   decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
+]
+
+gen_a32 = [
   decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
   decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
@@ -32,7 +35,6 @@ arm_ss.add(files(
   'translate.c',
   'translate-m-nocp.c',
   'translate-mve.c',
-  'translate-neon.c',
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
@@ -63,6 +65,7 @@ arm_common_ss.add(files(
 ))
 
 arm_common_system_ss.add(
+  neon_d,
   vfp_d,
   files(
   'cpregs-at.c',
@@ -72,17 +75,20 @@ arm_common_system_ss.add(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
 ))
 arm_user_ss.add(
+  neon_d,
   vfp_d,
   files(
   'debug.c',
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
-- 
2.47.3


