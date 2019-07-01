Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2720330wru;
        Mon, 1 Jul 2019 07:36:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKhqsrnVOgKZ8oiIIjZC1Geug0kS/Z9uw+e1woP7bROENAmURBMGqG+ZAKz2Swg/jlfp5z
X-Received: by 2002:a05:6402:8c3:: with SMTP id d3mr21272254edz.183.1561991762299;
        Mon, 01 Jul 2019 07:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561991762; cv=none;
        d=google.com; s=arc-20160816;
        b=oQfi4Ha5DbDUtOWB7IpHvxfX4uhWi+hsbRWBwnXIH2bkquNvXeDOYqwRu0QaO6RrMA
         cQfAQF1cCytxGT67XpfzcJvpcPbt1oNc8k4lEPuL/pyfndc/lDCcLotCnzDeN0N+ovtH
         cCAlNJICJ3bysJjaSnImLOwYOjeHs7sjuUrsDnKvUKq1KR11/kHZN0tZLKsEV/JfB2QR
         59ksVsN9xuD8QrMEgXQOdU7uh7jqJOVbiDB+WRr7NjQwrt4xWhTdD+3I8yvwwoZjc2uK
         YHHPA+Xl+d8hWuvpGNhQn2py3r4EiNZBoMaqm5mwkw67+VqJ9jHq0SlD2eiuHQkKYV98
         bsVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JFZ6A9/Tq76ek+zANoM+rQdepd9TjEaPsh9J0af/75E=;
        b=ubqXSRFYECrEm4QkbyZMpxzaeksiM64waN+XjXBRzHJwL0/M2O4ggysOfvDD+rjeM5
         ilUZfkmQiMtobxnsbz+MbouDP9Q5StoGHB0IAVe2GAmOD3xP1vL3mtOgmkJdnZiSpeN+
         P8ed2fP3mrh2Hb6w7AtG70SDWsUFap2zeUY4AFVb8eNpl/Mz8v3lxSysFw7ftHDU3Vi/
         oGmDV2cAvZglqMkohbDw0FJe97PR4CVXKjGy8gROG+PXaqjotm2JsyWYEAvSQOlrytWR
         84eGbgPeSYPVpdd/PKWdXUXctz4ZoxytOvpOTMmcJFhu0TO1ycsdDfH0i2iCDNlWSHTR
         93fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GZ55qWJs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5si7200303ejb.211.2019.07.01.07.36.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 07:36:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GZ55qWJs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhxPV-0004t5-CN
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 10:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46983)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhwjb-0002MF-Sd
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:52:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhwja-0002vt-Pk
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:52:43 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41999)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhwja-0002vD-Hy
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:52:42 -0400
Received: by mail-oi1-x243.google.com with SMTP id s184so9994242oie.9
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 06:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JFZ6A9/Tq76ek+zANoM+rQdepd9TjEaPsh9J0af/75E=;
 b=GZ55qWJsqoxbOFEgWG6NDxXqA6nNS68JmcxyPZH8SKhehT3VL72uFg+hTRxcEylGXz
 o2IRsQEO71sUxYxBP/L8LjUOlDFRNoB15DZxbPGklVmQcOzkSwFl7QPZh6DjxWqhw7Pu
 y24RriH3HNbxNmU7QghISWoz8pTC+EeFjw9in+ez/JvJ967zK3MNIeVAhOW6K5ooaBF8
 EtK9wg0e8J6pnLduf1E0bGTJvFVP9vVWbzB1goPS6LjnsqHkDxRcH1LoHrwMcqbhbU/4
 R/fI4iwHKdCGEZ8B+80paCq5jSlGmzhKE3GePKnte5RqTWTP5IN8AGlcm7OT47yjp2YN
 8kpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JFZ6A9/Tq76ek+zANoM+rQdepd9TjEaPsh9J0af/75E=;
 b=bAGepvr9ON25luoSId6m94TamkfupWjTPyhoqulCtz4RxtLDDg/YySN2SLb5J2LURq
 oOTZ54FQHooqR3sT530UpH4aspEX6vD9arIOqaSYnVCetoTSp6oMpojyLr69cnjHdAjU
 a5Pg3chWVOd5oe010uO4K27+IAymQPIstgLP8OC7TFmQXMB2SRKKZ9dkt+u2mvIBQeZ1
 TYUEBOO6SOfuaNEzQqsz7K7rJNrZZX6DxZWpLJ8SGkSpi96tVE8exIMT7h+tZUrQiynV
 eyQVPJHLGmkboWhleBBrgY9xhdfBZZhOfMnGys47bk7FKQ+a17uRM4vAVgVkAeHXdmnI
 bXHw==
X-Gm-Message-State: APjAAAU1CSsBD82yDfFZvDsYrusp6PdfmkOTSRs6d/OtOouG7rV71rL3
 sr8BfW0ke/aLJxeJK/sdCldRTagt97kirbg54q1bCw==
X-Received: by 2002:a05:6808:8c2:: with SMTP id
 k2mr6609602oij.98.1561989161521; 
 Mon, 01 Jul 2019 06:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
In-Reply-To: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 14:52:30 +0100
Message-ID: <CAFEAcA-w1AijFogZxX_9gz2+oDGH-=e2QAOdyCRdji_6k87d-A@mail.gmail.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v6 0/8] ARM virt: ACPI memory hotplug
 support
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
Cc: Samuel Ortiz <sameo@linux.intel.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 Linuxarm <linuxarm@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 sebastien.boeuf@intel.com, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U11jaKeSN470

On Tue, 25 Jun 2019 at 13:15, Shameer Kolothum
<shameerali.kolothum.thodi@huawei.com> wrote:
>
> This series is an attempt to provide device memory hotplug support
> on ARM virt platform. This is based on Eric's recent works here[1]
> and carries some of the pc-dimm related patches dropped from his
> series.
>
> The kernel support for arm64 memory hot add was added recently by
> Robin and hence the guest kernel should be => 5.0-rc1.
>
> NVDIM support is not included currently as we still have an unresolved
> issue while hot adding NVDIMM[2]. However NVDIMM cold plug patches
> can be included, but not done for now, for keeping it simple.
>
> This makes use of GED device to sent hotplug ACPI events to the
> Guest. GED code is based on Nemu. Thanks to the efforts of Samuel and
> Sebastien to add the hardware-reduced support to Nemu using GED
> device[3]. (Please shout if I got the author/signed-off wrong for
> those patches or missed any names).
>
> This is sanity tested on a HiSilicon ARM64 platform and appreciate
> any further testing.

Hi; this seems to fail 'make check' (on an x86 host):

acpi-test: Warning! DSDT binary file mismatch. Actual
[aml:/tmp/aml-01P83Z], Expected [aml:tests/data/acpi/virt/DSDT].
acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-4ZP83Z.dsl,
aml:/tmp/aml-01P83Z], Expected [asl:/tmp/asl-H7UE4Z.dsl,
aml:tests/data/acpi/virt/DSDT].
**
ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/tests/bios-tables-test.c:434:test_acpi_asl:
assertion failed: (all_tables_match)
ERROR - Bail out!
ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/tests/bios-tables-test.c:434:test_acpi_asl:
assertion failed: (all_tables_match)
Aborted (core dumped)
/home/petmay01/linaro/qemu-from-laptop/qemu/tests/Makefile.include:894:
recipe for target 'check-qtest-aarch64' failed

Is there a need to update the reference DSDT used by the test?

thanks
-- PMM
