Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp769387wrs;
        Fri, 16 Aug 2019 05:58:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWbbO4hKNueg9dflqyA41oxodcEEIpomGkCfDRpE5MPUjvfKptCtHIggnfhDSmG27gMffB
X-Received: by 2002:a17:906:a449:: with SMTP id cb9mr8985791ejb.162.1565960306773;
        Fri, 16 Aug 2019 05:58:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565960306; cv=none;
        d=google.com; s=arc-20160816;
        b=FDqaEnwh1EM8Gcyn489Ydyl/wJG8pZf/KJ8513iXfPyg5XWUEPIZayeWokhzU0h0Sg
         d6+X8b9vJYGQ05u3mLzfSY7S4V5vytR8wOfOYxxNURi0nMw8ks43UlRVUT4tjxFt8bN8
         GeMkRr3kspYDM1gQ847m2R4PEobdtFNrYLVTufWvDAjvEwvbxwJXv7HRS6QHdcCFaFrB
         UETeS/AVEbh4svNe1oXvc0vfunFCia95/4vjubivzsn2uLdukGILwdNqPic8USisXocS
         MAihSgS+c89vL0AtTYKVdS1p0p5+sYviyapmO6BdYvl5l7unVxx4Ay9Z0wsLwHUnTTgL
         UNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=0TNU1qcTPKOb8ebj7Oqy+tAPM4gs6EGYteC/gAYplT4=;
        b=Tsfi9CPhGNw5VXU/70UKBBrQ+FxxU3LhP5CF8AMdFo9tPrmv+A8aFCJLrq+zwVxIRM
         sI6SUdiqxs8tR6W7xKKWk/VO5hTmZW5a7AKiMXPj+JbodWxeuW8x3CDkLFLZAnQruIuR
         DLRQ8xSIbKn64RCWG30jhUfxQB9ISkzg8nDVKFQQAdfPYCZLvI7an1M5ATlysJfm4ZBK
         NFAq3prakADlFbZc7Uib1lpuvQuQJOv1IUIMXmpOte6HX6gA4clTzeaD526yJCVPScAL
         fYRyKlIIgQI7VB4a+BzS71Wc5RpX+yln4qsNdRtBYEWIyKzpSAFqFla8MXZtwJTJral8
         f9mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RpSPBOla;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s47si3413955edm.38.2019.08.16.05.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 05:58:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RpSPBOla;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyboH-000613-9E
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 08:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60917)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hybo0-0005yJ-O5
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 08:58:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hybnz-0000La-Ff
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 08:58:08 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36479)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hybnz-0000KF-66
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 08:58:07 -0400
Received: by mail-wm1-x342.google.com with SMTP id g67so4004232wme.1
 for <qemu-arm@nongnu.org>; Fri, 16 Aug 2019 05:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0TNU1qcTPKOb8ebj7Oqy+tAPM4gs6EGYteC/gAYplT4=;
 b=RpSPBOlaO06ZNuwYCGTQ8rB2RaIOBhTaTNxoY1UY3UWOx1D9PGVCjjTY36mA2pfwid
 duINFA7JTRVIAr1Qhi8/dJgnQBnhcg/SlGXPn2q+2mPILoentEFRshlvoed2V4MtHSTp
 i8y7z0MNhUcPvkzAH3Lza+MN1tM0X2mmmaYPGwptLP8lEzz6SswQa4dmGxsnOLckV6pN
 O4/1qkcPDrLoeeUlgHk1ND7jprs53Wbq3Mu69O+KmxtnChr9ICChwHRHtvSHQtMBaArC
 EphmvNHmjffbye269A0a0jQxVTO9kQLQU88YJPWrAZZji1dkGORAUz9/xBFKCEftruGz
 tB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0TNU1qcTPKOb8ebj7Oqy+tAPM4gs6EGYteC/gAYplT4=;
 b=K6k5qTnh1dV8iur+G3s1+gM2CSa4eOB4LYuSzh75N+ZCt4MvPxqTtpnvRlu/GxkjOH
 /sDU/k7MyY2vin+AN99zOsIcW66yfbpL4bparpJvND+r5cQ/QzoJWPPeHrk6hU2li576
 hRn3KVAB8BGQq0z9aful46j7uFGDB0O8ZodUTFuz4KvkTRvXQpv540LXoP/sBzqHL9Q8
 y/mViUCwiX0nYOg8EZD339KSnBvrAo6ARiJz01At7U8tMw3p14UseclOH2krRorE8eE8
 gbPr3s0R9U/Fq2hAlJqgcNRcMWtoxLOjCF/V5N7OCRmBBwE8DJFOfTY6Y41uQpYizWQT
 9NKg==
X-Gm-Message-State: APjAAAVF+90Os1YnPrckSochVZPxOg4FEE8GhV7SE7r9SAXea8eiNkHs
 oVzpGcZykjxy8aq5fg2Qp7rG6BaA9Rvlag==
X-Received: by 2002:a05:600c:204:: with SMTP id
 4mr7733968wmi.167.1565960285180; 
 Fri, 16 Aug 2019 05:58:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a19sm17594348wra.2.2019.08.16.05.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:58:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 13:58:00 +0100
Message-Id: <20190816125802.25877-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH 0/2] target/arm: Take exceptions on ATS
 instructions
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xbl5a1nohUJJ

The translation table walk for an ATS instruction can result in
various faults.  In general these are just reported back via the
PAR_EL1 fault status fields, but in some cases the architecture
requires that the fault is turned into an exception:
 * synchronous stage 2 faults of any kind during AT S1E0* and
   AT S1E1* instructions executed from NS EL1 fault to EL2 or EL3
 * synchronous external aborts are taken as Data Abort exceptions
    
(This is documented in the v8A Arm ARM DDI0487A.e D5.2.11 and G5.13.4.)

I noticed this by code inspection back last year sometime when
I was investigating a guest boot failure that turned out to be
due to an entirely different cause. I got about halfway through
trying to code up a fix before I realised it was irrelevant to
that bug. This patchset is just tidying up and completing that
work so it doesn't get lost.

Use of ATS insns in the cases where they might actually fault
is quite rare (obviously nobody sets up page tables where there's
no memory and they'll take external aborts, and even for the
"take a hyp trap for a stage 2 fault" case you need a setup
with a hypervisor and a guest that uses ATS insns, and Linux as
a guest doesn't use ATS at all. So my testing of this patchset
has been more "check it doesn't break things" rather than
actively finding and testing a use of the throw-an-exception path...

thanks
-- PMM

Peter Maydell (2):
  target/arm: Allow ARMCPRegInfo read/write functions to throw
    exceptions
  target/arm: Take exceptions on ATS instructions when needed

 target/arm/cpu.h           |   6 ++-
 target/arm/helper.c        | 107 +++++++++++++++++++++++++++++++------
 target/arm/translate-a64.c |   6 +++
 target/arm/translate.c     |   7 +++
 4 files changed, 110 insertions(+), 16 deletions(-)

-- 
2.20.1
