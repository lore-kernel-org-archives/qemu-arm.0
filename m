Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEC610F9976
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:56:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYVs-0005AH-KZ; Wed, 08 Apr 2026 15:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAY5s-0006tN-B9
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:57:40 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoX-0000pf-Br
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:31 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-35d9f68d011so3650200a91.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600548; x=1776205348; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jvjSLIEXvBvChupp9bEDs+PcKLfymPb67QO+8GQ5aqk=;
 b=SWV3KPkzqq2XpdNe/o5lBvFQj8VSdNy8TD2lXoTNWcR74w4WoRG0Ts4r4qYcg+XW/w
 hHd6gA1BFe9ak7Kga73sXjBr7Bx3TeOTcOk+JimV3VcXsKoLyP2VNiMQmgwZry6sH9ic
 KgPKOpsTnMeNdwoneoKzGdQwdmQIxgAPXeOOhCdFO4+UdkVucK/3x9T+qiCL7jSqZMwk
 BkmYZ7/5UJtOZBVJQTGdr2oS092j/8aMjEqp0s1FyD6yKMBUUM0S1UI+B/mOFAgtLSRm
 7sc0Xs+w3rZf28hpqP4nCVZhR6nByULkjWOLkQ69Sq+nOI+B8AgPBD7cD2KCNT+gxnK/
 daYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600548; x=1776205348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jvjSLIEXvBvChupp9bEDs+PcKLfymPb67QO+8GQ5aqk=;
 b=VWlwUCgac8A9ATcAIC1x0OuoBrI2puOy/nEDVEP1Ix8euPTBIIB8FQG2GyPDO2hUdY
 NArPE5VEMuj70UHpd9QZM/RCIOZlL0euUjkgFSj/BWlB2dwy4VHS6YLTbpbN1epLivtI
 g9yoX+7LJo3Oyx4g2Z3Bz/GMsNqr5DcZN9+v+Ck0CuROGVEe2YQpalybUzKqHhKC8rbB
 9XA0hgYSsG80kPrYRvuekwQfbjuHG3RFOsorUswZEpSreGtnVa1645gGAv2Qcsf78d2k
 hPiYZ0gmeNMG2pYv28irDBU7F/Qz3M0uk2OIhzIgTkSzDenOz6RsCMA3ftugWJ1iSuc9
 Rrnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVykI0/EpLKxJeVbXNko8H8WpY8otVydYnTuwFhg/oa2hlGHPNnY4aTnPEYwGZ8dW8MaCcdYiqmAw==@nongnu.org
X-Gm-Message-State: AOJu0Yzei1yeVp7VMhciQQlhPbtmbnvJUrRuyWgKtt0TJsdPO6Yk8TcF
 hU90BJmaP3h2Zd1zdhns8/rGoeTjj0Srfph02ntJyzpJwJ14NUeWwTMRAm16+AiETgQ=
X-Gm-Gg: AeBDiesQqhbOXE6cC2SPHGP4t8khg4RBdzf5t3q52PPa2gKT7fh0MVhaO1TaKhandPK
 t71XMrHh6yWjZj+WhzfGYfK7DKDvN9KW+R+51Voz+H6B516RnmoDbna5V/6GFAvPolIEpTT6n4E
 RfHqB+TyOLNQCQ1oICriOsrBr2zX6alnxkRv1LlMkXCBbDcD9TKhRNWqEobicrFW5nP/88RwUWu
 qbo0bwc9Nxl5flLKIM+5Y9cacG1a5flVlMdvOFHKvBm+Kjb/gzNXW6RTPo8yqtfdZ69lRvthITw
 tb51iBWZAKpn1j3mm4EM7iDNf2qKmbdXQjGJiMnNfy9IBDO2l6tz4LyXJvjdMYf+rRHpdfZlWqB
 KQI8MtCPoKu+GImf7FI08FlwCY7RhnAle6yJ7IvGE8XziX3Pd3Qs28jjn4BXU78+a4UCAwWIR6A
 3+gDvoH7l5TebyWboX0mnrzA7sa4dxhVJQ4FFHm5ECHUmjTZ9V2bLQ2a+B05ibMerM95bN6PACc
 oun
X-Received: by 2002:a17:903:b8c:b0:2b0:6885:f1d4 with SMTP id
 d9443c01a7336-2b2817b5e43mr196684775ad.39.1775600547848; 
 Tue, 07 Apr 2026 15:22:27 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:27 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 12/21] target/arm/tcg/translate.c: replace target_ulong
 with uint32_t
Date: Tue,  7 Apr 2026 15:21:59 -0700
Message-ID: <20260407222208.271838-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 4546bbeeeff..204f9657993 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6450,7 +6450,7 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
      * fields here.
      */
     uint32_t condexec_bits;
-    target_ulong pc_arg = dc->base.pc_next;
+    uint32_t pc_arg = dc->base.pc_next;
 
     if (tb_cflags(dcbase->tb) & CF_PCREL) {
         pc_arg &= ~TARGET_PAGE_MASK;
@@ -6612,7 +6612,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     bool is_16bit;
     /* TCG op to rewind to if this turns out to be an invalid ECI state */
     TCGOp *insn_eci_rewind = NULL;
-    target_ulong insn_eci_pc_save = -1;
+    uint32_t insn_eci_pc_save = -1;
 
     /* Misaligned thumb PC is architecturally impossible. */
     assert((dc->base.pc_next & 1) == 0);
-- 
2.47.3


