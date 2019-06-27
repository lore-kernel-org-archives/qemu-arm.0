Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1693689wru;
        Thu, 27 Jun 2019 13:27:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy6+OEOQJNIcVKDLb5J9GF2fPiOaocPd8JHHwL4qVmLjoWhK8Bojr+jSQS8Y+mlPVZ5FT7N
X-Received: by 2002:a0c:b04d:: with SMTP id l13mr5068881qvc.104.1561667267922;
        Thu, 27 Jun 2019 13:27:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667267; cv=none;
        d=google.com; s=arc-20160816;
        b=GnwK7qUTM8Sdyi/6EeYHRVKxDMtkNexd7ar2u6IJC39sD9/eK5wvOvK5ddEdC7rDpR
         i6QeJ97GCndU3ualg5Df2BUamtUpeFoDjPkOGzLeyn1YejD9TAZvEda2VpybtSCPvD0p
         jBCKtwQKIg/qSn5dNWrY3w9UAKdgXTBfLBza3Bm94PXgQu+EH4PL03u0HmiE3BCcyq/2
         +QCWVv79mpCjS0f0rFVWqljDwFP0+qtBYJBshNfFukVfIIvr1XofuqJYToR83pDOHN6U
         gRZUEnqVBLD8Y9X0sjfQMAW+UjxVCInQLnofyiZU91ZEdRVTr7v6g9ytN6SRK0OtUF5W
         S+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=bhXOABspjKDrvNZWzmLq/KYiGsya2/rvllb1WhqKWwI=;
        b=UbPGzaWrs+JatZOecAhtTBzL+O6pHfuIdGBLfii0UJ+yOL7J5I4Tlkzt0xCnAPm6WA
         AQa3u2Sx78k28UF9pURhgRRrohyyxM+i4wKVFmC0osIO6kXzTbPvrPKPBDdEr3/ETqOI
         gQdyYgS7FOVYM33tVPFm5dI2WrHfsy8DGkNuYY1+WbJvj/B9I6NiMkpQlhcaC0c9z22m
         uI7ovGbQoqTSnsWSKPXYEIi2u97JoqntXYGQPTXlh6FeWTeLTJn70YBeMGTOxO0BgoI4
         t8QsdB/9ekY8L7jOpPZh2FuEnHp4vV5pFiZgIMbe+U1q7BaiZb2jZTdX51EwqWOqcXlM
         4Afw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id b7si102183qtg.142.2019.06.27.13.27.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:27:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1CED3082A9C;
	Thu, 27 Jun 2019 20:27:35 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F18C7600CC;
	Thu, 27 Jun 2019 20:27:21 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	qemu-devel@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
	qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 00/28] block/pflash_cfi02: Implement missing AMD pflash functionality
Date: Thu, 27 Jun 2019 22:26:51 +0200
Message-Id: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 27 Jun 2019 20:27:37 +0000 (UTC)
X-TUID: gl19r4AZmW9n

Hi,

This series is based on Stephen Checkoway work (v4):
https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg04595.html

Stephen work is a great improvement of the actual code, however
while reviewing his patches, I found them quite dense, so I started
to split each logical change to be able to digest his series.

Sfephen implemented the 'interleaving' feature in way I am not yet
confident it is in the project best interest. The relevant thread
started here:
https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg05395.html

However meanwhile we will discuss his interleaving implementation,
I don't want to block the rest of his work, so I took that patch
of (and rebased his work).

I'm spamming all the maintainers of the boards using
pflash_cfi02_register(). This series is not 'block' related, it is
a classical 'device' model series.
Help reviewing is appreciated :)

I am still looking for real-world code stressing this flash model.

Regards,

Phil.

Philippe Mathieu-Daudé (20):
  hw/block/pflash: Simplify trace_pflash_io_read/write()
  hw/block/pflash: Simplify trace_pflash_data_read/write()
  hw/block/pflash_cfi02: Fix debug format string
  hw/block/pflash_cfi02: Add an enum to define the write cycles
  hw/block/pflash_cfi02: Add helpers to manipulate the status bits
  hw/block/pflash_cfi02: Simplify a statement using fall through
  hw/block/pflash_cfi02: Use the ldst API in pflash_write()
  hw/block/pflash_cfi02: Use the ldst API in pflash_read()
  hw/block/pflash_cfi02: Extract the pflash_data_read() function
  hw/block/pflash_cfi02: Unify the MemoryRegionOps
  tests/pflash-cfi02: Refactor to support testing multiple
    configurations
  hw/block/pflash_cfi02: Remove pointless local variable
  hw/block/pflash_cfi02: Document the current CFI values
  hw/block/pflash_cfi02: Hold the PRI table offset in a variable
  hw/block/pflash_cfi02: Document 'Page Mode' operations are not
    supported
  hw/block/pflash_cfi02: Extract pflash_regions_count()
  hw/block/pflash_cfi02: Split if() condition
  hw/block/pflash_cfi02: Reduce single byte/word write delay
  hw/block/pflash_cfi02: Document commands
  hw/block/pflash_cfi02: Reduce I/O accesses to 16-bit

Stephen Checkoway (8):
  tests/pflash-cfi02: Add test for supported CFI commands
  hw/block/pflash_cfi02: Fix command address comparison
  hw/block/pflash_cfi02: Implement nonuniform sector sizes
  hw/block/pflash_cfi02: Fix CFI in autoselect mode
  hw/block/pflash_cfi02: Fix reset command not ignored during erase
  hw/block/pflash_cfi02: Implement multi-sector erase
  hw/block/pflash_cfi02: Implement erase suspend/resume
  hw/block/pflash_cfi02: Use chip erase time specified in the CFI table

 hw/block/pflash_cfi01.c   |  11 +-
 hw/block/pflash_cfi02.c   | 703 ++++++++++++++++++++++++++------------
 hw/block/trace-events     |  10 +-
 tests/Makefile.include    |   2 +
 tests/pflash-cfi02-test.c | 681 ++++++++++++++++++++++++++++++++++++
 5 files changed, 1173 insertions(+), 234 deletions(-)
 create mode 100644 tests/pflash-cfi02-test.c

-- 
2.20.1
