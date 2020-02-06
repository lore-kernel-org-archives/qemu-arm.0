Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1398830lfp;
        Thu, 6 Feb 2020 04:51:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqyDPlv6qCbQ+JZjtolGvS6BHubK2297bZtZuAIHadETZgDwcKAbq3o5od15Mmvaq5Vy2/Iy
X-Received: by 2002:ad4:4e04:: with SMTP id dl4mr2061582qvb.150.1580993472677;
        Thu, 06 Feb 2020 04:51:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580993472; cv=none;
        d=google.com; s=arc-20160816;
        b=Bwieyrcn3N3ZNU0PaXz1hE6BjBFe+EvRDBF+ys6854sWeRD7hP/bFZ8LKgIeq+yk+y
         jturwoj5oogC0AeqlwbOOnQtjvS0mvVFFPPz5MA0EZfkms2Lad5TktxMaD/1FkPGI+Hr
         mJvJOGipqSUtT0ZVing1NElwehe+bM9w/MlvhQe92dnr8tYnXsL6U1AZMx6nsGSwhoPT
         af7QtwptaqJj6IBHtDC3PRzf0kjNAtx3ewhnIXETYhNO9M89vxcWhm9QhkAq005ALpfi
         ikYpi2fwzBiD7VuhflH3hU5S2e8xKBiLA+FokmuFOcuuxvx8/AVC6oq6YsiW0Z06DOps
         1wrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=YjK7XQamnZGkSz2sH8Ah31zWT70HVmCGJaIlIyNTxtU=;
        b=xUbR3qzLcuQXPOy7azsVI17TOJRDdF8GUsVaSWj84LiagU+zKzGh8UuUfeSUYAWENb
         wZ7YWRy421NLZxJmwpiOYK4Bl2gCd0l4cVh2wQ4cjdYQgzlBkm81yCMu/uQ7g6O0yg4F
         53UvOHLK1r5mthhXX9pUL41cM5s40yB3q7Nw0itoYeBpakYJY6vLoJpFqrqsBAGuH8DW
         EmPQpEVjIUffoebDmc3z9ewZFSt28YXCUBq2v/I9F5leAkWmFcJvpBgjzHTNkcZuZ8xy
         AGWrM41S42fcm/dZyQ+ybQM2MnldT/i6VoBvWO+wJlcL2ASOg0wyA2aWW0k1j4d+7TeK
         0VKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q143si1645285qke.276.2020.02.06.04.51.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 04:51:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izgci-0000tc-3a
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 07:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56153)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1izgcQ-0000nc-EO
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:50:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1izgcP-0005Xz-BQ
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:50:54 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:48687)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1izgcK-0005CF-BG; Thu, 06 Feb 2020 07:50:48 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MLAAs-1jHtzG1Rek-00IDyH; Thu, 06 Feb 2020 13:50:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] Trivial branch patches
Date: Thu,  6 Feb 2020 13:50:15 +0100
Message-Id: <20200206125027.1926263-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QzrtNTtr1K/Hl64rveH+CH3JhhqW2lAEJSTsE1MD4Gf/mDf2eDG
 hcp6UwtyYGq2ZDKfQLywQR/Cbj4isrd1eOE0vfg2DmT9RgwJ+Mf/fzwBHYOZsk3WOXe7CoG
 XVD9F+1JVH68RHSSP1QFWUKI3lggejSWLdxNVWGhfC3VovWD883sn7qhA0yhnGck+JWmQVF
 fK4hc9oJiKuwv9ddsA8EQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uGANA53uBh8=:mJANNCyFK9Ag03MxmagNJE
 j44usZCp4LHSJeTclAX7LZg4UuEKy5aJBMJhQKwNDlvJDWyGW6BRUc7M9z6mrTHZy6FJVYeTp
 024lseQ2xq6hhO4kjUxY92mAHsDrsICKb+YPpiR3tSQe7EBujZmotQLZwtpCXmD4kmGbWJ8q9
 iEk8yGU9hzlOB8iZzIMipyHqBbg/s3/QZ+egOUQPJk9tQxag1rtUo0YGU/VEm6UqmpSzIEzv+
 SuqyH5r1zIcWjTSln6NwJOvhwFc5TABCKThzIuHHS+9ShSGXk6gFYPtSy3D1H93pKu3AWZ3sv
 j4LeEu24Hf9Kn4xs2lDOuycr3d/sP5gF3Y5VmY053wH8JR2zVDH5vk4Qt7wE8LGY1KI7k1VU9
 aOLJRbF0iQ7Q+WCH+TmYq6vQmX9rjjpjxcXHht7eEhFMkNqL5DOwXvr+5cgE3OuB5aF6/uZWU
 SeF6Of9ebNYR5HrU3GJbGb+tMYI80laJIqNf8Jc46w7BoCZ8KaCdrNGmU7Z3GHK/yYHIHdcau
 Ktw3FUbxfLhu2sOuSBHrWQ0nUFWJCQ8YOa5ADEIfaI+FDEOUtQRMgRzNM10gY/6UjFOWfSWG/
 TitqJo8xo8hzoTmghFptOGuFD+qygIfjaFXSigzynQ/0D+mKBsxw5xhHw0zmRKHCdhm/l81L5
 tTm+basNwLzPQAMwD9MDESZ/u00mbP3u9PUzJCEtYe59NBHjNO60mSg3NTHfAdhTTE32CY4qb
 usX+c1+jHcFaXuOPTVL+qY8yVQ/wAkRJqo+bNxT/rOhvCAUDRyXmwfzTc/nj8iviSNIrO9U77
 GYNL/onpkqa+DCYPFN6Ce3h8YHnsKLEvSVxNubbY9yN3ea+USLErU2nKXs56NGXLFOofpiH
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EJkuqvOSkUYJ

The following changes since commit 7bd9d0a9e26c7a3c67c0f174f0009ba19969b158:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-02-04' into staging (2020-02-04 16:12:31 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to 8ef350b32fe08d254f92a3a7efe89809397fff77:

  MAINTAINERS: Cc the qemu-arm@nongnu.org for the ARM machines (2020-02-06 12:32:03 +0100)

----------------------------------------------------------------
trivial patches 20200206

----------------------------------------------------------------

Chen Qun (1):
  monitor: fix memory leak in monitor_fdset_dup_fd_find_remove

John Snow (1):
  qemu-options: replace constant 1 with HAS_ARG

Julia Suvorova (2):
  qemu-img: Place the '-i aio' option in alphabetical order
  hw/pci/pci_bridge: Fix typo in comment

Leif Lindholm (1):
  MAINTAINERS: update Leif Lindholm's address

Miroslav Rezanina (1):
  aspeed/i2c: Prevent uninitialized warning

Philippe Mathieu-Daudé (4):
  hw/smbios/smbios: Remove unused include
  hw/timer/m48t59: Convert debug printf()s to trace events
  MAINTAINERS: Cover hppa-softmmu.mak in the HP-PARISC Machines section
  MAINTAINERS: Cc the qemu-arm@nongnu.org for the ARM machines

Thomas Huth (2):
  hw/bt: Remove empty Kconfig file
  hw/i386/vmmouse: Fix crash when using the vmmouse on a machine without
    vmport

 .mailmap                    |  1 +
 MAINTAINERS                 | 10 +++++++++-
 docs/interop/qemu-img.rst   |  8 ++++----
 hw/bt/Kconfig               |  0
 hw/i2c/aspeed_i2c.c         |  2 +-
 hw/i386/vmmouse.c           |  6 ++++++
 hw/rtc/m48t59-internal.h    |  5 -----
 hw/rtc/m48t59.c             | 11 +++++------
 hw/rtc/trace-events         |  6 ++++++
 hw/smbios/smbios.c          |  1 -
 include/hw/pci/pci_bridge.h |  2 +-
 monitor/misc.c              |  1 +
 qemu-img-cmds.hx            |  4 ++--
 qemu-options.hx             |  2 +-
 14 files changed, 37 insertions(+), 22 deletions(-)
 delete mode 100644 hw/bt/Kconfig

-- 
2.24.1

