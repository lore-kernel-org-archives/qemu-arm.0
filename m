Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC6BC87FD2
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 00:02:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLpa-0000Rm-Im; Sat, 02 Aug 2025 19:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLnE-0004QO-NZ
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:38 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLnC-0005v7-9i
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:35 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-741a62723c0so525310a34.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177850; x=1754782650; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1dB1cHT1ha866F85MzBv2WZgn+PHcRylb/+Q2tL/eLA=;
 b=lbSK57HoubrZylrWfx+AX3sR6T2Gx7wfHzgbU8PodysBStd0OAUui8KBMMm7PuuBTm
 Pnhnuqd6c/ISSfhuZMakdbKe8+7vJlXhK0PruqBGR848r9s42NJu+QvZLsOVDfLyt+ly
 610b3jbOymw2OLBgNSaYGHBEgHgowURdD+gDbT0Rwr1G9e+Y9J7JyBQT6Whtr26tGsIk
 CF9JXmDFKhx63K0Odt89EhFMgM3/66klBwcK19VhsxaSXPgrYcDDO1fviFsHLOfMWc2f
 3UCVA1xsSgX8US9L3vWUm+tV9uMiEoWKzLxaOLH/FviUqiy9BN6qOq0wMqLQPBXrHr/8
 lEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177850; x=1754782650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1dB1cHT1ha866F85MzBv2WZgn+PHcRylb/+Q2tL/eLA=;
 b=ip3SCW1JlsOeyryavOUUCWHHM32FpRkcnXYnmoiAVs61QQ5AUlP7hXv+tkJCdxLa/0
 eQ2UXPO361rGpZudKRsqwyiKczftCL17DgEZMkpmBRi8VKzxIJLVoykHZgYVymR7Qr9k
 MckQB3fOWYynLWQsnwckK0VQKK4flHI92Lx3vaRNySPk0afL3naKAzSTby7pjsPZRdnz
 5RJvSs5ZCdnEE6cYsZFV6TcbTIAGLaLfhWTakFsW8fx4UDMdAJ70eUn5BzH6YOj03PXJ
 gMc9aA9ndfrmtmEX5+tGcA0VW9YCvfatgu2uyX2WfG0dU2FH1ryxQcyESHwESmcR0bsg
 iQlw==
X-Gm-Message-State: AOJu0Yz/jxXP40LVZ9JVVbMs5Ddi8kG+8XaEYA1mjXi68iMs2D7XwRGY
 rKdO22r3Dq0fF3tpjYqHNOkv6BxatRwXLUAND5iQ9W3NFVP4Uv7mtFK0AOgtjjRW41JKau3AN3X
 YAeQQv3w=
X-Gm-Gg: ASbGnctdh8QwB0MIMooN7UZo8OdUyne1Oex9AK6XrCtD5GP6qgNxJ4cJ4yhC2i85HyU
 mFP82m+pBYILO/HX/TRFmUMJ/yovQrviBs8vQ51g9LbEywoLuCMBXpl1MDZaZlVWq4kC1ugO2qI
 NM0e3b3ZmjZKhuU+TUwIhcHye3iv6TAXiE+5Rs4C922LzmUXW7WAYWzRSU4tmBvvnc/JLvZnKUP
 kVuTlvcWmDEQSiCQMkqDSEosb8RjXu5hqRjzoiDGpBWhliM6eGcdzZ/J2P7dyP53+War1L0jj4x
 0MatLyDOFOtLK7IK+JStAY3OTWAl0g9Sn/kp87sUfi/jr+yJXW1EwB0+MYap349ObyggYtkVtqO
 5pUoahA5ewD1hQgxfwOT+/KTa57x64f/ghIfHKAZv/5NsIljRKBVp
X-Google-Smtp-Source: AGHT+IEXhEhNo7CnpN0vQxN9axj3V2wowQr9vlAAiYarC9ZntpXwBeY2DEyV21f8+JOEyCRz+DmlIQ==
X-Received: by 2002:a05:6830:3901:b0:741:213e:2212 with SMTP id
 46e09a7af769-7419d1d4362mr2703195a34.17.1754177849810; 
 Sat, 02 Aug 2025 16:37:29 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:37:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 56/85] target/arm: Emit v7m LTPSIZE exception out of line
Date: Sun,  3 Aug 2025 09:29:24 +1000
Message-ID: <20250802232953.413294-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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


