Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2817102ejb;
        Wed, 4 Oct 2023 10:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvWahp3gLwhbn/pAB76RDEaUC3AflzDkqxI8crebZsedY0F4+IEUPgo8ZKvWrSd3+pWd5K
X-Received: by 2002:a0c:cd14:0:b0:66a:cad6:3c3e with SMTP id b20-20020a0ccd14000000b0066acad63c3emr1447038qvm.20.1696440763098;
        Wed, 04 Oct 2023 10:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696440763; cv=none;
        d=google.com; s=arc-20160816;
        b=Bz1t2h3XCLhYs67x+oVlYrc9g3bC+9VfdKW/LVfp+xviL6d1o8VNou4ajNwwpWUBC/
         lE4Bb+Qt7Dm1/OIHcUudfo2tM76jZdt897IrXcNHbRFALL8s/AfRSAzjOcXJNwuCImJf
         MkftH+IOZSpJOeybdDp/xSddBw4d3iry5FKFxzPiZ2YntyvKyJootkpL5enr8XCn/jj0
         812Ic06YPKh+JFzx+nwc9/TJyRDHRjlnz7TKW+na+FWZ9wHKE0LZ16E86LfFXWkBSU5Q
         l2RGkgTiJET6ZtSMY5fx9pPTs5BvZzGwKNIgGDXPgkdrv9LnRBlOPSuhnMw+3YVEzS/+
         txrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=OZhyeM5FepBgjf+S7ZSih5UBwb8TXlF9ocF/DczZgyM=;
        fh=5aeEcpS78LDvycDi9ETDiF/cljiJcNFeS4tAS2m+L/o=;
        b=haA4OotgfbeasatnYi5numA6GOp9h9KSKhLLkTrVFG26a6KGXUzfj7vOM+0y5Mun0t
         dHxsu5T0YQt4DXM7/f2JFAmcNokB7rY8fMrTumr1QV4aDjsTYVJUUu398XSCr82JDcwB
         FGphcMlfEfi17IF1tiLO+bNANRbKaCk/eGSHC6CT+IeE7r1hKi6UHHiVMtf2ye7IM9SO
         CPcu23E/Jv0sk2bugUgGRXuMGynfxsEmHR9vUUceGshYuK/N4NWuSNR/z7oag4XhxGgU
         8VF++NLkzHocmQXl9z2YUQikoOxtk+Ctl91EWYXkD5t89L2or5znmYeq+nC0ghWxAsI9
         yDOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jKOQz/aA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6-20020a05620a228600b0076dab948421si1682302qkh.23.2023.10.04.10.32.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 10:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jKOQz/aA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo5jX-0003AB-Dr; Wed, 04 Oct 2023 13:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5jP-00034O-OF
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:32:20 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5jA-0000q7-GF
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:32:14 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4053c6f0db8so360395e9.3
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 10:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696440722; x=1697045522; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OZhyeM5FepBgjf+S7ZSih5UBwb8TXlF9ocF/DczZgyM=;
 b=jKOQz/aAV29MeOqHHC5Hof/Ar1aDAK7tagWIvMZWDbBlevKihH6IV4sUxIDsybI8HZ
 h8lxuVjGw/233G+04bEZbJWVz2RAfdWlAh/E0xU/D0XQDTJm3+6xrpWCWd00W0H98FrG
 /slw1UKeUVcnrqkLhqsFnifVa8KDJiVKZnkrwPOwG6o2cMYGtVUotdJUe5z5Mpqr6vnE
 I7FBBZ5Uv6JKT4xk1cEywHLHR9M2aEPCeDs+4YiD8lQNtZF2XY0udimG7PsSwt7lBqQD
 qTZi/pqfEEapYTLKMTWMUfayYMx4XWnk9VbErbPv34ETguXr1Dh7cZFT/XoRyzWw4XQ+
 4WPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696440722; x=1697045522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OZhyeM5FepBgjf+S7ZSih5UBwb8TXlF9ocF/DczZgyM=;
 b=ay0PCu/3ACvYjwdh490pmydRsfzwiO2ZwNfqtOQfH5/nMjPSpypI3X/T7cO/ktqdfO
 DDFs3Y3shESiUTJLGf6FT3/fipKW/n0LyBLyx5NTs+J4MkZ0epNFz+YYOYhuVEwTSoSs
 U+WijeX5HqJlYxr6T90YdaxAYAHFcO2rwdVAl21rMcCuJD9wrUf+J2d2jI2B5tcCO1RY
 ys5KAGHzi22Ne2vJZD4BJ8hpH8EIrGKbgsA1y3UPo+AjFj5cSsNKZa10qkd2m6okG+RQ
 S12V5/2NdOg/Bz8NUpFE74rEMa3VoajEkNRgyhufgWjG4Is/I+e/vWIXGxSLBhbPswee
 PWVw==
X-Gm-Message-State: AOJu0YzoKYywYjaUxcw1gWSrdcAsd0ghkIZQOHDklLSBikpmLsfBk5fb
 cPUCM4W8bnCdCWjAEYyPVJDR9g==
X-Received: by 2002:a05:600c:2113:b0:402:e6a2:c8c7 with SMTP id
 u19-20020a05600c211300b00402e6a2c8c7mr3059762wml.7.1696440722358; 
 Wed, 04 Oct 2023 10:32:02 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 p7-20020a7bcc87000000b0040535648639sm2016919wma.36.2023.10.04.10.32.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 10:32:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/21] qapi: Kill 'qapi/qmp/qerror.h' for good
Date: Wed,  4 Oct 2023 19:31:35 +0200
Message-ID: <20231004173158.42591-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3AlmMVWZLAAv

Hi,

This is kind of a selfish series. I'm really tired to grep
and read this comment from 2015 in qapi/qmp/qerror.h:
      /*
       * These macros will go away, please don't use
       * in new code, and do not add new ones!
       */

Besides, these definitions are still added in recent code
(see for example commit 09f9ec9913 from June 2023). So
let's finish with this 8 years old technical debt.

Overall it took me 3h: 1h to find the correct Coccinelle
doc about Python use and read it again [*], then 1h to
adapt the script for each patch, rest is testing and
writing comments, so the scripts used could be used as
reference later.

Regards,

Phil.

[*] https://www.lrz.de/services/compute/courses/x_lecturenotes/hspc1w19.pdf

Philippe Mathieu-Daudé (21):
  qapi: Inline and remove QERR_BUS_NO_HOTPLUG definition
  qapi: Inline and remove QERR_DEVICE_HAS_NO_MEDIUM definition
  qapi: Inline and remove QERR_DEVICE_IN_USE definition
  qapi: Inline and remove QERR_DEVICE_NO_HOTPLUG definition
  qapi: Inline QERR_INVALID_PARAMETER definition (constant parameter)
  qapi: Inline and remove QERR_INVALID_PARAMETER definition
  qapi: Inline QERR_INVALID_PARAMETER_TYPE definition (constant param)
  qapi: Inline QERR_INVALID_PARAMETER_TYPE definition (constant value)
  qapi: Inline and remove QERR_INVALID_PARAMETER_TYPE definition
  qapi: Inline QERR_INVALID_PARAMETER_VALUE definition (constant value)
  qapi: Inline QERR_INVALID_PARAMETER_VALUE definition (constant param)
  qapi: Inline and remove QERR_INVALID_PARAMETER_VALUE definition
  qapi: Inline and remove QERR_IO_ERROR definition
  qapi: Inline and remove QERR_MIGRATION_ACTIVE definition
  qapi: Inline QERR_MISSING_PARAMETER definition (constant parameter)
  qapi: Inline and remove QERR_MISSING_PARAMETER definition
  qapi: Inline and remove QERR_PROPERTY_VALUE_BAD definition
  qapi: Inline and remove QERR_PROPERTY_VALUE_OUT_OF_RANGE definition
  qapi: Inline and remove QERR_QGA_COMMAND_FAILED  definition
  RFC qapi: Inline and remove QERR_UNSUPPORTED definition
  qapi: Remove 'qapi/qmp/qerror.h' header

 qga/qapi-schema.json             |  5 +-
 include/qapi/qmp/qerror.h        | 62 --------------------
 backends/cryptodev-vhost-user.c  |  5 +-
 backends/dbus-vmstate.c          |  3 +-
 backends/rng-egd.c               |  5 +-
 backends/rng-random.c            |  4 +-
 block/gluster.c                  | 22 +++----
 block/monitor/block-hmp-cmds.c   |  7 +--
 block/quorum.c                   |  4 +-
 block/snapshot.c                 |  5 +-
 block/vmdk.c                     |  9 ++-
 blockdev.c                       | 16 +++---
 blockjob.c                       |  4 +-
 chardev/char-fe.c                |  3 +-
 chardev/char.c                   |  4 +-
 dump/dump.c                      | 11 ++--
 dump/win_dump.c                  |  5 +-
 hw/core/qdev-properties-system.c |  6 +-
 hw/core/qdev-properties.c        |  3 +-
 hw/core/qdev.c                   |  4 +-
 hw/intc/openpic.c                |  4 +-
 hw/ppc/spapr_pci.c               |  5 +-
 hw/usb/redirect.c                |  7 +--
 migration/migration.c            |  7 +--
 migration/options.c              | 99 +++++++++++++-------------------
 migration/page_cache.c           |  9 ++-
 migration/ram.c                  |  5 +-
 migration/savevm.c               |  7 +--
 monitor/fds.c                    |  9 ++-
 monitor/hmp-cmds.c               |  3 +-
 monitor/qmp-cmds.c               |  4 +-
 net/filter-buffer.c              |  4 +-
 net/filter.c                     |  8 +--
 net/net.c                        | 10 ++--
 qapi/opts-visitor.c              | 12 ++--
 qapi/qapi-forward-visitor.c      |  3 +-
 qapi/qapi-util.c                 |  4 +-
 qapi/qapi-visit-core.c           |  5 +-
 qapi/qobject-input-visitor.c     | 53 ++++++++---------
 qapi/string-input-visitor.c      | 27 ++++-----
 qga/commands-bsd.c               |  9 ++-
 qga/commands-posix.c             | 47 ++++++++-------
 qga/commands-win32.c             | 65 ++++++++++-----------
 qga/commands.c                   | 10 ++--
 qom/object.c                     | 16 ++++--
 qom/object_interfaces.c          |  3 +-
 qom/qom-qmp-cmds.c               |  8 +--
 softmmu/balloon.c                |  3 +-
 softmmu/cpus.c                   |  8 +--
 softmmu/qdev-monitor.c           | 24 ++++----
 softmmu/rtc.c                    |  1 -
 softmmu/tpm.c                    |  8 +--
 softmmu/vl.c                     |  5 +-
 target/arm/arm-qmp-cmds.c        |  4 +-
 target/i386/cpu.c                | 15 +++--
 target/s390x/cpu_models_sysemu.c |  4 +-
 ui/input-barrier.c               |  3 +-
 ui/ui-qmp-cmds.c                 |  7 +--
 util/block-helpers.c             |  4 +-
 util/qemu-option.c               | 21 ++++---
 scripts/qapi/visit.py            |  5 +-
 61 files changed, 305 insertions(+), 437 deletions(-)
 delete mode 100644 include/qapi/qmp/qerror.h

-- 
2.41.0

