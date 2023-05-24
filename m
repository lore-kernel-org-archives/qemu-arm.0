Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2762273ejb;
        Wed, 24 May 2023 12:05:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ68mvob0FDqzbjb/mJebepAEL1xrmPv6K1+8Dt6uV+hMBowFl4+MxaQHPsIgR5rMJTb2cDE
X-Received: by 2002:a05:622a:24a:b0:3ef:5ba0:7038 with SMTP id c10-20020a05622a024a00b003ef5ba07038mr30306969qtx.21.1684955141967;
        Wed, 24 May 2023 12:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684955141; cv=none;
        d=google.com; s=arc-20160816;
        b=DlWHkYkrNy0Z9GPhHQAeLrTm0opJx8nVi15F7hPA4iUBKrFwSLE5T0XaFaLlGujqEP
         Hs0724mKGreVxs43GChAgr7p1rA2qTN0xCxdl3fVQO/GmUBzlXJm/dazySfUPK/YEBrI
         M3wABpnMBM2JjnFbtJ4F2Mgx2nq3lAfpQ1OWyPB67wyHZHQYAp2AofWXHoB9j3/N4uwW
         9AgwBYuh6T/HwdJ3BOogD4ymGq1gwx6i7kijn1D7bXXMC6xEwvj9krp687UaUyTvi0Y9
         fKGvAV/woKDwOX4pUFDGpMGBvYaTDutd8Ga6xfDhAQtNpFVEUx6LiOWeUulmIOepkEA4
         spKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=s1TPa5C9dkS0DgAt4c2JNa2SqnZwy0XNjFqkJf5tBcg=;
        b=ApqPQsTVp3NwMi1Pi8RdzaJXtg0MUqppkUF8rBQBS9KoQxeaKdMkFKl8Pytj6eVjA0
         ZfrHydfeTnqRBorPL/cdtmIoo+qLlOcUBeJ23bLEAxA98mZrHaupKxCIqiV0twcYjBXn
         NGxNlR7R1z4dcp4A5kcRM5LfZOsosAvwwJI6LQQXhowGjo46enkudv8u7RkJJ12EaKvr
         41Rv7qp5gWT3hfxINDDAq0kd1P/RDgwhlwT05GM9ngYRw5fbM8rJOmumrtvD49ElBYjp
         LUkKtdZTZ2uynlFwuebg+KGoC8z6heu6CC0wDJBxcXwAUWdgM9ZPj4gYTli5Iy366zER
         kGyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hXuQ5hqB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t28-20020a05622a181c00b003e3882d4b39si7029549qtc.398.2023.05.24.12.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 12:05:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hXuQ5hqB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1tne-0002GG-VT; Wed, 24 May 2023 15:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tnW-00024b-1G
 for qemu-devel@nongnu.org; Wed, 24 May 2023 15:05:25 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tnU-00074g-G7
 for qemu-devel@nongnu.org; Wed, 24 May 2023 15:05:21 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-64d41d8bc63so1052580b3a.0
 for <qemu-devel@nongnu.org>; Wed, 24 May 2023 12:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684955119; x=1687547119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s1TPa5C9dkS0DgAt4c2JNa2SqnZwy0XNjFqkJf5tBcg=;
 b=hXuQ5hqB1tzXUaX1p0lbbt82VLLqpjq8DkpU3HZIAAIW8l1TkVEyWtfRqIYNentcbr
 VDFirae4s1/nDBd5qgW8qiS5v7JAD/wOVkZQCJPKxJ9VjTtRUtvVFsTwJJRK8hy345qp
 U0eHnXV67QST5qDtqne3sW4icwPoewI8ZYMI79B4WurKqcbflc0wHKVG4Zla4iTc1F2c
 0zu6YNnshwKHv2cupEucvkMewgQbhBYo583QUK0AVOz6AgturEUiq7Nnrq4RMEjCJrGH
 SP5SICKJhsr1xPbPK+WZAQjBpRJ3YjVexQfBhP0I7deHd7TvRPB+h3hc+A7I03By4YE8
 AqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684955119; x=1687547119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s1TPa5C9dkS0DgAt4c2JNa2SqnZwy0XNjFqkJf5tBcg=;
 b=QhJMaaX/MJxfm6uFpfm6B1EGV5ny5TKlNCpq1KTQW4eVSSJhExbtNH4LcMhu5QtGXC
 yKv1blGRN+o7qL7pbDDLZNcntgXqxuu1Z+iFcHGyvc7QT1ZVxuxYbo9haeQAQl/K/2U+
 jtgWjIrkp8KfMkOyUiTOEqtUCgfrTOyJpkLT7uc8n5rQVkjThgq11OcXipeB0hcduKfO
 OkwMNdCGq9IB4iJe0eJiCDI7r3xnT3EvutQALnn65agNd1OlkGLrSN80L+4Qgk3buxEV
 0WtW/JrZRgTBx+OsSHj1YJ02KWaZy3Z7m4lDAZ/0AUP3mFc6kXR4lnlBvIaxfcYO8/vb
 Vu1A==
X-Gm-Message-State: AC+VfDx50ug/nT7ryXOKpf/PvYqwFnWY9PnWqEeB/997M39cOAd2SZW/
 7tCKFetL8C6YjJtcQwu2Chl1KA==
X-Received: by 2002:a05:6a20:144e:b0:10b:97c8:2e16 with SMTP id
 a14-20020a056a20144e00b0010b97c82e16mr13502740pzi.29.1684955119123; 
 Wed, 24 May 2023 12:05:19 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:6b03:9af2:33c1:3d6b?
 ([2602:ae:1598:4c01:6b03:9af2:33c1:3d6b])
 by smtp.gmail.com with ESMTPSA id
 g4-20020aa78184000000b0063d24fcc2b7sm7797245pfi.1.2023.05.24.12.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 12:05:18 -0700 (PDT)
Message-ID: <00a4d515-2524-3814-47fa-2a69bd863f4b@linaro.org>
Date: Wed, 24 May 2023 12:05:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 04/10] hw/arm/realview: Factor
 realview_common_class_init() out
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20230524145906.33156-1-philmd@linaro.org>
 <20230524145906.33156-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230524145906.33156-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 0ORACJj/AqK5

On 5/24/23 07:59, Philippe Mathieu-Daudé wrote:
> Introduce realview_common_class_init() where we'll set
> fields common to all Realview classes.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/realview.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
