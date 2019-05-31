Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp818657pjq;
        Fri, 31 May 2019 08:47:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwGmLa26S5UgyWc4un7n1bS1y6DEhLNVzIaDu4tI3JDkOzojz86mR2Vd6Tm0C1v1O63pQ40
X-Received: by 2002:aca:3305:: with SMTP id z5mr6439428oiz.141.1559317679186;
        Fri, 31 May 2019 08:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559317679; cv=none;
        d=google.com; s=arc-20160816;
        b=CeYFswqGsS8OvWuy644xdSDK+GDV7/YjJprL35bUxzbJRtp6na5E/PRHPvGWyqvj7u
         SXiXANYozGBBay1RuMS3hfRWsGJnabU0mCKCVkL3V0TeURRW0xrLeMQWZipbehRU9NY0
         PfB0GrZ/SAk04q/0q2iAo+7V7+mxqsVX41q9QQz7SW76GR4ubdFp/Omv1Ji4sVqzmADU
         cRHbHLHpXxGf2WXURI897rdnIeWGkHJxoO0kmDdRoe+ANkx503JaH0WNVUWHmDF8Pxei
         5HSxra41qzHRx7Ezg/HxJctkFuS3cb3YiCdcqKVS6zutUE33Walo2ZalLYrzzgbdaQxS
         K33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=d1sbZbQD6q1/oiEkYuLFJATbQtYLDDbBzmcYQH20bTU=;
        b=UnleZgnX8vWRRE5arLsYcvFEOOTJr6PMXjnzqaQADk+MwaBSB5NsM2SsjBJYqhU9mM
         LY6YhD/4S2JEStfxHnBoTAIPfLyVXzY1/k7b2MBZzbqj6UWCypLbKjRDYVEGBUgGl9U3
         ZT4IjIeWWI6j6F25zDYee9y8/h7e8VmFn1vzUvP2mtqwjdXyt0mLMkBTHLZ+tM5TE/bP
         pxbsiSxodFDY644+NPjZKhTbAX5emwGTdrmWzdUz6JN2J/PoTUfd34f4hfmYPUkpPC0F
         Sck7NtS6nBqurhtKuzNgG4+e9s1zIyCWoisu5WvdfZmpdUJ8nIe+rTUcWVKcRTsnSPW/
         yh/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c186si3305353oif.170.2019.05.31.08.47.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 08:47:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90E0F30C1FF6;
	Fri, 31 May 2019 15:47:49 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-73.brq.redhat.com [10.40.204.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D77C41001E6F;
	Fri, 31 May 2019 15:47:38 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Miroslav Rezanina <mrezanin@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 0/2] target: Build with CONFIG_SEMIHOSTING disabled
Date: Fri, 31 May 2019 17:47:33 +0200
Message-Id: <20190531154735.20809-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 31 May 2019 15:47:58 +0000 (UTC)
X-TUID: bEQGFpO65dNz

Amusingly Miroslav and myself hit this issue at the same time.

Currently there is no way to pass a CONFIG_X to sources in target/,
except via a Makefile rule (and filling with stubs).

Paolo says this is on purpose, CONFIG_X selectors are meant for
devices and we try to avoid having config-devices.mak in
config-target.h.

Some know (arch-specific) limitations are:

- MIPS ITU is accessed by coprocessor instr (ISA feature)
- MIPS timer is accessed by coprocessor instr (ISA feature)
- MIPS semihosting (ISA feature?)
- ARM semihosting (ISA feature?)
- ARMv7 NVIC (device)

This series attempt to fix this the most trivial way, adding
stubs for unreachable code.

Philippe Mathieu-Daudé (2):
  target/arm: Add stubs to build with CONFIG_SEMIHOSTING disabled
  target/mips: Add stubs to build with CONFIG_SEMIHOSTING disabled

 target/arm/Makefile.objs      |  3 ++-
 target/arm/arm-semi-stubs.c   | 21 +++++++++++++++++++++
 target/mips/Makefile.objs     |  3 ++-
 target/mips/mips-semi-stubs.c | 23 +++++++++++++++++++++++
 4 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 target/arm/arm-semi-stubs.c
 create mode 100644 target/mips/mips-semi-stubs.c

-- 
2.20.1
