Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3326809njd;
        Wed, 2 Apr 2025 02:36:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWslDubN/p2zc2jZJRpTzxo3kRVyu0zQoyzG5jMdPcQPC8NMEEY9RrpxEnnVUJNC7BzRNd7hTBdodv/aw==@linaro.org
X-Google-Smtp-Source: AGHT+IHXo4+bwP3jaziThKBlfi1oMsV0y8ApOVcQ71ssqkKK9Ho185q7OIPD4JqXFdLIXbN/vK9N
X-Received: by 2002:a05:6214:1244:b0:6e6:698f:cafd with SMTP id 6a1803df08f44-6ef02d65a5dmr33102636d6.37.1743586593444;
        Wed, 02 Apr 2025 02:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743586593; cv=none;
        d=google.com; s=arc-20240605;
        b=G3JKb/t7yl4yfDSf8z/Y1AjMgev+8S7BX4IbiEiuPTCWB7vXY7pem5OHH4RcAPv4Tn
         3uzZ1Xv9SMTh1FLQGvks41NahAfK3RBN5n81C8ri2sFLBjEj5Q6RJPjhZRZmOIukdhko
         wEOCXi8vOGgQCAIRJqRg31sw5rd4KC+4Kv6f1mLeMIAKWZ3hnON4Lju0ydgebpYKKOWG
         mpThzfrv+14RcS0Iv2j39CjvKAOYR0czG097GAaqLmFpwAtrS4pxqGx28cia2jjtkj6k
         cocNRANsHIi2L1WPH5eHZGiTnYurKJB/v2i08mu1+lKy9zCnjKlV2QOFDbSIi6b7xpmy
         ADNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=h7UFdqWUwJ+UXOa7VbgoBRqw/pw1z0QI5f6EZUMpUz0=;
        fh=KIQWrerkHcHGY8pI9tE4eJlk73GRvR/oZFuXy8RkeGg=;
        b=R5GyvRYH8Pbsx2XWDfCN8OUHkl730o+a/MmQhkhv/MdpJiE3ksXhSGlk5BQHV0BiJZ
         zhYeToQ+0rWY3Sqm7XpnrH+BLY/NZ4uKmcnrHRnOgWz/RZ0nZb+hhsshyCoYrcI2nAjf
         JK2vwonW9c85CBL5Ye1VdyDk4aKUJNK1np2H9q/XL08i7NVbqiNL7Flfu+z0ft8Ftabu
         usfF8ubVuUXHRE65wYV7oBppKAZ1SCJWWhAgwGFMY/0SdHRJW8R8Qm3KZ/d/NTLs/ZI4
         Sj138yhgfvUrp1oV3VfYgxOKNg8KUqa05l1kqpBXk1O0APlMjwYBT4Kn0wN/mggspYdG
         O2Yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec9788f4dsi102201636d6.262.2025.04.02.02.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 02:36:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzuW4-00016v-MU; Wed, 02 Apr 2025 05:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1tzuVr-00015j-Do; Wed, 02 Apr 2025 05:36:02 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1tzuVp-0007f5-7n; Wed, 02 Apr 2025 05:35:59 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZSKVb1BT3z4x3p;
 Wed,  2 Apr 2025 20:35:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZSKVW0fvnz4wbx;
 Wed,  2 Apr 2025 20:35:46 +1100 (AEDT)
Message-ID: <e2a8770c-d206-441e-9542-9616531e263c@kaod.org>
Date: Wed, 2 Apr 2025 11:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/22] hw/misc/aspeed_hace: Ensure HASH_IRQ is always
 set to prevent firmware hang
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
 <20250321092623.2097234-10-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250321092623.2097234-10-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=yfRC=WU=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pXfvM86FBPrN

On 3/21/25 10:26, Jamin Lin wrote:
> Currently, if the program encounters an unsupported algorithm, it does not set
> the HASH_IRQ bit in the status register and send an interrupt to indicate
> command completion. As a result, the FW gets stuck waiting for a completion
> signal from the HACE module.
> 
> Additionally, in do_hash_operation, if an error occurs within the conditional
> statement, the HASH_IRQ bit is not set in the status register. This causes the
> firmware to continuously send HASH commands, as it is unaware that the HACE
> model has completed processing the command.
> 
> To fix this, the HASH_IRQ bit in the status register must always be set to
> ensure that the firmware receives an interrupt from the HACE module, preventing
> it from getting stuck or repeatedly sending HASH commands.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

Should we add a 'Fixes' trailer ?

> ---
>   hw/misc/aspeed_hace.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 8f333fc97e..d4f653670e 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -311,12 +311,6 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>                               iov[i - 1].iov_len, false,
>                               iov[i - 1].iov_len);
>       }
> -
> -    /*
> -     * Set status bits to indicate completion. Testing shows hardware sets
> -     * these irrespective of HASH_IRQ_EN.
> -     */
> -    s->regs[R_STATUS] |= HASH_IRQ;
>   }
>   
>   static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
> @@ -400,10 +394,16 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>                   qemu_log_mask(LOG_GUEST_ERROR,
>                           "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
>                           __func__, data & ahc->hash_mask);
> -                break;
> +        } else {
> +            do_hash_operation(s, algo, data & HASH_SG_EN,
> +                    ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
>           }
> -        do_hash_operation(s, algo, data & HASH_SG_EN,
> -                ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
> +
> +        /*
> +         * Set status bits to indicate completion. Testing shows hardware sets
> +         * these irrespective of HASH_IRQ_EN.

is that still true on the AST2700 SoC ?

> +         */
> +        s->regs[R_STATUS] |= HASH_IRQ;
>   >           if (data & HASH_IRQ_EN) {
>               qemu_irq_raise(s->irq);



Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


