Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2766754ejb;
        Wed, 24 May 2023 12:13:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6gPJ4i+uLCrK+rY2Pu0UyDMvm0ouZyhDMQ0hfC384BM4EW56iDAxRsgpckpg2fo8Chl/WL
X-Received: by 2002:a05:620a:1aa1:b0:75b:23a0:e7be with SMTP id bl33-20020a05620a1aa100b0075b23a0e7bemr9274836qkb.31.1684955584462;
        Wed, 24 May 2023 12:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684955584; cv=none;
        d=google.com; s=arc-20160816;
        b=Nxoyw8kKpmOVKOVFqV9+QS8jh8LltUNmuCBJLNz2vHCQ517myF+ZfY6KGzC/928v9Q
         ekRWYFEUWt7jg/Xk2r3M1MMfecFqOrH4BcQJ+yGH0fnKHfzDiH/NjknsQjFOb1sUsSw+
         4Gkg/uci24orIARkaUPMcmnujpIdRDTkKrFOiaJUp35yxfsImLeNfirLQiS+mlE/R2Qs
         kvHJ8KPNepyGPuXycEei294Cbtob1m6Et5iC+I006jqfjHl4VzEK1u0F0AUHlqGqUIzJ
         KWd9f5oVFKgi8wzoWpNAt8lsgpXliGemu+ZWWYA/0q+ZHGXif0X0LdRwIOpiEf0ouGaM
         B3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UZounCEO27Aq4lWQOtxxMwNa8G+Q3HaiVnHfppqs2mY=;
        b=IvsG0lq6DwHDr3HiBsbcZjB3W692AFxg3R5X7s7lV6AW3dUYraj+tvgYnPvFU7+z3o
         V6u/Jw81eGuXk+8vhffC64zW+CTWH7vv4nc9jRc9WESxlAtrwM1yCsnkioG5BFbOFOfA
         XtKMheInO0Rgpaejac80fY9kmV9reV0T6y8VVrcDRcAb+iAGKdsgavpqrzDHaNvS7tIE
         /mpJqiN3R773ZuNHu3Nd6YFBCIro6tgcFev9IJqwMbSWbP+TQMTQlIi9MvjocmhygU/5
         NrYY7wd8TrkhHRuIjHIZQ7bpcH5q6tqulf1zwxvR7uhtlBMX6x4GykNmLG/C7QuNUewT
         VHvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BOjZQvjX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pc41-20020a05620a842900b007463cdd2a59si6612085qkn.675.2023.05.24.12.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 12:13:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BOjZQvjX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1tup-0006mk-0w; Wed, 24 May 2023 15:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tug-0006l5-GZ
 for qemu-arm@nongnu.org; Wed, 24 May 2023 15:12:47 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tue-0008WK-Bv
 for qemu-arm@nongnu.org; Wed, 24 May 2023 15:12:45 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-528cdc9576cso517789a12.0
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 12:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684955563; x=1687547563;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UZounCEO27Aq4lWQOtxxMwNa8G+Q3HaiVnHfppqs2mY=;
 b=BOjZQvjX/MMsF+CMMXzIoYJ6My3Ii5wcZxeZZ3OmFxZfrKmgSeysmV4UIuUGl+Huek
 xHJtjeyTykHoO2vhidWerZy6mQIgCrODKfi8rD4bvQ1Gu6dj9hGOQKYbsvPAckoEQc+1
 2mK41P9lb2M6u3rxtb9KJQIZPqF4xnAJY/XOILSqiDfjBUQOFc+m2a7d3pNkCzDZDatN
 wDXA/j2L3Cg4WLutTgTLY4J9OFVbaggGWGCDRbHsp6QiGidL28oMgVtMHhUTWOeT6vKY
 zmGIBREJIUql4nSdrTofiwq+i/M/88rzCcTT0vNPptP2yTedxfz+WiyuYy41MUNU0Q+U
 zh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684955563; x=1687547563;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UZounCEO27Aq4lWQOtxxMwNa8G+Q3HaiVnHfppqs2mY=;
 b=axalTObyJbDdYalcLFgRp+LupwnDIDAct2SoVDzSntgbb4vDhrsFgaydrT61GEP5Yx
 3afHRFRUWiOACjbbm2v7h4gjJdN2/bDrY862p30lqF9KJxkNCAHa7gwBlmCvNxiHq6Yc
 5YLYfOSedoTJNLAD5+KMNFBnF8kquPh2JQIfIWCP1aJS3usidcI0JjSDb1U1JE9bWB5Y
 29yYi7sqsVP0M4WlafRwhSQCvm4oLUdPbrYz/5L1HujGF268SpkW0ClHA4sx3MriXze0
 vwCI52/LB1nseNsSO66uDSKAugQE9yxv+Oe38FgRelkt6opT6YrHU62ztDzY9Xt8oQ1A
 fgpg==
X-Gm-Message-State: AC+VfDwRkp0NoQVgeSQ7m4SNWO4uPJ8rVwOCY615outpi2qLe/IkvSzQ
 KbgOU9wV9skZbUoabP4MkZhhuA==
X-Received: by 2002:a17:903:1d2:b0:1ac:7260:80a7 with SMTP id
 e18-20020a17090301d200b001ac726080a7mr22939103plh.43.1684955563001; 
 Wed, 24 May 2023 12:12:43 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:6b03:9af2:33c1:3d6b?
 ([2602:ae:1598:4c01:6b03:9af2:33c1:3d6b])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902748a00b001a67759f9f8sm9103687pll.106.2023.05.24.12.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 12:12:42 -0700 (PDT)
Message-ID: <f5c0fcdf-52f2-f2fd-61bb-bcc5d0253844@linaro.org>
Date: Wed, 24 May 2023 12:12:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 09/10] hw/arm/realview: Use generic
 realview_common_machine_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20230524145906.33156-1-philmd@linaro.org>
 <20230524145906.33156-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230524145906.33156-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: /BU/+plaBOzT

On 5/24/23 07:59, Philippe Mathieu-Daudé wrote:
> The realview_board_type enum is now unused. Remove it and have
> all instances use the common realview_common_machine_init()
> method.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/realview.c | 46 ++--------------------------------------------
>   1 file changed, 2 insertions(+), 44 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
