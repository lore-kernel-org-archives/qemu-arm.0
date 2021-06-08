Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4883421lfa;
        Tue, 8 Jun 2021 16:24:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxda4rYqLp15n97J6Idf0MoeSD0b9DqS/noIWrSrLopd00C+AEQWBgJYBj2S1l9ZbB/YWMI
X-Received: by 2002:a25:244a:: with SMTP id k71mr33796010ybk.488.1623194644677;
        Tue, 08 Jun 2021 16:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623194644; cv=none;
        d=google.com; s=arc-20160816;
        b=boR1FxNb0R1lW+S4xy0YV1zJB2zR0OemWhkaj0i3B836MkuMmtSLVINitZkjjzpEdH
         NPtd3/ghYwCX5dxRsvCS0N2+Z6fQuH7CJ6JifM8VbopUGFDLx41y9sdYizoCHfmJAnrl
         VFHHL0Gj3lomRThzwNfGOnrifxyebBqIiD7/priX3w3eSFJJMgQwFEPEaSBYwybuLqEM
         zLWokG/YBXgR+l6tqKiw0qn8hX1oRrwfpvfsrgBvv3tU0lSg9Zv+gIRQQTPuaXTZGmue
         cKCWf7/5owT3Z75tspQeEXSxY/I//J+DLDsyZlmtdV2+wawS2FSJ1KK406v7crLdHm4Q
         r84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/9AUA9WzkqM48A4iE47lwzP9IdWQn2HoCmWiHE3XS8U=;
        b=ZcIvHC3eYb9EdPqBMYknV88nWrkn1eclUEPfyRYXFuT6es0lo/5wS+xAOniuzmvdm5
         jX639W1eq4dTYCQ305XXUX4q8xlPOoNsJdAnMYdpONCdkmaq2q+BY5Y1NQ+J+6D/dksb
         ///GQV+E78TkeSr7BAqNQiGUfi8fQDbRUnXbyop3t1gOUO8lMTWgIn/AVaKm4UtSpsJC
         Yi+K6LwlxmPL9Onj+HA2QOh4KnhhN1RAu9YptvmR/LVu5Ti0++pV3Rl9O0gfoUTHU6JA
         r3Tob7XoTBE8ArwPrY4BoS+ztSB5oOWioe2q+S4V4CRCID6evrz9mp2BKaroHs/vNX0n
         52NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pn/ULEbE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si10191229ybi.322.2021.06.08.16.24.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 16:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pn/ULEbE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lql4m-0007RH-2E
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 19:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lql4Q-0007Pu-Tz
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 19:23:42 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lql4N-0005kn-S5
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 19:23:42 -0400
Received: by mail-pf1-x433.google.com with SMTP id x73so16940034pfc.8
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 16:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/9AUA9WzkqM48A4iE47lwzP9IdWQn2HoCmWiHE3XS8U=;
 b=pn/ULEbEhJthVDhkvNaojmqYlN1y8UpHEc7eFH4mW8ftFxhqJEUVIQq8+yY980pZv+
 rE9fwgK3QQ1pe5Tp+ORllszqmQFdfpG858xU/Dj/40wnjYt/lq7Zaga1F8DoISHM81y/
 bB1dz/S9YRxAvyHeuvE6MJ6VrcBLEzBixg3P+zYWkYAh0lX4K0sr3EsCLFzMnIsvGtVY
 cXotDvjvHtQGSowe7JZYiJ7z2yZazs1RNiFh3RzJSey1by3mLudauC0yNrqY2jvlnH0d
 8x/CD7JD3gCBNGG3tGYQBqCpWa1sHQsiCBFhGE908ZlzpADkKrhm/KEE6oIluhFZ9G3v
 ilYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/9AUA9WzkqM48A4iE47lwzP9IdWQn2HoCmWiHE3XS8U=;
 b=V2lmIPIyiy/DyHuEpTKzi9zUEAATngx+yrTKvN/bxsYehvywcKn1+MyHQMuk7tLAcr
 poYPdqPfVbdH9NnmOTkaSKpWQhPUqbuyzzH3v/b4NrwqE+0uOwQDjDRtb6zw2ckn3K+X
 laKfCILmvxnK5uKHumcx9rCaUOZO7h2ho3f61p9CamQDi8fli2gS4wKJU6+TMzOFrhTi
 5pAMzMNeq6yVBsQYXEtgzXPUuyxp82WAEhDsEPIJAZryGmIENIwXGxW7pNckf9ljNzvN
 fFGgLc+dkypATCxfFt+VEkN9v/03TiPe6cuL0mGgmzdUop7Nl6keslq6vnwRH4tR+k/7
 jtvA==
X-Gm-Message-State: AOAM530i/f0vDbU8oJ4fdMj8I577MMK10tVdLbdFUIgrWLVGZy5enN8v
 BFQ749W0wsY0Z1kO50FEuu8VNA==
X-Received: by 2002:a05:6a00:1a41:b029:2ef:9721:879e with SMTP id
 h1-20020a056a001a41b02902ef9721879emr2162448pfv.74.1623194618111; 
 Tue, 08 Jun 2021 16:23:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p24sm9904938pfh.17.2021.06.08.16.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:23:37 -0700 (PDT)
Subject: Re: [PATCH 21/55] target/arm: Implement MVE VAND, VBIC, VORR, VORN,
 VEOR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <071318b3-21a6-f167-1e2c-567915e94a5b@linaro.org>
Date: Tue, 8 Jun 2021 16:23:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BoQjiH7FHPMv

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +DO_2OP(vand, 1, uint8_t, H1, DO_AND)
> +DO_2OP(vbic, 1, uint8_t, H1, DO_BIC)
> +DO_2OP(vorr, 1, uint8_t, H1, DO_ORR)
> +DO_2OP(vorn, 1, uint8_t, H1, DO_ORN)
> +DO_2OP(veor, 1, uint8_t, H1, DO_EOR)

Again, logicals should use uint64_t.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
