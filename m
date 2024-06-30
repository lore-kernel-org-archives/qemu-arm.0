Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1004342njm;
        Sun, 30 Jun 2024 12:01:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgSMZqbFjxucFa6oTnvWzao+bDtc0y1hzcmn/MuqAuDu90DioCUmZ80QTAwhX7HBosckbEnnMnSpuGgeGWfwsR87RLt34l
X-Received: by 2002:a05:6808:13c5:b0:3d5:5cc2:fd1b with SMTP id 5614622812f47-3d6b5686a17mr5367245b6e.56.1719774065226;
        Sun, 30 Jun 2024 12:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719774065; cv=none;
        d=google.com; s=arc-20160816;
        b=E7rNRC9le5mIEOaHBNKg91UNPdTmo5F0YUsS3PRH/wyFjp246f/0g/Tq9Ixi5J9P7j
         363uqYztwMjg8wU0puN2Vv84CcqGldup8mEorseWeWfkdc5w/L0MdEfG80r4GNr+aYDB
         Ppwg9oLfNZ179WKwUIprTEu/9UAtFmqcn102MOGb3B4I/bhxgPwQFDWezy+4PWfgkwS9
         e88fHJ31MAUQZiWGO2nQ0fYykbJVIn96qBub/HH9JijM/HXaKkvqNzsMJAsEOpEpB95Y
         2lAgvc3h9/r43XpFVyvHY9Tg63HPvMGSBFAJxhJdurowzOW4sHcdG+hzhz8yx89dS1ay
         dB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9p2fp7XdbFJ8aljrdGklD3IJ8hzw/a4pd+uON5c7MOU=;
        fh=J0zZPhRBCYlr2xZ8ptLOQKfM9FGL9ckSBqB/77uoEu8=;
        b=ScI8a66u95EnUeMHp5CcGgzs2+ucx9FbuzHa+ej00qopMD8EgSwXpG9el8zlgqFPkb
         U2bHSzR6XdGusQruWM7GtHB/AI04LTbi49JfXIMlG1QB0oIe2gFUBd69Fp379qq7tWyb
         +5+qJI2dYUZfUWcWq5l+RjzJp6DPVBRLuxOqz8w2Y17RTeUO6s9z/Qgv61ewOICX3DxU
         m0psfRy97NZYho/0T/V7ThxwaIysfmJD/GCSbbTcpwNOOVanTrBGmW1AU366tn+QTp/a
         pBgWBzLxkkoh8GjoEbbqZCbGaYVGxXFsEYeYiYErVzlmZGrWaD3y7B5pAO5GfT0t3KPZ
         zEtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fgyF3HlS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3d62f9b54casor4051559b6e.1.2024.06.30.12.01.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Jun 2024 12:01:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fgyF3HlS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719774065; x=1720378865; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9p2fp7XdbFJ8aljrdGklD3IJ8hzw/a4pd+uON5c7MOU=;
        b=fgyF3HlSr8WiF24mNEIeqLbgfbK84bF4IZn4bMrjqwxsuykGFrSCT/b3nHHbXd0HJU
         aZoLA1odQmzs46wf1NSiv45pdhL7sj+XLByTIrUB9AV3IWT5kHMzZzxqWg5xiVudUxOg
         GDPVSipaRKsTUDbcKyNXDys4khqo2a7GOvGdg3+z8F/lu0ktdF4pkuj43y7vDhMJzlmE
         381cCOtcF9TcmZmMjN0rYhzvdgxMDJiXf2zwObimDhm/mH8assc+n06LP0bZ0vGlYY1+
         gNbS7WeInUoelxKsnUPazgG71w2o2PisWCAXY1osPYnymhtl0GZo4htD1sPwRUIMHY7n
         c7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719774065; x=1720378865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9p2fp7XdbFJ8aljrdGklD3IJ8hzw/a4pd+uON5c7MOU=;
        b=bhmL77JAJDpixgKSjKmcoSKKwjBue2OPqGsZ8JIXg4HKg1sTbVMChB7nOpARVOzCS5
         DJkyfchXGGXEYyKr9stfVWpadqt/62TVGtMowGejHy+YBZyl2izWquaOIIo3N5ueJU8W
         cUEtGxaEvoXrYeHErysS2bjV/k3SlpbWc7oWaCJXbyMBp3G6J5xWtLs5i95HawbHYjqA
         R+JkMww6b+fqP/9zawYcf0AdyTTc+zJp6mWOx9H3/qgS/BKgMbLfrblL7E5uaWmqiC7x
         GvDmdY2kcRqwoIdLo+0I/hrMKo7AGrY0nf9zBN8ETYCdH6i0Q59F2rT5KsgGeZjayUda
         im9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbuGDWzCZWraXwYbQtkaxo9wxLUcG+3wG7mvubCHC1DMBOl3myl5Cz0i6SoVni4wEuyjADrIkk7OD+4Lbw/OzLezrgKF9C
X-Gm-Message-State: AOJu0YxuVi2ck1btSPkuBdTTLjwbSWJT7R27iFf59S0JGamdd2DS9m5H
	q/9dyy1yBOiVJMTlbyLnB6xUdQowci8EVCkAOUPHpvWGWQnb5E2RD47pBkjcmMsCSA==
X-Google-Smtp-Source: AGHT+IHzT+H34aAkrBWOGKQHXfHgGQmXLoe6idPG2FyXai0sBeH/tR4QlDnO4lIA8ijFx8OyYzqaFQ==
X-Received: by 2002:a05:6358:8a2:b0:1a6:35f:964a with SMTP id e5c5f4694b2df-1a6acf79589mr411758555d.20.1719774064554;
        Sun, 30 Jun 2024 12:01:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e7e4bsm5115641a91.52.2024.06.30.12.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:01:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 13/14] tests/tcg/arm: Use vmrs/vmsr instead of mcr/mrc
Date: Sun, 30 Jun 2024 12:00:49 -0700
Message-Id: <20240630190050.160642-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org>
References: <20240630190050.160642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZtrL7VdOyGH0

Clang 14 generates

/home/rth/qemu/src/tests/tcg/arm/fcvt.c:431:9: error: invalid operand for instruction
    asm("mrc p10, 7, r1, cr1, cr0, 0\n\t"
        ^
<inline asm>:1:6: note: instantiated into assembly here
        mrc p10, 7, r1, cr1, cr0, 0
            ^
/home/rth/qemu/src/tests/tcg/arm/fcvt.c:432:32: error: invalid operand for instruction
        "orr r1, r1, %[flags]\n\t"
                               ^
<inline asm>:3:6: note: instantiated into assembly here
        mcr p10, 7, r1, cr1, cr0, 0
            ^

This is perhaps a clang bug, but using the neon mnemonic is clearer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/arm/fcvt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index d8c61cd29f..ecebbb0247 100644
--- a/tests/tcg/arm/fcvt.c
+++ b/tests/tcg/arm/fcvt.c
@@ -427,10 +427,9 @@ int main(int argc, char *argv[argc])
 
     /* And now with ARM alternative FP16 */
 #if defined(__arm__)
-    /* See glibc sysdeps/arm/fpu_control.h */
-    asm("mrc p10, 7, r1, cr1, cr0, 0\n\t"
+    asm("vmrs r1, fpscr\n\t"
         "orr r1, r1, %[flags]\n\t"
-        "mcr p10, 7, r1, cr1, cr0, 0\n\t"
+        "vmsr fpscr, r1"
         : /* no output */ : [flags] "n" (1 << 26) : "r1" );
 #else
     asm("mrs x1, fpcr\n\t"
-- 
2.34.1
