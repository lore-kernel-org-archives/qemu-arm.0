Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id c4-20020adffb44000000b002bdc19f8e8asm2422687wrs.79.2023.01.24.10.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5E3691FFC3;
	Tue, 24 Jan 2023 18:01:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Michael Roth <michael.roth@amd.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	qemu-arm@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bastian-Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v2 13/35] tests/docker: Install flex in debian-tricore-cross
Date: Tue, 24 Jan 2023 18:01:05 +0000
Message-Id: <20230124180127.1881110-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hZQn5e+iNYxX

From: Philippe Mathieu-Daudé <philmd@linaro.org>

When flex is not available, binutils sources default to the
'missing' script, but the current script available is not in
the format expected by the 'configure' script:

  $ ./configure
  ...
  /usr/src/binutils/missing: Unknown `--run' option
  Try `/usr/src/binutils/missing --help' for more information
  configure: WARNING: `missing' script is too old or missing
  ...
  checking for bison... bison -y
  checking for flex... no
  checking for lex... no
  checking for flex... /usr/src/binutils/missing flex

  $ make
  ...
  updating ldgram.h
  gcc -DHAVE_CONFIG_H -I. -I. -I. -D_GNU_SOURCE -I. -I. -I../bfd -I./../bfd -I./../include -I./../intl -I../intl  -w -DLOCALEDIR="\"/usr/local/share/locale\""   -W -Wall -Wstrict-prototypes -Wmissing-prototypes -w -c `test -f 'ldgram.c' || echo './'`ldgram.c
  `test -f ldlex.l || echo './'`ldlex.l
  /bin/sh: 1: ldlex.l: not found
  make[3]: *** [Makefile:662: ldlex.c] Error 127
  make[3]: Leaving directory '/usr/src/binutils/ld'
  make[2]: *** [Makefile:799: all-recursive] Error 1

By pass the 'missing' script use by directly installing 'flex'
in the container.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230112155643.7408-1-philmd@linaro.org>
Reviewed-by: Bastian-Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-tricore-cross.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index 34b2cea4e3..5ae58efa09 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -20,6 +20,7 @@ RUN apt update && \
        bzip2 \
        ca-certificates \
        ccache \
+       flex \
        g++ \
        gcc \
        git \
-- 
2.34.1
