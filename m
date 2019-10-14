Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4393862wrm;
        Mon, 14 Oct 2019 05:49:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxWNmybflIoZNOkoXttdM0m6fqdz2cUGpvrggK3PQZ4e51zdC1ix0zzHfKKOFyRqDlibvau
X-Received: by 2002:a05:620a:1037:: with SMTP id a23mr29753594qkk.276.1571057374718;
        Mon, 14 Oct 2019 05:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571057374; cv=none;
        d=google.com; s=arc-20160816;
        b=P9R/qzPCHzbqcS6nOhn2lqzgWVvy6QpKw4jIfZcA2LdJPgFJvbXjertooGfMnIiEHE
         /bPuAs+aZYldSIviaxcMTt0x8KnIvErsMv9sMlPUtaM5rF0BTMyK+RJy1LI/A62Tf4US
         xnuEUg7X8jmdU8paUcYGP8KW+w8woy0ZRMUaY44RX9R8MtnbxPFY2kxQEXuzNVBuY+F7
         M2WdIIttaOKD7ryRinUIOn5NleZ7obRmWcGOL8DdypwsPkRBq1gcrC8qcySbupPOxttQ
         GO9VsuzmR7sH9l+LnRTtfrTiCuLPH/+URbjHF56zHA2uar7erT8N15RoTD4/2x0UDTAJ
         UmIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y0H2jt6cspPZVFJiMqrsCk68oTN2bKE6m9749hj/lyk=;
        b=03jkJfEea4Odbg43mPF2Eu8dEcVIkIRZhfQTBP2TV3dkxHJi2SZyf9Gu7kmv8IXTlw
         X41hNkHqarIukf8fO11KQpPKfuy3IrWLxwxpmM3ftGkdKsPCsgFt038rD4AizDWdMZyc
         FO2rC3rZ9teC/v75/qJ3XHmPTF5aQV9Z3yiZHLi7YqtX3YQEHjuuZm/2fkClnNeMCnZO
         Zlr95vFdyGo6BRvZbe9EDQ12mVnl20pQaobBhBu9ID8UaVOyf7Mtr4Bk5ZdBGXeOZoY7
         PkFn2jFxnImd5MmvcIg38OqOejYXVSpaZEHF0pUkaqYvJrcLJBBExC9UO7gcwXHoyAB/
         jDNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jDC9jctg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o23si17151148qto.30.2019.10.14.05.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 05:49:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jDC9jctg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iJzn4-0001CS-75
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 08:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60715)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iJzlr-0000nN-8x
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 08:48:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iJzlq-000643-3y
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 08:48:18 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35715)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iJzlp-00063N-S1
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 08:48:18 -0400
Received: by mail-oi1-x244.google.com with SMTP id x3so13633149oig.2
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 05:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y0H2jt6cspPZVFJiMqrsCk68oTN2bKE6m9749hj/lyk=;
 b=jDC9jctgIZnrQJkL1bclVxrjIJn0XZRlqFJIWDgF/p2l5rvQI9whTM3JLpGv9na8o4
 +AG8o1mtWyZEL8h4naPkzaGH4i1x9485FpBqORt9wFQphNcpNM0pEjFS+rBt+58WwC5q
 AJwHXqRySI4bfUbAVHjhYadWzoEfJ7+FFHTLWIArsXFCWF6/vJsdms/Hxl+Sms0S8Bcm
 MIHvCcKmzYgXZbtnyl8fmS5KB4MAiUhDnZ8wwJNvq3rOORLneIlFCv3YBSM2OHLX8p40
 sHfUw77oV3XABc8jBo8Hto0ozB72rpo5oVu3DoI5wdKWTafh941j7aGkuOP/hewTqT+C
 kEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y0H2jt6cspPZVFJiMqrsCk68oTN2bKE6m9749hj/lyk=;
 b=Dw8GUABIAis1hCjZ3V3/uWdcy8VWEVqWdFCtPEVRkC5nMGarOW+1xuN1QPMjc0zqz/
 p4kkFG5ZWVLH2WqoMAvTqMpnD4YVtZZ/v+CSveaJ4q+5MwgTBlf/GOT86P+BCX/QeLZb
 zOWdN/iEsK47nbcBsDn9V7TeKXninQQvxSyO8tjJ59APLzRm3eg8aN6slv90vUJfv+Nb
 n02W/MGf8k9BK3b/OzfNP7pldaYX2K1MsScM2nrYm7EYzKKltRyYLUZ+jXUd1Wm9xSq8
 hZyBhLEgtwE9IfuAIn5AL+L339N9Tb8b2LoVLzafTqaOBoPmc9TfNcpiF5gHDtdkhSKZ
 Q29A==
X-Gm-Message-State: APjAAAUVzOgdHO1GL1MOurFn/+iO5k6bOzUY5wWMtFtVra9WEtwltxRj
 qs+N/xxbImUBymEpkuica5TJzxioaHyy5R6MJTF52Q==
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr24747913oic.98.1571057297024; 
 Mon, 14 Oct 2019 05:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191003154640.22451-1-eric.auger@redhat.com>
In-Reply-To: <20191003154640.22451-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Oct 2019 13:48:05 +0100
Message-ID: <CAFEAcA8C0tPC7cYYCKvfO+tGoNHcfGEQ4ah+32c1cYWAZx+Zhg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] KVM/ARM: Fix >256 vcpus
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, Marc Zyngier <maz@kernel.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m6iiA0hPux0n

On Thu, 3 Oct 2019 at 16:46, Eric Auger <eric.auger@redhat.com> wrote:
>
> Since 4.18, KVM/ARM exposes a KVM_MAX_VCPUS equal to 512. However it was
> reported [1] that a VM with more than 256 vcpus cannot be launched. 5.4
> fixes the situation with 2 patches:
> - one upgrade of the KVM_IRQ_LINE API [2] supporting a vcpu id encoded
>   on 12 bits,
> - the reduction of KVM IO devices consumed by each GICv3 redistributor [3]
>
> This series uses the new KVM_IRQ_LINE API and also checks the associated
> capability (KVM_CAP_ARM_IRQ_LINE_LAYOUT_2) in machvirt.
>
> Without the series, as soon as the -smp arguments exceeds 256, QEMU exits
> with "kvm_set_irq: Invalid argument".


Applied to target-arm.next, thanks.

-- PMM
