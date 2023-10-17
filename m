Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3891482ejc;
        Tue, 17 Oct 2023 05:45:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6s+2BfjOJm3jQwGGGyxhVFITcFztm5aMwNZaOHdTQdAUFrTbAu6mTO+jPbhjjp7KyJnO1
X-Received: by 2002:a7b:c44c:0:b0:405:95c3:e79d with SMTP id l12-20020a7bc44c000000b0040595c3e79dmr1595116wmi.40.1697546706496;
        Tue, 17 Oct 2023 05:45:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697546706; cv=none;
        d=google.com; s=arc-20160816;
        b=LgoCLRZs1mtxO6OpvujkZ8HLmo+nHpGaUS9kC15sQwJAqHGlc1mfofHoC0IK8gNzGP
         Yi7JcfSAUxMlI1iAKHYFP7Qeu6USl2qJpn1fwinOSpQ/9U8DslFwrtzvff7+TceYYUCJ
         emu+mtahjwPVgi5UlFwuIVagiyP51YVH3mN9zfTRcG+y0NHF2X6/rgOrwWKs5eGNkhPH
         vq3Igv09D9EKHONTB0JYvitgj3YHbLbqPs7Qb2yHR0ZFoaZfWtYoM52noCJaSsWOB6h+
         gqUaETxIsJwRCk1o+MVQy2y+zhOO3uCI6hpcT+3bw6VUHZlHnAkDh6RUqkHi2qX92whb
         b+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=iDynNsTl47oEPZltiAbi07WZ0fTDkuChOLRqUfE+Tuc=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=u1DVVHBzIEIfYOLiyfKh5FV3cWpfOqvJozbxH+Z4c0BS/iGYiOKp5/ygBzav64zQ9E
         fqTXwxpTo0zZyRKg9+1i+/kK+24PLLOdGC3ENuD/hPLXzA8WwnsC2zX+6hItAYIelid8
         OXf6uaEnh11jnhSYo6InuK+P7iYwOBd+YIO6zZ9Uf/56yIIN2vvepg6wwqZC6YdzVTdV
         LnxKasF7a4uchMVAYIBjO4wHo3KxhQHd7Vc61URsy1aCvFDO4XV3cwCZJcBrpTKaR4i7
         dPCO6ziUxa7JYA1EPNf8DgXK+UqiOdgIszIgs319EKODmxjTcPiVva7xQ5EUZmkTDIzr
         I/LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mWhXKU7K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fl16-20020a05600c0b9000b00400e56d2622si3974723wmb.88.2023.10.17.05.45.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 05:45:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mWhXKU7K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsjRR-0007Z7-73; Tue, 17 Oct 2023 08:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsjRQ-0007Yr-Fq
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:44:56 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsjRO-0008BB-Vo
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:44:56 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53dfc28a2afso9714564a12.1
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 05:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697546692; x=1698151492; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iDynNsTl47oEPZltiAbi07WZ0fTDkuChOLRqUfE+Tuc=;
 b=mWhXKU7KK4J9FUsqbY5R4Np50uNPlLMobfdMKEu0k75lEHNavf4KB19SDEslXKYyDK
 d6jG/RoYyEFdMNC3hnh4ewfQp1DgunQ4CY59NrE2KuDmWuDfvIx4QCWMpIqIIKApZkYe
 YJzMe7aTKl+Pon6Wa6KSGqkj+aUsf/0WmUSp4/sd/5eX4pat23TbIHWX1fPQVSrUbg9H
 zfONl7gpcBI2mE66gdhnTjtPpdp718EVrOqVL+ZIFZNMgxowbldFid2eK8LRDj/CNJT9
 NaSt4ifbFYDMiqHi0dyUmb8SxV6G9RYQF5oQ+mba/p0aQ9nc9SieCTt8qBNP2ghFLX2+
 KRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697546692; x=1698151492;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iDynNsTl47oEPZltiAbi07WZ0fTDkuChOLRqUfE+Tuc=;
 b=uqIyvspXcD/9PP6pV2JP8Wnk5XS+l4K7mywgT9lFatyVnEYq9xFZoxpKVBwBgpKlAt
 ewp6jFHl3lySaX8gjoFmW6oQRX3WTK2J4tzB05ajwx9UwnE4jrbviT7kKG889h529Y9o
 hb0CYea+hfbj51ClqlOPYOqlrNAuok7kTP5l77W8Gf/x7qwlqZfPGsVrW8ByJHr3iGxt
 pAIQAPEQKX92o6fxuhJFgfHuHGXVRzFYHufNjJCIm4PbgjRzSBUXAqoXOS4t8ST0d5P9
 PhZJwtrwKcSWxMp0h0kcyF01jREV4H6vAwh9OcNssCNK6tZGyzvEt92kzO0D3y4TLPEa
 BUow==
X-Gm-Message-State: AOJu0YxDm0G1GLym8rVar5zofItPsY3XjFC0QlkhW9tVgFCTKjjpt1EW
 6WMEQ8xcaBnMi3Vzbr+SYc+7iQ==
X-Received: by 2002:a05:6402:4315:b0:53d:fbf6:72c with SMTP id
 m21-20020a056402431500b0053dfbf6072cmr1893981edc.1.1697546692773; 
 Tue, 17 Oct 2023 05:44:52 -0700 (PDT)
Received: from [192.168.69.115] ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 16-20020a508e50000000b0053eb9af1e15sm1190483edx.77.2023.10.17.05.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 05:44:52 -0700 (PDT)
Message-ID: <c985a5c2-dbe8-8ea5-e4c6-1df9d530dd68@linaro.org>
Date: Tue, 17 Oct 2023 14:44:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/6] hw/input/stellaris_input: Rename to stellaris_gamepad
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231017122302.1692902-1-peter.maydell@linaro.org>
 <20231017122302.1692902-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231017122302.1692902-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: s7f4PCxpUcgL

On 17/10/23 14:22, Peter Maydell wrote:
> This source file implements a stellaris gamepad device; rename
> it so that it is a closer match to the device name.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/input/{gamepad.h => stellaris_gamepad.h} | 6 +++---
>   hw/arm/stellaris.c                                  | 2 +-
>   hw/input/{stellaris_input.c => stellaris_gamepad.c} | 2 +-
>   hw/arm/Kconfig                                      | 2 +-
>   hw/input/Kconfig                                    | 2 +-
>   hw/input/meson.build                                | 2 +-
>   6 files changed, 8 insertions(+), 8 deletions(-)
>   rename include/hw/input/{gamepad.h => stellaris_gamepad.h} (77%)
>   rename hw/input/{stellaris_input.c => stellaris_gamepad.c} (98%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

