Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp658939ejc;
        Thu, 12 Oct 2023 01:53:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECWuIBTvOwApjyuZ4MK3LFTUbPqDLEKeNqVLF3t31TmQC86cCY1WSa7uzIKMUYhDJHNyFA
X-Received: by 2002:a05:620a:d83:b0:76c:de57:7b61 with SMTP id q3-20020a05620a0d8300b0076cde577b61mr30394463qkl.25.1697100838002;
        Thu, 12 Oct 2023 01:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697100837; cv=none;
        d=google.com; s=arc-20160816;
        b=bH/gZvDa+y1HzTTYnknrBAZaJZnTzeE9n+Y0HqJMH04mbSYrc4cDxPOI8YTCqiRTFM
         2IV6fvMQTp+EVbdAROfMeT53++4v56YFCIy7JZJbMHRIZ6Wh/DK8KSCVjd+S/4Sn46aL
         siGSOuofV0Y/nBKmPnQIVKGfPEnxd6p/wyHGvo5zhQBMoVcNgO6MuMQCS9B25aJyixjy
         nnweTmsI/QmAFQ7CKqPSzQo/zQSwMFmmK9sSaBhvpiQRX16d7P4yATiG2A0S7KdR+qf+
         0r0a3UK3pS54i4pbXafiHAyUc78nYpxh4LeAPeRZT/r0XpVX/R4FrBoXiVlUyNXUMcv7
         S5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=PmCWNR9xqOyV3ZttPj9i9DCezrvDZ9UsSuxJSQeh4D8=;
        fh=zxqaLs5oQCDCMSvHni3cfldr/walGNRtpWll8QWVLmg=;
        b=cxY0/wQscDyR4mHse669wUFo8Zj4iQZTan1YJoVdGD6zLoJRUGpmdfdquFD1jWJ99V
         pe4PIANibgwLnUXmAYYVdR1hvZI4cFCP4FxwTjpPisYOxfBDZv/gZ5To79eKPdhQH4xs
         srky2GfM6W0DTF5/7JUz8yT//Yt9tJdnjKpZnJ2HanJxVbotOguvLSh/1GsFSragNTCf
         ih7AOVbPN1zRFcX8ldycW0DXSuhvr0YY2JXF+T5F3MgJpx1kQCDeKy1e23bnq5MNVTnT
         Q+icICNWrNThsC4ENclLuCGnU1Gmx+qYco2rtup9rpJ/NZCDEibnSbbOQt0aEWD4H7sb
         Ee9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KaeISB/U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rj1-20020a05620a8fc100b007756a7b3dfasi10363045qkn.503.2023.10.12.01.53.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 01:53:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KaeISB/U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqrRZ-0004eE-5e; Thu, 12 Oct 2023 04:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqrRX-0004c7-SY
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 04:53:19 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqrRI-00065a-CY
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 04:53:19 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-503397ee920so940684e87.1
 for <qemu-arm@nongnu.org>; Thu, 12 Oct 2023 01:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697100782; x=1697705582; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PmCWNR9xqOyV3ZttPj9i9DCezrvDZ9UsSuxJSQeh4D8=;
 b=KaeISB/UCzOZOSs/jImzoKKeTMyPIoExLbjeE0aLUWMJ7MtUVUlcfHKRiEZTQMrsVT
 UotfZjqW75YieRmQFfyCC5u0QVLH1fVaNw3MvsScGRkWAnOl/jXeugX/MjK5XfgRRlx1
 PR3FhTUkEaWpHAg71YfH2LhdUHSJUHlDmmf2xqY3xgdHr3PCyrr2q7nRloVy9B91+Kdk
 9iW9C37UZB39iBVkV+FJQqjeAAEE94L48ZIljOwenHqju7RW1PTFhtCd0QMXRGPlYWkd
 60x+IbdMv/eDmFta07BR7MsEdsr7Q+o+IztqTxcuSL2H7ZfCQDJpp0bsi3NkTF0EJU3Z
 5bNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697100782; x=1697705582;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PmCWNR9xqOyV3ZttPj9i9DCezrvDZ9UsSuxJSQeh4D8=;
 b=HcA1m4MetfmEUifWA0+CPMpWdEdoWCBEdJhhMsuolh2bTBdjk8PHvwWXWRnKLwFzuV
 nIt+UvJSyK/x7CsB+2JKti6+3tjnpU89REvdRMndzgw8CR7WLzTgPytSWqqmvz0wJVJy
 OWT4ELsy+vCS91j/DygNTsHqeUj6w6L8tg5GW7+E07flq7kbGtRZGBoipuBH+n54ffeq
 BO7LsdYgkeXEA+fPFdVZfFRiytgFcTUssA+dnl0PTDJqyXwmLfzcvaLGS/UwTAZYr+oR
 J3GrFAc0dWyTU3nDrRB5MQYvbmxlUewd00S23R2O3C3MTm/ziyj6xwNoT6Wji1qcqG9u
 ZyQA==
X-Gm-Message-State: AOJu0YyCUvqh9iyYPsTsNT+XrJhlZ4xrNl/rk+rPiCThGHpxj183k/Sk
 IKTK8GFLCJz9ETyIN3EjxuUG0g==
X-Received: by 2002:a05:6512:4026:b0:500:94c5:6e06 with SMTP id
 br38-20020a056512402600b0050094c56e06mr26193362lfb.56.1697100782117; 
 Thu, 12 Oct 2023 01:53:02 -0700 (PDT)
Received: from [192.168.26.175] (192.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.192]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c470a00b00407460234f9sm13711483wmo.21.2023.10.12.01.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 01:53:01 -0700 (PDT)
Message-ID: <41fd8262-54e5-11d1-85fe-e5e53bb802c5@linaro.org>
Date: Thu, 12 Oct 2023 10:52:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 100742/100742] target/arm: Adding a check for the result
 of calling the CPU information check function
Content-Language: en-US
To: Sergey Mironov <mironov@fintech.ru>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20231012085005.848149-1-mironov@fintech.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231012085005.848149-1-mironov@fintech.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 SPF_HELO_NONE=0.001,
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
X-TUID: 5B7F+Hk62Mpl

Hi Sergey,

On 12/10/23 10:50, Sergey Mironov wrote:
> 6 out of 7 calls to get_arm_cp_reginfo() are checked
> 
> Signed-off-by: Sergey Mironov <mironov@fintech.ru>
> ---
>   target/arm/helper.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 74fbb6e1d7..cffbbaf571 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -198,6 +198,7 @@ static void add_cpreg_to_list(gpointer key, gpointer opaque)
>       uint32_t regidx = (uintptr_t)key;
>       const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
>   
> +    assert(ri != NULL);
>       if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
>           cpu->cpreg_indexes[cpu->cpreg_array_len] = cpreg_to_kvm_id(regidx);
>           /* The value array need not be initialized at this point */

100742 patches would be the biggest series I ever saw on this list =)
