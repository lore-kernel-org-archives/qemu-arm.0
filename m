Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp181591njj;
        Thu, 1 May 2025 05:56:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURAX1/EQVPOzDvNrKd7uC4aS0hJgzIrXZHLe10+70xTLM65tRjtDv+LWl6lYnIeG2yKpBQl/KrGYLcnw==@linaro.org
X-Google-Smtp-Source: AGHT+IFy4Paq6ZINY8dL2QW6CFKhA19+8QayZIFXuPIIO2c/Ojfp2FxmO70r2JRztPEGfKz72P9J
X-Received: by 2002:a05:622a:5792:b0:474:eff7:a478 with SMTP id d75a77b69052e-48b21e56c41mr40320331cf.46.1746104190214;
        Thu, 01 May 2025 05:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746104190; cv=none;
        d=google.com; s=arc-20240605;
        b=aB/rt9qqHivAvF4TncFd6NgpHsN2xDC22Y0pldeABzM2KH66xHa8DPcyJkyXww2++k
         AlqCpnkJqiVj82ox0/fDk+t2WVnHbK1QhPaPzmg5Uo+FRvWrZfCvY8NxN7h2FK15atCY
         IYQRjZIpktEiGVYOw4V49i8jsRzIANAOjAtYnvfTdnrxizqZSShrnY55wy33zQyfVGX7
         XySFjmKMtiSJbWX9X3HhTDp/t0G5Kt5gRTgT3r/x5lczOrNOnoUA9A6LfGOnTYny/J7p
         FAoBB8GS4VplobM2thdwZrfg3DAT19PXSvmDi4AetEhVPZicAa6+WBbtCAgxC9vm5nuy
         TezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=jzvxd3XHw/BlXHQr4fGCi2TYeUhGZ43epZiwxu05Yh4=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=Fqo8QnW6My4CabVgEb/t6ZSn9reNMgouDyJikej4ZDWXEHuSi+IO6fv3rZfwo1l008
         hWoo+9o/7IMrHDcrC2kVWnq862eqiW/IPqnKd+MhJcy3F2fopB1W6ezQUSj3PuS5y8VR
         RTajV0bKgT1CL/Ce2dq5rNtIkkuEc0WY361K7Jm2TFu1r8hC+NXWMfHBeAKuzfIE/vst
         w23DjGTblrUPa4vNW7WcXlx8vD/i/aRzY1DfFBhKb2AJpYuuro7EL1Sg1N4DfNM3+DN2
         Tl4rBQux17JoHTK9qBF4wR8aIyHAvqHXdXf6oBYlLg0Hbj/2PWkeWWSsQZfETe/+cPOK
         dF8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SE+P5MUT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b960ce2absi5839591cf.1.2025.05.01.05.56.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 May 2025 05:56:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SE+P5MUT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uATSE-0006AC-4j; Thu, 01 May 2025 08:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uATSB-00069b-JA
 for qemu-arm@nongnu.org; Thu, 01 May 2025 08:55:51 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uATS9-000686-Kb
 for qemu-arm@nongnu.org; Thu, 01 May 2025 08:55:51 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39c30d9085aso524577f8f.1
 for <qemu-arm@nongnu.org>; Thu, 01 May 2025 05:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746104147; x=1746708947; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jzvxd3XHw/BlXHQr4fGCi2TYeUhGZ43epZiwxu05Yh4=;
 b=SE+P5MUTiCdlL5cK6ahRcmlepX0gyBHThkjQiuMpYo+Pb/LE7ozJTGslbHzY+go+bA
 B6z4K0m17SjecKqWf1IakcFm0QTxvy9VGpBY9JrNFzwY6GhHAV0caaKu2b7nGgSMGVY0
 FdAk8sTIVLk6vOKhqvOP410n2sfI1i+Vxiu3oMUgvfmgP7R69N2C7ajjCzLrrepOxzLT
 967+1skxrGsQ8O+P4cPBg4zZk1DNk9swIXv+xg75yv2GzX1L4aZL/w/o/1LBCS/SKnj3
 ywFuH8AtqVoi6TofaJo7GuSGX9cvl4uAiYRSItSuw9gPhpEK1OV6ImIu/8YEdBhNwGMi
 SVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746104147; x=1746708947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jzvxd3XHw/BlXHQr4fGCi2TYeUhGZ43epZiwxu05Yh4=;
 b=seE2NQ4smKc8OcrE9r6q5t2B+U/dJWHh/CF3jsSxh1NMhBNta3zrJUbBOuaheoRvH8
 kWH22vGCnHtUes4h8B0FgbJH65h53X4O/JQhRxRWTymffFl0w7ZsMuAaceCsh/0lrSKi
 H8Lx3IxOGpMCEWZa7o6lWDdGAh4nUVDzbfh+rOj3PdSYmwYVnR2MP4U43i7K44McCrS7
 T1dL/yYi3/1cuSbLV+8oVgN5yaehEJEAqevEEB4dL9qSB/9W9rTg0pO8L97ey3apZNG/
 FiIqjW7OXpnxhwCp6ufSrIy3aHQc7Hk2EDOXqdmRL11Zl8vblnDsI2VptE0vcysFEL1v
 UJBw==
X-Gm-Message-State: AOJu0YwFDdyecuFwl0NHq9UQ7Wr7HnO7vA96Q+O6augnhAOox0R95I6Y
 Rr6PduVzTRcXNeTaXD7JB8af53IOWmX5Fx6UB+j49yFICtU2UYkSwFOsJzjpE4jeN03JBQpXA/4
 V
X-Gm-Gg: ASbGncvDqX3fwbXEG07V9Xw/5SxvOJ0PfLJTWIxAiL+xpg4eJP8vLMNm5KQ/SMNELA4
 mpT7Kj42U+qSvAjDp+2jspspowysRONw8OiQ1Ex58cY3rhKCRc8A7VjnNdlZrqw9VqvnT0DT+2m
 65RD6Pvrjiqbi+gBjD6moVQExn/fpukhwG9HkKzH8adxfG95bpVTv+dvi5kRBEzU+cvvUR2iCI1
 /O74VI7c5zYYu8ALZHgN65O4IyD2plCuL96W9MPth1773BiZ58NUhkEp46EuV9MUo2drgL4u3kb
 6ukTSdJk9eykiAcIcg2G3W/SMrokJoeuVlZLLtf2wWXNhKU=
X-Received: by 2002:a5d:64a5:0:b0:391:4189:d28d with SMTP id
 ffacd0b85a97d-3a09303c33fmr2243899f8f.34.1746104147322; 
 Thu, 01 May 2025 05:55:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a095a3e0b3sm810714f8f.14.2025.05.01.05.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 05:55:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Don't assert() for ISB/SB inside IT block
Date: Thu,  1 May 2025 13:55:44 +0100
Message-ID: <20250501125544.727038-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: meSrpb+U4nkb

If the guest code has an ISB or SB insn inside an IT block, we
generate incorrect code which trips a TCG assertion:

qemu-system-arm: ../tcg/tcg-op.c:3343: void tcg_gen_goto_tb(unsigned int): Assertion `(tcg_ctx->goto_tb_issue_mask & (1 << idx)) == 0' failed.

This is because we call gen_goto_tb(dc, 1, ...) twice:

 brcond_i32 ZF,$0x0,ne,$L1
 add_i32 pc,pc,$0x4
 goto_tb $0x1
 exit_tb $0x73d948001b81
 set_label $L1
 add_i32 pc,pc,$0x4
 goto_tb $0x1
 exit_tb $0x73d948001b81

Both calls are in arm_tr_tb_stop(), one for the
DISAS_NEXT/DISAS_TOO_MANY handling, and one for the dc->condjump
condition-failed codepath.  The DISAS_NEXT handling doesn't have this
problem because arm_post_translate_insn() does the handling of "emit
the label for the condition-failed conditional execution" and so
arm_tr_tb_stop() doesn't have dc->condjump set.  But for
DISAS_TOO_MANY we don't do that.

Fix the bug by making arm_post_translate_insn() handle the
DISAS_TOO_MANY case.  This only affects the SB and ISB insns when
used in Thumb mode inside an IT block: only these insns specifically
set is_jmp to TOO_MANY, and their A32 encodings are unconditional.

For the major TOO_MANY case (breaking the TB because it would cross a
page boundary) we do that check and set is_jmp to TOO_MANY only after
the call to arm_post_translate_insn(); so arm_post_translate_insn()
sees is_jmp == DISAS_NEXT, and  we emit the correct code for that
situation.

With this fix we generate the somewhat more sensible set of TCG ops:
 brcond_i32 ZF,$0x0,ne,$L1
 set_label $L1
 add_i32 pc,pc,$0x4
 goto_tb $0x1
 exit_tb $0x7c5434001b81

(NB: the TCG optimizer doesn't optimize out the jump-to-next, but
we can't really avoid emitting it because we don't know at the
point we're emitting the handling for the condexec check whether
this insn is going to happen to be a nop for us or not.)

Cc: qemu-stable@nongnu.org
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/2942
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 88df9c482ab..e773ab72685 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -7760,7 +7760,8 @@ static bool arm_check_ss_active(DisasContext *dc)
 
 static void arm_post_translate_insn(DisasContext *dc)
 {
-    if (dc->condjmp && dc->base.is_jmp == DISAS_NEXT) {
+    if (dc->condjmp &&
+        (dc->base.is_jmp == DISAS_NEXT || dc->base.is_jmp == DISAS_TOO_MANY)) {
         if (dc->pc_save != dc->condlabel.pc_save) {
             gen_update_pc(dc, dc->condlabel.pc_save - dc->pc_save);
         }
-- 
2.43.0

