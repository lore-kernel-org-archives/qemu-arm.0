Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1743157dlb;
        Tue, 9 Jul 2024 14:39:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrD/oGHsYNzvTHEy6NVVgsenxsoSWLQwzYjXXwjemZr7wc873sDu0TdTJWfRReIRZhJZUf2m0GPlgVJZXzPIsq3Wya8FWC
X-Google-Smtp-Source: AGHT+IET8yowIU1kZg/QoAVwMEYQ6SShcrrVp6y65I9c8eKM1IEe8AiLzFRZ8e31U7CAPdWkNMft
X-Received: by 2002:a05:622a:5294:b0:447:dc5c:fc73 with SMTP id d75a77b69052e-447faaa5c9dmr50020961cf.45.1720561181467;
        Tue, 09 Jul 2024 14:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720561181; cv=none;
        d=google.com; s=arc-20160816;
        b=s+DgFaXKxdI7NqcoqjKv5N5n2J5yFr+0YwcQ1BYXvUBBEwqZOapRT3j462ZLqor6Iw
         8PctP7bAtovIYOE/bNZ1xzigElEVR0omJWwV9dBoay2MK0ADDPdi06ZvCoyKLNQS+YH4
         jhFvgOJlhNyFQ/TbdQMrbp1htHka/KIAVAhpVh6VUlkHUGkO1iRNxrX/KgdWwZiMJgLE
         eH76g+yZDqt0kAIL6FdVu1RzUFbdjNN8NWs/Exp5MvuWAPJDFi+GAGIwc8O4FniuyBNf
         6hy4eQjO/BWU0yc8cUO3wLmh9gWziOE4Xes/YMUDTvEtYAuByqly+RXrACn7mz7ZBrDH
         79FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2bMJhXP2mOiq8Y0nEa1hF7/NfI0P/ETBfTA2iJyHUDg=;
        fh=3uYHR+caMZi55h5M7D1P+ozzaWB+prOnt9oMZ59ELKk=;
        b=nsVGDrmqDR2PsUzpgSmsxXqT5sxYc5sDaORC/g1/9Y/ORPmfJ0ujGE8PdaPS5D0uD0
         2qTIiasCFxyChz5UlMgMnSQQ+zJ2ml+iwdLoQEjJD3iR+purdeB4U9ExlCXSbA4MoegA
         sRPUB4tKZGX9P0pJ3OR1YICeOtyC2zr/xafRdhN4FBmS1xF+sKnBMhU8tiYmY6bTKsE6
         1KXWp7lCDtR+j50nPeL/73YkD2RZ4bQGqafftNfvG4++FDi58FwEqyoZ0lHqbu+XMvfa
         O11fsYOvkYRGaNTqLcGWpT4UnUzmqiILPmwY+D4z4KWajQlbLW9+heTrE3ADUWxBPLZk
         rOkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WFXWcH+4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9be5c99si29507451cf.549.2024.07.09.14.39.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 14:39:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WFXWcH+4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRIYV-00016M-48; Tue, 09 Jul 2024 17:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRIYT-00012L-G0
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 17:39:21 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRIYR-0004RE-Mp
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 17:39:21 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52ea33671ffso5169410e87.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 14:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720561157; x=1721165957; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2bMJhXP2mOiq8Y0nEa1hF7/NfI0P/ETBfTA2iJyHUDg=;
 b=WFXWcH+4D8wl01u2KtBCwS5N7zDEBMyKJB0LNj8Fx0VrnQkaP+hBZ89uWoWQAgM13v
 fUwbZIOidoVyeXxQMAoe/PU1gq1h13fuwvg6UEd0rU2nRcRRRr7Y0iQEjWJGaNgoLSIP
 B0xNF8hGnzwpyB34QZQHcRRV7/00SykeGyzbYtr7IeMD1lQQlCWC2PxE0ADp2BZ2f+d3
 oqW/vriTrvKZJR5ZhUefIwIjsJyQn4sl16ztUQcvIc3QoP/ENIjQHNqx6Q2b0Px7xIQI
 Wu2XEBeQSmeOhzxB1W/IhJbH/CuSQHlJK9/9oORecD6Ml0ug2SP9ftrwuB2wQTkgZuIQ
 HkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720561157; x=1721165957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2bMJhXP2mOiq8Y0nEa1hF7/NfI0P/ETBfTA2iJyHUDg=;
 b=rZ40Q7LC5nyOtCyCY/+vBA1cD4NWLRm5jldYg/+kp+W6hiYI4TIZUNg0/xHlGMzT0y
 Y14dLG4FAiOkMdQIMTEVDClhiXi+DQsS79M2tGHFdZvR/3LKM+thq8hu5+vSrXicZAC9
 VefH2L7l+D6LikQG0F9qYCgdOtDUiNuR1o6u1zFUQ/5ncl433AtTmWRU8nmDHe94/Jwb
 PrYXixm8u3pnpmL1UJ1eO0sM5iNU8hi5IaMZiYUjiXSf6XjtQGl5aBTc/8+6ciMFTohU
 CtwgREkmoz3jEgSnIxF32AF96/jt+toQvquCQTRRqyVxCCUgkbXBSG+/WQKr0o6qTwED
 nt2A==
X-Gm-Message-State: AOJu0YzckF4Pksx9cNIPufexe5qesMqn2Jpds8GvQ+X2p74UreQwMiGi
 EeAtflx2D0snNfrD4Y1/FfD5aUQ0yQubPNArn1A65v1R/02lX80mruReIP2q7Vo=
X-Received: by 2002:a05:6512:3088:b0:52e:987f:cfc6 with SMTP id
 2adb3069b0e04-52eb99d33f6mr2435240e87.51.1720561156688; 
 Tue, 09 Jul 2024 14:39:16 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.167.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266e861339sm69095865e9.12.2024.07.09.14.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 14:39:16 -0700 (PDT)
Message-ID: <fc8b71b9-e946-4161-8750-fffe37d3c925@linaro.org>
Date: Tue, 9 Jul 2024 23:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v47 00/19] hw/sd/sdcard: Add eMMC support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>
References: <20240709152556.52896-1-philmd@linaro.org>
 <e9c273ff-32bd-40fc-8f50-cb47784cf741@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e9c273ff-32bd-40fc-8f50-cb47784cf741@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12a.google.com
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
X-TUID: NG7AjQRGXlqx

On 9/7/24 17:58, Cédric Le Goater wrote:
> On 7/9/24 5:25 PM, Philippe Mathieu-Daudé wrote:
>> Since v42:
>> - Stick to spec v4.3 (re-simplified EXT_CSD register & migrate)
>> - Fill CID register
>> - Few changes to CSD register
>> - Implement 'boot-mode' reset timing
>> - Add 'boot-size' property
>>
>> Change required for aspeed branch:
>> -- >8 --
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 8c0e36badd..563816b710 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -344,3 +344,3 @@ static void sdhci_attach_drive(SDHCIState *sdhci, 
>> DriveInfo *dinfo, bool emmc,
>>           if (emmc) {
>> -            qdev_prop_set_uint8(card, "boot-config", boot_emmc ? 0x48 
>> : 0x0);
>> +            qdev_prop_set_uint64(card, "boot-size", 1 * MiB);
>>           }
>> (I'm still reluctant to merge patches 16-18)...
> 
> Then, please drop all changes related to the boot partitions. I will keep
> the original patches in my tree and address the feature when I have time.
> TYPE_EMMC is already great to have.

As you mentioned on today's community call, eMMC is a chipset soldered
on a board, so our boards exactly knows what size to expect on the card,
and whether boot partitions are present or not. I find the way of
building the drive image described in patch #16 cumbersome, but I'm OK
to make some concession on it, since "it works" as it. If necessary
we'll improve and deprecate the current properties. I'll repost and
plan to merge as-is (modulo review comments).

Regards,

Phil.
