Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp514004lff;
        Fri, 30 Jul 2021 12:34:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/wLrOD+MzDhPlbVR32bgIp1rjQsTng5OYDyA1MZZRf4CjeNe+THkOPk7HZgOhSJMKK9yl
X-Received: by 2002:a25:2607:: with SMTP id m7mr5353082ybm.272.1627673681667;
        Fri, 30 Jul 2021 12:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627673681; cv=none;
        d=google.com; s=arc-20160816;
        b=Zd+iTXErkTw/hYtVmzp3DHyWsoKh3l2razI4HKCxr+qwt4wBEXAxPsErzpOuwDFEDG
         lOIu/XAevD/bxLbpJ0fxXtx2zoO2XxTSSwuiw/iBLARbuJKd2o40wMMPc7TGKZPw2URC
         uqc5WrLN7kHYeiVCRBtjGO30X8h7DcOfjlpFppi+ZNWyxT+fsXe2myvWNSoSo8Wvp9C6
         Uz7ZyDznioy+4egcemTLuzdJMTjoPnfDbt74Lkmdv/mdiKiG4M2kmPxPE+bDcPvGAdi9
         KVbpXplSHO6OagUrHCw2tvTpql+tOeoHfLHwZf5WDmwfjy5QEAfJYV4/dRsv8sLgLmX3
         DEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rI8yTTJNSogWqt1+W06+S2su0oNWbXFJd2YIZCUKYJE=;
        b=WNNtZnuHp4PvOJL0K6vRQqisTeslJ3UrQVhrjQj26UXfVERK3USdcz8gcqafINcGBG
         2ga6AhdY2gwT1CUznod8k7coql47Af3MusCnn/keM1f0ghwmy8FW72Go/H+RAeYmnt3K
         4qITLQLsl/T0S8KFdzm99yEFW75LDlEzIxOSGwkKMIBIaDRVMwfKYPqCF7eHitj0i8ZR
         aKU6X+LAmnwR34laRYI5R9EhmqwOEwCHJWQAkMh37OSOChvwMEanKPY6mL8LSpeHa12j
         /E5mUGfYnCAGJgisJ0xCBK7fpOZj+2TR1nzPNpcfn1NDd1u6HbBQQglaqHmgle8TBPuR
         bQ8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hd0447OY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si2182255ybu.421.2021.07.30.12.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 12:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hd0447OY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9YHJ-0000TA-1Y
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 15:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YH8-0000Sn-Vb
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:34:30 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YH7-0004WC-Gu
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:34:30 -0400
Received: by mail-pl1-x629.google.com with SMTP id a20so12354362plm.0
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 12:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=rI8yTTJNSogWqt1+W06+S2su0oNWbXFJd2YIZCUKYJE=;
 b=hd0447OYELu4GNtAhmNtwkef7hLcRIsuee9/or4Y2npasfdIc+iKumIIYwyKdDd64p
 YC8F/Ynekv3KyAKN2dGeIo5lwEQ5puw/7gvokI/oxPUFKWn3+ibrLete3mhavP9exKMU
 BI1LBqIKoSWB1b+9Z/Zsai+e49IoB5G6ov7gd5nYDj1DZ7iTPvPdslFv4ZrSddN6+rn6
 bKTHrHfnViMQlZSVtmxbS6J9930Q3Ao9CX9A+Q5D9u1zHDuOHKR2ZpXj9CWeO6b6SnDD
 RsNk0YdguOu3QF0VwJiFJ4+mwHmMiAz6YzuAPN8PTXl1Jd32rGlDCHMAj3axMr4fNVnj
 qpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rI8yTTJNSogWqt1+W06+S2su0oNWbXFJd2YIZCUKYJE=;
 b=A2XmxE0uULHlLjsHneUzwebBPL7zbPkXqxpV3QqpQzgqDkDxd48L720LP8kWU8haDU
 2lGG39lAf5uyP9ZTiVBtPXq8OsTT2o7H34J7GBh2YL55sb59TSEPrEl/Yam2Feo23u5p
 mPyZl9iSAADryx00o8DuhXxKHA60k740zGhbFtz/B5DyRZXRwcTDt5wxByytKYQBNlQx
 lfKimibd3iTR2VLZKMIy8Ph9qYjxPPR1+mwLN75jqUMgGJMzrtewOQs/YK9QMndBvRCg
 yQ3rRAFA7RvE7XXQYblsqO9t5Z6IQ8tC8quwJWI7nSA64l95j23fMEXUIR89r74g06M2
 OUdw==
X-Gm-Message-State: AOAM532bh7TgEkXwi8fnQdNa+KmS/I7W/Wm5oYFsYrcqaOO6KNIPN5Av
 GY8n6pv7Pdocr/sGFtbQqJj9Ng==
X-Received: by 2002:aa7:938c:0:b029:32a:1725:a3d7 with SMTP id
 t12-20020aa7938c0000b029032a1725a3d7mr4115751pfe.64.1627673668289; 
 Fri, 30 Jul 2021 12:34:28 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id k16sm3104783pfu.83.2021.07.30.12.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:34:28 -0700 (PDT)
Subject: Re: [PATCH for-6.2 39/53] target/arm: Implement MVE VFMA and VFMS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-40-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3665bc7a-ce5d-9419-136d-3bbc78c72637@linaro.org>
Date: Fri, 30 Jul 2021 09:34:25 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-40-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
X-TUID: yBxCHW1rW9we

On 7/29/21 1:14 AM, Peter Maydell wrote:
> Implement the MVE VFMA and VFMS insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  6 ++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 47 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
