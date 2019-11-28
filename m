Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp7755653lfc;
        Thu, 28 Nov 2019 08:07:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqx21AdHdl3kNF8kwpn1BKi9ZKKUSm7LQTTQ5j2QdJJj8i6f+r8sKq7nPQwCKUh4Fd00V/Zb
X-Received: by 2002:a17:907:40f2:: with SMTP id no2mr56089453ejb.250.1574957227559;
        Thu, 28 Nov 2019 08:07:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574957227; cv=none;
        d=google.com; s=arc-20160816;
        b=xjdE28yhkPzBTq/CvZiS9q1v3+dcw5g0k+nYa0+xLrKnzQk68aDJ35EPXTYM3QgQaV
         fRCrcJWAeOTzcfCGhLF45go6oM1OnSq2vjLOIzvSDUr3h5wtFFdVt0XtvxZ4TlRXM3fm
         dXXIHv+l/0UjkkabqIbOf7OsCoZohaiitAQYeoAWhxXWEWnFXDpKjgu0fK74gXV3pZDI
         Mrgfc+J2mlOM92x5K83NUNRIpMr5KWWkL2GW3NNJzRZlJv0BL0rxJt8RYgj43ocS4l9X
         CUvkZESw2YQvgOhm8u6RVipOZpF2Jut5pRTxB5mbz1vnr1Bk9o98TwEucoWE2Dqh77jz
         ihVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=Y7tiOWVlvG7Jnayaw/q0kgaDd3wbD55XfSsPP8vIjsU=;
        b=aloMR7t/cmnvL5L3MSmHSnI45y0VHaiGxLcC2Jv5viPzCQHRXFiG+jOM8DxdFNIu7f
         JUroQCBNURcOJdzIswOLzvbLfAYaIg++E/qVjFfUxrItfhBgOQU0UKu4/r9CwQyrhWTH
         kw18XlU/l6j7/d6+NtYpWnRnmE8gaii349OySheudDyJ6Tu4p9ZzdCvN0icCh/nO1s/N
         +Zk0NUPyFMv4b8+s6Tw1h2VLRlMNncfTu/dE7KQcV8WCkS0ghdJvC+mDicXgS3gzHrMl
         fjWD3EgvzKE3m6nBfCfFaTX7AYO3ftjtld983wM6dWSrZsOlnnb5Hddyrn+DNjaqF/Hs
         Vwrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lLolmoXV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si940988edq.70.2019.11.28.08.07.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Nov 2019 08:07:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lLolmoXV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iaMJp-00012Z-Fp
	for alex.bennee@linaro.org; Thu, 28 Nov 2019 11:07:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1iaMDG-0006QT-JK
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:00:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1iaMD8-00075H-Ja
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:00:08 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36103)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1iaMD8-0006Nr-AS; Thu, 28 Nov 2019 11:00:06 -0500
Received: by mail-wm1-x344.google.com with SMTP id p17so6303227wma.1;
 Thu, 28 Nov 2019 07:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Y7tiOWVlvG7Jnayaw/q0kgaDd3wbD55XfSsPP8vIjsU=;
 b=lLolmoXVRWBvsZv4JPJB3hKimzg21/FxzvBoII74prCn4gLFwVF1O0IuCjYINiBo8o
 8oNbS+FooVt3pnMGksdTMcqZMJMLp6PvKcEwYoE+6eJ0yJ36wq/MeEHnfMVrvCm+ryQC
 wpalcTxgwDLcMDB6cgyE+hcVJKBc/Q4hk94WOd0u2MLVstFxiHH5Ly47mXsSZT7p98XE
 bZr8B2QVX0E8xLC8NhR9nikoYITjd4/4C5u/IQ3eYbpEawYK8zcRqpc92PXqRToZ2H0N
 ikz5KoZEq+FWkWupERYqyNN3KaGGC+5DEQ/Zqeq+wG27yo7/gE2z5hF7cwu0ln/RyYTk
 u5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y7tiOWVlvG7Jnayaw/q0kgaDd3wbD55XfSsPP8vIjsU=;
 b=at+vkuTGv38SutAYbh8h3bHuitxMKG9dlfZ/tJcIfep8l7ziFIuM7a/zLD3HWQeWlm
 K/T7f8DA3DqU/ijWHt8OqVicPqLqnAZF7sXWBuP8yWvKcvNsmfeCtxy2PohuZUZMYDvn
 1PLZLaI+EhkhMzdpczoBoktYUPxY8cHwEfCrp1rjc11H/7r3oNk8AIMx4EOpza9ImTWf
 t1sOVkJ++R2l11AZg1eCzazZAbycpJOQdR4YxdAOlFJjyZtR2484ThEYmudCfoCIUAWG
 Evz43gDS8GmbUAsaVdacJ3mD84drwGT/chxGEDIkGVh+PXC8crcESR5xDL2e/x1SDby5
 BcUw==
X-Gm-Message-State: APjAAAWC71OFUtCPEsAlBVsro/99AEhNpku1SpJAO/ITZLgswgQLr+E/
 DyaG0sGX1rpMBBHLZBsLH/I=
X-Received: by 2002:a05:600c:21d9:: with SMTP id
 x25mr10851060wmj.50.1574956795294; 
 Thu, 28 Nov 2019 07:59:55 -0800 (PST)
Received: from localhost (ec2-34-244-242-0.eu-west-1.compute.amazonaws.com.
 [34.244.242.0])
 by smtp.gmail.com with ESMTPSA id b17sm24331455wrp.49.2019.11.28.07.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 07:59:54 -0800 (PST)
Date: Thu, 28 Nov 2019 16:59:56 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: "Wasim, Bilal" <Bilal_Wasim@mentor.com>
Subject: Re: [PATCH] Updating the GEM MAC IP to properly filter out the
 multicast addresses
Message-ID: <20191128155956.GB29312@toto>
References: <2632212d4c8a40bead72ffdcf288e600@SVR-IES-MBX-03.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2632212d4c8a40bead72ffdcf288e600@SVR-IES-MBX-03.mgc.mentorg.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fmjKZB8xH9HA

On Thu, Nov 28, 2019 at 03:10:16PM +0000, Wasim, Bilal wrote:
> [PATCH] Updating the GEM MAC IP to properly filter out the multicast
> addresses. The current code makes a bad assumption that the most-significant
> byte of the MAC address is used to determine if the address is multicast or
> unicast, but in reality only a single bit is used to determine this. This
> caused IPv6 to not work.. Fix is now in place and has been tested with
> ZCU102-A53 / IPv6 on a TAP interface. Works well..

Hi Bilal,

The fix looks right to me but I have a few comments.

* Your patch seems a little wrongly formated.
[PATCH] goes into the Subject line for example and you're missing
path prefixes.

Do a git log -- hw/net/cadence_gem.c to see examples on how it should look.

* The patch will probably not pass checkpatch since you seem to have
long lines.

* We also need to update gem_receive_updatestats() to use the corrected macros.

More inline:

> 
> Signed-off-by: Bilal Wasim <bilal_wasim@mentor.com>
> ---
> hw/net/cadence_gem.c | 18 ++++++++++++------
> 1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index b8be73d..f8bcbb3 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -315,6 +315,12 @@
>  #define GEM_MODID_VALUE 0x00020118
> +/* IEEE has specified that the most significant bit of the most significant byte be used for
> + * distinguishing between Unicast and Multicast addresses.
> + * If its a 1, that means multicast, 0 means unicast.   */
> +#define IS_MULTICAST(address)           (((address[0] & 0x01) == 0x01) ? 1 : 0)



This can be simplified:
#define IS_MULTICAST(address) (address[0] & 1)

Actually, looking closer, we already have functions to do these checks in:
include/net/eth.h

static inline int is_multicast_ether_addr(const uint8_t *addr)
static inline int is_broadcast_ether_addr(const uint8_t *addr)
static inline int is_unicast_ether_addr(const uint8_t *addr)



> +#define IS_UNICAST(address)             (!IS_MULTICAST(address))
> +
> static inline uint64_t tx_desc_get_buffer(CadenceGEMState *s, uint32_t *desc)
> {
>      uint64_t ret = desc[0];
> @@ -690,21 +696,21 @@ static int gem_mac_address_filter(CadenceGEMState *s, const uint8_t *packet)
>      }
>      /* Accept packets -w- hash match? */
> -    if ((packet[0] == 0x01 && (s->regs[GEM_NWCFG] & GEM_NWCFG_MCAST_HASH)) ||
> -        (packet[0] != 0x01 && (s->regs[GEM_NWCFG] & GEM_NWCFG_UCAST_HASH))) {
> +    if ((IS_MULTICAST(packet) && (s->regs[GEM_NWCFG] & GEM_NWCFG_MCAST_HASH)) ||
> +        (IS_UNICAST(packet)   && (s->regs[GEM_NWCFG] & GEM_NWCFG_UCAST_HASH))) {
>          unsigned hash_index;
>          hash_index = calc_mac_hash(packet);
>          if (hash_index < 32) {
>              if (s->regs[GEM_HASHLO] & (1<<hash_index)) {
> -                return packet[0] == 0x01 ? GEM_RX_MULTICAST_HASH_ACCEPT :
> -                                           GEM_RX_UNICAST_HASH_ACCEPT;
> +                return IS_MULTICAST(packet) ? GEM_RX_MULTICAST_HASH_ACCEPT :
> +                                              GEM_RX_UNICAST_HASH_ACCEPT;
>              }
>          } else {
>              hash_index -= 32;
>              if (s->regs[GEM_HASHHI] & (1<<hash_index)) {
> -                return packet[0] == 0x01 ? GEM_RX_MULTICAST_HASH_ACCEPT :
> -                                           GEM_RX_UNICAST_HASH_ACCEPT;
> +                return IS_MULTICAST(packet) ? GEM_RX_MULTICAST_HASH_ACCEPT :
> +                                              GEM_RX_UNICAST_HASH_ACCEPT;
>              }
>          }
>      }
> --
> 2.9.3
> 
