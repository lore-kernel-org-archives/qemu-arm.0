Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp1218113ejb;
        Sat, 18 Nov 2023 09:37:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbxFM6sIgwvMsED03BLQX9ykPRwclhQ8S9EjGDGkpintpVY0rt/E2w/e8SOk11Ef6kO3He
X-Received: by 2002:a05:6214:b69:b0:626:f3d:9e46 with SMTP id ey9-20020a0562140b6900b006260f3d9e46mr3507900qvb.18.1700329022615;
        Sat, 18 Nov 2023 09:37:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700329022; cv=none;
        d=google.com; s=arc-20160816;
        b=RNtjN4jzi64x/M6YU4LLiWcQ9J+N/b8tx4lOd6DJVoWYMuA7/zbNetnUfieZAOgG/Z
         zClzh/A+PJpDO665kha8AfilVpH8vYFyRH4M6DCp6EzmUlcvbKaflfF4WThYOwkS0yvg
         dpHENq2iPJev7/McN0TVTbLEdrfdOnC+KTw3AJ1dIFT66HbOhAYtw9yYDok2Q5Sezd07
         pRtfdE+8vZL6g86qTvNgHBIKQhF7kCL6weZjR+5Q4ubcDrHHukEQNxLf3Ygu5j6aqJfd
         CQxIOhyWs0QnE8guFpI6YFsig911fNUSOsdItsmWQwT/Wg4k+nBUL6UoblQRg/7xIe9B
         5FAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DC2MaIfS6LlWkY/Yuul9WyhF96mD7ttUTd+lMSh2lXs=;
        fh=prcxYYbx+RM02aNBYXa1Zw568hdCKvxWihZ3BRWh01Q=;
        b=xHV4kQSUs3hRdZ0VP7FcRsg5n3SYIPr1dYXNO61U4cp17mDp8QJxu5CP0imQVFg5RI
         I0l6pgRiVXlV6MmUvv4qjLUdXGSpGNBoTjKZi7weXNNpe5gLQT1qg/GDireN8yfc9bRE
         fe69wqpThPgMW8HncvPLZARPWnlynyUaL3Q2LDnqL50Rvx1XEvN9QspDNxNmSnJjYKBK
         SX5wGeBu/Z1PKn7K07bbwgkxj8Hb0ancIMXEYLRmdqMM48K2iBoG0eRlQhGNNE3OOG8J
         0SoBR745237LkqIf2Xt5NYloUwcfWWSUI1dCUQa7q9kfHMn8JpGUtAFxoqhLH/+dEeBe
         Adag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nhSL55NB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020a05621405c600b006714e71c204si3958422qvz.499.2023.11.18.09.37.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Nov 2023 09:37:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nhSL55NB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r4PFM-0003Y1-5L; Sat, 18 Nov 2023 12:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r4PFK-0003SJ-3N
 for qemu-arm@nongnu.org; Sat, 18 Nov 2023 12:36:42 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r4PFH-0008J8-9u
 for qemu-arm@nongnu.org; Sat, 18 Nov 2023 12:36:41 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9d0b4dfd60dso397040766b.1
 for <qemu-arm@nongnu.org>; Sat, 18 Nov 2023 09:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700328996; x=1700933796; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DC2MaIfS6LlWkY/Yuul9WyhF96mD7ttUTd+lMSh2lXs=;
 b=nhSL55NBw+/zxoZu7++M6Y4W473Bbsx42juoKUbJK2zoDGo60gmZAjhd/DgPuyw+Md
 +5RfX3xyPWJ7BxbAshzRzNXf2XwiySZQqE6Ojj+K1Tu0Ep0HR3soqzJIdTYMiQPhVDIH
 xDviTZ7CP4RRK9VURaOcznrwkOd2MMy8Yq+ePogP3FBgl593XrCUdri93TKl8hFGzzrl
 oNdETAc69HG5stKgIvDObDTa7yN8paat5UEk9nKabR2qRzpi3WwTGJpiO7W6qfzPSE//
 bPZQGN/JRiyV9Se6rxO5imPNWytTNiEdETrcjFD03kGN9+b6WvbsG8mw2fp676mx3muB
 w99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700328996; x=1700933796;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DC2MaIfS6LlWkY/Yuul9WyhF96mD7ttUTd+lMSh2lXs=;
 b=E/T5vxuoFy5FlBzE/DVaSwOFS2XH8MS7/T0Y5m6F4ltOjkqyB7KXDagiI9awyaqhL+
 4WTVPQ72ODVJKWqz5RGEmmnKabAUNwFixZQAHFuRHfCmRqVWQrx9YZ4Qz20JOpG6q0PQ
 OFTMeCDBKxNFKIBxcb12JBc7n5s+62atRg6jAtLs4U6Z5jBo9ln8lX9xKsPd/mTB+cOX
 T0k4+8wAOoE4/n0f0jgg6qn8ghtIwSTU2F4RIMejzja9hnK6/t2szhn9JI+oYnOtZKE4
 9melE0zsKQRYMpRRYak5CWZt9wULMehJI9qsfGdpO1T5C3iUoDPFDOIFb7kjXl3CBWhK
 m/Jg==
X-Gm-Message-State: AOJu0YxdrQ6bvjwQhzHrI8FjCRpmqkRTTedi/75FU5PqLfVlUzqURArt
 38l87ku5k4A+QNkDaAV4vUDfjQ==
X-Received: by 2002:a17:907:7b92:b0:9be:6ccb:6a8f with SMTP id
 ne18-20020a1709077b9200b009be6ccb6a8fmr3005941ejc.48.1700328995593; 
 Sat, 18 Nov 2023 09:36:35 -0800 (PST)
Received: from [192.168.69.100] ([176.187.211.152])
 by smtp.gmail.com with ESMTPSA id
 um16-20020a170906cf9000b009b913aa7cdasm2086267ejb.92.2023.11.18.09.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Nov 2023 09:36:35 -0800 (PST)
Message-ID: <e6f3b219-5e81-4a28-82b9-ab3e30046032@linaro.org>
Date: Sat, 18 Nov 2023 18:36:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-8.2] target/arm: Fix SME FMOPA (16-bit), BFMOPA
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20231117193135.1180657-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231117193135.1180657-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: oR7/vCgrUwXC

On 17/11/23 20:31, Richard Henderson wrote:
> Perform the loop increment unconditionally, not nested
> within the predication.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 3916841ac75 ("target/arm: Implement FMOPA, FMOPS (widening)")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1985
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/sme_helper.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

