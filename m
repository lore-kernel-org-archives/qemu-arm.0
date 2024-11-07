Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3910961njc;
        Wed, 6 Nov 2024 17:25:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXbzGAmdxPlkr6311zxfcv5eQc+TP5QBztObgKI6Kwr0bkJHNQ5QBlpYfCjwYJGyCohrEIlIEVgSF+Xmg==@linaro.org
X-Google-Smtp-Source: AGHT+IFS8CKIm7tHpgTDrE6n76IDJxmAlSCT2kb7kzIpjz9oBJ80MPH0JgHRKbxSWQtVD3mqqNVh
X-Received: by 2002:a05:622a:5c6:b0:461:43d4:fca4 with SMTP id d75a77b69052e-462b86a7b6fmr306449301cf.31.1730942712781;
        Wed, 06 Nov 2024 17:25:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730942712; cv=none;
        d=google.com; s=arc-20240605;
        b=bdqyg5fsY9h2XNKAAlqOkhA1/dDPeYk1oDoFRdgXw38nEHuAMoVcAE7h6N6HQdA7sj
         N2LiVeQm9ukWn9fqWeUEFRKrk9OQ9id3wvS1H9ZOFsZDrPifSJUYYTy3/UF3CRhkGl+y
         Bb98tEUqceJC10h123RbDPBbwTOKxs6BAI/Rwtcr2DsRd1DOinVc2g8smio1SPKvlcS7
         MZ9WgcgNTGtweJYAV1xDgTMfg9+zMI0rTKGYd5i9Z6Nby3No8Jpbs7WmVjbvDnMZmLI3
         ulCRceJ8CfoWUciP8s0oWj05/BEdQ7qARXJ0o6cj1ls5FlO/fa3BFv+sLVow3HDsaoyt
         9pNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zZt7LLYaGK4gLd7N4XPj6yKOClYWTX3p+vA4olh24GE=;
        fh=GQ32P8r8OBPLgjDnVzk508nDAH8bPgJcKgjO2GuT0Lk=;
        b=i1sRCIRpUDzXFoMMa67/+wr4nst7yQr4H/2gT45F2DYfR+NnQSffRN3wEcYXsXCWgm
         FBNK4/j3BMrh6YpRofknb0jjNPFiS3HzLkksG4H73gtOMqIqHAs25J2gpp7mF6iDLVls
         D5I3iCiflgzc/8cvRLJmPdECaDrGtnPUo5FPWVEjqHh9rXpr7EGjDrJkLE7BIIKSd6De
         QKEUZTTLByfBnyNW633K6ctEd52b7Qi9GMNElX0bjQtfk6r8/9+dYlr00VS2kGGfXbLS
         b9Lqmk6TGRaj1qEV/wSZNSFv96Xf156543QEAKDthEViYKxFPLnQqLCRiUBPBRnPWamI
         BHQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CRaKcrwR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff5c81c6si2928251cf.289.2024.11.06.17.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2024 17:25:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CRaKcrwR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8rFj-0006bn-PV; Wed, 06 Nov 2024 20:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rFZ-00069m-HT
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:23:56 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rFX-0003Dg-1I
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:23:53 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3807dd08cfcso358351f8f.1
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2024 17:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730942628; x=1731547428; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZt7LLYaGK4gLd7N4XPj6yKOClYWTX3p+vA4olh24GE=;
 b=CRaKcrwRj4RAj+0F/2CEgcl+aT3D2pKjqJGyElq60dHOniSdP9FVZQhJlE3P1zpn1o
 5PMPlsj9PIr+qyFCYFgWeVaHhKXwdCQf5R9SemDCjrgkZuAk1PxN2VFYBBH2nz/FO98a
 oxrOVnGakfbUB1TVsjloiPzMN4/HCzdlDZ898rvxNOD/zPByDvik2wWeJrroUBQGaVX1
 JN+mGEZkxuqKsky8IZksXYkVGL9Bisqtjz/VQQI83h0IDSBK2mSAS8A86IG9k3LuHXa2
 1fdSstUULYhHn8q472zLCbmUvQQniayh50+FwUn826Za/5kRmZbTY8kyRjubu5pAl28r
 Bcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730942628; x=1731547428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZt7LLYaGK4gLd7N4XPj6yKOClYWTX3p+vA4olh24GE=;
 b=grZ3/BeXfKjdU6i02BV1esoAK7wl+x4h9UYX07Z4WLnEKimK5fwNWdEEKHKND8vtfK
 raY5JZ/MFNwyNUOFljzlcZWbbHBlWyIkaRaE93K57oX0aXtaoteQeDH2drQyBsXv/fgV
 HGxBIq4/nvHp0yUdKGdV498vbMmTlAqP9ruHsOEGjCNbS//Djxd4aCZjGBj/v/ycLXJz
 hh3ylwJ5J5t/IYtzET2hqTJpypZEDzDv+G0fPzRS8u4fPw3BCcrmlocRCNlphr9FSYR4
 4Qk8eqmFA2SsAnlVzJXfelTqeUBRYcnhYIgsLdkSHbWn78k0hYm8TycToJMgFiLd5LCB
 0Bsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG7fugMfDCnX1Iom1o2+kQufSEYfRBlqFD2SeH5reqr7yhuaietd+4jXFJ6qmTu49BwAoRyeML/g==@nongnu.org
X-Gm-Message-State: AOJu0Yz9Vvm71TDR4ypDZUDflpoFfYDlQTHFozArmOYVxhHp2hqAiKAq
 2V2q9nNBY7iTudLM0hJEIw8aGVer9gCJTzjKzNRTDBnrsQaoVEoxJJEdV41jTDs=
X-Received: by 2002:a5d:64a7:0:b0:37c:cfdc:19ba with SMTP id
 ffacd0b85a97d-381c7a6bc70mr22195725f8f.28.1730942628446; 
 Wed, 06 Nov 2024 17:23:48 -0800 (PST)
Received: from localhost.localdomain ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed970d05sm249897f8f.1.2024.11.06.17.23.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 17:23:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 13/16] target/microblaze: Consider endianness while
 translating code
Date: Thu,  7 Nov 2024 01:22:19 +0000
Message-ID: <20241107012223.94337-14-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107012223.94337-1-philmd@linaro.org>
References: <20241107012223.94337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vNo/g3B6Vh9B

Consider the CPU ENDI bit, swap instructions when the CPU
endianness doesn't match the binary one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h       | 7 +++++++
 target/microblaze/translate.c | 5 +++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 3e5a3e5c60..6d540713eb 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -412,6 +412,13 @@ void mb_tcg_init(void);
 /* Ensure there is no overlap between the two masks. */
 QEMU_BUILD_BUG_ON(MSR_TB_MASK & IFLAGS_TB_MASK);
 
+static inline bool mb_cpu_is_big_endian(CPUState *cs)
+{
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+
+    return !cpu->cfg.endi;
+}
+
 static inline void cpu_get_tb_cpu_state(CPUMBState *env, vaddr *pc,
                                         uint64_t *cs_base, uint32_t *flags)
 {
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 0b466db694..5595ae4fad 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -709,7 +709,7 @@ static void record_unaligned_ess(DisasContext *dc, int rd,
 
 static inline MemOp mo_endian(DisasContext *dc)
 {
-    return MO_TE;
+    return dc->cfg->endi ? MO_LE : MO_BE;
 }
 
 static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
@@ -1646,7 +1646,8 @@ static void mb_tr_translate_insn(DisasContextBase *dcb, CPUState *cs)
 
     dc->tb_flags_to_set = 0;
 
-    ir = translator_ldl(cpu_env(cs), &dc->base, dc->base.pc_next);
+    ir = translator_ldl_swap(cpu_env(cs), &dc->base, dc->base.pc_next,
+                             mb_cpu_is_big_endian(cs) != TARGET_BIG_ENDIAN);
     if (!decode(dc, ir)) {
         trap_illegal(dc, true);
     }
-- 
2.45.2

