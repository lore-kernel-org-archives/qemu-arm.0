Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2763266ejb;
        Wed, 24 May 2023 12:06:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5WQKiL0Nff987geQImbo4vAC9mRCjANj/LxH+pftfltgrOvxk3HkZRa6QVktkWQSx7SagO
X-Received: by 2002:a05:6214:21e9:b0:5c2:6493:f631 with SMTP id p9-20020a05621421e900b005c26493f631mr25313904qvj.51.1684955218798;
        Wed, 24 May 2023 12:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684955218; cv=none;
        d=google.com; s=arc-20160816;
        b=AE4fCXrqK1SmtWZK4kUeLEHLIYtzbt7GX8RgyAN6OntGcqddLQnvod/K6tjmx/cF/1
         qtbqijXYqvuOQGYSxJsd0pdmkkfJlbPS8XTaj+UqxpHXNxCGFvledSYLodT4ke3in11A
         uCaqQVYSxGP9cKjz/PNclFvYpM0kw8/inNllfsJ0GD5oCbHCZlQ9ry0W2naxHfKBPy0f
         qDDWmT+SKHo3VORsfNXbbj3Gb3AV+8Rkjomxmdb6BSv9J6BZJOhJNFoJBaBagClG7YhR
         3shc1djzf0PPR0iLIA2kyCpQh/StFNmHpBlRIxxdL+ZH+0IZUSkGJ6m/mLrtdleg4d20
         1/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p9bdCH0rr3Qzd9En3mlFlRjDUiyvkssUGWlCPomvkcw=;
        b=J+5Es2Zlopx6sDRnzfzq6Rvr79x7Igd4IkoavAiMYedaDmXnGB2DGbcs8M8L3JCayX
         1q3L2EqdgbAyRUjlZxJokw71FOqK3UHGEfFuv7mGxWccHiz5h0ghv4UsxPbk/Vs4InTZ
         M3h/T3lcwGCdpI76aMT91TTy8Hg33Dj0mVjXJ/LSPTNhufybnFNCX+w6TP9Oj+VJb1Mn
         SKKwi7Tc+UNjq5YPMH2EUi7lD9bQPKmugI60WsiwRK8/qzj40KkAKnPngOQzN9fBDs+S
         fIN8nbDUlWQn/OSVAErNh201WnIAxYvxXKeDsl9HFbineo0Z3B3m7Q6FVuUhLImycuSO
         gnnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSExmUxA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14-20020a05620a126e00b007579056467dsi6664148qkl.516.2023.05.24.12.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 12:06:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSExmUxA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1toi-0003HD-KT; Wed, 24 May 2023 15:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tog-0003FJ-Se
 for qemu-arm@nongnu.org; Wed, 24 May 2023 15:06:34 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tof-0007O8-Cu
 for qemu-arm@nongnu.org; Wed, 24 May 2023 15:06:34 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-64d3fbb8c1cso1394875b3a.3
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 12:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684955192; x=1687547192;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p9bdCH0rr3Qzd9En3mlFlRjDUiyvkssUGWlCPomvkcw=;
 b=BSExmUxAMQggFjHT3V17NdJij3+1dpUXwx5UnWquaZ28dcKa/AOC17gz8TXsbllZ2L
 LupKipopkumre3K8omstm6igx/74KHWK26Ghsxint0oe/YP+4PU7zw84z6zgvK0u145S
 wU/SrM/S6sbvH+BaCBA+MM32MSklToubL1KNL+1zsDqnCVnEesLxkYlFXdkZgnH0FseO
 K0zhU+GxoqEPVCSDZDiM7WJgNBm00r2VuXlKF0QaQvxy/Jgn0rzKRpjZya3CrGsEY2ss
 1sVxb9MICCSjz/v5UNjjbkvuKKmV4oT+Vg+xNcVsAh23d8kbhOc5o98j+0brm2mQHrPD
 GQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684955192; x=1687547192;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p9bdCH0rr3Qzd9En3mlFlRjDUiyvkssUGWlCPomvkcw=;
 b=A6gXgbIHHNrXanudB1lJickMIGjCEkl84Gr171G7CteoNeWWz/Z8O0gAE6SE655ZCE
 sX4ZiZTvG5MfXHNsTz7fODYJd91dkKYrVQBEQSPEXdD4YBZNeI9doeDKfbJ1d2Ve63GN
 38b4drLHAtrVQj/w3X2ojX3Ulcz63KOvG1GxpMfGzgFrU3bZjRI2BkR2IZCqCT5nmuI2
 xpF1+2cOwYW38qBMpt4GA6IXExEYYihXp/YyodiYuiKvBxPIBunapJ+mdp38berNahW/
 NG4ieiLDIRLmDRMO+nstRlVTG8r87KKOEY8gZQoGoA4Y5hvezp6suDLtaEEQG2CBQiff
 e5pg==
X-Gm-Message-State: AC+VfDzVh/0Tcv/5L2uuvpsTj1n5g3EIq9gCOL2sFo5rkczA81MY/0Dz
 +AmDEppVE6D1l4czP1GkhytVuQ==
X-Received: by 2002:a05:6a00:cc8:b0:64d:7162:9cf0 with SMTP id
 b8-20020a056a000cc800b0064d71629cf0mr4553772pfv.8.1684955191994; 
 Wed, 24 May 2023 12:06:31 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:6b03:9af2:33c1:3d6b?
 ([2602:ae:1598:4c01:6b03:9af2:33c1:3d6b])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa78044000000b0064928cb5f03sm7768408pfm.69.2023.05.24.12.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 12:06:31 -0700 (PDT)
Message-ID: <9a524656-6e69-a044-3303-79b7a7bd1c10@linaro.org>
Date: Wed, 24 May 2023 12:06:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 05/10] hw/arm/realview: Move 'board_id' to
 RealviewMachineClass
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20230524145906.33156-1-philmd@linaro.org>
 <20230524145906.33156-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230524145906.33156-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
X-TUID: 11bLOeK8VtbW

On 5/24/23 07:59, Philippe Mathieu-Daudé wrote:
> Instead of having each machine instance resolve its board ID,
> set it once in their class_init() handler.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/realview.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
