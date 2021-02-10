Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1755120lfc;
        Wed, 10 Feb 2021 15:46:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxw9HgdZ+kBmzQZxIQsCcZMjvLwJwaQv+7HMMiRICmNsp8MuDGdN7Mebhc8t8Nc2fsX9Q1o
X-Received: by 2002:a25:ab6a:: with SMTP id u97mr7559052ybi.288.1613000766524;
        Wed, 10 Feb 2021 15:46:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613000766; cv=none;
        d=google.com; s=arc-20160816;
        b=R8WwLR/POnNz2g+vspH8/ryuYZYjqbX58rEgsMGqjU6Op04fsdr/44OOe9r+KEkxpb
         gOBt6q85h4Sktd+L1AiONMeFKyqOsx9SromyI2JkjJofqPt6I7na8HV/ozx0HS6SVaZQ
         Zz31hbiOs0SCrocbgNkQJWdA9V/Wm6ChPVJB1Z2bve5Lm69+HKCyO6Sc9LUHi+SsnKTe
         bQniPzblH582l/EWA3O2qlPHfT/5qfh/wnfFCIGa96f0A0IlTwzjKkQGzkwn1FMVCPMd
         pRNiIWYQN4gZVttZ2719dsHSUxKYKEcbA55gDJNZs44do09eZ73wbGBNm+1UhlTgtZfP
         ONkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6iKoDfP3N9J9oHS3btRDTTskYmU/q78HhUCaGjONtAQ=;
        b=uGMrdt7bL0MH74nAkOZj6OBBJa2Ly4Zf6DtveD7olP/0lh7hlSP4MvoJST1jQD6HiQ
         u9YUZOGvOUeDuVEtYHwLU9J0xqlQH2LMTW4v3CwJz9pD0rfMIoMv8Hgbf6uPcaIHIHY8
         gK8tcMbgGHMUEvjB5/6UZJb8WxjOgjwddQhF6J3XP3hSG6/rjEu06uKLyR64Gnt5mKVl
         1OoxgChpjeqDNYn+EBjoV1dpTc8DNBTrE/NYk+1sX+Gaii1G48Tbdwdv2yZlFsYZ6v9P
         48yX4wBlxDmLjOh/ZVYCi7bSfrNY08GPUG5dlc1gjeMwjQ8XFyYgP4/C8AjMjcGj1GG+
         U7/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rlkpv1bu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130si2856074ybv.287.2021.02.10.15.46.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 15:46:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rlkpv1bu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9zBL-0001Vn-N1
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 18:46:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9zA0-0001Uu-7Q; Wed, 10 Feb 2021 18:44:40 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9z9y-0006it-LC; Wed, 10 Feb 2021 18:44:39 -0500
Received: by mail-ej1-x635.google.com with SMTP id b9so7162555ejy.12;
 Wed, 10 Feb 2021 15:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6iKoDfP3N9J9oHS3btRDTTskYmU/q78HhUCaGjONtAQ=;
 b=rlkpv1buD3a1VYZjqrKFIW442ERAGKkWizkztuWdjHvwCVYMgVsiXGoHH02WO5yJ+I
 l58hXklfcoVfHjL0Bf0IGV8c9WX1a08e902MjoUrZJ5lFY45yZ8R9xOLHYVW2o4onYHS
 wDE4ng5ZEJsj6GBIyhx9LfcF2Y+6F+AA6UfQB1FpGJWdz8qmbJihLZjZSPk8g83PoB+A
 wDTMNC83cXjPuih2LhkWAYFcUg1Eqi4tmoHoyY8kc3SA1elZCEA/wsCdr/dDQRb44N1C
 8zwe5TYXjiBOycpazdkGNw72WlYfaiD0A3e3N+rIAcSPj3OU/XF2OyGB6bjhl9aM9Frp
 zeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6iKoDfP3N9J9oHS3btRDTTskYmU/q78HhUCaGjONtAQ=;
 b=rbzc+vYWrUKq01jTji3szCjtK4Rm/8kk4jhzFudc9J2oipHt69Uy99WUXRqQ9EnYre
 t0ltWRXyMcVbJYypdUN7bbVFt9eDY/JGJNJ0DAWw2lSbItCTA8Ka5Q86uM4KHvLEmBW3
 XwgM9z1VKbp4NzydppWPE4KtZkcas24rjw1onpLKTTT6OT4J5yq6wRVSNMjkSgCbxafV
 PScyiuO5UuS4rtx2MUKNd9/EchZi/lfpO/GTXTQzje59veboChkxPqj8d5+kcpLWT0w1
 G+cxz95lEh1zRFwgJ5XlidzRNtapU0M6ZM15N+JRhsquItTjOtYM7HEE2j35DFYsFqVk
 PRMg==
X-Gm-Message-State: AOAM533RUOh/dICO77g3sDazLHBvzwgSmUe9Aq57lyUQTmUuX/FhwNBR
 Zf/i8o+xlL6kes8KU0Kb0AY=
X-Received: by 2002:a17:906:2ada:: with SMTP id
 m26mr1150414eje.330.1613000676837; 
 Wed, 10 Feb 2021 15:44:36 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z16sm2464776ejd.102.2021.02.10.15.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 15:44:36 -0800 (PST)
Subject: Re: [PATCH v2 4/4] hw/timer/npcm7xx_timer: Use new clock_ns_to_ticks()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210209132040.5091-1-peter.maydell@linaro.org>
 <20210209132040.5091-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5d976447-2501-7eaf-3c3d-fa4ab03113ce@amsat.org>
Date: Thu, 11 Feb 2021 00:44:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209132040.5091-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tyrone Ting <kfting@nuvoton.com>, Luc Michel <luc@lmichel.fr>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /VyYK2daHkLW

On 2/9/21 2:20 PM, Peter Maydell wrote:
> Use the new clock_ns_to_ticks() function in npcm7xx_timer where
> appropriate.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/npcm7xx_timer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
