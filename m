Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp346975njk;
        Thu, 23 Jan 2025 10:45:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUQPIAEf4gQxSSepSEB06S+s8HQ8CQ8UfIlHQPw8aEuAbDg+hU4Tmys5B1vUctlow8o3XmSNrxmGklaug==@linaro.org
X-Google-Smtp-Source: AGHT+IEsuEETmSFZTWAHOQ3ueDjtSkRojHeJmD3t1EoectX2ZzsMHYwK5WTofmjixg+IGrhWj66M
X-Received: by 2002:ad4:5747:0:b0:6d8:7ed4:335c with SMTP id 6a1803df08f44-6e1b225102fmr379114076d6.45.1737657954024;
        Thu, 23 Jan 2025 10:45:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737657954; cv=none;
        d=google.com; s=arc-20240605;
        b=JGeCwL98z6DvCpMbhjw4yq63Oc1Ny1wh0VyISPmHim9Yf9kQ0XzYJqVB+gYzf08YGA
         D2jC+ueGrVXLqUXbnmWBqbHI8Y/EtrzejCe5tRXzrSPAcdrbMikgyf6B+BFREWKDfUnG
         w/rmS3bl0ePyIGCg10P/k3087Wn+bGSH68uBtvfQl1l5+KM4rYBaRnT8ba5CpJsoH8fJ
         ikxEPgHrbWvhz2AV/ZpuBYUp2sGukGBVjAA+9O3vD6BGxbUr7wnug3sJDkXfcsNc3uQo
         UOZB8kT3Ggn3fQfYjK56sGAvp8axxqkYVHqQAxQ08Z3j2ibX9nCItFdjTnVwxLEaP67V
         ctnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=3SwtM8oqWakJQzw5AMKCJSz45nWdBNOJPsEdXXiH4gY=;
        fh=y8UldgvBpgWdzvo0ZnT6ptMSZ9zI0pieroCu40oTsaQ=;
        b=Kf9odiFyHfXeRn9ektlLayOvERro4w4frGBtuERd/a8aXi2KHRixSjFtreV9TIdR7j
         zH1bN9kd94GGaOAaGBBIQdf4Q059a0Y3+rlMGyXwuxHW3Vbage4QLPOm7pT8R8bm7/EF
         IRHV+DkULWRn0TjEleKEc+SIcXZnHxB6rzscYMxNeOdu+GtyzCCuGsn0RZvmdJZKL3K/
         LDw/t3qYbsu5aj7A0uMRghajqa6tDyaVFpmKLA5T0qvCvJvOz634NdORRQX281IV0ZJb
         U5OHZ0YBPIGXT/LSxmeKzV04MPQIowYpQ2EHPIM12Dyp2/FoSNk8sb7L//WDedO1bFkW
         sdPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205362918si2809846d6.118.2025.01.23.10.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2025 10:45:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tb2D1-0002OJ-3H; Thu, 23 Jan 2025 13:45:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=bnYe=UP=kaod.org=clg@ozlabs.org>)
 id 1tb2Cr-0002Nw-B1; Thu, 23 Jan 2025 13:45:33 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=bnYe=UP=kaod.org=clg@ozlabs.org>)
 id 1tb2Co-0006OZ-NY; Thu, 23 Jan 2025 13:45:32 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Yf8yM5tfYz4wvb;
 Fri, 24 Jan 2025 05:45:15 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yf8yJ1fJdz4wnx;
 Fri, 24 Jan 2025 05:45:11 +1100 (AEDT)
Message-ID: <335251f9-fea8-4eb6-ba97-6d8d3a68a98b@kaod.org>
Date: Thu, 23 Jan 2025 19:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] aspeed/wdt: Support software reset mode for AST2600
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20250123081901.2688471-1-jamin_lin@aspeedtech.com>
 <20250123081901.2688471-3-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250123081901.2688471-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=bnYe=UP=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: ffcbb7cDljQ5

On 1/23/25 09:19, Jamin Lin wrote:
> On the AST2400 and AST2500 platforms, the system can only be reset by enabling
> the WDT (Watchdog Timer) and waiting for the WDT timeout. However, starting
> from the AST2600 platform, the reset event can be triggered directly and
> intentionally by software, without relying on the WDT timeout.
> 
> This mechanism, referred to as "software restart", is implemented in hardware.
> When using the software restart mechanism, the WDT counter is not enabled.
> 
> To trigger a reset generation in software mode, write 0xAEEDF123 to register
> 0x24 and software mode reset only support SOC reset mode.
> 
> A new function, "aspeed_wdt_is_soc_reset_mode", is introduced to determine
> whether the SoC reset mode is active.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/watchdog/wdt_aspeed.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 22e94e7b9c..94fb643395 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -51,11 +51,20 @@
>   #define WDT_TIMEOUT_CLEAR               (0x14 / 4)
>   
>   #define WDT_RESTART_MAGIC               0x4755
> +#define WDT_SW_RESET_ENABLE             0xAEEDF123
>   
>   #define AST2600_SCU_RESET_CONTROL1      (0x40 / 4)
>   #define SCU_RESET_CONTROL1              (0x04 / 4)
>   #define    SCU_RESET_SDRAM              BIT(0)
>   
> +static bool aspeed_wdt_is_soc_reset_mode(const AspeedWDTState *s)
> +{
> +    uint32_t mode;
> +
> +    mode = extract32(s->regs[WDT_CTRL], 5, 2);

Could we test the extracted field against WDT_CTRL_RESET_MODE_SOC ?

With that,

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.






> +    return (mode == 0);
> +}
> +
>   static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
>   {
>       return s->regs[WDT_CTRL] & WDT_CTRL_ENABLE;
> @@ -199,13 +208,18 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>       case WDT_TIMEOUT_STATUS:
>       case WDT_TIMEOUT_CLEAR:
>       case WDT_RESET_MASK2:
> -    case WDT_SW_RESET_CTRL:
>       case WDT_SW_RESET_MASK1:
>       case WDT_SW_RESET_MASK2:
>           qemu_log_mask(LOG_UNIMP,
>                         "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
>                         __func__, offset);
>           break;
> +    case WDT_SW_RESET_CTRL:
> +        if (aspeed_wdt_is_soc_reset_mode(s) &&
> +            (data == WDT_SW_RESET_ENABLE)) {
> +            watchdog_perform_action();
> +        }
> +        break;
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",

