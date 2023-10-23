Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1475134ejb;
        Mon, 23 Oct 2023 09:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeteHCVpXOE1rfdR6FBy3wLlZ6igXcemJ1AaII0iaEXIayuzmJXQ/Fgwti4EmhnB3SvLEp
X-Received: by 2002:a05:620a:2484:b0:774:32a7:fe91 with SMTP id i4-20020a05620a248400b0077432a7fe91mr12149275qkn.48.1698077776328;
        Mon, 23 Oct 2023 09:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698077776; cv=none;
        d=google.com; s=arc-20160816;
        b=S7mXupDiejxb6C3FgiiZUBfUCId16w4DKtF3L+Thccz4xUZ7MAFMXYzdN6L7Ppfovd
         3IQXSghU+IZ2zXMA2GA6oxKjC/Gum1D2T6xK47AZfJZIYdgrP9eWZLjHKHA98tu/+qh4
         qX4WS9/KGKdTd08YthIbuyl/G4u0DNiJGYdSadVGRgfyeOqdKZMfoQp4n117iwyR4BJU
         6XnY44EJ5Qj1Tv3lYkklMvwm1/9VSnOsj54YCD+NsALXlavTWCRM/kSpZCkM8ww2JwiS
         PD1zqB/cTLzgJyONqLpLiAAqdHT9WT+Ega4WPcLF2Qr8pqnjcmB+hdEy4toBPy3QMlCx
         1S1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=bsSeqewKCVJ/nh9tuT/DGkDBmIin4xAU7CgLLVG4qmM=;
        fh=55V10LP5MT2YC3CMmeD8ox5TQv4iI1rYZzQqEc55Dnw=;
        b=Y19nHpD7fEC0XV36Tk38XkgTNlEjE/cSyd9N/BouplOiTJBKfTh8WyiNJLtnQ5qVE1
         wtJ3ZpjwTNLYvcwBuiXCLachY4G11PJ+6NSGDq7aKPKhKLz9j7Fg6N70tOdue8qtCIHq
         XAd7EEFNQtmoxGPcQFtVNzhJUCEmWrK2uuwDuRwMvtFNxKMZCOL/J/siek29UcYWoBPN
         1USJ5hjcdA7/pTqqLaIfZlLAXv9PBTIKvyhL2k9NKTMPORjfwuPhdm8wscAXJ/IVG/EU
         KESpMA4Nt7fIC+c73SrZd2d6AU5OFDtYCXG7asBhl4pjp2t36uc4BhBqvpCRzoxHfqns
         udkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nx4A1L5R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl3-20020a05620a1a8300b0076d9dc0bc9esi3669418qkb.230.2023.10.23.09.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 09:16:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nx4A1L5R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1quxao-0005ZL-Bt; Mon, 23 Oct 2023 12:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1quxac-0005IU-Co
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 12:15:40 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1quxaa-0002dV-Hp
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 12:15:38 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso20194335e9.1
 for <qemu-devel@nongnu.org>; Mon, 23 Oct 2023 09:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698077734; x=1698682534; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bsSeqewKCVJ/nh9tuT/DGkDBmIin4xAU7CgLLVG4qmM=;
 b=Nx4A1L5RT96XnNYf/pTKtiC1Y4b1csxeFbWbzZ8J3RyyDU0RXFfei60Be+iqJtbA71
 HO5dwoou6KKGHW9ceFNu/urzus/ZqIQIr/XWOYHnUhtohCN73pHCeotdN4E0l1kOt8ZB
 qBOLb/lQC8nKfsyQCAiIxP2QPR0Wv7H+ZEIfNqEGalIpcusINh5dH7iuDH7tgC0Lt95w
 PBHa8/o/l63Jg35DV+gfbEtNgscZ4v804/n1GN4LjTvB+ytQwOTsd/EHqCvcAC6NvTDp
 cbyb/wNNpNaQEbcDeBgnkDHK3sI6duAkzuwItzJd/5+RoKQbFf3aiqOLsWvwi+GTip9l
 5oTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698077734; x=1698682534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bsSeqewKCVJ/nh9tuT/DGkDBmIin4xAU7CgLLVG4qmM=;
 b=mBkzWV2tm77gN1PJKVBcKZt/iAK7+Xh4sBsz+Iqkl22Nu1PVxCeUWc0jmVxHmrZM5K
 XcKbw6gcfz+9pvReFIstk3YA/VdKnm8H4h/8BgF54uuggp1bKuhZCzmFIIKA1V8apFF5
 twoV0prn1k5tyTKGJBs9s3XEOZh5tVOC9hwLlbP4o69uMs6UgNmgMPsbPFWa2+08F2i3
 6lYwU8q8GDT+PlbNMCt35DstjcAN7xSs21vlt49ir6poM+aDVENlzc4q+xhI8EB9S/q5
 Xp/GDDgYgqzBVVHu4Z80EVbiXGAF6vPeC9G0tn89vXkKCsFjrE2mjjFj0xFFHPE8p+8N
 w5yw==
X-Gm-Message-State: AOJu0YyItJe4gkRB/zlU9QrMKMFr0lIISRFjQS7ghpjbwUjapT2DdqZQ
 TodHHduyFhZ77l5bmqXZozb5zDGhpqZX10fw4ck=
X-Received: by 2002:a05:600c:3414:b0:401:c7ec:b930 with SMTP id
 y20-20020a05600c341400b00401c7ecb930mr11736861wmp.10.1698077734497; 
 Mon, 23 Oct 2023 09:15:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c2e4c00b0040648217f4fsm14460597wmf.39.2023.10.23.09.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 09:15:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Axel Heider <axel.heider@hensoldt.net>, Laszlo Ersek <lersek@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 0/3] hw/arm: Create second NonSecure UART for virt board
Date: Mon, 23 Oct 2023 17:15:29 +0100
Message-Id: <20231023161532.2729084-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GDpdppZtAGgo

For some use-cases, it is helpful to have more than one UART available
to the guest, but the Arm 'virt' board only creates one.  If the
second UART slot is not already used for a TrustZone Secure-World-only
UART, create it as a NonSecure UART if the user provides a serial
backend for it (e.g. via a second -serial command line option).

We've wanted this for literally years; my first attempt at it
was this series in 2017:
https://lore.kernel.org/all/1512745328-5109-1-git-send-email-peter.maydell@linaro.org/
More recently  Axel Heider revived the idea with a patchset last year:
https://lore.kernel.org/qemu-devel/166990501232.22022.16582561244534011083-0@git.sr.ht/

However it has previously foundered on the problem that EDK2 does
odd things when presented with multiple UARTs in the DTB. (Specifically,
it will send the guest GRUB bootloader output to UART1, debug output
to both UARTs 0 and 1 depending on how far through boot it is, and the
guest kernel will use UART0 since that's what the ACPI tables say.)

Several things here I think mean we can finally get over this issue:
 * I learnt about the device tree "aliases" node; this allows us to
   explicitly say "this node is the first UART and this node is the
   second UART". So guests like Linux that follow this part of the
   DTB spec will always get the UART order correct; and if there are
   obscure guests that turn out to misbehave, we can point at the
   spec and say "this is how you should fix this on your end"...
 * This patch, like Axel's patch, only creates the second UART if
   the user asks for it on the command line, so any pre-existing
   command lines will not change behaviour.
 * Laszlo Ersek has kindly written some EDK2 patches that rationalise
   what it does when it finds more than one UART. This means that
   we can tell any users who do want to use two UARTs with EDK2
   "you should upgrade your EDK2 blobs to version NNN if you want to
   do that".

I haven't tagged this patchset RFC because I think it is good for
review as it stands. However I think we should ideally wait for the
EDK2 changes to go upstream first, so that we can fill in the TODO
comment in patch 3 and mention in our release notes what the new
EDK2 that correctly handles multiple UARTs would be. So I'm not
targeting this at 8.2.

Review from ACPI experts to confirm that I got the ACPI table
changes right in patch 3 would be appreciated :-)

thanks
-- PMM

Peter Maydell (3):
  hw/arm/virt: Add serial aliases in DTB
  hw/arm/virt: Rename VIRT_UART and VIRT_SECURE_UART to VIRT_UART[01]
  hw/arm/virt: allow creation of a second NonSecure UART

 docs/system/arm/virt.rst |  6 ++++-
 include/hw/arm/virt.h    |  5 ++--
 hw/arm/virt-acpi-build.c | 22 ++++++++++-------
 hw/arm/virt.c            | 52 +++++++++++++++++++++++++++++++++-------
 4 files changed, 65 insertions(+), 20 deletions(-)

-- 
2.34.1

