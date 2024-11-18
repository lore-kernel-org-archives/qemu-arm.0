Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2742953njc;
        Mon, 18 Nov 2024 09:24:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWqWvTkA38nz4x82s2f3T/hiKBn509sOl8FuDJUguJhTjZXCpMRqJ6v1qqkBR4+iOPtf5YDTpAOTyMsYg==@linaro.org
X-Received: by 2002:a17:903:22c3:b0:20c:7ee8:fc3c with SMTP id d9443c01a7336-211d0d70eedmr179792135ad.22.1731950654178;
        Mon, 18 Nov 2024 09:24:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731950654; cv=none;
        d=google.com; s=arc-20240605;
        b=AnHgTgbbTUDxlrzacNFV+gB4TsrSHovINkeV6UKJVUGE1vbFW02elZ99+8QELr8V+W
         yHB2MQGFclFIvdQgRjzyPayiGaW9Hq+j+Gck+l/DQFXpzHamgSc8634vpsZW1k2t7I7y
         JtwTrObkjplbMtMsu/+F47UbBLJqzZ4OHEoIQn81Xm0OlrTPdvGKCS8YuiXJVCcLcb1n
         JctfZ6chJzy0AzgwjLFoKhDJCDmQW0IKa2SIMfoBJ/8rbshEAwGUPH9cPgvi18oTL8cj
         XvqA2w4btyvt6jTu371PCofHeOG57JfXTFALfFnL8hpv11ySzlYfd+PLxZnLPUvXmUDT
         Xycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=e4XkJsAE/EFpWJE1zVEboiYzZ4XYd9X73tpjRSnXg6Y=;
        fh=P31AJsUvSFr/Daed2bFEN7kXNGha+Zim9r6dNww+w1c=;
        b=j0xsmHJC3EVakUW5E4nIDsLB2OHVQKgSLbZ7m1BT7ZN3Us1geQOaeCFfSPggSq3ISC
         v7G2H4il4J2MaXnT8auPVUs9d2UbFRlWl3I1bAQv66PaRHYbRl0JyROj6mQdghCl091C
         eYUMJNJ2kr3PSXhc1m/FzSzNkoOYdMWeZjClezbbrIGSgVJQSVTkz4WqnYSnHLbgQwCW
         RCG32JcGN6yzr0ewDQ5Q+lJ7Y76103gqRzoN0HYwOFjqII7qhK9Ewm3EflzIeX5sU2YP
         yPiCo2ol9ZpV8qbP2nASqJFz7k0mXKlCg8YyQOad6mpVeDBNcfxvF12PwuqkJB0vgooI
         ohGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fUjFpJRk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2124bf3efeesor547345ad.11.2024.11.18.09.24.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Nov 2024 09:24:14 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fUjFpJRk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731950654; x=1732555454; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e4XkJsAE/EFpWJE1zVEboiYzZ4XYd9X73tpjRSnXg6Y=;
        b=fUjFpJRkDjUwMKQ7N0fK4Dgqp5R6ep+bcq81smC4/cjIQ05fDnbUHM1IPfXclGw/Iq
         8Tr/Ih+jEGq+WI1ZiaHTARsGBsCKjH0Byvzla26fNTAy5zrMG77e/OI+C3oRGXviZfqr
         Ci0ssZpGVXkHSWo4kVdIlSdMHH4ze+X/7XRGsOUX7Aoirn+xUgCh9dLRJw5Ydiz72crI
         phVAY6GDc7hpXchjgRa2jUdVPvVHAfZmifetuhpcAV5D7NcLG+5CEHyHmSG/WQN7oPaL
         Z9H6x2yWfgf/38QQj5/EHWfV3y6EY1K41VKnx2cCm/J6ZQ3OwenpmR2xkESrQlUUTk65
         QS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731950654; x=1732555454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4XkJsAE/EFpWJE1zVEboiYzZ4XYd9X73tpjRSnXg6Y=;
        b=VpMDMvxA/VBIURWGPPOQe6WvlPX0fQWqZ/2oWxR3gyyPUHcnoZbzsWB/pQhGBYCfeI
         8P7+w+wNGmfSGsLhSZSGaToO6IYpgTxC79lV7jP4KcmQ9gBmLmbRFiy5iU9AVTHn7gTY
         KFD3bXP9BU9ly6xElZKVny1YiEDtzbxJuahYYZak+lVZFRO0qXzBrcNxYnQnnlnLVNgr
         fK/6PQ4gapZ76L9RRXniOMfcgvqtTPMlN6ljQE37xF598zCIskr0L7IZCIsg29hVjkuo
         QQ9hK61D+bHNvoCMgW6IGJ02elZvb5UawsuBI7s1Jdwgwz2Tps0qFA9w+AEhXGAEdIVJ
         88pA==
X-Forwarded-Encrypted: i=1; AJvYcCXViCDUzYv1tADZwemRl8jDHdjvIe5GN+EptmB5mDqbpg1MOKTWDVqN9CEY4uPArLmkPXDW3JA6vuHo6g==@linaro.org
X-Gm-Message-State: AOJu0YwRDVj9R/jUxQl5/qyxpgF7Feu8DYunEUqObqHFHFxmINy40X9k
	cuB6+Z29BEQ7Cq2+7+Cq4DnjS0eJpYlELyvBQcf/uuseJSQdojks/QxDu3p8mpIGnw==
X-Google-Smtp-Source: AGHT+IGCNPa5oEuHAc4+eGbiDJ9GjGH5o5xmHOYseloT5NM0kDwDS1L6jCoWMaLdELUpPJahY/WmhQ==
X-Received: by 2002:a17:902:e843:b0:210:f6ba:a8e9 with SMTP id d9443c01a7336-211d0d70e62mr184708445ad.19.1731950653665;
        Mon, 18 Nov 2024 09:24:13 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f55d04sm59469765ad.264.2024.11.18.09.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 09:24:13 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Melnychenko <andrew@daynix.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	alex.bennee@linaro.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Fabiano Rosas <farosas@suse.de>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	qemu-arm@nongnu.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	manos.pitsidianakis@linaro.org,
	qemu-block@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	gustavo.romero@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 0/7] Enhance documentation for new developers
Date: Mon, 18 Nov 2024 09:23:50 -0800
Message-Id: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BmFjl+wBdsa9

This series extends our documentation with new pages to help developers
onboarding on QEMU. It focuses on providing a big picture of QEMU (to a
modest extend).

As such, it was written to be simple, short, easy to understand, and pointing to
more details. It provides another way to dive into details instead of simply
hitting the "search" box.

The first patches enhance the existing developer section. They provide
information about b4 and git-publish, two important tools that I learnt from my
coworkers, and were not presented anywhere, and were really missing IMHO.

Then, we introduce a new Codebase page, presenting (succintly) the various parts
of QEMU, and what every folder of the codebase contains.
We then add a glossary with the most recurrent acronyms we hear in our daily
conversations on the mailing list.
Finally, we add an "How-to" page which present how to build and test qemu, and
how to contribute a patch. It's definitely a repetition of existing information,
but the goal was to have a self contained page with all the commands I run
daily personally, and that someone would be interested to have.

When reviewing, please keep in mind this is targeting someone who discovers
QEMU, and not someone who contributed to the project for several years. What is
obvious for you will not be obvious for a random young developer.

That said, please free to point if something is "false", or "really incomplete".
It can be hard to summarize in one or two sentences complex parts, but that's
the intent here.

Your feedback on content or organization is very welcome!

Thanks,
Pierrick

Pierrick Bouvier (7):
  docs/devel: remove dead video link for sourcehut submit process
  docs/devel: add git-publish for patch submitting
  docs/devel: add b4 for patch retrieval
  docs/devel: add information on how to setup build environments
  docs: add a codebase section
  docs: add a glossary
  docs: add a how to section

 docs/about/build-platforms.rst         |   4 +-
 docs/about/emulation.rst               |   2 +
 docs/codebase/index.rst                | 211 ++++++++++++++++++++++
 docs/devel/build-environment.rst       | 114 ++++++++++++
 docs/devel/build-system.rst            |   2 +
 docs/devel/control-flow-integrity.rst  |   2 +
 docs/devel/decodetree.rst              |   2 +
 docs/devel/ebpf_rss.rst                |   2 +
 docs/devel/index-build.rst             |   1 +
 docs/devel/index-internals.rst         |   2 +
 docs/devel/migration/main.rst          |   2 +
 docs/devel/multi-thread-tcg.rst        |   2 +
 docs/devel/qapi-code-gen.rst           |   1 +
 docs/devel/submitting-a-patch.rst      |  29 ++-
 docs/devel/testing/main.rst            |   9 +-
 docs/devel/testing/qtest.rst           |   2 +
 docs/glossary/index.rst                | 238 +++++++++++++++++++++++++
 docs/how-to/index.rst                  | 146 +++++++++++++++
 docs/index.rst                         |   5 +
 docs/interop/qemu-ga.rst               |   2 +
 docs/system/arm/virt.rst               |   2 +
 docs/system/images.rst                 |   2 +
 docs/system/qemu-block-drivers.rst.inc |   2 +
 docs/tools/qemu-nbd.rst                |   2 +
 docs/tools/qemu-storage-daemon.rst     |   2 +
 docs/user/main.rst                     |   6 +
 26 files changed, 788 insertions(+), 6 deletions(-)
 create mode 100644 docs/codebase/index.rst
 create mode 100644 docs/devel/build-environment.rst
 create mode 100644 docs/glossary/index.rst
 create mode 100644 docs/how-to/index.rst

-- 
2.39.5
