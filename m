Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7399522wrv;
        Wed, 7 Aug 2019 22:21:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzrk0Gq4GPkXR0QIhjHKDkEzlJ9HCCHp0Zp0wHrhcCRsRI5xzkvaUL6WmQNW3CIk/x+ewwH
X-Received: by 2002:aed:2a86:: with SMTP id t6mr11409215qtd.391.1565241708176;
        Wed, 07 Aug 2019 22:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565241708; cv=none;
        d=google.com; s=arc-20160816;
        b=lPPvYjuL3SiihSSsxRt6r3PTcV05xfK72pBXMUtneGnbVf9iQ5etgJV/+q0YF8Crzj
         9vD/lpcBZKbaQ2eKD+xa2TUAKSdPX4tZFvweiQwRDYZDsH4QEucHiunHWiK/h9nOKnD4
         8K8Mc6nFm2La5NEiaThkcttjtgc2oyIqvvH+wLspSoR1rxb/eIfxGI1qwfEieUEFDwA2
         o8GBe8Pw+6V11e7Pv+3sXf5sTKKM+pxV3CWsRG1Z81kTKGR/QDUNRCbgKIKVBH0L/wFn
         RK3UlgfR7ss3gcJO0xG5/c3qhygL2idCwkS96bpenagdw/Pn3wX8Ye9t+z1ll29bf3sM
         Wo2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=sTDFPUDFP7hahK5sGbqaKrywZqQt9tr3raO6bZ+pFmI=;
        b=q1Q112AHFVVTialnP5hYUXEbYqwP0G9xbRPFpW6aHQxxSy31gkq31gEaSZLj13Qb0c
         yAUMY8HRpGTsoxaCykcQm4WRWljwf3iQwlptnquvWua7LTc0cUi/LMBrJIk2Yj2/jRm7
         yMi+jLho+Z0bzMfvIdMkW9HPk6QDllY1uQC3OkCb/s1iwbciA20RirGTiHXwwbeOKheG
         JfPZPCLEdzCkPSrMrZ1vrYpYuCewK7BF2hDzLZDFa+Io6Znkp0YRw1n46VeTJnR0VJtm
         0AQIl80HwZLc143EQqmh4hbphxaVmXtu7NjM4gx7Uz5q8q76NtwgZH7LN/CwXy+ZVXMr
         egUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si3131255qtf.264.2019.08.07.22.21.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 22:21:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvarz-0003wT-7y
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 01:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57614)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hvarm-0003vn-Di
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 01:21:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hvarl-0006rg-Eo
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 01:21:34 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35042)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hvarl-0006qY-8s
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 01:21:33 -0400
Received: by mail-wr1-f67.google.com with SMTP id k2so7692775wrq.2
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 22:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sTDFPUDFP7hahK5sGbqaKrywZqQt9tr3raO6bZ+pFmI=;
 b=GSORKrLz9nGdcQf4fe3yTf7wu3sEZd+LSTes8p/prE2y1pixOwso21rpoXlxzaTh1G
 JJnFaaAMeLS6gG2GvpPsOTuSWGJzCfIjNPJD6hsJvL+jEXYkapi9zGNGKVX1W1ZMk+eF
 xb3PvPLRE3j+k8WxzFtj89deNbrwgQO39cLKrC3u3+CDFZqrQViqv2WCG/9cEhlJ4bjY
 EhP+nn2wdE6Xu1kAvxdnx+uPlxGrlwHsQSRL0mXHTBDLf0yIqIFv3k1tuOv4zJ6kPzoi
 +9ijl7zTlRqd2ZZ9CNDyYYMRYm5e9utakdQH4M98HaP7+IK7OkhgHWVY2XUKhr4qCHQB
 Pl1A==
X-Gm-Message-State: APjAAAWVOt5ci4D6pFK2n7E4picBB7rlgDtn8v1/XplBxi36taugHvBG
 0DLE2Ve8As3gPEUGW+aUO+pV1ryuq+g=
X-Received: by 2002:adf:fe10:: with SMTP id n16mr14035141wrr.92.1565241691805; 
 Wed, 07 Aug 2019 22:21:31 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id j33sm215874921wre.42.2019.08.07.22.21.30
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 22:21:31 -0700 (PDT)
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <1565020374-23888-1-git-send-email-bmeng.cn@gmail.com>
 <1565239479-2130-1-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d0ca78ec-c5d4-bc80-6f2e-3e933013b5f4@redhat.com>
Date: Thu, 8 Aug 2019 07:21:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565239479-2130-1-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] hw: net: cadence_gem: Fix
 build errors in DB_PRINT()
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rotpF3DXIkNW

Hi,

On 8/8/19 6:44 AM, Bin Meng wrote:
> When CADENCE_GEM_ERR_DEBUG is turned on, there are several
> compilation errors in DB_PRINT(). Fix them.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v2:

Please don't reply to previous version, post as a new thread (it is
harder to notice your new versions in a emails threaded view).

> - use HWADDR_PRIx instead of TARGET_FMT_plx for consistency
> - use 'z' modifier to print sizeof(..)
> 
>  hw/net/cadence_gem.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index d412085..b6ff2c1 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -983,8 +983,9 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>              return -1;
>          }
>  
> -        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
> -                rx_desc_get_buffer(s->rx_desc[q]));
> +        DB_PRINT("copy %d bytes to 0x%" HWADDR_PRIx "\n",

rx_desc_get_buffer() returns a uint64_t, shouldn't you use a PRIx64
format here?

> +                 MIN(bytes_to_copy, rxbufsize),

Nitpick #1: since you are cleaning this file up, bytes_to_copy and
rxbufsize are both unsigned, so the first format should be %u instead of %d.

> +                 rx_desc_get_buffer(s, s->rx_desc[q]));
>  
>          /* Copy packet data to emulated DMA buffer */
>          address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
> @@ -1157,7 +1158,7 @@ static void gem_transmit(CadenceGEMState *s)
>              if (tx_desc_get_length(desc) > sizeof(tx_packet) -
>                                                 (p - tx_packet)) {
>                  DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space " \
> -                         "0x%x\n", (unsigned)packet_desc_addr,
> +                         "0x%zx\n", (unsigned)packet_desc_addr,

Nitpick #2: packet_desc_addr is of type hwaddr, so removing the cast the
1st format is HWADDR_PRIx, also removing the 2nd cast the 2nd format is
PRIx64.

Then the 3rd format is now correct.

>                           (unsigned)tx_desc_get_length(desc),
>                           sizeof(tx_packet) - (p - tx_packet));
>                  break;
> 
