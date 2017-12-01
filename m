Received: by 10.223.159.82 with SMTP id f18csp1519233wrg;
        Fri, 1 Dec 2017 10:44:43 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaq3jFvsSexYUsE0eoctqznKL6ZS62FXfrPyPU77E96kcjoQYx+wfd6WwN59c2CsYOjBPiK
X-Received: by 10.46.78.1 with SMTP id c1mr5959092ljb.188.1512153883164;
        Fri, 01 Dec 2017 10:44:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512153883; cv=none;
        d=google.com; s=arc-20160816;
        b=tMbw3PsiWIjcNcfGi4IOWIarNT+WYfORSX53e97tVhZQGKNLjE3pfisy9l4tEixINk
         QPY0mtMEyJqc8FanReZEOvprxx4NjqeUT7GRUKexUXBZrksDgKl5HKUX/daihZcC30UJ
         Mb97uwChQzrW5x3AzwbMVF4pZOAb36EPhRr3bqXSCM3mjIfXAHXnvTtHoilD8c7Op0jA
         p+lDoyYkDmeJnX9b4AR10Anv6hlSdGgtVQagsno0isvMnBzDWTStdTFFCigwnJvOuy4Y
         UIFbi5vGPpMisqihpaH7E/4PfCuqKyCLw6LcP/qsRgUEtF77LAWRiaDl8o+ic55hWZO3
         DKXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=IOS6nGWX/ipyhGpleL35ozix5xh0TmPTPL1q4+ul1GU=;
        b=VZFowJbiJKdaHos0jiNgcein+nNAZ/Lj5j7+wWRm2dBXuGqySiI/VmGWIRGmwfWJ0R
         TniwK019bgtaEKWYx8GpTKX/OxGJJRJDRrgCr6cHNP5AAoxQn1kB2hbGEg54xLxi8qwM
         qGZ4r7VV476ZG0zTQPT4sjGUOesjYZaGpTDHt0Kx1r+ZM38HtBk3Ul+kjpqko3H4+hqV
         Xqad+uyu5M1PnyntpwPGSv/2pCgdyo2dd6YROZFhEoAeFYPy3917z3l/5Ssa4kOd4Vrt
         VLwxV50AAHJcJ0rKnlp96zihiW8My6zboObthnAaXZ96Yta3fP7cp9RRC8U377M03g++
         uV+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id h9si2542244lfg.480.2017.12.01.10.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Dec 2017 10:44:43 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eKqIi-00076c-B7; Fri, 01 Dec 2017 18:44:40 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/7] armv8m: Implement TT, and other bugfixes
Date: Fri,  1 Dec 2017 18:44:32 +0000
Message-Id: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-TUID: gy1v8bdGWbuv

The main aim of this patchseries is to implement the new-for-v8M
TT/TTT/TTA/TTAT instructions (which take an address and do an
MPU/SAU lookup and tell you the security state and access
permissions for the address).

The first part of the series is some smaller bugfixes that
I noticed along the way, followed by a bit of refactoring
before finally implementing TT in the last patch.

(Notably, patch 4 splits the existing MNegPri and MSNegPri
MMU indexes into two new indexes each -- when I originally
added them I hadn't realized that "negative execution priority"
was orthogonal to "user vs privileged", rather than implying
privileged. This brings us up to 8 MMU indexes, but that
should not cost us any more than having 7, so it seems a
better approach than a more convoluted other option (which
you can find briefly described in the patch 4 commit message).

thanks
-- PMM

Peter Maydell (7):
  target/arm: Handle SPSEL and current stack being out of sync in
    MSP/PSP reads
  target/arm: Allow explicit writes to CONTROL.SPSEL in Handler mode
  target/arm: Add missing M profile case to regime_is_user()
  target/arm: Split M profile MNegPri mmu index into user and priv
  target/arm: Create new arm_v7m_mmu_idx_for_secstate_and_priv()
  target/arm: Factor MPU lookup code out of get_phys_addr_pmsav8()
  target/arm: Implement TT instruction

 target/arm/cpu.h       |  68 ++++++++-----
 target/arm/helper.h    |   2 +
 target/arm/internals.h |   6 +-
 target/arm/helper.c    | 268 +++++++++++++++++++++++++++++++++++++------------
 target/arm/translate.c |  37 ++++++-
 5 files changed, 289 insertions(+), 92 deletions(-)

-- 
2.7.4
