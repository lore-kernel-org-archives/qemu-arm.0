Received: by 10.25.0.6 with SMTP id 6csp468009lfa;
        Wed, 10 May 2017 13:10:09 -0700 (PDT)
X-Received: by 10.55.72.147 with SMTP id v141mr7875676qka.208.1494447009380;
        Wed, 10 May 2017 13:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494447009; cv=none;
        d=google.com; s=arc-20160816;
        b=mZ30rosD9Lb2QLkqc9NFMjCMxEbjBednB+PyHcfNsh4Us8SWjKAnjEGeVazeXMc8tF
         RSfMA47XMjtCEDwA8bNFAuxmZiDsVpM9xNQjImowE97QYbZCp9nD1UHIm1vBLCEjqH2g
         1cpBBnwL98axvjZSllbNAUOndbauPPcCuW/G1a1yDTyxJ7vn/qtR7WXTF/mhMA+f17oV
         XfPleuOPakrrJp3c68698oW6cz2WQD0S5U1KH+5yBS6HUcmhZCS5q6V5zA6hodgws4uJ
         fYtjQ8q010AeV7O2jqXB0lHJRLCTkzIEo0Ga7uXGokWMMZHJkLyGDXMAb0XqqSwepebs
         PKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=vIpk8wTZc1TnEmv0ib9+0baze68y08wSH3kzhbSNOFs=;
        b=Y6ET0bFoP2s5IRfgD8E+pUx+BUu3eKWFhdquIYEdyHZw+obuwHwAff+Z3jzxQzDYiq
         Ka2bn9sHeSF4CGWGIZjPxVe9+gfkcxqFn12A/Ygho+AK0KOgW41MnGJHnLtoRZ4JjHhq
         KxwTGjjivsBYngrd5kVRARxMJsWk0HVYgL3/x0jVIu0t21EEB2t/ouUZ8ZLBV3UOt4SZ
         wD9WREHyqzyuYuuqlXr+eRJlrJuA3ulpYJ/lMh76X4JSRU+x3WiQigBGd/lDbzkkWS/h
         s7FQw5ZgpVAgZ/VhNEApnTmM9e4QK7Y2Uyhn6fVsdeOKPmZ57RU5VLWgBseNXFZaMh+j
         j7OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m123si709qkc.25.2017.05.10.13.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 13:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Xw0-0002tU-Pi
	for alex.bennee@linaro.org; Wed, 10 May 2017 16:10:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8XsC-0008Av-QR
	for qemu-devel@nongnu.org; Wed, 10 May 2017 16:06:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8Xs9-0006Po-AR
	for qemu-devel@nongnu.org; Wed, 10 May 2017 16:06:12 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34983)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8Xs9-0006PW-4r; Wed, 10 May 2017 16:06:09 -0400
Received: by mail-qk0-x243.google.com with SMTP id k74so950453qke.2;
	Wed, 10 May 2017 13:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vIpk8wTZc1TnEmv0ib9+0baze68y08wSH3kzhbSNOFs=;
	b=nWvCPiI0k/LYyKeNlbgN8t9aLVWXkrvFuuBZ6JDqlZ3D5qMExoQnCyFpA05pyAc4Zm
	3GZUDtq86zgjYEQB1U2swibi1BP6Mf/bu8NwVjBge64MsOz0kls1psoZs4vBWiC4dFih
	EklBPwp4BF6hgzLejHg01T5RjZg75xWnONeGAPW9Jpmri/BKaoLlzVYrPpwz5fMJj9Ku
	ixUt8NL3oDJoZPrJ46IIorpOdCgaVSEbQneHKh/1Y/jle+mdJvwL51YGr3qpK8njluq/
	Q3ge302v5IPWy4LpHwQ73bui5+0b84qkw+q5VetiWEh/kHmys8KZw3ENkP6wDHMUDWY2
	mOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=vIpk8wTZc1TnEmv0ib9+0baze68y08wSH3kzhbSNOFs=;
	b=kmbuumYWPkDljx9eXtIldqzBsMkIf4WpPC8/ndTavKCp+qVk2g0QIN/0POAqFn9tjv
	aHevjLOmZ3oZigUgcdRxtirEpAE14A3avbfNNmu8BXSozq9uowUg8wUtvXT2vFAU522N
	9b3d26ntY3vxGBNRB9mQG2RR02hk8v8k5BGLQuioB4zDhAuOFW2obCo3Qw37K7YoiLui
	RD7weYalft5356JInNJob/FC4be2RkHgmEBfZzsOjoT+fasrQa0kRe1TsnW4XBpF1h/x
	GDlQyTJ1+rtjKYGwFKoVGmV28TfFgocVhzuyOTThG8A1jvPSX6ibWJSsTaEBKxPfXIJ3
	+PYQ==
X-Gm-Message-State: AODbwcAYBKp5wA3enzGH/QaT3NhNDGM+iJTiXbiq5vMwIywd7o4doejz
	VlZSNPZZ7ajsRw==
X-Received: by 10.55.40.158 with SMTP id o30mr7619764qko.210.1494446768564;
	Wed, 10 May 2017 13:06:08 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	s190sm377398qkh.57.2017.05.10.13.06.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 May 2017 13:06:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org
Date: Wed, 10 May 2017 17:05:29 -0300
Message-Id: <20170510200535.13268-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170510200535.13268-1-f4bug@amsat.org>
References: <20170510200535.13268-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH 2/8] target/arm: optimize smul_dual() and
 neon_trn_u8() using extract op
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HSxXUYJBFd/w

Applied using Coccinelle script.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0b5a0bca06..3230efe1be 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -339,8 +339,7 @@ static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
 static void gen_rev16(TCGv_i32 var)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
-    tcg_gen_shri_i32(tmp, var, 8);
-    tcg_gen_andi_i32(tmp, tmp, 0x00ff00ff);
+    tcg_gen_extract_i32(tmp, var, 8, 0x00ff00ff);
     tcg_gen_shli_i32(var, var, 8);
     tcg_gen_andi_i32(var, var, 0xff00ff00);
     tcg_gen_or_i32(var, var, tmp);
@@ -4700,8 +4699,7 @@ static void gen_neon_trn_u8(TCGv_i32 t0, TCGv_i32 t1)
     tcg_gen_andi_i32(tmp, t1, 0x00ff00ff);
     tcg_gen_or_i32(rd, rd, tmp);
 
-    tcg_gen_shri_i32(t1, t1, 8);
-    tcg_gen_andi_i32(t1, t1, 0x00ff00ff);
+    tcg_gen_extract_i32(t1, t1, 8, 0x00ff00ff);
     tcg_gen_andi_i32(tmp, t0, 0xff00ff00);
     tcg_gen_or_i32(t1, t1, tmp);
     tcg_gen_mov_i32(t0, rd);
-- 
2.11.0

