Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp683214lfk;
        Wed, 9 Feb 2022 01:12:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx38cR8aSkQsC0jyqSm79fZ9s+KiEgyJZZYNpsR9JTj+9B0w63/GzzBA1BPXg3sRxt/lUKt
X-Received: by 2002:ac8:57cc:: with SMTP id w12mr683764qta.155.1644397933303;
        Wed, 09 Feb 2022 01:12:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644397933; cv=none;
        d=google.com; s=arc-20160816;
        b=u3WzC2+s7A/03E0bmZQdeHpc745u8siZkGiQj3quYzuc/6BJscIPtDK2NvHiszwSUf
         /sp3wMw7vwjA9ifRU48zIFYkWsCZE6YGL9jsvD15kqLpnDEX49SB+TSs3KKcwaNaZxMr
         LAMLJyLM1JJ8SOsbGS1uJRyGfmPI6v5i96OIwLxKWsi121Hr3QMZq2ajgvelvQC3Rf2n
         /CVf66sLG7VjE4yPEFgOOYX4EKmRDmm+IDvaYzfjnWxOE0EJjsnRKESt3XMb8iDectqO
         ybp337fIz/MHkqv/ZPxDqUB4r0CoNSCLd6KRvh7gBqMr/06XuhyNJheT++h9uDr4wYYQ
         83gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cZYLUiM/YTmEl6yW0I3nfYFoQTR9WUJtLxN/+BkcgTk=;
        b=eRPmoWNKekQuSkWx3IQw6/9epLXPqGxe6WxB7+eEGZYi/i4L40SO69SED2p2RmhB0+
         HmWsKqSDvVW3EtEdaWBgQiwyegowTkBsqsRNGluoi+JP6bzTc3kA3KHZ827oyTwF/Znu
         hCBeR/IQS8EVRnJjLVam68hyvttjJBFG5o6V/Nm/vI9TGuYnakmatx106TWGPdA8ROv5
         wrfzRSIYrfxFES5Nyv6GfEFoaezUrp4d4gj1w+LqLYq0OGHpd1BHGhluDdwXrRtHoopN
         TAbLBx5aqwwNls6Ih/I4mrOipqqYMa/AnWEFBQzQjt3L48z5uwsAe5MDmsHjJ+1Kr0X1
         g0zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=pTpYLoFj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si3343260qki.714.2022.02.09.01.12.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Feb 2022 01:12:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=pTpYLoFj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:41244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHj1I-0005K4-Ob
	for alex.bennee@linaro.org; Wed, 09 Feb 2022 04:12:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHiyh-0005Fg-QB; Wed, 09 Feb 2022 04:09:32 -0500
Received: from [2a00:1450:4864:20::333] (port=37745
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHiyg-0007rc-A2; Wed, 09 Feb 2022 04:09:31 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso2750551wmj.2; 
 Wed, 09 Feb 2022 01:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cZYLUiM/YTmEl6yW0I3nfYFoQTR9WUJtLxN/+BkcgTk=;
 b=pTpYLoFjW671v7gvIv7TxDaBcUmPe8t1tGWWgLvc2NLPS2CRs7QF3zB/WUI3paeYBY
 hPlF6w09lBew+BPpiS/Ov5Q6+MR3Q9wSz2aVlzGPgVydIu70cZdE6mqK6iPHbFHoylNv
 obyPzsLtrJ3vN9aRiFwvspBR8UYEeUcj38iJ+vAjE0MTIs3tfKmZiMVOCeYRFGSxo0hx
 0Chh9y8nDKijuxZGqpD7oNzake7Ziz/kPl1zZxWrYgglKGBWsgwH6I9GFOOrxB7RWy1+
 PN7RftqY95Mrxmni0eQ2Zwwx6tylTnrGPvcZlV1U11FLdfJx3jwkg41gBBkbKHgarSns
 Q35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cZYLUiM/YTmEl6yW0I3nfYFoQTR9WUJtLxN/+BkcgTk=;
 b=kPJ6IBTfO16mNxJeX8d9/4Tp1Z8SgRXyz+613GM+WLnaLVIHOmmNIZMdYh1oGZF1VG
 UL0WAFZfO7SIhtqlh+t+HkhIyuHCwvwvIvXoEx600hejshY0DgGQXEbWVbHXcxwBLECX
 30XBGZoXQnPKDFL3Kju0VSWlGFK6TnrFrS/Wxbr6snguJV8wBUMc3QnN2DStSZfYlYkM
 mqQw8jvAsRZNkKpiAnFuuBc/KZJxCrgESRLpzlzlsTJAkMoS78tn2ojUKvyxymId8nOi
 bOz0KTP715V19KqIhO3UDpPnTzM6Oxt0HIXDbxnrqWATmPTl+ma+pFcA4aw0FDM7puds
 lZQg==
X-Gm-Message-State: AOAM5325BV7x3hiclrbsLs+WTykOshHFLrmOI50QAdMHnahsD1qlIaIg
 SmAPCkVSUPujeilg+h4iB9U=
X-Received: by 2002:a05:600c:1e09:: with SMTP id
 ay9mr1158606wmb.162.1644397766824; 
 Wed, 09 Feb 2022 01:09:26 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i6sm16417259wry.33.2022.02.09.01.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 01:09:26 -0800 (PST)
Message-ID: <bc6829d9-58ae-9fde-2c8d-756ac4eccb77@amsat.org>
Date: Wed, 9 Feb 2022 10:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] hw/arm/armv7m: Handle disconnected clock inputs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Richard Petri <git@rpls.de>
References: <20220208171643.3486277-1-peter.maydell@linaro.org>
In-Reply-To: <20220208171643.3486277-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>
X-TUID: NfqmVW9aASW3

On 8/2/22 18:16, Peter Maydell wrote:
> In the armv7m object, handle clock inputs that aren't connected.
> This is always an error for 'cpuclk'. For 'refclk' it is OK for this
> to be disconnected, but we need to handle it by not trying to connect
> a sourceless-clock to the systick device.
> 
> This fixes a bug where on the mps2-an521 and similar boards (which
> do not have a refclk) the systick device incorrectly reset with
> SYST_CSR.CLKSOURCE 0 ("use refclk") rather than 1 ("use CPU clock").
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Richard Petri <git@rpls.de>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The other option would be to have clock_has_source() look not
> just at clk->source but somehow walk up the clock tree to see
> if it can find something that looks like a "root". That seems
> overcomplicated...
> ---
>   hw/arm/armv7m.c | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
