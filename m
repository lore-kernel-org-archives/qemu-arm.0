Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2245817ejb;
        Tue, 30 May 2023 08:09:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6E8TLU1fvMpNrQLaQ0+AXrlXiuDXD0Vxtr5qOLODF4QHAQU8kNF7uKJCTzbCeNekJ3jo8S
X-Received: by 2002:a05:622a:54e:b0:3f5:4c06:f4a5 with SMTP id m14-20020a05622a054e00b003f54c06f4a5mr2437286qtx.62.1685459399383;
        Tue, 30 May 2023 08:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685459399; cv=none;
        d=google.com; s=arc-20160816;
        b=qdTsuZtvbt/LVAuKbfsIzV2Wio7tNHpEDCn0lPEjHWZDZvRm1I09QblF3UUSLuEqMh
         fqcXYApy4SNFYKEFzGES6H0VpNOX/ot6rZUg204fIMoohCRuNSvhLimHVAlNTYOhOytf
         g9RMnWgp6JAQ7W8AzWK+VVghy5qEDTgr4YvwJrz7IgjJd76UKURgz6E9L/OgSO6lO7RU
         MqJLEvdKPAFSNfc+VKB89S0t1DmYkJjtnnmldZjd/dVx+Yu9V9sm5I64ioxbLKXwR4Mf
         pwjolxcaLSm92YYrYcsJOcVdjBtZH+E0m5o17SerBLsnbTh2ufOOit8tSm+gGUaNbeio
         uvog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YyVqbzMv110LWYWyqyeFqYv5nFiAxNJktsmCE/ovvzQ=;
        b=y/QgiXPv7Zegkyd7JE1ovCuO2rXB25ebGTv9kyMrsTCaSIdqqu7OTnW0v5sqfFIWWq
         F9OED6Xe9yAWlIf8t4wIjkiuzzmSu1w0g84+vp04nYiC7cERcL/iTrw1G0SNgITdx7ZM
         HOFKk1NBIuuNBzMNdW8i1+co1HZB0KWN25YNS70F866jG2e3ujTmwDefvoeNKEn7IgvA
         Jwee2ETPA9qknNu1bbAPet/rXk246QduN20q7bmjq3eZJr/6rTWpr2d0MEUkjAhSdgxo
         XZTthZphP81pVVgEgTyjtkzsPKX35gjKzYeImxhMJ6TL9prMMmHNzZLhJCE+UyZ1Yqsn
         X7Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iqfuNwuK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6-20020a05622a048600b003ef537e7bfasi6500714qtx.91.2023.05.30.08.09.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 08:09:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iqfuNwuK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q40yl-0000KG-7z; Tue, 30 May 2023 11:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q40yW-0008H1-Pp
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:09:28 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q40yT-0004hG-Vt
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:09:28 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-64d2b42a8f9so3589719b3a.3
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 08:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685459364; x=1688051364;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YyVqbzMv110LWYWyqyeFqYv5nFiAxNJktsmCE/ovvzQ=;
 b=iqfuNwuKbbIYbLZLSsGE+r/CCpVt6K7anJY3gbNSPMAPqBGlcK8Qowz2V8s5qJ22nC
 oZ8eI/FMYu8EcdDYAPkUkQ78n56fbjYYR/YkmeXtf3MjsrOaVRZCVXCcRqvTWQ4WOYKD
 pcRu2cU3Ahcd17sfXPVqVaBL9+G99pPu3bM0lN/E02nxM1etzh+VZQNSooi91kZAwmIS
 9xpp/jBXt0ECGkt/M1eNpKwsIWQ3kA7KpyiTsUzoeHSEFZTQbbIWM7fvpRxduhq8Hwoq
 Ho8wkppZqx+E9oNiJEptiJOhq3NoocrREQ0DWWUFDr73Qqa7GaKcRoihdPHU2BxabwPW
 PRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685459364; x=1688051364;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YyVqbzMv110LWYWyqyeFqYv5nFiAxNJktsmCE/ovvzQ=;
 b=JPecM6KOAOtAbDTfGpkCAe+lGZiaU/jH/ryWxzcc4lg6PmYDDVhFMBakrARxeXa0hD
 d665WMQi4Fmq5X8WwQuICxqicZJ8uz3v2fGa6ysjC4l9TrON2fASPVOTEkI90omv/bWb
 q8nZCYEc71fnkO5c81+Z9YLYruCuHJyOQ6CJpnIij458volqQ05LhQvaekjM7fcLM71a
 dTXVxrgpC90Z97niAh+keKs0n/gO3KGA7qGKNj/zpDsCuCpx/jG3XmnqQCNTLrdiBpEi
 Znh7V6bX5txSqJnvg3cKF3TvlO81Sx6I56cDz5CNZdLNhs4rndp6sT4jgSYikKbw5KP0
 LZaw==
X-Gm-Message-State: AC+VfDxaN+S95M6UjL+15uyYI4zBLrGAtKyWl1NJAwUZmnEvgZuxK1bG
 nGy1lyNPCOsYTtllOUIzM0/NNwQz61+GIR8CrIw=
X-Received: by 2002:a05:6a20:ce44:b0:111:c8a6:88ca with SMTP id
 id4-20020a056a20ce4400b00111c8a688camr2699946pzb.58.1685459364163; 
 Tue, 30 May 2023 08:09:24 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:35a2:c45d:7485:f488?
 ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
 by smtp.gmail.com with ESMTPSA id
 125-20020a630583000000b005348af1b84csm1117065pgf.74.2023.05.30.08.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 08:09:23 -0700 (PDT)
Message-ID: <528627e2-f4d5-fd44-a57b-23b37ca79935@linaro.org>
Date: Tue, 30 May 2023 08:09:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 02/16] accel/tcg: Fix check for page writeability in
 load_atomic16_or_exit
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-3-richard.henderson@linaro.org>
 <CAFEAcA8E_wbiL=xxc=qzfbhBjTsGVxpMGYex_Ezsn_=47DJP3w@mail.gmail.com>
 <5192c74b-38fb-7f2e-7b27-58d210c1b087@linaro.org>
 <CAFEAcA8tPuFMz8BZ5P-SJS42q8E_TZ1_5DJL-0kOvzeT-Fymmw@mail.gmail.com>
 <a7ba5e1c-ca59-b114-229a-07930f6ba683@linaro.org>
 <CAFEAcA_BS4b1MR=7zwVXB+eTXcVc2QhvzcvsoQn9mZ-xeps41w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_BS4b1MR=7zwVXB+eTXcVc2QhvzcvsoQn9mZ-xeps41w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: Mxo0wky+sg44

On 5/30/23 07:48, Peter Maydell wrote:
> On Tue, 30 May 2023 at 15:29, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 5/30/23 07:06, Peter Maydell wrote:
>>>> This is about falling through to the cmpxchg below: if !PAGE_WRITE_ORG, then the page is
>>>> really not writable, we will SIGSEGV, and handle_sigsegv_accerr_write will kill the process.
>>>
>>> Right, but if !PAGE_WRITE_ORG then that implies also !PAGE_WRITE,
>>> so we do that even without this change ?
>>
>> But !PAGE_WRITE does not imply !PAGE_WRITE_ORG.
> 
> Hmm. In what situation do we mark a page writeable when the
> guest didn't ask for it to be writeable ?

I don't know -- it seems backward, I know.

I *think* it's a race condition, where PAGE_WRITE changes.
That's what the test case is trying to provoke, anyway.


r~

