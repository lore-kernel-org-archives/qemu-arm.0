Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1954589wrg;
        Thu, 20 Jun 2019 07:05:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxy7RzqRKUg9lmQzQodWpGg7CDk6XKr7CiBLIv+C7KIJwMiDBVYxg/BQhlfMrzmRfv2cZ8q
X-Received: by 2002:a17:906:3948:: with SMTP id g8mr80110881eje.168.1561039539259;
        Thu, 20 Jun 2019 07:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561039539; cv=none;
        d=google.com; s=arc-20160816;
        b=e2zan+ckKOMnepV0Y/nOfwzisWi3JUbb1GLnbJNXE1RMtiC3RAFtD8dRflHN9rW3DG
         Evf9TL7HeO/JGE74heVkf6k6wTe98HqwYl5NPl2EyxYBRwjqI0HJRkFwGG3YqbpF2BXB
         rLG47zMlXlZBVZJc8gpmtfyxiVKlYzha3znEZxjtdB6/0Hm31jiPFgwmJN7RPmIgykjA
         GiFHSHRtPkgacMGQ0VsWdEXAb6fGxCc9bhPMghJNOiuRBZVYQHvsAKeg9Rebw958SyCh
         /fkAF41pcnrCbeNuFXN851pKO6pauZ9dYsG1c0X7sdguhFcNtHW6Gy6zGQOkzQ68qQnc
         crJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=nhVe87aMDdw5myT9bafXi1N4z3PHZ8boKUSs+9mzcLo=;
        b=BZrJOdit2u4BCsGH+Jo5pGRBunXYx4yUMZvslUzK2QObZRRyzXIEwR0IXp1xBKOJ9J
         /SgTTNwXB0xEUfhwtVo5g3ecEZ6xkrrTcPv+5y6H7eHdnopNLERv7+dUdje4jpRV+/e0
         hkOpFhSdqHCvtsg4f5h2RR+oqQHh5HhorP77ihicVXPT8kr7eFplnLzk8DYFCbAwHNlN
         fBQmRnxBA1kKASOzdKYFaDZ/q4LOlEML+Mu+xLEbM6jqBifKx6tD4JFfi2VXehpmaxA5
         yePfvHx6t1Eipg8bEz7RC2QcBKs8Q1q9BsvPSzB97HC3gfovVBFLPKs/D3fDlUBAVelG
         Fn8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si12655624ejr.138.2019.06.20.07.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2019 07:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdxh4-0003su-8W
	for alex.bennee@linaro.org; Thu, 20 Jun 2019 10:05:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60561)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hdxgP-0002Xd-0T
 for qemu-arm@nongnu.org; Thu, 20 Jun 2019 10:05:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hdxXI-0008UB-Qe
 for qemu-arm@nongnu.org; Thu, 20 Jun 2019 09:57:21 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38514)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hdxXI-0008Tk-IF
 for qemu-arm@nongnu.org; Thu, 20 Jun 2019 09:55:32 -0400
Received: by mail-wm1-f68.google.com with SMTP id s15so3274912wmj.3
 for <qemu-arm@nongnu.org>; Thu, 20 Jun 2019 06:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nhVe87aMDdw5myT9bafXi1N4z3PHZ8boKUSs+9mzcLo=;
 b=K5S1EmG6D3+QdgBQA0UqXmK/KN3mj452gjLVIxOLxK76yijn6o33cc8QUZQwmSUtnx
 hQqHBVSYBXB8fB2/0QSoGt2Zn5HIMdxzcmaJDVm6P0qaNgRx7nmHlXMdIoYnOaApvaCD
 5HHA5wT4YFjsp1SYV6duxKBuHryUQL9v4ROtnEU7KWzOflk973asdB+5o5mNYhp4pI9G
 /+fdKRvutyHHuUH95jW/REi9yriCCMOhWOd2XRgUpce67hxERLdqx/WHFHuOIMbQc8M2
 x8A1ra7ReqOGIkjQL4wULsYxoih95ypJYYztXDuHBORUbDxjQk73YT9hWRUFfAhV9vxW
 ZUXQ==
X-Gm-Message-State: APjAAAXWa/4Xt1jK0Ld4dN4i0YdoZVHxfRvD8+OgYtzxMDTZBaofF95u
 hv3d9QafatKbQAxBNqrLmFxqgQ==
X-Received: by 2002:a1c:2284:: with SMTP id i126mr2883027wmi.145.1561038931530; 
 Thu, 20 Jun 2019 06:55:31 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id y6sm5597652wmd.16.2019.06.20.06.55.30
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 06:55:30 -0700 (PDT)
To: qemu-devel@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20190620122132.10075-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <af0ee25d-50fb-5985-d0fe-a2b7e9a7d8ba@redhat.com>
Date: Thu, 20 Jun 2019 15:55:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190620122132.10075-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [PATCH RESEND v5 0/3] fw_cfg: Add
 edk2_add_host_crypto_policy()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fdnJ3GCU9q3k

Cc'ing Igor (suggested by Laszlo, for his QOM experience on
UserCreatableClass).

On 6/20/19 2:21 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series add edk2_add_host_crypto_policy() and the Edk2Crypto object.
> 
> The Edk2Crypto object is used to hold configuration values specific
> to EDK2.
> 
> So far only the 'https' policy is supported.
> 
> A usercase example is the 'HTTPS Boof' feature of OVMF [*].
> 
> Usage example:
> 
> $ qemu-system-x86_64 \
>     --object edk2_crypto,id=https,\
>         ciphers=/etc/crypto-policies/back-ends/openssl.config,\
>         cacerts=/etc/pki/ca-trust/extracted/edk2/cacerts.bin
> 
> (On Fedora these files are provided by the ca-certificates and
> crypto-policies packages).
> 
> [*]: https://github.com/tianocore/edk2/blob/master/OvmfPkg/README
> 
> Since v4:
> - Addressed Laszlo comments (see patch#1 description)
> Since v3:
> - Addressed Markus' comments (do not care about heap)
> Since v2:
> - Split of
> Since v1:
> - Addressed Michael and Laszlo comments.
> 
> Please review,
> 
> Phil.
> 
> $ git backport-diff -u fw_cfg_edk2_crypto_policies-v3
> Key:
> [####] : number of functional differences between upstream/downstream patch
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
> 001/3:[0164] [FC] 'hw/firmware: Add Edk2Crypto and edk2_add_host_crypto_policy()'
> 002/3:[----] [--] 'hw/i386: Use edk2_add_host_crypto_policy()'
> 003/3:[----] [--] 'hw/arm/virt: Use edk2_add_host_crypto_policy()'
> 
> v4: https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg04300.html
> v3: https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg02965.html
> v2: https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg02522.html
> v1: https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01598.html
> 
> Philippe Mathieu-Daudé (3):
>   hw/firmware: Add Edk2Crypto and edk2_add_host_crypto_policy()
>   hw/i386: Use edk2_add_host_crypto_policy()
>   hw/arm/virt: Use edk2_add_host_crypto_policy()
> 
>  MAINTAINERS                             |   2 +
>  hw/Makefile.objs                        |   1 +
>  hw/arm/virt.c                           |   7 +
>  hw/firmware/Makefile.objs               |   1 +
>  hw/firmware/uefi_edk2_crypto_policies.c | 209 ++++++++++++++++++++++++
>  hw/i386/pc.c                            |   7 +
>  include/hw/firmware/uefi_edk2.h         |  30 ++++
>  7 files changed, 257 insertions(+)
>  create mode 100644 hw/firmware/Makefile.objs
>  create mode 100644 hw/firmware/uefi_edk2_crypto_policies.c
>  create mode 100644 include/hw/firmware/uefi_edk2.h
> 
