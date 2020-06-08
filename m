Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp4809293lfc;
        Sun, 7 Jun 2020 23:36:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqtAhIRbSGWK2iuwP1nnPgiBh2Uy9mm1dIf5E43QqBo8+FIGxuDkqlk2pSYiCLVKb8YsjL
X-Received: by 2002:a25:cfd6:: with SMTP id f205mr34015582ybg.363.1591598218895;
        Sun, 07 Jun 2020 23:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591598218; cv=none;
        d=google.com; s=arc-20160816;
        b=m/N/spyJuN3zjpAyVhi6T/LXeek+TdMH2vlpvhiXSupn5vIdSPOorhR+wJzp3FydEB
         /VjQpL+f6568mqQHnwi3/1jqpD2M9/hUFyWxi4tVvvMRwgIRRo1KZRABkZofd8DJCGde
         4nVYmB5/pmcVNaK5Shn1UbE/usYi1EKRl7qjtBdK8xNTyikywwzc5mtgRM203SuZW3GL
         Jj2IPw6ZVBrPTRp8f9oJaSiRrqeBTtfAj6l8FhB1wO6YF3UT71VufdNeHyrXets9XHrL
         Uf+EOaL6KzXk993Li9ZoljrJ6oJuleQarw00k5zV/wmcWM9KbdluLb2cjoR+LI8ajEtq
         Gdfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=uLjFaQW7+iGK5CeYFCsB2VVUl88151HDpxTvvNiDSJE=;
        b=QxlzPFBAeQWB2sMw/b3GqnqnvslHpVbQjX0Dw/YIjc5yfz/7pWXR5XV5+hSvOMENxu
         ruQlXF23b7stlb5Kiv8qlWJRPBWIYLpRC1hFgeLHdaO4PlUsYO+fwOZmU5knObgl/ufT
         K3UtumZuqNbTGw34I17s5cVblk0M2rn+oPKTIlhB5og84ByVIy5qPw4t53PRwVmyIWpn
         GBXQicqcu87nMlSpt1oghnmnMIiYxZD4dmLfqyFmybDhZf+DEEd9iQgyNi35R1XA3KF8
         QhbkCBJCUZbD/5xt++TDp0xh4n8Yff8Xe4fAhJHTP3YhpZnChAMpuOhHBvjQAT0H6mnw
         CT6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r204si8932982ybc.324.2020.06.07.23.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Jun 2020 23:36:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiBP0-0005T5-7u
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 02:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jiBOV-0005SI-LV
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 02:36:27 -0400
Received: from 15.mo1.mail-out.ovh.net ([188.165.38.232]:45644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jiBOU-0007kX-KT
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 02:36:27 -0400
Received: from player792.ha.ovh.net (unknown [10.108.35.210])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id CA3541C618C
 for <qemu-arm@nongnu.org>; Mon,  8 Jun 2020 08:36:16 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 03BDB13295EF0;
 Mon,  8 Jun 2020 06:36:04 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00203d79891-3c8a-49e0-99b8-92ae81f1c957,B6B0473EF73D0859AD85419D5DB97E88249038E4)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2] Implement configurable descriptor size in ftgmac100
To: Erik Smit <erik.lucas.smit@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <CA+MHfovYq1UAQQ341MnyGas7ScskWyjR=QE0D-RS7+zxF2mtsw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <97e4c124-0b3c-18cd-a0f3-3b1a7c831ca6@kaod.org>
Date: Mon, 8 Jun 2020 08:36:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CA+MHfovYq1UAQQ341MnyGas7ScskWyjR=QE0D-RS7+zxF2mtsw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15879692286817962816
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudehtddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkefhtedufeffvedvleejgeeghedvgeeuieeufeejueeltddugeduhedvveelgfehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejledvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=188.165.38.232; envelope-from=clg@kaod.org;
 helo=15.mo1.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 02:36:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001, URIBL_SBL=1.623, URIBL_SBL_A=0.1 autolearn=_AUTOLEARN
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
X-TUID: ZApsWim196Dh

On 6/6/20 11:03 AM, Erik Smit wrote:
> The hardware supports configurable descriptor sizes, configured in the DBLAC
> register.
> 
> Most drivers use the default 4 word descriptor, which is currently hardcoded,
> but Aspeed SDK configures 8 words to store extra data.
> 
> ---
> The implementation of the driver in Supermicro BMC SMT_X11_158 adds 4 extra
> word entries:
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
>         iowrite32(FTGMAC100_DBLAC_RXDES_SIZE(2) |   /* 2*8 bytes RX descs */
>                   FTGMAC100_DBLAC_TXDES_SIZE(2) |   /* 2*8 bytes TX descs */
> 
> Without this patch, networking in SMT_X11_158 fails after the first packet.
> 
> changes since previous version:
> 
> - moved "* 8" into {R,T}XDES_SIZE macro
> - removed the RXFIFO and RX_THR_EN defines as they're AST2400-only and not used
> - test setting of DBLAC register for validness
> 
> Signed-off-by: Erik Smit <erik.lucas.smit@gmail.com>

We don't need the parenthesis around FTGMAC100_DBLAC_RXDES_SIZE(). Anyhow,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 

> ---
>  hw/net/ftgmac100.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 25ebee7ec2..83058497c4 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -79,6 +79,16 @@
>  #define FTGMAC100_APTC_TXPOLL_CNT(x)        (((x) >> 8) & 0xf)
>  #define FTGMAC100_APTC_TXPOLL_TIME_SEL      (1 << 12)
> 
> +/*
> + * DMA burst length and arbitration control register
> + */
> +#define FTGMAC100_DBLAC_RXBURST_SIZE(x)     (((x) >> 8) & 0x3)
> +#define FTGMAC100_DBLAC_TXBURST_SIZE(x)     (((x) >> 10) & 0x3)
> +#define FTGMAC100_DBLAC_RXDES_SIZE(x)       ((((x) >> 12) & 0xf) * 8)
> +#define FTGMAC100_DBLAC_TXDES_SIZE(x)       ((((x) >> 16) & 0xf) * 8)
> +#define FTGMAC100_DBLAC_IFG_CNT(x)          (((x) >> 20) & 0x7)
> +#define FTGMAC100_DBLAC_IFG_INC             (1 << 23)
> +
>  /*
>   * PHY control register
>   */
> @@ -553,7 +563,7 @@ static void ftgmac100_do_tx(FTGMAC100State *s,
> uint32_t tx_ring,
>          if (bd.des0 & s->txdes0_edotr) {
>              addr = tx_ring;
>          } else {
> -            addr += sizeof(FTGMAC100Desc);
> +            addr += (FTGMAC100_DBLAC_TXDES_SIZE(s->dblac));
>          }
>      }
> 
> @@ -800,6 +810,18 @@ static void ftgmac100_write(void *opaque, hwaddr addr,
>          s->phydata = value & 0xffff;
>          break;
>      case FTGMAC100_DBLAC: /* DMA Burst Length and Arbitration Control */
> +        if (FTGMAC100_DBLAC_TXDES_SIZE(s->dblac) < sizeof(FTGMAC100Desc)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: transmit descriptor too small : %d bytes\n",
> +                          __func__, FTGMAC100_DBLAC_TXDES_SIZE(s->dblac));
> +            break;
> +        }
> +        if (FTGMAC100_DBLAC_RXDES_SIZE(s->dblac) < sizeof(FTGMAC100Desc)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: receive descriptor too small : %d bytes\n",
> +                          __func__, FTGMAC100_DBLAC_RXDES_SIZE(s->dblac));
> +            break;
> +        }
>          s->dblac = value;
>          break;
>      case FTGMAC100_REVR:  /* Feature Register */
> @@ -982,7 +1004,7 @@ static ssize_t ftgmac100_receive(NetClientState
> *nc, const uint8_t *buf,
>          if (bd.des0 & s->rxdes0_edorr) {
>              addr = s->rx_ring;
>          } else {
> -            addr += sizeof(FTGMAC100Desc);
> +            addr += (FTGMAC100_DBLAC_RXDES_SIZE(s->dblac));
>          }
>      }
>      s->rx_descriptor = addr;
> --
> 2.25.1
> 

