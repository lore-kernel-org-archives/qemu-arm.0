Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3481358njc;
        Wed, 26 Mar 2025 10:37:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9YPjcsZ5aHRbKwr9TJ/2BEFun34y13HuW6rXscJbFWsPVzvTjWM44NOAhXES7mMBHmaQcPrHlCHT98A==@linaro.org
X-Google-Smtp-Source: AGHT+IFXIShQU5oGG5XDldd0PLZPH3A8kvxyYiqsD3UnNa2nupkOjUNrgpdMga4DJ9iK5gRoSaqT
X-Received: by 2002:a05:6a00:3cd0:b0:736:53c5:33ba with SMTP id d2e1a72fcca58-7396109c0e2mr478675b3a.16.1743010675638;
        Wed, 26 Mar 2025 10:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743010675; cv=none;
        d=google.com; s=arc-20240605;
        b=c+sVvDgb3jOT/7eLieLcfDFY2HT261ZyvJgFbz4cKtFhHiHCbxM5G0DDAYYnvpo9dc
         h11IYTHzqpxAUeX//0qCLGYIhGZoz4n4lEUoSZZN+sLqJG7UZ3mUWAcF6qzGtVt+ptqg
         hFrfv4TakvUKqLDOKJ5kyrDgrXKxblFVYD0Sq5I7sG+Wvyho06V+xIs2RK2iOJ9qqdbw
         gDgeScyKO38sjjYKnWbsLsBD4151LgtfD+wWnq7wH7TZAvJWHmQaMpqTcOphW85du/bW
         ncxXup8XbUZGxHJjPaFRtgfXLtD+CTu5Q73I24we0ydZxAyBvJELHsgRpht3vq5vhsj6
         4rZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=GoxYL0e5inO/4S8C3FeRtVRqh9nONxsW6KEuR5VNGOI=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=N3XBAEh5aVump99ve0RsnwWvjmgRdajYTczsK35RnIODQ66os4cnPcvFljV+IHvm21
         2Smo5QRtLvecV5BftPh/FCWZ8pvD7RXnx/C5+0wHy2x2KMId8FL5gQCNkYKr0Ur7BTSj
         mvhPLuAXasM1Fp6pNhtErCRwsUS7pHp4ecN14fM49fUX6eizQy484AtgCVaVaEJyp2hi
         10W5KYBgLC56xSh0gp/4Bbu1+DGfukntI49SMseW0Yxw2sfFVi7nH5bFbbv5pWTzmxKt
         j+FexrpCydGMdNot279/o3Mm3fJEnwOizyRxnC4Ca7JlbRRCFn6YenuLtod4JCTpYhS6
         onDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C8eDyHmt;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d2e1a72fcca58-73905ee8039si21949093b3a.68.2025.03.26.10.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 10:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C8eDyHmt;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743010674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GoxYL0e5inO/4S8C3FeRtVRqh9nONxsW6KEuR5VNGOI=;
	b=C8eDyHmtNjJfc8McCqZ5kc3dfZq35Mj6DNkcLBG9UHCqVmGI5lbWxVzp3TX2QtAZ0Jsel4
	WDTbAp4OWPYXY2Obi0I+VsG2fKRzdjUggkFpj5OQRIFzb5eKqPEk59FmAghmp/5VnejzOD
	NRgUOg28RKAblZ1J0qPhRzjaiJ3KiFM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-6-XINHyLPaqQaI86B8urEw-1; Wed,
 26 Mar 2025 13:37:51 -0400
X-MC-Unique: 6-XINHyLPaqQaI86B8urEw-1
X-Mimecast-MFC-AGG-ID: 6-XINHyLPaqQaI86B8urEw_1743010669
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 506231800267;
	Wed, 26 Mar 2025 17:37:47 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.38])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B457B180B486;
	Wed, 26 Mar 2025 17:37:30 +0000 (UTC)
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
Subject: [PATCH for-10.1 v4 00/13] arm: rework id register storage
Date: Wed, 26 Mar 2025 18:37:10 +0100
Message-ID: <20250326173723.389988-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: eY0vW0BWNezP

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

Cornelia Huck (1):
  arm/cpu: switch to a generated cpu-sysregs.h.inc

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
 target/arm/cpu-sysregs.h              |  46 +++
 target/arm/cpu-sysregs.h.inc          |  52 +++
 target/arm/cpu.c                      | 111 +++----
 target/arm/cpu.h                      |  80 +++--
 target/arm/cpu64.c                    | 128 +++----
 target/arm/helper.c                   |  68 ++--
 target/arm/hvf/hvf.c                  |  36 +-
 target/arm/internals.h                |   6 +-
 target/arm/kvm.c                      | 129 ++++----
 target/arm/ptw.c                      |   6 +-
 target/arm/tcg/cpu-v7m.c              | 174 +++++-----
 target/arm/tcg/cpu32.c                | 320 +++++++++---------
 target/arm/tcg/cpu64.c                | 460 +++++++++++++-------------
 17 files changed, 1101 insertions(+), 919 deletions(-)
 create mode 100755 scripts/gen-cpu-sysregs-header.awk
 create mode 100755 scripts/update-aarch64-sysreg-code.sh
 create mode 100644 target/arm/cpu-sysregs.h
 create mode 100644 target/arm/cpu-sysregs.h.inc

-- 
2.48.1
