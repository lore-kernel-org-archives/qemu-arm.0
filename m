Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp1503458nji;
        Sat, 13 Jul 2024 14:09:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVm7AQEFvNQpmWKcqJn5tFmrD0f00q7/U5f311RqNRJlwToQtyTQl8KquLDyOc3UswTuPcFcvm57GvrQvYlXAVoP4hJU8PE
X-Google-Smtp-Source: AGHT+IHj/d78jE4wzBIkOVA3vZxyMD3E6agNZmkoYbsPAQcbYV96ZaVPCZpNxz8ihpr7SD3mnI5H
X-Received: by 2002:ad4:5dc5:0:b0:6b2:da77:9a42 with SMTP id 6a1803df08f44-6b61bca184cmr196383656d6.16.1720904947318;
        Sat, 13 Jul 2024 14:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720904947; cv=none;
        d=google.com; s=arc-20160816;
        b=L0BTMb+ltz5SQR8triauxWEURnQf6jPXMFNwq5jngcfudTmt9qQQFmv5Qm1kSSSNFv
         daTVF1hsYPJBQVNToBodvJ4WEWKY5f+snLEkHZiquvU4mR2DNN8MFE5O2wRGIvk8HyL/
         LmEXvs9k6Q7z88M3MfMBeUTg1Ni+e7YCwtrGAh3Kp7+gS41Z2UwM53LexVQU+XAHLQZj
         PbK/iDP9Z83MnzYJtF56IasRLtwaWuFGD66q+lrF3SMT2I/Y3mJbczfGUttNPwBWpMUc
         jzjXASwVon/LxfhDEjmmt/iy+wOz4INctHbsrB/CbBqIp//41JRwCSog2RHLejHdtSYy
         B0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Xn496lNfN+tjORBu0zJyIt7OHIqjOOBmYg4cfigffiY=;
        fh=IAjlJC1/ez3obLpc3Iv/0lUh4sC5WpdCE1igYwr+A4c=;
        b=vXA8xQDnx8Ysz5dRTRvOqqV8iRTmVGnwauqx9ewAtM5KGtL47clRqlN1jiBs3AQv6e
         6RA2N9oWDiRXb0HOsHxJyB/zMyo5aSWiPDHLElymnOZdVSQCBvE+qhJZsqkraZZNAEj+
         r3umKCLNdVPXuo1s46UALqpe8wrTDpQF1JQty6A5E37/EkDeaPdpziSEgDYfaMt1cnnG
         y4eI01TfAtMonforjVRlHKDWGRzF5cnjGhCufNf54c3t7ZLBPW5KFQehsb13s+Ah5bPe
         onYywnD9T1wqRvxx0codkdwO55vE8at32q/z7LpiNmMdmpx0EU6kAIIb7Pexh3FDTXQa
         3ieg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KXqDa/zy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a6e984si19782976d6.566.2024.07.13.14.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jul 2024 14:09:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KXqDa/zy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sSjzC-0008UI-TB; Sat, 13 Jul 2024 17:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sSjzB-0008TF-6q
 for qemu-arm@nongnu.org; Sat, 13 Jul 2024 17:08:53 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sSjz9-0004aa-G5
 for qemu-arm@nongnu.org; Sat, 13 Jul 2024 17:08:52 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1fb222a8eaeso22478335ad.3
 for <qemu-arm@nongnu.org>; Sat, 13 Jul 2024 14:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720904930; x=1721509730; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xn496lNfN+tjORBu0zJyIt7OHIqjOOBmYg4cfigffiY=;
 b=KXqDa/zyrMfqW6lQF6SVduSrPYyorubkcLcvL0VltdmGU5GaG+8/Bv4HZunV07IRV5
 mwrklMRO7g6D0jOruTEqzJvSsvFP99Yixu3CzKfDIs3BvDRaAibotamDM53jfS7kDfPj
 aW/+BeRnIiojObjwvnmZGzBC2tprInQXSN/6ymVsDq0sLKGl47Zs7+PZYbVaOtHGsz9S
 QvBlRHR54rqcAJPGQK+G7feodzEB+9w1w0e5tJT9q+w+JLMGKcLHGduiwK0+ujyUy3RZ
 PBKvuwePMBOw0Dou2qxPf80tTLf86P5BSWK3nTZ2I25dTXZo5rp+ksulFPLw4nFXqySr
 szBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720904930; x=1721509730;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xn496lNfN+tjORBu0zJyIt7OHIqjOOBmYg4cfigffiY=;
 b=HiVf0OIG2WQ1wB1QjSCNUVRLSk8AByup3WsM5OQi2dd8tTVGZyzuijgQ6x8SGZkcBq
 Jzoa0V4d+wT9t0EWRaB+ztsJT0whmLxG+MFMnHlQzDpRQ6jw7BV/K95lYlQpq9W/KyGh
 AnF1TroaELNzHONGN2vqaWplrtSPE+MohX+yNa19KHWxarRt8kiqmomfRdaMsMSFuYE8
 BJBQnMuSzvzg4bFb9aeDh/quHYCEPbSq5wXG4D3IQfht8WDMSxQ+vMJLGCTHu5ln1PL0
 YLnFtkXFoU2qOb7G7bw/0IKO0Nnq1CW1wOLSfjpkvgVlfDJZD1w/5xm7vy1XOFRen4Al
 H6ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmrt7vcGdYIOn1jBBiNG1pSLHA9Ro+zjhjrEoohwnKohU+tQ1xNgd8Kb0WCbFKOB+9GPphqrMCa0Ka5Qon5OZEJK3B
X-Gm-Message-State: AOJu0Yw3gHC2BWZBGAwH3ltXJo57u7+tquEc+5oAcdZ8Usbu69sab03z
 J3ukERXHdjp8aXz87c3Bl27XIz8x2WTwH+d24BMxuvii4Hw9cYgbgoDRIeyVzZDRziN166h+bpJ
 B
X-Received: by 2002:a17:902:d490:b0:1fb:4f91:6728 with SMTP id
 d9443c01a7336-1fbb6d5fee1mr139785165ad.42.1720904929989; 
 Sat, 13 Jul 2024 14:08:49 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.169.129])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc509e8sm14109325ad.284.2024.07.13.14.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 14:08:49 -0700 (PDT)
Message-ID: <bf42c103-2328-4278-98a0-0df732515aa3@linaro.org>
Date: Sat, 13 Jul 2024 23:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/bcm2835_fb: fix fb_use_offsets condition
To: SamJakob <me@samjakob.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>
References: <20240713155656.59431-1-me@samjakob.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240713155656.59431-1-me@samjakob.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DaATzHl5Gamq

On 13/7/24 17:56, SamJakob wrote:
> 	It is common practice when implementing double-buffering
> 	on VideoCore to do so by multiplying the height of the
> 	virtual buffer by the number of virtual screens desired
> 	(i.e., two - in the case of double-bufferring).
> 
> 	At present, this won't work in QEMU because the logic in
> 	fb_use_offsets require that both the virtual width and
> 	height exceed their physical counterparts.
> 
> 	This appears to be unintentional/a typo and indeed the
> 	comment states; "Experimentally, the hardware seems to
> 	do this only if the viewport size is larger than the
> 	physical screen". The viewport/virtual size would be
> 	larger than the physical size if either virtual dimension
> 	were larger than their physical counterparts and not
> 	necessarily both.
> 
> Signed-off-by: SamJakob <me@samjakob.com>
> ---
>   hw/display/bcm2835_fb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
> index e40ed2d2e1..650db3da82 100644
> --- a/hw/display/bcm2835_fb.c
> +++ b/hw/display/bcm2835_fb.c
> @@ -145,7 +145,7 @@ static bool fb_use_offsets(BCM2835FBConfig *config)
>        * viewport size is larger than the physical screen. (It doesn't
>        * prevent the guest setting this silly viewport setting, though...)
>        */
> -    return config->xres_virtual > config->xres &&
> +    return config->xres_virtual > config->xres ||
>           config->yres_virtual > config->yres;
>   }
>   

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

