Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp739074njc;
        Sun, 9 Mar 2025 12:01:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmiCSLBt0fL7C3vX6wCA99xs/We9pE+EuCkj6n/2Jgm10z0XHCKxPgxioQNQidrDfeUMIuPf9WFijWpg==@linaro.org
X-Google-Smtp-Source: AGHT+IEX6ugubFdxBiXS9fIsI2rTx1SJ3yrsFnyfkdEzsDsrVZuO8BLmKajyp0pGEDmpD/fLr6Bh
X-Received: by 2002:a05:622a:2a0b:b0:476:6a3d:de35 with SMTP id d75a77b69052e-4766a3de806mr97673301cf.39.1741546905231;
        Sun, 09 Mar 2025 12:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741546905; cv=none;
        d=google.com; s=arc-20240605;
        b=iUUc8pqfDWI4eZQuz90bPJljbxDcFMAKktaYY171pIJC9/fYAr69fFbrFHmF/zEzba
         JBAHARHqUETjhUHugqrNtBOVxmJ3fT/h9+UaqhlMYdLRWi3fVcM95O6nuWo1c3figSF0
         mVjQ+6iSDqpayJTjnS8YjAhwy03BhrScWJGUzIywebDe1KIAe8nIIMTJOXh57D7mBuAd
         wB7er+gWC/WbeJkr0XEDYA1CJhgmF3onxGp9DIfHzDyLmEFu5XO1LVYgjKHi0RrXtbBp
         3oEus7r+Ujj1tAW51Y/aO+EVSnpIj18Rqj4ONF08AP+zPz10AV7RyxuvMKw1VOe6Khpk
         qcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=g009UrFww2P8l+qxIe1bJHkpF3pMcLhl8nEq6hi+Dek=;
        fh=4oORELpEwqq+MIVo1PVypnEChUTxNjrXMAqo7dtCCYk=;
        b=hWaUqd1tHEXFuvBQU2jU3fygbynax5p8KhvQ3uBYfhJKmaoKK48A3l7K/QC9XEByJF
         25fbJjWfYqoE4oVkKC4tmoZdVTZ8l94KMssWwRvJkSH02/oxkafC2OJO8H0KuGHMazlY
         +fZuj8YSgUnUS9iRH6hOeKintAB+L00/vi/ok9SJK0+5npedqnUFCugO0Qeg9Y4tbW5G
         Hx8LPY7OKDzBVoXxqhllKUcLPiT7kk9sC/MnZOVUBY6xEjGsKz4BnM8cabrKb60yIwz0
         PFBCm+Yw2NLSlyFd04tNbpX6sqD4noz93XoZC1kLy+hTL6KUWOPHWgquW7kyhsEm1lkL
         ccpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OI0yHYB6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4766527c2d9si37582121cf.649.2025.03.09.12.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 12:01:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OI0yHYB6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trLti-0003D3-B3; Sun, 09 Mar 2025 15:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trLte-00034Q-0f
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 15:01:12 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trLtb-000495-KJ
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 15:01:09 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43bcc85ba13so27849825e9.0
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 12:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741546865; x=1742151665; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g009UrFww2P8l+qxIe1bJHkpF3pMcLhl8nEq6hi+Dek=;
 b=OI0yHYB6XoIhVfR4nkTQfUvStJo4/4yPBozbgUEC4+QXNVE3Fxvlu6gwMsc0Re1gwO
 NyMg+1bB3pJlC1cF5XetBH4+KAR87WoUyayY+aaGY6UsFqmX8wWYsEAn7dANJFGDH4mE
 XABaenwf61zA56ue5g0+2k5NpfQQtCV1ueFKIleR6Cbu1GP/Ovcx82L4cN7dNQ2g4TVg
 HtaC92+sDHTY04oZqySTZKHc9jrkiLldCp6yJ2r6G5oyKpzZ66GWnar+JLf+g9brUJm7
 hQ08Pxrow4Xk2KjHagsummdKH+JKVRPU1R0xAxoC99im/8riUksbhvfcAPzYFkYeNWeg
 e8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741546865; x=1742151665;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g009UrFww2P8l+qxIe1bJHkpF3pMcLhl8nEq6hi+Dek=;
 b=GjkBqcY5OoitXhTnsM6Gc+QdBkHuvA+gwRYjEdhxPxajt/9FQK6yFZG1W287tmQYdF
 Y/isuBsa7XbTNJwzShxjCLd7rEdIR3yH7G+Ynpa/5+r/iX5Nowe8qO7I3ZB7dpwrKaYr
 rMmifQmKC7Tda2sudkdDjG7MGctIC7u6My0KHw4ELXvml61cvgxJ8ls72qZ6W6jcPe8j
 LdGXALssqmgOUq13m+xHE/ZhzjNuytBv4UUM5SunwagDi4Wg2Kmx9sTtleiUfdieo1Bh
 Aa89CwxJtE7Nqg/hU2YdMJqn8f3kWMGHBRyoP8a2rGn2kBicTB5+U3NqMBgaPlIDGOca
 BSrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM9E4MUUB10hAmKpwLXjrcT1i1o5+5ayi7Z8Qqf3xtLSXZFdpcC0VUArnDlBBvgDRcC8a57H46cA==@nongnu.org
X-Gm-Message-State: AOJu0YwFPsyPUSRRh/qKDXJc+MvMj6yfwrtwAneIK+kx4z/ctxH0e+F7
 TFspT+XhmiXL0L9Lf7QwqSXDqs6eXcjiAY1pmz+8beGqUCt65UG3YLhxLBOJUMw=
X-Gm-Gg: ASbGncvV2j4YZKyn14KNtLJIV0CioaFLkliRUMRx44AU5MI5LcQufJ4B2zxPpDBMbrZ
 2p22ECJH9asnsaplJD5fxFz4sjPdVWTJpBOkTA3yglcT0frkMNqgz6M7Vk5xrDVF7pE9Ijr8qqX
 Qie8Qw04wLlf1LCS8sJDDy5L4dh6C4l2t0xd0ym8fn9Gx7vrKQ5ivxjChtT3hfeT+jxnCHzL2xj
 BvkDSuird8wJj9LmSc4JLItDIY8cvdn7oFCcaVLFnP2zFQmOj+c5lEk4OyMJGh2sunCY67Z7OVe
 DiEDM4Ezj8MU0caiiaG4VxOHlzEVJgEf6wTcmTvwgUe7QUI96Bpklzf13//vCV8o5A4HH7rvcN2
 QAYsWVuH1ss1t+pCjndaYtS4=
X-Received: by 2002:a05:600c:154c:b0:43c:f63c:babb with SMTP id
 5b1f17b1804b1-43cf63cc031mr8907385e9.1.1741546865449; 
 Sun, 09 Mar 2025 12:01:05 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce715731csm62116135e9.2.2025.03.09.12.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Mar 2025 12:01:04 -0700 (PDT)
Message-ID: <f4262519-017d-4ed7-8c17-5d4d72a219a6@linaro.org>
Date: Sun, 9 Mar 2025 20:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hw/net/smc91c111: Sanitize packet length on tx
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Jason Wang <jasowang@redhat.com>
References: <20250228174802.1945417-1-peter.maydell@linaro.org>
 <20250228174802.1945417-3-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250228174802.1945417-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aDCfECcuAg4+

Hi Peter,

On 28/2/25 18:48, Peter Maydell wrote:
> When the smc91c111 transmits a packet, it must read a control byte
> which is at the end of the data area and CRC.  However, we don't
> sanitize the length field in the packet buffer, so if the guest sets
> the length field to something large we will try to read past the end
> of the packet data buffer when we access the control byte.
> 
> As usual, the datasheet says nothing about the behaviour of the
> hardware if the guest misprograms it in this way.  It says only that
> the maximum valid length is 2048 bytes.  We choose to log the guest
> error and silently drop the packet.
> 
> This requires us to factor out the "mark the tx packet as complete"
> logic, so we can call it for this "drop packet" case as well as at
> the end of the loop when we send a valid packet.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2742
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/smc91c111.c | 34 +++++++++++++++++++++++++++++-----
>   1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
> index 2295c6acf25..23ca99f926a 100644
> --- a/hw/net/smc91c111.c
> +++ b/hw/net/smc91c111.c
> @@ -22,6 +22,13 @@
>   
>   /* Number of 2k memory pages available.  */
>   #define NUM_PACKETS 4
> +/*
> + * Maximum size of a data frame, including the leading status word
> + * and byte count fields and the trailing CRC, last data byte
> + * and control byte (per figure 8-1 in the Microchip Technology

If control byte is included, ...

> + * LAN91C111 datasheet).
> + */
> +#define MAX_PACKET_SIZE 2048
>   
>   #define TYPE_SMC91C111 "smc91c111"
>   OBJECT_DECLARE_SIMPLE_TYPE(smc91c111_state, SMC91C111)
> @@ -240,6 +247,16 @@ static void smc91c111_release_packet(smc91c111_state *s, int packet)
>       smc91c111_flush_queued_packets(s);
>   }
>   
> +static void smc91c111_complete_tx_packet(smc91c111_state *s, int packetnum)
> +{
> +    if (s->ctr & CTR_AUTO_RELEASE) {
> +        /* Race?  */
> +        smc91c111_release_packet(s, packetnum);
> +    } else if (s->tx_fifo_done_len < NUM_PACKETS) {
> +        s->tx_fifo_done[s->tx_fifo_done_len++] = packetnum;
> +    }
> +}
> +
>   /* Flush the TX FIFO.  */
>   static void smc91c111_do_tx(smc91c111_state *s)
>   {
> @@ -263,6 +280,17 @@ static void smc91c111_do_tx(smc91c111_state *s)
>           *(p++) = 0x40;
>           len = *(p++);
>           len |= ((int)*(p++)) << 8;
> +        if (len >= MAX_PACKET_SIZE) {

isn't MAX_PACKET_SIZE valid? I'm not sure at all but I'd expect:

            if (len > MAX_PACKET_SIZE) {

> +            /*
> +             * Datasheet doesn't say what to do here, and there is no
> +             * relevant tx error condition listed. Log, and drop the packet.
> +             */
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "smc91c111: tx packet with bad length %d, dropping\n",
> +                          len);
> +            smc91c111_complete_tx_packet(s, packetnum);
> +            continue;
> +        }
>           len -= 6;
>           control = p[len + 1];
>           if (control & 0x20)
> @@ -291,11 +319,7 @@ static void smc91c111_do_tx(smc91c111_state *s)
>               }
>           }
>   #endif
> -        if (s->ctr & CTR_AUTO_RELEASE)
> -            /* Race?  */
> -            smc91c111_release_packet(s, packetnum);
> -        else if (s->tx_fifo_done_len < NUM_PACKETS)
> -            s->tx_fifo_done[s->tx_fifo_done_len++] = packetnum;
> +        smc91c111_complete_tx_packet(s, packetnum);
>           qemu_send_packet(qemu_get_queue(s->nic), p, len);
>       }
>       s->tx_fifo_len = 0;

