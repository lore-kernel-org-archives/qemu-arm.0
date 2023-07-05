Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3655770ejy;
        Wed, 5 Jul 2023 08:27:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHYe7Mdfq1ftwHM+4hGpGtbV7ChRCd1xct0eh3YmxkA2ZLOG2kG2LyPxJUvmnJ4R9K/In0o
X-Received: by 2002:a05:620a:2890:b0:75d:52fd:bb79 with SMTP id j16-20020a05620a289000b0075d52fdbb79mr17652326qkp.46.1688570852785;
        Wed, 05 Jul 2023 08:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688570852; cv=none;
        d=google.com; s=arc-20160816;
        b=JkFeZYur6PW7QD4EFt4r12GKYMrOP1DGAB1VaK899t7O/hfMvz+x2ikf6T58bX6byM
         Q1lOk0RvJuLfpclF1PlpGY+2zKS8ohAgoLag9ZrZiX0fetpCRl2b3SO0nVlDZfbMN8zs
         8Cb6sKu4x18o+4zPD0w0E/GWexorKQGjGRn2imerkniRGIpG0ktz//IIQbph8HZKx3VU
         tN5ZDQP1GftlnXEbcA6YQrAwyFCrDC02bMI6eqZG6ZpHnPeL568J8pETsTNM3W7HpaOW
         8t8VPP3ZnngZWU6wxWc2qckfD9Lj1qiHD00QluptgUAPsOslx4o0j4wf4ADVLeNICawM
         PgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IocW4CwpQNTxIBDycM4YHX89tc+iFcKux4nMChpwq/Q=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=YYRS9Pt6OhfQIEKtcYtLPLyxvvbkZ605KOmMIgmv2wu1bXQKKD57cqBEKQ8uMYfBz/
         IoQOQlnkANv8jBFSHC0jN3/oEhmXS1ymQuXN1FAHYgHpq6P2qw0OumfP95I89PeZ8Nrj
         qtZ5xG+aLPhth9gAwAQ7L7z10VgR8mgQ56kCC13QKr+NzevEUTY2WSI2IGY4RL/253P2
         tR83oKKRBvzoAsrgA1zT928nkjdZUsFJbCufPjVzFaEekgROA/qUYz1UXm7P2SdT1mAz
         aqCHWATsMpu38YTLuJTVBqBpPxiyp7G9BXBbbjDNr5kdKwRBN4cPcviegWU7unhmKa/X
         AUMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DMZOgEt0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4-20020ae9e644000000b00767183509a4si11388389qkl.428.2023.07.05.08.27.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:27:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DMZOgEt0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH4PO-0003yQ-Hy; Wed, 05 Jul 2023 11:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4PI-0003rP-D9
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:27:04 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4PG-0004ir-Qa
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:27:04 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b6a084a34cso103850361fa.1
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688570821; x=1691162821;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IocW4CwpQNTxIBDycM4YHX89tc+iFcKux4nMChpwq/Q=;
 b=DMZOgEt0cnxUN3LNVeov94D5MG5u5lblsSuL1UfIF19rnfjdhyKnOtmFE9949dTcXQ
 RtBnBPw8PvjImYmEeuZdLo/CuIYbVCRGG4vCljEmj1T0fXtgBWswhhMJMbVQD98nOvCS
 IpXyxrK9ORCFWOco0zCYulhy1ya+LLu16aTHacI52uwTWOTrONvud1kY0A8GHVLhgZRM
 trweofOdjrDsRqdutiY3Gx6TomC/sE9f1i2eT6a+X+/sFSY8krjPQVbnYyM8xBTOhN08
 KFmE4zm1+tH0kfGuaVFbVi9IH44zcN3wLS8xl9PoL/srM/5Pd8HFyX8SWijomuYLfJK9
 bu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688570821; x=1691162821;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IocW4CwpQNTxIBDycM4YHX89tc+iFcKux4nMChpwq/Q=;
 b=QTm6kDDQhQy9RWLqNZ8P6n0Nmusc5en11dpa5IZXkHG69AQlc0GuBJxeNFKsD1G4YA
 wbB9WeAPT3qJeDeyGR+dekAomYRzDbQT8x7j8fuOjrF6ycOEOkx7jjI0Ki5z1TUlEMdW
 lfH0URprIJTmtvZ1t4y0JXFKKaJTZ7n4sj45dpjAUMX8N/5b4wU7FlltKP+uH5GqH5Cd
 4LhveBgCrr5XdUinkv8sQtttnJTB7NHwDQVa9yqiuXePiofzUkbT6jB8OlTNUfeDWYPM
 xiqoEYfjiNwWSIDfaJyGuz6lE6rSwRLVML7aBYLcNAIQUOa24CcRjnMgdZJaADGtfyL6
 D5nw==
X-Gm-Message-State: ABy/qLasIwOXnshzWVrfeA2cpQqGBm21jV9Xo19syAyn7VpwJFDusT4W
 242xCvMcxaxcjgvn2otbA5VOyQ==
X-Received: by 2002:a2e:87cb:0:b0:2b6:e7b7:74b3 with SMTP id
 v11-20020a2e87cb000000b002b6e7b774b3mr7076601ljj.27.1688570821088; 
 Wed, 05 Jul 2023 08:27:01 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a2e3a14000000b002b6d9b061a7sm3103986lja.115.2023.07.05.08.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:27:00 -0700 (PDT)
Message-ID: <b7bab38b-7660-dbd4-11b7-5ef4cc7ef453@linaro.org>
Date: Wed, 5 Jul 2023 17:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 03/19] hw/timer/arm_timer: Move SP804 code around
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: YAB74J9+WaWe

On 7/4/23 16:49, Philippe Mathieu-Daudé wrote:
> Move sp804_properties[] and sp804_class_init() around
> with the rest of SP804 code code. What follows the
> "Integrator/CP timer module." is strictly ICP related.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/timer/arm_timer.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
