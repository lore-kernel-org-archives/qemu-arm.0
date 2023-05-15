Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6589213ejq;
        Mon, 15 May 2023 08:23:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4qdtZC9z4rDdVptJG2t7nv3+7rFMgEpxgi4NW+KheKdhE0BHrqTWOUIPCtx/pFQEf7bfLP
X-Received: by 2002:a05:622a:390:b0:3f1:f451:c13 with SMTP id j16-20020a05622a039000b003f1f4510c13mr53793199qtx.53.1684164217040;
        Mon, 15 May 2023 08:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684164217; cv=none;
        d=google.com; s=arc-20160816;
        b=n2/kjstG5+8tTkGc9adUmk66Ezzk8PaAa4QkryWx07JKcLLmKXClBJjIu5blM6+Xvh
         VYGz6zIt6dux+KZFH8ERITyJgsjWArygKHHffPxoxoz0eMOa52JWx+9bedtSOuQ1jztV
         6cO0OYQ6eci98Gmag2chGAnfRIw9mCuIy9V5iDGckKrgda/XKFAPKz9/UaltmsryqOa8
         FVrUGkaZjng96GgJnOiZVcwGGCd8E/2H9GFAyEsTy2omMN9/u8CsU2uD5ofzKHz/RfRr
         UCkOEKF5WmCaXyN3HsbgLzDwl+CQB4spBsjRz6Z5Mo5jrZHK+TAdaEkrpEcowvPfIxHz
         k6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jxeAK+0nBaqYYTLaoVSvaQrIxJ38Tit6zinqkGACFIA=;
        b=BOrPw/ZL8gvky6dJ/y/KBcxtmWhdEG7oVh0gVaDZ0xvvwm0UswTs3Gb7RJ/k17GEGE
         qRvHAm5FE91an7Vdt5VOnxEkJVhatH9s+Cih0LKgPabXXAezYN0NjRV04MamZZsLd9Hj
         pGAuuvQJxibv5tjd5ReDDzIpEgNZWP1nusXP8bWCWrOaLKDnNZujdCo8f4Lds67WgZJY
         4AMtW4906qvrHorrd159n4/INbeu9HXLIE4r56NajlGe+dt8wJj/nmo/IEO7tyihv3Bo
         9S58/iIkpdj8qupJQZbgjMpy8TFSBOi+f0syernzgmYaAxIlNjxDQFZ85NE8KfaXF/N7
         HJ/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P/gzS0Vk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6-20020a05622a134600b003f518050347si3130705qtk.480.2023.05.15.08.23.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P/gzS0Vk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZI6-0007Vg-0h; Mon, 15 May 2023 10:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHT-0006yC-8t
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGU-0004vW-76
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:33:41 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1aaed87d8bdso90645665ad.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161209; x=1686753209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jxeAK+0nBaqYYTLaoVSvaQrIxJ38Tit6zinqkGACFIA=;
 b=P/gzS0VkxIZ7eGFXLCopzy44T1r+4+EnpyMnmvd5Fb51AVs+ozKrNUS+wVPH5m/aQj
 4wan5D8gXim2b/eXpq9CwTT0w50OU2QAE4lntAcW9FgaJ/SxBO1m9rQR9f4zGbDRe6sg
 JYW6PTw5ed1t5//gYnuZh1eJ8eXpKjDPbZTn8syBdddLpbnOqVFwkCWroRauxKhShh4F
 n2C/fU4QXrsmIVGUIbcEcJctSig0nlgXHl3ur3YcyV+C/gKJpZ13Cp3VtmTfgAjR/i0g
 33lJ5i5olmwD3mmnbcnx4pe5wcccDMNSH5s1i3Ok0IktmouQHWNUwEzzWg3CemqMkfTP
 z/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161209; x=1686753209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jxeAK+0nBaqYYTLaoVSvaQrIxJ38Tit6zinqkGACFIA=;
 b=b7nGBj0BXQwD/SUjrVqVWiTIE42h/AQWRyRggzYLJ9lp16lsK6gkGr132xIaKZMbbx
 8CxyAce+9dvBJBXXZsG0IUFVr7mvNtXwS9xLZZ+L/DnWL0Y2GD2n1RUQZ3/E44zJzdvr
 kzrA8EcN5AewTHyBz9ZYgwUU8zcmg6WSxbjQ78vO0Cc1/bMUd9r+Nzaf9N0YsrzUUKBi
 w6jMTIway+naDQKugpWV0LDPuCdK/f10xa8ZX8DhS6BOrA3/Hfzzr3nIKN8YK8rbQAqy
 52wGVarHYSwS31Mmk6lguuXBd8fEYjNt+YkhVsfqtDaLw5OdUYpsvD0xwtAr0FyYhF5X
 YWtw==
X-Gm-Message-State: AC+VfDyKn88Tn3RVBKSy9/jmMMwNlQNsP3OCf3sK0NzUmkyoNB0wLnkG
 82m/fQljBKdhmeGzru0/yU1s4qMYWU/UlHysdYI=
X-Received: by 2002:a17:902:d2c4:b0:1ac:5717:fd2 with SMTP id
 n4-20020a170902d2c400b001ac57170fd2mr34765471plc.47.1684161208766; 
 Mon, 15 May 2023 07:33:28 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 16/54] tcg/aarch64: Use full load/store helpers in
 user-only mode
Date: Mon, 15 May 2023 07:32:35 -0700
Message-Id: <20230515143313.734053-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8jGa1fjAVaY8

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index c64606af5b..36d8798bca 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1595,7 +1595,6 @@ typedef struct {
     TCGType index_ext;
 } HostAddress;
 
-#ifdef CONFIG_SOFTMMU
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 1, .tmp = { TCG_REG_TMP }
 };
@@ -1628,40 +1627,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_goto(s, lb->raddr);
     return true;
 }
-#else
-static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
-{
-    ptrdiff_t offset = tcg_pcrel_diff(s, target);
-    tcg_debug_assert(offset == sextract64(offset, 0, 21));
-    tcg_out_insn(s, 3406, ADR, rd, offset);
-}
-
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!reloc_pc19(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_X1, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_adr(s, TCG_REG_LR, l->raddr);
-    tcg_out_goto_long(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                        : helper_unaligned_st));
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-#endif /* CONFIG_SOFTMMU */
 
 /*
  * For softmmu, perform the TLB load and compare.
-- 
2.34.1

