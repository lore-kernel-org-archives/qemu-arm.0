Received: by 10.25.0.147 with SMTP id 141csp139807lfa;
        Mon, 20 Feb 2017 10:41:15 -0800 (PST)
X-Received: by 10.28.52.210 with SMTP id b201mr19771933wma.130.1487616075068;
        Mon, 20 Feb 2017 10:41:15 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id i128si13328886wmi.52.2017.02.20.10.41.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2017 10:41:15 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cfstd-0005pz-Ql; Mon, 20 Feb 2017 18:41:13 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [PATCH 0/4] arm: Fix M profile MSR/MRS
Date: Mon, 20 Feb 2017 18:41:08 +0000
Message-Id: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-TUID: 54TEjhRU1MbU

This patchseries fixes up some deficiencies and one nasty
bug in the M profile MSR/MRS handling.

The first three patches are just cleaning up the decode
so that we UNDEF where we should in the MRS/MSR space
for M profile -- this won't have caused any problems in
practice since real world code doesn't generally execute
UNDEFfing instructions on purpose.

The fourth patch fixes a nasty bug that I introduced in
commit 58117c9bb429cd which broke APSR writes via MSR,
and brings them into line with the pseudocode by allowing
writes to the APSR GE[3:0] bits when the CPU implements
the DSP extensions.

Alex -- I should have paid closer attention to your review
comments on the patch that became commit 58117c9bb429cd;
sorry about that. I knew we didn't get the GE[3:0] stuff
right yet but I didn't spot that we'd managed to invert
the sense of the SYSm bit 2 test in that patch :-(

thanks
-- PMM

Peter Maydell (4):
  arm: HVC and SMC encodings don't exist for M profile
  arm: Don't decode MRS(banked) or MSR(banked) for M profile
  arm: Enforce should-be-1 bits in MRS decoding
  arm: Fix APSR writes via M profile MSR

 target/arm/helper.c    | 26 ++++++++++++++++++++++----
 target/arm/translate.c | 26 +++++++++++++++++++++++---
 2 files changed, 45 insertions(+), 7 deletions(-)

-- 
2.7.4
