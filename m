Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6070122wrt;
        Wed, 6 Feb 2019 07:28:54 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZG05K5Df3usvseIk1NzOQwKdYFresy08QCkdzj0hYuyeeSoEFCf2X9d3B72Ohkd7In9YFd
X-Received: by 2002:a5d:4d11:: with SMTP id z17mr8043129wrt.209.1549466934009;
        Wed, 06 Feb 2019 07:28:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549466934; cv=none;
        d=google.com; s=arc-20160816;
        b=H8ODvF2hLt3krcQmNUUzmZZnhbVOU5X8dz7OjgqLv0YSdS6PA56hdCvoh09VBYyGRa
         q+0fOeHkHdLsgAuUKTtwWHBYmvH7SG7UUOiwVSEP4390hPbQYa5/8OOiSAlJnj9Okh6S
         kGcK7qoY80GpIUKrRPyBMxcouxpSa7o7/qHK2LNqKm0kkGOKfWjNq+TWm8ahQppe4sk/
         4vOp3dOW8NeZsgZhTGY2YxuOAJrhK4UA0oyj0aGjE5xpQY77cIDrkrVTzO1S2Hh4baKX
         w5itisJLoI7xxyrmvp/K1GNSKLkT48sa0W1eVkL8jN4nrifEU/J95rGbVNj6Rrrg4tyy
         1riw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=P8Tlr6CL1+YozalSOKU6ldx/HWMmBGvLz/iNl8xNFmo=;
        b=PgVdSI3pd5h2Hdzf33Je7/FeRi0UdoTX7UoKZlvvn+5mqHeJrO6VAJhDu6J720gGzv
         ckDbg2jqdp0Kpa7FljDCoxZ3iUOJbs7ULojFBMPjqCX6um1W8Tkr62tdm3hry8MbnA/9
         xmKTKHljYbWQA3rP9aOfiMutwBDIh2tiNnmo+Lw1KXXrp/RQjSZs84ogxP81aEwOp6/u
         g7C40stI1xDJGCjueP9FkV+E9Y7k1jOFb6BzFaTec/gff+Bcxr3mr32HAc7DndWQDapT
         8IUt4zwYdkB8dvnBHz2zALlzH2cG1j0SttygBwqkIeGyMHarSJwJiYny92dAj29AQkAH
         0QlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si652867wro.194.2019.02.06.07.28.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Feb 2019 07:28:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grP89-0008Vb-1c
	for alex.bennee@linaro.org; Wed, 06 Feb 2019 10:28:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP7u-0008VQ-KX
	for qemu-arm@nongnu.org; Wed, 06 Feb 2019 10:28:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP7k-0004LL-T9
	for qemu-arm@nongnu.org; Wed, 06 Feb 2019 10:28:30 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:46841)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grP7i-0004KE-TE; Wed, 06 Feb 2019 10:28:27 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MLi4W-1gZjkF0OWW-00HdzY; Wed, 06 Feb 2019 16:28:15 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed,  6 Feb 2019 16:28:00 +0100
Message-Id: <20190206152807.31896-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1WV4LHov9H9VzI4geQyG7/VDJuvJVIT/0FzqbTmcyY13bJiZHhz
	FZhMyT1Ljm8EZC+9WvHBArpxWSJ3TpLr0WFLCpoDiVt6wvf7Uu6cf3KW3KUV9Ak5yjPjPiD
	JXZmGyJI1zhvYcKF8/4ftClR7TAi1pqnkcxShBirgoksjzWJQt/2K7utqC6GzjEZuyceqFG
	YzJfzR2gBbQ0mf/dy3Zgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gls5uUnZpsc=:KWtERISnbZ4ih/3Cex+Vlz
	e88sTUcug9qjF9LLvTi8ZjRPkqRobfDmUr8ol0GiuX82XujUckv8pI7g4aFAcIOR3EQ8xAcnZ
	v5lF6OA7tATQQfV/Ls31NxoE41oI0Cn0Xb9x0fdA7Mym5kk4RdxLOBfsfk+xWk3wWMU13AadV
	lGm1b1r/XSzGgIcI+X6WnJfAeeLet4WsThobg8fR1s9TLy5gSMxyxtgbLgAOWzfRUGZAqSBA9
	WDgt6GqH8zkXvzbTeZ89fszq4oLbs18b4+Y0/VSKZVC56JDYoPNwovZAGRNiKzi8ywR6oddf1
	znLPTjlkEXwaj2RZlIgXWIFh4yWQRCypEz3ENJSyFnV3TN/uk1k3BQQgDmvkJO7YRouBLrxSO
	XA84nhHp6zVU2R+VHHU3ERlf/exouljAYR3VKwQAX4VSF8XNSNsl7G8rHC2gCtpbpIm/BJDu3
	VN1gCKEFE+XynYkLZqJ+5QPPEqTZCmZvJyu1Br1ce5owBJ8y+lKl6aLJl4CENmFSo4QJzlr5/
	pYWQhOmChKg2z/qEGodHT+iXWX74dYbrbCGPBXs/Pqkg2XosmzH9AckGye5eFJH+XIgmz/KVk
	nhDF3anEEH2/jzSWRIHLWn8OsiEzZl2NpVfNiFM4dZOnS9E0ekgrbJYEU42srWSo8+w9CeWbb
	HDCiSEWewyg38qxHXhi9sesMrk3tJ7Pc2QFIiTDuhvrjZJCqKJNtADai+PJ4XFqJVqAJNIb55
	uIgFkRNqCv23sLeDy52GXBxhaDB7ta8RevVemw+IKpfCq+rQ9SHsxZJuOWg=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-arm] [PULL 0/7] Trivial patches patches
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Anthony Green <green@moxielogic.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1U7jdIogoKTE

The following changes since commit 47994e16b1d66411953623e7c0bf0cdcd50bd507:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20190205' into staging (2019-02-05 18:25:07 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-patches-pull-request

for you to fetch changes up to e67e91b4b55331973f783ca89790ee9f7861ced1:

  hw/input/tsc210x: Fix building with no verbosity (2019-02-06 15:57:06 +0100)

----------------------------------------------------------------
Trivial patches:
* Update copyright
* Fix LGPL in target/moxie
* configure portability fix
* Drop useless inclusion of "hw/i386/pc.h"
* Mark the cpu-cluster device with user_creatable = false
* tsc210x: Fix building with no verbosity

----------------------------------------------------------------

Eric Blake (1):
  configure: Avoid non-portable 'test -o/-a'

Peter Maydell (1):
  qemu-common.h: Update copyright string for 2019

Philippe Mathieu-Daudé (3):
  hw/sparc64/sun4u: Drop useless inclusion of "hw/i386/pc.h"
  hw/unicore32/puv3: Drop useless inclusion of "hw/i386/pc.h"
  hw/input/tsc210x: Fix building with no verbosity

Thomas Huth (2):
  target/moxie: Fix LGPL information in the file headers
  hw/cpu/cluster: Mark the cpu-cluster device with user_creatable =
    false

 configure                | 63 +++++++++++++++++++++-------------------
 hw/cpu/cluster.c         |  3 ++
 hw/input/tsc210x.c       | 18 ++++--------
 hw/sparc64/sun4u.c       |  1 -
 hw/unicore32/puv3.c      |  1 -
 include/qemu-common.h    |  2 +-
 target/moxie/cpu.c       |  2 +-
 target/moxie/cpu.h       |  4 +--
 target/moxie/helper.c    |  4 +--
 target/moxie/mmu.c       |  4 +--
 target/moxie/translate.c |  4 +--
 11 files changed, 52 insertions(+), 54 deletions(-)

-- 
2.20.1

