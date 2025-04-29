Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp253968njm;
        Tue, 29 Apr 2025 06:23:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWC/N9/iqTZcJVAfCMrcMNBmDL+pps/22+W3owyAwJHq9lWf50IvUUKOAZyWNgP2joHzbTXRTmdHwEYIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH/fcl2mqEK4g4O2Ux458y8dPYhPasAgEKUaNUURuU41jGVyeWgp2oNekd0mxT7o3dqMxWr
X-Received: by 2002:a05:620a:394d:b0:7c0:a1c8:1db3 with SMTP id af79cd13be357-7cabe49fb91mr454903685a.11.1745932996298;
        Tue, 29 Apr 2025 06:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745932996; cv=none;
        d=google.com; s=arc-20240605;
        b=UDNapRE/Bm1RJW0qftdO9g7EtdqG1nm0hR2EqCJv073mUvo0aN9zhnnbwN0AWiumWl
         hGuJmhyrZsXJwJEYfAOxZSGcwerg/5PL6VLEyrNkH25aXBElD8IubqkMljkCA/8S3kr6
         kLWmMRzrq4/sOQOpBujaKo1802rB26P2taguQn8YoyBNtb1kfd5XyhIGZAO6Msw1aRXo
         50tOlOBNzaSpAsBcUzJZlgfWLFFXanou9ZntjvZ4nJ3vOsdvZSqke3vTc/S+RGKf07xF
         EekrQ5M3YKwwGXoq2mkoBwMs5B7UZod0lSoYly9Ra6S6EhTD/RsJkTifcX53BDWwvxLY
         JI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=IoMNbAYXFLaqKD9rC9xntMAc6IoA+MzpMqmKhBJw3ns=;
        fh=IUJDqsqe7thKzGjg2tEzLm8ihsFAVxwlDscjrnqubNw=;
        b=IoMx3MBlOwGhzKS+aeHEvWk1phbMsLGuROm9TOAgMwrb0VYv9EY+GnxcQkylWZCat8
         ZaGg1Zmp8UU08nUUpCtnvTmGNXQFzxALoYmY2wwUGXtjNhUlTjprzROt53vBFLM7UjVx
         RMyrTYA4nE6wU1PeoMqtjgT1NRttV7ZCx8vU8jRvvldWlvYHXB7WrDEY/0fMmoxQRIjd
         usdbeqZQp1OZezwpyfcOKJRkoSjwIydtnbj7IzJwJxMCIksyo9sELrh/qLAJUtqqSRbS
         WHnpct6CEr2voC0wMMpFXGo4WH2W5Y9hLuQRQhZ+76AVVlh8a3yASH3oYsUran4PD4X5
         g8Dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fUImrGcc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4c092d9a9si122551816d6.138.2025.04.29.06.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Apr 2025 06:23:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fUImrGcc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9kvV-0005F3-UK; Tue, 29 Apr 2025 09:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1u9kuj-00056k-G5
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 09:22:23 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1u9kub-0005bZ-PN
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 09:22:17 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so56738265e9.3
 for <qemu-arm@nongnu.org>; Tue, 29 Apr 2025 06:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745932922; x=1746537722; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IoMNbAYXFLaqKD9rC9xntMAc6IoA+MzpMqmKhBJw3ns=;
 b=fUImrGcc73Sh4R4LniSoW6KRJ9+7lg5/52BnnKVwhTE5QfRzmD3MHmccO4miPUypQw
 dBrBGthw2u4/ZAkD9KZyCLOKlg+rOFanDZdBxu1eNpmDqnDtxqkl4bNmmWkhXX//r9A5
 3GCKuzinUdbr4B6hFuhrMXFzIlbu3QjFTJRk+/HbNXRUudJ3kWA/Yr4ndEuIn+vfnXpf
 6lb7XjWk7n+nzwU4S1LYnXFdgnpOrDOb97s3FOqWj6y2DzTuWyN0FyDOCHrvK9klAkAn
 kwGlhJV2LZQ7vLyENKsKftem0n2kO9IZ6c761m+214msaln1UsgPTr2hr1Iy1qAhu8Dy
 6tyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745932922; x=1746537722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IoMNbAYXFLaqKD9rC9xntMAc6IoA+MzpMqmKhBJw3ns=;
 b=a18toYzJby04l9ExS7nTG2S9tgh9X7CeFExcPcZRmKIQ7lT1CT+cwJViV0hYzpxaRo
 AL8g2hcccpv1CQnFw1Pm5pRK3C94/GFeVwx3B93E67TaHw1GiOzsJipiVrl+WdFXfIu3
 xkWqNc8Ok5ZBhjmVwyNqI7Ln1Hv4DLxxAfJgdxxO2f2J0PRiqoWwazWy/qhOlfVRwJlR
 vlEKNyzmaStEncYQzux+z5ry/sBcIl+viR8W2WpnXV9uj1aNBNT/sNuJ4VpGr/g44fGa
 1/zoO1zOVtSonYB3ElsKWF73Q2qy2iOi/v9Hy0771WGI53b57ifMWV8xUqSSMR74YY6m
 iSNQ==
X-Gm-Message-State: AOJu0Yz7PJcgdWng2a69Ph5qQH57eXMGSb74F6t/aHZ2meq2yJRkOa2C
 A85mWX7G2TNwwtYbqP6hBf4XJec1doG2F8cWXqDKqLe8sLLiLX/0d/8lMvn2cNSoT1EYsEaupeb
 X
X-Gm-Gg: ASbGncu2sP2wahPdU9wGSe+tPuuTvjzU6LTHIqYMVTOjnoi2wq0hrMtPD2pvw/nutmT
 YaE+jb9Ne28oyD/jo7zjrYMtSqqEDNJuNVO0oM2DIbsosc/9pm445yUikE2VoKNWLdagHZ6pVfb
 4byS6S/PCeL+a3AbK/WQ9uxLUOacUtEYOf4CbvOmV2B09VxTFvf9uTBZHr7igD6ouyS9a/qGvGM
 5WWqjHAQoVP1hKRvHR/6hKMunTVgvLv1VIlO0zMozh6EJh52U+9kukzKJa6ql/wfRFogxzJd+Di
 08LjgzKjBbmX09ai0t/GoSsB8Oi5pzfVoCeHdkHN3Oy7lzQ=
X-Received: by 2002:a05:6000:401e:b0:39c:e0e:bb46 with SMTP id
 ffacd0b85a97d-3a07aa5fd30mr8672886f8f.4.1745932922513; 
 Tue, 29 Apr 2025 06:22:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca5219sm13729371f8f.27.2025.04.29.06.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 06:22:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v2 0/7] target/arm: Remove TYPE_AARCH64_CPU class
Date: Tue, 29 Apr 2025 14:21:53 +0100
Message-ID: <20250429132200.605611-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: H3nqB6UcfYRP

Currently we have a class hierarchy for Arm CPUs where
all the 32-bit CPUs (including M-profile) inherit directly
from TYPE_ARM_CPU, but the 64-bit CPUs inherit from
TYPE_AARCH64_CPU, which is a subclass of TYPE_ARM_CPU.
This subclass does essentially two things:
 * it sets up fields and methods for the gdbstub so that
   the gdbstub presents an AArch64 CPU to gdb rather than
   an AArch32 one
 * it defines the 'aarch64' CPU property which you can use
   with KVM to disable AArch64 and create a 32-bit VM
   (with "-cpu host,aarch64=off")

This is a bit weird, because the 32-bit CPU you create with
KVM and aarch64=off is still a subclass of TYPE_AARCH64_CPU.
It also still presents gdb with an AArch64 CPU, so you
effectively can't use the gdbstub with this kind of VM.

This patchseries removes TYPE_AARCH64_CPU so that all CPUs,
both AArch32 and AArch64, directly inherit from TYPE_ARM_CPU.
This lets us fix the bug with gdbstub and "aarch64=off".

In this version I fix the bug that Philippe found where we
were calling arm_gdbstub_is_aarch64() too early, before the
object had been created and the "is it AArch64 or not?"
question resolved. This is basically moving the gdb_init_cpu()
call into cpu_exec_realizefn(), but we need to do a little
adjustment of microblaze for that to work.

Version 2 of the patchset:
 * patches 1-5 from v1 are already upstream
 * new patches 1-3 here delay the call to gdb_init_cpu()
   so that it is done only after the CPU object is at least
   inited and we definitely know the final value of the
   'aarch64' property
 * patches 4-7 are the old 6-9 and have been reviewed

thanks
-- PMM

Peter Maydell (7):
  target/microblaze: Use 'obj' in DEVICE() casts in mb_cpu_initfn()
  target/microblaze: Delay gdb_register_coprocessor() to realize
  hw/core/cpu-common: Don't init gdbstub until cpu_exec_realizefn()
  target/arm: Present AArch64 gdbstub based on ARM_FEATURE_AARCH64
  target/arm: Move aarch64 CPU property code to TYPE_ARM_CPU
  target/arm/kvm: don't check TYPE_AARCH64_CPU
  target/arm: Remove TYPE_AARCH64_CPU

 target/arm/cpu-qom.h    |  5 ---
 target/arm/cpu.h        |  4 --
 target/arm/internals.h  |  3 +-
 hw/core/cpu-common.c    |  3 +-
 target/arm/cpu.c        | 36 ++++++++++++++++++
 target/arm/cpu64.c      | 82 +----------------------------------------
 target/arm/kvm.c        |  3 +-
 target/arm/tcg/cpu64.c  |  2 +-
 target/microblaze/cpu.c | 22 +++++------
 9 files changed, 52 insertions(+), 108 deletions(-)

-- 
2.43.0

