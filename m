Received: by 10.223.159.82 with SMTP id f18csp1525167wrg;
        Fri, 1 Dec 2017 10:51:39 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbgbV56RFosOzWozUntWLdyTycVBiRZsZw0chaqBJBAae523JBDuqa6jAG905qgMJVV9jUt
X-Received: by 10.223.149.5 with SMTP id 5mr5755929wrs.135.1512154299858;
        Fri, 01 Dec 2017 10:51:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512154299; cv=none;
        d=google.com; s=arc-20160816;
        b=Ej8PP2nSukeuSASJr1XTKW0+0YXKE6N9ds0ePcd7Ai7s9UQe6ZkzQ7Oh8Oo/xr7jFD
         IXgICMGTVen+KBNfvstPgF5zkY7DkqGRkhG3irNTgAWeKC+OyjLVRsGomQyRWtJ+sE5P
         wmL2WiD7DYwJo5EjNQ5+fGT+QVV911Ed3bx4Dd22VmI0OV2y9BSUyzlNi4g1yzQFMwdB
         4M4zlY1RnQjnAhN+WLgnAUBeqfr9Bl9y9nZe9/5h1QM4q2Sb6AdYN4i1YBm/w40B9U0H
         c9mBuPDxjdTKgiGO8D6YOql/kerzbC6jCnOX7Z9+2ClZRx9pcFI4QmptrqCCnCiAtaLT
         zfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=VQZLnYUWm2Yduks4NtznUJ1Rqu54Lc1qgJn0vWkla0s=;
        b=bjXpNgP0mHxP9t4qBL7Dr126Tws3svu0UwS1bSNiL2wtrCN5MwgjQHQV5wyamBVKqk
         x4vkmD2wL1UDSFLIhCldknJ1D9a65nGD1oxHhG6jNGVH08GsSegsvQqf0LXDUiotFVbW
         5DvhMgdhauB2lrvIBgfWsjLVTUVb9Ei7cJFcqhwQFMyn6R+7N80FitZwoUS3R7TDNC9f
         nPfrcOFtwJsiyIDfInhAO4MqoAMV5d54JaOp1KOEQB0TOWc2VpiFoB1oOuHNybFbBcrn
         qXrZuymqX8Qlym0G4HP4P6EM1xZvQ2I7Xv2YEDaPEIFiUa4J4tcjp/HdjedFp0e22HAv
         4hXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 140si1134053wmv.53.2017.12.01.10.51.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Dec 2017 10:51:39 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eKqPR-0007Bf-7X; Fri, 01 Dec 2017 18:51:37 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/2] v8m: make systick banked
Date: Fri,  1 Dec 2017 18:51:34 +0000
Message-Id: <1512154296-5652-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-TUID: /bkX6RjXr6iz

This patchset makes the systick device be banked between
security states for ARM v8M.

It is perhaps not the absolute cleanest way to implement
this banking, but the alternative (which I had an irc
discussion with Paolo about some weeks back) would involve
adding a feature to our IOMMU abstraction to allow them
to change transaction attributes, refactoring the NVIC
so that it exposes memory regions for its S and NS views
separately (to be mapped into the CPU's S and NS address
spaces by the board code), and then using an IOMMU region
to implement the "S alias that behaves like NS" memory
region. This version is less than 100 lines by diffstat :-)

thanks
-- PMM

Peter Maydell (2):
  nvic: Make nvic_sysreg_ns_ops work with any MemoryRegion
  nvic: Make systick banked

 include/hw/intc/armv7m_nvic.h |  4 +-
 hw/intc/armv7m_nvic.c         | 91 ++++++++++++++++++++++++++++++++++++-------
 2 files changed, 79 insertions(+), 16 deletions(-)

-- 
2.7.4
