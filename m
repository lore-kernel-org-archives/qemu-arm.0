Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414EACA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:08:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXeG-0003sb-0q; Thu, 14 Aug 2025 09:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXd1-0002Nw-1o
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:23 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcx-0005CX-RV
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:21 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-76e2ead794eso681962b3a.2
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176655; x=1755781455; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1dB1cHT1ha866F85MzBv2WZgn+PHcRylb/+Q2tL/eLA=;
 b=Xu2l+9doRa2p58XxoYGX/BMDhNS2uYREsS0/Sd4scXld7UAK8DomR0WxOs1ZMt5NY5
 Egqv4oLTW8l7O/TOM/XM5kd4DzAJnKTxcfWGueFR2QJOP1ZZrOLf6ne8kZxJB+APSUK+
 Nm0Os7h8CKEPuHpXitSy7pOjDyc6BnGXLddJ9fxkOKVlZa8p5JpSuVEua/Kag7F67xX4
 dq4M2MyGSDrnG7k5Cmtd5/lbbWUAlf3grVdmUQBcu66E8oDO3r740bviVN34Lr66vg6X
 z1gAV/wIIrol7PLg+XDvO172rvVK4gffBeMABtDjfFMjKKtR9IMZfiMSQRewBh3rRAJr
 qjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176655; x=1755781455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1dB1cHT1ha866F85MzBv2WZgn+PHcRylb/+Q2tL/eLA=;
 b=Aj0Ar7WjPVCBcg4Wo7YTeK2jCWOdafDyxtFWsh2W/ggUo11nuxEJ64kpCRRbsXihKr
 9/W/OpTY7u9Ia9WsPtIq/kJhDK+ytZL7EVDZVJQ3MSbk9mCHqbFle1R+cJMY/2jl+aoK
 nMvCYc7m89Kz1uOk17canhV+fO/ZlJB3zVAc8uHMWtl14aTFrOlRSI38x1TwZF3HN/dv
 +8d2F+7SDsAu20EqMXkVt4jMVS0goUhkKdXNljkiqOopy9XttJgJCFZdgM2s9PP3ALFB
 0OFFFZIapAe47RC47kjdw3DRJw95TOk0kY7pfTtX2xqj3fwBuoFcnSSBBorXf/O//uJ8
 y4jg==
X-Gm-Message-State: AOJu0YzX209i0xPCwVGB+khw6+++4RoOQ2LKFTe27VFuw2l+y2MPO2Ma
 uKpVvyI6pE2Fiv3BxetIFEQwx0xbL0VqiWWYP61qLlDHx71VEuTXZQiX6lt3SqLYE6w=
X-Gm-Gg: ASbGncsh94q6+B65/AOZBPU0xtaDa49CntHtLmbCeCTs2AAjBChpSx87YCcoMzv+NFI
 maueMqh0B7b+expRZ5DAX0GSsd1zPZ6RKDmFTDCdLeZ2IMsqTkB/zXjZd64QkKgwv+BvWRpIMZa
 J3L8fOrfWphLQWzrGIFaOrSRdm/A6saOBDmP81Sn/wUOTyDj3kGm34hXf+JPPMnsuYOZjRehi1I
 ImWQ3LdJPCaDMHEfN6GPkGprKI61tArlRfZEqULuT5KHuqDrbFyJuHXvK9YcIVodX5UMOMjfLp5
 iQhx1e97orJ/7pW0TvaK0T+0nqdPwxvhU4Xo3j8nlZiCkumoYSkw6rLfv00xSUH4UPcUp1Mi8M/
 oS0r7hT/u0NwsiN7uqb3VHCYmiG/DOh5Cwjczx14tfNu4V4E=
X-Google-Smtp-Source: AGHT+IHqdxRRDBrq443rv8jsjug/ztz2Gyg5PyVKaOZSVL3XJUjW2vsaadTCuLeGMw10heHkWfTDYA==
X-Received: by 2002:a05:6a00:883:b0:740:afda:a742 with SMTP id
 d2e1a72fcca58-76e2f5cdfabmr4593689b3a.0.1755176650188; 
 Thu, 14 Aug 2025 06:04:10 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:04:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 56/85] target/arm: Emit v7m LTPSIZE exception out of line
Date: Thu, 14 Aug 2025 22:57:23 +1000
Message-ID: <20250814125752.164107-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index f6fdfaa551..e787acfc66 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6885,11 +6885,10 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
 
     if (!a->tp && dc_isar_feature(aa32_mve, s) && fpu_active) {
         /* Need to do a runtime check for LTPSIZE != 4 */
-        DisasLabel skipexc = gen_disas_label(s);
+        TCGLabel *fail = delay_exception(s, EXCP_INVSTATE, syn_uncategorized());
+
         tmp = load_cpu_field(v7m.ltpsize);
-        tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc.label);
-        gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
-        set_disas_label(s, skipexc);
+        tcg_gen_brcondi_i32(TCG_COND_NE, tmp, 4, fail);
     }
 
     if (a->f) {
-- 
2.43.0


