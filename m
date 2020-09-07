Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3445232lfc;
        Sun, 6 Sep 2020 21:20:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1pECS2W2W0TTAtLmmu2rpmSbiOMMe5IDSTFjPWgjdLQPODelk87nu2+LlsV13n2kpMp7G
X-Received: by 2002:a17:906:a0c2:: with SMTP id bh2mr19965636ejb.493.1599452417700;
        Sun, 06 Sep 2020 21:20:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599452417; cv=none;
        d=google.com; s=arc-20160816;
        b=zuq0axgFQIDq0o2Dre9T8giKDby3ctcWTvDLLPMCrRbre7eHyYTlv4HGN+dDZXAFS7
         RonjoWPEEuGDWO2ds1WbZCL0GDgQYdT0JkuuIgjLIkx45Oh/8utaNXMSEd67BK+O3CQ0
         kgaGUoL0MXqbmxnvhZAfqtY7Bd6UqUDBr7vDNiO+Gi7IWd2YK/fs+DaWvU/lJNBNorKB
         5btT5AAhNRXY8byparZGzJjrypvwRl7d7CV5iSWKkwhTgi0ofiDjCyqd5a9NRRvG01Pl
         rS/1JPIwqfcQgH4OJMiZZNdriuNYDmVu2CNFHTA5S8i2uI8ZGR7CqJutP9khxry2i6G/
         JWrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=aG2b51eEtpeVm8TWl3RkJUDEZmxusMXsz/C7s+E9XQ8=;
        b=OyT9ymRL6HP8VHN4m9nUM76FbQ/H1oinsg4YN0JC6DcUmRlpM7Il0bs9ROdny1gx7W
         5FzLAOI+kUJiA2gk/+D+Xk/2CdLZfM2I04bQ+07XaKmKKDALcbZ6Aqh0V6LvAr299J0h
         3LcocFIM8DJNpo0IN/NAwaudICI3xyW7cU3O4GbbzWSp2UmA54RtWc2iyXcAc2rFCUO9
         pRDp+gr8+jFcZIL1WfYvxCI40tsITFBR/TqZDkHQ2IrN5UiarpIKOJgbDVBrRJoLqWhF
         BJg98Z5ROrP7bfQnqbdIYqR5L/RSgcJj92atDH6HABSYnSSA/i5R095lei7gKx5Ttchl
         xOFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Etus8q15;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id d2si8507894eds.533.2020.09.06.21.20.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Sep 2020 21:20:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Etus8q15;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599452416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aG2b51eEtpeVm8TWl3RkJUDEZmxusMXsz/C7s+E9XQ8=;
	b=Etus8q15r2GQjubxJa5uhS+sOXEr1kiRjQ3j/yM3HTG2PuST2Bu60jV5C5U1fYeNt4JKsf
	QeUQE6P9z4Tz69k8F1hA2GSooae+NdWdOpOmS//RurY7iavBqpF3BzsfE3o/WQEhkDvmCz
	pwThoHSAL10cDEOCcXQKocmC8ffqycM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-HtBHJOTCPwa_hX8hmAHHeg-1; Mon, 07 Sep 2020 00:20:13 -0400
X-MC-Unique: HtBHJOTCPwa_hX8hmAHHeg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B0DC802B48;
	Mon,  7 Sep 2020 04:20:10 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-120-166.rdu2.redhat.com [10.10.120.166])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 735E71002D62;
	Mon,  7 Sep 2020 04:20:02 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Beraldo Leal <bleal@redhat.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Sarah Harris <S.E.Harris@kent.ac.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/4] Acceptance Tests: update assets location and cancel tests
 if missing
Date: Mon,  7 Sep 2020 00:19:56 -0400
Message-Id: <20200907042000.415931-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: olGUHVv9YljE

This updates a couple of asset locations, because their locations on=0D
their origin distributions are not permanently stable.=0D
=0D
To minimize the inconvenciente caused by test and job failures in the=0D
future, an option is enabled that will cancel (AKA skip) tests early=0D
when those assets are not available.=0D
=0D
Cleber Rosa (3):=0D
  Acceptance tests: use an available kernel image package for arm=0D
  boot linux test: update arm bionic URL=0D
  Acceptance tests: cancel tests on missing assets=0D
=0D
Pavel Dovgaluk (1):=0D
  tests: bump avocado version=0D
=0D
 tests/Makefile.include                       |   2 +-=0D
 tests/acceptance/boot_linux_console.py       | 164 +++++++++++--------=0D
 tests/acceptance/linux_initrd.py             |   6 +-=0D
 tests/acceptance/linux_ssh_mips_malta.py     |   6 +-=0D
 tests/acceptance/machine_arm_canona1100.py   |   3 +-=0D
 tests/acceptance/machine_arm_integratorcp.py |   9 +-=0D
 tests/acceptance/machine_arm_n8x0.py         |   3 +-=0D
 tests/acceptance/machine_avr6.py             |   3 +-=0D
 tests/acceptance/machine_m68k_nextcube.py    |   3 +-=0D
 tests/acceptance/machine_mips_malta.py       |   6 +-=0D
 tests/acceptance/machine_rx_gdbsim.py        |   9 +-=0D
 tests/acceptance/machine_sparc64_sun4u.py    |   3 +-=0D
 tests/acceptance/machine_sparc_leon3.py      |   3 +-=0D
 tests/acceptance/ppc_prep_40p.py             |   8 +-=0D
 tests/acceptance/replay_kernel.py            |  51 ++++--=0D
 tests/requirements.txt                       |   2 +-=0D
 16 files changed, 171 insertions(+), 110 deletions(-)=0D
=0D
--=20=0D
2.25.4=0D
=0D
