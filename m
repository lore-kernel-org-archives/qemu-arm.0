Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1757472njm;
        Mon, 1 Jul 2024 22:56:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCxQFxDM/8XgvpKHT+BkzWQp5EY1QF4N7I05hKuqk7QVSqUqc6ynpYbOFT/7UAgjV8jMMxRLIFYyxkpbhsqj+8a4Zu9Z7W
X-Google-Smtp-Source: AGHT+IGg7UE86+BaUAlcUwiIIZZbzAIGLzW3+aHrSRvrvUbFsQTEUenS1sUnb8Xnd/8VSsQNw5DU
X-Received: by 2002:ad4:5ce5:0:b0:6b5:d9ef:d55b with SMTP id 6a1803df08f44-6b5d9efd7fbmr1843086d6.0.1719899810574;
        Mon, 01 Jul 2024 22:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719899810; cv=none;
        d=google.com; s=arc-20160816;
        b=VEi2oXLxczbyXvjQ/9una5bM7m8YxEOJu3/6zSwauyWAEa67rv0RRfbxH/1mxsr0tA
         0vvtpC/OTI3WbN+2jrnvG1EOWcq5X05FdEvfE8Qy7qdifw/vChH/aWD+Ak9qlZ5Cv48H
         Z+c4KycSvWujRHMJvKSSTBowCzpzTA901tLfzqS0R/e+QZldY6HO+SMW94C9JTJVGtO+
         t8Rx78zvOsN4KPaweuecGFoi3m+u5nJ7NqCgOzhuyBF2UvvCFmKtwr9i5/iRxcxNJX+N
         GQOIsttBHm4F2jB2HGhLWndS9BnfovKm+hJvkAHHyViAJxMsHWlC4XUQarNLSbVBbrFw
         iuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=L3zM58kCjyQF+K8pg4ybJoyd2SvslcMkpL7ouOa9+6Q=;
        fh=fNM2c6Md8egRT875ckR32/0m9IXdMkrafPYkFdQPgl0=;
        b=Khz0sbiXm1IbV6ywXOrphn/6VlT/bnY1UdkGqte00cqBRPP3iU5EEVHpsMYQc7kGhq
         dGtZP24dTNeW8yetZKoZhoTmahYxVpZ1SyVML+icxkOando1GdYfYcqt9hXlDioLIO32
         sDcvR4yyc2tFoaA+Fl3zbCJvZD3XpXzrlgTty6rNz+uORdA02zqyX9F9TCkIwjz8p4L2
         fOqeWbm4hw9LMaNAPagysiyyFXZSsTIcIw8ykd8zqQWTWy7upWyl3Fbih+mLGHahYJEU
         Kd0WFFmjCGF/oXN0WCW8v4YO/K6Ha45WmLzbFTCOQ3T8rb4UYxfN6w6vG7BCyKyet35d
         13XQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e3640b0si99224116d6.99.2024.07.01.22.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 22:56:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sOWVN-000572-In; Tue, 02 Jul 2024 01:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fXIt=OC=kaod.org=clg@ozlabs.org>)
 id 1sOWVL-00056W-Mn; Tue, 02 Jul 2024 01:56:39 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fXIt=OC=kaod.org=clg@ozlabs.org>)
 id 1sOWVI-0007Jb-He; Tue, 02 Jul 2024 01:56:39 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WCsbt2KBsz4wny;
 Tue,  2 Jul 2024 15:56:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCsbn5sjnz4wcr;
 Tue,  2 Jul 2024 15:56:21 +1000 (AEST)
Message-ID: <11cbc79b-d2a8-4c04-b5ea-cb612124d493@kaod.org>
Date: Tue, 2 Jul 2024 07:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] hw/net:ftgmac100: fix coding style
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Jason Wang <jasowang@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240619100102.3137941-1-jamin_lin@aspeedtech.com>
 <20240619100102.3137941-2-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240619100102.3137941-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=fXIt=OC=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LZdz3fKvzyaV

On 6/19/24 12:01 PM, Jamin Lin wrote:
> Fix coding style issues from checkpatch.pl
> 
> Test command:
> ./scripts/checkpatch.pl --no-tree -f hw/net/ftgmac100.c
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Applied to aspeed-next.

Thanks,

C.




> ---
>   hw/net/ftgmac100.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 74b6c3d9a7..25e4c0cd5b 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -238,7 +238,8 @@ typedef struct {
>    */
>   #define FTGMAC100_MAX_FRAME_SIZE    9220
>   
> -/* Limits depending on the type of the frame
> +/*
> + * Limits depending on the type of the frame
>    *
>    *   9216 for Jumbo frames (+ 4 for VLAN)
>    *   1518 for other frames (+ 4 for VLAN)
> @@ -533,8 +534,10 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
>               break;
>           }
>   
> -        /* record transmit flags as they are valid only on the first
> -         * segment */
> +        /*
> +         * record transmit flags as they are valid only on the first
> +         * segment
> +         */
>           if (bd.des0 & FTGMAC100_TXDES0_FTS) {
>               flags = bd.des1;
>           }
> @@ -639,7 +642,8 @@ static bool ftgmac100_can_receive(NetClientState *nc)
>    */
>   static uint32_t ftgmac100_rxpoll(FTGMAC100State *s)
>   {
> -    /* Polling times :
> +    /*
> +     * Polling times :
>        *
>        * Speed      TIME_SEL=0    TIME_SEL=1
>        *

