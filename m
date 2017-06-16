Received: by 10.25.0.23 with SMTP id 23csp1422670lfa;
        Fri, 16 Jun 2017 11:58:20 -0700 (PDT)
X-Received: by 10.237.45.103 with SMTP id h94mr14955774qtd.204.1497639500515;
        Fri, 16 Jun 2017 11:58:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497639500; cv=none;
        d=google.com; s=arc-20160816;
        b=P1eXYNBO86Qf9Reskp0CN7FSmwWMdgoe3nsoqWeQE7N7FYCp88bGI/f/w086o1+9wr
         WNmiWFVB1IjUwW9mF4VUUHCZ3I3HVv76+oS94hnaro3IDRlNl24yZ32BdHbvWajGaa6C
         7nk+VwYEca2RllzIn63jGclj+BAPoRdW9Lkcr+l48zIFu8kotfrNQb7yTj/dCRsMBHP8
         miXVbvPCmus7Qcyi1/9SuTw2EIUieInDE4Hkz3ywhmP+Nc/7t+dFYVamQiGNhK94fgRg
         olEoMIUMApYW/bYaIg+J2sTQ3UQ3rAYmkLr05jm5s1jz7EV1esKUpmXvktFDvcBmUVP0
         agWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=8i6DWtzZCJEZRiO9XOzRI/VMJtfoHMMooljxjk+2CqI=;
        b=ZjxXKlBFW3BKSpuIX7gpq4P+Vf55uRJnMlSDEXcX0gLsPzqWUU6Cji0L1KpvOtqszM
         Unf34zm8Y5/QCNm/2ctmxXpvoigeJ/vohwUXKS41/RDZpG56IADWqA+sJ+0mfWEhkRra
         2WjUuZCcZgxz0MX/n96/fQu7ZsQH6OhK51fMbY30P42UXuB9Dqmtyk/lSOvoejug6Noo
         j+V/aug9xaHMTb9TiV9/+dwegIizFw+vfH83UJeYD9AgnvpbzBZ5jvtF2S7k/a2vFbh1
         unhBJIYL5I7Co+MdgkQ3M4q6t/Wm1c+cskuW6fLFFVKFqECL1bhVMchq3+Xjfllcc7S1
         DlPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.b=MuLa2xAQ;
       dkim=fail header.i=@messagingengine.com header.b=MGBbHUmW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r56si2651887qtb.29.2017.06.16.11.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Jun 2017 11:58:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.b=MuLa2xAQ;
       dkim=fail header.i=@messagingengine.com header.b=MGBbHUmW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dLwRl-0007KF-Qa
	for alex.bennee@linaro.org; Fri, 16 Jun 2017 14:58:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1dLwQG-0005KK-38
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 14:56:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1dLwQD-000775-69
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 14:56:44 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:55611)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1dLwQD-00076U-1F; Fri, 16 Jun 2017 14:56:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6571B20940;
	Fri, 16 Jun 2017 14:56:40 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Fri, 16 Jun 2017 14:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=8i6
	DWtzZCJEZRiO9XOzRI/VMJtfoHMMooljxjk+2CqI=; b=MuLa2xAQcNPEKp/bbiS
	qX37ASsh90Qs2DF+zKCdU+qd6qVkJx/XP9jXXuLYHroKSAhNYaLboYDimXLWdrc1
	p36v/MHya/FqBy05r0nx52YnTRdB9HwAprYAMYXkTJA9LAdnSXwB6cKwO9fFrJ23
	mXAfs0mWMo4d/05QXCrisa9s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=8i6DWtzZCJEZRiO9XOzRI/VMJtfoHMMooljxjk+2C
	qI=; b=MGBbHUmWX2lWunkU3nktybtnkQSoDgGN7SBS4Pc0RA3bV/mzavmjJJCZ6
	TITOXMhGAywQgla8ZQPaGRJzg7ZwYfDuGXI+g6YAbKESt8w8ZY+35hi1hfPQtAAR
	eC+UMTz7MaxJFtiSFfyq2wIhpZy05Ge/hucgNqXiU8XjbYUKlSsCBFb72l+rN557
	2yw7TLCdDLFJgyCG0RTz1OJo2rC9ecdI5sxwjbs4UO7owc2rQl6gE5+DLp0kj89a
	EPh7J7cGmLSwcXNcE/wNYaWUJfwXwRIJTts7XODQeMdUq6DktvF2tX/nknP79eqA
	wdMQAxWAnig49igxW34b6JxAij+LQ==
X-ME-Sender: <xms:6ClEWWiRL0LL_92LEYP9lPaY5ZkN96Hp2xOSP-8M0pWzapMuGO8iig>
X-Sasl-enc: BuoGGiL0taezhUpne0UPU6z37XxKWtzd2Z5o+TYis7Qq 1497639400
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1A81F7E7B1;
	Fri, 16 Jun 2017 14:56:40 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Fri, 16 Jun 2017 14:56:37 -0400
Message-Id: <1497639397-19453-3-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497639397-19453-1-git-send-email-cota@braap.org>
References: <1497639397-19453-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.27
Subject: [Qemu-arm] [PATCH v2 2/2] gen-icount: use tcg_ctx.tcg_env instead
 of cpu_env
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?q?Llu=C3=ADs=20Vilanova?= <vilanova@ac.upc.edu>,
	Marek Vasut <marex@denx.de>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	Yongbok Kim <yongbok.kim@imgtec.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NS7KThLHdXU3

We are relying on cpu_env being defined as a global, yet most
targets (i.e. all but arm/a64) have it defined as a local variable.
Luckily all of them use the same "cpu_env" name, but really
compilation shouldn't break if the name of that local variable
changed.

Fix it by using tcg_ctx.tcg_env, which all targets set in their
translate_init function. This change also helps paving the way
for the upcoming "translation loop common to all targets" work.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 include/exec/gen-icount.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 547c979..9b3cb14 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -19,7 +19,7 @@ static inline void gen_tb_start(TranslationBlock *tb)
         count = tcg_temp_new_i32();
     }
 
-    tcg_gen_ld_i32(count, cpu_env,
+    tcg_gen_ld_i32(count, tcg_ctx.tcg_env,
                    -ENV_OFFSET + offsetof(CPUState, icount_decr.u32));
 
     if (tb->cflags & CF_USE_ICOUNT) {
@@ -37,7 +37,7 @@ static inline void gen_tb_start(TranslationBlock *tb)
     tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, exitreq_label);
 
     if (tb->cflags & CF_USE_ICOUNT) {
-        tcg_gen_st16_i32(count, cpu_env,
+        tcg_gen_st16_i32(count, tcg_ctx.tcg_env,
                          -ENV_OFFSET + offsetof(CPUState, icount_decr.u16.low));
     }
 
@@ -62,14 +62,16 @@ static inline void gen_tb_end(TranslationBlock *tb, int num_insns)
 static inline void gen_io_start(void)
 {
     TCGv_i32 tmp = tcg_const_i32(1);
-    tcg_gen_st_i32(tmp, cpu_env, -ENV_OFFSET + offsetof(CPUState, can_do_io));
+    tcg_gen_st_i32(tmp, tcg_ctx.tcg_env,
+                   -ENV_OFFSET + offsetof(CPUState, can_do_io));
     tcg_temp_free_i32(tmp);
 }
 
 static inline void gen_io_end(void)
 {
     TCGv_i32 tmp = tcg_const_i32(0);
-    tcg_gen_st_i32(tmp, cpu_env, -ENV_OFFSET + offsetof(CPUState, can_do_io));
+    tcg_gen_st_i32(tmp, tcg_ctx.tcg_env,
+                   -ENV_OFFSET + offsetof(CPUState, can_do_io));
     tcg_temp_free_i32(tmp);
 }
 
-- 
2.7.4

