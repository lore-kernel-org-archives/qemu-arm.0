Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp2866032lfj;
        Tue, 17 May 2022 10:49:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkOZQ0bQtJB32dzjX04QP/uO/NaaRkvXsax4FEAEAGQPcp5ik27h6p0Jlhg1tQ7ie4lP2s
X-Received: by 2002:a05:620a:1906:b0:67b:3ac1:8f72 with SMTP id bj6-20020a05620a190600b0067b3ac18f72mr16575621qkb.478.1652809743734;
        Tue, 17 May 2022 10:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652809743; cv=none;
        d=google.com; s=arc-20160816;
        b=wcVyo9h231LGFKARDTxn54UMgL+MsBVwHrLtmn9JmcqiCJ77q3S1XA36n94zyFbQsX
         G2BtAnHkVXGHtBS3NYDEAoyty2X2tyJJzFSm91Bzd4hP8DTLQkkM0nMtO6vd8w7sqzMI
         4aCzganHOQbMLRFIwbP73L9sYFy9iABtelB7eRzysFWZXhnRlFxgLTDNPj3q//6ZrFIg
         k65uDfMUN1K0eiBffG9ny521pxnWOTy/JYur6UPbbVppXl7btn1WXLBZ6IDQpn3PRnIN
         MkCsaEEYdjDKs04UzC+GhPlSsDNDqJwJZ4PNGAREjyVqCyv8abH8llhpIln+0TsBYdDX
         dsNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HNk33sKWthyBiJ4vOahSpZLFRNj4baLkBacjZcfHoJg=;
        b=T/YK4fNy9VNhEPzwoaRTPtXmTiZzFywnvUE6GEvnPJwOvBhovB4c/DwcQkjbi1rl6+
         IeuClAsJIf26quUkeAXgpiuGkCuQh6CMZS5ihDxn8RcU0ue7UbxV/cW2CZJAtV1Cu9Ho
         XXTzy6EDlK07p5UqL+gcpXjhZ8bbzUu8i0Sj/CsNWk6xty+ZpF8iphtqC7n55qq5/NS+
         Ovj0Os747cjpGb2Alr43iU1v8M1gxOMfQiN0Z6CiXZDT1cWzZ4tByvoEaGuw4LW7/R3j
         NpQQmQmFpf8BuZ8MSI3DEQh6zKI9pKEaXIe++NnZ8KTkkrs1++RDxM5e674jWVtRI0x8
         98lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wObC9Lez;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18-20020a05622a01d200b002f3ba63a7e3si9969951qtw.693.2022.05.17.10.49.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 May 2022 10:49:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wObC9Lez;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nr1Jf-0000J6-8D
	for alex.bennee@linaro.org; Tue, 17 May 2022 13:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1Ew-0002oX-5O
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:44:10 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1Eu-0006b5-Hz
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:44:09 -0400
Received: by mail-pg1-x52b.google.com with SMTP id a19so17359146pgw.6
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 10:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HNk33sKWthyBiJ4vOahSpZLFRNj4baLkBacjZcfHoJg=;
 b=wObC9Lezxx0g7QOoLq7WC3icZeIdlFKGrF3LV/zlZZPMi2F/FuudkfxCqLBUzOrele
 NcAzBFywUgshu4yjwsF5X4Z3E96X828A+wiEV2lGARmbqzZJZSTa43xSU479HTPVgV3n
 5UFyhKjiX0JMrR6vh3lwMU+O68gFcWWAnOH+8RizptG55RwmdgEkpB9I833t8m2wGZeR
 QKkPhUXUlFb9TMZRBka5KkDtIovXvsVxaE/eo53kwf/e/0nCa56iV8+SigGAsXIXmoWf
 pzkBBpA/Sdn36GfB9Yci412hrnbIA7XoZS+0CsQas0raCLX9xhpSuSee1nTRGHLtHpe7
 XmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HNk33sKWthyBiJ4vOahSpZLFRNj4baLkBacjZcfHoJg=;
 b=xLBDqbn3b5x+jlLFVReADW546VN9Maexk2m4M8SZkAFvPkRX+Epn3Ve3UedRt7iC4n
 MNkV5vmI86rhT9fAgO405x61JBHCwG3q0BPr88XAr+CZWc8uRrZ3IYoD8OlsyTeHJCo0
 BkhPhgjQOZNUBqPqkTRmfEiHVB3JjdkiPPH4V4QGHc0c/h19xWeBQ0AYaaeUivjRqj9K
 fLTlTwhTEJ2KZu+608GuOt4mNsfDpCoIG8k4DAW9kkV0H7Jtslksf8SSsP0Nc6wvwUJn
 VstIiNkAfobx2n6h7ZOX73Lw+BlYlIxO8QnP5xiY9vQfztKy1HPWXy81fRnqQdEHoM0c
 7QtQ==
X-Gm-Message-State: AOAM531C5zC3K6Z/yG/JacljxQX6Tw2VARd39IIVdGfbaRYN4RRCpdyE
 aN0jfS+Jnv4YmqHKx4JeOlvb8A==
X-Received: by 2002:a62:b60f:0:b0:508:2a61:2c8b with SMTP id
 j15-20020a62b60f000000b005082a612c8bmr23461324pff.2.1652809446467; 
 Tue, 17 May 2022 10:44:06 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 y41-20020a056a001ca900b0050dc76281bdsm381pfw.151.2022.05.17.10.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 10:44:06 -0700 (PDT)
Message-ID: <d53b9f0f-f518-7606-3ee2-efd760304a97@linaro.org>
Date: Tue, 17 May 2022 10:44:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm: Fix PAuth keys access checks for disabled SEL2
Content-Language: en-US
To: Florian Lugou <florian.lugou@provenrun.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20220517145242.1215271-1-florian.lugou@provenrun.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517145242.1215271-1-florian.lugou@provenrun.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eiyBr/WQWrAq

On 5/17/22 07:52, Florian Lugou wrote:
> As per the description of the HCR_EL2.APK field in the ARMv8 ARM,
> Pointer Authentication keys accesses should only be trapped to Secure
> EL2 if it is enabled.
> 
> Signed-off-by: Florian Lugou <florian.lugou@provenrun.com>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
