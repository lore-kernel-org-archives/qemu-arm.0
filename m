Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp465323lfr;
        Fri, 16 Apr 2021 08:02:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygiN8/8Eqxe1Aql111+tJ7Tf3lW86YMcS7S88stQlWuekXTtrZXKUg/0wpHfKkZt9asls5
X-Received: by 2002:a05:6e02:1a81:: with SMTP id k1mr7432254ilv.18.1618585325145;
        Fri, 16 Apr 2021 08:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618585325; cv=none;
        d=google.com; s=arc-20160816;
        b=rctMkl71wsaJWs22/dq/ik3iXCWp3cTT4XDbWKE844X6bC69N6js1h0N2ezKPo7Kv1
         vGzS27uk0H4WXTNZ/kU9QB9x7+ZrtDd4wI1hmRmBgQ+7FpwmNbNuWi4MKBI9Q+sMpIIq
         gRCuAqZ+aRBFrj4TaZ4tA1iHULuvVYsRUD3sj3T/i0ghkvMvoqv6zmI0tx/r0569ox0h
         w/HBh8bZoOibqizZuaxGF1+TZY39EKHTUtOqP2Kawg38gMoM5bGJKEcXg6e8gPvcomN4
         VRhwIFYlgUKPKhZTZ5K7Dk91ojPUFUvcCm9ZPPrIPH0xrbjPsDFevFzp7/OrvaeGNlcu
         HyQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HLEukpdhroBQnjfFSGkHxMIiiuDgBPTNraPQVB0AUD4=;
        b=g3ldgMBfPWoTF4a8MMJCT/8rHNlUFzhSrp5FHs8ltkc+acFISx4elnW4vs6c38fZhz
         GMozKE4K0WIl/oF4Pn/iipuX+h9qMKst5Qtsd3uRapYtuYJ9bgBKivgerY4GSCz+6sAB
         D8/qTH0jPHDljknV3X0c04V26ee1HQLE2O7KEki4DvPQXhJAGtd8q07BCjcmgRfNzybL
         prc/0oKkvUULk2lx+sQ8Azfuoz7qpUaScvefeSSRuAQRQabMG7+sDhOOv6ndwstNReqf
         6MSir4r3wywkGf/weQ1Pom2ilF+ooKAWgRHLghsaWXbfpDtH4q9jct1haszmLCmJ0Kom
         DHdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jGIiRErz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si4020897iol.19.2021.04.16.08.02.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 08:02:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jGIiRErz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXPyu-0002Jx-Gk
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 11:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXPyS-0002IT-OX; Fri, 16 Apr 2021 11:01:36 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXPyL-0002Zj-76; Fri, 16 Apr 2021 11:01:31 -0400
Received: by mail-wm1-x332.google.com with SMTP id k128so14481925wmk.4;
 Fri, 16 Apr 2021 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HLEukpdhroBQnjfFSGkHxMIiiuDgBPTNraPQVB0AUD4=;
 b=jGIiRErz1JY/zge4VLuw4IGLCMIPhIkahh3pRK4cfMODgoZxmZ1B9bxx6cikpsImYo
 DmcabE3qOGO76wUS72XfMpQXdG+keHt5w7cx74ViO6zDtn9ks+IVW7eqelqhyw1J1Yt+
 KU80pZ5uBW4N0R/032XojkqP7OX1YMdFWrYeeHgJmkHamvihGEbXdeT84M4yYeG7nrte
 sLLVvpNiiweYlMFmg7fMflAWzhSqmrkH6dnQgFc3ToBz8GMRvMrtfLO7reMN7N7sSXnR
 z/8yIAdwlekWjYzK21NtFtwMViOXy87wxV79JABkStT+ZaS4leoRYMmelYd1iS5rGkhd
 ZWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HLEukpdhroBQnjfFSGkHxMIiiuDgBPTNraPQVB0AUD4=;
 b=Ca/hKZtta29vpXjJKJ/mTkrwoUGWiutNvuG6XVG1Fb0T36JkA31Qog7gsC2iau0uTz
 vXNP8yf+130IfiQWSPxvTFZ1tW2azsDdiGhmGmMvsj7FtnD2HjgbHk9yjfaCPiemxHYt
 z+rL5d85Y8loLwJAp+jvE/8C0jmsVqDFO8r9h1nidpjKgVXVd25z9s0bk2MrkM24CTkj
 SJvKoI+8baD66TQDXkvHZ34i7wzsfXS3HBp8NfJHkju4dLQzEP3NXz0OvrRJjy/xt+If
 HCte9kUJwjJB1XdO1V4wL1KluDQe61y1jfjpCyuRpWSJZ2u8H7rc+TgCObry9PKSdw/Y
 nrjg==
X-Gm-Message-State: AOAM530g9czSw97oyr8+uXtcZ+5ggUOOZKta7vPar63prAIgkYwutNI5
 vrGUMVa2ULHUBx82EQAiPWpNNhFkJ8I=
X-Received: by 2002:a1c:1b56:: with SMTP id b83mr8850463wmb.170.1618585285977; 
 Fri, 16 Apr 2021 08:01:25 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y15sm11362066wrh.8.2021.04.16.08.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 08:01:25 -0700 (PDT)
Subject: Re: [PATCH for-6.0?] hw/arm/armsse: Make SSE-300 use Cortex-M55
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210416104010.13228-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <13a782fa-ad01-a953-9c34-fbc9cc7b869b@amsat.org>
Date: Fri, 16 Apr 2021 17:01:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416104010.13228-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: DZ6qgfbUwV++

On 4/16/21 12:40 PM, Peter Maydell wrote:
> The SSE-300 has a Cortex-M55 (which was the whole reason for us
> modelling it), but we forgot to actually update the code to let it
> have a different CPU type from the IoTKit and SSE-200.  Add CPU type
> as a field for ARMSSEInfo instead of hardcoding it to always use a
> Cortex-M33.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1923861
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a rather embarrassing bug. None of the test code I ran
> on the a547 model actually cared about the CPU specifically being
> an M55... Another one for the "maybe in rc4" bucket.

Yes please.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
>  hw/arm/armsse.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
