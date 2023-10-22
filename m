Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp891919ejb;
        Sun, 22 Oct 2023 09:55:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoTUc5bLVyD6342HW3xRZaN2UCT8q3c2VAe7IicwcnpN9GliN0Y0/SLHhrc+HtBmo2WwyL
X-Received: by 2002:a05:622a:1653:b0:410:ab6d:54da with SMTP id y19-20020a05622a165300b00410ab6d54damr9143340qtj.16.1697993733799;
        Sun, 22 Oct 2023 09:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697993733; cv=none;
        d=google.com; s=arc-20160816;
        b=OVcY2K/Jo9eyNQrN0u7D6zA2838D6zKoYkQJ28/+rhSlJU3yKb/3iITTKdMR/0AUbB
         AO//RmhiqcBHBj9b+tRvfZkhYZugQP+Lp/sr7EDpaPXQFNetdKd+1Kq/TwU6xxNxEHfi
         JHuN1sFs6K8oLNBqRAWCWQPUbg5NxQ/DRr8dehLmTHt0IF/QbRfInStjTyd2DD9M6E7J
         OxjIi+ITQXtyZdVqiK5ZbfVuPGcYGmBpZJCm9DLMbnxeQm8gibUXmzuvZRm4hnxiNSNd
         C9DH63DI5E8+9T3TTFuQLTNWBMFSdhO0aYGbPqGx/6qyV+D9NCSmxVbttktYrzXJdUgq
         KHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BDw0R8bcPDYhRrIi/2+xqiqr1ikkeKjjUD451Pzb01Y=;
        fh=k4iButtuj8hEc/Hzb102WV+ymnTGT+2i4lFe9Di6uCY=;
        b=N9r9lvXnsz6t/gn1MePwjK5TaIdeGlb46ov8R/R+xMCzhFGqasnMgdEXWD39fLZzhJ
         lkpsAVgDDC4t/3Fpr2QaPgCHjs+Tn081cGCgHRUpXLn1YEphEdnh1DW0rqyNOISwtwa7
         LujlvH6yTEg88YcNo6mCmCCNjM16e9Lbl6+70Nqm8iYsAbmBv3H/uHuSjcDhnhV3oYfY
         zSrzwnO5htac8IwJty8fO1oXlkKxFimP3YqLa2I6ZSTBwUVtxKT3CnuQQ+07ko6ffKpY
         n5liKRpRLyk4qgqQOkNCmsQbWH+vstWKVqnZVukecm09Bqn/ZeBcdNMCiSY3Gb7d89ew
         H1rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IU36V1O+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020ac85d12000000b004181e1d50f9si4494967qtx.549.2023.10.22.09.55.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 09:55:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IU36V1O+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qubj7-0001RY-Rj; Sun, 22 Oct 2023 12:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qubiz-0001JK-73
 for qemu-devel@nongnu.org; Sun, 22 Oct 2023 12:54:49 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qubix-00034U-Nt
 for qemu-devel@nongnu.org; Sun, 22 Oct 2023 12:54:48 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-27d11401516so1530506a91.2
 for <qemu-devel@nongnu.org>; Sun, 22 Oct 2023 09:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697993685; x=1698598485; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BDw0R8bcPDYhRrIi/2+xqiqr1ikkeKjjUD451Pzb01Y=;
 b=IU36V1O+ISrmxGnY8m09N1e+98ihvfxQAheBb5akHoHavqmNqwUZkcgRzaoEK9VPm1
 dmBC89xPXnkN1tziONzKWpqM3o5BQDbYxHyPuqVWjODvJbEc4RYe42RRCECsvWrgZgnc
 fBBpNiF2mKs/On9TLL92MxUgnzQUaKCiymFMQmrnTR9ZMatxIbkcoky1l4UtaZ2i1Uct
 1uPCjDvY8j8d0kc3k2ioQ1m2Ypf9GcTeDf7NwYYnMzu9wt4UtglyWYR93Cso7sJVhg6E
 nSpNeM8oANyKAXzvzmRsMMSqwOSvJHstuTnR+F5P8TKigqOd9NtzULiVGzYcSTQu1m4F
 Zw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697993685; x=1698598485;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BDw0R8bcPDYhRrIi/2+xqiqr1ikkeKjjUD451Pzb01Y=;
 b=fezgqZR1X8PClK5hUopV8lGc+B50DGtozSSdmWAYfMeo/8dRkLh7teCxEGZ8yGdYKO
 iiXHFZq9p9LpGFvATHxOhn7hI/3PIcl6PoknIBTCT7Y3w/k8k0btkN6DS6DjFHm02MR7
 iI3RoGGaIvwZPujONl6F0qyq14JkWO5VatSHYC/83OdEoB/lkwKn75FdVs9WuCcKarp/
 TfmyTxmhJ1tyeXDQvHlGHlaf7+BKxQmRGkBHtHj0LYX6w4XlJk8ajHDCW+oG8SO9CCq4
 w3TiqLX5whpgC1bm8OQAlh5ORh+42dj4cm8het0mI7+kdgOzL2mX+12iJvSKz3lOzltg
 qvJQ==
X-Gm-Message-State: AOJu0YyjLQvR2YhWJ8paTBoC6xuaYwcbvjHbYogHDtpm2Jc7N2BKsKu0
 uAR8+Zb9GH8EcH5dL859p52tpw==
X-Received: by 2002:a17:90a:d450:b0:27d:c36:e12d with SMTP id
 cz16-20020a17090ad45000b0027d0c36e12dmr4810344pjb.6.1697993685430; 
 Sun, 22 Oct 2023 09:54:45 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a17090a2a4a00b002790ded9c6dsm4934130pjg.31.2023.10.22.09.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Oct 2023 09:54:45 -0700 (PDT)
Message-ID: <5de741a7-aca6-40e5-916c-25153cbb4fb0@linaro.org>
Date: Sun, 22 Oct 2023 09:54:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hw/char/stm32f2xx_usart: Update IRQ when DR is
 written
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20231020170009.86870-1-philmd@linaro.org>
 <20231020170009.86870-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231020170009.86870-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pumjyUhTEfM9

On 10/20/23 10:00, Philippe Mathieu-Daudé wrote:
> From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
> 
> Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
> [PMD: Split from bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/char/stm32f2xx_usart.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
> index 46e29089bc..74f007591a 100644
> --- a/hw/char/stm32f2xx_usart.c
> +++ b/hw/char/stm32f2xx_usart.c
> @@ -169,6 +169,7 @@ static void stm32f2xx_usart_write(void *opaque, hwaddr addr,
>                  clear TC by writing 0 to the SR register, so set it again
>                  on each write. */
>               s->usart_sr |= USART_SR_TC;
> +            stm32f2xx_update_irq(s);
>           }
>           return;
>       case USART_BRR:

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
