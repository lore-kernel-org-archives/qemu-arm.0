Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3193084wru;
        Mon, 1 Jul 2019 17:13:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZIwLubl+R8aRKp4mdWPXxuIlo+XRLIR46+o8pPxHA4UkwAPPZF1PLkAcBNBt3RAoFIv1+
X-Received: by 2002:ac8:3637:: with SMTP id m52mr22653097qtb.238.1562026408147;
        Mon, 01 Jul 2019 17:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562026408; cv=none;
        d=google.com; s=arc-20160816;
        b=coRf8WbFOsRbRuI+WX5OQXtvqfcXx5hanJPfcyw+D1UES2ksrdm4xWvoIRVPik6PeK
         k2Cq+iMcWR1VSZBHHZkjLeSym0z/sZKMcsQROhN/Mbty9V5GxdG6Zy4yKY2f4FxTpB91
         6joz/ZRDb5KTXr4GVMXUms0FqDFhetSE8huzyGXITnTYhGuNtHSvrdxLVM0J88u/fONq
         v9PSm43k2E/XoHSnSAWYrt4lOdjIFpBOxfzTO8/1u3zsL6Hj7m3TmpD4HLVn23EbTCyx
         Ej6nW7Kqodie6x1jnJerGenZb9JUwKW/xsVE0w2VtR3pIMyAxS/n5qPgRpdNZFSBxLZJ
         IViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=YGDJqcw3ZVLif2Ehw7BIFZ1IFTLmytBKPS0ONIwQTrQ=;
        b=Va4LMeTeTFES7h9PctFS5leU5OYYvv1/J6Av1N6duDtZJuwDelNvTLVeftqKMzK+EY
         TNKHIwb6s9XzeiHIbS1rF7CM2iCmXjJgM22mTIHBiFCuSJlIqnu1tMW65/QPLRAIlsTg
         HoEO0P1JDhtwVy9DCYVmyLahgTYfQKIF+WK6X8JL7eFlsKa15QOqFM4KnT0ew28TPBh8
         /XCW93K1qWaDf3yyxmbP/Hug4Ksw1URUSgF2fxViHFENPwFRpscqij8fEfhDAFktuNUU
         vY20Lp1P/XGIzuRruiRn1IDYUTZSX2HBA0V5B7NvJ6+/HXEXBGPbObn4iWi1nTmGN9Sj
         Z2AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f63si9359549qke.124.2019.07.01.17.13.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 17:13:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9F6FC07014A;
	Tue,  2 Jul 2019 00:13:26 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE45F10018F9;
	Tue,  2 Jul 2019 00:13:04 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Wei Yang <richardw.yang@linux.intel.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Markus Armbruster <armbru@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair23@gmail.com>,
	qemu-block@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>
Subject: [PATCH v2 0/9] hw/block/pflash_cfi01: Add DeviceReset() handler
Date: Tue,  2 Jul 2019 02:12:52 +0200
Message-Id: <20190702001301.4768-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 02 Jul 2019 00:13:27 +0000 (UTC)
X-TUID: wqCYmZBsvtRj

The pflash device lacks a reset() function.
When a machine is resetted, the flash might be in an
inconsistent state, leading to unexpected behavior:
https://bugzilla.redhat.com/show_bug.cgi?id=1678713
Resolve this issue by adding a DeviceReset() handler.

Fix also two minor issues, and clean a bit the codebase.

Since v1: https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg00962.html
- addressed Laszlo review comments

Maintainers spam list from:
./scripts/get_maintainer.pl -f $(git grep -El '(pflash_cfi01_register|TYPE_PFLASH_CFI01)')

Regards,

Phil.

Philippe Mathieu-Daudé (9):
  hw/block/pflash_cfi01: Removed an unused timer
  hw/block/pflash_cfi01: Use the correct READ_ARRAY value
  hw/block/pflash_cfi01: Extract pflash_mode_read_array()
  hw/block/pflash_cfi01: Start state machine as READY to accept commands
  hw/block/pflash_cfi01: Add the DeviceReset() handler
  hw/block/pflash_cfi01: Simplify CFI_QUERY processing
  hw/block/pflash_cfi01: Improve command comments
  hw/block/pflash_cfi01: Replace DPRINTF by qemu_log_mask(GUEST_ERROR)
  hw/block/pflash_cfi01: Hold the PRI table offset in a variable

 hw/block/pflash_cfi01.c | 140 +++++++++++++++++++++-------------------
 hw/block/trace-events   |   1 +
 2 files changed, 74 insertions(+), 67 deletions(-)

-- 
2.20.1
