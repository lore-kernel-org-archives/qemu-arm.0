Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2472185njb;
        Mon, 3 Feb 2025 16:22:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0YymekUV1aIJ+SrzhVFzG3BW9+c0G148Eewm1ws4pBB2E8SEb7VPNnknkom2cPgIGOOEwn2BXltO13g==@linaro.org
X-Received: by 2002:a5d:6d85:0:b0:385:df2c:91b5 with SMTP id ffacd0b85a97d-38c5166807emr20754307f8f.0.1738628564190;
        Mon, 03 Feb 2025 16:22:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738628564; cv=none;
        d=google.com; s=arc-20240605;
        b=Pd9zp0BLcfnM1XhvqG1IuUV+Wuk8JWI1HjVAu+faDBTW1YDPlHFssP+5G0Trk4dMuM
         KowyEh1wPQIDzMjS48vUCK8ibneSUeczhvLMqFtuB5EoH9FuCKC9ZpVHoaHrhZ+AhSJ6
         TzwfYlKy1EEjAKyPWnnvZwScnbs8T9cpc7FQj4EkEPTdwH5Np4dG8JQ5oyyc441ZV1QV
         pHdC5ehRpUCoQcaQXa+MBkCbX3Tnly9m76smMdz212S0LxBAgqNwDVI6+UD2oExe3t6p
         Rrz2h3OgfCMn4/veeYTYiiCpEkA6vM16ZBdmszjyWOD4VUdkeZIcknvLJBqAWFurgo9e
         JkNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=kZOdbeb6T6qDJ09VSMCL2tbpN7fDjsLgjuUeDOztlJw=;
        fh=MDZPaofUxTg6+HqGvaHBxyYJxY2GxL+30EbRNUpX5FI=;
        b=CEhYhstOcDiNkIJJq2YPAtupxNnsyFg8CVg31+AbZu0IpJVRYTJ/1n1GKOncilIoOB
         tyo86hpaiGl2xN8s1eEKOpPdFIDhp7FmlGTMnsllPUQZMlJefxAY0P29QxXBYp3H+tpW
         S9LB5d2FwLVoz35UGUDVwb2K6WMVVKV6EPVWiCskAKTrsEoDBwXb6SWKX6QEXvpVSuxD
         IyrKz16MCYV0ylXdI39owfVqjqeyl0UJ/F767wGOg/gW2aHy7//j/jmH9DNCuAyQJT5a
         fSL5iePyQNTELXrPPw8QTOLAzY0v/tMZ25jbVRIxAmrs34jhut2AVPYRoMK6qLYNNl5C
         oRxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PRxLGhrn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c0eb77dsor4078520f8f.1.2025.02.03.16.22.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 16:22:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PRxLGhrn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738628563; x=1739233363; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kZOdbeb6T6qDJ09VSMCL2tbpN7fDjsLgjuUeDOztlJw=;
        b=PRxLGhrnVEuIdOitmM9mqCnfJuu3elPKBTBrDo0yGQ+7rIdsxXLC2eXpCLnwSHatQV
         3P/RHKenF5/ziEEzzcOFCvtVUU+me8HBglIz7vqXWzYJZxW9FYWB/N5sUJJt/bR2EQeD
         mj0MRl48OlM+jKmW5DyD73Ql+xWvRj4RXOBsFTsWgwcU1+S7mWOU7vY+lUjYEUfb3UKQ
         l7Zi2fw0SNUJwrIwfDFBcwxCHSOyY9oJeU15CFcGoELOLcV8bytXFdCOzPrGXMzTc49p
         tX/FFiDqFt2lMhTFP1M3KDLpa2JS/+Ml7LuVT8frJxKBpBbgOCS7PNxzgwh9OqLIPO0p
         aebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738628563; x=1739233363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZOdbeb6T6qDJ09VSMCL2tbpN7fDjsLgjuUeDOztlJw=;
        b=b34I6rM15lWDMDjU0QT32n9cThkFz+vfsvFIdolBEQLBmaCjqcbYpVwEIT6ZnBMKLI
         WU3f6hNhqfLF9XErkZ7CfnNf+LJRwBCjSW1cYwA+VbEK6gEGKnCLByzWyj66xT/tyFvI
         0svbLRnNVUOOoefmcjTFzo68saDfyF5ckI0OKn0jnPbXs7HN2/JGd2qXcy1k16Jh8J4+
         LrIBc1ZK0Uqed7/hkEDxqOo3VnG0OJEjvYRBpppx/3Ssh1JQebm8qxZAUTq/ZI3zdv/S
         6cixGA4uKx1TrL+yQ3o5sr/G4jcM++PPBRRctKcBCX48BkqpVEdCkOMPdxDeevcBGj5K
         0oWw==
X-Forwarded-Encrypted: i=1; AJvYcCWKlnr+f78CB75+emqDjgm7wdrm3EB2g5KPTu7tUAKqlP7YdMJ/f8Mepv30ry6RGdBlciS2/AeNaXMQww==@linaro.org
X-Gm-Message-State: AOJu0YyLwpUE11M19w7GgiHLpIh1ys73uWrcL2jcA75jKBeIP8l8bW62
	O3BctIfH/SrnAGV9q5sctSWk30hPYeJzHR9WkV+JZnohH2SmOjvDzGJWv2SEsnWaow==
X-Gm-Gg: ASbGncuXtjsurYswvZ9kT2dy5s0dhRONxaXbUoey10VrbdSVMXk+3QyywddKFiLFyEv
	T98OqmSfTE6gcZwfh7G6uXruYApQN90FF8vTjXFW+lEmPWUG9uCztAIbkaOatyC77mph0mGHpqd
	iqZ58UQYaS3Pv3sbtgkT/c3lhCVB2cQdhjb8bd/D0ajac6TRVHC+S9dJ0o1i2dSzKi+mDuPbCE/
	uV1xbxpAr3QN++/822+RgUoEOMARSykjH2sEGI4j+3bWe08+QUdz5XTmGQvvDPqoKcXqY1BN9MT
	+Cqf9XU4jFEu2ZG5eLnAlBQCwsoxo61fYzymfXqK9dLhf/AS5/tMX9Ln4nEEh/F8Bw==
X-Google-Smtp-Source: AGHT+IHy6CJhM2TwAoAA8lJ+tS6d0s5TrMMgkexQg1HbHClkotfNU8RmQ08pWBRgcSa5vbyB0b6P0g==
X-Received: by 2002:a05:6000:1fab:b0:386:416b:9c69 with SMTP id ffacd0b85a97d-38c5194a58cmr20463197f8f.16.1738628563523;
        Mon, 03 Feb 2025 16:22:43 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38da8f6691bsm229504f8f.42.2025.02.03.16.22.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Feb 2025 16:22:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jared Mauch <jared+home@puck.nether.net>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	devel@lists.libvirt.org
Subject: [PATCH v2 00/12] hw/arm/raspi: Allow creating any Raspberry Pi machine
Date: Tue,  4 Feb 2025 01:22:28 +0100
Message-ID: <20250204002240.97830-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 7tU94FW69l6N

Full rewrite of v1 [1], addressing Zoltan & Peter suggestion.

Introduce a generic 'raspi' machine, which takes a 'model'
and 'revision' properties, and any memory size. The 'board_rev'
register is filled appropriately.

Before, merge raspi4b.c within raspi.c (more is planned here
with the MPCore refactor [2]).

Regards,

Phil.

[1] https://lore.kernel.org/qemu-devel/20250201091528.1177-1-philmd@linaro.org/
[2] https://lore.kernel.org/qemu-devel/20231212162935.42910-1-philmd@linaro.org/

Philippe Mathieu-Daudé (12):
  hw/arm/raspi: Access SoC parent object using  BCM283X_BASE() macro
  hw/arm/raspi: Merge model 4B with other models
  hw/arm/raspi: Unify RASPI_MACHINE types
  hw/arm/raspi: Pass board_rev as argument to raspi_base_machine_init()
  hw/arm/raspi: Consider processor id in types[] array
  hw/arm/raspi: Consider network interface for B models
  hw/arm/raspi: Check ramsize is within chipset aperture
  hw/arm/raspi: Introduce generic Raspberry Pi machine
  hw/arm/raspi: Have the generic machine take a 'revision' property
  hw/arm/raspi: List models creatable by the generic 'raspi' machine
  hw/arm/raspi: Deprecate old raspiX machine names
  hw/arm/raspi: Support more models

 docs/about/deprecated.rst               |  13 +
 include/hw/arm/raspi_platform.h         |   5 +-
 hw/arm/raspi.c                          | 383 ++++++++++++++++++++++--
 hw/arm/raspi4b.c                        | 136 ---------
 tests/qtest/bcm2835-dma-test.c          |   2 +-
 tests/qtest/bcm2835-i2c-test.c          |   2 +-
 tests/qtest/boot-serial-test.c          |   3 +-
 hw/arm/meson.build                      |   2 +-
 tests/functional/test_aarch64_raspi3.py |   5 +-
 tests/functional/test_aarch64_raspi4.py |   4 +-
 tests/functional/test_arm_raspi2.py     |   4 +-
 11 files changed, 385 insertions(+), 174 deletions(-)
 delete mode 100644 hw/arm/raspi4b.c

-- 
2.47.1
