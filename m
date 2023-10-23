Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1430478ejb;
        Mon, 23 Oct 2023 08:09:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoJs+68wWcYGBDPGMOEHOMww81UYJP1YEH0Ybl0vMZC0IaZtXSUj3XMKspqDWzJWKJUcqr
X-Received: by 2002:a05:620a:4088:b0:76f:1614:577a with SMTP id f8-20020a05620a408800b0076f1614577amr17727948qko.5.1698073798276;
        Mon, 23 Oct 2023 08:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698073798; cv=none;
        d=google.com; s=arc-20160816;
        b=gCN1BO2cI6mWYSmiZAQe0nc3nER2f2kz2SR6HBVkq4KaBr/Fn1khV+2HafUQY5LCvb
         BreqbqF6mskussUTUpxZR79E2Y9diOirv8x+x9TgBt5JcPOesg6JgvuQiqQvcm48aHcD
         Jz7btnpNuSAMj0LjxqdthZSmUldSW4QMf3iz+PaX/N+R0YwUbNQu/z/5h9nC20NwxukB
         e7I2Ku7MDYvg3hLZnNPUBZAZFN68JC+19yVdJhR2F9NTbzGcCU+iKYJt3ODIwlmnjwVL
         WFp7ySBNhQXVN3Jx7vlf4XUYtilviEFERLeXCMjdOtweQcMyLVGbLkJkLGr1nyDONLY9
         zSCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4kBmqv5WsJlz2C+5Eo2ECwrJUekntZpwTm7LVzlQXoo=;
        fh=63fuqXWdafnbqVGIWl8IQUGmwh8qKCI6VosO+FSh+Ss=;
        b=x+QOG1NinJOUC/SH1wWW5pdbLCN++8zEbkX0uVJBl7E3waMiL9l1YEjbXCbTe7PZcY
         ZigbYFZfBOql1JMLRiSSMss6btXtMn8BB0eS7xMc4lWZmVHNlvffqqehGfZQzjrshjr6
         Q5aET7mFphWv21tZXZzVf9tYhlrIIs0aeuoE8+Ol4p7QthU+/nMkrMz2zNYTlDlThApN
         nFRB1dyK38Ceb1IM6E3X5BCp8Vs6krPW7Fz6D24GhnK4aIa3HRMgzALPkAQwdMzDL5Yf
         xJ3+jDD1DcnYMmuA6xddv+L/A0LudleMYH6vHGL6WCdhPiQIIZWal/R/9a4kLfcBc6Cj
         Q2mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zTHyhrSk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3-20020ad451c3000000b0065af55afb2bsi5621270qvq.469.2023.10.23.08.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 08:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zTHyhrSk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quwYu-0005kL-LC; Mon, 23 Oct 2023 11:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1quwYt-0005i8-8J
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 11:09:47 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1quwYp-000673-Ri
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 11:09:47 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9ba081173a3so542554366b.1
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 08:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698073782; x=1698678582; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4kBmqv5WsJlz2C+5Eo2ECwrJUekntZpwTm7LVzlQXoo=;
 b=zTHyhrSkCvoa569MRj8gudzwEEQsS1Ev/VrcgUMwJRWAg2pPOf7l0tS+edGqG8RFZr
 RHWS2Ih5unyJtVmgGZPXtjh3Ha6EMJJHrAB8xE/RAAUB3Jq48merdAytiSkrU8LA6QhX
 fAevEmKATd1fopzXI48rkfnuU9jUFyVFcPDXShwXAqi/NpXT9yUnCNLD+Pa7n7HLhK8d
 2cEpFW4SsAGAlMOlXMJqEEnWlUHLG23AkPZZjPDgXknNYDuJ4jnl4fyGVBvqT5qQ99Jt
 tIyllMwxNpDe+vLlUUtqvY5kpL9dD0XpAZ3kCK8GChypgv5OgZ8IEvxXp2mw2/b0NtgR
 pwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698073782; x=1698678582;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4kBmqv5WsJlz2C+5Eo2ECwrJUekntZpwTm7LVzlQXoo=;
 b=ubCsgfakg/SlAknkbRFTeo+oixhR8f7QFFFAluZJjcHM5ul67LAXkTyjhECy+pC3gW
 0Y0MK0ZHY8YXVY/8JW6EP/gfsc/x9rrjXdqDhBAyZpaY6Y8lPlWDDGQaX+WImVy+dKBX
 OLxAqLUCoXtesFYVZkZ+PdzczoQLdzQjP20jXqkW88R6koiUe3ZyMOAqSgBSm+nh950S
 DDpua1+3iZnZ+p+G2pa2i34bk4yYkFbQck7WoCHpYV+lfKQBaIoTurjrB+icXRdIRDtq
 GnnSH6PdZ7yffnEDPBE+Sn5PnSh1lvKcmsN2UNtOXzNM5ZBvrP1v06mC5Ies6+gBjCcH
 6gTg==
X-Gm-Message-State: AOJu0Yy2DbEuI2kdRbOefEjVTQeDbRXrH2wVW+CBLCUh8txzhml1Ec9X
 cnBTlovofaFpZXtAtv4ERYMS5Q==
X-Received: by 2002:a17:907:9815:b0:9be:7b67:1674 with SMTP id
 ji21-20020a170907981500b009be7b671674mr8253518ejc.3.1698073782286; 
 Mon, 23 Oct 2023 08:09:42 -0700 (PDT)
Received: from [192.168.69.115]
 (thr44-h01-176-170-216-159.dsl.sta.abo.bbox.fr. [176.170.216.159])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a17090613d100b009a1a653770bsm6692588ejc.87.2023.10.23.08.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 08:09:41 -0700 (PDT)
Message-ID: <43e3492c-4c07-0542-20cd-8ca8af6e6277@linaro.org>
Date: Mon, 23 Oct 2023 17:09:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 2/7] target/arm: Use tcg_gen_ext_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, laurent@vivier.eu,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com
References: <20231019182921.1772928-1-richard.henderson@linaro.org>
 <20231019182921.1772928-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231019182921.1772928-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: VKK9tlLonQox

On 19/10/23 20:29, Richard Henderson wrote:
> The ext_and_shift_reg helper does this plus a shift.
> The non-zero check for shift count is duplicate to
> the one done within tcg_gen_shli_i64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 37 ++--------------------------------
>   1 file changed, 2 insertions(+), 35 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

