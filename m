Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1867191lfm;
        Sat, 11 Jul 2020 12:37:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuBmpD0rTKbHh/ciEmMYl+pHUpzBntyBxjwO0ppWuEeHleU93th4EpDbsVbjOo+2QBB3VR
X-Received: by 2002:a25:a104:: with SMTP id z4mr14689460ybh.40.1594496237538;
        Sat, 11 Jul 2020 12:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594496237; cv=none;
        d=google.com; s=arc-20160816;
        b=Iu48kn8pbbCtKmyw34VgNbl8URi70+MEAA4RG2gf1cVvbZjzFGiv8jftsivLVAGb4H
         kB2aIah30TvEM2PfWZDltyJSNCjy+N8wP+Cwm7kTipCg0LQr2fl7F/2qVttl4nSOrLDY
         d1aPI1ViF22iMOYyyaK15cthWvPkulvKEtnBNWsk4rkUBxXZbXl15+gopfUtNMT2jNW1
         7f7dGMka5gjt+C1BC6CsJd8SYy8K2vjn3DITUdkeeG9T4wpaZy0A+NtVf0veqrjorzhO
         k9xIvYL1iwhPXxKgT8y/alqyl4kNw0Ys6PHeZb2ZHz95zxQIzF7hX/x57koL1Xf96i93
         fudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=Z3R1VQZdSXlkeFkzd/p5ikGikrtCov/0TjMgvUm1x8o=;
        b=Y8Xs3glrhOdxPe+Cy58FDS9T5+noN6lmK5wHBJlcQgdGOf7nJplnU4b+t+i9e0CbjI
         Pgtf5L2zUkfEmP8cexcIvUG+Oq2dwKbAb3gFleN9MQF2CssaTc2Z8WmkanWDsRMTe4PU
         I+uoXVgHPj3ryrtjlGVxBhKIbkRH+lHmCgNcPV8S82L5NZZGq7RgmSuNGRp85iHku48g
         mOm//Ub7HJJ9uo5eD4K5mAKE+AxwZg9/84sueUyyb8JWMsFKPWqgnCmSChLPeZvxzqGJ
         rj88OTpqDFXLHMkJo7RBhlNMzf/Vv92NDu3tws0RgNlGFpQWiqMBCqaHIQWZHq7855Ac
         SCJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IeFf5Q7M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v132si8497682yba.355.2020.07.11.12.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jul 2020 12:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IeFf5Q7M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juLJE-0000pu-VD
	for alex.bennee@linaro.org; Sat, 11 Jul 2020 15:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1juLJ8-0000pj-I0
 for qemu-arm@nongnu.org; Sat, 11 Jul 2020 15:37:10 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:37808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1juLJ6-0006M4-60
 for qemu-arm@nongnu.org; Sat, 11 Jul 2020 15:37:10 -0400
Received: by mail-pl1-x642.google.com with SMTP id p1so3620870pls.4
 for <qemu-arm@nongnu.org>; Sat, 11 Jul 2020 12:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z3R1VQZdSXlkeFkzd/p5ikGikrtCov/0TjMgvUm1x8o=;
 b=IeFf5Q7MRLknhmumBM/wNuNYzcDNijrZFIONtY9SEp+z6FmL9bgEo0Fc3q+ltvAsyU
 rOU+g4vatLvpri7erdhVZjcvKiAC9iIgM8h+pNZG9lAXvCuZD1Rgmv9IVu/BDD/wpw5G
 LJd/Za7thKIzYPeAyj7O/h9kvBffWI97AsH65I6BMW3czEmvSTnOGIWVK4XJY+a5YcE6
 et+J868lRFcCYeETOT2o7g7S0iWY/33ZeoRT+4nwACIQudaZi0EYqg0Pz9KDlydd031S
 npJ1Qs9pDh4Uc9i6N0fxDA+kFYds4twCqGdOJpc78FVRyg1AdfH4GhdAKheP5/AGJmuk
 kQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z3R1VQZdSXlkeFkzd/p5ikGikrtCov/0TjMgvUm1x8o=;
 b=A2hEN5NTs6Vu3XP/fZfBTrtIAlyCpHAQVqg8mDz7vuCdBDCnMtGUDRl5AXCej35/vW
 c741SGr0sJERzEeIlICxxc2mLL9pl8dw1RuzZ7eLooiioLhf2aUkoJ8DK6V10J9gozBg
 eMVIA5yrzWrVxLyfGepyiGbmWALjwI9EtrjZurYpQViYRZ2t98/xrGBVrE0It+Eoa84Q
 wbaGYMiAK5fE+wX4JANsV5H2ODkJj8wbNktKwR34F2UYUS7fJAY8cSRJV5x9WrscjIHZ
 eU+lUM0hyBd2a21wp9XSOoLywq48HCVE/+mwWwmlUTMbg7XTlABy1bGWlqqGzF7Q1/FT
 l1+w==
X-Gm-Message-State: AOAM532xvrucERtNiXpW8GHbwtXvHqZQEuweYpJ9L6B2lip7tjTpVxe3
 Va0unHDzHw8gVSHRSdycHxe0Ng==
X-Received: by 2002:a17:90b:46d7:: with SMTP id
 jx23mr12751736pjb.191.1594496226539; 
 Sat, 11 Jul 2020 12:37:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id b8sm9631736pjm.31.2020.07.11.12.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jul 2020 12:37:05 -0700 (PDT)
Subject: Re: [PATCH v2 06/17] linux-user: Do not use guest_addr_valid for
 h2g_valid
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-7-richard.henderson@linaro.org>
 <CAFEAcA_ca4vAxB-2qfsXVUNPUdyFTJQtcBdkegn4ub8SOiR2TA@mail.gmail.com>
 <d6c82116-8b33-716f-e76b-ecad2f24267d@linaro.org>
Message-ID: <70dca59c-927b-3fbb-9625-146594c6c245@linaro.org>
Date: Sat, 11 Jul 2020 12:37:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d6c82116-8b33-716f-e76b-ecad2f24267d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h4xiMlTl+zmx

On 7/11/20 12:30 PM, Richard Henderson wrote:
>> The old implementation returns true for
>> HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
>> (because there's a different definition of guest_addr_valid() there)
>> but this one does a range check even in that case.
> 
> It's part and parcel with patch 1, wherein we are in fact attempting to limit
> the guest address space to GUEST_ADDR_MAX.
> 
> That's why I put patch 1 first, so the behaviour change happens there.

Ho hum.  I've just realized the messages are sorted oddly in the mbox here, and
that the behaviour change is actually coming later in patch 7.

So, to summarize, I am intending a change here, it's just a matter of sorting
things so that one thing happens at a time.


r~
