Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904086cfsm3672345e9.4.2025.01.16.08.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:03:07 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 65EBF60812;
	Thu, 16 Jan 2025 16:03:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Peter Xu <peterx@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Garzarella <sgarzare@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Kyle Evans <kevans@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 00/37] maintainer updates for jan '25 (semihosting, gdb, plugins, docs) pre-PR-FINAL
Date: Thu, 16 Jan 2025 16:02:29 +0000
Message-Id: <20250116160306.1709518-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: t/pNIOyMZEl6

Only a few changes from v2, sending out to cut a PR tomorrow

  - applied r-b tags
  - fixed bsd-user gdbserver_start
  - a few minor tweaks to commit messages

This covers my remaining trees outside of testing/next and is mostly a
consolidation of patches I've pulled from other people.

For semihosting:

  - a bunch of cleanups from Philippe to aide single binary builds

For gdbstub (touches system/vl.c as well):

  - propagate *Error to setup functions

For plugins

  - mostly fixes from Pierrick
  - a speculative fix for cpu_io_recompile() case exposed by Julian's
    discontinuity patches.
  - windows clang build fixes

For docs (new for v2)

  - Some old docs/next I found in my tree
  - A dependency fix to ensure we rebuild if we change the kdoc script
  - Pierrick's devel updates

Additional (new for v2)

  - optimising the nsis.py script from Stefan

Most are already reviewed, the following remain:

  docs/sphinx: include kernel-doc script as a dependency
  include/exec: fix some copy and paste errors in kdoc
  tests/qtest: fix some copy and paste errors in kdoc
  editorconfig: update for perl scripts
  plugins: fix kdoc annotation

Now testing/next is merged I'll cut a PR for this on Friday. I suspect
I'll do another gdbstub/next once this is merged. I don't think I have
anything else pending but do shout if there is.

Alex.

Alex Bennée (11):
  semihosting: add guest_error logging for failed opens
  system/vl: more error exit into config enumeration code
  system: squash usb_parse into a single function
  system: propagate Error to gdbserver_start (and other device setups)
  accel/tcg: also suppress asynchronous IRQs for cpu_io_recompile
  plugins: fix kdoc annotation
  editorconfig: update for perl scripts
  tests/qtest: fix some copy and paste errors in kdoc
  include/exec: fix some copy and paste errors in kdoc
  include/exec: remove warning_printed from MemoryRegion
  docs/sphinx: include kernel-doc script as a dependency

Philippe Mathieu-Daudé (6):
  semihosting/uaccess: Briefly document returned values
  semihosting/syscalls: Include missing 'exec/cpu-defs.h' header
  semihosting/uaccess: Include missing 'exec/cpu-all.h' header
  semihosting/arm-compat: Include missing 'cpu.h' header
  semihosting/console: Avoid including 'cpu.h'
  semihosting/meson: Build config.o and console.o once

Pierrick Bouvier (19):
  tests/tcg/plugins/insn: remove unused callback parameter
  contrib/plugins/howvec: ensure we don't regress if this plugin is
    extended
  tests/tcg/plugins/syscall: fix 32-bit build
  tests/tcg/plugins/mem: fix 32-bit build
  contrib/plugins/stoptrigger: fix 32-bit build
  contrib/plugins/cache: fix 32-bit build
  contrib/plugins/hotblocks: fix 32-bit build
  contrib/plugins/cflow: fix 32-bit build
  contrib/plugins/hwprofile: fix 32-bit build
  contrib/plugins/hotpages: fix 32-bit build
  configure: reenable plugins by default for 32-bit hosts
  win32: remove usage of attribute gcc_struct
  docs/devel/style: add a section about bitfield, and disallow them for
    packed structures
  plugins: enable linking with clang/lld
  docs/devel: add git-publish for patch submitting
  docs/devel: add b4 for patch retrieval
  docs/devel: add information on how to setup build environments
  docs/devel: add a codebase section
  docs: add a glossary

Stefan Weil (1):
  scripts/nsis.py: Run dependency check for each DLL file only once

 MAINTAINERS                               |   5 +-
 docs/about/build-platforms.rst            |   4 +-
 docs/about/emulation.rst                  |   2 +
 docs/devel/build-environment.rst          | 118 +++++++++
 docs/devel/codebase.rst                   | 220 +++++++++++++++++
 docs/devel/control-flow-integrity.rst     |   2 +
 docs/devel/decodetree.rst                 |   2 +
 docs/devel/ebpf_rss.rst                   |   2 +
 docs/devel/index-build.rst                |   1 +
 docs/devel/index-internals.rst            |   2 +
 docs/devel/index.rst                      |   1 +
 docs/devel/migration/main.rst             |   2 +
 docs/devel/multi-thread-tcg.rst           |   2 +
 docs/devel/qapi-code-gen.rst              |   1 +
 docs/devel/style.rst                      |  20 ++
 docs/devel/submitting-a-patch.rst         |  39 +++
 docs/devel/testing/main.rst               |   9 +-
 docs/devel/testing/qtest.rst              |   2 +
 docs/glossary.rst                         | 280 ++++++++++++++++++++++
 docs/index.rst                            |   3 +
 docs/interop/qemu-ga.rst                  |   2 +
 docs/sphinx/depfile.py                    |   3 +
 docs/system/arm/virt.rst                  |   2 +
 docs/system/images.rst                    |   2 +
 docs/system/qemu-block-drivers.rst.inc    |   2 +
 docs/tools/qemu-nbd.rst                   |   2 +
 docs/tools/qemu-storage-daemon.rst        |   2 +
 docs/user/main.rst                        |   6 +
 configure                                 |  21 +-
 meson.build                               |   6 +-
 include/exec/gdbstub.h                    |   8 +-
 include/exec/memory.h                     |   5 +-
 include/qemu/compiler.h                   |   7 +-
 include/qemu/qemu-plugin.h                |   2 +-
 include/semihosting/console.h             |   2 -
 include/semihosting/syscalls.h            |   1 +
 include/semihosting/uaccess.h             |  55 +++++
 scripts/cocci-macro-file.h                |   6 +-
 subprojects/libvhost-user/libvhost-user.h |   6 +-
 tests/qtest/libqos/qgraph.h               |   2 +-
 tests/qtest/libqtest.h                    |   6 +-
 accel/tcg/translate-all.c                 |   5 +-
 bsd-user/main.c                           |   2 +-
 contrib/plugins/cache.c                   |  18 +-
 contrib/plugins/cflow.c                   |  17 +-
 contrib/plugins/hotblocks.c               |  29 ++-
 contrib/plugins/hotpages.c                |   6 +-
 contrib/plugins/howvec.c                  |   7 +-
 contrib/plugins/hwprofile.c               |  27 ++-
 contrib/plugins/stoptrigger.c             |  48 ++--
 gdbstub/system.c                          |  22 +-
 gdbstub/user.c                            |  22 +-
 linux-user/main.c                         |   6 +-
 monitor/hmp-cmds.c                        |   2 +-
 semihosting/arm-compat-semi.c             |   1 +
 semihosting/console.c                     |   3 +-
 semihosting/syscalls.c                    |   2 +
 semihosting/uaccess.c                     |   1 +
 system/vl.c                               | 101 ++++----
 tests/tcg/plugins/insn.c                  |   4 +-
 tests/tcg/plugins/mem.c                   |   6 +-
 tests/tcg/plugins/syscall.c               |   6 +-
 .editorconfig                             |  13 +
 contrib/plugins/meson.build               |   2 +-
 plugins/meson.build                       |  24 +-
 scripts/nsis.py                           |  10 +-
 semihosting/meson.build                   |   9 +-
 tests/tcg/plugins/meson.build             |   3 +-
 68 files changed, 1035 insertions(+), 226 deletions(-)
 create mode 100644 docs/devel/build-environment.rst
 create mode 100644 docs/devel/codebase.rst
 create mode 100644 docs/glossary.rst

-- 
2.39.5
