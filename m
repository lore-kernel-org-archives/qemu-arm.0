Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4733580lfc;
        Tue, 1 Sep 2020 09:20:49 -0700 (PDT)
X-Received: by 2002:a5d:6406:: with SMTP id z6mr2575354wru.133.1598977249812;
        Tue, 01 Sep 2020 09:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598977249; cv=none;
        d=google.com; s=arc-20160816;
        b=N9XXKLNWWrWNiNHH3W0Rt1Ieko18mvEHx+R/gcHtJcD+FEXBuKb9UDWaUk2WUMhgyO
         XGKaN1R0GbmX63wElJVyUHklX2NSV73yIpbrmzCoeIPQFoadDxG4zfcvQDOzJgHqmKAE
         Y343aJ4+YLJ7Olty1TLEdDTFm4W1qWdpcKj2egy+UWrHTUE5qpc+2yup48R7DnK9EXCE
         ldofZKrO8CwKITWUFKnotNkvSSjrhZVzcYdLzx6oLVDfiSIaPQzPkKPV20kHxaW2Jdo5
         I6kiyFL0CEcwdQhjDKpi4AB7swP8bSJll3ZpsWq33Nt+qFwdn2zDF8NXf3BnUS1PQho1
         WTNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ReY/1n/ie6ZAtVbti6DfhgYHV+yHFNXl8nsuTTpy/mc=;
        b=a23OFVU6UK6wOBiOv6rzRZv2iBIYTTszQHlmAz8E+0ld1lBinDEEVFzVIWvl1yu+z7
         VMhijHlqcUFUV0UPymBa5tu6/NrrL6ptSV80mqTCzjNOCNOP9hOT1hjroW3ufVzdIXTR
         j2Il11KcmRWQv+pVdKRXnToVupQo3AGvnmO0NP2EnwrmezgIoMGYsFx8GpEO/iFosJWh
         cW14H6+A/65rmfK7APHDg17k6uvwxHrK44xMSM2YfPy/S7ljfFaC+DlIqMspGceHBf6m
         x+Tkzr2lUF6n0MadqfXRZiGDjw/4CWglARzgR4KGIoUt0eBuIaEONlTGHI6lwE3MBrpd
         RkIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adByaDUy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s13sor1146653wrp.26.2020.09.01.09.20.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Sep 2020 09:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adByaDUy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ReY/1n/ie6ZAtVbti6DfhgYHV+yHFNXl8nsuTTpy/mc=;
        b=adByaDUyDtVOLywiiEFsODHpvSzhmtxF/2bDQZvjuketfYh1Parrf2p5hD9yQhuKhc
         D7nB6hY/p79E2xjWp4ODtLjkUYj1JqFym2C9CMybDiajF+azQW8mEcQtHiXz3iTjbJXz
         sHZJ2EN4H/q6HLzk10hjtMBbXJ7I/NeFZS1OY9qmamLmJcHGlx4UR/RylRYJ05Hl/NtE
         rjkrLNfqVeO54i6f/PZGl384YVamv49N8EqQDJ5uUkwGDeCmjPg+qQGuCHB6U1qBjJC3
         AAIUAY2/cIyaMkF+hhuAB5KTNSEcKFIXOqL378oXhSutiY1yDDQcSVQ2tgHvvmwboknc
         qA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ReY/1n/ie6ZAtVbti6DfhgYHV+yHFNXl8nsuTTpy/mc=;
        b=TM+16g8M1QH/h5xRltwwAfs+S4f2MMjBjtPNmg4bjgB0wIZmFTRR1O9sVJO9HvxTVf
         0JL7c0BAqXtWStxZEauKXArv31OLA6zwg0+mjyyMmxPQQiUg/AR2NJg9kf6YfFuFIEWA
         x56AAWAFpKnk+3VRxdORAMo8NmZutkcITSvg5/T8N9GJ06KFglByquaox1McPqZJp8gV
         GTGDVX9I8gaHtGFtWvntPOduKNH/XptkcX++7h2KQ0TYhnzK9NYCQcR3jQoYy3m6yVSX
         E24Q75BGdXrHirpDZ6WV2F80eVeejhDxcQ0+p7TDXnVH6JF4jom1dQOzINhzerRgGrxi
         xtoQ==
X-Gm-Message-State: AOAM532IP5s7qOGMveOWnyL2DvClpUbwM7pnSoTWZbdS/yPbEDfAR/3K
	V77hlAIbOZCH73b85J2rZDtHVoLbVaf5qXX9iW8=
X-Google-Smtp-Source: ABdhPJwCfOsaFzrv2Knov8p1mVUoCOrr+bNEO7w9W8cQJRhcfIy3KsCHAb2Do03bR02MhSaAGRJWIQ==
X-Received: by 2002:adf:fec7:: with SMTP id q7mr2673792wrs.293.1598977249555;
        Tue, 01 Sep 2020 09:20:49 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id c10sm3145097wrn.24.2020.09.01.09.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 09:20:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/2] arm.risu: Correct VLDR/VSTR U=0 patterns
Date: Tue,  1 Sep 2020 17:20:45 +0100
Message-Id: <20200901162046.32670-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200901162046.32670-1-peter.maydell@linaro.org>
References: <20200901162046.32670-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BNNbstnSODm8

Correct the VLDR and VSTR patterns, which claimed to be setting U=0
but in fact left it identical to the U=1 pattern due to a
cut-and-paste error.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Somehow the pre-generated test binaries I have from Alex have
U=0 insns in them -- I suspect this got fixed locally but never
made it upstream ?
---
 arm.risu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arm.risu b/arm.risu
index f8b6deb..43a72ae 100644
--- a/arm.risu
+++ b/arm.risu
@@ -757,7 +757,7 @@ VLDM A1c cond:4 110 p u d 1 1 rn:4 vd:4 101 x imm:8 !constraints { $p == $u; }
 VSTR A1a cond:4 1101 1 d 00 rn:4 vd:4 101 x imm:8 \
  !memory { reg_plus_imm($rn, $imm * 4); }
 # both A1 and A2 encodings, U = 0
-VSTR A1b cond:4 1101 1 d 00 rn:4 vd:4 101 x imm:8 \
+VSTR A1b cond:4 1101 0 d 00 rn:4 vd:4 101 x imm:8 \
  !memory { reg_minus_imm($rn, $imm * 4); }
 
 # VLDR
@@ -765,7 +765,7 @@ VSTR A1b cond:4 1101 1 d 00 rn:4 vd:4 101 x imm:8 \
 VLDR A1a cond:4 1101 1 d 01 rn:4 vd:4 101 x imm:8 \
  !memory { reg_plus_imm($rn, $imm * 4); }
 # both A1 and A2 encodings, U = 0
-VLDR A1b cond:4 1101 1 d 01 rn:4 vd:4 101 x imm:8 \
+VLDR A1b cond:4 1101 0 d 01 rn:4 vd:4 101 x imm:8 \
  !memory { reg_minus_imm($rn, $imm * 4); }
 
 ########### Extension register transfer ###################
-- 
2.20.1
