Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2078531lfg;
        Mon, 23 Aug 2021 10:48:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZGLHBYJ7wWQYAM+lPoqsTQa73J+rkBSkujj8rIsyH5azDFGSt0xz90zsxZbQdbcPJ1L5Z
X-Received: by 2002:a6b:5819:: with SMTP id m25mr5241203iob.105.1629740907516;
        Mon, 23 Aug 2021 10:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629740907; cv=none;
        d=google.com; s=arc-20160816;
        b=pHSztOYNcElIgzgVXCfkK4d56K26YJKW2EKsBtmzujWhBNLEb5VXURjjjaLGJPfNtb
         SMgUTdyP2VzQ8YqavZQTUtiU/bVpmuovyPJ7X823fnx/XgZlXWPDbQkKUQDWzIyy7/lp
         DsdjHIz6LLbZvQ0LdK76LGUSQWjF4Uu0/OmS5xAte5qldRWHr5zxpFBrZmVKZ+Xa7w3O
         4eNBqCr+KxCXSxSNVf/kwBDIBAI04c/AhjLce1gS0VQY1pfPfFfK51L46jKuFf7p61RG
         3/Ge4GtspdL1Vc+VJN3QLeSobGowV+qSaFucHZSw/rjqNmK5Re1NkKsmUPlGq8/FiHLa
         ND0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GTgUpb7apRaTwIjaie1ZD4pBiMyhG4QD4dmR0+dcu2g=;
        b=0hlcmEgc5siw02m4EfXlG9yVcnD6xPKs9RB7KYnL429MyTdMtGvcu2eBK1FBEe6VKa
         wtmMgetJrQ21gzysmMbCEInJxpg6gm4IRifo73WSiPFJWCQ8VUjuvxtf4iToSta4PZs2
         G2+iQR9qct9d0T7ilDIFuqnlj+Xb5aOqWEfgJZ4qtDZ4W4XuNfp1cO8U3RUjqvenu6DX
         onz3UoaXGus/oNiorMw6W8x47TLMJ57vsF4lg9aN/QV0pxXbMHkNqOb8+gXHaSZtVSC3
         Sla+UqbzPCdE99sk+Uw4/MfFHB6ziZ3hJwLl//KM5HKxrN1tRxGQrEJMMpHWAyWxPkti
         pfBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V6d01Ia8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si14532931ilj.52.2021.08.23.10.48.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 10:48:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V6d01Ia8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIE3e-00037C-Ry
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 13:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIE0m-00008w-0h
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 13:45:28 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIE0a-0006gT-4i
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 13:45:26 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 j4-20020a17090a734400b0018f6dd1ec97so481387pjs.3
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 10:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GTgUpb7apRaTwIjaie1ZD4pBiMyhG4QD4dmR0+dcu2g=;
 b=V6d01Ia8K6e2HhY7eOMlNArExObvc6wG64sizxYlLZgu70Yi4wikQqOnhRfnqLcRZu
 z0LI0tUtIEi9gn5L5a7QBEOeauHpFAiZmXIulTJ3RazvXetpFpCGNl8ziXEk8oY/SeBn
 RzKtkAq12VfJENFA92SqPWWILB313vvkl9Pn4MoY8llcYBP5ZrOFhA2341HXLFhJtz8i
 OeNQXWaioOBRA4QASJGsidGt8wOgD5W5iZAzEmF6EI4KaOYZII21sNWZMMx61aq5t457
 Gv8oTk71CME2iHqsE3DXl6OhEzf5nM9SKR3g2nI91AirC1vTskOZSaEfZHToscRrY7JM
 KjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GTgUpb7apRaTwIjaie1ZD4pBiMyhG4QD4dmR0+dcu2g=;
 b=GEqmKO9IHltv9gAepQWyqxQ6EI0hmPu5gRb3GzpQE2lqB5nzcl/LRWzWiTHjNXRL2I
 TwE+DdEl5LV5N/oC3QUdUNnrfTCUX/G560HDHVTqincptv2KsX5hlTo5K2N7VjwzUTme
 0EXZpVg2T9q4oQf3n5RBQBQhzI39a1xnXP1w+0N+F0MF1YgJo3bX49C8JGbAkMYEf9h6
 UGgPfMPcsNDbMSHocMJcjnCOdhp34exdxCCYuAi7cQjVrf4uw8tTXYPrqlmY96IKv8SE
 HeWmmSJTal/rWm3bv6iPcWI/Vsz/SpnygqmBR734p4Gu6nu0oftgLgIlVX2f6z6NC0kj
 VAYw==
X-Gm-Message-State: AOAM531OgqXPTFt1eo8ndkh7CoAHpNRFCNmDNsnYw+/Np+aT4qrrk/LA
 zSRIPlpM99I+xrLe3sHz4YBkRg==
X-Received: by 2002:a17:90a:b016:: with SMTP id
 x22mr10247921pjq.205.1629740714742; 
 Mon, 23 Aug 2021 10:45:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v23sm4280276pff.155.2021.08.23.10.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:45:14 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] target/arm/kvm64: Ensure sve vls map is completely
 clear
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210823160647.34028-1-drjones@redhat.com>
 <20210823160647.34028-3-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc71bb26-a18c-a2e8-d1f8-21bb93e59c53@linaro.org>
Date: Mon, 23 Aug 2021 10:45:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823160647.34028-3-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lqc4uw5KRbEc

On 8/23/21 9:06 AM, Andrew Jones wrote:
> bitmap_clear() only clears the given range. While the given
> range should be sufficient in this case we might as well be
> 100% sure all bits are zeroed by using bitmap_zero().
> 
> Signed-off-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   target/arm/kvm64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
