Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3662793wrg;
        Wed, 5 Jun 2019 14:00:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqysv2qdRnLpKi5O9sT8C+4MGOZmMAeOCgHA0lorCZ8g8vkk5KIaU8kDZwhQtEhTh5IrERKH
X-Received: by 2002:a0c:ba97:: with SMTP id x23mr35025840qvf.133.1559768456738;
        Wed, 05 Jun 2019 14:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559768456; cv=none;
        d=google.com; s=arc-20160816;
        b=cVAToR9eF85B/29Hng0WTGl5oCVH2oEIl1PwNzYHX7zsWqGe3Cb1breJ5zXsIOWnbS
         ZYPQrwa+YXqZ6JaObJZl0wXFyxhzYO3yoq9LCj/en6adLXnjHfa8LqPrBrzEhXchxOlC
         /JvjSfVjSr7zZaT1/dw5SF9SS8cPjuN9PsI3eP6amLxY5Y0ybvhVpR9SOo6LHL6zOO9b
         LeONrUXT7LgQ+yfMcLlG8iT7zY0zDTAcImkQer4jrjsgs7EonukLOvH665Tp2Cl/lPiX
         KNO7VJFaoXv1uKfBcagdIyoYC4XJxdx9SdAXVZNGDgnSWSJVbZCjDjycIgzeoaejAkjO
         J+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=W6HDhQJMBdxe5wJFgzRB2+t1x+cTtvvyIgBUjEbLKfs=;
        b=qX5xtNLCrRUWh82Aq0wMtEG+JULDxHvMzzU41a1XgVJBocOkmyXgPjlSTkmNxgG+ef
         aY9TlYNyWqDL61o3OipbydMMYoqsP5JS6HnaVD7Y6laZF/jXOxVt4DrNZVnwYF/Zgmew
         4xp+JSZvSKxmuXEiO0LyoPCdum35vJRH4LN1ahBtV6lkP+FIKiIlswAP2LfJH6LReUTE
         vn92lZCtj5dLqLgJov09QFtjN10+8f8pRkBrdycDmz9Mhsc/1++UHO9MsSaeHVT4ndsr
         GNocmgJAFBWe2/WpiTcj65qoKVvnjzu1/7vkxpEAcPOPkZrm3GwVBlNKcd7D1DzoTLlb
         6Uyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q4HL3wPq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20si141162qvd.35.2019.06.05.14.00.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jun 2019 14:00:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q4HL3wPq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYd1k-0000me-6x
	for alex.bennee@linaro.org; Wed, 05 Jun 2019 17:00:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYcyA-00068g-8f
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:57:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYcy9-00082H-1p
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:57:14 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34602)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hYcy8-0007zs-PR
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:57:12 -0400
Received: by mail-ot1-x341.google.com with SMTP id z24so2087252oto.1
	for <qemu-devel@nongnu.org>; Wed, 05 Jun 2019 13:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=W6HDhQJMBdxe5wJFgzRB2+t1x+cTtvvyIgBUjEbLKfs=;
	b=q4HL3wPqkPUTCX1upK44DzH2jCj02ieD6b0YpeC0R/MEdah0OXekz6TmD6F5cWnHpE
	9RKOu8xmj0bENhBs1Utf2n9JyQTVzR2ItMaIVhWx5tNkXHlEeDG3eAZw9ibK+x+ScRdM
	kDYpw8DTmEqpcMrVAgH7oA4QwyNv+JmlqW94/hbv+AA/RUMotwdFYQKSG4bQA68p+iCa
	pO5cmfXp8XrrZB9GIUERzJBXHl3iYdd0siEL4Yawnrd7u2uxRG9PS6BJw2Cfyf7Hf0yR
	rhe6mW+swv5WxkrLKYXgP+mIbms/UobnPZ3o9ez9hg54ThKb7fFXFnNV4eM9KE6fqLVg
	zypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=W6HDhQJMBdxe5wJFgzRB2+t1x+cTtvvyIgBUjEbLKfs=;
	b=OT/DJVnnoqvsAX2qtMU+gfhOg14gGvE/6/iiPsQZHZQu32f5EWJnx+NdzHu05MPBWM
	3J5VIM29BVl1F9BJ2Nxx3lIpqIcVQwIeWMKJnnL7YzbDgopTiHrkvmte8iNTRKGFiVEB
	5RrCk460rKfxk2+byLK9ezv8vxqRCREZ6ErP+imqjOgHfFjRkejP71GgH/4zc4Mjp4GM
	UhxwqTsnyn/us9K1cFaULx4RGr3Bxf5ATrw40jCifjtGk+IFRDN6kC1rI3ZwsAFBy2/5
	r1HRKSl8TU+vPMg3dYctSSDra2mgHHkEGTThhPVIx6wxvJBSaLHG38zrTZo9YcMF7JJA
	+72Q==
X-Gm-Message-State: APjAAAXgJqxgWBsvfaFavmxUYF0uq7yTtNBDJSzWdWlZvldpEpWiNL1i
	ySGdjLvx/1c9rSiXdMb63Yyu7yh4YsRWIA==
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr11408179oti.122.1559768231571; 
	Wed, 05 Jun 2019 13:57:11 -0700 (PDT)
Received: from localhost.localdomain (200-56-192-86-cable.cybercable.net.mx.
	[200.56.192.86])
	by smtp.gmail.com with ESMTPSA id f5sm7414155otl.51.2019.06.05.13.57.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 13:57:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 15:57:00 -0500
Message-Id: <20190605205706.569-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: [Qemu-devel] [PATCH v6 0/6] linux-user/aarch64: Support PROT_BTI
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U+phW13DOy7W

Dave Martin has recently posted a kernel patch set for 
supporting ARMv8.5 Branch Target Identification in userland.

  http://lists.infradead.org/pipermail/linux-arm-kernel/2019-May/654654.html

While that support is not yet in the upstream kernel, it looks
to be close to its final form.  Note that the patch set spells
this PROT_BTI_GUARDED, but review suggested to rename to PROT_BTI.

Changes since v5:
  * New function to validate the target PROT parameter for mmap/mprotect.
  * Require BTI in the cpu for PROT_BTI set.
  * Set PSTATE.BTYPE=2 for the signal handler.
    Adjust the smoke test to match.
  * Tidy up the note parsing.


r~


Richard Henderson (6):
  linux-user/aarch64: Reset btype for syscalls and signals
  linux-user: Validate mmap/mprotect prot value
  linux-user: Set PAGE_TARGET_1 for TARGET_PROT_BTI
  include/elf: Add defines related to notes for GNU systems
  linux-user: Parse NT_GNU_PROPERTY_TYPE_0 notes
  tests/tcg/aarch64: Add bti smoke test

 include/elf.h                     |  48 ++++++++++++
 include/exec/cpu-all.h            |   2 +
 linux-user/syscall_defs.h         |   4 +
 linux-user/aarch64/cpu_loop.c     |   7 ++
 linux-user/aarch64/signal.c       |  10 ++-
 linux-user/elfload.c              |  83 ++++++++++++++++++--
 linux-user/mmap.c                 | 122 ++++++++++++++++++++++--------
 target/arm/translate-a64.c        |   6 +-
 tests/tcg/aarch64/bti-1.c         |  77 +++++++++++++++++++
 tests/tcg/aarch64/bti-crt.inc.c   |  69 +++++++++++++++++
 tests/tcg/aarch64/Makefile.target |   3 +
 11 files changed, 387 insertions(+), 44 deletions(-)
 create mode 100644 tests/tcg/aarch64/bti-1.c
 create mode 100644 tests/tcg/aarch64/bti-crt.inc.c

-- 
2.17.1

