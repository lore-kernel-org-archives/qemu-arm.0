Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23524316lff;
        Mon, 6 Jan 2020 07:52:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqweij24nou1wFIgDahoGeLLG/wrS4CMPpHx9zxz4OOT+JFx2snEuEdHtG2v4N+NwtZ0G2Yp
X-Received: by 2002:a17:906:d7b4:: with SMTP id pk20mr108264091ejb.71.1578325940668;
        Mon, 06 Jan 2020 07:52:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578325940; cv=none;
        d=google.com; s=arc-20160816;
        b=G+1voBcum/XJ3kilZDQVkR6UJzDJd/uBgupuN4FEjGhgrLLEVyn/Aw7UlTMo8II+FW
         ecjkJr4AXVJA7YH70BonFehUBHrg0CUKY0iwXglomdz7KXIo1XKOBqmnJbecKkKG83ud
         2yiW0sTlxkPlMnXlVnN6LPgYJnuiWtXoyVC8rncjR171qOUHn6cXRgbc6zkGpQytRNbU
         2PVT5LkUoVlhtJicg07QUiMmKKFmbYVauAnQ3UgMj+NZh2EzFPfr5zBv6Xqme9AEkcrg
         6j4PPWGegj0Zg9Kk8Xn/0p7cuYMyzfLbadYw5nlHeNhcr62QA6hoSUqqFlzjj8gABpoz
         sl8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jYJwQ2h8YBorrIaF1tFRh50Uxv68nRf2ixv9iY02j3Q=;
        b=tzJCdxzPdaPMXbmoLBg1UriVu1xMPmcowk5sSvTMhya1a+CdMxNsLe/Odzrpv2SIcJ
         JuOvTr/uHkws72a5Ai4yu+kvk4MRTXQvugZpCnF43+fGtrh0H+Z0Qee+3C6KRMnqhz2C
         RJvv2kW5yj9KEw5aCkg6MXAXPhqWQLyB3sx6cyEBYrdYP/xiLB1mIGVj+Jh+HdUkpoUj
         ZY8Ct+Sd1Qax/qEquR795pbS8rXX1ygQVUCphL+dJ1pzTJhP9eSDB8l8W3+fTJfzpbC4
         mHh4a9RTd+xZdA4auKNfxSlQc0CjgQkCOjiAUp+bGUOI+7OXhVoHhUiMsuxiOXldlBoe
         /jkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Guw1CG5E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15si43204661eds.144.2020.01.06.07.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 07:52:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Guw1CG5E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioUfz-0007IL-Hk
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 10:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ioUfr-0007HD-1J
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 10:52:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ioUfp-0004HL-Pf
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 10:52:10 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37470)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ioUfp-0004Fi-KR
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 10:52:09 -0500
Received: by mail-ot1-x341.google.com with SMTP id k14so72254097otn.4
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2020 07:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jYJwQ2h8YBorrIaF1tFRh50Uxv68nRf2ixv9iY02j3Q=;
 b=Guw1CG5Ef8DI3lhJrC9h8xJfXCpz85k/o9O01coOL3kqntMYbR7I/hqFL4h/0wxH9K
 hcQrB+yYmwZZqD/8dtq3rjFEsWaTEMMvTPKjquGB/cIlgKkHJ1wDm1e+80U3yif9JIjN
 BM23KaaIWTCbWUsG3LucS8GEiC3UbVFkjTmI7x0oXtEyCBCU2LCPWd4wfSh1UYIJMAN/
 1cVaM/xRZUgzAVkGzgKFq8MrrQ+7pkhHA7zKxsT8mqK8KJXyjCaPzYyNjTAiT/Kj0oI6
 wvaFU3jiCj415sHef/WdvdU9EwJfTGakPJn/18HcOQBn0bGuzklIi7WyhsKbFIJ7nm+Z
 2KMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jYJwQ2h8YBorrIaF1tFRh50Uxv68nRf2ixv9iY02j3Q=;
 b=rrb3i+fKew4rkNyoKa3X8pap+HVbdU6gwLzq3XvgpmMgadC21gixC8mhJjVJZCT71X
 SFDMJy6oolSpq3vcV1h9F6zf1oIzLyVrHgJC0BWnEJFruTCf3ytmdFNqg0JhrvjxdGBy
 5IMwUE6Blbilfq4kTytvuV77mwtE+mQmQxNzNHFCfcwjy6kjmDVxtrY7VlsBzfJuhpWt
 GeN2DAuYddBp/d1QbIMVbl+p5PgCOUjsOl507Xl9OYvpSx0YqdvKXKKVJvWoIaL5sMVT
 +OZsHmkGFE0JvIPCag2g/ZvAllrjiD5msws51+Jbmp1waEsdLV8yDE1YjDTo8EGhgqBR
 w3hw==
X-Gm-Message-State: APjAAAXW4Jd6Sc2tH07ddsPpqHC7b/o2TSelHSgPKkKygHDqWrh4h2hI
 3K2Jfp5dF4rdnYDeUlrDdue9W2HcdORuptjIeWSjBA==
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr117367409otd.91.1578325928753; 
 Mon, 06 Jan 2020 07:52:08 -0800 (PST)
MIME-Version: 1.0
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
 <20200105072504-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200105072504-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jan 2020 15:51:57 +0000
Message-ID: <CAFEAcA-sduqVO3rrG2V1VsysE2chgd0SnSySvEXFfue-aZN8dg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified by
 _HID
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Corey Minyard <cminyard@mvista.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UDEtbsQG+U6X

On Sun, 5 Jan 2020 at 12:34, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Dec 19, 2019 at 02:47:59PM +0800, Heyi Guo wrote:

> >  hw/arm/virt-acpi-build.c          |   8 --------
> >  tests/data/acpi/virt/DSDT         | Bin 18449 -> 18426 bytes
> >  tests/data/acpi/virt/DSDT.memhp   | Bin 19786 -> 19763 bytes
> >  tests/data/acpi/virt/DSDT.numamem | Bin 18449 -> 18426 bytes
> >  4 files changed, 8 deletions(-)

> Please do not include binary changes in acpi patches.
>
> See comment at the top of tests/bios-tables-test.c for documentation
> on how to update these.

If you want the patches not to include binary changes then
you will need to take these yourself through your own tree.
As the Arm subtree maintainer I am not going to follow a
specific process for acpi related patches that requires me
 to do anything other than "apply patches from email, test
them, send pull request". I also have no way to
identify whether any differences that I might see if I
disassembled the ACPI tables make sense, as that comment
suggests I should be doing. The differences in the tables need
to be checked by the people reviewing the patches, which will
not be me for anything ACPI related -- I just don't know
enough about the ACPI specs.

Patches should be self contained, including updating test
cases as required. The underlying problem here is that
the 'golden master' data for the acpi tests is a pile
of binary blobs rather than something that's human
readable and reviewable as part of a patch.

thanks
-- PMM
