Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp435082wrm;
        Wed, 16 Oct 2019 21:42:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyV+gbIwu8f4qvMMLn5178LZ8WvOqgOK0PSefELCGnhnnoGbw374IvTfkzmqBiOWyeuAc+7
X-Received: by 2002:ac8:738f:: with SMTP id t15mr1888262qtp.219.1571287373445;
        Wed, 16 Oct 2019 21:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571287373; cv=none;
        d=google.com; s=arc-20160816;
        b=QFEfmMlWI3yb4maXU/0ozFQov5d/erkbAeJGXBAXx2mpHHbH7x6cq+BbMiEnDZR1xi
         CEMk7b3PI0kI5ry4vXtZTY8WsQ8nr2ppmiHKkkjsANFN1vMgO+eDYDgPGzr9fbPKMKZi
         PxZBPF7akiY2eo51NkvScu2Mi6ATY7MmxLVGI8IurRSBGVQdgUcYpwUwWfkQKnXj3Deb
         cHJE5+kemImWdtOfqoAyoadZO8Ma7lK//UTJJ+UvNOJ7u5Kg4PjKZE0fimD0VH3mZHMr
         m3BjF5yM0x5RdDAqDMhKjZPdtA/tVD5KhJ3zDNin29PCaXRZ5/vgjIDXcAXLmeY2HwrU
         vlRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=VGGT3zBbzVc/cTftpyLP217c9MkvFdIixs9regxae10=;
        b=0+xjBrifPaJ73eUITxcOf9RROQMmcVStkE1Yg+G5gGFkCmasmCK+BDoyBfRIeLLkA2
         D4+Np13krEiqJZkt5g3ApRJT12iw3EFWoIpz31vYjuqFnQXZa1+B5bNPf9/JpR6POPny
         5Sq/yBeOA+XuV6C+UgVef+3Bgv/lI70KHmGIfane+UwntagZaf10q7wQ1MGG/S0rx9h5
         FSJa5oh3PV6/oJulJ6oQMYaSwiuvaSvPg6/vK3VLlGNvgz7WSjXIn9VSH76AA1gDB+PU
         KbDbxCR4GD6rYHdF4auKdYhZBMogeUTHcuupi6odOwXTKHXhtzAnI3941qwUGAY4eCvB
         QsyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZrUh6pSW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n36si944851qtf.309.2019.10.16.21.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 21:42:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZrUh6pSW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKxci-00076h-CE
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 00:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iKxcU-00074i-Nz
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 00:42:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iKxcS-00024C-Kd
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 00:42:38 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45253)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iKxcS-00023v-Eg
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 00:42:36 -0400
Received: by mail-pg1-x532.google.com with SMTP id r1so546471pgj.12
 for <qemu-arm@nongnu.org>; Wed, 16 Oct 2019 21:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=VGGT3zBbzVc/cTftpyLP217c9MkvFdIixs9regxae10=;
 b=ZrUh6pSWLktkvMbmRVVzxc8zMZFJfq0BgGhuGdGCzwN/hKtq68o0/ljkdRStxOuq6z
 IUjMU3FcxVTMnO6F3wxxPH+PPGvJOaXnTQOAKg7+FNrdfibPAxEZdQgIbO1FT4WGjj7h
 /BZeuZmXNSOr7zXiKTVD9gGnVfpEo+GET7dyU+olHUk0+ZjraIvcZ6hZvpZSVHjeK6Mk
 IejJ1NfVaHqdNTakupY979pp7abpWdWW1facPRGS36gWE2cx2m7yLSOkpRGVwyP0BYvb
 cfIdLOvVqcPz+fJEMCNuVGgnzwjU3GXdZpk2iocqX34zncc/MOaa1e8S7QLt9m7KtoE0
 Y7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VGGT3zBbzVc/cTftpyLP217c9MkvFdIixs9regxae10=;
 b=OFT6ocu+dUwAVtgi7M6VN0V1xd6aR/GmbMGIkTUmLv5OeHEdrWCVehWNlHWLQ4qVDo
 /ibhOvVxtjTdzpy3ErVutPPlFfPvOlrBAjUQXLIit6RHIbyZd9oNIf5O4GOzHeZQgYRB
 c3bvC5K8ohEvDTed/PxJnUClxTNXvrA1emNUaoqBCS7fEoBV996qNUm9LEQOzFlJ/Rhg
 8AjkopiYmsp3LZmtKM+kKmJFbMqww/AmrSHehjbfGJqyU2MBmyEYsUecRHesCRs/P76p
 qS8Fm772NR+c96GXhtql+YkqfA96eaxodGny2xpWMgBW0GEz3C5R9Afb0aPnbSll1bXs
 NBww==
X-Gm-Message-State: APjAAAXXFRfq354oZ0Rm3Znt03yYeScZVR273/aafMMrknMBl9e5f8PW
 LBVYsd/P4jfK9TBVGzSX9y20vQ==
X-Received: by 2002:a63:5a03:: with SMTP id o3mr1846145pgb.381.1571287354897; 
 Wed, 16 Oct 2019 21:42:34 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id n15sm718923pjt.13.2019.10.16.21.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 21:42:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/arm vector improvements
Date: Wed, 16 Oct 2019 21:42:28 -0700
Message-Id: <20191017044232.27601-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::532
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Q1CDp1FTqcu

The first patch has been seen before.

  https://patchwork.ozlabs.org/patch/1115039/

It had a bug and I didn't fix it right away and then forgot.
Fixed now; I had mixed up the operand ordering for aarch32.

The next 3 are something that I noticed while doing other stuff.

In particular, pmull is used heavily during https transfers.
While cloning a repository, the old code peaks at 27% of the
total runtime, as measured by perf top.  The new code does
not quite reach 3% repeating the same clone.

In addition, the new helper functions are in the form that
will be required for the implementation of SVE2.

The comment in patch 2 about ARMv8.4-DIT is perhaps a stretch,
but re-reading the pmull instruction description in the current
ARM ARM brought it to mind.

Since TCG is officially not in the security domain, it's
probably not a bug to just claim to support DIT without
actually doing anything to ensure the algorithms used are in
fact timing independent of the data.

On the other hand, I expect the bit distribution of stuff
going through these sort of hashing algorithms to approach
50% 1's and 0's, so I also don't think we gain anything on
average to terminate the loop early.

Thoughts on DIT specifically?


r~


Richard Henderson (4):
  target/arm: Vectorize USHL and SSHL
  target/arm: Convert PMUL.8 to gvec
  target/arm: Convert PMULL.64 to gvec
  target/arm: Convert PMULL.8 to gvec

 target/arm/helper-sve.h    |   2 +
 target/arm/helper.h        |  21 ++-
 target/arm/translate.h     |   6 +
 target/arm/neon_helper.c   | 117 -------------
 target/arm/translate-a64.c |  83 ++++-----
 target/arm/translate.c     | 350 ++++++++++++++++++++++++++++++++-----
 target/arm/vec_helper.c    | 211 ++++++++++++++++++++++
 7 files changed, 562 insertions(+), 228 deletions(-)

-- 
2.17.1

