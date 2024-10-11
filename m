Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp392337njb;
        Fri, 11 Oct 2024 06:20:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMDF7uvHOeVjyvHUxvf1WjMfXCUShWeH2onBD8zSxFPN2pGxkkhcM2+U2NyFVXKpbVRw47P5n59MFMHw==@linaro.org
X-Google-Smtp-Source: AGHT+IEDAP6sbEfMvmPQt0zJspQjrhuUvwbAsShnlD/XYkcZ8nt7SqhSNgfcSKDp+hg4tEp6SoEf
X-Received: by 2002:a05:620a:2487:b0:7a1:dcc6:fbc2 with SMTP id af79cd13be357-7b11a374f77mr363598985a.24.1728652804988;
        Fri, 11 Oct 2024 06:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652804; cv=none;
        d=google.com; s=arc-20240605;
        b=GAdvXvydhHsOyZiyFfWd3d+Wo7po+OdCi8FO9Ue+okVesenHcTf7PJBoc3QLyL7X3N
         KTx2AJiV3rgNNsv29Exd25aF7j4PJxM+NfdvekZznf3GtPb1vfKT5QHU4E2VzyxYBHoe
         RD+czMjI5HvxXcaqZVXnSmoXYarOa/np+L7xeoHYhFUYXGhgiAmdT86cSjz7niTRInNn
         96sqXeTvZ/duirtuWWyXyor3DAy5zzpEBTt7v99GOlCNqoEgLp8z1Tf+MerjHKvMrIAv
         cG51qSuusU0wvLEqMPdgx//StLCE95QvI4CmYeiJxxdncmsGz6IgNolnJR1YVnvECskk
         FiOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=CNSii7eH6rvQ/DnqAg5OAeuOExPoRZI2a/mLPSF7WCo=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=fndADU0g3zMuImkSBI8/3bu1L6jP7r/911PPjmeENtBMiYVjvWBn1TGBJlmD8eZ44H
         BnKYmlNv+vgahrV2pe8wJhiev0iiwygT4SWR1oQgqkjiIiK/iqMBJwmpfgxpynuFBmkX
         P01Ndfwi7MgHO1+qKZaoKx1fE7h1IOffIMtTrKeCVTAc4/TgzWH189IUrkkS9xq5Gqy/
         DZav+nkvwQl9fvgb0PLs5Ue95Z0xzp6A/3jw54poi/BbYllCa83KKoM2PbjgTgYy1Gdn
         p2a+FbqcZCrdyz3x281bwm5kzWeS8zd0VwXK7iNS1fthGKu0nLEyU0/nJGk23CPEVPxB
         vmxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z9a8swzQ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4604f1de48fsi13593761cf.202.2024.10.11.06.20.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:20:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z9a8swzQ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CNSii7eH6rvQ/DnqAg5OAeuOExPoRZI2a/mLPSF7WCo=;
	b=Z9a8swzQ0zyZjxND4YEBpMq/UJRQ8J86OphpQxb3VJSeZASiKFgcwNLTCnCWAl41AAHWtQ
	TzhM03SO79acDTURPcPvydWwyvFSKBddICfyHueTNH6eHMjSKDkfy3ObNQ4tQBagwsAdHn
	o88QGEqlnDZkGw/X2canNOATYrHB3qo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-119-NLo6iy8EMTO_dYKIdZyhQA-1; Fri,
 11 Oct 2024 09:20:01 -0400
X-MC-Unique: NLo6iy8EMTO_dYKIdZyhQA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 868C319560BD;
	Fri, 11 Oct 2024 13:19:59 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 894381956052;
	Fri, 11 Oct 2024 13:19:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 00/17] Convert the Avocado tuxrun tests into new functional tests
Date: Fri, 11 Oct 2024 15:19:17 +0200
Message-ID: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: fg8ywzBzRquR

This patch series converts the tests/avocado/tuxrun_baselines.py
to the new functional test framework. While converting the sh4 test,
I noticed that the Avocado test was completely broken, so I included
a fix (revert) for that problem in this series, too.

Thomas Huth (17):
  tests/functional: Add a base class for the TuxRun tests
  tests/functional: Convert the Avocado ppc64 tuxrun tests
  tests/functional: Convert the Avocado aarch64 tuxrun tests
  tests/functional: Convert the Avocado sparc64 tuxrun test
  tests/functional: Convert the Avocado s390x tuxrun test
  tests/functional: Convert the Avocado arm tuxrun tests
  tests/functional: Convert the Avocado riscv32 tuxrun tests
  tests/functional: Convert the Avocado riscv64 tuxrun tests
  tests/functional: Convert the Avocado i386 tuxrun test
  tests/functional: Convert the Avocado x86_64 tuxrun test
  tests/functional: Convert the Avocado mips tuxrun test
  tests/functional: Convert the Avocado mipsel tuxrun test
  tests/functional: Convert the Avocado mips64 tuxrun test
  tests/functional: Convert the Avocado mips64el tuxrun test
  tests/functional: Convert the Avocado ppc32 tuxrun test
  Revert "hw/sh4/r2d: Realize IDE controller before accessing it"
  tests/functional: Convert the Avocado sh4 tuxrun test

 MAINTAINERS                              |   4 +-
 hw/sh4/r2d.c                             |   2 +-
 tests/avocado/tuxrun_baselines.py        | 620 -----------------------
 tests/functional/meson.build             |  28 +
 tests/functional/qemu_test/tuxruntest.py | 158 ++++++
 tests/functional/test_aarch64_tuxrun.py  |  50 ++
 tests/functional/test_arm_tuxrun.py      |  70 +++
 tests/functional/test_i386_tuxrun.py     |  35 ++
 tests/functional/test_mips64_tuxrun.py   |  35 ++
 tests/functional/test_mips64el_tuxrun.py |  35 ++
 tests/functional/test_mips_tuxrun.py     |  36 ++
 tests/functional/test_mipsel_tuxrun.py   |  36 ++
 tests/functional/test_ppc64_tuxrun.py    | 110 ++++
 tests/functional/test_ppc_tuxrun.py      |  35 ++
 tests/functional/test_riscv32_tuxrun.py  |  38 ++
 tests/functional/test_riscv64_tuxrun.py  |  38 ++
 tests/functional/test_s390x_tuxrun.py    |  34 ++
 tests/functional/test_sh4_tuxrun.py      |  57 +++
 tests/functional/test_sparc64_tuxrun.py  |  34 ++
 tests/functional/test_x86_64_tuxrun.py   |  36 ++
 20 files changed, 869 insertions(+), 622 deletions(-)
 delete mode 100644 tests/avocado/tuxrun_baselines.py
 create mode 100644 tests/functional/qemu_test/tuxruntest.py
 create mode 100755 tests/functional/test_aarch64_tuxrun.py
 create mode 100755 tests/functional/test_arm_tuxrun.py
 create mode 100755 tests/functional/test_i386_tuxrun.py
 create mode 100755 tests/functional/test_mips64_tuxrun.py
 create mode 100755 tests/functional/test_mips64el_tuxrun.py
 create mode 100755 tests/functional/test_mips_tuxrun.py
 create mode 100755 tests/functional/test_mipsel_tuxrun.py
 create mode 100755 tests/functional/test_ppc64_tuxrun.py
 create mode 100755 tests/functional/test_ppc_tuxrun.py
 create mode 100755 tests/functional/test_riscv32_tuxrun.py
 create mode 100755 tests/functional/test_riscv64_tuxrun.py
 create mode 100755 tests/functional/test_s390x_tuxrun.py
 create mode 100755 tests/functional/test_sh4_tuxrun.py
 create mode 100755 tests/functional/test_sparc64_tuxrun.py
 create mode 100755 tests/functional/test_x86_64_tuxrun.py

-- 
2.46.1
