Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1524527njb;
        Thu, 6 Feb 2025 05:13:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXe10+e66IBrOXvV7b9aQ0B+WDvSHzKxsgtCd92/rKq2LQSlaQXSLCbliwir5jnal7919As7PuMFiSOcg==@linaro.org
X-Google-Smtp-Source: AGHT+IGVm0xXPGuCgsrNGCVzlb/6Ebbvrc+s/mxybRvUfW0+Z23o4SaWa4jgYWH9uIC9tJ7kPsHu
X-Received: by 2002:a05:620a:1aa5:b0:7b6:d4b9:b5a7 with SMTP id af79cd13be357-7c039f97e8bmr1079001585a.6.1738847586182;
        Thu, 06 Feb 2025 05:13:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738847586; cv=none;
        d=google.com; s=arc-20240605;
        b=ZP02EwU2T7Qqx2IBbG81Fyn6FonmP5+/WK0FN1QGfMsmbS1VlGhRfzv/TnuTlp29BW
         AXHEey0qahwxsDVygr9X9PwalX0udL4FlJbthJ0c+P7N+1n4bk6Mb+zZ4g4gcMVTqThQ
         uKPcRn4+cF5NDQDSTzRg9JPlIC4IsH2VTHuxP9tDvEqvp22rCzKr/mw9Vjs8OTaTAqt6
         VmdiQWdPuJDjmA6vx+2AE/3eIIwx/6wLgWOnFopfpq5ZgJpOCh1M1CGbVKtr4lHu+90O
         rTiqIEKisByRbU63YghMHc4Cd9GE5U2r2eatH9Za5VqYVe+xOrczC4oPHKPw5HhUUg50
         4puw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RCLsw1b6jyw8lyUUykKTmpsXr484uY+OOog3P2Qta5M=;
        fh=7NsVx5R+L140HvZ0es4udPXCD2KdHoHcZm3kdyNBbE4=;
        b=Pjek+qLOseWZJLgozYX0IrAS+Mfqj+3oM4cvvGckOa/wlZM58yfLuVSViDH79KSHFJ
         PcI5zeTHBfbIPGmiFznhZAQuA/wmyyVBTrBEdmF/PY51fuM66S2EHACXjv39H3dbpqB7
         lzCDl1LmHN7kopZwS9c/YGUO1YU4hOp760/fUotYOiDISrjBz6YT07JJyIQoKrXnFqBh
         9ruK1XA1ixIVg7NMZQvaB5zErNsMgWccrNZy/YakyT/fnheqxL4cj4q7JM/APc0syk9a
         9ifDs5bKnHuggYi6pXo+ikh13cwHG5pDuP46I/9MoH0Yj3m13j2aNIVzJ7AlTMbNNyF2
         sK1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J/gMcN0r";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e94a81si112892085a.222.2025.02.06.05.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 05:13:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J/gMcN0r";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tg1fV-0005Fp-Gp; Thu, 06 Feb 2025 08:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fT-0005F4-Vi
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 08:11:43 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fS-00089z-EW
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 08:11:43 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43618283d48so6149395e9.1
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2025 05:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738847500; x=1739452300; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCLsw1b6jyw8lyUUykKTmpsXr484uY+OOog3P2Qta5M=;
 b=J/gMcN0rxw7o9NZXkGy2Yq7WbyLOvfDqz9PtSGMpGuNY7/HFFkXgvJ6/mucCL4z1ON
 bu1q4JnnogYfOLzmqE7vxgHUplnVvIEGeNGnnnsZxJJaoebFgv4n5fJ38Mk/KTLEyPKK
 4WVi6+k2nHdWPM5Hg21IxTzdUrlCtRnvkHVwvju1Fc5pl9Aw516qRqjFEyq5OaRRQ/Dt
 wJ+hzEtqEO4ahzhCBh7/nIyHSyWAXEbeQlFfPzyDxR0pvgZLAnyCkh6DBWKTEiUXVo0I
 SzqMnmVOFslr9NZ0/elBHerQX2KmyfhSXkaK2I5PVyc4O3qNZJUsHY+Ul3hQavPsv2B9
 yJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847500; x=1739452300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RCLsw1b6jyw8lyUUykKTmpsXr484uY+OOog3P2Qta5M=;
 b=F7X7MfkCnn7Bkyt3s/NqkR0kgjLmNue+k0rExaqo+5S/CtYCWA07QCP11dxqkkix+c
 Arc2Df2+d39tLRJwMScGE5QSmsHt2JEX3ZeHxKssItBLnzi/Sp6viqEXXHlB2CaH/F+r
 qLy3No39fdM8FguEWnOpS/AZUoz11iTeU3YBygDCRxq/2K2RGJPyrGzk1pM0uGGja/0d
 fx/bAp7wvhi/ZQo2uDB39Ia8I+jOOYKX9Q1yQMIPjenvHh+mVeglAvW6d4hXmdSIhaAX
 tVRj29xZbDI2UDhVpAw+bzIU0z8aUnQvKJ8Vm6ViWDM9SriaRGeK1BbUcInQxDbCR75u
 3PIA==
X-Gm-Message-State: AOJu0YzZSbbUlqbQSnF1k2sEq1V6DkAodlQy5TOeueodcZx3uNf4bavH
 71ePQ496Caa6UtQLRSuENabAXEACg/JNAL9Ixm07OVnsQhgXgIGo3dmCKDvH7T+nyHLmCv4Wx80
 kMBE=
X-Gm-Gg: ASbGncvxqBViHFFxo+9g4fhx/nMBwUJ6QNfHFXR2ZxW+ACu78fVHJ7cBTHxCHTUjywo
 VCqLPt4y06DOFY1r7azsN3xqGAhxw8DfkMst6wWp6PS8BiE5dYyn2MiG5N496n0Y9FsUSAaj52h
 jeCBkI/aMqengQcOahduVHokr/gM3kgqcodh4yzuLiv9xN+oRLK1sfmkHLK79hcQWHKdATVtLCk
 uc3VfS1pwZAMEQq/oCLu7Ivdy7Q+/0smvZOYIqng6vzMu6WcuogMvqTicJb6riaQR6WMAV/baKV
 3BMDbvYRZVvglzt6g9GQHVaL9Kc6sAk092mf/YnMW9xdgSEMmQJYtr6iLwOuoAvqRQ==
X-Received: by 2002:a5d:6d89:0:b0:38d:b7b0:70aa with SMTP id
 ffacd0b85a97d-38db7b072c4mr4191790f8f.26.1738847500357; 
 Thu, 06 Feb 2025 05:11:40 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd539c4sm1678293f8f.42.2025.02.06.05.11.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 06 Feb 2025 05:11:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 09/16] target/microblaze: Introduce mo_endian() helper
Date: Thu,  6 Feb 2025 14:10:45 +0100
Message-ID: <20250206131052.30207-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206131052.30207-1-philmd@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YyPm3gVTGXm2

mo_endian() returns the target endianness, currently static.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 0d51b2c468c..b5389d65b2e 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -708,12 +708,17 @@ static void record_unaligned_ess(DisasContext *dc, int rd,
 }
 #endif
 
+static inline MemOp mo_endian(DisasContext *dc)
+{
+    return MO_TE;
+}
+
 static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
                     int mem_index, bool rev)
 {
     MemOp size = mop & MO_SIZE;
 
-    mop |= MO_TE;
+    mop |= mo_endian(dc);
 
     /*
      * When doing reverse accesses we need to do two things.
@@ -848,7 +853,8 @@ static bool trans_lwx(DisasContext *dc, arg_typea *arg)
     /* lwx does not throw unaligned access errors, so force alignment */
     tcg_gen_andi_tl(addr, addr, ~3);
 
-    tcg_gen_qemu_ld_i32(cpu_res_val, addr, dc->mem_index, MO_TE | MO_UL);
+    tcg_gen_qemu_ld_i32(cpu_res_val, addr, dc->mem_index,
+                        mo_endian(dc) | MO_UL);
     tcg_gen_mov_tl(cpu_res_addr, addr);
 
     if (arg->rd) {
@@ -865,7 +871,7 @@ static bool do_store(DisasContext *dc, int rd, TCGv addr, MemOp mop,
 {
     MemOp size = mop & MO_SIZE;
 
-    mop |= MO_TE;
+    mop |= mo_endian(dc);
 
     /*
      * When doing reverse accesses we need to do two things.
@@ -1019,7 +1025,7 @@ static bool trans_swx(DisasContext *dc, arg_typea *arg)
 
     tcg_gen_atomic_cmpxchg_i32(tval, cpu_res_addr, cpu_res_val,
                                reg_for_write(dc, arg->rd),
-                               dc->mem_index, MO_TE | MO_UL);
+                               dc->mem_index, mo_endian(dc) | MO_UL);
 
     tcg_gen_brcond_i32(TCG_COND_NE, cpu_res_val, tval, swx_fail);
 
-- 
2.47.1

