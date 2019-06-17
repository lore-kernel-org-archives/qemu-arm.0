Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2291408wrg;
        Mon, 17 Jun 2019 02:46:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRD/SVyVUppxcNyWkTvbIEoNt7cst5FyY6FQOr382i41sLCzSgYVmVcnFDsKE+70+gWnd2
X-Received: by 2002:ac8:2309:: with SMTP id a9mr30535978qta.103.1560764785826;
        Mon, 17 Jun 2019 02:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560764785; cv=none;
        d=google.com; s=arc-20160816;
        b=PbZNiKl8hM2BgRca0ZU3zyMEdWA9cq09M2FoTqCh38VQDYAQFbQch16wOwweDiqDMN
         YbF1Qo/uZhFk1m/k5uZ9TvL4dLEeXH6hFX9qWZxBg0i0S0CrgH5hOxb9vKkjPsXj39wB
         y0IMLwSmKxDVhj2Xk148svSTBkgEeCG5XiE/tZJJeIK/JVdjj2cGl8gmjBUGTdUPlbG6
         9+ug250ZOozuVoTztXK5qwagsx32t0Ip7mU88a1evQrL7D9tAZ/x1o7fPN351zMpkZDL
         3DWiT8LHooMxL1EiBmcZfqwMhEPOr9ogoCN2cpdCGJQgDHmRSwhIuZXyYMPBmpNAGYvC
         4ELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=LuNFxqH1qMBHIP6EMJZj5/vQmN/NbVnxaEofK2CsCtM=;
        b=A1HUkAtnDMHdNWcAaaTlH05KZ9vQb31l/AAji85StKENq5N8B+wMdow4r4Arsn5eWl
         hkZ6bKmKTK2PZ4FzL9laPsQR5mnBSXP71POxoN5jreDYB1HvDu/w2h2NK7DL+ejV32fH
         q2yMxE2VKaZgiCfIltU8qethT58TuN+mAOLX4huII6P5An0qzK3WkS+aYQdzok7lmkUG
         bXtu8D5vecpT2mlYrJI+QUJmou2ZlhUF5H4FOGmnRdOFfK1PzsVcfqukbUtR7aNxCzJ2
         MrhX4RpixQh5b7CgO2/NVvGAASRRAw9Hq4qd4YNTrb86E+V6zAZbZ74reNKNwXAINnCe
         I4XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QWDATgu8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y48si7450922qvc.84.2019.06.17.02.46.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 02:46:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QWDATgu8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcoDZ-0008SC-AZ
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 05:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59418)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hcoDS-0008PO-AP
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 05:46:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hcoDR-00076q-15
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 05:46:18 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:41829)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hcoDQ-00074L-Pa
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 05:46:16 -0400
Received: by mail-oi1-x22f.google.com with SMTP id g7so6532830oia.8
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 02:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LuNFxqH1qMBHIP6EMJZj5/vQmN/NbVnxaEofK2CsCtM=;
 b=QWDATgu8dif3dHQ6pfJjMOYp7ckdh67Z41Hi8EfiMbQZtAa/lBFeLSS2CApr4TrSNl
 9xQ/mhBYTLQO+uDAW7ut9vHcrHb9rzwnHW7YS41GhYuVkU0Wbn2uRpDIIXZr0C9JDALq
 zcbQgHU5OaaEYShURaawTdfog/VfvVdFUQazNO0JrmKoI1L1NBIfRaD3Eo7KDRJHPind
 KoQIrR8UwK2tPUdsvXje2HEI9+mv51u3rG2JjDES5Qc1pMoUfq7HwEZWtT53vJIMhZlA
 FM3vbooArwL1of/lvUwgZc6d/aK4DLHZyxHsQcG/OOETZkA/C0kGisxMWx5JMhRkILdr
 xNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LuNFxqH1qMBHIP6EMJZj5/vQmN/NbVnxaEofK2CsCtM=;
 b=btoS1oeWet02naoy3LSmOiG35cfsGnLP1KFDVLmcdUYYPa3+8OxOtOul66LVOdOdQr
 YYl5m4ekrd1G68SZEvOsmxOzl/3HTni1v3CqPijF0eiuqWLdMBe2eAq6jDbS/URyOotV
 ecJKmfHqB76DPQcoSsQm4MxLi85imcm5yZYOsINaPBG593/dNGas8bzx+5aDIXPcF8ui
 qTv3Lpj4oKTiGM3Bv/dcATb0tpCQlVoWVjPjDBsd+X21UJPxcwcJ7mgvCiyuFDf5Pydw
 iFGVlurCNsYiNCHfYxbGn+G1KB3b9RBZPaLr3n5Wr+y5bGqZKV91JSRDh/ASYLBlgp9G
 TM9Q==
X-Gm-Message-State: APjAAAVQciMc5ZNFuxQKV7BNRqfyMYtWFH0lMZwrYq57Dyze7gvDfYHg
 QMWZNiUM9bqxhwduCPI+Dr3/+Fn4uIDqioMQqLcjaA==
X-Received: by 2002:aca:6185:: with SMTP id v127mr916018oib.163.1560764773977; 
 Mon, 17 Jun 2019 02:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <7757fcde65574754a8123d473be4b8a2@ALHUN12EXCH02.Parsons.com>
In-Reply-To: <7757fcde65574754a8123d473be4b8a2@ALHUN12EXCH02.Parsons.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Jun 2019 10:46:03 +0100
Message-ID: <CAFEAcA9KYsqTcXTTkPmL+x97i7v5X9J2gOPNg-P0oFVNoTFzfg@mail.gmail.com>
To: "Bensch, Alexander" <Alexander.Bensch@parsons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22f
Subject: Re: [Qemu-arm] Custom machine: Forcing initial boot address
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tk8zmsmWqGP5

On Sat, 15 Jun 2019 at 02:17, Bensch, Alexander
<Alexander.Bensch@parsons.com> wrote:
>
> Sensitive / Proprietary

Er, you just sent this to a public mailing list...

> I am currently trying to modify the MPS2 board to emulate an ARMv7m devic=
e I am working on, as none of the included machines provide an environment =
close enough to what I=E2=80=99m working on to be sufficient. I am running =
into an issue in which I cannot get the machine to execute the bootROM from=
 address 0xFFFF0000. The specs for the specific device I have (cannot share=
 the device model, unfortunately) state that there is a control register th=
at I assume is present in all v7m chips that selects whether to boot at 0x0=
 or 0xFFFF0000. I can also see evidence of this register being emulated in =
QEMU in =E2=80=98target/arm/cpu.c=E2=80=99.

It would help if you said what the register name was! "ARMv7M" is an
architecture family, which covers some things which must
be implemented, and allows some other things to be implementation
defined. There are various CPUs that implement ARMv7M, like the
Cortex-M3. Then these CPUs can be found in SoCs (like the
stm32f205, for example), which add extra memory mapped devices
with their own registers.

>However, since there is little API documentation I have been able to find,=
 I=E2=80=99ve effectively been reverse-engineering QEMU to figure out what =
needs to be set. So far, all of my attempts to modify control registers and=
 addresses directly have resulted in unexpected behavior and partial implem=
entation of my goals. I have had success in forcing the ROM to load at the =
desired address, and with GDB I can force the PC and SP to where I want, bu=
t the IVT must be at 0x0 by default. I was hoping someone knew how to enabl=
e the control register that sets the boot address so that the IVT can be lo=
aded from a different address.

Architecturally the vector table starts at the address
specified by the CPU's VTOR register ("Vector Table
Offset Register"). QEMU does implement this, but we
don't currently provide a mechanism for allowing an
SoC model or board model to specify a reset value for
it other than zero (because for all the boards we model
they use a zero reset value, so we didn't need it).
We do provide this mechanism for the v8M secure-banked VTOR --
this is exposed to the rest of QEMU via the "init-svtor" qdev
property, which the board can then set. So for a v7M CPU
you would need to add something similar for "init-vtor"
to set the non-secure VTOR reset value. Then the CPU
would come out of reset by loading the PC and SP from the
vector table at that address.

> I am running QEMU version 2.11.

If you're modifying QEMU you should start with a much
newer version than that. There have been a lot of M-profile
related bugfixes since then. Generally for development
of QEMU we recommend working with the head of git.

thanks
-- PMM
