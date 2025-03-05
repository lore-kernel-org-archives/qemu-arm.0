Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp928827njm;
        Wed, 5 Mar 2025 08:38:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW1zl4HFAh5ocZqHnuSk89r1DQ2jbKJydRHsJCRxLkHd16eTjXMhiKhhz7I26kwRZySn3u6E/AgXjnjoQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGJ64Cud/2nHhCe+TTgKU4Mb0PzG7qoN7sYvHiyK6heajlGiGiFDTBLKARXrAj9W+R3YgAY
X-Received: by 2002:a05:6902:e0e:b0:e60:a79b:5f51 with SMTP id 3f1490d57ef6-e611e1ab8b7mr5262270276.17.1741192739170;
        Wed, 05 Mar 2025 08:38:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741192739; cv=none;
        d=google.com; s=arc-20240605;
        b=lXsx9FsigngY005Ww8Gr9G7rm9B+Bfh1yVFba+BPFQuzc82lDhaAnW2l1kkiO/pFhI
         /jqrljucQtXfPSY3oIYDioC/bBxRKNeUX1VIbCM/RH09xpe0liEShpgKH3e9x1MGCqYu
         y6XFeWFR6VWGt/WUkzbx2pKCtYMYdE3I8eANHbm/PN7v1CKgrQJV+segA2qqRPKX3+0+
         pRPXdfhQRE1P168EoarEWT+S/YMJ+Fd0jFr5tCUVctZz//xP7s4d3mOztRGiET+UT1+X
         jwpSg+Uj6uy2htFD5RkVecZmW9sd2meyXqTlYuH5KUPxSSBi5z9x/9Sc/LYIIXtbX751
         mzog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=IX/RrldB2VoEvfDNUYV1sErfr681DEBoI8oaCo4ZqN4=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=GQoDzSkMs6AbZUhVJ/dspgcvF0y6ROB+KnV0GBy8LvZzRk9ziaf9mpPZ7w0D57gEOF
         ASjg/kwQjuFp4LjQEf6JT3NZYDst48nI+VYVeSrHmEDgGWz2fXUunA5rMOXSjGRR3Ceq
         EvK37LZsdA9li1864Cd3OMb15hQz329eHIvJZ7zBUALKomaLsMp8MhrIYDiSJfsNrxmU
         WwqUDJW5hqFmU6rbEoKXFIAlkcOU48BUi7DZmmSoPZJdCf+3nGtEcl7MvAuaqCZRS7n5
         LUR/tSUhYgjVQYGzWaIc3ebUcn2T4PHRPTf0Eo1a/V9ZtuQXryPorF2ehs2Xlm6/MKdq
         Csew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IVu7SOwT;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e6120023f63si1563132276.246.2025.03.05.08.38.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 08:38:59 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IVu7SOwT;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741192738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IX/RrldB2VoEvfDNUYV1sErfr681DEBoI8oaCo4ZqN4=;
	b=IVu7SOwT2YL8YX0USF9DDC6uor+XstikzXAUm37xWNiqotQi4Lx4XFBmoTRthrJcCPrY8V
	ux98Xe19N2cFcwYKVFs+IP5hilsvHEdPsNRIyvJXGigoM74WSFw5GV4BjjNGxH9THbB/+y
	2UAvUMOawVZYd99LyDoB/wNT5pU1lw0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-486-hBTxPL1JMKWd7szDjVh2DA-1; Wed,
 05 Mar 2025 11:38:45 -0500
X-MC-Unique: hBTxPL1JMKWd7szDjVh2DA-1
X-Mimecast-MFC-AGG-ID: hBTxPL1JMKWd7szDjVh2DA_1741192723
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E36618001D0;
	Wed,  5 Mar 2025 16:38:42 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.9])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9CBB01955DDE;
	Wed,  5 Mar 2025 16:38:25 +0000 (UTC)
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
Subject: [PATCH v2 00/14] arm: rework id register storage
Date: Wed,  5 Mar 2025 17:38:05 +0100
Message-ID: <20250305163819.2477553-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: fC5o61BTl7++

[Oh, it's been about a month since I posted the last version of this :/
 Unfortunately, life happened. I still do plan to post a rebase of the
 cpu model patches on top of this.]

Original cover letter below.

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

Also available at
https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v2

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

Cornelia Huck (2):
  arm/kvm: add accessors for storing host features into idregs
  arm/cpu: Add generated files

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
 scripts/gen-cpu-sysregs-header.awk    |  70 ++++
 scripts/update-aarch64-sysreg-code.sh |  35 ++
 target/arm/cpu-features.h             | 317 +++++++++---------
 target/arm/cpu-sysregs.h              |  22 ++
 target/arm/cpu-sysregs.h.inc          | 167 ++++++++++
 target/arm/cpu.c                      | 111 +++----
 target/arm/cpu.h                      |  80 +++--
 target/arm/cpu64.c                    | 131 ++++----
 target/arm/helper.c                   |  68 ++--
 target/arm/hvf/hvf.c                  |  36 +-
 target/arm/internals.h                |   6 +-
 target/arm/kvm.c                      | 119 +++----
 target/arm/ptw.c                      |   6 +-
 target/arm/tcg/cpu-v7m.c              | 174 +++++-----
 target/arm/tcg/cpu32.c                | 320 +++++++++---------
 target/arm/tcg/cpu64.c                | 460 +++++++++++++-------------
 17 files changed, 1230 insertions(+), 919 deletions(-)
 create mode 100755 scripts/gen-cpu-sysregs-header.awk
 create mode 100755 scripts/update-aarch64-sysreg-code.sh
 create mode 100644 target/arm/cpu-sysregs.h
 create mode 100644 target/arm/cpu-sysregs.h.inc

-- 
2.48.1
