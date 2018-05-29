Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3580044wre;
        Tue, 29 May 2018 06:36:31 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLzuNxZy14l23D/xw9xhtWFf67IfaxofT7z8zZsAUBkwc/RLLv0ygiVXRW6fNxed7eh8S9I
X-Received: by 2002:a0c:d205:: with SMTP id m5-v6mr11504583qvh.144.1527600991870;
        Tue, 29 May 2018 06:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527600991; cv=none;
        d=google.com; s=arc-20160816;
        b=btAWY8Jm+bNKODpzphcU0fBofLSuGzx7kuBqiRKHvqhACg/THMmQWMzQqB41Rt3hLf
         iEQ+pdHC2fjH4ho0sVxg2JSNAX97iNhmhj/vBEx0HgReJnetJ8mpJsguzwKzawX8C6UL
         uwxSGu1gfmEIWdEsCPC4bZGlBXTxNnIjctK8hmX18lT53UpdI9Hh0iP7KwMEMFrePJqb
         pYxx4esg3PEgTsfRExjL6YsT+wOiP/MMXxqNLnClKxJHCTzlzsPqtQANbs1gQD+yG6sq
         wCie1Wn9Xs8ze23LfSRTdY/mJsjsR3tZMR5X1rA5kwnGTMhnqdVKSvPgQyR1gDBIPEL2
         Qz2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=9TpySnA6uvjEjGrz2l/Tjig6BF+QveW7zihYc2qeSpY=;
        b=h3gDzFiplzfVta/Ihp5tQkVnsMKxBxizFqZpdc2zCzjs4KIc7v+7ntPwLs6s7k13uw
         rO9aXgCekZ/Wdb9udeZFUyN4WlU1QEueXgSiKo2MeuRCRm8wZbcZLsLYT9gA6KW4qyIn
         T23q4LUiEi5Z+ia2zzOANQjN0TMUj9C/KHV1j4rDSh+Am27En2unVU+bpeZ16BMrSX5k
         hIzs5AUQbtNCITWF0Hco3ACaU/zpZZO4t6JSs+yJpqLMo2q9cTLt59IPvuSU7rjrzejF
         oV9XWH/n8aBAiqHCvb9RYyMC2royQMIOE8m26eZYKIU4+J23q/j03EsC4Lf7egrL68eM
         Y3OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vu+p5Y+E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p2-v6si1471856qkl.224.2018.05.29.06.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 06:36:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vu+p5Y+E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33089 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNenf-0003sy-El
	for alex.bennee@linaro.org; Tue, 29 May 2018 09:36:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNemI-0003Ti-Qj
	for qemu-devel@nongnu.org; Tue, 29 May 2018 09:35:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNemF-0000AQ-O1
	for qemu-devel@nongnu.org; Tue, 29 May 2018 09:35:06 -0400
Received: from mail-ua0-x242.google.com ([2607:f8b0:400c:c08::242]:41636)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNemF-00009z-HG; Tue, 29 May 2018 09:35:03 -0400
Received: by mail-ua0-x242.google.com with SMTP id a3-v6so9970255uad.8;
	Tue, 29 May 2018 06:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9TpySnA6uvjEjGrz2l/Tjig6BF+QveW7zihYc2qeSpY=;
	b=Vu+p5Y+Ez2rigtSpZ9M8Up/ekuNhJpFYlw5FLdcxrde47m5FJvk96CGDHgF8ey/aWG
	AHzV/OwLKSKmyDZkvt4P6pz5yhiUJaUSOwatxmtcZ0QJJ6t4/x4bGzH+yT8G8hEI4vC1
	qb34mZHRBYtOk+E3UKuFbyA0R9khvevTOoLD1OJxYiScMsqCcvSQ7XC3LDl6RUIus2lp
	Iro5NDbPWbhRhzfyFptnt6sqwyXMwXJdOff9iBDFcFx0tPVE/gWYuJu2v1ZnqPujnW4D
	83RRu7uIvxI1aZ0VUaunIeKjx4jvVOEk+IbOdapF2MCKKPHWf2AZAigYQ0MfoEw6paNV
	GlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=9TpySnA6uvjEjGrz2l/Tjig6BF+QveW7zihYc2qeSpY=;
	b=Gs7wc7TEt29O27V5AnL40Th6J8dGgeJgTQ9P52PWyXO+PGDcBH85JQ2CYEUfv3rFuw
	DzrJJWiwVPe8TxiKV8PXA94eMIsqQMegu4qg8M/bXFYFkHq4WdNdCfxceGoCguxWkmme
	ukFVp5H7WTVqRk71TZ0NDm0uns9rgthpT+kFTqXF4ryW3+jP3qXtmI9qSIRfX0DOWH2V
	gd4DNVxAN3rC3nImggqAZA/kfLELVIxSCPbRAxHx/9bYI2D6at4StE5/dtr0BnTJIkIc
	tOUQ6CPDQ3eSuO7GrtkzvXWac9AUr2xTNyrY+XcMwhKJdWXVfj5bemEq18Oqi4G0QGcJ
	Crmg==
X-Gm-Message-State: ALKqPwd8vLHcO9jrbmt3NozQiLYS3XV+C4AdbJXKW5LQFisJUTI+OxhU
	HHTbPWTZDDDyT1en4+ViFLSVi4SlEx0=
X-Received: by 2002:ab0:15c1:: with SMTP id
	j1-v6mr11289819uae.181.1527600902731; 
	Tue, 29 May 2018 06:35:02 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	48-v6sm4447303uak.48.2018.05.29.06.35.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 06:35:02 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
References: <20180529062838.20556-1-clg@kaod.org>
	<20180529062838.20556-3-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b0cb42ea-16f7-7806-814c-f472867e1a6a@amsat.org>
Date: Tue, 29 May 2018 10:34:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180529062838.20556-3-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 2/6] ftgmac100: add IEEE 802.1Q
 VLAN support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qw/BuYHnBUHj

Hi Cédric,

On 05/29/2018 03:28 AM, Cédric Le Goater wrote:
> The ftgmac100 NIC supports VLAN tag insertion and the MAC engine also
> has a control to remove VLAN tags from received packets.
> 
> The VLAN control bits and VLAN tag information are contained in the
> second word of the transmit and receive descriptors. The Insert VLAN
> bit and the VLAN Tag available bit are only valid in the first segment
> of the packet.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/net/ftgmac100.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 7598d08c9cb9..50af1222464a 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -443,6 +443,24 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
>              break;
>          }
>  
> +        /* Check for VLAN */
> +        if (bd.des0 & FTGMAC100_TXDES0_FTS &&
> +            bd.des1 & FTGMAC100_TXDES1_INS_VLANTAG &&
> +            be16_to_cpu(PKT_GET_ETH_HDR(ptr)->h_proto) != ETH_P_VLAN) {
> +            if (frame_size + len + 4 > sizeof(s->frame)) {
> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %d bytes\n",
> +                              __func__, len);
> +                s->isr |= FTGMAC100_INT_XPKT_LOST;
> +                len =  sizeof(s->frame) - frame_size - 4;
> +            }
> +            memmove(ptr + 16, ptr + 12, len - 12);
> +            ptr[12] = 0x81;
> +            ptr[13] = 0x00;

               stw_be_p(ptr + 12, ETH_P_VLAN);

> +            ptr[14] = (uint8_t) bd.des1 >> 8;
> +            ptr[15] = (uint8_t) bd.des1;

               stw_be_p(ptr + 12, bd.des1);

> +            len += 4;
> +        }
> +
>          ptr += len;
>          frame_size += len;
>          if (bd.des0 & FTGMAC100_TXDES0_LTS) {
> @@ -858,7 +876,19 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
>              buf_len += size - 4;
>          }
>          buf_addr = bd.des3;
> -        dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
> +        if (first && proto == ETH_P_VLAN && buf_len >= 18) {
> +            bd.des1 = (buf[14] << 8) | buf[15] | FTGMAC100_RXDES1_VLANTAG_AVAIL;

               bd.des1 = lduw_be_p(buf + 14) |
FTGMAC100_RXDES1_VLANTAG_AVAIL;

> +            if (s->maccr & FTGMAC100_MACCR_RM_VLAN) {
> +                dma_memory_write(&address_space_memory, buf_addr, buf, 12);
> +                dma_memory_write(&address_space_memory, buf_addr + 12, buf + 16,
> +                                 buf_len - 16);
> +            } else {
> +                dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
> +            }
> +        } else {
> +            bd.des1 = 0;
> +            dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
> +        }
>          buf += buf_len;
>          if (size < 4) {
>              dma_memory_write(&address_space_memory, buf_addr + buf_len,
> 

With ldst API uses:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
