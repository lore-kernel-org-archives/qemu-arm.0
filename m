Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2973211njj;
        Tue, 6 May 2025 01:52:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhNfSoSDg/ojVK3sRNLgu0i2pBMGRYDDM1Uu24GUhMKGu8mGJtXsBvjLQi1nRUnPDu4HzKE+4NdVAtpw==@linaro.org
X-Google-Smtp-Source: AGHT+IFhvbbaA4J4BTtnaJrP1XyEiByRToGDbdKH1MJfvn6BXmNzf94RbK1Rorlv10IKPnOe1dfL
X-Received: by 2002:ad4:5ae1:0:b0:6e8:fa33:2969 with SMTP id 6a1803df08f44-6f535896b35mr40594856d6.10.1746521570488;
        Tue, 06 May 2025 01:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746521570; cv=none;
        d=google.com; s=arc-20240605;
        b=TQBaxOyH7B//KAG0hKWclTM+rEQTqZPEMSNP7nHoNXk/GPZgRtkDtjcxKjpJRv+JYn
         ApQ6H11Q0aMLDySq1nGJD6GoHgJRJocPJ4TSPeRxdqspzJXAKdD5vyRK2mWcYfOAAGTf
         XSk5UckV+n7+l7WwBVo2OCEia7Joa2I5+mCuKJVlEjTe8Gf+uuPD9zjdGlF6XWuKu0Zi
         FH3D7eErTLsKfVX37bCaGUa5Rq/gs8uWB2nsLLFRZ6YaRT/G1y+oVmu53iWyg/kdCIXw
         mjdepAsyO9iRz1dBoSlhoy4gAd3PjunvItezHioVZ2ZlTmtvnCagLesb0xkXpbeGDqZi
         IspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=aMnNQjB04WG0Qqvm2ABXs0Bc8TJ2dI2m6KYQ6aIicSc=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=FwY887RzpxJ1x4/pxOYOaABDYtBw+S8ySK1PW2ACUpBVgUyxCzp0IcffSd2UUHg015
         xMXgdwj2AmLZiRVfr6iTKsiL9N+mTAv1fI/sO0w2WZtY7TjZdNsMQ6i5Lf+/oK4NqWNr
         OsfwSp5dP1Qy/FqxnG+Em+oCYoHpwj9a6He/SuPs/4Gbd7kuPyRxnWn2cxHp7zdDj4ic
         hKaOFh64d+/kN6wYLrOH/7ztWp06nw6nRxqOm5EtioEN9f1r4N5cbClxucciSMsaANWf
         BOuHiX743/z567G1DvCi8hqTLodbXbJeHIOPXoe8EjmnGbTAAuls8wARNlRFXZAVa7bM
         ndAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cBSMiSQD;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f4c2c53si104313296d6.511.2025.05.06.01.52.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 01:52:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cBSMiSQD;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746521570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aMnNQjB04WG0Qqvm2ABXs0Bc8TJ2dI2m6KYQ6aIicSc=;
	b=cBSMiSQD+B+cyS6DFTJCGslDsZiACs2IJVrjlXSO/QKYFirXKvMMElTCXe2Bl7qy2yser7
	Wh6wXhC+F0SkyqLPml070By+oX71aM08Sx1pTlIgjf46mV2PhvV9NSIeWq70hETCRvziR4
	JgQnGxLF1me8fvr06hWdCcB8JpUjkrs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-211-WPyLGutYPD6BO0B2GvrW6g-1; Tue,
 06 May 2025 04:52:49 -0400
X-MC-Unique: WPyLGutYPD6BO0B2GvrW6g-1
X-Mimecast-MFC-AGG-ID: WPyLGutYPD6BO0B2GvrW6g_1746521567
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 592FF1955E74;
	Tue,  6 May 2025 08:52:46 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E04D21956094;
	Tue,  6 May 2025 08:52:38 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com,
	agraf@csgraf.de
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v6 00/14] arm: rework id register storage
Date: Tue,  6 May 2025 10:52:20 +0200
Message-ID: <20250506085234.855779-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: IKtySeSbppLJ

Just some small changes:
- fixed up some botched conversions noted by Eric (thanks!)
- rebased to current master
- new patch with a small cleanup suggested by Eric

Also available at
https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v6

<v5 cover letter>
Just a quick respin to fix a missed conversion in hvf.c.

<v4 cover letter>
Next iteration of the id register patches; only small changes.

Changed from v3:
- added R-bs (thanks!)
- added missing SPDX header
- merged patch introducing accessors for kvm to the first user
- skip over sysregs outside of the id register range when generating
  register definitions again

Also available at
https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v4

<v3 cover letter>
Yet another update of the id register series, less changes this time
around.

Changed from v2:
- changed generation of the various register defines via the "DEF"
  magic suggested by Richard
- some kvm-only code moved to kvm.c; some code potentially useful to
  non-kvm code stayed out of there (the cpu model code will make use
  of it, and that one should be extendable outside of kvm -- a
  revised version of those patches is still in the works, but I'll be
  off for a few days and rather wanted to get this one out first)

Also available at
https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v3

<v2 cover letter>

Changed from v1:
- Noticed that we missed the hvf code. Converted, compiled, but not tested
  as I'm lacking an environment for testing.
- Hopefully incorporated most of the suggested changes -- if I missed
  something, it was unintentional unless mentioned below.
  - fixed repeated inclusion of definitions
  - hopefully made macros more robust
  - removed distinction between reading 32/64 values, which was mostly
    adding churn for little value
  - postponed generating property definitions to the cpu model patches,
    where they are actually used
  - juggled hunks and moved them to the right patches
  - fixed some typos
- rebased to a more recent code base

NOT changed from v1:
- definitions are still generated from the Linux sysregs file
  - I still think updating the generated files on demand (so that we can
    double check the result) is the right thing to do
  - I'm open to changing the source of the definitions from the sysregs
    file to the JSON definitions published by Arm; however, I first wanted
    to get the code using it right -- we can switch out the code generating
    the file to use a different source easily later on, and I'd also like
    to steal parts of the script from Linux once integrated (which I think
    hasn't happened yet?)

<v1 cover letter>

[Note: I've kept the cc list from the last round of cpu model patches;
so if you're confused as to why you're cc:ed here, take it as a
heads-up that a new cpu model series will come along soon]

This patch series contains patches extracted from the larger cpu model
series (RFC v2 last posted at
https://lore.kernel.org/qemu-devel/20241206112213.88394-1-cohuck@redhat.com/)
and aims at providing a base upon which we can continue with building
support for cpu models, but which is hopefully already an improvement
on its own.

Main changes from the patches in that series include:
- post-pone the changes to handle KVM writable ID registers for cpu models
  (I have a series including that on top of this one)
- change how we store the list of ID registers, and access them
  basically, use an enum for indexing, and an enum doing encodings in a
  pattern similar to cpregs
- move some hunks to different patches
- update the scripts to generate the register descriptions, and run
  them against a recent Linux sysregs file

What I've kept:
- generating the register descriptions from the Linux sysregs file
  I think that file is still our best bet to generate the descriptions
  easily, and updating the definitions is a manual step that can be checked
  for unintended changes
- most of the hard work that Eric had been doing; all new bugs in there
  are my own :)

</v1 cover letter>
</v2 cover letter>
</v3 cover letter>
</v4 cover letter>
</v5 cover letter>

Cornelia Huck (2):
  arm/cpu: switch to a generated cpu-sysregs.h.inc
  arm/kvm: use fd instead of fdarray[2]

Eric Auger (12):
  arm/cpu: Add sysreg definitions in cpu-sysregs.h
  arm/cpu: Store aa64isar0/aa64zfr0 into the idregs arrays
  arm/cpu: Store aa64isar1/2 into the idregs array
  arm/cpu: Store aa64pfr0/1 into the idregs array
  arm/cpu: Store aa64mmfr0-3 into the idregs array
  arm/cpu: Store aa64dfr0/1 into the idregs array
  arm/cpu: Store aa64smfr0 into the idregs array
  arm/cpu: Store id_isar0-7 into the idregs array
  arm/cpu: Store id_pfr0/1/2 into the idregs array
  arm/cpu: Store id_dfr0/1 into the idregs array
  arm/cpu: Store id_mmfr0-5 into the idregs array
  arm/cpu: Add sysreg generation scripts

 hw/intc/armv7m_nvic.c                 |  27 +-
 scripts/gen-cpu-sysregs-header.awk    |  35 ++
 scripts/update-aarch64-sysreg-code.sh |  25 ++
 target/arm/cpu-features.h             | 317 +++++++++---------
 target/arm/cpu-sysregs.h              |  42 +++
 target/arm/cpu-sysregs.h.inc          |  52 +++
 target/arm/cpu.c                      | 111 +++----
 target/arm/cpu.h                      |  80 +++--
 target/arm/cpu64.c                    | 128 +++----
 target/arm/helper.c                   |  68 ++--
 target/arm/hvf/hvf.c                  |  39 ++-
 target/arm/internals.h                |   6 +-
 target/arm/kvm.c                      | 139 ++++----
 target/arm/ptw.c                      |   6 +-
 target/arm/tcg/cpu-v7m.c              | 174 +++++-----
 target/arm/tcg/cpu32.c                | 320 +++++++++---------
 target/arm/tcg/cpu64.c                | 459 +++++++++++++-------------
 17 files changed, 1103 insertions(+), 925 deletions(-)
 create mode 100755 scripts/gen-cpu-sysregs-header.awk
 create mode 100755 scripts/update-aarch64-sysreg-code.sh
 create mode 100644 target/arm/cpu-sysregs.h
 create mode 100644 target/arm/cpu-sysregs.h.inc

-- 
2.49.0
