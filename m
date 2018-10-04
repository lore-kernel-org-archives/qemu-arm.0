Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1418369wrt;
        Thu, 4 Oct 2018 15:18:51 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60f3g+ifMVibidmzz2hEZmtHLMXiCoeeHMm+Yrah7N5Ezl4BGpocJXKqcogwoEWx/68sYvS
X-Received: by 2002:a37:4b44:: with SMTP id y65-v6mr6713093qka.218.1538691531111;
        Thu, 04 Oct 2018 15:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538691531; cv=none;
        d=google.com; s=arc-20160816;
        b=z5EvVVkNpHYrojKzeQvjDzbvGkjATUMQnCWNmZGKXXlfvx8PsxjQ9GOlebL8uoZUV8
         GBiAO9u2NGiWB3cVrel/GBy5KioI+OANupyyrEIRVdq9c9sRstzbjRJ2qaUENsZ2CAyI
         teQwd4/FdZ5UPLu2SFD9KjmjYd1qpPPTY40C5sS0k/yfSJgB4ttnsFMp3g2hI4UFtF6n
         CM2sxW1OfvbsNlA+jSzxIE38tjCm14wT3loXi1AA4qGJxuZdh2Fz3uYIwrbGe33P0ojs
         W5e8pkxpBqIKI3kbGWda2JtdgRSrY6tqw5m3WrQbzOuk8n1IE9ApNge3zQMAwX0yEH6X
         S6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=F0daAwsjb3RYPgXiWveXGgOrRNR4BVzzce6yshfR/hs=;
        b=t5mh8rzLXnwyAtXtjZlOyvAn6oNYCK4CVllDoz+TZE3TABiOoe7LQSkYFA8DRiH2Mt
         fHVRdHGnJZxWBEOhVICKy1LzdrzI/jW/qb2NTcRlEmCYfZrhQ3SO5SPP/LUjoGEiqrkK
         6Rdja/2kqeUR05oSS/a01chIam4L9aYIZaUcMABqamdwSquprbYracMUUOSSwWbKtQq3
         09sQi5a9xLgH6KJt1ub1sBGdT7Aia6+Nn0G//qzTDExWJhkV2DJ3pmWVF7M36NbT+f4c
         d2qA18yPGwO/JuLTunyRWtH6Ot1D2Bh6TraGzFt3iyis6iQJo9F6vg0v1yFDO9oFfOfD
         0FQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=az58DPWM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f58-v6si4205931qta.336.2018.10.04.15.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 15:18:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=az58DPWM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60247 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8BxK-0002E0-Ju
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 18:18:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8Bvf-0001NB-Pq
	for qemu-devel@nongnu.org; Thu, 04 Oct 2018 18:17:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8Bvf-00076v-0d
	for qemu-devel@nongnu.org; Thu, 04 Oct 2018 18:17:07 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1g8Bva-000741-IP; Thu, 04 Oct 2018 18:17:02 -0400
Received: by mail-pl1-x642.google.com with SMTP id y15-v6so5825385plr.12;
	Thu, 04 Oct 2018 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=F0daAwsjb3RYPgXiWveXGgOrRNR4BVzzce6yshfR/hs=;
	b=az58DPWMQXv94MAAPYnU0S1DnUalzjW0+Cg1BN1sv9CsqmVLAUvs9nTanXIurHen9i
	7QGO1zj2ymF7VBDACOY94IWCjJYE3u7/I5vbjbxCyrumJf0/jT1MV2Zf1fzFj0yFUE1g
	F0r/RZ0TIV2egbO5qGArEhlixTu/i+1a14g2yFCh4YWZaofMtmpQpNwN0Xuwt1QIc3MW
	K9waHmfHs5au8L+bpemfEawqf+tY6N3PzQi7APQenqr9UO+m125tOrlHOoaxgDnuu0N0
	PLQ2EA+padr35bLzp/8LWRdC/43My+eA1ggx+jT9VaPqzYCVZO9Uhc6msZxI0dGNHZCX
	m+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=F0daAwsjb3RYPgXiWveXGgOrRNR4BVzzce6yshfR/hs=;
	b=sb6jcHC64aBTeYeg69VrRnliVirsLfuLbixmtpbbTkiMQOyOurZZcEmkqeJ5NnYHYA
	XIRAeOMXrVi3nCnW8ZapbDbBBwSYlIZLoZ63s7XoBqOCKidPsAx8vXnFdagfNM143ZkU
	9eWO4hnrH5O/vmUoZQ0XMC4uO27aFO1ihCCeSPWFGe0prcEioOeq3qck2EOUjPt+PJcr
	Wxe9JYOsVd4Wttg+4CMLHo3gwTf0bvGYvnwHpofMtabIgowVSt6jZY6LqFbcWMjrimAg
	3UKta5kdFKS5z9ebfK9Xbgp3sKU1BfsX3WOjqOcNofAqHBze2hGPrWDbGxh3QlrP05Zu
	EhGQ==
X-Gm-Message-State: ABuFfojcBzKLUIgznUW/ZoM450X2reaSp1WLIkXjfZkpU3v5wU4tZPYo
	zmpB++tof0R7Nkc30VjM86s=
X-Received: by 2002:a17:902:1566:: with SMTP id
	b35-v6mr8520271plh.135.1538691421211; 
	Thu, 04 Oct 2018 15:17:01 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	s78-v6sm21531011pfd.138.2018.10.04.15.16.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Oct 2018 15:17:00 -0700 (PDT)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-5-git-send-email-edgar.iglesias@gmail.com>
From: Alistair <alistair23@gmail.com>
Message-ID: <98f89984-6b4f-6891-318f-64346f95859e@gmail.com>
Date: Thu, 4 Oct 2018 15:16:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1538579266-8389-5-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-devel] [PATCH v1 04/12] net: cadence_gem: Add macro with
 max number of descriptor words
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TmbEdJ/fGS4Q

On 10/03/2018 08:07 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add macro with max number of DMA descriptor words.
> No functional change.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   hw/net/cadence_gem.c         | 4 ++--
>   include/hw/net/cadence_gem.h | 5 ++++-
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 31f3fe0..4d769b0 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1042,7 +1042,7 @@ static void gem_transmit_updatestats(CadenceGEMState *s, const uint8_t *packet,
>    */
>   static void gem_transmit(CadenceGEMState *s)
>   {
> -    uint32_t desc[2];
> +    uint32_t desc[DESC_MAX_NUM_WORDS];
>       hwaddr packet_desc_addr;
>       uint8_t     tx_packet[2048];
>       uint8_t     *p;
> @@ -1108,7 +1108,7 @@ static void gem_transmit(CadenceGEMState *s)
>   
>               /* Last descriptor for this packet; hand the whole thing off */
>               if (tx_desc_get_last(desc)) {
> -                uint32_t desc_first[2];
> +                uint32_t desc_first[DESC_MAX_NUM_WORDS];
>   
>                   /* Modify the 1st descriptor of this packet to be owned by
>                    * the processor.
> diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
> index 633d564..b33ef65 100644
> --- a/include/hw/net/cadence_gem.h
> +++ b/include/hw/net/cadence_gem.h
> @@ -32,6 +32,9 @@
>   
>   #define CADENCE_GEM_MAXREG        (0x00000800 / 4) /* Last valid GEM address */
>   
> +/* Max number of words in a DMA descriptor.  */
> +#define DESC_MAX_NUM_WORDS              2
> +
>   #define MAX_PRIORITY_QUEUES             8
>   #define MAX_TYPE1_SCREENERS             16
>   #define MAX_TYPE2_SCREENERS             16
> @@ -74,7 +77,7 @@ typedef struct CadenceGEMState {
>   
>       uint8_t can_rx_state; /* Debug only */
>   
> -    uint32_t rx_desc[MAX_PRIORITY_QUEUES][2];
> +    uint32_t rx_desc[MAX_PRIORITY_QUEUES][DESC_MAX_NUM_WORDS];
>   
>       bool sar_active[4];
>   } CadenceGEMState;
> 
