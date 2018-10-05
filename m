Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp946899wrt;
        Fri, 5 Oct 2018 16:10:11 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61COQI/M+ocn//7s1LOqS3R6bfat7OkKa3c4mv9fEg+4ZR8zZbF5tnod9WEmOeVkRFwoxDP
X-Received: by 2002:ac8:3290:: with SMTP id z16-v6mr11400202qta.209.1538781011847;
        Fri, 05 Oct 2018 16:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538781011; cv=none;
        d=google.com; s=arc-20160816;
        b=FISOjhK5YvwefmbKHPHskNPc9wRHsoYKHPzSa1ZZXEPyCPdU1ERPg0KiAzJ8QBUAUh
         4r4Kqo5z4bfo5LFaDkgdkVZuVcHYdfowkOx6G7QFLl84QGZJbqdiCOEfH1+pSY4KtYlW
         dnHDfGNspTCKJGjSkBzslwzHSfmGlTMfTJ2XK7ombDu58DyzjNieLW7u4D6pHqr/ShDE
         TgPZxVfUkMbRkLEXtT/KTzgYomgzij9yMO7Sqw3fw/Xc6a8wmhunYBR2EUnigoqxehpp
         DyRPYmA3PpqyFxS24d418kZ2TJ6AH7AB33ohIjIZSf1PFRhvxM/bEP1rk8woxbWY7IKn
         S0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=KF47yDoaEAcrURl9g579bgKeUFBP1AKBzMabv2g09pg=;
        b=hAcffy+/p1my5vmmGw1+vxeaUVm7v7tj/gIasQP0xNp4wfsFTwCrvfyJWFHq2goksG
         +RZuISw+NRRr65/TW/MCiizlJluL3OixFXKDIMm2bRtX85MjPNgHraia2EIswl7y8kkY
         nKeWrzi7+c3fibe9u5jqZTVEAcgylHUZOrgyG2sao4c3Ih2SfKSuX/Vrzgfio0GqFGUG
         Yehvd2jt4fBtNd28unsdY9gikWb1jvRjcJA7rgGjfdoGhxo/XmEHzCohTRZ+/QMN5Jal
         TnY7m52pf17Q62xw835RCMZJ274x20NKJZojgZk338NHR3eEeJ1ratV7zsriGArhGdi2
         kBfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6-v6si6453083qtg.392.2018.10.05.16.10.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Oct 2018 16:10:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37222 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8ZEZ-0002Rh-CL
	for alex.bennee@linaro.org; Fri, 05 Oct 2018 19:10:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8ZEP-0002Qq-H9
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 19:10:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8ZEM-0006qU-7P
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 19:10:01 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33317)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g8ZEL-0006nw-Vg
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 19:09:58 -0400
Received: by mail-wr1-f66.google.com with SMTP id e4-v6so15066047wrs.0
	for <qemu-arm@nongnu.org>; Fri, 05 Oct 2018 16:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KF47yDoaEAcrURl9g579bgKeUFBP1AKBzMabv2g09pg=;
	b=eQ+TcygFKDx4hEnhvLmsl2ZJqkfgQjZXwzXSA9KSKxi2ZvXCa42VxU4JGB5VXWelv1
	M7aQe5lt6orRo0AeC/L7uigY04wlcMEubzbWqRpl2EEiB/QinoiHr27XoYS5u8BLimNj
	zDB0cZelIk51xO9VLKGzBbM0M3S1rXeMoLAI5Qrl2rYQuSwkA1FIM/hoxqmvFbtA5B+v
	SBdRUE4VP4qs46QbNZyY9QlrLn+mL5i/CkMkBFqdXbGwsr4klKoVgVFh7DpwVK32FmYq
	7Gwsz8wIt9dpGppwu5YbvHlxE9uZh/+aSELF++U8r5CzFT9sJGGqQ8tHfeTPIe3f1tsT
	i/bg==
X-Gm-Message-State: ABuFfoikm7Oo3eedgsnm26SchfiLWx4LvD5ncqaxvcxdwSgEYO3DfZR/
	BNyaxXjoziKa+FoWIxFEHa88qg==
X-Received: by 2002:adf:b519:: with SMTP id
	a25-v6mr9018292wrd.273.1538780996852; 
	Fri, 05 Oct 2018 16:09:56 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	w72-v6sm16499378wrc.52.2018.10.05.16.09.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 16:09:56 -0700 (PDT)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-4-git-send-email-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <71d17e21-7d49-989c-37c5-379e5dff966d@redhat.com>
Date: Sat, 6 Oct 2018 01:09:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1538579266-8389-4-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 03/12] net: cadence_gem: Use
 uint32_t for 32bit descriptor words
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tswkqGFNLVy8

On 03/10/2018 17:07, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Use uint32_t instead of unsigned to describe 32bit descriptor words.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/net/cadence_gem.c         | 42 +++++++++++++++++++++---------------------
>  include/hw/net/cadence_gem.h |  2 +-
>  2 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 901c173..31f3fe0 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -302,42 +302,42 @@
>  
>  #define GEM_MODID_VALUE 0x00020118
>  
> -static inline unsigned tx_desc_get_buffer(unsigned *desc)
> +static inline unsigned tx_desc_get_buffer(uint32_t *desc)
>  {
>      return desc[0];
>  }
>  
> -static inline unsigned tx_desc_get_used(unsigned *desc)
> +static inline unsigned tx_desc_get_used(uint32_t *desc)
>  {
>      return (desc[1] & DESC_1_USED) ? 1 : 0;
>  }
>  
> -static inline void tx_desc_set_used(unsigned *desc)
> +static inline void tx_desc_set_used(uint32_t *desc)
>  {
>      desc[1] |= DESC_1_USED;
>  }
>  
> -static inline unsigned tx_desc_get_wrap(unsigned *desc)
> +static inline unsigned tx_desc_get_wrap(uint32_t *desc)
>  {
>      return (desc[1] & DESC_1_TX_WRAP) ? 1 : 0;
>  }
>  
> -static inline unsigned tx_desc_get_last(unsigned *desc)
> +static inline unsigned tx_desc_get_last(uint32_t *desc)
>  {
>      return (desc[1] & DESC_1_TX_LAST) ? 1 : 0;
>  }
>  
> -static inline void tx_desc_set_last(unsigned *desc)
> +static inline void tx_desc_set_last(uint32_t *desc)
>  {
>      desc[1] |= DESC_1_TX_LAST;
>  }
>  
> -static inline unsigned tx_desc_get_length(unsigned *desc)
> +static inline unsigned tx_desc_get_length(uint32_t *desc)
>  {
>      return desc[1] & DESC_1_LENGTH;
>  }
>  
> -static inline void print_gem_tx_desc(unsigned *desc, uint8_t queue)
> +static inline void print_gem_tx_desc(uint32_t *desc, uint8_t queue)
>  {
>      DB_PRINT("TXDESC (queue %" PRId8 "):\n", queue);
>      DB_PRINT("bufaddr: 0x%08x\n", *desc);
> @@ -347,58 +347,58 @@ static inline void print_gem_tx_desc(unsigned *desc, uint8_t queue)
>      DB_PRINT("length:  %d\n", tx_desc_get_length(desc));
>  }
>  
> -static inline unsigned rx_desc_get_buffer(unsigned *desc)
> +static inline unsigned rx_desc_get_buffer(uint32_t *desc)
>  {
>      return desc[0] & ~0x3UL;
>  }
>  
> -static inline unsigned rx_desc_get_wrap(unsigned *desc)
> +static inline unsigned rx_desc_get_wrap(uint32_t *desc)
>  {
>      return desc[0] & DESC_0_RX_WRAP ? 1 : 0;
>  }
>  
> -static inline unsigned rx_desc_get_ownership(unsigned *desc)
> +static inline unsigned rx_desc_get_ownership(uint32_t *desc)
>  {
>      return desc[0] & DESC_0_RX_OWNERSHIP ? 1 : 0;
>  }
>  
> -static inline void rx_desc_set_ownership(unsigned *desc)
> +static inline void rx_desc_set_ownership(uint32_t *desc)
>  {
>      desc[0] |= DESC_0_RX_OWNERSHIP;
>  }
>  
> -static inline void rx_desc_set_sof(unsigned *desc)
> +static inline void rx_desc_set_sof(uint32_t *desc)
>  {
>      desc[1] |= DESC_1_RX_SOF;
>  }
>  
> -static inline void rx_desc_set_eof(unsigned *desc)
> +static inline void rx_desc_set_eof(uint32_t *desc)
>  {
>      desc[1] |= DESC_1_RX_EOF;
>  }
>  
> -static inline void rx_desc_set_length(unsigned *desc, unsigned len)
> +static inline void rx_desc_set_length(uint32_t *desc, unsigned len)
>  {
>      desc[1] &= ~DESC_1_LENGTH;
>      desc[1] |= len;
>  }
>  
> -static inline void rx_desc_set_broadcast(unsigned *desc)
> +static inline void rx_desc_set_broadcast(uint32_t *desc)
>  {
>      desc[1] |= R_DESC_1_RX_BROADCAST;
>  }
>  
> -static inline void rx_desc_set_unicast_hash(unsigned *desc)
> +static inline void rx_desc_set_unicast_hash(uint32_t *desc)
>  {
>      desc[1] |= R_DESC_1_RX_UNICAST_HASH;
>  }
>  
> -static inline void rx_desc_set_multicast_hash(unsigned *desc)
> +static inline void rx_desc_set_multicast_hash(uint32_t *desc)
>  {
>      desc[1] |= R_DESC_1_RX_MULTICAST_HASH;
>  }
>  
> -static inline void rx_desc_set_sar(unsigned *desc, int sar_idx)
> +static inline void rx_desc_set_sar(uint32_t *desc, int sar_idx)
>  {
>      desc[1] = deposit32(desc[1], R_DESC_1_RX_SAR_SHIFT, R_DESC_1_RX_SAR_LENGTH,
>                          sar_idx);
> @@ -1042,7 +1042,7 @@ static void gem_transmit_updatestats(CadenceGEMState *s, const uint8_t *packet,
>   */
>  static void gem_transmit(CadenceGEMState *s)
>  {
> -    unsigned    desc[2];
> +    uint32_t desc[2];
>      hwaddr packet_desc_addr;
>      uint8_t     tx_packet[2048];
>      uint8_t     *p;
> @@ -1108,7 +1108,7 @@ static void gem_transmit(CadenceGEMState *s)
>  
>              /* Last descriptor for this packet; hand the whole thing off */
>              if (tx_desc_get_last(desc)) {
> -                unsigned    desc_first[2];
> +                uint32_t desc_first[2];
>  
>                  /* Modify the 1st descriptor of this packet to be owned by
>                   * the processor.
> diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
> index 35de622..633d564 100644
> --- a/include/hw/net/cadence_gem.h
> +++ b/include/hw/net/cadence_gem.h
> @@ -74,7 +74,7 @@ typedef struct CadenceGEMState {
>  
>      uint8_t can_rx_state; /* Debug only */
>  
> -    unsigned rx_desc[MAX_PRIORITY_QUEUES][2];
> +    uint32_t rx_desc[MAX_PRIORITY_QUEUES][2];
>  
>      bool sar_active[4];
>  } CadenceGEMState;
> 
