Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp851850ejc;
        Fri, 3 Mar 2023 01:36:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/ZTLP062kqg5Ldj+8OQWRDSLZuZhVqb6qzF60vkNwsr7OeMAwe8g4ccsAX7MWBMToAVTxO
X-Received: by 2002:a05:6214:19c5:b0:56b:fb30:49c6 with SMTP id j5-20020a05621419c500b0056bfb3049c6mr1682328qvc.50.1677836188120;
        Fri, 03 Mar 2023 01:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677836188; cv=none;
        d=google.com; s=arc-20160816;
        b=0AH7+opso4OY52uzdaCIgnuIeBAsoW0mFdIgoWxddUHj8SB22CWqLGINkoUwcK0G6A
         AjdGK9+sWDOoWiuau62vyHCvfWI2RMzXM7KX9uBrZ8MO7iI8jNjUUrj9gVWrSY0kCPGF
         TxEUAh37NW1vxQXU2NPINu7/HIKHH67bNBei6lH+TTnFk4eP8ljCmihegHCFPZP+DdnV
         mLiL/xQTVMwC/OL0liXdBEkzSSyCDhEG+RN8BlTiB6FPA/dLSGIltADYXXbbwHhOlMRJ
         Hz7OGNuC+fdizvNpAkYzW01ignti4aqWQWwr5l3olMHYYx+kP+mlk3Z/+Xd2AHLRGppT
         iR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:cc:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/F3ZNLmTHCITwoT1uPJ0GCKQVMa0/fl3kytYyGRwMiE=;
        b=FKe6Fr78eWqRceeM84kJ418RYcdCVzSbkw9CGQIMIvWC0Nljic7jyziTFp9tbgu264
         E/sTyAo6RFsQqobmpPWbJZPN7KrUnFGo5S/8I2a2cwjyletAd1QLGF7XjgobtNGOptdy
         L3c9rysma7rr7hWDvYar+fOuYfcEAF4i2XEdfLUMCCZqYtMWAilflQ3kD+OrkIQw+Bzk
         75xMlKWjxa2AN2WlKllJUC+b2wgadXRm0bZcdkJGzH43CPHp+vdOnJ45mv5tvxwwbZG3
         Bbhi/M/qaCSk1rgmksQlwGNeaT3j6WOJ/Jg33Be9JkDER+lKy1jp/rf0TQ4ok0jEDrnC
         Idhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lYsYpWv0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14-20020a05620a218e00b0072c19806f79si1355259qka.662.2023.03.03.01.36.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 01:36:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lYsYpWv0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY1pm-00084d-8T; Fri, 03 Mar 2023 04:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY1pk-00083Q-PV
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 04:36:12 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY1pf-0005Ij-K7
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 04:36:10 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so3461455wmb.5
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 01:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677836166;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/F3ZNLmTHCITwoT1uPJ0GCKQVMa0/fl3kytYyGRwMiE=;
 b=lYsYpWv0EZKck5oY18uAU97WhBUA1hTSe0UAFRtwm7mFtcuqNYOVNhaBPp31NgyAQU
 oYDZjnHmwtZQevVBk54bOvtM1GL9EhPVrJxzROBSHqWi51HF3M921NXwG27eRJEfVl6q
 AW7RkXxYJ4x3PZVA9oAxqZR2nvOD4AODx5Ny8fU7HKY0WJZCKp1SZh75DhWEwUeF53Gl
 uyI0as8EeQG19uQCbhCIFHHpXZIBm1hQi95Fy7wNGTfbOoGgGTUOaNMrartiJmlWvBOW
 V1l1FLG0GxkZA0z3SvIB8lNy2y81HMsJlxZM0fnNW0d0QRYy5fZHBNNSeaaoF/KZfbs7
 fInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677836166;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/F3ZNLmTHCITwoT1uPJ0GCKQVMa0/fl3kytYyGRwMiE=;
 b=Sr2z8jG8QS9VCFlu7PRbs0j2u9o6ab0BaHxBCA3MJyU6O3jE7zr2vr1xIS0sXhrBk9
 pVxzIQX/kLpS0dtB+9d82P+4ljQXAwk4vi8OIdKrooJGoOxlNldAvc0r981myMPz8ozC
 4WW1ceqMS2r+hg2zHHbZZ+1dM0HL3cV6GpPk1zh9krheBRJLQar1nJK8FjJXadw1PqGJ
 2PfFa8FtA/CpV3VSHlBsdtLZavSLv7CGhbCz+mMfnokAnTXBLpxKwZSSnkRXuz5br+GC
 uByG2jMyV/Dt5+uEyWA2XVBxbdusy6bJrmRtu4IyBjdCLAb9mxQ9mMHEEdjGPd5p/2jY
 89cg==
X-Gm-Message-State: AO0yUKWAHuBy3dK/iNh5lqqRqDGKav5+V0ttG6IPVZ4EDdJg55zQVlTR
 hSlQ2UZAEQzbCGgeLl0TtH3QHg==
X-Received: by 2002:a05:600c:5127:b0:3ea:dbdd:66df with SMTP id
 o39-20020a05600c512700b003eadbdd66dfmr1005981wms.2.1677836166073; 
 Fri, 03 Mar 2023 01:36:06 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c33aa00b003e215a796fasm1818221wmp.34.2023.03.03.01.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:36:05 -0800 (PST)
Message-ID: <3958a606-1e36-9a66-0ea0-ef2bc9749fb4@linaro.org>
Date: Fri, 3 Mar 2023 10:36:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: Emulating graviton G3
Content-Language: en-US
To: Robert Henry <robhenry@microsoft.com>
References: <DM6PR21MB1497F02E1C66D07A066B1D63D6B39@DM6PR21MB1497.namprd21.prod.outlook.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <DM6PR21MB1497F02E1C66D07A066B1D63D6B39@DM6PR21MB1497.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
X-TUID: r3FAC9NyVtWO

Cc'ing qemu-arm@ list

On 3/3/23 08:20, Robert Henry wrote:
> I cannot figure out how to make QEMU TCG emulate aarch64 Graviton G3.  
> I'm working against master/head of the QEMU source.
> 
> I come up with feature names by consulting 
> https://marcin.juszkiewicz.com.pl/download/tables/arm-socs.html 
> <https://marcin.juszkiewicz.com.pl/download/tables/arm-socs.html> which 
> is compendium of the /proc/cpuinfo info crowd sourced from linux running 
> on real systems
> 
> I'm trying to either (a) add features to QEMU's '-cpu neoverse-n1,...' 
> or (b) take features away from '-cpu max,...'
> 
> Unfortunately, many names of implemented or unimplemented features are 
> not known by the -cpu mechanism.  For example, from max I want to kill 
> "smeb16f32", or from neoverse-n1 I want to add in "svei8mm", but neither 
> name is known.  Indeed, the only names known by -cpu are those exposed 
> via the qmp mechanism are of the form  "sveNNN" for vector bit width NNN.
> 
> Is there some trick I'm missing?

