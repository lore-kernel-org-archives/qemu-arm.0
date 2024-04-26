Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l18-20020a170906645200b00a55bb18e3d7sm5790936ejn.168.2024.04.26.08.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:39:39 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E3E3E5F882;
	Fri, 26 Apr 2024 16:39:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Joel Stanley <joel@jms.id.au>,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Cleber Rosa <crosa@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 0/3] testing/next: s390x gitlab updates
Date: Fri, 26 Apr 2024 16:39:35 +0100
Message-Id: <20240426153938.1707723-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: bmv3jaiS5epz

I was asked to update the custom gitlab runner from the aging 20.04 to
22.04 which has been done. However I needed to update the provisioning
scripts and clean-up some of the cruft. Sadly this doesn't seem to be
passing cleanly as we have:

  - qtest-s390x/migration-test ERROR           98.94s   killed by signal 6 SIGABRT
  - failing TCG tests (on s390x HW)
     - float_convd fails against a generated reference
     - clc returns 1

There are also lots of scary DSO warnings:

  BFD: warning: system-supplied DSO at 0x7fedb6479000 has a corrupt string table index

Can I leave that to the respective maintainers to investigate please
as I have a publishing deadline coming up.

Thanks,

Alex.

Alex Bennée (3):
  build-environment: make some packages optional
  gitlab: migrate the s390x custom machine to 22.04
  gitlab: remove stale s390x-all-linux-static conf hacks

 .gitlab-ci.d/custom-runners.yml               |  2 +-
 ...20.04-s390x.yml => ubuntu-22.04-s390x.yml} | 32 +++++++++----------
 scripts/ci/setup/build-environment.yml        | 16 ++++++++--
 3 files changed, 29 insertions(+), 21 deletions(-)
 rename .gitlab-ci.d/custom-runners/{ubuntu-20.04-s390x.yml => ubuntu-22.04-s390x.yml} (80%)

-- 
2.39.2
