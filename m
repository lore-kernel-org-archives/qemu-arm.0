Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2085827lfg;
        Sun, 2 May 2021 13:33:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCeJb0gsQWnZZQi04WUV6GaiGiKG11UBl/v76DQacg5zMpa5lePyP7mKiE/Swi6NRPVnSv
X-Received: by 2002:a05:6602:1546:: with SMTP id h6mr11817001iow.32.1619987628783;
        Sun, 02 May 2021 13:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619987628; cv=none;
        d=google.com; s=arc-20160816;
        b=CEgDfL27ondB/mg8EjVneibBhsSbLTR2eqK5TqEF5po5eh/DxrY6rQ34cijD41ydlk
         4k329CbODpM55FGrQUzvI0LFilJcswwqYtnwLoYIa0R7dPHpbEZQ43zFCt7h7eaOW+as
         O2cikacomAQTybhQEJsu/X5/V6caQqMvI6J5UkDOivJHMuiDy+UuU2ORFkl5wK5LKvxp
         vNMjfwow7fJN44DiBQHB0imiArmouhIRrC8ntdQJv5lR2VEEO/J/kXsKCHNlhPufirqC
         2QOVWixUHF24nw20ckF1adwKPbRVSEeLBOyE53C76s6foL6HXsysGPkK62QCFFcHfx1e
         //gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=FH+ddlK9h2y/4PSNdWYKGs4/YDcoAHz33ouEI9ORoiw=;
        b=B5puLusMfu4OsVjYqvN87SYRM3SJcC0qzz/j5KQHXntnIpJ7y+cU40Dvwc47RVe1J2
         xtBDC0zhGiFqsP8AUL2ev4IIf/Tnh4ldEjD8u+BLcfeSr34QhtCdLNFVJHZzH3bG7f8Z
         XcX3+dd0S0lUjKjDYWl6LIRri0NIy+LCym7M3uBHwwDQZZQWYBxOcBOoShg4oZ8EATIS
         4EbHr7ghbuAIIDs5Yv8YyiSDOUM57Gz/DPoKXq1tDnLtpoB/wfAf4YebmwBZLPy5H4ik
         2qcPIYGTUZd3Ft2Juz3wePmtoBlS+asaZ7YLh6EPtZxwOtsL81rFP0FpnyPrKJ3M7zyA
         qqFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZAx4216U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6si10885880ilu.44.2021.05.02.13.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 May 2021 13:33:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZAx4216U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldImi-0002iH-0a
	for alex.bennee@linaro.org; Sun, 02 May 2021 16:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldIkY-0001Ep-Hl; Sun, 02 May 2021 16:31:36 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldIkT-0007kW-1d; Sun, 02 May 2021 16:31:30 -0400
Received: by mail-wr1-x431.google.com with SMTP id h4so3453111wrt.12;
 Sun, 02 May 2021 13:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FH+ddlK9h2y/4PSNdWYKGs4/YDcoAHz33ouEI9ORoiw=;
 b=ZAx4216UufUEkQJ005T/68NqY6Bad3Hqi9cpglz1qJIEG3pYiMJ6pHfD4tmscCKCe0
 S0n6lqCvwYmtDfNIIBYqLnK3M2LS9nJZ9hse74s40x4hHFJgbD52InGeva3whAhkbYDM
 n4QoaV5KmkW78xIf2OnGshLXFBtJauEayRXTNVZqFI919vNaKSs5+8CpJQmg8q38TyXz
 fMocKL9vJpAZuNUFDWP0yUtvcTIkoHJ3Zgglx3YO5CoRUlFzf+6n3m2gl7FhDr8Rb78b
 w49cjbtTq3vYw1dXK07oXv/xELbOM0Zql0F8ERKqxti7DPFr6FvBSYwysWvcgPNJf6jL
 L8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FH+ddlK9h2y/4PSNdWYKGs4/YDcoAHz33ouEI9ORoiw=;
 b=YLXnVOGX7mrG1Uq9x3uNToU/4elELG3b4nyVYfi4Kz4YqrCiPva80LsFqHpu8csuEt
 ghxWDX2GpWSUNFMm4/zjL5t0aU6+V0zMFNgFL1pmhlFvZG895RbnGbP2ufzwWr1L8Hkc
 kOt7RcFamSD+cfJSzWIFaK2cxx1RZClVQ8+Wi+HabtFfUaIMITj5ZiJSAdmg7kyUM8u3
 DAYlUGuNLqEgfXKz+mg92Q1RCjOjuyu6sdc7y2qhUYaQdxL2WZ+/JRepGqGK6jm9RSjV
 6D/bVfgIwAdE546MD9B/KCDWTWsaaDWssKZ3XVRKAPzpd97BfkCzAMICczNTSYWdbEpE
 iDPw==
X-Gm-Message-State: AOAM530raB3VvUGV8TuHTQxDdP7B8/kWG2Tev1pYlNjS6NtR0YI+4KYk
 KVQ0aSdhXqAa8++kwoYEqeRyRL5s7hIJVFcA
X-Received: by 2002:a5d:6210:: with SMTP id y16mr20777264wru.13.1619987483819; 
 Sun, 02 May 2021 13:31:23 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id l12sm9766435wrm.76.2021.05.02.13.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 13:31:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] hw: Fix reset of bus-less devices
Date: Sun,  2 May 2021 22:31:18 +0200
Message-Id: <20210502203121.630944-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kCBQa3znnBUv

Hi,=0D
=0D
This series is the result of a code audit of the DeviceClass::reset()=0D
method uses, having Markus following explanation in mind [1]:=0D
=0D
  "Propagating reset from the root of the qtree to the leaves=0D
  won't reach a bus-less device, because the qtree contains=0D
  only the devices that plug into a qbus."=0D
=0D
Which is a resumed of what Peter said earlier in the thread [2].=0D
=0D
Since v1:=0D
- removed spapr_iommu patch (2 different reset is intentional)=0D
- removed microdrive patch (pcmcia cards should plug into a bus)=0D
- use device_cold_reset() instead of device_legacy_reset=0D
- use ResettableClass instead of deprecated DeviceClass::reset=0D
=0D
(patch changed -> not carrying David A-b tag)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/block/nand: Register machine reset handler=0D
  hw/pci-host/raven: Manually reset the OR_IRQ device=0D
  hw/arm/armsse: Manually reset the OR_IRQ devices=0D
=0D
 hw/arm/armsse.c    |  4 ++++=0D
 hw/block/nand.c    | 14 ++++++++++++++=0D
 hw/pci-host/prep.c | 11 +++++++++++=0D
 3 files changed, 29 insertions(+)=0D
=0D
-- =0D
2.26.3=0D
=0D
