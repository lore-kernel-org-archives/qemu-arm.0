Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp8677080lfc;
        Fri, 29 Nov 2019 01:14:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqyN9C+I5xN3O6oG6cNBAHBqWuJSMveG4IXhmoUMmx2hDkmJgsaTWx8rIoCDhrbPXAjWbRtg
X-Received: by 2002:a17:906:da04:: with SMTP id fi4mr40287162ejb.24.1575018876689;
        Fri, 29 Nov 2019 01:14:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575018876; cv=none;
        d=google.com; s=arc-20160816;
        b=YcCwnOGLU7j8ndM4oEFMVQ7G9b/2G73v6XaxaUtzYUrh0jZj/ccm8TxZwhD2KrMhah
         9JZh3mZERrR+gXJ9LqLKdMEQZWiQAKs77/FZ9jYy1h01bp3Vm5L+Ud9ofkvI2tEtFiYv
         VEXPO7lcOULx/wW2FCkTXsvAI0/ZzAXkNfzpp4Tj762yFi4ajti5FhickTHuD5PZOIb8
         C6i0VHCSn67Q05tiqwEM9QsEsa8romUM6Jm258gA4M4aig4eG59UONRMZe4UwuZKL4rk
         7JaTus9QgA46Pksq1jbVzQ1BgjSM/d7Gq3IJq/l623IUaaQIJU/85zOGagKZBJVPWUO0
         GgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=Bp9gaspLvU/mO035Ihq1cpxL/KjxYzr3ENlPjxRPucE=;
        b=tBpebAV4wXAe+8PAmhqNf0Q7KeD8JrIs5BVeBjUVyB7S/q7zqgb6J07rjdBxN35FkH
         io7jMl5t9ZrVgus8hP4Jly6jVAjk2J2J2OMGZYgHEQdDySNlNoWKqLpGd5a26drqAma4
         qM++2pnHXzb5foOKsZNPNBEjv38vHphC1ZC51jjndXZ064nWkoap9CKxEfPg2MmlPjz7
         aLA4H3U9r60nX6OrFGIy040dwG4eP5Jn4qBzT7nwM99zaa/gIkkHHWpivWNqZJpJfDd6
         ufwAbd8jH1RXP0FpYwzl4rC0wEzuLsswQaWpP3gtrNWNNazGyslDJyuEBXy8duIv8Vk8
         LUGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="NFTJsd/U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15si12936205ejj.68.2019.11.29.01.14.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 01:14:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="NFTJsd/U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iacMC-0007AA-59
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 04:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51484)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1iacLW-00076J-Rc
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 04:13:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1iacLT-0007NC-Ki
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 04:13:50 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41292)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1iacLJ-0006sm-QH; Fri, 29 Nov 2019 04:13:39 -0500
Received: by mail-wr1-x442.google.com with SMTP id b18so34182463wrj.8;
 Fri, 29 Nov 2019 01:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Bp9gaspLvU/mO035Ihq1cpxL/KjxYzr3ENlPjxRPucE=;
 b=NFTJsd/UQxD6zQ7MxLy3+MPARlkaGo33I7lcrkcJufZ5LzJWj4LWNy00tnHSaRTwc1
 mFUeDRzd1rfV285fCuqVeK/neWQrFEG2dujDF0kzsuQjFmc3f2XPRnapAxTKeKt74Zen
 DcJHgBH+gu8cqHDfIqZm+n/DSXuTHyhaalQc3u0CB0xZdlqd7t2ML3hwlmDaBD4Aw1xI
 T90sgcgfyZjTTMnHbhaPUZyhDZD9iSU/CVoZnQcARxfS45wKWxCtzpkqus3OZoIgxxT2
 I+q/7pc8Kp5W0in4/b/eIF5U1gsByQcX7dNjiGwPv2AFFhBPyJqC0RJiUfLSbiroyDYM
 nm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Bp9gaspLvU/mO035Ihq1cpxL/KjxYzr3ENlPjxRPucE=;
 b=WK1X9PHcBGApE3VTGIzJivWvtIM+UKP3sS8A64w/3MPYubbCOioDvVv11naGhxQ7i7
 ABs+yvrCPh89Sdklm+irwlDiwMypQkRrMyAkNRxlC3nDj+bkCwLFuE8I3PuTDds/cUz+
 K1kZXGPvStEEEXQal+jweEBDxSFHIME59VMybz4Y/pZd/NCgC6hzXmPcktaaiBky31n1
 86GC4GvDIU7KoY8cAFhw9c8KPHA3VBRis0GAPNrqWRtnjbCbkmeGCyGjaOBVimVQOHoG
 8oMme4yVZp0xPl828lWOaIpBvZ9pccpiCOUryS6Rejr6X+9mPt6xJtLPEnXFgGTaU0yq
 n97A==
X-Gm-Message-State: APjAAAXnLtJoyfVM2ztJO1+jeLDzpvEggPI8nn8Xeq01tJregMGR73ti
 YrQDvhHHC0Umo0rh19Q58a8=
X-Received: by 2002:a5d:5452:: with SMTP id w18mr3661719wrv.333.1575018810016; 
 Fri, 29 Nov 2019 01:13:30 -0800 (PST)
Received: from localhost (ec2-34-244-242-0.eu-west-1.compute.amazonaws.com.
 [34.244.242.0])
 by smtp.gmail.com with ESMTPSA id u22sm8108414wru.30.2019.11.29.01.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 01:13:29 -0800 (PST)
Date: Fri, 29 Nov 2019 10:13:32 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: bilalwasim676@gmail.com
Subject: Re: [PATCH v2] net/cadence_gem: Updating the GEM MAC IP to properly
 filter out multicast addresses.
Message-ID: <20191129091332.GA25295@toto>
References: <20191129085216.5108-1-bilalwasim676@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129085216.5108-1-bilalwasim676@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, bilal_wasim@mentor.com,
 qemu-devel@nongnu.org, alistair@alistair23.me
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PaA1FCuwvuC0

On Fri, Nov 29, 2019 at 01:52:16PM +0500, bilalwasim676@gmail.com wrote:
> From: bwasim <bilal_wasim@mentor.com>
> 
> The current code makes a bad assumption that the most-significant byte
> of the MAC address is used to determine if the address is multicast or
> unicast, but in reality only a single bit is used to determine this.
> This caused IPv6 to not work.. Fix is now in place and has been tested
> with ZCU102-A53 / IPv6 on a TAP interface. Works well..

Thanks Bilal,

Sorry, just one more thing I had missed, we need to update
gem_transmit_updatestats() aswell, in a similar way as we did with
gem_receive_updatestats().

Cheers,
Edgar


> 
> Signed-off-by: Bilal Wasim <bilal_wasim@mentor.com>
> ---
>  hw/net/cadence_gem.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index b8be73dc55..042188c1ba 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -34,6 +34,7 @@
>  #include "qemu/module.h"
>  #include "sysemu/dma.h"
>  #include "net/checksum.h"
> +#include "net/eth.h"
>  
>  #ifdef CADENCE_GEM_ERR_DEBUG
>  #define DB_PRINT(...) do { \
> @@ -601,7 +602,7 @@ static void gem_receive_updatestats(CadenceGEMState *s, const uint8_t *packet,
>      }
>  
>      /* Error-free Multicast Frames counter */
> -    if (packet[0] == 0x01) {
> +    if (is_multicast_ether_addr(packet)) {
>          s->regs[GEM_RXMULTICNT]++;
>      }
>  
> @@ -690,21 +691,25 @@ static int gem_mac_address_filter(CadenceGEMState *s, const uint8_t *packet)
>      }
>  
>      /* Accept packets -w- hash match? */
> -    if ((packet[0] == 0x01 && (s->regs[GEM_NWCFG] & GEM_NWCFG_MCAST_HASH)) ||
> -        (packet[0] != 0x01 && (s->regs[GEM_NWCFG] & GEM_NWCFG_UCAST_HASH))) {
> +    if ((is_multicast_ether_addr(packet)
> +        && (s->regs[GEM_NWCFG] & GEM_NWCFG_MCAST_HASH)) ||
> +        (is_unicast_ether_addr(packet)
> +        && (s->regs[GEM_NWCFG] & GEM_NWCFG_UCAST_HASH))) {
>          unsigned hash_index;
>  
>          hash_index = calc_mac_hash(packet);
>          if (hash_index < 32) {
>              if (s->regs[GEM_HASHLO] & (1<<hash_index)) {
> -                return packet[0] == 0x01 ? GEM_RX_MULTICAST_HASH_ACCEPT :
> -                                           GEM_RX_UNICAST_HASH_ACCEPT;
> +                return is_multicast_ether_addr(packet) ?
> +                       GEM_RX_MULTICAST_HASH_ACCEPT :
> +                       GEM_RX_UNICAST_HASH_ACCEPT;
>              }
>          } else {
>              hash_index -= 32;
>              if (s->regs[GEM_HASHHI] & (1<<hash_index)) {
> -                return packet[0] == 0x01 ? GEM_RX_MULTICAST_HASH_ACCEPT :
> -                                           GEM_RX_UNICAST_HASH_ACCEPT;
> +                return is_multicast_ether_addr(packet) ?
> +                       GEM_RX_MULTICAST_HASH_ACCEPT :
> +                       GEM_RX_UNICAST_HASH_ACCEPT;
>              }
>          }
>      }
> -- 
> 2.19.1.windows.1
> 
