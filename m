Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2150522ejf;
        Mon, 26 Feb 2024 08:08:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJ2W+TqIIF1DxiRoRmYpAQ7LQXugAkDpBcLXTYwve34yD7o07UgAfnuBNMVdgVNjzryUs87sbgAEvrqt3JtLo5f6Ibaroq
X-Google-Smtp-Source: AGHT+IH5Gp//ZmeAQHKzRjPBOGaiO95sLyCJIPxpBlmZBuSlW8MqrKHo3AznNyq290KXgbUOOd7M
X-Received: by 2002:a05:620a:51d3:b0:787:a9c0:f7f with SMTP id cx19-20020a05620a51d300b00787a9c00f7fmr7831831qkb.3.1708963712745;
        Mon, 26 Feb 2024 08:08:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708963712; cv=none;
        d=google.com; s=arc-20160816;
        b=IWqWzzcyHco45OKGq7yV/Qq+isd61Oxxz4HjVxSAYd9cbW2p2SVI9iIBgn0g4SYxzO
         3L5q4jLqF8Z7o+dwr3jG+W//Ddn9WWRnnAMyKUpg+DAeS/kboJXEcTjrGyYaGX7yfqju
         CVFHQf0D/z80BvJBTd9M1rb8m8WO0gVzMZqhtGCVDnHZHH0Ud0HZdH0r9xIgBUH1oitL
         qrejisMR2REb6NLPuHwGgC/CmgS2HN63mDq1a2GWZLoOU7ea8ZRIq5OQ+ZbViZvJRTsb
         RV7u0Xl5OesWpMWOqfNZp8jRz8QBiSho9q2NLHqKpQyxpQl7HJyAglqc/Cq7m/tnU3Zt
         lwYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=94ItvZTU8UjZJXpr7paETTd3/ZnKh3sFlCRaL5V+peM=;
        fh=c7L4RwZ8zfr/7xDUvDBNODIvXc5M0RGkYowvERqI7/o=;
        b=y5TpU3AzCKZLG8aBfRvQjSPWFAkyIAFKst4tlAY0y1eVpeio5axQajqenTZnHYZKM3
         Y5kz5nwjmn3ZuvD6mSopM/lbqUKLium3eQJqDmBg5B/FahBG8bgvQpG8pVmdYjY7+4Et
         uqxmd+qInAsQmxbwFRsSWVijJ+2RwFW2+vOklA2XgYpbMrnnFn2u7lU+6QJYbOc8lldX
         fPicHyzR/5yR2Ueg2hraR9lNnTnr/pV4PTCycVo89j8ckt2zTEGP6QJMbIU27uIE5KF/
         XJ+zXfTbf7aITtS0vI03xEmGV0ApDuCS1HG6dwn+soY98M0HyCec8se8tmlc1SLu6Xb8
         T/Ug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dnGYXSaW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6-20020ae9e006000000b00787bb19f800si5167432qkk.406.2024.02.26.08.08.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:08:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dnGYXSaW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1redV6-00067A-6j; Mon, 26 Feb 2024 11:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1redUi-0005ys-Et
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:06:20 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1redUc-0005s2-57
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:06:20 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5658082d2c4so4104134a12.1
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708963569; x=1709568369; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=94ItvZTU8UjZJXpr7paETTd3/ZnKh3sFlCRaL5V+peM=;
 b=dnGYXSaWHYyuVjRL+wNn8lAfPiuLFWK6vBRKhqG1R8MIwilG5BuW91L6DVYWH1Fh53
 EnswcAe2Ei5UitacpIGMYZyL/+T5lik09JH99wCTCrBdkQJqUvsIUfulQaQiObbeRcm8
 reOPCTxQk5kl3Ed9Z6AEhBTMi460oqwLupaeVOAlVcZpFfrQa2JVX2WhAhXVq1neoK9o
 aETe67AJ28AID61ukeUUDvCicmbh2mqI4IqJ6srrz66BcfyQavtMQZ4R8v9wan+s1D9H
 4L8Q+paG8NcqyD2pbozjowiQdx+RLFDxGFfm5XPmSqDFIwrQ2+JHmJRBZ1NQQetisXMl
 rB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708963569; x=1709568369;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=94ItvZTU8UjZJXpr7paETTd3/ZnKh3sFlCRaL5V+peM=;
 b=wDSN2f3fBx0eJxoxuQPuI9n2ltARxyl1GtzNmP3EDv/VLjNeDF6R1/eLxOm3ziP0LA
 fAb/b1vIAXqXCIT++8ip3S+pwhDVeGA0QbR6xB5+UT/f1W+eS2dcI4Y3QWg86rPVQBDv
 VYrAxRzP3rsLcH/reAoZIC+Rj/a3jKS8aOssMFGG5CjVIJT8PzeOCLJIQRp59IdCV0gf
 mv+AqBvwE82X0tmdQURo7aefaAB1tHxPUXN6vEPagWOpb0y4Wym4G6Pbs2e56gqJIiCh
 c6q9t5FxprtWSO2Tl2WYea92vXzg1x2joRCRitJHLTE6Bd82QbQFf/EKEPxlkcQBW3vO
 dD8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUozIBZAFheSAB+iiWa91EMfnn1h3PnanKj2nyUkpTcjsPEwgOIi0yw/fN6Gkv5sB8r61v/38A6wnxknPM3Mjm19SZh
X-Gm-Message-State: AOJu0YzTXqhvwK7KHRw8Iq8vpFtSzpIciJwrPr9Yd/am1c2XWwsjh5je
 CUppbBytA0fnKeKgUQh73SBWghrHNPcMGwnJ4bFohmux+Nv6D8AeTrpGXu1TqnU=
X-Received: by 2002:aa7:d31a:0:b0:565:dd87:9811 with SMTP id
 p26-20020aa7d31a000000b00565dd879811mr2617596edq.5.1708963568753; 
 Mon, 26 Feb 2024 08:06:08 -0800 (PST)
Received: from [192.168.69.100] ([176.187.223.153])
 by smtp.gmail.com with ESMTPSA id
 bf9-20020a0564021a4900b0056626973bc1sm104394edb.38.2024.02.26.08.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:06:08 -0800 (PST)
Message-ID: <df5f7f10-41ba-4c2e-8d50-9d35203d940a@linaro.org>
Date: Mon, 26 Feb 2024 17:06:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/41] Temporarily disable unimplemented rpi4b devices
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Sergey Kambalin <serg.oker@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-12-sergey.kambalin@auriga.com>
 <2ab7b523-816b-409b-a58a-f09e3f71ff8e@linaro.org>
 <CAFEAcA-WwWQnAQTmoCixaW5aeRWrdx__YoSHp_VyGEbk-rOkpg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-WwWQnAQTmoCixaW5aeRWrdx__YoSHp_VyGEbk-rOkpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 51Sr4FK2Ftuj

On 26/2/24 14:39, Peter Maydell wrote:
> On Mon, 26 Feb 2024 at 13:35, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 26/2/24 01:02, Sergey Kambalin wrote:
>>> +static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
>>> +{
>>> +    uint64_t ram_size;
>>> +
>>> +    /* Temporarily disable following devices until they are implemented */
>>> +    const char *nodes_to_remove[] = {
>>> +        "brcm,bcm2711-pcie",
>>> +        "brcm,bcm2711-rng200",
>>> +        "brcm,bcm2711-thermal",
>>> +        "brcm,bcm2711-genet-v5",
>>> +    };
>>> +
>>> +    for (int i = 0; i < ARRAY_SIZE(nodes_to_remove); i++) {
>>> +        const char *dev_str = nodes_to_remove[i];
>>> +
>>> +        int offset = fdt_node_offset_by_compatible(fdt, -1, dev_str);
>>> +        if (offset >= 0) {
>>> +            if (!fdt_nop_node(fdt, offset)) {
>>
>> Peter, I remember a discussion where you wre not keen on altering DTB
>> for non-Virt machines.
>>
>> Since these devices are all implemented at the end of the series, why
>> not add the devices then the raspi4 board at the end, so this patch is
>> not even required?
> 
> I'm not super-keen on it, but as you say it goes away once all
> the devices are implemented, so I'm not too worried.
> 
> Doing it this way around would let us take the first 11 patches
> in the series into git now (they've all been reviewed), which
> gives us (I think) a functional raspi4 with some missing devices,
> which seems useful in the interim until the rest of the series
> gets reviewed and committed.

Fine by me! Sergey, don't we also need patch #39 (Add missed BCM2835
properties) to have a happy Linux boot?

Patch #17 "Implement BCM2838 thermal sensor" could also go in but it
doesn't apply cleanly on top of 1-12); maybe Sergey can send a series
of "patches already reviewed" on top so they get in for v9, postponing
pcie/network for after release.

Regards,

Phil.
