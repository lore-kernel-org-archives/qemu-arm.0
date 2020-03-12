Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1416892lfc;
        Wed, 11 Mar 2020 17:34:35 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsmWUv8ZpfD/RKCD7kSOu96MgDzN17CAZK5cVmhbmdbrPEn6nxwI+0Bl1/tEvsHDO4LWCuV
X-Received: by 2002:ac8:6bd1:: with SMTP id b17mr5042169qtt.28.1583973275498;
        Wed, 11 Mar 2020 17:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583973275; cv=none;
        d=google.com; s=arc-20160816;
        b=MQ9bmMj/Li+WvZU/8w+NmnVxPtIZePBu/yTgkSTG8nasclVtEJ8eSDK1oidS76IA2M
         lTDAAnIbzsa+znwJSqC/ktEG6OYbHKO0O7ICsiIcjVUY+hCOn5DJW0C5Ok8vZXNRimMV
         NFOc/PD1FsPOJ6tfyNYiBnJSn/okiVwPwniuA9/dc7NlGsFdHQ0ctw3QZhYmM4Lc8sQ3
         H+NWsqOJNNAxZV/7TxtQUMYCureOufyif+/xFW5HK7dbzLpx58+mH5eH3y+dy4ZL8KRc
         8K9JK47nT+MJmM1rNVNPwxys7yaxV6ct/KPnqsuoL5kjSBMtHMaualwFhCh66lb01eKJ
         hGYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:cc:message-id:date:subject:to:from
         :dkim-signature;
        bh=/6M2ikoI+BHGhZdHfo6ecLmrYY3UY0LfDveHDctJ/1U=;
        b=IKMOiUpGDNhDyiqR+eTUfHqOZxZFORLPlLt/fUL+IJ4bALZVPnG5XTj2QV+OHl4TWz
         gzeOdIImqe0TN2OhWhCWXugjeeRoxdCcb81sGX/UPlbU4fmDKCfqbZHMaNx6BytyOFsR
         XuzdeCrhHx5zCbXLT8L9+FyHAesbCKsx2I6DQY+SsZRXQnOIVNtwtlz52IzFiYLhWpfC
         7idT72GVmkFuYovgYNZ5/I9jOdCdqeAYYQD8sbsJDflF1N9PjzOwc66lN6VAri1Eo2Eu
         de2W2eSWfmR4Il7TyFkj7yY352N3ddQxl3CIp/Qx0KlyXT/pX+GQEOpQCL/RwvxPI6VH
         jD3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=LZ24bt60;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id c20si1887431qko.362.2020.03.11.17.34.34;
        Wed, 11 Mar 2020 17:34:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=LZ24bt60;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 772EB4A4A9;
	Wed, 11 Mar 2020 20:34:34 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DMBgF5dxTycH; Wed, 11 Mar 2020 20:34:33 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 75A2F4A4C0;
	Wed, 11 Mar 2020 20:34:33 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 8B7B84A4A9
 for <kvmarm@lists.cs.columbia.edu>; Wed, 11 Mar 2020 20:34:32 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ixVdVnbSCwCo for <kvmarm@lists.cs.columbia.edu>;
 Wed, 11 Mar 2020 20:34:31 -0400 (EDT)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 68EB64A1B0
 for <kvmarm@lists.cs.columbia.edu>; Wed, 11 Mar 2020 20:34:31 -0400 (EDT)
Received: by mail-wr1-f66.google.com with SMTP id x11so392912wrv.5
 for <kvmarm@lists.cs.columbia.edu>; Wed, 11 Mar 2020 17:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=o4wfwFzslWSogfShuzT1GXszAi31gOgslMZWdjvKfVo=;
 b=LZ24bt60gTmcfYWHhCsEWR4BHFJlkp3DexMhVT/j5ERjOXSeJ37pMmiuMRlvTyT7HK
 JqpQwkpYsoYVg3uGyXCiVNaquC3kh6E1EVRQ952U+YKVIwfRqXBsUz6VmM94LX0p0oBh
 nRI/aGFhUkoPn4hMALZanetw/RwDSngToHjwFpqPCujnSOAxmkiyj6G/8adAECNCDw8E
 q8w1NVeD/wH3ifi2WPvz6qL7utV0dSr2gvuV48lPi2cAL5ZY6jegHjElhMBSsNleheVB
 +gOjMLxEUqWPZ9ZNmQX7fffkC2dMnRioNxTEI2iZx3NP+9XvKBxojtF3/fKZ7IZYPh4g
 8v0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=o4wfwFzslWSogfShuzT1GXszAi31gOgslMZWdjvKfVo=;
 b=MV/AWS4v3udovZjjL3zn9LI2j+aPPpA68DX7xidDTnVEJJ4kAS2u1fXLnXFQWdLXxM
 rw4b6frQq9SSxQqByJM0Unga274gSu/WdlhVDLKyIzKNl3ouvUzqNkUE5JCNccxrOV8q
 i6JV0+ttYgp034FIf82uhSeS1TH+4T8hVF2ZdxZB/zWrBQXcNil5/h3gGwfVZsz68POT
 D2CdAwWm8bzgY21Ef2oOCs9eg6hW7u1FebQes0OxdZmbOXscTWM+jlduMEDkgm4ODeuF
 OieqzDcCzpdQzvtan61TdaLkDje7HQa8txPDfUIiNtQP8PHw9iT0XwTa5SD2ARrjw4t7
 40Iw==
X-Gm-Message-State: ANhLgQ3jB0VPKmbGFfm4d2F9nmRHheuth3ilu3mlg6oqOceIgJkID5Jl
 J9JsJaaz1pAaaWgVoHo2uK5zow==
X-Received: by 2002:adf:94c2:: with SMTP id 60mr7155516wrr.396.1583973270323; 
 Wed, 11 Mar 2020 17:34:30 -0700 (PDT)
Received: from moi-limbo-9350.home
 (host86-139-146-66.range86-139.btcentralplus.com. [86.139.146.66])
 by smtp.gmail.com with ESMTPSA id o5sm10909988wmb.8.2020.03.11.17.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 17:34:29 -0700 (PDT)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] target/arm: kvm: Support for KVM DABT with no valid ISS
Date: Thu, 12 Mar 2020 00:33:59 +0000
Message-Id: <20200312003401.29017-1-beata.michalska@linaro.org>
Cc: qemu-arm@nongnu.org, pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: nl1yDdugz1CE

Some of the ARMv7 & ARMv8 load/store instructions might trigger a data abort
exception with no valid ISS info to be decoded. The lack of decode info
makes it at least tricky to emulate the instruction which is one of the
(many) reasons why KVM will not even try to do so.

So far, if a guest made an attempt to access memory outside the memory slot,
KVM reported vague ENOSYS. As a result QEMU exited with no useful information
being provided or even a clue on what has just happened.

ARM KVM introduced support for notifying of an attempt to execute
an instruction that resulted in dabt with no valid ISS decoding info.
This still leaves QEMU to handle the case, but at least now it gives more
control and a start point for more meaningful handling of such cases.

This patchset relies on KVM to insert the external data abort into the guest.

v3:
 - Fix setting KVM cap per vm not per vcpu
 - Simplifying the handler to bare minimum with no default logging to address
   the potential risk of overflooding the host (adding support for rate
   limiting the logs turned out to be bit too invasive to justify the little
   add-on value from logs in this particular case)
 - Adding handling KVM bug (for small range of affected kernels):
   little bit of trade-off between what's reasonable and what's effective:
   aborting qemu when running on buggy host kernel

v2:
- Improving/re-phrasing messaging
- Dropping messing around with forced sync (@see [PATCH v2 1/2])
  and PC alignment


Beata Michalska (2):
  target/arm: kvm: Inject events at the last stage of sync
  target/arm: kvm: Handle DABT with no valid ISS

 target/arm/cpu.h     |  3 ++
 target/arm/kvm.c     | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm32.c   | 41 ++++++++++++++++++++++----
 target/arm/kvm64.c   | 51 +++++++++++++++++++++++++++++----
 target/arm/kvm_arm.h | 22 ++++++++++++++
 5 files changed, 188 insertions(+), 10 deletions(-)

-- 
2.7.4

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
