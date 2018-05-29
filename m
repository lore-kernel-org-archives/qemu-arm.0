Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3572386wre;
        Tue, 29 May 2018 06:29:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJzt6c4ZlQpFacx04S24/+2t+sIqBuGIGn12eAk/XoT1eEsyDbh5sK+Ffdiu96U/vCRuNvR
X-Received: by 2002:a0c:b06d:: with SMTP id l42-v6mr15837267qvc.125.1527600598572;
        Tue, 29 May 2018 06:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527600598; cv=none;
        d=google.com; s=arc-20160816;
        b=0WiWKlFaw5mt5vKuSD7h7SH6SxII9ogx/+oHFqe9pR2r5QL0IatQ8V5aPSDlBy40Gb
         amsPf0NltsavoP/0O/+gFNkALscQH6mGs/NQy7U/Pawd1rbUpxmM6ZBU/ne7pU5NFs+U
         JFsbZN0Jqc5AouD4iQ/I9lPRoPL4Kw8EoxPR7oPBLETzaeUw2OKtQgiFvbvYQ1cSQsQm
         +3iP2anf75EaC9kP8Zw/b+FbhwNKt5VR2pHCFtNfk07aQPOvA/UFqXj8E2GG5RjVpNt+
         7AvbkS6Tysme2kNOulS3ynmFtOmlaaSjbg6pPNjKaRdr9t+R7D70oYSDRtU+7tYUyVDQ
         wdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=b5XktoyuuGgbU1BiGgGwYAPuU7lxmMJ+v8TvTt3jpaA=;
        b=fvAIIGcUdajfNlovinS2+uTx3x5lQyy9QnvRPil8dJIrmLNUC9D0wUXzUZ7h2wZkm3
         MrX7sSK77sGbSgxgH4GUZ+zDCXdF+BPkhCt6+HbW5Nku6dyXJh+YgTT1Yex/aZ9bfJea
         z+rlY2wuW/iKmEk5NIAsqBLxy7oAVZFAAQx6YciLG0GT0gQPEQPMakDReZX5GeAA/1bM
         +TfYrB8aWylXE9AUBsFdmdy/PmNz4fwWPZCqYYhKxyHyFXtLaYMlIyEJtHrUlH2rIuct
         tBq+1Uk6zQq+gFSsKpyxQrhLjTRpzDnG71QPIQYJ9NtVKxg1wJ0Jt9s8fi8YJ7vcs9qE
         f+Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=heTsQ1sK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b190-v6si2987213qke.2.2018.05.29.06.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 06:29:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=heTsQ1sK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNehK-0000vO-2o
	for alex.bennee@linaro.org; Tue, 29 May 2018 09:29:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNeh9-0000tR-9i
	for qemu-arm@nongnu.org; Tue, 29 May 2018 09:29:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNeh8-0003OV-5D
	for qemu-arm@nongnu.org; Tue, 29 May 2018 09:29:47 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:39537)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNeh3-0003IG-Fp; Tue, 29 May 2018 09:29:41 -0400
Received: by mail-qt0-x243.google.com with SMTP id f1-v6so18587854qtj.6;
	Tue, 29 May 2018 06:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=b5XktoyuuGgbU1BiGgGwYAPuU7lxmMJ+v8TvTt3jpaA=;
	b=heTsQ1sKMcC37m/ElFKeUNNddBmM87uFfQ/r5uDLZbPf/RydezlJ4w3ItdNRcgAa/W
	HVs5eqN4xazMgwd7G654Zk+NfEZnPxPsBuUXjNuLe4Cg0aD2XiuTSmZu1P1EWpKzqOpQ
	os9klX1bVR9jFH9H74fSdLiu0YAh8+eLVF3anPb0vlhJngOwPC742hkOXCq61DrxzEPg
	+wCKTM3brHUDO2vXq05OHsqiNZj03OU+yuFTtO2Ps2hMnRefle4iBsx+dlAQiY5BTpAZ
	t7uBoPp0Xba8CN7jiUqb4G1FEEmFhYZTaCqPwNVIlBDFMFBhoujpkqHyETv5YnuW4dYo
	sw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=b5XktoyuuGgbU1BiGgGwYAPuU7lxmMJ+v8TvTt3jpaA=;
	b=czBovzDLiZoac3xt1vRZD2VegK9eaP5nDh+K9KUMvuIBt+bSZoFTnjr+6BGHhm3CaB
	tTnXpHJfxeJaRMbxxpk/oNw7NocDC/3mfGBvTDIdZJaSly6mEyjqKN6vrhuqA0E/0ca4
	T/b5FL3SjIvqGP22yDQMd6gdCrME7H03Y1M0QkBohfy6H41zbBV1LrXhszeJ6yat+ybn
	j7JPNyiC3mCrVdgBKnT9Vb2OGX525eTp8mxeTg5/NRb/fT88uYBHfVXyi5ydElhxkuVB
	sjvV8N/6PuUf/Egtx5jyn4FkUwk0aMuzfEh9x14yJ5Tn8TzvbiEsw22iYItmV7yMyZZy
	QbRw==
X-Gm-Message-State: ALKqPwcE5c+aV4W++BDntjOnzblIxAUoICUTR8I/6qp10VX0q5mXsbfU
	kQE+4dRaGr8tlCap/BA3f0pGTGtF03U=
X-Received: by 2002:a0c:f8c9:: with SMTP id
	h9-v6mr16076520qvo.122.1527600580762; 
	Tue, 29 May 2018 06:29:40 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	k2-v6sm11732468qkl.95.2018.05.29.06.29.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 06:29:40 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
References: <20180529062838.20556-1-clg@kaod.org>
	<20180529062838.20556-2-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <1a35d77a-2a3f-9925-5064-eba22a802ade@amsat.org>
Date: Tue, 29 May 2018 10:29:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180529062838.20556-2-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH 1/6] ftgmac100: compute maximum frame size
 depending on the protocol
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0XHkW6bkOnm1

On 05/29/2018 03:28 AM, Cédric Le Goater wrote:
> The maximum frame size includes the CRC and depends if a VLAN tag is
> inserted or not. Adjust the frame size limit in the transmit handler
> using on the FTGMAC100State buffer size and in the receive handler use
> the packet protocol.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/net/ftgmac100.h |  7 ++++++-
>  hw/net/ftgmac100.c         | 23 ++++++++++++-----------
>  2 files changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/include/hw/net/ftgmac100.h b/include/hw/net/ftgmac100.h
> index d9bc589fbf72..94cfe0533297 100644
> --- a/include/hw/net/ftgmac100.h
> +++ b/include/hw/net/ftgmac100.h
> @@ -16,6 +16,11 @@
>  #include "hw/sysbus.h"
>  #include "net/net.h"
>  
> +/*
> + * Max frame size for the receiving buffer
> + */
> +#define FTGMAC100_MAX_FRAME_SIZE    9220
> +
>  typedef struct FTGMAC100State {
>      /*< private >*/
>      SysBusDevice parent_obj;
> @@ -26,7 +31,7 @@ typedef struct FTGMAC100State {
>      qemu_irq irq;
>      MemoryRegion iomem;
>  
> -    uint8_t *frame;
> +    uint8_t frame[FTGMAC100_MAX_FRAME_SIZE];
>  
>      uint32_t irq_state;
>      uint32_t isr;
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index a6d27a7b01df..7598d08c9cb9 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -207,16 +207,18 @@ typedef struct {
>  /*
>   * Max frame size for the receiving buffer
>   */
> -#define FTGMAC100_MAX_FRAME_SIZE    10240
> +#define FTGMAC100_MAX_FRAME_SIZE    9220

Sounds correct, (MAX(1518, 9216) + 4 /* vlan */ ).

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  
>  /* Limits depending on the type of the frame
>   *
>   *   9216 for Jumbo frames (+ 4 for VLAN)
>   *   1518 for other frames (+ 4 for VLAN)
>   */
> -static int ftgmac100_max_frame_size(FTGMAC100State *s)
> +static int ftgmac100_max_frame_size(FTGMAC100State *s, uint16_t proto)
>  {
> -    return (s->maccr & FTGMAC100_MACCR_JUMBO_LF ? 9216 : 1518) + 4;
> +    int max = (s->maccr & FTGMAC100_MACCR_JUMBO_LF ? 9216 : 1518);
> +
> +    return max + (proto == ETH_P_VLAN ? 4 : 0);
>  }
>  
>  static void ftgmac100_update_irq(FTGMAC100State *s)
> @@ -408,7 +410,6 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
>      uint8_t *ptr = s->frame;
>      uint32_t addr = tx_descriptor;
>      uint32_t flags = 0;
> -    int max_frame_size = ftgmac100_max_frame_size(s);
>  
>      while (1) {
>          FTGMAC100Desc bd;
> @@ -427,11 +428,12 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
>              flags = bd.des1;
>          }
>  
> -        len = bd.des0 & 0x3FFF;
> -        if (frame_size + len > max_frame_size) {
> +        len = FTGMAC100_TXDES0_TXBUF_SIZE(bd.des0);
> +        if (frame_size + len > sizeof(s->frame)) {
>              qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %d bytes\n",
>                            __func__, len);
> -            len = max_frame_size - frame_size;
> +            s->isr |= FTGMAC100_INT_XPKT_LOST;
> +            len =  sizeof(s->frame) - frame_size;
>          }
>  
>          if (dma_memory_read(&address_space_memory, bd.des3, ptr, len)) {
> @@ -788,7 +790,8 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
>      uint32_t buf_len;
>      size_t size = len;
>      uint32_t first = FTGMAC100_RXDES0_FRS;
> -    int max_frame_size = ftgmac100_max_frame_size(s);
> +    uint16_t proto = be16_to_cpu(PKT_GET_ETH_HDR(buf)->h_proto);
> +    int max_frame_size = ftgmac100_max_frame_size(s, proto);
>  
>      if ((s->maccr & (FTGMAC100_MACCR_RXDMA_EN | FTGMAC100_MACCR_RXMAC_EN))
>           != (FTGMAC100_MACCR_RXDMA_EN | FTGMAC100_MACCR_RXMAC_EN)) {
> @@ -814,9 +817,9 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
>  
>      /* Huge frames are truncated.  */
>      if (size > max_frame_size) {
> -        size = max_frame_size;
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %zd bytes\n",
>                        __func__, size);
> +        size = max_frame_size;
>          flags |= FTGMAC100_RXDES0_FTL;
>      }
>  
> @@ -934,8 +937,6 @@ static void ftgmac100_realize(DeviceState *dev, Error **errp)
>                            object_get_typename(OBJECT(dev)), DEVICE(dev)->id,
>                            s);
>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
> -
> -    s->frame = g_malloc(FTGMAC100_MAX_FRAME_SIZE);
>  }
>  
>  static const VMStateDescription vmstate_ftgmac100 = {
> 
