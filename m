Received: by 10.223.188.70 with SMTP id a6csp5526299wrh;
        Mon, 28 Aug 2017 23:33:15 -0700 (PDT)
X-Received: by 10.37.172.167 with SMTP id x39mr2471257ybi.254.1503988395896;
        Mon, 28 Aug 2017 23:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503988395; cv=none;
        d=google.com; s=arc-20160816;
        b=Ea9IBMiHS7IVzEKzFi4Sk3ijOsoWnkhwADswG93rjV8pEG/NIZfwdoLWn1E3owepHm
         8JQSKaO//XkXmsnyvJPZDvZw/fcD9dp4CIaJ3UdlrIqm1TRyscN5/Kh3ZK2ODSV+JXrT
         lM7xjgKY16OejCAeygfU8noYVOIk77M+YbacKyRozH9qFRFD7gx5Hy23S0M7U1bLXWP8
         p1Pu8lplXnQYasi/ONccnuai4lwPqzsI9u5FBbscHGrzh3cYuXiz7GtY07aagcw22I/g
         +DFajhS+6r7MRFittWMIZ4Eg2pBN2bcoZeDeQ5zb7E3Xqv6Tnqt4gweqKx9s77xPpq7e
         vVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature
         :arc-authentication-results;
        bh=EeJB1MzeDnxqmqJAMcJ2s+Y6u9V1bZlXzyvC5M7QcVw=;
        b=NAlOc3xjew55RhaNVhkkkZdHSBsK1Xm4d5G2DRHIdbPBvHKnyMgK/kaFR//WAgtvWg
         zjbSkI805Pe5h50UON+F2TDrZYzxS/u04mJkc7kmzbfXxtMSNzdwUKYJ7NCH7tmqMf3w
         22ahumd2Jn9LqZe2kSF4+Ntf3uU/rAW6XtDfF9IbfFeG4sbvauBGdKOBbGSigJFBGzTl
         8Fudt68CUxj/go/kHe+/yNqnLllbQwCHIDTGcl1LJ5RA6BZ8/Fb2eB9OSwlrrARer19c
         tTpc7um3t6h+MEGrqBmJ9Lbs308I2PId3POik+T33KlVQ/VKaFNnozG5C+6HA33/mxvL
         R9VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WyZahPOg;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <bobby.prani@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r18sor1377489ywc.175.2017.08.28.23.33.15
        (Google Transport Security);
        Mon, 28 Aug 2017 23:33:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WyZahPOg;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=EeJB1MzeDnxqmqJAMcJ2s+Y6u9V1bZlXzyvC5M7QcVw=;
        b=WyZahPOg51JBo5OT8Qi478vvJxn1nGwJHZbzFUznVj2iqDlfJYHGn9+MqjMXyrPrhw
         tSqKPm6H2Gxxgkb6zIovIjlz36cTq0U/VwctF3DW8TLT0ONPtw+sRKx34Ov2DOT+/lFP
         DPDZ5QF1YcBWgqXAax/gyA0osJZiT8rmF8w/Ngliyy/5JWC2O4Jp81+YNoaORbEztQem
         O+4K1pc/CNxQt+4htjGT211uUl0MzmMOhfdmq17t6MolL03A8nhjzwNRLmHp28CWIlb3
         EDbqJMCjgEXDBY2y+VT7l4ClElKpXBDOSdt4Li9j95gtfZr8z/paFWR5w9HI93IdHBQ9
         iTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EeJB1MzeDnxqmqJAMcJ2s+Y6u9V1bZlXzyvC5M7QcVw=;
        b=kfTs4rW85Y84TklOd7wQwaMTuUHX8fu71CLu76Qut6Z8MWRCOu0+v9+IVtFw2UX/CG
         /hnW1cbbjFPg/kEVAAKaXZzCvMUW8T3zEoeLX9qkFWJZKSaOyLN+tmTfeMJPHEus+Ssh
         fG9F+CG+tAgu/9YqNLtF5X5TcwCVG48zAJh/yXOsPsD/XGbcYklHa7GKiFRW501dYyKu
         /4wKiYE0JcsY7oklT+ZG0GKNDNo+qsmh3kAsVit69mrol+ax/zHEB/gybpQ50QWJ6JPU
         HlPA2pYMuPwBcJ4GX99WWbn2TmyiG0nHGW0BiZKozHiS2z/6XxWGUFXCe+NwEpi8f1jz
         TnIw==
X-Gm-Message-State: AHYfb5hKoprEFztc4j3VgdHpLAl0Ds31gyzu+s7M+uX00zdxyyI50RJl
	x4GvysYM1ar5OeJFqG4=
X-Received: by 10.129.109.18 with SMTP id i18mr2557944ywc.271.1503988395299;
        Mon, 28 Aug 2017 23:33:15 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from localhost.localdomain ([98.192.46.210])
        by smtp.gmail.com with ESMTPSA id x4sm817923ywa.44.2017.08.28.23.33.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Aug 2017 23:33:14 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: qemu-devel@nongnu.org,
	rth@twiddle.net,
	pbonzini@redhat.com
Subject: [PATCH 1/5] target/arm: Remove stale comment
Date: Tue, 29 Aug 2017 02:33:09 -0400
Message-Id: <20170829063313.10237-1-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.13.0
X-TUID: bJD9yAb15xTo

Update the comment which is not true since MTTCG.

Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 target/arm/translate-a64.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2200e25be0..f42b155d7d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2012,10 +2012,6 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
     }
     tcg_addr = read_cpu_reg_sp(s, rn, 1);
 
-    /* Note that since TCG is single threaded load-acquire/store-release
-     * semantics require no extra if (is_lasr) { ... } handling.
-     */
-
     if (is_excl) {
         if (!is_store) {
             s->is_ldex = true;
-- 
2.13.0
