Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1800866lfj;
        Tue, 11 Jan 2022 09:10:51 -0800 (PST)
X-Received: by 2002:a7b:c74b:: with SMTP id w11mr3343576wmk.188.1641921051345;
        Tue, 11 Jan 2022 09:10:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641921051; cv=none;
        d=google.com; s=arc-20160816;
        b=I/1JIbRDP2t+IKBHddxFghlprDi7f1H2JaE/mWg654nj6hBra3B/wms6NB3LC5893H
         AkC7jrxb0WPL0XB4XekFZpcrQRxBACIeYdbUZpbz12nwuqTMQly6C3sx3YrolZu30ech
         HwkIvzgK161xxsR/dRiqB6uAUL7iv9gjOLAPwlNXECYddoYA1xg1VF0niAvFYiSBMsie
         E5gQG6W4a7pGy8Cvc00B0oxfsjG06gIJWoLQn1fvgIPZMVx2XKxE+YfDKon0LCa/lL+m
         Pw/vcZOFIQ2eTApjTyvdv8BQyfFWM524HezigfJz+eVJ4eRmbh84NxDIJb9A9yLr8UwE
         5ufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=UEBAvPKmww5qyhXWHyPh0DcpqRnG4rj2B1wWnUAe9YM=;
        b=KE61WZEJ+7ZeKEKOwVT5gCVQq9cnEbCpaaE2E5W9M36z2I30eL4imtbG6l0aoe+JOO
         zpgkZ9xdQW8ZjW8qFCejcO03iKfUQoZn5/W0sD0gc3cD7HU5dNKgluTn6tzIDkkgcjUi
         ZrYxc8ehhIk0HiLMZWXkgLRGhYkW5ch1Afky+U7XojP/usomCXznTXxFHUx1CpKf4z8L
         0PAxY27g371X+Ts5q95VXqxDOy/1Nzkg8VCuJUBKJyJQ4NspI+3JMfMJLvss6dIHk1ku
         ukrNg1buc6fEJKrgwbBhSiaxxxpicVCeD5PYbb6JyJTa1QynQD/MKboEKeSbQ7VzBqun
         sxlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kjrIiBaD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c2sor1545044wmq.0.2022.01.11.09.10.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 09:10:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kjrIiBaD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UEBAvPKmww5qyhXWHyPh0DcpqRnG4rj2B1wWnUAe9YM=;
        b=kjrIiBaDng6RPICuavgiKj7Feufx8wvRiHVJqKEyWR2eAfUaL0pothYStpNEYaj4/m
         v5oYkb0oR0g+6MD2X7tkDpc+1KFpDfI8DSFHmFUsjMVE+eWGqWCfmi0c2PZt0Kp+VR1P
         dkGLyYOe38HSYwQ4lXLS09FyS5fxrF9FjOpJWztOfKBH5kfmL6LjKcf/Zc3iiIEGI6jC
         d2c03f1x2FjFA+zBnl3iaOFgvKOCGa/t2Rrub2Zt6aoIBpSW/+4+WTKVryYvTuILBrjj
         bfpoT5+aqtY0pjDZZGadFb7oTatZkDF7zlHFuQQJawZ9Q1mApUSoVem//zx8xZmB7HJX
         7soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UEBAvPKmww5qyhXWHyPh0DcpqRnG4rj2B1wWnUAe9YM=;
        b=hAQlzNdk3JSe6BwYVyFzUa2mcr4Flr6bqaBaZDiWY4T/3dBEt/LD2kzIZp3McctQuN
         8IwD5x171xk8r0hW7fhfokw95Na8gSmq843Fu/XNKfgQV+22aUouAUnFi2z2dcZVMx6B
         IdMdi35y+e5fAyhUTvxqvyLB7l5jNjOebtZdqmtS47RAa45hi1d9Lw+92VfkA5FOPBzp
         S5aYzDz+wfBqYCAwpKlnEBs+7F/8Ljq8ihzURyxdzIKraQGNiQO5E+5cpz7RVQqGeqts
         MKSU7Lhwu4fTEWd3iC4KkzEmOQwVFCi8XUD4ZWSbYnjApX3Co5MwCVEBw/3kBRXdYXgk
         D6YA==
X-Gm-Message-State: AOAM533iNMzNXdP0vlOYSC9T9fwey7Cg++UoM9ZBh7I1gbmMJh3dlvWz
	dgFrdf09WOFGvhuy7Q5bhZ/BmNihTYRVFkbQ
X-Google-Smtp-Source: ABdhPJwd/igU2783YHTSTDO3m5gM40Ock0gTjFMQZjA3Ec0NjEYND/sp/53xnhbwOWrtu66U10yZ2g==
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr3257846wmf.81.1641921050996;
        Tue, 11 Jan 2022 09:10:50 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:10:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2 00/13] arm gicv3 ITS: Various bug fixes and refactorings
Date: Tue, 11 Jan 2022 17:10:35 +0000
Message-Id: <20220111171048.3545974-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ghnmpf1qQtFo

I've been working on the ITS to add support for the GICv4 functionality.
In the course of that I found a handful of bugs in it and also some
places where the code benefited from refactoring to make it a better
base to put in the GICv4 parts. This patchset is just the bugfixes
and cleanups, because there are enough patches here that I figured it
made sense to send them out now rather than holding on to them.

Most of these patches were in v1 and have been reviewed already.

Changes from v1:
 * first half of the series is now upstream
 * patch 1 now has the '1ULL' and uint64_t fixes that were
   partly split across two patches in the old series and partly missing
 * new patches 12 and 13

NB: I left the returns of -1 in patch 11.

Patches still needing review: 1, 12, 13

thanks
-- PMM

Peter Maydell (13):
  hw/intc/arm_gicv3_its: Fix event ID bounds checks
  hw/intc/arm_gicv3_its: Convert int ID check to num_intids convention
  hw/intc/arm_gicv3_its: Fix handling of process_its_cmd() return value
  hw/intc/arm_gicv3_its: Don't use data if reading command failed
  hw/intc/arm_gicv3_its: Use enum for return value of process_*
    functions
  hw/intc/arm_gicv3_its: Fix return codes in process_its_cmd()
  hw/intc/arm_gicv3_its: Refactor process_its_cmd() to reduce nesting
  hw/intc/arm_gicv3_its: Fix return codes in process_mapti()
  hw/intc/arm_gicv3_its: Fix return codes in process_mapc()
  hw/intc/arm_gicv3_its: Fix return codes in process_mapd()
  hw/intc/arm_gicv3_its: Factor out "find address of table entry" code
  hw/intc/arm_gicv3_its: Check indexes before use, not after
  hw/intc/arm_gicv3_its: Range-check ICID before indexing into
    collection table

 hw/intc/arm_gicv3_its.c | 492 ++++++++++++++++++----------------------
 1 file changed, 225 insertions(+), 267 deletions(-)

-- 
2.25.1
