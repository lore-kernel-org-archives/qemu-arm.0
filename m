Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1947167njb;
        Thu, 15 May 2025 08:39:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVh8C1sV1oOD3JsxLQ04DwU7+NaKl6qfdSpU+HTmW4Ni4P9OIzu9AADTsm31l/+vKW17JIL/1jhkcipYw==@linaro.org
X-Google-Smtp-Source: AGHT+IH56QZnglzWkhaqO9h2ADZDXFLuIwoYCZhasniJvmiULAYjJwi60LCy8zoJqu6ctsTIvgYh
X-Received: by 2002:a05:6214:2684:b0:6ed:1637:442f with SMTP id 6a1803df08f44-6f8a3210cedmr59932366d6.17.1747323569579;
        Thu, 15 May 2025 08:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747323569; cv=none;
        d=google.com; s=arc-20240605;
        b=BSbAEf35Uil14Y1RMezL/4G3v3Zz+UnDl+PtKNNeBsTQWxyfuCkatuSsMeDSsOK6rG
         BLckO0t0RU+DZG70zGGuuurI8cYgE7+0dyt6nICxqIwILtG0VcJsBQUe7aU3kK9e9n5r
         oFB7fxU948y1Z69lKwjCMg2DLV+QQSf/BBDJOrM5+lfaT/Pl2alHRVJIUjMgGt+W3fZ1
         VNFdKaGpS+AYlB3c0VKNLvlEHOqvmgZ2ltH6+0tSUoiYCzUG5RAaAPfSzQGxaC1r7uPr
         riHiVGrzFWdD5ACl7QR8ltsZX1Uhs3cJx6UWCJ85997CCbqbZtctdxzwc3k/j0Khq+Tq
         5vQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=ocmnV2GWtSq3V0yNvdY3M/5w9Ajvv0VMgCeCDVSbzfM=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=Eq9sgwu9itze8NyxROctp0JV6Eyr9Yzsqkizn9iOWIrYdU6NMDdAAy5MyUxaPCJufW
         EUjdbz32Cb3z6gSEqg9VYnVZCIt9xKugqLPj64j0nyAae4406DUCwIneCd/ILMSJJxfR
         zR0fWoz9VVW9B+7Zn3RPr1AnVI8hX7NXnMP8c2SdweLqY6CdDeHGplSd4EfN9STECOcp
         dduuCPWH0r4j0hgj4JYXW2skQYQEUuZY8r9u2SYuQPLCAYEhGxVzpgE+n2Z4EMhSy7QT
         svgovtZR8ALvuTItyPDK3yT72ztSWA7J5hWN0hxQWFKFMkfz5WMlEKU4YuKTGr37RQYN
         O0wQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gtu9P52k;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b09c5a25si594876d6.415.2025.05.15.08.39.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gtu9P52k;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747323569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ocmnV2GWtSq3V0yNvdY3M/5w9Ajvv0VMgCeCDVSbzfM=;
	b=Gtu9P52kSsPrtMjaYFVjgUlIx+5u3BlLdinwZd8PqARQ45R1uNwRdYR+U3wtff+QbOD1t8
	lQlAXoOVgWTXoQlki43YhGq9AYSMF8S9b/EZY07Sn1JCgWvuMSWFOS+64XP1JUIUzj3joK
	Uy8bZlWTK3LotxtoQPl9C0yD1qJ9sf0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-VyR5x9TqPT-0LNh_wGrlmg-1; Thu,
 15 May 2025 11:39:26 -0400
X-MC-Unique: VyR5x9TqPT-0LNh_wGrlmg-1
X-Mimecast-MFC-AGG-ID: VyR5x9TqPT-0LNh_wGrlmg_1747323562
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8EC371800874;
	Thu, 15 May 2025 15:39:21 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.45.225.145])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C47C11956066;
	Thu, 15 May 2025 15:39:12 +0000 (UTC)
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
Subject: [PATCH v7 00/14] arm: rework id register storage
Date: Thu, 15 May 2025 17:38:53 +0200
Message-ID: <20250515153907.151174-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: MDpN5vmqtOoU

Some small fixes, including fixing up/adding SPDX identifiers, keeping the
series bisectable, and updating MAINTAINERS (please check if that's ok.)

Also available at
https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v7

<v6 cover letter>
Just some small changes:
- fixed up some botched conversions noted by Eric (thanks!)
- rebased to current master
- new patch with a small cleanup suggested by Eric

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
</v6 cover letter>

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

 MAINTAINERS                           |   1 +
 hw/intc/armv7m_nvic.c                 |  27 +-
 scripts/gen-cpu-sysregs-header.awk    |  35 ++
 scripts/update-aarch64-sysreg-code.sh |  26 ++
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
 18 files changed, 1105 insertions(+), 925 deletions(-)
 create mode 100755 scripts/gen-cpu-sysregs-header.awk
 create mode 100755 scripts/update-aarch64-sysreg-code.sh
 create mode 100644 target/arm/cpu-sysregs.h
 create mode 100644 target/arm/cpu-sysregs.h.inc

-- 
2.49.0
