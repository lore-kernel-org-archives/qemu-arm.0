Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4963694lfa;
        Tue, 3 Nov 2020 08:56:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXi7SBo+BJTcLhYmm3YJyDX/T1mH7j4udbi1WY1gIDIlt4JF3YoxqpEXv5kJCysJ6DwwQj
X-Received: by 2002:a37:4e42:: with SMTP id c63mr20011649qkb.293.1604422613911;
        Tue, 03 Nov 2020 08:56:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604422613; cv=none;
        d=google.com; s=arc-20160816;
        b=vc1y9FkTdi8Kh7jbjBhpxmJD3zMNF1g6re/fJydqjnfTsToMylTiAgA0YcabZCSrMX
         g8/yyEXpnzUUjqIrHuSs0qIh9zTJO6giFrjikCd8333/pcW7DPLfDkpcb/21xktl9rtW
         4ynvGm1TyOr073Qxd70O9xLLTYnJbfQu9yHU+Bfd5nh9LJ1oaDFAJO22sjerNrijV8fW
         yHT9Ew8TigNNLcJ3+CVCUcm0dBq0oiNLUH9TiXvgXx7BlBz4l2gSKKVV9HSUVllpNgUV
         MMakq5wEwO/SGj+zkT7kWPNoEhcoleGGhwcWABqFnL3uDShKMay6dOAIyKh33eZC7zar
         u+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Dg7x18WPma1VvH4BjHj7HmfS4Xe3X5EsexEREWB71zc=;
        b=VMT783u9WnceTYPSWj7aA/nehBmEqxgJeANLE+c1qPCQpRSMqVhbPyYoSf1BIyMLwV
         B+6ztFI304JuOwBi/cL8oewac4YjMXvMg0nG2o22Kq0IHp38+9R8Io6coY9QHAbGSV7g
         7yaJJcre9oosHl/0pjtnu+aeyiW/joitWzO9yclcby6czME7TPu2cvBzDH9s9lGbob51
         xscDXGHYYlytHUn3ihHGPwLUn/DSr1Bk/eehyDjuWWg9WWIHMTS+/Rls3YQOHARyjlMw
         w4zrOm+txwwbRE/3mrUDzo0Ei2T5tlROoKpuWHvPVSxTXviG1uHl/Yin6R36PdWUO/MT
         aU4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EJzv67dv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f34si6313477qtd.351.2020.11.03.08.56.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 08:56:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EJzv67dv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZzc5-0002D1-9s
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 11:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kZzbt-0002Cl-VZ
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 11:56:42 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kZzbs-0006Vl-CK
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 11:56:41 -0500
Received: by mail-pl1-x643.google.com with SMTP id z1so8810716plo.12
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2020 08:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dg7x18WPma1VvH4BjHj7HmfS4Xe3X5EsexEREWB71zc=;
 b=EJzv67dv9Cn7Ng8EwKQ7BAktUdIAlPRzfAjq3oItxG+y4AZtZ1D0OOJwVGdrnsxUaw
 7D/j1qVvwdRJg2oGC7GSbPMt16hDhVIFM8KO1GGDcBtkt5jWSgOvsV7AFfvmxxevypEy
 mpohJhsOGjCXYsdzebq9DMdHigw8lOPg5SYU8tr1pGQoGd5//rrfelUxWs2gvuymPZ7b
 cQMfUaU3ZDh3N9VJXGrAT/WCyesvBMYCb3hYxtLOS0ZH4jFmk9jQhAm0RAwieqexGr2f
 PtKcZRr1tK93kl1BmsSeZhPJGDvhJCZUCMn2bOAwqq7Ms8qFpLxewC8MgLzYJPZhzLWZ
 iKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dg7x18WPma1VvH4BjHj7HmfS4Xe3X5EsexEREWB71zc=;
 b=JEGWQgzCwAi/QCVz6x6fXd0JN4DjnvHDDJ3/z/6B5qCH7rp91FKtNM7My4GeP8gN79
 qfEF2QUVLf0te3Y4h21NlrNuzDf2FiMr/F4vq42pjboEvqGu8z0VN/CAU6Jbo6ipEZpM
 Ksvlegpu6DloZGiSMB2UYVPRkGScEefBQA6kjbS9OLnSLopeOu/Um/nafkKHgQca1TgK
 8jFr2iSv7MY2x+3BKR32X3VvaW3fgXiNkjNO3Pj2DcWn1HhMbOzHyJXE1pPTZRqcLyD4
 bzMkdWj+d+5XGA/kKa7Sc0ogSDBQsNlq9kbtEXS+x7Jg7Omi6L6nl2pm7DPewHj1flpY
 EZTQ==
X-Gm-Message-State: AOAM531LCeiBBsli056X99hnFKgIZ1BJ9QeCO8Vn7JOBitQS3YtMI6Le
 aKnnbNm7NhGE3fF8ZsvTV7gJFg==
X-Received: by 2002:a17:902:e983:b029:d5:f465:55d5 with SMTP id
 f3-20020a170902e983b02900d5f46555d5mr26121758plb.60.1604422597815; 
 Tue, 03 Nov 2020 08:56:37 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id u11sm16532508pfk.164.2020.11.03.08.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 08:56:36 -0800 (PST)
Subject: Re: [PATCH 03/14] target/arm: use arm_hcr_el2_eff() where applicable
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-3-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <267b4dad-8c96-0931-1a50-39bfccffcc1b@linaro.org>
Date: Tue, 3 Nov 2020 08:56:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102105802.39332-3-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bDaQHi7P/rfG

On 11/2/20 2:57 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> This will simplify accessing HCR conditionally in secure state.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
