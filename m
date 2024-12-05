Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp462196njb;
        Thu, 5 Dec 2024 14:22:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWO38wZhdXRxcB1wisU38/bhsjGKYNcbLCntzSi28YdVrFnJhatfSRw42myKID57IOk4/IWERwAduF/rA==@linaro.org
X-Received: by 2002:a17:903:2306:b0:215:734f:ffd5 with SMTP id d9443c01a7336-21614d1ef99mr6239305ad.11.1733437369162;
        Thu, 05 Dec 2024 14:22:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733437369; cv=none;
        d=google.com; s=arc-20240605;
        b=iHBKgpKxgWyzOMvEaZQNOas71feTfnLgaPmR9p9tM/qSDs5j+Ymh84xRmIuE51XgrR
         HQg+2x/lM19q/GNoLImqVSQ/pNC6ivjnSprLibDd+3xAAOFnsnS+3d0pmSv8lF5NN0gP
         3VH4xF5NohgW1Ev3havQIyCbw3m7Zl91O8p5GK6lNCloTD1dhK3MFtDytoZNHKaLwRT/
         u8q7bFVBrrVqTI8Njbr65Y9x2Q2MlixIJg7FbfWFe1oIsr/8kOjhz6/OkVmgBX2EhxTq
         Ea9kQKbj7lTT8OM/dDOnclXMqZo3SAdJwJFK5IrHWcEU3aoLuCSoUUNCpyeblcFPxSLg
         91rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=fIZCLlFZjn+KeB33XmENBZ2FZNb5x3KZq8MhJwQPh+Y=;
        fh=nojGpM40spum6M9ePGmXUicbs91TOt6PzZc+2xJANMI=;
        b=cYbZ4/HDMCCbFUsbT8Rf9pT2XQq2FoIm2X5a10/2cJ7F5s0t8F4FtsDp8qoniu1mMI
         gHNSB2DZ9RT7zkFea/iN9MIEt3t7sz6Sd3oHQD5dIdrIBTIRg85MQJiu6MDA6J81QIDv
         VrYHyvwwtiPT6H2cgroFbeju4zR1RzX8QDzRtkZehEpP0y6+JpoXH5DJYxSIQUADRxLK
         6xk6hrUDlTCAYrqBuHP5Gzfirc8jT8qFNyuQDKGFoEMgq8/bgthI3z1wTwv/7gGyXLAQ
         HWupmxgROw87lxPEEZhRpnTLrtAQk1Prb8Eq/Vzd4o/EIPERdUaKwJkc1+08tC9ulRar
         98RQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DlzUe55H;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f8f26167sor21841535ad.11.2024.12.05.14.22.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 14:22:49 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DlzUe55H;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733437369; x=1734042169; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fIZCLlFZjn+KeB33XmENBZ2FZNb5x3KZq8MhJwQPh+Y=;
        b=DlzUe55HtzGjpJeyvHixXxApBpIeCACP2io6qypgHBFJp2XI+z2s8Tu+2QrKNo/CVg
         PaFxXSwHL3HCV8ypemurRCUoQj2vgKD41VHjbHdIhPSEwNCzfysAk/+DhjpKP9CUcuim
         oVH6QqE4t0ndLiwCiciTu9fLrBOts05U0B6YvV0sFSIahqspeQj3eaeJtsNF3ZuDI514
         Q/r/Vq3xDvCqzTVw6+EgV+FZkpn+Y+Qfw6qmANSKMJd2nyqj/FzXKfT7Zn+p0VwtheQq
         yCGzEcn/v5zQd95acmfRCW5gGt659kFg/cxw6IYoXV6EeRstChO4gWVqpte+OgsUmdik
         0zCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733437369; x=1734042169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIZCLlFZjn+KeB33XmENBZ2FZNb5x3KZq8MhJwQPh+Y=;
        b=sxa6PVsBvXonCLO90qizj4+NyflUhJ+qwDotiYwyqeyStqlzB9h1M6fbDbjV7DIvJQ
         wHLO05HpXI9iyv/m8QfA+8WelgFqCvUHODeTsPiHlwW+ZIuNCnp16BYqXXjb2bAZnu2k
         RvZ2L/BdqrUNP+wpTqydY95tJTszFjkLLqnm1SGaYokwrvu/JV5zOqJSILV8MjIMjkFY
         /8YXNITNHxdPsf/yrH3zLA+PfoY6pPisTGBAMIpCemLa26qmelbz7iP3YpTZ+STN1tCL
         Yl6YiRQBKY6RhoonPp344+lrOSrZ7iVjGpKPHOqh+ZiAbfvOIKQeGul/NY0v1x9yjsG6
         TOsA==
X-Forwarded-Encrypted: i=1; AJvYcCWLV72guwbPloPlStQ/jtNSTHHaBPpm/lChOE39//CbD73S+nRlEmowJE7TRndZl/9shA7ZQ1RU62D8Tw==@linaro.org
X-Gm-Message-State: AOJu0YyWzkZw6bE84OPALh1v1DO5RAoG7UUhlCKYpuibJ+l9M2d4AUcz
	R4B2EQldHwglmSZ6+ymNYWPoCoJpooWWV/sOdL+qw++f2k/dc2pTTz5cuoZA8XRDPQ==
X-Gm-Gg: ASbGnctcoK8S/Vrm9PPxIN2uLEFOkPxoe4rDLA2SGKa1g4CrE64E1H217EElsYFTeO0
	DwcIASXHDkNDfQShqB9lIKqdssMhxttDPS5LAnK8i3bvioDMDNCcdk9prqvPGyrtRb0tE+y/u0U
	lscg062DPYrxZBV2dJA33PVY2jQSdz/blNDj/8oBUew1Ie1LQ4XxckiSQBI37ktgs+t/3p8NNxc
	Hn1DMqc9OD1iwW9oGHVyYEEf5nJWQd5Ni0O7ML6EXVjMR8rchJrjRoxLX6zQkIt+EYHFXUZJ2Ph
	wH4p/zpc
X-Google-Smtp-Source: AGHT+IHEiRQZWoTzhKGk3kCnrMtff4BEP5jOQOAxVAngR/KhljA0z7CJRxakl0OvWhxNlFm5pVWSfg==
X-Received: by 2002:a17:902:c405:b0:212:40e0:9562 with SMTP id d9443c01a7336-21614d54187mr6696405ad.25.1733437368685;
        Thu, 05 Dec 2024 14:22:48 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f0b571sm17310435ad.183.2024.12.05.14.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 14:22:48 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	gustavo.romero@linaro.org,
	Andrew Melnychenko <andrew@daynix.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	manos.pitsidianakis@linaro.org,
	qemu-block@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 0/6] Enhance documentation for new developers
Date: Thu,  5 Dec 2024 14:22:35 -0800
Message-Id: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7EbBGFzcE0rV

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

v2:
- removed how-to section
- integrated all suggestions from Daniel and Peter (thanks for all your comments)
- Note: build environment keeps mentioning windows-arm64 because we solved the
  issue with gcc_struct attribute. The related series will be merged before this
  documentation.

Pierrick Bouvier (6):
  docs/devel: remove dead video link for sourcehut submit process
  docs/devel: add git-publish for patch submitting
  docs/devel: add b4 for patch retrieval
  docs/devel: add information on how to setup build environments
  docs: add a codebase section
  docs: add a glossary

 docs/about/build-platforms.rst         |   4 +-
 docs/about/emulation.rst               |   2 +
 docs/devel/build-environment.rst       | 118 +++++++++++
 docs/devel/codebase.rst                | 218 +++++++++++++++++++
 docs/devel/control-flow-integrity.rst  |   2 +
 docs/devel/decodetree.rst              |   2 +
 docs/devel/ebpf_rss.rst                |   2 +
 docs/devel/index-build.rst             |   1 +
 docs/devel/index-internals.rst         |   2 +
 docs/devel/index.rst                   |   1 +
 docs/devel/migration/main.rst          |   2 +
 docs/devel/multi-thread-tcg.rst        |   2 +
 docs/devel/qapi-code-gen.rst           |   1 +
 docs/devel/submitting-a-patch.rst      |  34 ++-
 docs/devel/testing/main.rst            |   9 +-
 docs/devel/testing/qtest.rst           |   2 +
 docs/glossary.rst                      | 280 +++++++++++++++++++++++++
 docs/index.rst                         |   3 +
 docs/interop/qemu-ga.rst               |   2 +
 docs/system/arm/virt.rst               |   2 +
 docs/system/images.rst                 |   2 +
 docs/system/qemu-block-drivers.rst.inc |   2 +
 docs/tools/qemu-nbd.rst                |   2 +
 docs/tools/qemu-storage-daemon.rst     |   2 +
 docs/user/main.rst                     |   6 +
 25 files changed, 697 insertions(+), 6 deletions(-)
 create mode 100644 docs/devel/build-environment.rst
 create mode 100644 docs/devel/codebase.rst
 create mode 100644 docs/glossary.rst

-- 
2.39.5
