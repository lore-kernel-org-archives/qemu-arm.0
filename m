Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6886546wrg;
        Thu, 13 Jun 2019 07:37:44 -0700 (PDT)
X-Received: by 2002:a5d:53c9:: with SMTP id a9mr5989013wrw.323.1560436664151;
        Thu, 13 Jun 2019 07:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560436664; cv=none;
        d=google.com; s=arc-20160816;
        b=ktHuZ5wDYYU3HQOlYGPrWsr34mdUc92g9evaTkoMahoyUlfhk/B+HLlcDIEwxHVaNl
         JYB6RBZar6NeDYY6hPXejYDVV+y9GCW/VgxmMXDsvfGKf70MJk6lMoGq7wDM3GCqhtaF
         AfPrh0u+MyM3XdIrRd3bpxgrSe3DXQm/qi901wx2w9QfDmsT1pDKiboT6lLaAoufTKD9
         L/AI7eITYHhjTpZ/w7Jw7cTLMhcKJG4NTWzJyyvbwwgYpYihrjnVI/b8Zarzl7igOtXL
         3Z6d3RslFyy+6DNGLTqbRDkgIXR3Oh2QNczi2fOcroSqBc3nZS2eup4e9Cr2nex45Mo6
         eQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=vg7Xo5/UC1VbFfsv57lBg2sMr1tbPeBB7dgbx/Rj6+I=;
        b=rFm9ZlbSYa2+b2XlndNEnRh3glUU48Xz4VoAUUzPlklAYny2IdVlwDIdtsEogZxEUJ
         ANa7W0pnJaFJqY7Gi9RWxwaRh1+UyWWPdeSfHBrrYfVTyD6ipr6HDkzwaBCsBl3Qz+LM
         SOvn0hQj+/mWfSxQwpKuubhaJl6KOQhh7M+x4dtNANyL8OfRw6KpnIIvg2iVsK0bCRhK
         hFoZwEafY+cjbtIb+u/gtOuo6IK5Be7jgQCa6hlvPwF3IXecA6VMq5XNRmy5MV/KY79/
         kxkOdWMhpgUMxk7NhCtkq59BybJ8BiT8qN6PgWGTxllYZNqkcyjHC4XIOZVjbGdXzB+e
         IfiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PpQysJr3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v13sor66030wrs.17.2019.06.13.07.37.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Jun 2019 07:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PpQysJr3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vg7Xo5/UC1VbFfsv57lBg2sMr1tbPeBB7dgbx/Rj6+I=;
        b=PpQysJr3UfhlfG8/PoFpVoWNqOdZpq+eqslUhspPaWdgr+li5AzXV1FXe1fmmNBgwz
         AclDX0N/iPz4q0+k+zSQ63PuQIBONq6zSN3qfyHhQncfeYjwEpXRYhAoO+BgHdzT/oI+
         xk+MB+h3NE+mWSMpkWRsnAjlqEKwhihAnl6PJERaLCNYVbYQfPe/l2auV+VufFNuqHGO
         FqJCY+RNadEJJU2cilCvG0nTKSCTkBIfmFbVL6plz94u8SZFq+3CsiO5mBwsXyqe4smo
         Yj3pWoB9ozWNOMnxPeLe0bwVCwPj7drlWEHnpRC6QdkEx2cOrXh4vXSMYXWEBNlUOL44
         ITlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vg7Xo5/UC1VbFfsv57lBg2sMr1tbPeBB7dgbx/Rj6+I=;
        b=ed3OLix1f5F+tZRGOVlAHP8CV/9wdaHkDyMp7UIljpKmYG453bG1xAqky928mh+H8L
         At4v9PFQXIwjlTQVdTIX2X1DICRaKSpCM4qmH1MV/1dyHpUOLg8EPPu+dx5d/NSp9eUc
         4xE1TrVtx4vc5DkUqW1BgYC61HWDDqVvxlx9asTc0/Lo4Bvsp69kw7TCFakAy0QzEbrm
         9Su4LE1bsif0NyRHmGnqU1474zskfjBnCwslo/1a18ATzscwLZu4l6pl/NWBvsuwY+q0
         niLAxO2JejvRQLLKvFilLLCnn39etpt9e2Yn3tz1qkcmRQCGyS6CsSQQb5qmiMaeNvj4
         3Khw==
X-Gm-Message-State: APjAAAUxdZ7383djDUlB4CI9sCamPT7dxZ8xpr2yMqbyCXB7HY2Kihdh
	Ty/XY1sCJq0GmPqKzhX5L/3D9nOx
X-Google-Smtp-Source: APXvYqxZ6otB1rSV1A6SDeJeENHh83bcRYL2/YgH/F9f4fetn0N03a1lJhOlijFuMTq/qmkkslfGMQ==
X-Received: by 2002:adf:9023:: with SMTP id h32mr60639641wrh.95.1560436663820;
        Thu, 13 Jun 2019 07:37:43 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id l12sm3080344wrb.81.2019.06.13.07.37.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 07:37:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [RISU PATCH] arm.risu: Avoid VTRN with Vd == Vm
Date: Thu, 13 Jun 2019 15:37:41 +0100
Message-Id: <20190613143741.15128-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5gqe6QWBsGvn

The AArch32 VTRN instruction is specified to give an UNKNOWN
result if Vd and Vm are the same register; avoid generating
this in risu output, as we already do for VUZP and VZIP.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Alex: this pattern error is why we don't pass your
testcases/aarch32-all/insn_VTRN__INC.risu.bin when compared
with a real Cortex-A7. You probably want to update that.

 arm.risu | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arm.risu b/arm.risu
index 9009e6b..c16d245 100644
--- a/arm.risu
+++ b/arm.risu
@@ -613,7 +613,8 @@ VCLT0 A1 1111 0011 1 d 11 sz:2 01 vd:4 0 f 100 q m 0 vm:4
 VABS A1 1111 0011 1 d 11 sz:2 01 vd:4 0 f 110 q m 0 vm:4
 VNEG A1 1111 0011 1 d 11 sz:2 01 vd:4 0 f 111 q m 0 vm:4
 VSWP A1 1111 0011 1 d 11 sz:2 10 vd:4 00000 q m 0 vm:4
-VTRN A1 1111 0011 1 d 11 sz:2 10 vd:4 00001 q m 0 vm:4
+# d == m gives UNKNOWN results, so avoid it
+VTRN A1 1111 0011 1 d 11 sz:2 10 vd:4 00001 q m 0 vm:4 { ($d != $m) || ($vd != $vm); }
 # d == m gives UNKNOWN results, so avoid it
 VUZP A1 1111 0011 1 d 11 sz:2 10 vd:4 00010 q m 0 vm:4 { ($d != $m) || ($vd != $vm); }
 VZIP A1 1111 0011 1 d 11 sz:2 10 vd:4 00011 q m 0 vm:4 { ($d != $m) || ($vd != $vm); }
-- 
2.20.1
