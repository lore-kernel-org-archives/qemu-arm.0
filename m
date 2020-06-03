Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp240343lfc;
        Wed, 3 Jun 2020 00:08:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybsyiaZQYy9l9ylhr8Za3eFIn4YJ6OsUBU/0KjeqLjGYwnCVL+SrpJ0K+ZUtAf5Hirj2Vs
X-Received: by 2002:a25:ba13:: with SMTP id t19mr44733532ybg.8.1591168123549;
        Wed, 03 Jun 2020 00:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591168123; cv=none;
        d=google.com; s=arc-20160816;
        b=Zw+gKDZ869iB9NBxdb5hpBm68j3FPoqermNtZwDFJjnJ1ov7EUclAbKGzWzAFK43vv
         p45iJZUP+T0Z4kbgiGhj5onGIxWeH055P/igv/ua6BsFnHruzC9DxJ8+clQHPr72Jdzb
         NNxleYDXypipOnKLtu2XKgmUT9Z4V2+BCe7MIupYspMF1oHaW0th0MttuMqh9WWKvkov
         s3IFHpbRG9A8BgTJCOzOz6jkf3EiYJisdfRtf5sIfRKzg4E0laW+fzODNCnkuoyxBiCR
         1drvfoDL46M+9S9aGhBX53FwQImJJwT7eGC8zCwsAOuBNElFPy5sdfRt+zN+ofvknVwH
         n+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=wRBYsP3BvVEwOJQPWVUJQn5NSxkf2TVTnRZH9+ZYG4Q=;
        b=KNLVtKY3Dw7r94Hvpl6X/QGlFWH7HoNCtK+3UBt1Qot22/QZdgrkOc3VuP33R/4ynt
         D8HSYsm49INrwOp6xrPcGql7W9L0yUPP/Abj/CxQJTSwU5d9xQR6yh7TTxT1KXKgJVVD
         YLJpZ896NZAaFYsOoZuVlfBfRrTMMw8/w0IChEx5Y+b0zufLw2nI95JBaWJ2S5aFdVr0
         P3fHW16VIpHIohMW7x1/X3a3lKV70rwzDZsj4RiBxd68tL9q7yUbby/lmzUl2HB4ZYZH
         oZ9jSRq2DGzwqe3/t8/F89jhzQ1G5OsSsvjzKDVhy3WXInvdQH9Moolbm5tqSyVUftQv
         sw0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G5rauD7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r187si928381ybf.147.2020.06.03.00.08.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 00:08:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G5rauD7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgNVy-00024w-TJ
	for alex.bennee@linaro.org; Wed, 03 Jun 2020 03:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jgNVr-000209-JN
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 03:08:35 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25239
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jgNVq-0004oS-1O
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 03:08:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591168112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wRBYsP3BvVEwOJQPWVUJQn5NSxkf2TVTnRZH9+ZYG4Q=;
 b=G5rauD7nA6peV0peQ7MUHdar0DFdERo3nGCSjxCVUjRtTZrbeiVU0b0Nj3igWayrlO6UEo
 hYsE9JgVh0mmMLkidRBwnKnItCgcdzknE11XBFSCXkXuH+v19HlSGc45bruXIr+0G72bnd
 9Jy0xyF6lXM9W9mfaCTnSmhcC3zXqmw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-HnconQe0MKGFWPg6o0c-Ow-1; Wed, 03 Jun 2020 03:08:27 -0400
X-MC-Unique: HnconQe0MKGFWPg6o0c-Ow-1
Received: by mail-wr1-f71.google.com with SMTP id a4so714781wrp.5
 for <qemu-arm@nongnu.org>; Wed, 03 Jun 2020 00:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wRBYsP3BvVEwOJQPWVUJQn5NSxkf2TVTnRZH9+ZYG4Q=;
 b=rSxxL3SGLercUNN0innMpRtXk460uGwKveHE1+YHVJ2hG6DZfKQmVMedjlD5MZoUk3
 FmHQlDivwImzvjRh2azuHoV0o6nE7ZNKyPrlfxSa+C5RXgIYMB8J8NU91lmCWKRf3qWQ
 BdNTLgAUsLLQJm6HRAkPaUiC++LHRCfO0X5m5RKtBkdUj39KBxlt7JkhjoMWHU840GKS
 ASNa5mOZgKydjI6m8sIQz1sy4rtvB39wVR4/vgpKtATT5CLFjHHLKCvp22ThXagpjGkP
 35NEnphIcbxmkOSwsWRrBrnWTZ4IuEMjTVf1of073GIfh/Ph/XWJM/LXbTOkPLHLwWfx
 4KMw==
X-Gm-Message-State: AOAM531ulFDtIe14CKHzLvb6e6hLtjFNeqCGvwnkitte0glpWjL/PfIW
 KwLcOC5HOAdiuMPLjzJTvt/zmJSRQMoRvLU2GwoFa6ThmjED2TJjXf0jbSN9LRZ//5fcyMjX0br
 L2QuQyQwWk+fT
X-Received: by 2002:adf:91c2:: with SMTP id 60mr31765268wri.41.1591168106256; 
 Wed, 03 Jun 2020 00:08:26 -0700 (PDT)
X-Received: by 2002:adf:91c2:: with SMTP id 60mr31765232wri.41.1591168105924; 
 Wed, 03 Jun 2020 00:08:25 -0700 (PDT)
Received: from [192.168.1.43] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id t8sm1853647wro.56.2020.06.03.00.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 00:08:25 -0700 (PDT)
Subject: Re: [PATCH] ftgmac100: Implement variable descriptor size
To: Erik Smit <erik.lucas.smit@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <CA+MHfov0TVbwjy8g_cHVa6Y-bMowCbsGLdt8uUhmcns0v_eVLw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <902ebbb5-3e9d-6720-745f-8535a5cd25e8@redhat.com>
Date: Wed, 3 Jun 2020 09:08:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+MHfov0TVbwjy8g_cHVa6Y-bMowCbsGLdt8uUhmcns0v_eVLw@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:12:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-TUID: B41zE6WcPTgi

On 6/2/20 6:47 PM, Erik Smit wrote:
> The hardware supports variable descriptor sizes, configured with the DBLAC
> register.
> 
> Most drivers use the default 2*8, which is currently hardcoded in qemu, but
> the implementation of the driver in Supermicro BMC SMT_X11_158 uses 4*8.
> 
> --
> The implementation of the driver in Supermicro BMC SMT_X11_158 adds 4 extra
> 4-bytes entries:
> https://github.com/ya-mouse/openwrt-linux-aspeed/blob/master/drivers/net/ftgmac100_26.h#L387-L391
> 
> And sets DBLAC to 0x44f97:
> https://github.com/ya-mouse/openwrt-linux-aspeed/blob/master/drivers/net/ftgmac100_26.c#L449
> 
> There's not a lot of public documentation on this hardware, but the
> current linux driver shows the meaning of these registers:
> 
> https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/faraday/ftgmac100.c#L280-L281
> 
>         iowrite32(FTGMAC100_DBLAC_RXDES_SIZE(2) |   /* 2*8 bytes RX descs */
>                   FTGMAC100_DBLAC_TXDES_SIZE(2) |   /* 2*8 bytes TX descs */
> 
> Without this patch, networking in SMT_X11_158 does not pass data.

Does it really 'pass' *all* the data?

This patch seems incomplete...

IMO you should 1/ declare FTGMAC100Desc as:

typedef struct {
    uint32_t        des0;
    uint32_t        des1;
} FTGMAC100Desc;

2/ Replace the code using static '2' by dynamic use of
FTGMAC100_DBLAC_xXDES_SIZE(dblac):

  static int ftgmac100_read_bd(FTGMAC100Desc **bd, dma_addr_t addr)
  {
      unsigned bd_idx;

      if (dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd))) {
          qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to read descriptor
@ 0x%"
                        HWADDR_PRIx "\n", __func__, addr);
          return -1;
      }
      for (bd_idx = 0; bd_idx< FTGMAC100_DBLAC_RXDES_SIZE(s->dblac);
bd_idx++) {
          bd[bd_idx]->des0 = le32_to_cpu(bd[bd_idx]->des0);
          bd[bd_idx]->des1 = le32_to_cpu(bd[bd_idx]->des1);
      }

      return 0;
  }

Etc...

Maybe worth introduce the bd_to_cpu()/cpu_to_bd() helpers too
(respectively calling le32_to_cpu & cpu_to_le32).

> 
> Signed-off-by: Erik Smit <erik.lucas.smit@gmail.com
> <mailto:erik.lucas.smit@gmail.com>>
> ---
>  hw/net/ftgmac100.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 25ebee7ec2..1640b24b23 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -79,6 +79,19 @@
>  #define FTGMAC100_APTC_TXPOLL_CNT(x)        (((x) >> 8) & 0xf)
>  #define FTGMAC100_APTC_TXPOLL_TIME_SEL      (1 << 12)
> 
> +/*
> + * DMA burst length and arbitration control register
> + */
> +#define FTGMAC100_DBLAC_RXFIFO_LTHR(x)      (((x) >> 0) & 0x7)
> +#define FTGMAC100_DBLAC_RXFIFO_HTHR(x)      (((x) >> 3) & 0x7)
> +#define FTGMAC100_DBLAC_RX_THR_EN           (1 << 6)
> +#define FTGMAC100_DBLAC_RXBURST_SIZE(x)     (((x) >> 8) & 0x3)
> +#define FTGMAC100_DBLAC_TXBURST_SIZE(x)     (((x) >> 10) & 0x3)
> +#define FTGMAC100_DBLAC_RXDES_SIZE(x)       (((x) >> 12) & 0xf)
> +#define FTGMAC100_DBLAC_TXDES_SIZE(x)       (((x) >> 16) & 0xf)
> +#define FTGMAC100_DBLAC_IFG_CNT(x)          (((x) >> 20) & 0x7)
> +#define FTGMAC100_DBLAC_IFG_INC             (1 << 23)
> +
>  /*
>   * PHY control register
>   */
> @@ -553,7 +566,7 @@ static void ftgmac100_do_tx(FTGMAC100State *s,
> uint32_t tx_ring,
>          if (bd.des0 & s->txdes0_edotr) {
>              addr = tx_ring;
>          } else {
> -            addr += sizeof(FTGMAC100Desc);
> +            addr += (FTGMAC100_DBLAC_TXDES_SIZE(s->dblac)) * 8;

Extra parenthesis not needed.

After doing 1/ you can now replace '8' by sizeof(FTGMAC100Desc).

>          }
>      }
> 
> @@ -982,7 +995,7 @@ static ssize_t ftgmac100_receive(NetClientState *nc,
> const uint8_t *buf,
>          if (bd.des0 & s->rxdes0_edorr) {
>              addr = s->rx_ring;
>          } else {
> -            addr += sizeof(FTGMAC100Desc);
> +            addr += (FTGMAC100_DBLAC_RXDES_SIZE(s->dblac)) * 8;
>          }
>      }
>      s->rx_descriptor = addr;
> --
> 2.25.1

