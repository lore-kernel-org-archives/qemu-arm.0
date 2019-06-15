Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp218246wrg;
        Fri, 14 Jun 2019 22:39:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKcd6VoI3TY5EECgYah7CuZTxyqzwF1c5tpGxMH8ZkHt9ePMszMYw6NOZAQq3qgOS98KW3
X-Received: by 2002:a0c:81f0:: with SMTP id 45mr11884519qve.13.1560577175475;
        Fri, 14 Jun 2019 22:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560577175; cv=none;
        d=google.com; s=arc-20160816;
        b=bltva3SLkEaN8ubuOWuL1TVrtk42RRea6L6HumPIInrJheRbetpmpF8tZyUXgFENmB
         y/CekaQoo/ATXm/znPFxRO780lwXkd/wliew4rL/CcOYyxFP/5R38f498s+9PRu4seIG
         dvj909R3RahTKDogtUyifotFmCDXZd19SnraoI5TUpBkgk74XYOac5BP1dw5ruxnI5Sw
         YoNcoVulOp0DKiBWNhXZONaHh1mZqXqTZcTN+UAUY9qDNzYo/zi2Dn7kb4sic1npsm0H
         QyOPBSsa7ywPIHeb+KuNJMCODrwhNGhfhF/GcEaVBVweuTDO/tbDD/OuHjF8V27UyrtC
         6XcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=EfnrBVu7HaiTAGRTcrTO+ehGnmBoe1i2SF2EEJPUd90=;
        b=bq6HKBYW8HfNi72wdEaVeSaBxMpiUHy7U4IP1luYdRlCJxMtLyeLkCfuKjqawIOGY9
         t0QG0oRL8Cx5b8OY5rLdayxALNA81yGDBk/PouFfu0bDcvrNeQoMfZGc825MIEJsmcE+
         jvl8e7rAnFKeRv2/sHUlM1PkyKMLS0BYXaBQLDFRvOxKDQnHkA4+n5ElYmMFr/1ICV6z
         ws1X68p3bsIlmwJftu+qOhtmZrWDBFJ4UicDXDzXYnYbgte201G/AlJqu9VIB0+K9ZQg
         tYkFvFU2HtkD8BCtdChGgBjqgNM/A8YHLGAXNkulwuS9obwJmGrFb/CaDk1seCGYJdZF
         gjUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si3274107qkf.16.2019.06.14.22.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 22:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hc1Pa-0005GZ-VA
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 01:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53693)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hc1On-0005GQ-L1
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 01:38:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hc1Oj-00073u-Lx
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 01:38:45 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38514)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hc1Og-000717-DN
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 01:38:38 -0400
Received: by mail-wm1-f67.google.com with SMTP id s15so4166829wmj.3
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2019 22:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EfnrBVu7HaiTAGRTcrTO+ehGnmBoe1i2SF2EEJPUd90=;
 b=HvM4+qWmWXIIg/fWlM0o/dIPZJBa4Zi9zuDRf2/cNXJsonMtg7YNDew9hdefmUEpHI
 GQLUPluOKByKGBwLc4Eh8AfBiZA8ympFmMhnRyGVaNIET+lvSGZWQt+JrFVIYFzsBsKd
 qo6+Qug9xz/cn0lS92jjg0vw50r/HzP+qa59hogIq+5VqLvpxnYf7yr6nHtpjkyjVE0n
 aPOXMaVeJxNjPYGvLOqkh9wkSjQkV1bzt5/2anKJR4wSonZsoS53W5LG1p2bTWmuzEdL
 MHYbm1xnEZ8slQbz6jNvUYxXqJHN5oodXHlOSUGK+G+6xXaw+zzTyH5hV0+gecKN4HZz
 ib6g==
X-Gm-Message-State: APjAAAXCUtBrBSNGeBpX1IhY3/w7XNqKncXUefkXO+BUIzI4kVpYLhaJ
 oN++IikaRulZBx6MWRLNnXBYSA==
X-Received: by 2002:a7b:c776:: with SMTP id x22mr10133024wmk.55.1560577116726; 
 Fri, 14 Jun 2019 22:38:36 -0700 (PDT)
Received: from [192.168.1.103] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id 139sm5809495wmb.19.2019.06.14.22.38.35
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 22:38:36 -0700 (PDT)
To: Ramon Fried <rfried.dev@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20190615051559.13767-1-rfried.dev@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d87ea542-7ecc-4fb1-ac1d-929825d23a8a@redhat.com>
Date: Sat, 15 Jun 2019 07:38:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190615051559.13767-1-rfried.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] net: cadence_gem: fix
 compilation error when debug is on
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 65x2RQaSvB4A

Hi Ramon,

On 6/15/19 7:15 AM, Ramon Fried wrote:
> defining CADENCE_GEM_ERR_DEBUG causes compilation
> errors, fix that.
> 
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
> v2: change %lx to HWADDR_PRIx and %lx to %zdx
> v3: change %zdx to %zx
> 
>  hw/net/cadence_gem.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 7f63411430..ecee22525c 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -982,8 +982,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>              return -1;
>          }
>  
> -        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
> -                rx_desc_get_buffer(s->rx_desc[q]));
> +        DB_PRINT("copy %d bytes to 0x%" HWADDR_PRIx "\n", MIN(bytes_to_copy, rxbufsize),
> +                rx_desc_get_buffer(s, s->rx_desc[q]));
>  
>          /* Copy packet data to emulated DMA buffer */
>          address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
> @@ -1156,7 +1156,7 @@ static void gem_transmit(CadenceGEMState *s)
>              if (tx_desc_get_length(desc) > sizeof(tx_packet) -
>                                                 (p - tx_packet)) {
>                  DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space " \
> -                         "0x%x\n", (unsigned)packet_desc_addr,
> +                         "0x%zx\n", (unsigned)packet_desc_addr,
>                           (unsigned)tx_desc_get_length(desc),
>                           sizeof(tx_packet) - (p - tx_packet));
>                  break;
> 

I still get an error when trying to build on 32bit host with
CADENCE_GEM_ERR_DEBUG enabled (pre-existing to your patch):

  CC      hw/net/cadence_gem.o
./hw/net/cadence_gem.c: In function 'gem_receive':
./hw/net/cadence_gem.c:973:14: error: format '%ld' expects argument of
type 'long int', but argument 4 has type 'size_t {aka unsigned int}'
[-Werror=format=]
     DB_PRINT("config bufsize: %d packet size: %ld\n", rxbufsize, size);
              ^
./hw/net/cadence_gem.c:38:24: note: in definition of macro 'DB_PRINT'
     fprintf(stderr, ## __VA_ARGS__); \
                        ^
cc1: all warnings being treated as errors
./rules.mak:69: recipe for target 'hw/net/cadence_gem.o' failed
make: *** [hw/net/cadence_gem.o] Error 1

However the 64bit host is indeed fixed, so I'm fine with your patch:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Regards,

Phil.
