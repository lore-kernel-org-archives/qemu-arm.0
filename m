Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F879CCF9F0
	for <qemu-arm@archiver.kernel.org>; Sat,  1 Nov 2025 12:03:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFAJT-0000v6-Eo; Sat, 01 Nov 2025 08:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vFAJE-0000sF-C3
 for qemu-arm@nongnu.org; Sat, 01 Nov 2025 08:02:17 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vFAJB-00050o-LQ
 for qemu-arm@nongnu.org; Sat, 01 Nov 2025 08:02:16 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so24486235e9.0
 for <qemu-arm@nongnu.org>; Sat, 01 Nov 2025 05:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761998529; x=1762603329; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NEsBfqyJgf64eZowqIzJvG8ONuOucNDXvK+/yVTUInk=;
 b=dm/1qkEYGySufWFr1x/tYmDOAauCm9hn2zgAkeDIQ2IgPqz2J+FyXWX2ijLD3Jl9mi
 rTNWBtOW+DzpbSAOpTEMhCi0D3snnO5YPSOfi1i1tVQ9AlUoeJWKiO7K/8T4MEWdWmlu
 chMgiWItQyLxOlTuT4dFey6g3AyWDgPOX9+NmnKWO+R4xtpbX8l8qRj5e9W5oy6aKWmi
 LPXrbIPoE4Qnkou56+EGv5JjS8OMMO6vUfsrrMaWMN7CtlwweeEGNI9JJ/Rbbv7y3JVo
 jC5htfdVxdxl+t3JN+ynRlFILGZzDfn5N1qAQWP7SCsQ/ajAFxJieWIoSgdnCpS1R2vl
 LNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761998529; x=1762603329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NEsBfqyJgf64eZowqIzJvG8ONuOucNDXvK+/yVTUInk=;
 b=lMSL/DuqyIjNRKkq50WD4UqSVVq8GyuHToFtMRXH51JlRAwaxwSNDoWpfdcU/e35S/
 V99KzfldRF7g0sAN9diPkPqgQuHqdMVsOqHJkj5wfM9qt4JONyj2m98p+qD4m7UDJs+2
 mqzclS19vo8mOZr21VR25d2nTVOcYaARZtdvkt25C77VQ8gbpKv1ljO/fV1G7nkftH9b
 x5goAGQ4qW2UcyZwlwt2d6BP6Tn6rWETB2sCUY677hfbxMkzP/iMofZbbO1RBe/7qs3B
 hSLfiZFxzsY6qrozH4P4oSoxMCKj4vytREDuSfkadvOxi/mCLCbBsANFdiHXdJqFHQ7c
 7i7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6lrnri2rS54iA2fzIwjh+T1dZRQi6j+wjTOZgcrWYv9pugUmUvqhJlm1IWLbPnpA1suorCh4nfQ==@nongnu.org
X-Gm-Message-State: AOJu0YwlKNN9s2lHnE+7GA1hzV1oMJ26oVLnMthuwif+9RIkUnEfFLnF
 ZNYyAJHT5UCSWpbp7DI4Nk5/EWPZ+K+JzM08hvwsgan1g1zAyUfDM5Ix
X-Gm-Gg: ASbGncv9MKKu9LyL8u1uU19xpdCmWUZKyd0Op9qjMu9DSZ6TNNdgQ0mFEqqisBMcKYF
 4xcaXxt2h6fI7gTDI4u1C2fubOjB46E0N2Owhbe3aNmj6h92DgW6G2+fAk2eehjq1VXW5Kc6wec
 hPryaTh/Zb2NKUh+SGdbiIU81VauWqk4tCWPmOyE8jhDwXWDQ2WzR9zqipGhyF6LpFjMBXke6yY
 r0ey/q/fBMptbuKbLTCujFovN5k6hDi3Yo9iyDVChDMxk3B1lyCDp3LA7+93VwK4C/tJGitIbMU
 y5/XLYcdnoBwlWYhg2iAKRVRKgLTZaa9poxqAJ5Sts4r2UZlJyqtOHluTD++XPOi6YYSATNkNL2
 WHObdVr3dpWTdt043B/FPW264Kmyim1NZCgUM0taTgwnkap1C0YIpA9/xv/ZPJyELrZl44dD1WZ
 JGGtbhs+vNXYu6cKKcUNWmceLiGakXFHmT
X-Google-Smtp-Source: AGHT+IEqJUDfuOPBxmGM0Sq+F02OrusOaNSD2lLceRqSH/jcYK2npNYMhP+cfBY+Z5duVehpqo0CEQ==
X-Received: by 2002:a05:600c:1e19:b0:46e:711c:efeb with SMTP id
 5b1f17b1804b1-477308aa8acmr58514165e9.25.1761998528711; 
 Sat, 01 Nov 2025 05:02:08 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772ff83182sm40734215e9.4.2025.11.01.05.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Nov 2025 05:02:08 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 0/2] KVM Support for imx8mp-evk Machine
Date: Sat,  1 Nov 2025 13:01:28 +0100
Message-ID: <20251101120130.236721-1-shentey@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This series adds KVM support to the imx8mp-evk machine, allowing it to run=
=0D
guests with KVM acceleration. Inspiration was taken from the virt machine. =
This=0D
required a device tree quirk for the guest clock to be kept in sync with th=
e=0D
host. Without this quirk the guest's clock would advance with factor <host=
=0D
system counter> / 8Mhz.=0D
=0D
Testing done:=0D
* Run `make check`=0D
* Run Buildroot image with TCG=0D
* Run `qemu-system-aarch64 -M imx8mp-evk -accel kvm -smp 4` under=0D
  `qemu-system-aarch64 -M virt,secure=3Don,virtualization=3Don,gic-version=
=3D4 \=0D
  -cpu cortex-a72 -smp 4 -accel tcg` and `qemu-system-aarch64 -M imx8mp-evk=
 \=0D
  -accel tcg -smp 4". Observe that the `date` command reflects the host's d=
ate.=0D
=0D
v3:=0D
* Fix crash in qtest (Peter) by using cortex-a53 CPU when ms->cpu_type =3D=
=3D NULL=0D
* Apply Peter's style fixes in board documentation=0D
* Apply Phil's R-b -- thanks!=0D
* Rebase onto master=0D
=0D
v2:=0D
* Rebase onto master=0D
* Mention various tradeoffs in the board documentation (Peter)=0D
* Accommodate for single-binary (Peter, Pierrick) by having CPU defaults=0D
* Add quirk to fix guest clock=0D
=0D
Bernhard Beschow (2):=0D
  hw/arm/imx8mp-evk: Add KVM support=0D
  hw/arm/imx8mp-evk: Fix guest time in KVM mode=0D
=0D
 docs/system/arm/imx8mp-evk.rst | 19 +++++++++++++++++++=0D
 hw/arm/fsl-imx8mp.c            | 34 +++++++++++++++++++++++++++++-----=0D
 hw/arm/imx8mp-evk.c            | 20 ++++++++++++++++++++=0D
 hw/arm/Kconfig                 |  3 ++-=0D
 4 files changed, 70 insertions(+), 6 deletions(-)=0D
=0D
-- =0D
2.51.2=0D
=0D

