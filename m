Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp947613wrt;
        Fri, 5 Oct 2018 16:11:11 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60Hor/VMKJJpnb8hQ1tozYK5//2g2ujiE2KyVTcj7UFr/zNrWLfsshfSXTUAfceCze1IIkU
X-Received: by 2002:aed:2647:: with SMTP id z65-v6mr10759435qtc.301.1538781071077;
        Fri, 05 Oct 2018 16:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538781071; cv=none;
        d=google.com; s=arc-20160816;
        b=hdzH8AMIy/wDTbzvra6eEERiuL+GjYi7w5Oq08bx7WAUbH9dDjRR3CyhtGC5rk6gs+
         J3qxvBRYI/J9yi4U3VoYscSS9hQSfOt6pAy8Tr3khreb8YIRTrX+o2yZst6/riB1cU9S
         FFZzvaM6qmPZqYyy5Or29XCMSwWx+qso2Ut5bZGSYHAjQTyTUcJyqxn0zYQY7zGmugfg
         KN+xtAJClaFlvZIrHPy9mZPtEqnR6ttcKjoJRwbo7cBejXEzklBcTzHVS1r4X/3i38y3
         8Fk+NHBI9BIZgLbuiLJMX9QLC9A6kMKLa/dlR59ShIYpvHBPywbdaoX3+XIshJOQTIbz
         SUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=CTggrJlOUoNR+lI6lRt8KqyI3K3YXHzoS4QdUqe1zsA=;
        b=jbfxhW6nIFM2fFA5zC/v0b9EfFbvVekJ4OH3tBmqD9Wh+XIlsVltnn0cQGSYFOjXTE
         Prszu4WzHt2Vh5acH1s+80mFVCHpIysvCkHn3Nz4atxU836lV0joShU/3iyVrX2LGJEr
         gaqpOwkBH14wjoKohZSt71GU99FZY/vVwLVRMD8261oEldwS7Y1gv5dL+ngu3L3+vcQ8
         zMD3BVhAPd28lAGbepsTOwaRMy/IklBbKgXK3tcmQKeMJsHyQcxmX5MGdElSvyXMhZCa
         z0Dg72oz1fvXluzzwfXTkitOUBX99JN0k2WiR26o7w63oOCCw8hcSZemdhbqvkWyIFkA
         AQCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t188-v6si1413447qkb.231.2018.10.05.16.11.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Oct 2018 16:11:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37227 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8ZFW-0002m2-Gu
	for alex.bennee@linaro.org; Fri, 05 Oct 2018 19:11:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8ZEs-0002lO-KJ
	for qemu-devel@nongnu.org; Fri, 05 Oct 2018 19:10:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8ZEm-0007gL-S7
	for qemu-devel@nongnu.org; Fri, 05 Oct 2018 19:10:28 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34369)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g8ZEl-0007bX-5s
	for qemu-devel@nongnu.org; Fri, 05 Oct 2018 19:10:24 -0400
Received: by mail-wm1-f66.google.com with SMTP id z25-v6so4667211wmf.1
	for <qemu-devel@nongnu.org>; Fri, 05 Oct 2018 16:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CTggrJlOUoNR+lI6lRt8KqyI3K3YXHzoS4QdUqe1zsA=;
	b=g2BJ6COQlEx6YeqEwDW/2kCpvMxvjhJBLD5cDlvoSxCqcIg9RLlUS5oKzdhMv1PRsP
	SRhve9uo33Jz/uWOZVHYz5IIGGaEWcY0IwDurzvuIstQly1nYWIqnT4EcDrRbEtGnttS
	qjfBcZMx89KtMJ2P1hK+kjFd/41KNfHt+JssVhn6DBaqij5ItJl9w5WWfFSskIl6RE4s
	Uvbq2s1TCjeglBfyshT4XfwKreEYyMnZ6vbuDGzk7ZCGHD4WZtR9NFKQzIW9Er5Sajld
	ISsYcg5DckK7xw41/P0ndVGIBnjbC8hP7wsqgAz4dEM59R42oasRGIayrmyY+pABxoFz
	18IQ==
X-Gm-Message-State: ABuFfogxPgfr/ZCbtFpom+uVpds7GxTDeulpRWmuHPw9FsGR6EX/fPCL
	VXSKRAoUucw13tAQYQDD96aULQ==
X-Received: by 2002:a1c:d105:: with SMTP id i5-v6mr8727612wmg.69.1538781020500;
	Fri, 05 Oct 2018 16:10:20 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	j20-v6sm2045923wmh.9.2018.10.05.16.10.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 16:10:19 -0700 (PDT)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-5-git-send-email-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a7f59a2b-91d6-49e3-e2c7-79d69043c514@redhat.com>
Date: Sat, 6 Oct 2018 01:10:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1538579266-8389-5-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
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
X-TUID: yaVzVFW8UbHk

On 03/10/2018 17:07, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add macro with max number of DMA descriptor words.
> No functional change.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/net/cadence_gem.c         | 4 ++--
>  include/hw/net/cadence_gem.h | 5 ++++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 31f3fe0..4d769b0 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1042,7 +1042,7 @@ static void gem_transmit_updatestats(CadenceGEMState *s, const uint8_t *packet,
>   */
>  static void gem_transmit(CadenceGEMState *s)
>  {
> -    uint32_t desc[2];
> +    uint32_t desc[DESC_MAX_NUM_WORDS];
>      hwaddr packet_desc_addr;
>      uint8_t     tx_packet[2048];
>      uint8_t     *p;
> @@ -1108,7 +1108,7 @@ static void gem_transmit(CadenceGEMState *s)
>  
>              /* Last descriptor for this packet; hand the whole thing off */
>              if (tx_desc_get_last(desc)) {
> -                uint32_t desc_first[2];
> +                uint32_t desc_first[DESC_MAX_NUM_WORDS];
>  
>                  /* Modify the 1st descriptor of this packet to be owned by
>                   * the processor.
> diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
> index 633d564..b33ef65 100644
> --- a/include/hw/net/cadence_gem.h
> +++ b/include/hw/net/cadence_gem.h
> @@ -32,6 +32,9 @@
>  
>  #define CADENCE_GEM_MAXREG        (0x00000800 / 4) /* Last valid GEM address */
>  
> +/* Max number of words in a DMA descriptor.  */
> +#define DESC_MAX_NUM_WORDS              2
> +
>  #define MAX_PRIORITY_QUEUES             8
>  #define MAX_TYPE1_SCREENERS             16
>  #define MAX_TYPE2_SCREENERS             16
> @@ -74,7 +77,7 @@ typedef struct CadenceGEMState {
>  
>      uint8_t can_rx_state; /* Debug only */
>  
> -    uint32_t rx_desc[MAX_PRIORITY_QUEUES][2];
> +    uint32_t rx_desc[MAX_PRIORITY_QUEUES][DESC_MAX_NUM_WORDS];
>  
>      bool sar_active[4];
>  } CadenceGEMState;
> 
