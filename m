Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp838584lfq;
        Thu, 17 Sep 2020 12:02:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkgU7iUyEy//BlFXNrqHvQYObX//qKne1BOkuccWpdWGsjqKEHrcLwshFZNB2yrldxNnn5
X-Received: by 2002:a1c:40c6:: with SMTP id n189mr11419839wma.48.1600369330841;
        Thu, 17 Sep 2020 12:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600369330; cv=none;
        d=google.com; s=arc-20160816;
        b=sp73sFazXQj0hfOTdaLd8e4EMt/hQWZGpX09JNp2wSdphYUk2ceEGaQ0SFChmug+GH
         HmpCn/p8OCPTo3bffVOi7xaYioicS26QE3Jm+i1M5IxvXk7Jn3b0o8GTXEIM2/7FUenc
         Bwsw+FzMSWlwq61lXZRgo4ajhJr7mHFA5Ntacb8M5aLPfbmuz/UIVwoRgwmEXmgDaVZA
         5ACn+bGErXB46nw4bFAGEpqnlMtksWy2rHSCfevwYXuP5IM1vHaScfm2FTm7TewcbzwU
         z0RXDGIDM15z7I9pQsrBYATeN9YDXZW8YitJ+d5ylcr3ZUhma2ZK+Glki0gGoczYabpj
         rl+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject;
        bh=EIcpI0+oqgtaAa9HGW9/pRe+Y1Ofib5p3VLyesFs0RQ=;
        b=gwaDUw/B86cc9hNEsv1CkaEDQMHLbig8G/LxGa9wbzFsMa0XOpZ/ahFmB6hPjoOEI9
         uH9u66zaOu0Pdks2ojF4HtfySMk/6E65eXibkdMMIS9eQIztsmdGFD4DpFxn0HUaU/or
         UoviLyvB9FrsQp/9HwpRTG+a1v6QmmQoVvh8XIVzLmQlGyw/0KEDUdYM4bYpk5WQygH1
         02iQrbxjaavE12Km/EJQJ+6s4QVnxfX1FrwFnTkEf8ChzFpPUGHUvYcgjVX4C+u2O5f+
         AP1kWkMe526d2hF9sRHuHd0oO8WCa8WJHUqy3wFcz7vgIH1YrMELJtDMdKfZj//VPvFg
         oZog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 217.72.192.73 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [217.72.192.73])
        by mx.google.com with ESMTPS id x14si533285wrr.572.2020.09.17.12.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 12:02:10 -0700 (PDT)
Received-SPF: neutral (google.com: 217.72.192.73 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=217.72.192.73;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 217.72.192.73 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([82.252.129.222]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLR9p-1k0d6T3gRf-00IXZO; Thu, 17 Sep 2020 21:02:07 +0200
Subject: Re: [PATCH 0/6] misc: Some inclusive terminology changes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Joel Stanley <joel@jms.id.au>, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
References: <20200910070131.435543-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <58370210-1ff8-4ec2-553b-7693a9b85c99@vivier.eu>
Date: Thu, 17 Sep 2020 21:02:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910070131.435543-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vSkFfUIMLAFpwGxD4kzvP0Wh7o/G0mxbO0B+DlLdDBHKRvz3KBg
 by18GcAinCDBchxvJZiG2Ykd6g3Ry7XjzcakL2FonD/2CSA/TW4LJ38ZjUr7IaP/5/Mn8IZ
 EI8L+dPqGkqFzeT3VI1Zv1EpZaKk9lf8AAh6UqoJhg29yQTxnWJAzVdtXkIq/rENklDwAMc
 1PZk4LpgwNS6tcdOuSOpQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FcvYsasPsek=:Id4SEdzULicuCqz5IyrQQ8
 NtxUH6vo94AmBi9JFX4uIe7iIhe/fJIZbefhmkFd4Bua/9vg/jNovfMrQb6w9LZHJ/9gW/iBa
 jGotKQd3qfcjRWuJSXwBEeeWlu3nWIdjNQXYCK+c0U18arozUuJ1S/5rocl4dS8YHtMP67IzX
 ermVB7CQICuV9GO4Fp2jpUxtW7kMhijK1VNtVGnZ+z5M4LgcSSgY1miT465/BQAHcMG9v+5ZG
 LsLRf+flgrUhQ7Oc45J2RmgHCawa2MaUx/6wlt+jiLwMo1zLFwl7M97VklprmdgRbM0uMBJ2d
 bkA8JaZYwAoPtbplevsJxlGidPTVt2DI9YtVhOhpbYIrmpIixe7VndWRtWUaLMjKgOd+/IZHW
 F1bJH5g1mJiPiQjSYWFf6rujOPFcrb+E39xvtHhwvss+6g9W5uC3GXdZXKu9Vq8wyyfNzh4V9
 AU5MUdHrbFbkLcT/70QnbfleeB1M+6GRi79IiqieDIDA9+jj4Osn1hoDge7K6XCx4z5leQRVj
 2THQgU31KJzMn4v0TPPUyoGRjuCT9iEXe4jco9IWtEVingFO+KITkODzjft6cGdeph5E0LGk+
 IAcZuSgsdgwijpCR3r6sdichY1v0HUSOmm/g8NdeC3Tb1kOeUzIgNPpxIXAyF5She8bzUXgc6
 rGQSSaqn1i9gM5ijWraGSTboHf46Erj9Xc609/b7wzYb9NLytfD0wMbQ1V/6bHPzXYQzizHWY
 DPJpQ4qe7S7kJQq5+JdPJtyCCGUbGgqp66wTzHFNNQwzFNhl5svEvgPiLRDVQoaN6DgWr2Vx3
 aANS6T7EnDoUIce7bF51x+vEyAJQOBqyXCQYRjkncHdh0jVmzywoyE7cmpoU3NvBdOi1p3y
X-TUID: Ue8qA5rbhXvB

Le 10/09/2020 à 09:01, Philippe Mathieu-Daudé a écrit :
> We don't have (yet?) inclusive terminology guidelines,
> but the PCI hole memory is not "black", the DMA sources
> don't stream to "slaves", and there isn't really a TSX
> "black" list, we only check for broken fields.
> 
> As this terms can be considered offensive, and changing
> them is a no-brain operation, simply do it.
> 
> Philippe Mathieu-Daudé (6):
>   hw/ssi/aspeed_smc: Rename max_slaves as max_devices
>   hw/core/stream: Rename StreamSlave as StreamSink
>   hw/dma/xilinx_axidma: Rename StreamSlave as StreamSink
>   hw/net/xilinx_axienet: Rename StreamSlave as StreamSink
>   hw/pci-host/q35: Rename PCI 'black hole as '(memory) hole'
>   target/i386/kvm: Rename host_tsx_blacklisted() as host_tsx_broken()
> 
>  include/hw/pci-host/q35.h     |  4 +--
>  include/hw/ssi/aspeed_smc.h   |  2 +-
>  include/hw/ssi/xilinx_spips.h |  2 +-
>  include/hw/stream.h           | 46 +++++++++++++--------------
>  hw/core/stream.c              | 20 ++++++------
>  hw/dma/xilinx_axidma.c        | 58 +++++++++++++++++------------------
>  hw/net/xilinx_axienet.c       | 44 +++++++++++++-------------
>  hw/pci-host/q35.c             | 38 +++++++++++------------
>  hw/ssi/aspeed_smc.c           | 40 ++++++++++++------------
>  hw/ssi/xilinx_spips.c         |  2 +-
>  target/i386/kvm.c             |  4 +--
>  tests/qtest/q35-test.c        |  2 +-
>  12 files changed, 131 insertions(+), 131 deletions(-)
> 

Philippe,

Could you report your series: it doesn't apply cleanly on my branch.

Thanks,
Laurent
