Received: by 10.25.0.144 with SMTP id 138csp572112lfa;
        Wed, 26 Apr 2017 20:29:27 -0700 (PDT)
X-Received: by 10.55.54.202 with SMTP id d193mr3218586qka.160.1493263767170;
        Wed, 26 Apr 2017 20:29:27 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id n124si1446168qkd.170.2017.04.26.20.29.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 20:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 908CA209B5;
	Wed, 26 Apr 2017 23:29:26 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 23:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=cAzxUbfOjBQa5eDjUz94g8BlOpa
	kofrHOPyRSnEz9Co=; b=o2Ke3gQnF9lK2cICOzv+zWW141AzQe70pBmye/rTXQO
	TjLdE3nC9+joJivAJKrZHXbODmPRRVZeIkN/lmT10Gk34EN+VbtwxXMtG6Lw+u9O
	74IOBp5AaKRnDTxQHToiNnnJpbwIPhUlvUf7wZYe18bFhx2v0QNaQ8ZglHvFMcy4
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=cAzxUb
	fOjBQa5eDjUz94g8BlOpakofrHOPyRSnEz9Co=; b=Z3HjKM5opA6WSA8g2RS2rC
	jF1FxqxXPg0GbhPjaMNGQwKHb20hqkLRm2F31k3RSp1r87jE3VnNvvBwwqU9Mvkz
	HWvjUOZg0mQlyqg83kgsHnCDx1rAh7wOaQ+3iboALWHULOfsftPZkMSesqYqdP2c
	rfaVmM2cdZ2nJgUgUGChCSx244NPuVndH0lYD0bhodp6QRKZ2P0fmbwxX0qMv/4y
	yKr3Ohaa9LGMfQyIPNdYSqpy/caONajKHn9qvyyI/SoBaHFkCs4UEBl/xu1adxcd
	NvyiV4BJuH86AtUOYr50/oxEEDbZjygrBsTaj8dcFzbRrMczeBTGT76MOHBprhWA
	==
X-ME-Sender: <xms:lmUBWUu2NmqA6ioYcX1WBgE3FhfHovVVJkfdTexfyMp1E8Qjdtk9Ew>
X-Sasl-enc: L71AdNmiiCvXTuCc3TauHFYhaxC+XclUw08PHU7M6/o+ 1493263766
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4709F24765;
	Wed, 26 Apr 2017 23:29:26 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: [PATCH v4 00/11] TCG optimizations for 2.10
Date: Wed, 26 Apr 2017 23:29:13 -0400
Message-Id: <1493263764-18657-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
X-TUID: OCbYo21L6/aX

v3 for context: https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg04795.html

Changes from v3:

- Added reviewed-by tags.

- Added a couple of suggested-by tags that I forgot to add in v3
  regarding lookup_and_goto_ptr and i386's implementation of goto_ptr.

- lookup_tb_ptr
  + Dropped the unnecessary exit_request check, as suggested by Paolo and
    Richard.
  + Only get the CPU state if we get a tb from the jmp_cache, as suggested
    by Richard.
  + Added tb_htable_lookup if we miss in tb_jmp_cache, as suggested by
    Richard. This requires an extra patch to export tb_htable_lookup.

- goto_ptr: add IMPL(has_goto_ptr), as pointed out by Richard.

- target/arm: added a comment about gen_jr. See the v3 thread for why
  it is needed.

- target/i386: use TCGV_UNUSED instead of (ab)using NULL on a TCGv,
  as suggested by Richard. Also took his suggestion to simplify
  the addition of jr + cs_base.
  To minimize churn I renamed gen_eob_worker to do_gen_eob_worker,
  which takes the newly added argument.

I have *not* re-run all experiments, because it takes several hours and
performance hasn't changed much from v3, as can be seen in these two charts:
* spec06int user-mode, test input, v2.9.0 baseline: http://imgur.com/ME2eMq1
* spec06int softmmu, test input, v3 baseline: http://imgur.com/Clolu9Z
The perf differences are mostly due to adding the htable check. Note that
its impact is small, since tb_jmp_cache has a %hit rate in the high 90's.

You can inspect/fetch the changes at:
  https://github.com/cota/qemu/tree/tcg-opt-v4

Thanks,

		Emilio
