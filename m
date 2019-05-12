Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1640805wrg;
        Sun, 12 May 2019 01:36:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwbBI4TAdu1FyvUgjl6eAxXzRTfRHURp/UnPKqGZ8/ABWWvFwJtXDFTbSFjCRLpB7pvqtaY
X-Received: by 2002:a0c:b04f:: with SMTP id l15mr4249795qvc.191.1557650194942;
        Sun, 12 May 2019 01:36:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650194; cv=none;
        d=google.com; s=arc-20160816;
        b=ew7j3rSIIzsWytWVx15yibMjeNWasL9KL1FrLKMaQ3U2I0wkAyDJLIvPGQd9QGNzWY
         jAK6AWAszszZ2uf+AF72XNLFvXuIPzkFGgaHSv7Q+osATP6ZSymzPNd4zf2O4ykdLw9q
         bpjoRMpaDoMe1G5zNSfq1qgG+fWCBuEPpyAzr9U60tI3TURIUXP/tRkvDT2vUFTpLZLI
         q8YsjDkA0xRmqwZqsIMmEt1tmjmcX0jAqUK05iwCxRK8ev60P9D5KqICAkSYuDAnV4+U
         fnqG1nD2Z7X0RrZ2ECJgR4YZchtheRJml5c5RoO5Km9RWZD+NoDTVddcElSUbt0dfpLo
         /5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=GhRCARSVWtxtXo9+pHWFAwkIsoX0csWFlyvOLkk3MPw=;
        b=MEBZvllRFNmtpkdoQpSv/Hm9EooCAU0cexNGbbljDuswnW50Xa43PpG9gf5AWdT7Wj
         HBS0Yw2TEE1MshMPXM9uRPbeSb/OQibqB392rBi37P+cPDs3+rZGxzMOnY1KDRcLBXrn
         JQVuPggRIjA6UJrZRHKjE3pd5yeUgOwETuohPCisrQ4/BLK6Y60VBz8/FlNHeAX6vVnK
         7fnIQo049Fmv0V7uROoXr+bu86dL2XPPL+LESz9gJTsLOxbQIwJNMkYvWWLM/yQj59gQ
         MB2hPn55V2NdPd1mv7VUi+AHrS5eIca2IuCDWMb6CivAkukhMt5fYyK2nBrjmCQCLbvt
         zWRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id z58si267923qtj.225.2019.05.12.01.36.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:36:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70DE93086201;
	Sun, 12 May 2019 08:36:33 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EEBF25D706;
	Sun, 12 May 2019 08:36:28 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	abologna@redhat.com
Subject: [PATCH 00/13] target/arm/kvm: enable SVE in guests
Date: Sun, 12 May 2019 10:36:11 +0200
Message-Id: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Sun, 12 May 2019 08:36:33 +0000 (UTC)
X-TUID: 5ZkbeDY1CxiO

With the recent KVM guest SVE support pull request [1] KVM will be
ready for guests with SVE. This series provides the QEMU bits for
that enablement. The series starts with the bits needed for the KVM
SVE ioctls. Then it enables the arm 'max'cpu type, which with TCG
already supports SVE, to also support SVE when using KVM. Next
a new QMP query is added that allows users to ask which vector
lengths are supported by the host, allowing them to select a valid
set of vectors for the guest. In order to select those vectors a
new property 'sve-vls-map' is added to the 'max' cpu type, and then
also to the 'host' cpu type. The table below shows the resulting user
interfaces.

   CPU type | accel | sve-max-vq | sve-vls-map
   -------------------------------------------
 1)     max | tcg   |  $MAX_VQ   |  $VLS_MAP
 2)     max | kvm   |  $MAX_VQ   |  $VLS_MAP
 3)    host | kvm   |  N/A       |  $VLS_MAP

Where for (1) $MAX_VQ sets the maximum vq and smaller vqs are
all supported when $VLS_MAP is zero, or when the vqs are selected
in $VLS_MAP.

(2) is the same as (1) except KVM has the final say on what
vqs are valid.

(3) doesn't accept sve-max-vq because a guest that uses this
property without sve-vls-map cannot be safely migrated.

There is never any need to provide both properties, but if both
are provided then they are checked for consistency.

The QMP query returns a list of valid vq lists. For example, if
a guest can use vqs 1, 2, 3, and 4, then the following list will
be returned

 [ [ 1 ], [ 1, 2 ], [ 1, 2, 3 ], [ 1, 2, 3, 4 ] ]

Another example might be 1, 2, 4, as the architecture states 3
is optional. In that case the list would be

 [ [ 1 ], [ 1, 2 ], [ 1, 2, 4 ] ]

This may look redundant, but it's necessary to provide a future-
proof query, because while KVM currently requires vector sets to
be strict truncations of the full valid vector set, that may change
at some point. Additionally, TCG doesn't have this restriction so
more vector sets can be returned that aren't so easily derived from
the full set already. (Note, this series doesn't do that yet. See
the TODO below.)

And now for what might be a bit more controversial; how we input
the valid vector set with sve-vls-map. Well, sve-vls-map is a
64-bit bitmap, which is admittedly not user friendly and also not
the same size as KVM's vls bitmap (which is 8 64-bit words). Here's
the justification:

 1) We want to use the QEMU command line in order for the information
    to be migrated without needing to add more VM state.
 2) It's not easy/pretty to input arrays on the QEMU command line.
 3) We already need to use the QMP query to get a valid set, which
    isn't user friendly either, meaning we're already in libvirt
    territory.
 4) A 64-bit map (supporting up to 8192-bit vectors) is likely big
    enough for quite some time (currently KVM and TCG only support
    2048-bit vectors).
 5) If user friendliness is needed more than migratability then
    the 'max' cpu type can be used with the sve-max-vq property.
 6) It's possible to probe the full valid vector set from the
    command line by using something like sve-vls-map=0xffff and
    then, when it fails, the error message will state the correct
    map, e.g. 0xb.

TODO:
 1) More testing. Initial testing looks good, and I'm doing more
    now, but wanted to get the series out for review in parallel.
 2) Extension to target/arm/arch_dump.c for SVE state. I'll try
    to get to this early next week.
 3) Modify the QMP query to output all valid vector sets for
    TCG, rather than just the ones derived by truncation as
    is required by KVM.

[1] https://www.spinics.net/lists/kvm-arm/msg35844.html

Thanks!

Andrew Jones (13):
  target/arm/kvm64: fix error returns
  update-linux-headers: Add sve_context.h to asm-arm64
  HACK: linux header update
  target/arm/kvm: Move the get/put of fpsimd registers out
  target/arm/kvm: Add kvm_arch_get/put_sve
  target/arm/kvm: max cpu: Enable SVE when available
  target/arm/kvm: max cpu: Allow sve max vector length setting
  target/arm/monitor: Add query-sve-vector-lengths
  target/arm/kvm: Export kvm_arm_get_sve_vls
  target/arm/monitor: kvm: only return valid sve vector sets
  target/arm/cpu64: max cpu: Introduce sve-vls-map
  target/arm/kvm: max cpu: Add support for sve-vls-map
  target/arm/kvm: host cpu: Add support for sve-vls-map

 linux-headers/asm-arm64/kvm.h         |  41 +++
 linux-headers/asm-arm64/sve_context.h |  53 ++++
 linux-headers/linux/kvm.h             |   5 +
 qapi/target.json                      |  34 +++
 scripts/update-linux-headers.sh       |   3 +
 target/arm/cpu.c                      |   5 +
 target/arm/cpu.h                      |   9 +
 target/arm/cpu64.c                    |  81 ++++-
 target/arm/helper.c                   |  10 +-
 target/arm/kvm.c                      |   5 +
 target/arm/kvm64.c                    | 418 ++++++++++++++++++++++----
 target/arm/kvm_arm.h                  |  32 ++
 target/arm/monitor.c                  | 106 +++++++
 tests/qmp-cmd-test.c                  |   1 +
 14 files changed, 732 insertions(+), 71 deletions(-)
 create mode 100644 linux-headers/asm-arm64/sve_context.h

-- 
2.20.1
