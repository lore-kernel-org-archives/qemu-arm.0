Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3985633lfa;
        Mon, 2 Nov 2020 06:43:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4JJK9wmrAYa029DpNJCBDez3nhKvGBzruEfcbYovWhJm0pZ6YXJeMMc2h2oD8I6qVVPJ6
X-Received: by 2002:aed:3147:: with SMTP id 65mr14937509qtg.295.1604328203253;
        Mon, 02 Nov 2020 06:43:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604328203; cv=none;
        d=google.com; s=arc-20160816;
        b=E5fL1uza5dEfSxhGYd+xUw81lOM+DRvCvSyPVmtq7O/n2y06HSGeG0OWIfz08PDUsV
         3y/ZQzMxgQ69oDyEYNfCcvx+Cx9olQVKDSNAj1fYWzoH2zFs1aUo8Zsp3eYs7surNWq0
         8QZ9GYgNZxA8dYNkuGXuallUGIczEiMFltjM1yV7kCjImfKz6fELbWVwQc0qS7KbLDIx
         7h3lwysMSpncaqPJMNol7UoMht1nq8OBqJ7hvnvR1bv25sBVKd1IqP24WM/VpHJgRlf7
         7DJG/M7MCo7mU1hXP5S+fkQM6Vd6a8J+4iWBBrtcnPiYJOEYYN+uP8YHrdHDejgmMoYL
         Rdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=YM2Fnfu4AC2/aWa6sBiYYE65XcwJew15+nCC/J3iCqg=;
        b=GE4xu8HsGVu5LhRNKeQymsJllZjalByVdV5HfzvprgLwdLzkLRD4R/EbgyBzE2QzMA
         0hWVB+PuZaXn1K+IY0iQjzpBToWU96finOn02HrK/qa0opsTfvz7INMnJB+F+epoZLWj
         yIzOT+hkLldIktgajeesdiQB1hwYqFjHGkKrmqa7vF3YdldVyl9gevI/0dVcqyRJnJBw
         /k3HeGZOlMNA2KlH7+8Vld5fprXxEqWETOJHlzwv6+c2IhkSFF2QmWkEWw4zKt4OdhFt
         gX2jX6gZZ/Q6c+XV177red7K/9oLPYQ7cfpH/5tXEsSHI2wwp/62BYmMP22GhvzTCh94
         6cGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S58nul1a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6si3874451qke.37.2020.11.02.06.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 06:43:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S58nul1a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZb3K-0001yo-Ky
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 09:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZb2v-0001yX-4j
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 09:42:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZb2s-00053g-ED
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 09:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604328172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YM2Fnfu4AC2/aWa6sBiYYE65XcwJew15+nCC/J3iCqg=;
 b=S58nul1aEvg45INUsVDz/Ti42MKiL419tesWbM+5f2j+tYW9/fvS4UpO4mvQ1tGvDrxBZq
 AgeczZYHfJxxwZy1q+Z9UsnDkgFFZ1h9xvylAX92izJvht5V3dZjGJUJblGS42rF13GVa3
 ZQDhzsYorhkr6v+p7xfM3CHnUgs1kOY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-lSe0aVM1MZiabP-7TF4Few-1; Mon, 02 Nov 2020 09:42:51 -0500
X-MC-Unique: lSe0aVM1MZiabP-7TF4Few-1
Received: by mail-wr1-f71.google.com with SMTP id t14so6560962wrs.2
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 06:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aNXmM6CNlrG0cs+CwnOFmLA6zd4E57Qt+UkaDTpFyhA=;
 b=g49DPLZnmoM4SdZ31SBCjQMdh4iiXiXRv03pV4xD+ahU/hFkTcnZ6lgRGMIBPoTQyt
 NFukf5AtPkxYgLMys5xINkOuJrnLG5AZ/XGytyDZhAOxBW35KDA3GwUVtPq4YXJHBmjw
 rbu20UPZLU+Y/ESvm6fhngVSeFcl3Isx+job8oA6lpOZoxCZhgQf8SF+u+OynACO4qek
 GbwwKAU7hGCWbU/zEO+2GIIrxqZKlPTnQd8acjz8BQYYqvXVG0EmXkGb6yj7tjIculKE
 UvdFG5MSmMn1FXYtzsD4FSuyBYdTilp9roNSzrXDMu1jFvyuBZf2lFyPcNCx7Ch8OK4p
 NAyA==
X-Gm-Message-State: AOAM532hCGJ1YZwznUkuswMr8bmcaCzhOSr0xMO0RETdfygazuUlV/OD
 I9yMvXiFqMEpnRcqRTFLW/D6Q2P0/FOashHATVLAN+GL3sogb7ZbOadjSRvAXu70LNSbIrVEAL2
 OvDiupCUsDH4+
X-Received: by 2002:a5d:4ed2:: with SMTP id s18mr20513827wrv.36.1604328169836; 
 Mon, 02 Nov 2020 06:42:49 -0800 (PST)
X-Received: by 2002:a5d:4ed2:: with SMTP id s18mr20513787wrv.36.1604328169653; 
 Mon, 02 Nov 2020 06:42:49 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 3sm16242448wmd.19.2020.11.02.06.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 06:42:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH-for-5.2? 0/5] tests/acceptance: Only run tests tagged
 'gating-ci' on GitLab CI
Date: Mon,  2 Nov 2020 15:42:40 +0100
Message-Id: <20201102144245.2134077-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fabien Chouteau <chouteau@adacore.com>, Aurelien Jarno <aurelien@aurel32.net>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /iWRhatduvhx

This series try an idea from the CI BoF last week:=0D
- allow adding all test to mainstream repository=0D
- promote test to "gating" once it is proven stable=0D
- only run 'gating-ci' on GitLab CI=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  tests/acceptance: Restrict virtio_check_params tests to X86 target=0D
  tests/acceptance: Restore MIPS Malta multicore tests=0D
  tests/acceptance: Skip incomplete virtio_version tests using '@skip'=0D
  RFC tests/acceptance: Only run tests tagged 'gating-ci' on GitLab CI=0D
  tests/acceptance: Let stable tests use the 'gating-ci' tag=0D
=0D
 tests/Makefile.include                       |  2 +-=0D
 tests/acceptance/boot_linux.py               | 10 ++++--=0D
 tests/acceptance/boot_linux_console.py       | 38 ++++++++++++++++++++=0D
 tests/acceptance/cpu_queries.py              |  1 +=0D
 tests/acceptance/empty_cpu_model.py          |  3 ++=0D
 tests/acceptance/linux_initrd.py             |  4 +--=0D
 tests/acceptance/machine_arm_canona1100.py   |  1 +=0D
 tests/acceptance/machine_arm_integratorcp.py |  2 ++=0D
 tests/acceptance/machine_arm_n8x0.py         |  2 ++=0D
 tests/acceptance/machine_avr6.py             |  1 +=0D
 tests/acceptance/machine_m68k_nextcube.py    |  9 +++++=0D
 tests/acceptance/machine_mips_malta.py       |  6 ++--=0D
 tests/acceptance/machine_rx_gdbsim.py        |  3 --=0D
 tests/acceptance/machine_sparc64_sun4u.py    |  1 +=0D
 tests/acceptance/machine_sparc_leon3.py      |  1 +=0D
 tests/acceptance/migration.py                | 12 ++++++-=0D
 tests/acceptance/pc_cpu_hotplug_props.py     |  3 ++=0D
 tests/acceptance/ppc_prep_40p.py             |  3 +-=0D
 tests/acceptance/replay_kernel.py            | 17 +++++++--=0D
 tests/acceptance/version.py                  |  1 +=0D
 tests/acceptance/virtio_check_params.py      |  7 +++-=0D
 tests/acceptance/virtio_version.py           | 17 ++++++---=0D
 tests/acceptance/vnc.py                      |  9 +++++=0D
 tests/acceptance/x86_cpu_model_versions.py   |  1 +=0D
 24 files changed, 133 insertions(+), 21 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D

