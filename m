Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3641037lft;
        Mon, 4 Jul 2022 20:28:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v65o39U/ve8XDscxFmoMywVPlM0WNUMbUauVDRex4D7G3Tdz2jNi6asMMEZXUs4l8qXcNT
X-Received: by 2002:a25:cf43:0:b0:66e:31fe:2bb9 with SMTP id f64-20020a25cf43000000b0066e31fe2bb9mr14186085ybg.148.1656991691913;
        Mon, 04 Jul 2022 20:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656991691; cv=none;
        d=google.com; s=arc-20160816;
        b=II+R3LbMrT05dkyv+8ulQmzZVv27yEOoZjqAcs14CvUAVmLMD1UvTaqsL5CMT94gIQ
         BLEQuyqKQ0jN5+j8jUh6KPebchxvIDcZtJ2UON9klIZ6hcGkr6QXD6CvpiZUoTvGNd3A
         lU8y8Rrt9cJik6z3iQJf4Y14W2q240/muudk2lciljPUsl7jisZ3iN+vvtNIBo71043F
         TDbOBscpaVqS++ff/16hmx31Y00/QiFaEwJegUxlxqpup0g7chYkzsyeMRD5hmtOfc2u
         GXNxvh2A40DbLloZw6mvA5OEGurc3Egtg3D3ZpjgcgczAvq792EgUZE8KvwAtJS+2yiB
         iwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Fo/KzOhVnyoAV4ft9RxSm/XB92EbffsTFcXxsAw9P3A=;
        b=pS6lV09ovbcREYLqlJuiU9dsE03ojFCT/65PNAh1EP2VKqyLU6cBqOKdtPW/1apszM
         XnVoWnI0tzXejA0Vws3fDdLvMx0YKPrGIZZQoqyKHorU50ASkOCyA+UQ/1R2va0G8Qjw
         SqNw1077CLnVTPybKfkD4GjhTX9SRo4egRBZDTLfvE2ViQ418DogzPZwEDCIQGOxYoDw
         w72RkVglN9mioqrPCn23pO2JiUgslBkvrEyn4W1E4POTTK4G/VbKS6X0RjeX92BtQ22F
         O4Pga48bkA+IRVw4jdh+FpRyRpS9TIz9cFu6ZAAVGWE0XyoWFbPtHF5rr4UZJFTGSdNh
         7Wig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BfLaygki;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 188-20020a2510c5000000b0066d7716c8bdsi23764274ybq.533.2022.07.04.20.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 20:28:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BfLaygki;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8ZER-0008Dw-Br
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 23:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZE5-0008CL-AY
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 23:27:49 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZE3-0004Dm-MK
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 23:27:48 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so15447722pjl.5
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 20:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Fo/KzOhVnyoAV4ft9RxSm/XB92EbffsTFcXxsAw9P3A=;
 b=BfLaygkigeRNFJwAn8C6+6vtpa40EEubQIxPbDx+MdyAxh6wNIpPaolXeIIV74heef
 z/gvynqh56TNCDR4NCKsefWoAaReff0bgZE+bC05ldu1TeXUiafcTOj0r0lXr9YVpU2N
 rqc/0UyO5hipPZbCBB10qnVp5foSgEfnV8icqWSaTdCiP/iN2E4IHunyFV9L1UXRQMZe
 uaY6mM0nmKwuHDr0E8ySvwlxwlLed2tZ5K8fmkjuiByVRUhStLENwrhFYraz0DgJRfwW
 60PFW7nAYg11dj9IE8vvDr2n05xiDTNOCVauuiUn3d2FqiaNYb3jDB5tyzndcFL+ZmR0
 21Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fo/KzOhVnyoAV4ft9RxSm/XB92EbffsTFcXxsAw9P3A=;
 b=qvn4zqAyEekTAWuzI4ORH6e7sw1PM866fEtsdVanC4DgXCwTTksoOg8A22VZpbzOJb
 PQIwq+KRfLMqmudNdp5yD9xyhvh/tcxAzxRNYVXb/3LFxGoCfzlGK0O/vqzZ3Dp7zJsW
 BGaHvgIOqMvZl2YP0asMtXb7HFNzO5s09JbueL7NEfgMV0bAd7llsOYwQkc1QNCobrvE
 DBUckNmB/Ad8wAWmFlRztl5SZGnuzEb1HjubMVWCv8fvfXrdqPka5zoWwN0jov0EbWNz
 hXe1T1ioh9YKCig3RPPOENB1jvBlyWvfKl70q19hxYhqh4Ft6HrfiCLiAEgBRDP6L6Wo
 QbJw==
X-Gm-Message-State: AJIora94jasbSjAhjFu/YnXUXdWc/5KvLUTkr2jweNOgYd5Abuf6db/l
 zXPH9n+hxs0BdvINTx2cV7pT2yrpCTLORcFa
X-Received: by 2002:a17:90b:4a82:b0:1ec:bb6b:38ce with SMTP id
 lp2-20020a17090b4a8200b001ecbb6b38cemr41282469pjb.149.1656991666304; 
 Mon, 04 Jul 2022 20:27:46 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a170902d2c800b0016be593b9e6sm2705671plc.167.2022.07.04.20.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 20:27:45 -0700 (PDT)
Message-ID: <35ca949b-2e33-58ab-98f6-4742f757d05e@linaro.org>
Date: Tue, 5 Jul 2022 08:57:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 37/45] linux-user/aarch64: Do not allow duplicate or
 short sve records
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-38-richard.henderson@linaro.org>
 <CAFEAcA81Xc0kXrYTeq+Ck4b9vwu7jOAMerS0s_L0HaqyvfUcJg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA81Xc0kXrYTeq+Ck4b9vwu7jOAMerS0s_L0HaqyvfUcJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: li1XQMm2tp/H

On 7/4/22 17:38, Peter Maydell wrote:
> I notice the kernel has a bunch of signal frame test
> cases in  tools/testing/selftests/arm64/signal/testcases --
> do we pass those ?

Most but not all of them.  The ones we don't pass are those for which SVE state has been 
discarded across a syscall and so the signal frame record is expected to be missing.  I 
thought about fixing those, but decided not to do within this series.


r~
