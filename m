Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3249296wrg;
        Sat, 18 May 2019 12:34:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw9KEUpHO0jgjBnJ/Ppzj4hSBdOy5HmBMKrStcaov8ApxWtNfNInTAs2kRkyPd580/fJX3t
X-Received: by 2002:a17:906:f103:: with SMTP id gv3mr1076349ejb.44.1558208046655;
        Sat, 18 May 2019 12:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558208046; cv=none;
        d=google.com; s=arc-20160816;
        b=rtynOmU7TA+w2jfAm2E3tx1B9mmw47cNw+DfPnVY5pY4vfOCsCJWiyrk59ITO0WsFv
         0Ikzk3Db16/kj6OmnFvXzwFDz7Nmt0w91THq8GxkCptTfuJQ/F8TnG6sJJHbVf4l/OKJ
         5AY/ayFSzIID+wqGJaDwWEfS6a4sCu1EuCjpP4uJhe0HFmRSr1z9qawRaj0DR41lDOlB
         oqHUWd19BPE2z9Koh9WaCjGmhAITlYsM+YX5i/qNrGhUIhsoqm3empxiNMRl7fbHOc1M
         MVsDrBILdC6kBJT/77lS/qkNGCpby1Pqnz4hE/WwtmoZ4AvKPHA1qpoOA5gFZt7ARutI
         LYmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=kNWizZq2qCo4VoGKtgyncVFOYpv0fo/wpkn1n6HcdBo=;
        b=dYczod7kFhbficW9+VBnr4ckOc+KgoVw9eF32ph+9PaT1q5bYbb5BSzSiSQ5YUHEX0
         R2u6F6eGmjlk2L43kR08Z1CktgqFAAUMWIzOd3mLuAfEz0H8JdkdjZmSWQBFr4HLYtjo
         AzTFBrDbzybQ/9Aq7VwnM/QWX5KSuKsMlpiXCR+7l3VJfNwQG4XC/ZOJAfb55veYe/Px
         i/GUFzNxwhWwsJhuPdwrP9c9c7VNRcPgiYid9vPu7pIu7WfELYV6WvDOgxMPp3gAIMrL
         95x9BLox259MyumuzMwejizAyCw4pYxUPNsjBHz9jJxat3CL40Fny8k6EG1GCqJCmGrE
         fXmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Iio5Y0uY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si9566179edb.296.2019.05.18.12.34.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 18 May 2019 12:34:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Iio5Y0uY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hS55p-00042U-OP
	for alex.bennee@linaro.org; Sat, 18 May 2019 15:34:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hS53f-0002M5-3M
	for qemu-arm@nongnu.org; Sat, 18 May 2019 15:31:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hS4rq-0007Z3-PH
	for qemu-arm@nongnu.org; Sat, 18 May 2019 15:19:39 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34375)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hS4rq-0007Yd-Jo
	for qemu-arm@nongnu.org; Sat, 18 May 2019 15:19:38 -0400
Received: by mail-pf1-x435.google.com with SMTP id n19so5282952pfa.1
	for <qemu-arm@nongnu.org>; Sat, 18 May 2019 12:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=kNWizZq2qCo4VoGKtgyncVFOYpv0fo/wpkn1n6HcdBo=;
	b=Iio5Y0uYhkmB0I3YRLIR0rd1kCgETMp4yB9tzp2MTtS6OqCbMCGFxohsRb40p+KPWI
	/FdWZCqgv9f1lW12kyrMFDHwvWhu+xCI6EwiJVMgnRo9ubcbmKmg9fOyqlO5vAnf1M8d
	dR96xNzJxCQE9zj2m4rHI5i27Ein3Vo4EZm09aq4fmdJrca0IFv2rwPt3xdVIH9G6esD
	JM0TyWCv42sjpaYQXqT5ZEPOvO5UClwCZLz9opZ4s9ZfHfrPLJS1ArAGLJ1JtPlUUnRW
	XJGXRULx3qwVYrWJTI77Niv/NaPIt7Z3tJdxs9w/owY+uG0iz+OR/CP+efZJ0DMR3Aiv
	FsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kNWizZq2qCo4VoGKtgyncVFOYpv0fo/wpkn1n6HcdBo=;
	b=b7o2OBTPJt1ziaVtV+wHBZrks6+QEtwXhgKiISfmGztdzvX7c6zKwnSkEsiwtbHuav
	zXL1beeOqYpBkgPyAmMg/OuFui9RUvFuzrf1X8PuAQ+mlmI8FVkXmviQC9dxKrcPsSgr
	tRen7UwnN8ItCsIX33NU3zUZGA8ZvcgIc4zGMfolv7yICi6GMNZdbbmqWsrDnVu2yuPr
	Meatxp/DZyGxRV4E7SYPi2r+aNPmWQreQC3ATqAuFIA//jKOZNpRq5SITtOxeE/AS5TY
	Omh55ONxMS4WI6tYajBeks7rJQRLZ3ID2szeOjGdXfnL8t78MElZuRH49UfzJos0Ja5J
	6JGA==
X-Gm-Message-State: APjAAAUnv/15WJ2H3shqMI9Ho3WUqu3xDCmHTmCgBGUGZy3aQUwI0RzR
	XBBgFIrah2Bnt5membzfR+FA9Q==
X-Received: by 2002:a63:ec02:: with SMTP id j2mr40225148pgh.340.1558207177340; 
	Sat, 18 May 2019 12:19:37 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	r185sm19639625pfc.167.2019.05.18.12.19.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 12:19:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 18 May 2019 12:19:32 -0700
Message-Id: <20190518191934.21887-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::435
Subject: [Qemu-arm] [PATCH 0/2] target/arm: make use of new gvec expanders
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xJu5dpNpCMKH

Based-on: <20190518190157.21255-1-richard.henderson@linaro.org>
Aka "tcg: misc gvec improvements".

We've added (or are adding) generic support for variable vector shifts
and bitsel.  This trivially replaces the implementations of BSL, BIT,
and BSL.  It enables a reasonable implementation of {U,S}SHL.


r~


Richard Henderson (2):
  target/arm: Vectorize USHL and SSHL
  target/arm: Use tcg_gen_gvec_bitsel

 target/arm/helper.h        |  15 +-
 target/arm/translate-a64.h |   2 +
 target/arm/translate.h     |   9 +-
 target/arm/neon_helper.c   |  33 ----
 target/arm/translate-a64.c |  33 ++--
 target/arm/translate.c     | 362 ++++++++++++++++++++++++++++---------
 target/arm/vec_helper.c    | 176 ++++++++++++++++++
 7 files changed, 486 insertions(+), 144 deletions(-)

-- 
2.17.1

