Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp696800ejx;
        Tue, 22 Aug 2023 05:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXNK87HqlzWc4RvI6Lo95XhZeB+XB4c9R1eeOvaZP2d/kD6Z1ISjmOdi6dkpcFmZMqFQpn
X-Received: by 2002:a05:620a:47b3:b0:767:f176:cf4a with SMTP id dt51-20020a05620a47b300b00767f176cf4amr10425728qkb.5.1692708768026;
        Tue, 22 Aug 2023 05:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692708768; cv=none;
        d=google.com; s=arc-20160816;
        b=IBSpc0JxyfM40VFhtmp2yvvYYJyi+48qNLC5l+92mGVg5/CKpNHkKropMSWP3OftRq
         YpSzQtyVmhWqI8dCxF9FCLdeDdw7+ein61dQXF1uDvnKe71sQ/QXJwQq/f68Fzk3plaQ
         fKWSRinRG8lxjvIVD8vju2kkjwZx3r5da62462exgGvUDv8hHDGCZCW0T48d6LwgWwXW
         /VgUo46BrHs3CagK7FsKn4F9VTRkkFzSoy/8w7kC8ERf80LMr4EsnF7wP0YLDSAI0tyn
         Q/RRPX/lpvR0jF47jsd45sgM9tKHJ2gvHHCGAV7qgrVg2GjdUkOBiN9NzTKZ/SQs/UIn
         hJ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rmGI6gsRX9IuSQ5oYPSIuzI0cu3lm8s84HSXfMSE4z4=;
        fh=WTNzBzBWhI6YyLjiFd1Gx/+Ggetq/7tfVgf3EfLcLKA=;
        b=WiMzFacE5ho8Is0gSPbnC+qRmE1qKccYKMA9ijZyN0jFy6G4rq/1OB0zFt7zYg3O5c
         LQIChm56cN15WHffP1LGq+ZAefcV1KJ5AoAbqEP+EMd5G52y4mdYbzUJyQWe/jK+vvRO
         0OVKMqswIZRfbCwyAE08k91jZKgLYqZx4Ed6Bi/Qys72N6UjBQZLQigeysTells2uHVA
         w67cYGkFzZydVScqsPDUYRUIfsmoonQ5yTzZArE/he4yy+JhJ/gFKkOJHQulv+oV7Kx0
         9iBCwn3uxLzimZVg+M5LmqZlmGME5v2ufvp074tQPvaQHMg0uJm8aewN2t7zrkcpSWiB
         jKrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQDUo4DC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020a05620a284b00b00767e5a321adsi6038398qkp.632.2023.08.22.05.52.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 05:52:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQDUo4DC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qYQs6-0001Ke-H1; Tue, 22 Aug 2023 08:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQs4-0001HV-KN
 for qemu-devel@nongnu.org; Tue, 22 Aug 2023 08:52:32 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQs1-0001nX-VR
 for qemu-devel@nongnu.org; Tue, 22 Aug 2023 08:52:32 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fe4a89e8c4so43062505e9.3
 for <qemu-devel@nongnu.org>; Tue, 22 Aug 2023 05:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692708748; x=1693313548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rmGI6gsRX9IuSQ5oYPSIuzI0cu3lm8s84HSXfMSE4z4=;
 b=TQDUo4DCoTIY73flQk21bftZrkdZvdX5YMCdthWNjOojiyre6lssNZwcuQRgQY9P4e
 E+TMpMX2SlFXuapk4Ya1Ca9RKHDNNUpE8GngRPidvxDBwVdEycz1+RLJVHPmk1sloP4w
 1qffMrDvRuzvIbHVXVUYdXNxGq9dZJ7qdEnDT5ydHnmsLXGLsGSbvP1N6q3MdZFoL5Rk
 FVOkY/GuvteZc+NCD70Ys4ZTF/NurV9QqOytbq8iWiobyaBmGmCe6rQXUl2kTtDPcfPv
 dNHgAHvazDbN2wpAdyvfDMDdymHAx4V65CmBQqWz0Eq/4WXwHJU1rM5AyWYYqEB6oxu5
 q7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692708748; x=1693313548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rmGI6gsRX9IuSQ5oYPSIuzI0cu3lm8s84HSXfMSE4z4=;
 b=EkVlZQ6v3qI7JWW59ts/7yPnB8qksrbLWSjGG4dK825THcyBfp0AQFw9b06Omzu7CO
 lgZC3+Db9DdZgay5eu7/yCiBVhO+M19LqQ//pyotgf/65yW09Y/9IctjeoluOCiQIUb3
 7JYJp6K/+JCatvNo4X+zfTUimdVCi1WsZKEAIiELaMvTrFBVgHnn/yTEy6uM1SvZHnug
 IevwXf7e/Fh/AOmuxetVgyo7410+OI/UsldcCWcs463Hca1AD95oDKI+TvvXlfLxb15X
 v8N3dJmRiV9E6Tj0VB8tV8tYrtb+cH6V/jLUIjis7x5RUZHzZqXg66QbSlpAaBS7lPVy
 IdFA==
X-Gm-Message-State: AOJu0YxAJ76QbBn/phH/ngrLZLq4UQ2/kFlKWtd4iQ1zJEEstcpenhJX
 GXPO/3ycHA4e5INLXItcWwP9fntYVrHc9GBFPF6gaw==
X-Received: by 2002:a05:6000:889:b0:319:8333:a2cb with SMTP id
 cs9-20020a056000088900b003198333a2cbmr6916814wrb.13.1692708747936; 
 Tue, 22 Aug 2023 05:52:27 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 y12-20020adfee0c000000b0031aeca90e1fsm11908722wrn.70.2023.08.22.05.52.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 05:52:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/12] target/loongarch: Use generic hrev64_i32() in REVB.2H
 opcode
Date: Tue, 22 Aug 2023 14:52:21 +0200
Message-ID: <20230822125221.55046-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822124042.54739-1-philmd@linaro.org>
References: <20230822124042.54739-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: orahLD2AIlVl

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/insn_trans/trans_bit.c.inc | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/target/loongarch/insn_trans/trans_bit.c.inc b/target/loongarch/insn_trans/trans_bit.c.inc
index c04806dc21..9d564a0999 100644
--- a/target/loongarch/insn_trans/trans_bit.c.inc
+++ b/target/loongarch/insn_trans/trans_bit.c.inc
@@ -111,19 +111,6 @@ static void gen_revb_2w(TCGv dest, TCGv src1)
     tcg_gen_rotri_i64(dest, dest, 32);
 }
 
-static void gen_revb_2h(TCGv dest, TCGv src1)
-{
-    TCGv mask = tcg_constant_tl(0x00FF00FF);
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    tcg_gen_shri_tl(t0, src1, 8);
-    tcg_gen_and_tl(t0, t0, mask);
-    tcg_gen_and_tl(t1, src1, mask);
-    tcg_gen_shli_tl(t1, t1, 8);
-    tcg_gen_or_tl(dest, t0, t1);
-}
-
 static void gen_revh_2w(TCGv dest, TCGv src1)
 {
     TCGv_i64 t0 = tcg_temp_new_i64();
@@ -161,7 +148,7 @@ TRANS(clo_d, gen_rr, EXT_NONE, EXT_NONE, gen_clo_d)
 TRANS(clz_d, gen_rr, EXT_NONE, EXT_NONE, gen_clz_d)
 TRANS(cto_d, gen_rr, EXT_NONE, EXT_NONE, gen_cto_d)
 TRANS(ctz_d, gen_rr, EXT_NONE, EXT_NONE, gen_ctz_d)
-TRANS(revb_2h, gen_rr, EXT_NONE, EXT_SIGN, gen_revb_2h)
+TRANS(revb_2h, gen_rr, EXT_NONE, EXT_SIGN, tcg_gen_hrev32_i64)
 TRANS(revb_4h, gen_rr, EXT_NONE, EXT_NONE, tcg_gen_hrev64_i64)
 TRANS(revb_2w, gen_rr, EXT_NONE, EXT_NONE, gen_revb_2w)
 TRANS(revb_d, gen_rr, EXT_NONE, EXT_NONE, tcg_gen_bswap64_i64)
-- 
2.41.0

