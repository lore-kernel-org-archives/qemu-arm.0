Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1842475ejd;
        Thu, 18 Apr 2024 09:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURkt6OUcsntpnGzz0M2GbUETJI++bk5AhDm8gYi1+BkHslN55plRsERzhH/WXlqkSd/khAS7USFLXYNifF88BsQPMC3kdr
X-Google-Smtp-Source: AGHT+IEFZr68ai019RvxYjN5q93WJdFETLEwBbs6caP8ht/UBdOfuKhwdHujU4lVUyps9an4xGBq
X-Received: by 2002:a05:6102:3a07:b0:47a:22cd:bbb5 with SMTP id b7-20020a0561023a0700b0047a22cdbbb5mr4414847vsu.20.1713456925759;
        Thu, 18 Apr 2024 09:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713456925; cv=none;
        d=google.com; s=arc-20160816;
        b=qZeXUR/H8TWhtY9iC5mVN/NcpOXbgg+foZXEDjJRM8j8dcyssX/UPbhmzNmxEHrXqo
         GLTYu7uEaK9jBaIQnyfdxuLy3vLaSfjPBufWUO+4Lkjh1F1SV8UyYA4/Hpxw6oPR4Jsf
         wPea7Xg85GrCz4dMi1F7SUAqr9VbRlzrqdz2LrihgHNS6+kWwwq1S9gpzHePSSmHTy6z
         TabunYZU48gdycHLp1fFginH45zQE/5ppShEZC8UdTZeTdI43QX96BSzygRUWVminYsP
         sDQqsQ/gtxiFCZs2Lu/eaJ/Y2n+2R/pALQY/DPIMS/8Rjy5VH5a1jTsqs8Q2P9nK19zh
         o6NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ekEUSCI5vTjMceAsk5YD9S59yiatOF5vG/4pwpsjwao=;
        fh=/yGE6fQOCZLf2WhMA6eVZAm/KL9g3BKJxNEOXNL8l3w=;
        b=Tg5eRsohRP5QGmYyFnnMsDQsuGOyYjOHiYPeNGqCU5maz+RAOIpy3hbS7KxooDUCu5
         O1A4C+QlUoBP7xGVvJqpnPW/YTlIgipyKOl+940qgm6p8PQ5aKewM/cHEIHQOW+NbXlT
         N3oiPPNkdsZejkO7c2ji3K2+dScVZwPmseqv0lAYn7H7wNDipUO+DjHcDJdGRU/X7ggE
         ktzlrcY+2VORysJpgNOGXIrhJwGxvOTqs0xvek2/ePDQl4tQ2+cADOgrs8qPgfUYrLb4
         XJksZqt4M6Z4734ZFY3intBI6PftT0GMa/rO8IGKlHU17lrAREmv5tVoHlhpeZs7gtkX
         9bnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZaIcq+RO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dh27-20020a056102579b00b0047ba8c76c76si493483vsb.478.2024.04.18.09.15.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Apr 2024 09:15:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZaIcq+RO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rxUPu-0005Ml-6H; Thu, 18 Apr 2024 12:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxUPs-0005MK-QO
 for qemu-arm@nongnu.org; Thu, 18 Apr 2024 12:15:16 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxUPr-0007UZ-80
 for qemu-arm@nongnu.org; Thu, 18 Apr 2024 12:15:16 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3499f1bed15so1243347f8f.1
 for <qemu-arm@nongnu.org>; Thu, 18 Apr 2024 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713456913; x=1714061713; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ekEUSCI5vTjMceAsk5YD9S59yiatOF5vG/4pwpsjwao=;
 b=ZaIcq+RO34HpR2ZmzxNXr91uJD1JIeLZTqzYd7KCHok/EPoOXqbMy1aGr+UJMbXp73
 lLWn0ZMgAkAOuM6xxkjfMKECqWX8nH/EwF687tnHMGXc2YQBvF0UPmydDTVR31yZZa4p
 4TTPp5LDinS+XZfd23g1gZIeSLq8otxYrPvqyR+nmp9wpD+9meTG391MMCUKag0ckjIW
 NyPwxD1/WnilA4ITbiVxsCQpMbbeCSVpY6lQx8fe/nSUAfbYd+mR1HWXY6wIRGS2meYX
 eaApXVsk+PijplphCOOPUt8hxr2Nt41H6Oij0CfM38g04qntsbBc6uV8s1AzQ0EXtr67
 n7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713456913; x=1714061713;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ekEUSCI5vTjMceAsk5YD9S59yiatOF5vG/4pwpsjwao=;
 b=lH27nSYg+eBEm1g2mH6QgNHtal7h0x5kp5hYYbxpsUtjLX6zyW8xZyu9Ic56BMMoBI
 c1OKwYGrJydkKPIWAfX8CdsL5LouppnHCR4HvB9vsDLN97tRpVkbA1NfmTdP+DnUTsaA
 QuL1Z/7OynCpjpdEmeXPBMsfgSlyUd3KzvJRjSysN5Kb2zKrwxTn/xH06e/JGkNPM4Ca
 M2TpFe2Yx91HrueeOFwncQ9QgxIDZ8UqAr8PmRwfP/A8NbH4/0/5PMmyYGskBSSn4/vF
 C8j2XyiKYL4luSevMxpVR+tSpBhVRtccuvTRe53T+vvx4F3f8NgxaKVzwKE5l/KZe648
 qxAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIn4wUw4vzmiaSeq3m/Jvcs9gwMcWgZc1cwGKSxyllIW1hajeH5x+Ri/0EkhwpBmaB4qQGFwPlP2HuBLbNiqJF8JHe
X-Gm-Message-State: AOJu0Yy0TkXLgyCjP9pZtbcdgHBtg+feWDVM1E4QtTZ/X8g1qNAbtToO
 Y6tDN/MKWtvvgwxFg3sjSqEsO0ZgKlp+nL7vAN42rZSZ5OaYBUx+C/L3cZiNRr1erm4lvfkyhZj
 S
X-Received: by 2002:a05:6000:1a45:b0:33d:754c:8daf with SMTP id
 t5-20020a0560001a4500b0033d754c8dafmr1992738wry.10.1713456913405; 
 Thu, 18 Apr 2024 09:15:13 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.151.213])
 by smtp.gmail.com with ESMTPSA id
 u17-20020adfeb51000000b00347321735a6sm2154572wrn.66.2024.04.18.09.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 09:15:12 -0700 (PDT)
Message-ID: <4999f974-ea60-4c6e-b3bb-32fab39f06bc@linaro.org>
Date: Thu, 18 Apr 2024 18:15:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] target/arm: Enable FEAT_Spec_FPACC for -cpu max
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240418152004.2106516-1-peter.maydell@linaro.org>
 <20240418152004.2106516-6-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240418152004.2106516-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1k8Nw1VaqeRZ

On 18/4/24 17:20, Peter Maydell wrote:
> FEAT_Spec_FPACC is a feature describing speculative behaviour in the
> event of a PAC authontication failure when FEAT_FPACCOMBINE is
> implemented.  FEAT_Spec_FPACC means that the speculative use of
> pointers processed by a PAC Authentication is not materially
> different in terms of the impact on cached microarchitectural state
> (caches, TLBs, etc) between passing and failing of the PAC
> Authentication.
> 
> QEMU doesn't do speculative execution, so we can advertise
> this feature.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/tcg/cpu64.c        | 4 ++++
>   2 files changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

