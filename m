Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B92CCF9E9
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 14:24:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE75k-00068j-A5; Wed, 29 Oct 2025 10:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vE75a-00067K-2Z
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 10:23:52 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vE75N-0008Kb-84
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 10:23:47 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4270a0127e1so5795592f8f.3
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 07:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761747809; x=1762352609; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FTNe6gnfG2cpAQOiw+oJAVOw6pV994804oSGHalc8e0=;
 b=On21YVEJJiUciUC7m47m1rSQVwY8SD8FbNXcMvqgCrpFYFFl4du56YjBvp1B5+R2pP
 Humk3jVb+P3axs04A6Oj1LsUJVOAeZi6Obn6hteUa+C9QEwN7wJALFKns3YGpE+FQz3H
 1i0JV3Ng75vvSj71qTuMSvOfuBbsqtKzcL80ZZecAjwuHp5YgScbHYq07qGFIdMYNvhj
 6Yy80RvDNfy67XdYOLYZSuxKH9YRvEEGeBrXVNRfDIY6QcOj2jF5EkhmCvgZ+Mu6kR0M
 Eb9JNg6xG4LjpglEU259TlHZxXna45QIKuJwwa3WKQaqeSpDSdNkyW/lByaYd/u8vFV2
 HUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761747809; x=1762352609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FTNe6gnfG2cpAQOiw+oJAVOw6pV994804oSGHalc8e0=;
 b=PZKrhc4dJ4bVHjaEHHS/oJFnG7TN89DObrnAZWnUNBi8lMsROFCKjowR7rYElVq0ZM
 kE4e2UWMP2Io7OD1nEGzRUkmfaRU3tGT3Pf4soJ/xLFqyZXTsMjZQY70uxiQZNIic1+0
 Nh6L+UUa6pKG867Z6Cyv0lcTz4v73VpsMnVLZyCEZ9rveEW4Fl5C5HHZMAuovI1o2mYH
 pnrutEH0KjD8GNJBJ/6pN4OEcdVSX2hU0dGXSZgSt6VXA1rRhAXeMPrSmk5kcRGLYfMs
 0KQoNP1ffjFRfISr2pVwNkUMI8Oooy8fkOLjfEbuA0Z7MQ5Kb98OISa4VZdADg3u37Ze
 tnOQ==
X-Gm-Message-State: AOJu0Yz5lhHQJEXrmt+wKflwO4ddNrbHY1SjsiWMO8Bm5NHTndGZ3cV9
 BJuaukMEh+xH8t605DF6T4sRpLYSKLrp920smfG1yPCXTG0Nryn2zbfj
X-Gm-Gg: ASbGnculdVNHvpTBe7r4Qg9T9xKxKcca/OIPCptRLs6SyutsS21MK+Wi1UaS7w0c5dj
 1Z0rcyPvkFHE/tAtZiYNuGBu3OUdS3Xceo2v3pjAgEuj6a2Mhz4WWMl0jKwPNEGqTjCgkkmCOXJ
 lFhSVAE9fNGdtMW4rcHn7VLYk0R+36rRVYIfvK6cBEgiAx0pZJnaYKIVKqASrrcGzu0LRmfZjSC
 9dzGqyui/6L3Mevu5xNya/j2e/SNsE9HXsAI8GJXxFhE8UWXISaxKdrHGY3Z47kGOEdwpGDzYfp
 QxC6CRE7tH/paROyeAr1awVlZ+lbc/AxxForJAVHes97u2noE2rxO08KeOhUL3uoum8dJTqOfNy
 35I+iSZoj0n+lgMDAXEQvRExqT/mlZ04eh8jTwBC44fHj7vkjBCtmF8CgDLOXY285Y8/N3H3hxD
 25lovT4GypFl6uXYVFq1faUkv7yS99LDl5
X-Google-Smtp-Source: AGHT+IF8OK+bx7nuhKhlPR1C4M19AriVl2FHj6ZRJ/APYHdveoeSzbITN416YWrBbPU2nl+gErbCgg==
X-Received: by 2002:a05:6000:25c8:b0:425:855c:5879 with SMTP id
 ffacd0b85a97d-429aef85215mr3017283f8f.15.1761747808425; 
 Wed, 29 Oct 2025 07:23:28 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952ca569sm26038747f8f.12.2025.10.29.07.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 07:23:27 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/2] KVM Support for imx8mp-evk Machine
Date: Wed, 29 Oct 2025 15:23:09 +0100
Message-ID: <20251029142311.2986-1-shentey@gmail.com>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
* Run `qemu-system-aarch64 -M imx8mp-evk -accel kvm -smp 4` under=0D
  `qemu-system-aarch64 -M virt,secure=3Don,virtualization=3Don,gic-version=
=3D4 \=0D
  -cpu cortex-a72 -smp 4 -accel tcg` and `qemu-system-aarch64 -M imx8mp-evk=
 \=0D
  -accel tcg -smp 4". Observe that the `date` command reflects the host's d=
ate.=0D
=0D
v2:=0D
* Mention various tradeoffs in the board documentation (Peter)=0D
* Accommodate for single-binary (Peter, Pierrick) by having CPU defaults=0D
=0D
Bernhard Beschow (2):=0D
  hw/arm/imx8mp-evk: Add KVM support=0D
  hw/arm/imx8mp-evk: Fix guest time in KVM mode=0D
=0D
 docs/system/arm/imx8mp-evk.rst | 18 ++++++++++++++++++=0D
 hw/arm/fsl-imx8mp.c            | 33 ++++++++++++++++++++++++++++-----=0D
 hw/arm/imx8mp-evk.c            | 21 +++++++++++++++++++++=0D
 hw/arm/Kconfig                 |  3 ++-=0D
 4 files changed, 69 insertions(+), 6 deletions(-)=0D
=0D
-- =0D
2.51.2=0D
=0D

