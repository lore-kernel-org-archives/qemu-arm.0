Received: by 2002:a05:7023:c086:b0:69:9a19:fb41 with SMTP id ip6csp2760050dlc;
        Tue, 22 Aug 2023 08:43:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2Rm18lS0j/9k2ic9uEMXi5T1IZpYjMOgkm3PnwB+mTx0sY2EJKiKXPJUzrG1C7EX5w24F
X-Received: by 2002:a05:622a:1049:b0:40f:dbe8:113b with SMTP id f9-20020a05622a104900b0040fdbe8113bmr12878621qte.4.1692718983122;
        Tue, 22 Aug 2023 08:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692718983; cv=none;
        d=google.com; s=arc-20160816;
        b=LXuEg9kAVMfR4nMEfRC394TfBEaOCstHa2VaY55MbLmqatxGV1DC+HTS7XeAIAeUes
         +aeXemrDqVoddk5+6X7K/G/6IT9QgTSO5N1beb1BDerLTV1r8rsaeU1gl1f8CLt5eTmn
         6HxSwkDasO57WjIuOAKkIxHa8WK29qatV6uomnj3WA0NW1sq3pWvogHmZvyprdb3Brld
         B6BYo0TmcN56nr1p2TIfYY6Nk3etaFk5pkELJfT0FbAYsCk27ROVhP4OqUDxzWUXW2Cn
         r7AzhRhZqFeErKj0pRdeJhURIf6eBC1LviKFC8FB16IBq6ySRcRmz9AsE7U0/FOorX5P
         SYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=X8oI/sfB3xzwMDeoK1rUGu1cCgR4nN2FyDj9AKzjc+Q=;
        fh=udqmx9LSKcjBYX2QmmmNuZq6BInkQmY/o2TngAkK7hA=;
        b=k9f1F2mRr6MOVgsIkqnqRJ4TsPftMR+x3iOvlfGllb8hdGU8gHpUjRbnvZ7FrBuW94
         a5PCFLhBfmKf/zlBjki26Rc18FQep6g2d7KKwbUcoKKyY5TbIcFk18BwVwm38E61ifxs
         hbzmkiSJsGRREw/dOobtFpG6yvkwUjMQcu3JETXVEAb0eR2CyIV5hKBxnvwuUqgUHYv5
         4lU3egyWyPUmBMFK77ZUdDKMDyZhh7cV++CXjfmRhh6q7yrf25MWyK8tF0vGcRTY5dnq
         lH8cex1SgdZq+bIB9RGLMemEzgScMshvtruX9uwPZ6DFeO0c8JTAI5IVZ8qAPGyeinv5
         iFHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UdbQ0PNZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10-20020a05622a064a00b004108cbf61d2si4448741qtb.251.2023.08.22.08.43.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 08:43:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UdbQ0PNZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYTWp-0003wS-Fh; Tue, 22 Aug 2023 11:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYTWi-0003vq-KM
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 11:42:41 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYTWe-0000LT-Qp
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 11:42:39 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-68a43131e82so2171026b3a.2
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 08:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692718955; x=1693323755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X8oI/sfB3xzwMDeoK1rUGu1cCgR4nN2FyDj9AKzjc+Q=;
 b=UdbQ0PNZ0ua0Fa+dxA2HzjlEMBMPlMi/T3orjr+I8xYsUr9JGf8RgGHiY9qyMYF1Da
 XvaU6TGrXChNX60PsoBt8Qqmq1V3jzcXFMlQeIdjTxMVBol4MWjAsPZJ1WIGB6+WmKrz
 IG6sF8URXp52/GUNTgwrkwgdyk9VLjq2QRzx1QtLnT9OlFM6vJUMqe6SFmryFbTuH2KU
 eLBa2q2lUdTa/feX5a7Qa3DQxM/BICG2iyngixOoEGpCESLmjG1foURDx/y2xSy0JguY
 +BF9RZ/azBbUdnvoH2N8+ecamAV9ivYcBIRwdu65pQYoJCibDXB25N3TP/STcwkItVA2
 OVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692718955; x=1693323755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X8oI/sfB3xzwMDeoK1rUGu1cCgR4nN2FyDj9AKzjc+Q=;
 b=RtLst9V56MULmm2ZjbjfzO0w4AyknRhEPRO2iN9hDckBcLV8RG2ANAMDhXpsEiunov
 avuFoDs7S3qfohp3udcCTr3R9iDdWLmQa9ByZjO7UbkPrqRWMtAOmO4euIfAX6vxBQrn
 rofkPI0u3cY/2VxvreVC71UC12UE9YNime73P8QVXLGknNpOORmHgZO0B1x76uPyQZ65
 YdOUxS8SoRPyToV/QeB2oVq5LcMH83WDjr/d5B+uG5F4Sw72tENRQUkAIb2d9q0D0mEh
 pFgtsHA+1uJEYg9C7D4I6ZTmYBKcxgVw3Q3XlzT57KmzzAwkWQ/FpZhQBMKzeRyvDdnv
 35Vg==
X-Gm-Message-State: AOJu0Ywkm1IVLu94PWf9OJkI6YB7DEE8jF++Oa8rb/Llm4svvBG8u2tf
 hJSnjJQCQSmoy1B+PUPCpw0OWQ==
X-Received: by 2002:a05:6a00:805:b0:68b:bd56:c78b with SMTP id
 m5-20020a056a00080500b0068bbd56c78bmr1198455pfk.10.1692718954599; 
 Tue, 22 Aug 2023 08:42:34 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:4e3c:f4a4:b92a:b5ab?
 ([2602:47:d483:7301:4e3c:f4a4:b92a:b5ab])
 by smtp.gmail.com with ESMTPSA id
 h11-20020aa786cb000000b00687790191a2sm7920222pfo.58.2023.08.22.08.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 08:42:34 -0700 (PDT)
Message-ID: <14386aa6-8e00-8792-ba7d-9d93c3c35baf@linaro.org>
Date: Tue, 22 Aug 2023 08:42:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 12/12] target/mips: Use generic hrev32_tl() in WSBH opcode
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230822124042.54739-1-philmd@linaro.org>
 <20230822125752.55328-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230822125752.55328-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.767,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: cXKBdj9Zw7q+

On 8/22/23 05:57, Philippe Mathieu-Daudé wrote:
> -        {
> -            TCGv t1 = tcg_temp_new();
> -            TCGv t2 = tcg_constant_tl(0x00FF00FF);
> -
> -            tcg_gen_shri_tl(t1, t0, 8);
> -            tcg_gen_and_tl(t1, t1, t2);
> -            tcg_gen_and_tl(t0, t0, t2);
> -            tcg_gen_shli_tl(t0, t0, 8);
> -            tcg_gen_or_tl(t0, t0, t1);
> -            tcg_gen_ext32s_tl(cpu_gpr[rd], t0);
> -        }
> +        tcg_gen_hrev32_tl(t0, t0);
> +        tcg_gen_ext32s_tl(cpu_gpr[rd], t0);

Ah, you did want tcg_gen_bswap16x2_tl(dst, src, TCG_BSWAP_OS).


r~
