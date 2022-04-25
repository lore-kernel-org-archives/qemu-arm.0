Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2218346lfk;
        Mon, 25 Apr 2022 01:36:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMgaZlOF+MRjyXdlUgY++M9MbGn0VDkDb1GtKDiKg8qOJfCdyp/N0jlirUBPK9l1HRRQ21
X-Received: by 2002:a05:620a:4481:b0:69e:8b70:437a with SMTP id x1-20020a05620a448100b0069e8b70437amr9506546qkp.549.1650875786227;
        Mon, 25 Apr 2022 01:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650875786; cv=none;
        d=google.com; s=arc-20160816;
        b=zNMsfklWuas20+JNLhnyXvkJtPPl3B6SbGeHnVvzxiuf4fUeAqz0U12YLv6OhXjzkB
         OU/1TesD90meLR5+H90gryfi73R5srMEolYqAiruUIRixeotLiemlcICitouYNh+WcJT
         imZr7HH7N2lXKaqZs17FAbFuplCoYHmV+2q8MRf3HLIJhOCycvoQt9jpY5n8LDzrOkif
         Gh33A1LAi0ck8W1WD2YWjvEWq1GD6UZ6yarej6qxI2xWz8Olzqkh8il79OKOELpzHoUl
         IUiezlAYStKMES6Yl+c3Jp/A98T01wEJA09Cp6RgEzLsJKETyxy3oVCiCyQRQ4gsntQe
         eiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=3VCPF3ik0R3B7rgVDOzVH4FeRPM3Hef7iAntqaagMd4=;
        b=ToeU5zZsdtq82lcq9oLdHXfzUklcq3fE32Qwb1xvQ5B7gK1vXJuSqLW1II8meMmFJL
         iqJGsv/wVw2yg1JJn+D5BcNYO6l7kxyDcUwABaWX6uQPSe+WOokfwv1KnHV5Gt6VZFMh
         MLX4nrKDcMODb2vEAwhvHEAN+M1f8fX9yqpCEGU42RjHmDbiNHrygYqOvpTX9RdCdkzi
         s3c/sSSqtjPBs8vUzf06fGhpVItu7PXDwQNddfZ827JDxlnX7pqp5HQU2ebQneaOGmj5
         FHmlps7mRHlKwsVdJVtoBpe7ClU+uZPYDVbbzyk8c9LKM5DvygqkfV8ktWHrWFMEHTqR
         9KKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LJfq69kW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp10-20020ad45f8a000000b0045630468fd9si1466630qvb.205.2022.04.25.01.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Apr 2022 01:36:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LJfq69kW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1niuCn-0007LR-IW
	for alex.bennee@linaro.org; Mon, 25 Apr 2022 04:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu02-0006Sc-Pp
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1nitzz-0002eV-1B
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650874989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3VCPF3ik0R3B7rgVDOzVH4FeRPM3Hef7iAntqaagMd4=;
 b=LJfq69kWkgYQZn8HOpQJrYEaJZF1zNpcubRtnj3YGqmGWwDX61DfRPy+/0qJF3nkRduL5E
 R93ASeqNs+BNZ2YQ6q138PghyAcUOLogSHjSCfwMAlKtTfSjK+zzJZr70D3orVeplP2YxC
 U5Y6fBYNRQNWEHnS4zhGxnsu1l8Jtqc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-1n76OmBQNaykY1srIqswvw-1; Mon, 25 Apr 2022 04:22:05 -0400
X-MC-Unique: 1n76OmBQNaykY1srIqswvw-1
Received: by mail-wr1-f71.google.com with SMTP id
 k29-20020adfb35d000000b0020adc94662dso486902wrd.12
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3VCPF3ik0R3B7rgVDOzVH4FeRPM3Hef7iAntqaagMd4=;
 b=mtpef9XQmy9sJdLoo2HYKdtk9Kf48yfVu99QGQIo1fpDLH6Lvitg8eB0ofD10QMqCl
 Nzk7CnJ5vVs79jut84oO2YmLcKlBcHDJdvYzzhW/xixj5ANU/+cX6uOxAfI1rYLIIFyz
 mQOJRA7HAdfBY6RSMZTYvO3qMqaVSXLHA3XZ0vePfwHLFT4qYpNmz3RDOs5j1CZsFQBL
 CRcdZy7NZqe6IsgZwLZipIwZlaJnxRrMkqKJjrlTaDXARg5P8qAOy3y946SolulvWZ86
 7/MQQYP6DVjP+BI0RLQbawPEsLLae+GstCTwhe4DsUX4nOPvea8JZCQ4t6a3iAvG4Cqy
 k9ow==
X-Gm-Message-State: AOAM5326A71MwrzGsnAuPXdAQpV1CADGTgU2AdZvpaT8robdgcQ5Dwqt
 u8DHIEpXEzvJ+O/3Faf1ZoWKXgDva8qAK7XDVxW42qMgwkLeux4viop6SuS9rwFnngNkC5CyL6E
 5n1Jo3GcD0SnjSAQ=
X-Received: by 2002:a5d:6988:0:b0:20a:dff5:54c with SMTP id
 g8-20020a5d6988000000b0020adff5054cmr747537wru.55.1650874923986; 
 Mon, 25 Apr 2022 01:22:03 -0700 (PDT)
X-Received: by 2002:a5d:6988:0:b0:20a:dff5:54c with SMTP id
 g8-20020a5d6988000000b0020adff5054cmr747496wru.55.1650874923751; 
 Mon, 25 Apr 2022 01:22:03 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 v13-20020a5d4b0d000000b00207a8815063sm8051445wrq.2.2022.04.25.01.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:03 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id F1C2C67B1B55;
 Mon, 25 Apr 2022 10:22:01 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/18] RFC: Remove deprecated audio features
Date: Mon, 25 Apr 2022 10:21:43 +0200
Message-Id: <cover.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TEasF93NE2VW

I wanted to deal with https://bugzilla.redhat.com/2043498 and I got a=0D
suggesstion that removing deprecated features could actually make it=0D
easier to propagate the error.  In the end (last patch) it turns out the=0D
error is still just reported with error_fatal, so it probably is not=0D
really needed, but I really wanted to dig into QEMU more and learn some=0D
of the internals for quite some time now.  So I used the opportunity.=0D
The one-liner ended up being an 18 patch series which was, for someone=0D
who has just one commit in QEMU codebase, a pretty challenging task.=0D
Although I tried my best to do things properly, I am not sure whether I=0D
handled everything correctly, hence the RFC.=0D
=0D
Any comments are very much appreciated.  Thanks and have a nice day ;)=0D
=0D
Martin Kletzander (18):=0D
  hw/audio: Remove -soundhw support=0D
  hw/input/tsc210x: Extract common init code into new function=0D
  hw/audio: Simplify hda audio init=0D
  hw/audio/lm4549: Add errp error reporting to init function=0D
  tests/qtest: Specify audiodev=3D and -audiodev=0D
  ui/vnc: Require audiodev=3D=0D
  Introduce machine's default-audiodev property=0D
  audio: Add easy dummy audio initialiser=0D
  hw/display/xlnx_dp.c: Add audiodev property=0D
  hw/input/tsc210x.c: Support machine-default audiodev with fallback=0D
  hw/arm: Support machine-default audiodev with fallback=0D
  hw/ppc: Support machine-default audiodev with fallback=0D
  audio: Make AUD_register_card fallible and require audiodev=3D=0D
  audio: Require AudioState in AUD_add_capture=0D
  audio: Be more strict during audio backend initialisation=0D
  audio: Remove legacy audio environment variables and options=0D
  audio: Remove unused can_be_default=0D
  audio/spiceaudio: Fail initialisation when not using spice=0D
=0D
 audio/alsaaudio.c                             |   1 -=0D
 audio/audio.c                                 | 204 +++----=0D
 audio/audio.h                                 |   5 +-=0D
 audio/audio_int.h                             |   1 -=0D
 audio/audio_legacy.c                          | 555 ------------------=0D
 audio/coreaudio.m                             |   1 -=0D
 audio/dbusaudio.c                             |   1 -=0D
 audio/dsoundaudio.c                           |   1 -=0D
 audio/jackaudio.c                             |   1 -=0D
 audio/meson.build                             |   1 -=0D
 audio/noaudio.c                               |   1 -=0D
 audio/ossaudio.c                              |   1 -=0D
 audio/paaudio.c                               |   1 -=0D
 audio/sdlaudio.c                              |   1 -=0D
 audio/spiceaudio.c                            |   3 +-=0D
 audio/wavaudio.c                              |   1 -=0D
 docs/about/deprecated.rst                     |  24 -=0D
 docs/about/removed-features.rst               |  27 +=0D
 docs/qdev-device-use.txt                      |  21 +-=0D
 docs/replay.txt                               |   2 +-=0D
 hw/arm/integratorcp.c                         |   8 +-=0D
 hw/arm/musicpal.c                             |   8 +-=0D
 hw/arm/omap2.c                                |  11 +-=0D
 hw/arm/realview.c                             |   3 +=0D
 hw/arm/spitz.c                                |  10 +-=0D
 hw/arm/versatilepb.c                          |   3 +=0D
 hw/arm/vexpress.c                             |   3 +=0D
 hw/arm/xlnx-zcu102.c                          |   4 +=0D
 hw/arm/z2.c                                   |  12 +-=0D
 hw/audio/ac97.c                               |   9 +-=0D
 hw/audio/adlib.c                              |   9 +-=0D
 hw/audio/cs4231a.c                            |   8 +-=0D
 hw/audio/es1370.c                             |   8 +-=0D
 hw/audio/gus.c                                |   6 +-=0D
 hw/audio/hda-codec.c                          |  37 +-=0D
 hw/audio/intel-hda.c                          |  25 +-=0D
 hw/audio/intel-hda.h                          |   2 +-=0D
 hw/audio/lm4549.c                             |   7 +-=0D
 hw/audio/lm4549.h                             |   3 +-=0D
 hw/audio/meson.build                          |   1 -=0D
 hw/audio/pcspk.c                              |  15 +-=0D
 hw/audio/pl041.c                              |   2 +-=0D
 hw/audio/sb16.c                               |   9 +-=0D
 hw/audio/soundhw.c                            | 177 ------=0D
 hw/audio/wm8750.c                             |   5 +-=0D
 hw/core/machine.c                             |  23 +=0D
 hw/display/xlnx_dp.c                          |  12 +-=0D
 hw/input/tsc210x.c                            |  79 ++-=0D
 hw/ppc/prep.c                                 |   4 +=0D
 hw/usb/dev-audio.c                            |   5 +-=0D
 include/hw/audio/soundhw.h                    |  15 -=0D
 include/hw/boards.h                           |   1 +=0D
 qemu-options.hx                               |  37 --=0D
 .../codeconverter/test_regexps.py             |   1 -=0D
 softmmu/qdev-monitor.c                        |   2 -=0D
 softmmu/vl.c                                  |  10 -=0D
 tests/qtest/ac97-test.c                       |   3 +-=0D
 tests/qtest/es1370-test.c                     |   3 +-=0D
 tests/qtest/fuzz/generic_fuzz_configs.h       |   6 +-=0D
 tests/qtest/intel-hda-test.c                  |  15 +-=0D
 ui/vnc.c                                      |  15 +-=0D
 61 files changed, 329 insertions(+), 1140 deletions(-)=0D
 delete mode 100644 audio/audio_legacy.c=0D
 delete mode 100644 hw/audio/soundhw.c=0D
 delete mode 100644 include/hw/audio/soundhw.h=0D
=0D
-- =0D
2.35.1=0D
=0D

