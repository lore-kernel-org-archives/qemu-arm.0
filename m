Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp347714lfq;
        Fri, 11 Sep 2020 15:44:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkNmINg0OuFq12zc8J8/h95OZFiEkYyOw1NNUe08BlyovCStr485D5dw2w8AbkJPiK3xHr
X-Received: by 2002:a25:9d06:: with SMTP id i6mr5638519ybp.510.1599864277664;
        Fri, 11 Sep 2020 15:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599864277; cv=none;
        d=google.com; s=arc-20160816;
        b=s3PjWXR+hLQAFM3Ns1KCgZHEyLgsMhy9iUgUFde0xe/o6i564tcLhyVr3ASwGffv3d
         7Hl6cx6UOYq0jcvAXFMDsIBJgZxB4bXU2VmhMEMO+siKNgxuInPcuoTWNhC5LLijJ8Oo
         TSeFWXVxUiHQvf0i4Unznyb7L/K5jPq2BkeuYVg88soEroJSKeUZ2Om70bEh47YXcR5I
         EB4GodTuqVFuG5IFoOOCYFs+u6XRod+yDLkrASSFu2krKF4zfsoUHf9+dCN3b6KvAe5N
         jjr/rWLApEOLHEMaiacUy13xPm/ixT1fgA1ISg8+AMXDQz5AeC8BjTfKjDFH6qq+qtcQ
         Akzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QqTCp/aW0Z9Blzuv8kD89yYoCVf7YZhzsv7aZmb2IX4=;
        b=LKT5XMqHqeBiGpQc4lTeNpd1+rcGBjeDgJ4Q4AWJkXaXZDXDR9OKPdRbImKrLKxA19
         U1PSqug7mWVQaocAjeypj6Kxat9aN2pZoxL/YImo7fcqq4l2fSfWno9lz7xo5QrWts9o
         jqRkxJELTYC7fMIRlRO3/mXlM5o0uaFeT2/YDsYZhe1dqwtE9jOiQA79f46nSCj+mQj8
         bVoWopI6SddP+J2FaNKVcPT2ZbqXBe+O6XkLKtLYoy/RU0FKQ0Uy/Xk3sY3sJx1URe6U
         L63FdwGkJB7ZGUZC1bWQXtMQLDM2L+pnQNPIOi10G7wHARoM+rWZF86CQCPQsbAbrxQG
         uGOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HPb4cUMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d80si3068896ybh.392.2020.09.11.15.44.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 15:44:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HPb4cUMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGrmX-0001wM-3b
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 18:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGrmP-0001vO-Bg
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 18:44:29 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:44741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGrmN-0000Q0-Ai
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 18:44:29 -0400
Received: by mail-pg1-x542.google.com with SMTP id 7so7548451pgm.11
 for <qemu-arm@nongnu.org>; Fri, 11 Sep 2020 15:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QqTCp/aW0Z9Blzuv8kD89yYoCVf7YZhzsv7aZmb2IX4=;
 b=HPb4cUMz18VMHNsLr7BuqidAlU6IbO4UIwC40jEiLAwF7Mrqd7d8UBrnJL+KUhlWCM
 yPsuCzFR2rfT8+s5k0oFaoOiiCZ6BfxVpj4PE/mi6RcL4ZK1I1AxG9CLzi07FeoII2uO
 CLl5UirmnFmout7uEFBugEZ7m8L2AQC/bEAiuRVMUnzZen5XMfyf0nt/7ePvPZ/csbEk
 p1NE5Cy6Xr7alFLeQajlOiAfC0pSN7o+B+WtvDdEIJL81dI7QMaSdyBVuTdOi65t9oK0
 oTohMIsFzHttJ1yWScpkmQRKbBCzbzNC6kz2VVMzPdBaZnYOHcPF75fjTUCIaBMTyY4j
 5qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QqTCp/aW0Z9Blzuv8kD89yYoCVf7YZhzsv7aZmb2IX4=;
 b=HO2pQCTEifA05pNLaZlsJIQ9WosIFnzT3auJPA4ykNWhnJsAO9DLhKvutxvVXNwhqu
 FsnfLQq9YBw15qwiT/Wg0FD/pkb2SN5ia1E1wX6CtmsPqDNhQLMqOAVgyJaTfKpExJWf
 5SW7T0LLND21KLpgT4/2wBbu/lHC82V/ptm4S+DYlnQzJvPqwrcvkf7XdwRY0iNtv+Ki
 67apPdw/z7CjvbYymk48iwnZitGtLeiHUgIBMupruYjxVDnwy2Pm0cx6HZ5vBIXF0z3C
 kSPniig0L5VaRc7i2M9qESmIGYzmWHIXlbRRLAlCR9xQy4HIUXzRb/0S09loVldTL1F9
 2SWA==
X-Gm-Message-State: AOAM533avKsXPeOK7jURxRqelyjoc61hiRlVeEr6jIUDisR7RDjmIGzi
 Q5xv4N8cNLWzdnmQs2x3JhVHgw==
X-Received: by 2002:a62:2a89:: with SMTP id q131mr4074632pfq.33.1599864265717; 
 Fri, 11 Sep 2020 15:44:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v69sm2607529pgd.61.2020.09.11.15.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 15:44:25 -0700 (PDT)
Subject: Re: [PATCH v5 2/7] hw/misc/led: Allow connecting from GPIO output
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200910205429.727766-1-f4bug@amsat.org>
 <20200910205429.727766-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <071b68a6-58e4-0d68-e056-ee7ae19e2227@linaro.org>
Date: Fri, 11 Sep 2020 15:44:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910205429.727766-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pWKNPKVQj41V

On 9/10/20 1:54 PM, Philippe Mathieu-Daudé wrote:
> Some devices expose GPIO lines.
> 
> Add a GPIO qdev input to our LED device, so we can
> connect a GPIO output using qdev_connect_gpio_out().
> 
> When used with GPIOs, the intensity can only be either
> minium or maximum. This depends of the polarity of the
> GPIO (which can be inverted).
> Declare the GpioPolarity type to model the polarity.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/misc/led.h  |  8 ++++++++
>  include/hw/qdev-core.h |  8 ++++++++
>  hw/misc/led.c          | 17 ++++++++++++++++-
>  3 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/misc/led.h b/include/hw/misc/led.h
> index f5afaa34bfb..71c9b8c59bf 100644
> --- a/include/hw/misc/led.h
> +++ b/include/hw/misc/led.h
> @@ -38,10 +38,16 @@ typedef struct LEDState {
>      /* Public */
>  
>      uint8_t intensity_percent;
> +    qemu_irq irq;
>  
>      /* Properties */
>      char *description;
>      char *color;
> +    /*
> +     * When used with GPIO, the intensity at reset is related
> +     * to the GPIO polarity.
> +     */
> +    bool inverted_polarity;

Why are you not using the GpioPolarity enum that you added?


r~
