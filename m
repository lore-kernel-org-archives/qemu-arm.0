Received: by 10.28.91.67 with SMTP id p64csp1200994wmb;
        Thu, 8 Mar 2018 05:06:32 -0800 (PST)
X-Google-Smtp-Source: AG47ELvNaNWPuzCGiaqaDZnfEaMeYbN06Vy7mBVkPiWmz7497vItHgJpjqiEkeaxp/y2rhuplLnQ
X-Received: by 10.223.154.7 with SMTP id z7mr22374528wrb.98.1520514392809;
        Thu, 08 Mar 2018 05:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520514392; cv=none;
        d=google.com; s=arc-20160816;
        b=AeC2nrpMiu8JsKddKjKZ6qeXNXVO7ztEnArjFPuJpiZPo3gK0iiKo0HNE7afj9pSSr
         MaZpHKkWKUMV+A28DsLjcj8MylT0JZ35A5I/eEmgcDutgFPx8Rfu1ab5fQedYMBpVhMJ
         rpVLGdq1RbRGYviYJK4qMeN3JJ7f9FbxYVRKuue97dOjTHIOpdDdoQSt95Eiq6xq0pWg
         +DQyAef6LbiXxtRR0mI8bh3O/uu3iAUb72hvxcpCKee0bF4wkqm8HRtkTGmSpjdsMYkI
         GiEEGTHn6uPyzLSYCWv9B3DPo/7zWsOlHrOh2nPNPV6MLy2TWPpMkOrFAHqfgSSnV6rC
         wimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:arc-authentication-results;
        bh=1znuacaoNKzHEyym2glz7AgTkegXnT30AIBBHAUm2c4=;
        b=orj6DHWQG2nl0sIalpHXF3hNrmdaJfJ/BPw4xwdZHCl0Ntwx8tMJwUzBbY7B4TvGRR
         sxNsBffUsK9bxcg2+JYNwEjjQF0bw8kgRV//WhEHeWPlWASbt0lDB8+3q7IUbZrg7f9c
         5CkwbT7FnOVX8lv4u0pKkc/hH/e2jrFydOHIZS5dK1bNoV0mrBBZ7fETT4sDEfD0JWut
         z58PFx92tPtOPvgyfiNtuzWqMWPaCYVkjnp/KfdPvfNqNxWdCmOPe1M18jGWqmYKRMUE
         F+pmkI6Hhm4rMqhAZDzp37gba5gidvfXRDqLNy4pcDYhAOk0cwjlFP1TsvQdt67E3xzE
         B0dg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 186si911499wmx.139.2018.03.08.05.06.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Mar 2018 05:06:32 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1etvFc-0005y5-1r; Thu, 08 Mar 2018 13:06:28 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 0/6] arm: support -cpu max (and gic-version=max)
Date: Thu,  8 Mar 2018 13:06:20 +0000
Message-Id: <20180308130626.12393-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PEdlPtxzS7Sa


This patchset adds support for '-cpu max' to Arm, along the lines
of the existing support we have for x86 targets:

 * under KVM, -cpu max is the same as -cpu host
 * under TCG, -cpu max means "emulate with as many features as
   possible"

-cpu max is supported for both usermode and system emulation,
again following the x86 line.

NB that cross-QEMU-version migration is not supported for -cpu max:
in future the definition of "maximum set of features" will change
as we add more emulation features.

The patchset also adds support to the virt board for the "max"
option to -machine gic-version, requesting "best available
interrupt controller", with the same semantics as -cpu max.

Together these should assist users like libguestfs that just want
to be able to run code without having to figure out what the
right command line arguments for this particular host system are.

The patches make 'any' a synonym for 'max', using the approach
of putting a compat hack into arm_cpu_class_by_name() that
Igor suggested. For the moment, we don't enable any of the
CPU feature bits in 'max' that aren't in the a15/a57 if we're
doing system emulation mode. This is a combination of:
 * some of those bits are currently only implemented sufficiently
   for user-only mode, not for system emulation
 * we would also need to update ID register bits to advertise the
   extra features
We should certainly do that, but I'd like to get basic -cpu max
support into 2.12, and the softfreeze deadline is rapidly approaching,
so I've opted to postpone that to post 2.12. If people have the time
to review this series this week I'd really appreciate it.

Changes since v1:
 * the "check CPU realize succeeded in virt board" patch is in master
 * the "target/arm: Make 'any' CPU just an alias for 'max'" is new,
   and unifies 'any' with 'max' as suggested in review of v1
 * the other patches are essentially unchanged

Changes since v2:
 * fixed the silly error in patch 4 that made user-only mode always
   use "max" rather than only if the user asked for "any"...

thanks
-- PMM


Peter Maydell (6):
  target/arm: Query host CPU features on-demand at instance init
  target/arm: Move definition of 'host' cpu type into cpu.c
  target/arm: Add "-cpu max" support
  target/arm: Make 'any' CPU just an alias for 'max'
  hw/arm/virt: Add "max" to the list of CPU types "virt" supports
  hw/arm/virt: Support -machine gic-version=max

 target/arm/cpu-qom.h |  2 ++
 target/arm/cpu.h     |  5 +++
 target/arm/kvm_arm.h | 35 +++++++++++++------
 hw/arm/virt.c        | 30 ++++++++++------
 target/arm/cpu.c     | 97 +++++++++++++++++++++++++++++++++++++++++++---------
 target/arm/cpu64.c   | 66 ++++++++++++++++++++++-------------
 target/arm/kvm.c     | 53 ++++++++++------------------
 target/arm/kvm32.c   |  8 ++---
 target/arm/kvm64.c   |  8 ++---
 9 files changed, 200 insertions(+), 104 deletions(-)

-- 
2.16.2
