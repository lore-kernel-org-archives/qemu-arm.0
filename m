Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp1037676lfc;
        Fri, 17 Dec 2021 15:42:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAWqfsPfxf2p9uQATGeTe/V/TOxW9SHqunG7L/iNcv23dfHkG4MUnSqSge3Zny4jALwqZ3
X-Received: by 2002:a05:6602:15cf:: with SMTP id f15mr3012307iow.129.1639784568309;
        Fri, 17 Dec 2021 15:42:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639784568; cv=none;
        d=google.com; s=arc-20160816;
        b=uqwuccrNW8vapLTJJv9fk1HHIXCbNcIufK1BxizQUAJYsqvYGKSBgf9rY3wWa1c2By
         lrnEbLeF4XYsitH/UbotF/pYVC1cbnsPPErCm4Xse22WcjNM2GOq8am5vmU4yRa9MJDh
         /K2+xUYq1V8REkJTT5VEGpkiS8hE5fzvE+5hrkg1hGzgv3lHNPTUo5HgmZ7snw1htG0Y
         joJ01e6X0v0Ng9tjGpBmVCTzl8r1Q9orxhm3s1K7z5EETPkhDY6mg/EbiaQIlYeu2OCp
         Ss6Fh1Rf8LGrhRJOXkvce7Lxo4gvZcnfqCAF/Z2XvhPsn8CSdo37K0Kc7xlFFKZowh86
         WyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=SMA7GGQFdgwY+cNj8VHa0AhtzZEAViBcMJ8wMX42msY=;
        b=QhUSVYifZ1b6yNt6ZwrIOSsUFIRRU/HI2UJglpe8VQYYwxuGfOKAGqiGoemJ2RRlSC
         zl6Mtt1hZpwcHZmsefjokYc2FR/0QTvhhSUCzcQbhivKhEsIkFrTBHmWSMOJ11cNsP12
         kKTnCMhzNL9kKPhY7M2PT3Zh20PtQPwKVqeU2+BP3osGisML5fcOOCWdIYhbGhhF1ncQ
         K26dHw3568UB02b/CzOMuE8WpRKIITSTz6rKeNfoYA9P3S7b/EbPNn4EJLhvc2pZWoVv
         rFR+eq9Eoe5JAkPJot53SQRKsh8j0yiEYDCwsMwxCFIjgZ8z7p59cBzzQAf4j3dter72
         yMrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L9EP8EKA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8si5818864ilf.153.2021.12.17.15.42.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Dec 2021 15:42:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L9EP8EKA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1myMsB-0007xE-OC
	for alex.bennee@linaro.org; Fri, 17 Dec 2021 18:42:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myMrr-0007wv-CV
 for qemu-arm@nongnu.org; Fri, 17 Dec 2021 18:42:31 -0500
Received: from [2607:f8b0:4864:20::102a] (port=37874
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myMro-0007BM-VD
 for qemu-arm@nongnu.org; Fri, 17 Dec 2021 18:42:27 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so4574046pjj.2
 for <qemu-arm@nongnu.org>; Fri, 17 Dec 2021 15:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SMA7GGQFdgwY+cNj8VHa0AhtzZEAViBcMJ8wMX42msY=;
 b=L9EP8EKAv294UAfejE07q41cvHAeEh9Y+WeEyszBVAUFmQfIjbgJZtlA7vPVE7c/PN
 Pi2a43dxhSv/OMOEHnZpsNOno0KSD1nDwy3LpDdRs2VWFV/qHZXkQWWOznyOEenIp6iT
 4dXNK/5pZTe2sCyAa+UKdR8YFUVbNVQJjrYbtBvZ2lN26vXy5IgwUPrZP4HvjNopKNoh
 fUxwk1KC3tpaZ7obUJKtoLUKrlzB3SIqVYnUR3rZqEdEvGZW/jOL6Fw4WiPGEsj90AYs
 Gm80zSaNSXkJuITx1l0+H/8NsKTCfOYD+GR2JAOqivxZvfgZkG+cXHGPvJNkiS/tD+nS
 EkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SMA7GGQFdgwY+cNj8VHa0AhtzZEAViBcMJ8wMX42msY=;
 b=Fpel054m9h9oN0Bx/YNrQ84ifX5WlQFMI+MatUnnwUkO9og3Yy48LYm9sAE4jWV4tv
 esG4pKS6xQVyi3fEjMLKiAt3HRAZl4PUOO868VixytJdgHpYqz5oJDZcIszJRiYcVrys
 Vlws4rq3AiEI0qXILKBfrBwo7SzgieksLtYLIjZoEQ3roaY5XQoanChCU0E/ylWw1dgl
 8MgYm2Q6MVwaLLG8ZdNUFXb7o92IlB1gh2gqLlhwhfE8NWqlzEx96kB12MuES1mz+3DN
 s9DvGEuWBC54Mc0LUslooOJV2ZtyghKgifIPvmpRH6uEVOEOfPGvbsVe9PRt/z+/HhoY
 orPw==
X-Gm-Message-State: AOAM533tJQelpQOKQxLI6BZzMPs4xR/qxu4g4dL8zBFco9gzajyBTCxA
 GhXqmIWh9TDtrsMZ8kqLqrkHnQ==
X-Received: by 2002:a17:90b:1c87:: with SMTP id
 oo7mr14470113pjb.159.1639784542570; 
 Fri, 17 Dec 2021 15:42:22 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y25sm11314902pfa.12.2021.12.17.15.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 15:42:21 -0800 (PST)
Subject: Re: [PATCH v3 1/3] hw: Move MARVELL_88W8618 Kconfig from audio/ to
 arm/
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211217233006.1466747-1-f4bug@amsat.org>
 <20211217233006.1466747-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <655480ad-7ee6-5ad7-5294-d9d4dc01f6e0@linaro.org>
Date: Fri, 17 Dec 2021 15:42:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217233006.1466747-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xVgePX2ukyfm

On 12/17/21 3:30 PM, Philippe Mathieu-Daudé wrote:
> The Marvell 88W8618 is a system-on-chip with an ARM core.
> We implement its audio codecs and network interface.
> Homogeneous SoC Kconfig are usually defined in the hw/$ARCH
> directory. Move it there.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/Kconfig   | 3 +++
>   hw/audio/Kconfig | 3 ---
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
