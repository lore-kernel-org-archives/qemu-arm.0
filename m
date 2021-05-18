Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp485961lfm;
        Tue, 18 May 2021 07:53:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqUN4OlfTXwrWiejd5AI5LlH8tzKnrn3MvK7zPotkcNDiCgghp3VWtCB1ahLjWJzxnxDUQ
X-Received: by 2002:a02:a492:: with SMTP id d18mr5974070jam.28.1621349601667;
        Tue, 18 May 2021 07:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621349601; cv=none;
        d=google.com; s=arc-20160816;
        b=SNcL8/16NsHWG3sM0obOBzB4oEl6b2Fv0n7b/rmrPCvo71RoVBFPd6Sek6alZF+TPz
         iegPc7fA8v6t4UMHqo6sNXlv6ArgAVsZpcAVsrhf/UfvXG15GQ/yRGgkLQRckp1C1vV0
         D6icyr+T4TT88pNvSNhNg/7YGdctXB0JBfQBV8os4ZJHNXv0mShiveG7PnA2bT9390Jz
         kNS9FpvpDnj6sYS1/24j3IO4jVd5YbJgGgWKtPCqjNhkohySWCVwvC+a6Jom1WGmMIbY
         82Iu3eUOhMKGOz5M7ga5CkhRD2HO349Rfv6Fa+GD2+O9TfrKbdVnmFrSYwXVulrKzaVt
         9lbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xARzHUIRMEhCNf96AnGj29qMlJoEGNinUlqxQJUx2Qs=;
        b=Kg0Ahjrbe0bsd/a743PVSt8p77mSfD2g2VxRdbuYbf6tDjILD3y504Fa/LZcUoocPD
         Xr77WnkIFVvEo8fMzKVU7stI+0obVsIZWLJHHNm8S9DQcED3N40+qxNyzwkHYNYSq1Fc
         JOXaWLtqUgTGNEAEeifQ3Dm5/ojVAUSsiLogUeiutVgRi7VdcFkyxj4XiFmahhu1W0La
         CxB0fWyKjG8rZREAF39q88YjjZ9OqcQ8Wa2uzUkbhtZXELz9ykx08xEFZaqhRKnAB9D1
         sxU0lFoCX9HzBloZ7FB36UIS+arD5AaMnSL9CXzlFxrpyByXe60OjNvwqJChdSMqvNyi
         Vn9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qnspe40x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si777425jav.125.2021.05.18.07.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 07:53:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qnspe40x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj161-0004VZ-0I
	for alex.bennee@linaro.org; Tue, 18 May 2021 10:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj0zz-0004wG-Ll
 for qemu-arm@nongnu.org; Tue, 18 May 2021 10:47:07 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:33716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj0zx-00041y-T6
 for qemu-arm@nongnu.org; Tue, 18 May 2021 10:47:07 -0400
Received: by mail-ed1-x52c.google.com with SMTP id b17so11562481ede.0
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 07:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xARzHUIRMEhCNf96AnGj29qMlJoEGNinUlqxQJUx2Qs=;
 b=qnspe40xM/zI/uQp6iCeD/whvfic7pIZbseKy8vkAYZntvmfjMcnwOwBe0+OHDLgph
 Bpnu7Zdy3u6gW1+6I9F3gswPP9XMjXEWUI1mhjLVyvwFy6LpRfMXfhX/rYAMlhIsrbav
 Ti3AVHRYHuVs45a2NP7DPX1Kg6Qq3JzajnhScHK41zu8q9wTlNEHsDhMPIIyfOVSFi+n
 PF+Lcrojwq6i84+r5be0KfcMw2aZsu/Q2gJ9yQHHPFM2glEjAwfkW0E+K5SjGY3kAb4B
 8gfnOxtzCusWAJ8OO0QLlk0+AoSP6AXdCdsbvsYSCTuQmUe+BtmxmOL2spv5gannXMsu
 EOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xARzHUIRMEhCNf96AnGj29qMlJoEGNinUlqxQJUx2Qs=;
 b=q7AOYw963KjNVH7/bP2SVuRLv/jwJJWGqDCThlB2UJkeEFzN+dZ+K5fCzp2RXeNAa/
 dhFqwq472VZhzzrLcWIXhMCoXtLtGgr0sy83vl+nicUiZWe1Nd8bC1k/V+VPe2MaKpiO
 Azc4F1Ze9SssLGZx74Klp4j5fIorUjEmYfRSVSCrkjYcQI0ZDGSR+E6chl0VGLrT5vv5
 rypF+u+gk9kek+s7hW6zKZcGs31kDfarl8f7q+yNdZRsHC/JrJakN0XuRcgCTmUkizfH
 O5M0BXtKdS0ySxUX/8HmA1ol5s89JyV/r4PirMaucNH1aAfsAxGv8ED5qaUXGZTuF1WK
 DYBg==
X-Gm-Message-State: AOAM532CMCUDFHNmNcJ44ulJR0W2TRewuaSz/1dP8mUw/Di21MQMw1SU
 iyGx5vlXN+z6+C6UbdL8vdB/wuGQ6iB8fZA6hJPoww==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr7380990edd.251.1621349224321; 
 Tue, 18 May 2021 07:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-1-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 15:46:47 +0100
Message-ID: <CAFEAcA9wAnK11NNObOrqV8MMgf7h9=Q2nNarEe+GY0SNPPuneQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S7QeQALlS3Tq

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> This patchset implements qemu device model for enabling physical
> LPI support and ITS functionality in GIC as per GICv3 specification.
> Both flat table and 2 level tables are implemented.The ITS commands
> for adding/deleting ITS table entries,trigerring LPI interrupts are
> implemented.Translated LPI interrupt ids are processed by redistributor
> to determine priority and set pending state appropriately before
> forwarding the same to cpu interface.
> The ITS feature support has been added to sbsa-ref platform as well as
> virt platform,wherein the emulated functionality co-exists with kvm
> kernel functionality.
>
> Changes in v3:
>  - review comments addressed
>
> Shashi Mallela (8):
>   hw/intc: GICv3 ITS initial framework
>   hw/intc: GICv3 ITS register definitions added
>   hw/intc: GICv3 ITS command queue framework
>   hw/intc: GICv3 ITS Command processing
>   hw/intc: GICv3 ITS Feature enablement
>   hw/intc: GICv3 redistributor ITS processing
>   hw/arm/sbsa-ref: add ITS support in SBSA GIC
>   hw/arm/virt: add ITS support in virt GIC

Something in here breaks "make check":

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-from-laptop/qemu/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-aarch64 tests/qtest/bios-tables-test
--tap -k

Looking for expected file 'tests/data/acpi/virt/FACP'
Using expected file 'tests/data/acpi/virt/FACP'
Looking for expected file 'tests/data/acpi/virt/APIC'
Using expected file 'tests/data/acpi/virt/APIC'
Looking for expected file 'tests/data/acpi/virt/GTDT'
Using expected file 'tests/data/acpi/virt/GTDT'
Looking for expected file 'tests/data/acpi/virt/MCFG'
Using expected file 'tests/data/acpi/virt/MCFG'
Looking for expected file 'tests/data/acpi/virt/SPCR'
Using expected file 'tests/data/acpi/virt/SPCR'
Looking for expected file 'tests/data/acpi/virt/IORT'
**
ERROR:../../tests/qtest/bios-tables-test.c:385:load_expected_aml:
assertion failed: (exp_sdt.aml_file)
ERROR qtest-aarch64/bios-tables-test - Bail out!
ERROR:../../tests/qtest/bios-tables-test.c:385:load_expected_aml:
assertion failed: (exp_sdt.aml_file)

(and then it hangs)

-- PMM
