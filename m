Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp918261lfb;
        Wed, 6 May 2020 04:53:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypJvAiAcWsaujVLH6mYQsdZv75eoYZxAkKi5v3/ckAu/Re46eUoeJfXq+O9GqvO8QUcbmq8/
X-Received: by 2002:a05:620a:1101:: with SMTP id o1mr7884459qkk.387.1588766026231;
        Wed, 06 May 2020 04:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588766026; cv=none;
        d=google.com; s=arc-20160816;
        b=FM1sIp2VwsOjgClFw3XzaOOHrvsJdaj2aVeYH2MmAzof/tlC59Vthz8YV4xlEqPBdL
         nkX8YghkJH7xJBWGURR8OLZoBd29R7wy2heTfvfGbAK6gI5TKVzqGwOf4x8PT8mEzOnF
         iPreXPKEyldbRH8gPzmi2JYH37x6lWhWMU5wDPi4UMOsQKTb9Kuj2eXdzw8BUstpGEJg
         3roV3xhDtxofRY8yv1OfjrtfjOJDZFGgZkM87uBlaGJTt+WYwCO3UqV8fXcp1w4RmlIW
         5DoZe0+31An8kHdU5Hr5T8Vsk4zL1ppwkd+N8vSM1FWEm0Si7Kc0QqSYepeBdSvk26Ar
         UWFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6nDHGv+x5MzSN6e9HqFTFoJna3eWFNJxWNsVHYYVHFU=;
        b=0YqBx+wXP70JCIBtRlgQExBk7M1PtTXU81h+qAZa7wkcDX6EnGt+PvEq4SklTFizuz
         Y6qHKq4pCfC3yAP+9B4NHhnZuw4uuvJeIhjHw1XGIbZsqx3c7t7gcgONl0L7lfIFIHdP
         lSxf48DFGnKF0Z9uBxhuN/eTQIjBBYyXgCJN40TzQQFS9CZ9wl7tpZXGNn+kYb6Yvxfv
         +QH7P1Xz4/mN5Nan3CvUejYN4G0oStfYMFdgWK5Z6UBS552LaBvh+RbKufXY/ruehK+Z
         JqxLa7bpXsjO3jsVi8LdgBG52+Fd/1asKCQk9mbrmU+dzkRqv8Do2SQUC6xl6RTKr2xQ
         vgQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HUrFj1Rw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id p55si778218qtk.60.2020.05.06.04.53.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 May 2020 04:53:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HUrFj1Rw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWIcT-0001h0-JS
	for alex.bennee@linaro.org; Wed, 06 May 2020 07:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jWIcM-0001go-MV; Wed, 06 May 2020 07:53:38 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:33629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jWIcL-0000K1-LE; Wed, 06 May 2020 07:53:38 -0400
Received: by mail-wm1-x341.google.com with SMTP id v8so4780993wma.0;
 Wed, 06 May 2020 04:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6nDHGv+x5MzSN6e9HqFTFoJna3eWFNJxWNsVHYYVHFU=;
 b=HUrFj1RwdtBYDSZipP9vM/t+HJUNqFhCVPyyGhjV/1Eq0XimbJaqSVbBhVfZt4KsdK
 BU7ao9UrTFbyHN5sGYJkPMW959ehMQmji/xkkHZInCMEWNcsJEb1ZHVoRRYjOz3VWOdw
 GVurB2j2WblgF33TTlCuD+pnVIz/tXy3opZFftpkq5cIeg70NHDl+zsqfCkH6V9hG8jM
 iSWfDDggF4KOhG2FK2DGYQXtP6euEFWkih2i1EfvwELFY/C0aE1Q862k88Tu7qHupgrn
 kh7xqSwDcQUZ3FdYca/D2aUM9P6dwf0pc62jZaCBsxyoaShBzVwQ/lroC4VynvEJ9m+M
 USuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6nDHGv+x5MzSN6e9HqFTFoJna3eWFNJxWNsVHYYVHFU=;
 b=VgIZ/RTQ4Rhi25sad+McWarsGYXDO9Y0+iz++ep6dBuwSUAwQd5lj9NrP3XMpMBOBC
 nWOwi9O1L+1MBuPX43p3/4nI1exsYbWt28csWX+5gdxzdo6YJ8f6YQba0cUr0TmytktC
 JMD9LPo2ol4oh+Nv8YivCdvk00RnecRHkk0/qTjT80ftUJop/r+Txn38ifgKlfjK8sfQ
 SPse3O1lbLOTa2UEZln1fsq2EXot/7JWRgoR+d5OUfIbJLQaajDFDRgy+K16W0z5YkYd
 Kcyv8zEDDQqYH8zzGIip+0YbSrB0kZ2rwOLJ8yVH5Jkl4fpE5ow2LN/CJef+jJC23PUW
 dZ6g==
X-Gm-Message-State: AGi0PubcfTdYm1EBDx4H/1Ap/8HerKxNJJQE08O3xz2kEitiviBkwUK1
 cA2wxgmoe6D71HNURdE8g8g=
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr3790147wmc.114.1588766015201; 
 Wed, 06 May 2020 04:53:35 -0700 (PDT)
Received: from [192.168.1.37] (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id p8sm2373376wre.11.2020.05.06.04.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 04:53:34 -0700 (PDT)
Subject: Re: [PATCH v2 5/9] hw/core: stream: Add an end-of-packet flag
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200506082513.18751-1-edgar.iglesias@gmail.com>
 <20200506082513.18751-6-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c7f6947d-7815-8df3-6835-3fe933ad4dbc@amsat.org>
Date: Wed, 6 May 2020 13:53:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200506082513.18751-6-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 sstabellini@kernel.org, edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, jasowang@redhat.com, alistair@alistair23.me,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, figlesia@xilinx.com,
 luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g3jnQvd5Pdko

Hi Edgar,

On 5/6/20 10:25 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Some stream clients stream an endless stream of data while
> other clients stream data in packets. Stream interfaces
> usually have a way to signal the end of a packet or the
> last beat of a transfer.
> 
> This adds an end-of-packet flag to the push interface.
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>   include/hw/stream.h     |  5 +++--
>   hw/core/stream.c        |  4 ++--
>   hw/dma/xilinx_axidma.c  | 10 ++++++----
>   hw/net/xilinx_axienet.c | 14 ++++++++++----
>   hw/ssi/xilinx_spips.c   |  2 +-
>   5 files changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/include/hw/stream.h b/include/hw/stream.h
> index d02f62ca89..ed09e83683 100644
> --- a/include/hw/stream.h
> +++ b/include/hw/stream.h
> @@ -39,12 +39,13 @@ typedef struct StreamSlaveClass {
>        * @obj: Stream slave to push to
>        * @buf: Data to write
>        * @len: Maximum number of bytes to write
> +     * @eop: End of packet flag
>        */
> -    size_t (*push)(StreamSlave *obj, unsigned char *buf, size_t len);
> +    size_t (*push)(StreamSlave *obj, unsigned char *buf, size_t len, bool eop);

I'd split this patch, first add EOP in the push handler, keeping current 
code working, then the following patches (implementing the feature in 
the backend handlers), then ...

>   } StreamSlaveClass;
>   
>   size_t
> -stream_push(StreamSlave *sink, uint8_t *buf, size_t len);
> +stream_push(StreamSlave *sink, uint8_t *buf, size_t len, bool eop);

... this final patch, enable the feature and let the frontends use it.

>   
>   bool
>   stream_can_push(StreamSlave *sink, StreamCanPushNotifyFn notify,
> diff --git a/hw/core/stream.c b/hw/core/stream.c
> index 39b1e595cd..a65ad1208d 100644
> --- a/hw/core/stream.c
> +++ b/hw/core/stream.c
> @@ -3,11 +3,11 @@
>   #include "qemu/module.h"
>   
>   size_t
> -stream_push(StreamSlave *sink, uint8_t *buf, size_t len)
> +stream_push(StreamSlave *sink, uint8_t *buf, size_t len, bool eop)
>   {
>       StreamSlaveClass *k =  STREAM_SLAVE_GET_CLASS(sink);
>   
> -    return k->push(sink, buf, len);
> +    return k->push(sink, buf, len, eop);

So in this first part patch I'd use 'false' here, and update by 'eop' in 
the other part (last patch in series). Does it make sense?

Regards,

Phil.

>   }
>   
>   bool
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index 4540051448..a770e12c96 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -283,7 +283,7 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
>   
>           if (stream_desc_sof(&s->desc)) {
>               s->pos = 0;
> -            stream_push(tx_control_dev, s->desc.app, sizeof(s->desc.app));
> +            stream_push(tx_control_dev, s->desc.app, sizeof(s->desc.app), true);
>           }
>   
>           txlen = s->desc.control & SDESC_CTRL_LEN_MASK;
> @@ -298,7 +298,7 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
>           s->pos += txlen;
>   
>           if (stream_desc_eof(&s->desc)) {
> -            stream_push(tx_data_dev, s->txbuf, s->pos);
> +            stream_push(tx_data_dev, s->txbuf, s->pos, true);
>               s->pos = 0;
>               stream_complete(s);
>           }
> @@ -384,7 +384,7 @@ static void xilinx_axidma_reset(DeviceState *dev)
>   
>   static size_t
>   xilinx_axidma_control_stream_push(StreamSlave *obj, unsigned char *buf,
> -                                  size_t len)
> +                                  size_t len, bool eop)
>   {
>       XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(obj);
>       struct Stream *s = &cs->dma->streams[1];
> @@ -416,12 +416,14 @@ xilinx_axidma_data_stream_can_push(StreamSlave *obj,
>   }
>   
>   static size_t
> -xilinx_axidma_data_stream_push(StreamSlave *obj, unsigned char *buf, size_t len)
> +xilinx_axidma_data_stream_push(StreamSlave *obj, unsigned char *buf, size_t len,
> +                               bool eop)
>   {
>       XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
>       struct Stream *s = &ds->dma->streams[1];
>       size_t ret;
>   
> +    assert(eop);
>       ret = stream_process_s2mem(s, buf, len);
>       stream_update_irq(s);
>       return ret;
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index c8dfcda3ee..bd48305577 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -697,14 +697,14 @@ static void axienet_eth_rx_notify(void *opaque)
>                                              axienet_eth_rx_notify, s)) {
>           size_t ret = stream_push(s->tx_control_dev,
>                                    (void *)s->rxapp + CONTROL_PAYLOAD_SIZE
> -                                 - s->rxappsize, s->rxappsize);
> +                                 - s->rxappsize, s->rxappsize, true);
>           s->rxappsize -= ret;
>       }
>   
>       while (s->rxsize && stream_can_push(s->tx_data_dev,
>                                           axienet_eth_rx_notify, s)) {
>           size_t ret = stream_push(s->tx_data_dev, (void *)s->rxmem + s->rxpos,
> -                                 s->rxsize);
> +                                 s->rxsize, true);
>           s->rxsize -= ret;
>           s->rxpos += ret;
>           if (!s->rxsize) {
> @@ -874,12 +874,14 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
>   }
>   
>   static size_t
> -xilinx_axienet_control_stream_push(StreamSlave *obj, uint8_t *buf, size_t len)
> +xilinx_axienet_control_stream_push(StreamSlave *obj, uint8_t *buf, size_t len,
> +                                   bool eop)
>   {
>       int i;
>       XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(obj);
>       XilinxAXIEnet *s = cs->enet;
>   
> +    assert(eop);
>       if (len != CONTROL_PAYLOAD_SIZE) {
>           hw_error("AXI Enet requires %d byte control stream payload\n",
>                    (int)CONTROL_PAYLOAD_SIZE);
> @@ -894,11 +896,15 @@ xilinx_axienet_control_stream_push(StreamSlave *obj, uint8_t *buf, size_t len)
>   }
>   
>   static size_t
> -xilinx_axienet_data_stream_push(StreamSlave *obj, uint8_t *buf, size_t size)
> +xilinx_axienet_data_stream_push(StreamSlave *obj, uint8_t *buf, size_t size,
> +                                bool eop)
>   {
>       XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
>       XilinxAXIEnet *s = ds->enet;
>   
> +    /* We don't support fragmented packets yet.  */
> +    assert(eop);
> +
>       /* TX enable ?  */
>       if (!(s->tc & TC_TX)) {
>           return size;
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index c57850a505..4cfce882ab 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -868,7 +868,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
>   
>           memcpy(rq->dma_buf, rxd, num);
>   
> -        ret = stream_push(rq->dma, rq->dma_buf, num);
> +        ret = stream_push(rq->dma, rq->dma_buf, num, false);
>           assert(ret == num);
>           xlnx_zynqmp_qspips_check_flush(rq);
>       }
> 
