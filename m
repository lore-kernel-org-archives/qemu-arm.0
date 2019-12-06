Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp822433lff;
        Fri, 6 Dec 2019 06:32:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqyYoesbUSBUPRZ/YoMzW1JY2Xf/gOujvBPqDWqODT2P/lxSLTrem9pCvXLV1lCJ8syM/91B
X-Received: by 2002:aca:4106:: with SMTP id o6mr12612228oia.173.1575642756562;
        Fri, 06 Dec 2019 06:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575642756; cv=none;
        d=google.com; s=arc-20160816;
        b=ac+A3cPe9tlwLeEPzrzBAZ4Mz/XKM6WwJmPVp1xg2VJzzuO0LUh25BKXizu2+ziQeK
         I/ZT61WVR5QHamdpY390CwiK+0Ib4/qDero/tyvQG/f6/4+22+mtyZOhAry0Pjt+wQEk
         qKJvbAkNDDraS7bVBvzZGN8KV9uFFWVs7GayohpRoEkw0APBtcze0hnlSPy06Dk3DpfU
         1LujyhMt5mC7/NC5+ZejS4wNc0d/dqGJa+WHqGxptrypEAtRRvphV1Q5tIn7Fo+Pc/4v
         3yogUpc2jgtkIsNQ45IqTc9xXXWDYSZqoC1puNnAY8CYiZSyd/jFiv9XFG0xPgIVAYlo
         Ddqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KhS4gG43qgtC91LEgSVI97VHTZLo7KkC/ba4BqbDDQA=;
        b=z3V03vXmBiQJGZJWOIGH5Zjd1FHRBHm4KLTGZ7cjXsNZTwNFsBrStCkbmpsol7LayD
         jU4UBAj/X2VwHB8o05dAPpCDemc2kAyHWkrNe9sB3dm+OUPr9mSNRTX0UooKoS4CvLGw
         qarIKqN38SEM3ZeJOxxMXol/ks96ydgpkESWkjH2wLoNQspffMrJKfcjsANduN0rN1Oo
         Oes7lWzkgb4y0sc1ttSvIO9Db7ICQvkYQjjDMV11Nk/E4MA6fWkgS0iNko45LbSy7kgV
         0tmlfEXo+agBuPQkR3ZnT1+J+EzbVUkm3jdZlHXi0P1dASsUzjw2gvSI8fgVB9APz0b2
         UgVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VOSYcnF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4si5021673oia.56.2019.12.06.06.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 06:32:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VOSYcnF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idEep-00023m-Db
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 09:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51331)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idEMs-0007wU-BE
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 09:14:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idEMm-0007Sm-BE
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 09:14:01 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39286)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idEMk-0007Kj-Tz
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 09:13:56 -0500
Received: by mail-ot1-x342.google.com with SMTP id 77so5888352oty.6
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2019 06:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KhS4gG43qgtC91LEgSVI97VHTZLo7KkC/ba4BqbDDQA=;
 b=VOSYcnF3rR0AwaPLcHqOYQhhO3CElLvh+Rawv3pFS0HhebTxFVXscRXeGD+3CxeQ5O
 huEE8S4lWuSZHvXiHhhZQMqE6E5Bqf+8RXUxPz0ORzaKk/u0V8sw8RVbQMMIyNAj0Mkt
 27U+/ugbKPZWsjq8RLxImQnin6CsFP3AD+pJA+pCaDXWpJyyRUBCQ8mvI349NvA3WyfF
 f6T++ZZlU4krHslZ20AJcYJ/gkpkakzn4oGd6EnQwnWSyteLe+Y9p+mtwenExiyzDU2+
 bYXGfGq6hoKBfgOpDfUWogzlItmfD+Etro2yOGn5nnc4Ub71Rvo4SY8X82mAfxIna/Uf
 6Ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KhS4gG43qgtC91LEgSVI97VHTZLo7KkC/ba4BqbDDQA=;
 b=Mf8sP1VRJW6LKWV7WUuLiHfPz1Y8LjPYRIdYmWKQQKPvbT8Bdjm0wvWOtFmuzWi9pg
 MnPuaDYmilkj3zMRfN9+MRsFJOxWzVmhsXHACT5WZjQlg1/UUr9sqZFkUQB11TqsdwKp
 v8dhxmGvycC7/colPS1JnJGEWK/XABeN1EAkytCAGGmwCd4bgtpdPI6mTlalYwMD97DY
 4+OIYiO97fg7E7BitupiLThty+xBivU5jKklpMLkWDS0oCEjFyV6Fki2ZD23e+TZbdoR
 Qk4PCpS+tWqsNttNqk512rGfZl0R41C/JCwwHlQLnGNOlLkd/VQKy5TCPRSjEqZEi84m
 1fuQ==
X-Gm-Message-State: APjAAAXwu9vwP423hHnj31XTwWabYPSZnZNHYdps/rGpsQHPKCdes+1W
 dOkjsamcyhBMn4MfNDCmg2dBNqkbjYh8n4fyHTz2eawP
X-Received: by 2002:a9d:6745:: with SMTP id w5mr10496157otm.221.1575640246856; 
 Fri, 06 Dec 2019 05:50:46 -0800 (PST)
MIME-Version: 1.0
References: <1552098649-28341-1-git-send-email-guoheyi@huawei.com>
 <20190312170859.73f0de9d@redhat.com>
 <ca5ccc80-663f-83e6-d9ce-4d5e3749988d@huawei.com>
In-Reply-To: <ca5ccc80-663f-83e6-d9ce-4d5e3749988d@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 13:50:35 +0000
Message-ID: <CAFEAcA_v3bh+1h8+ti_t5Kkp1M9zhEmtsqSQzcHhAobr_+JxMQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 0/2] arm/acpi: simplify aml code and
 enable SHPC
To: Guoheyi <guoheyi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kVMO6Q3Kdtsx

On Sat, 30 Nov 2019 at 03:47, Guoheyi <guoheyi@huawei.com> wrote:
>
> Hi Peter, Igor,
>
> I couldn't find these 2 patches in the latest tree. Could you help to
> merge them?

In future I recommend pinging unapplied patches with a shorter
delay than nine months :-)  In QEMU's process, unless somebody
has specifically said they've picked up the patch, it still
"belongs" to the submitter to chase if it hasn't been
applied. In this case I simply didn't see Igor's request
that I take it -- the chances of me actually reading any
particular list email even if it's cc'd to me are not good.

I tried applying them to target-arm.next but unfortunately
they break 'make check':

  TEST    check-qtest-aarch64: tests/bios-tables-test
acpi-test: Warning! DSDT binary file mismatch. Actual
[aml:/tmp/aml-4IELC0], Expected [aml:tests/data/acpi/virt/DSDT].
acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-AOELC0.dsl,
aml:/tmp/aml-4IELC0], Expected [asl:/tmp/asl-XL7KC0.dsl,
aml:tests/data/acpi/virt/DSDT].
**
ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/tests/bios-tables-test.c:477:test_acpi_asl:
assertion failed: (all_tables_match)
ERROR - Bail out!
ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/tests/bios-tables-test.c:477:test_acpi_asl:
assertion failed: (all_tables_match)
Aborted (core dumped)
/home/petmay01/linaro/qemu-from-laptop/qemu/tests/Makefile.include:918:
recipe for target 'check-qtest-aarch64' failed

Could you fix and resubmit, please?

thanks
-- PMM
