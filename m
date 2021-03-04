Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6567937lfg;
        Thu, 4 Mar 2021 12:46:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxs1F+xvwH3/z2XYAYJbkrqkd8vKkE0DbZBbrwT2S7A1SKe/dSgOAvvORDXrohlnx20zBF7
X-Received: by 2002:a02:cad9:: with SMTP id f25mr5935513jap.26.1614890780883;
        Thu, 04 Mar 2021 12:46:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614890780; cv=none;
        d=google.com; s=arc-20160816;
        b=pquBzCGZc0uDUJYYYLXxfrKdRzmEumNQIhw5vA4Cjn/VPKKFt3VmIMBb10OrlLsuWW
         pcvPiKOSvHG0VpVycMLpusxuT/uVQWA33xQN49zhWydKkMunJ1Ht+Nc0lLi+OgUdL9La
         U7W5Ve1NqnLtTgtHLvkA11AiX8iR4HHX2mVv560Alf5Z5tV96G7opmFEYH+mk7uWGS2G
         c0/HJY4MRYuMFWg8KNbfMGkVuwc47QFZoBodzvGssGoSEUF9OQrC1rHV+Tgd7ozsVzzt
         wpo+SGWON6BFpeFrcHg7qqgK8UBaxA/J+9dAWkwFHARPDyYioLsJlBvlXb8aPRNfMh9T
         SB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cFoFhqRA5r4dBSOzdMfGhRBEZAuexVVP/n7UE3UBNOk=;
        b=yUIS9DhwNHM2khbNRx3Gl3MX3PLEx9+mJ+QaLjoKLmFvVwff0y8I12DtAqbl6WxLle
         LRcH988/nrCyRRYon7R0kUh+Oz+LQTSzfhgkQLcEA8SmV3N76NekzN6vGPA/V18uGSM5
         rEKsGbGSLgm0s51keXLUuwgnHHyDDW3FhSKFIDwpI6STpZ8AZVeRF3d0g4iu3V/mHGYR
         BV9+m/jlOTAk6w2c+IisoH9/1PEMIFB66cwHwxkwsfHZ98nOLnfsPKvPcdc0SeuDZtuA
         EcC0ujPeOfb+lAWZ1HmV6K+VCkjjJ2Ml7DinHWqxscYpvYXim3cQteKr3nsSexLt7kJr
         hidw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xo0AJHbC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15si331085iob.21.2021.03.04.12.46.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:46:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xo0AJHbC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHurT-0003XL-Sb
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:46:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuga-00013F-Hh
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:35:04 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHugX-0004u3-Vl
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:35:03 -0500
Received: by mail-pf1-x432.google.com with SMTP id j12so19763398pfj.12
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=cFoFhqRA5r4dBSOzdMfGhRBEZAuexVVP/n7UE3UBNOk=;
 b=xo0AJHbCwkqoJrSicJiwrrbtA6bY7e2D6MY+kLxLdhLEM2wPqumrKpFwLsnWkQ/6fJ
 2u0nQj9tZc/Kf7I77s0fCsacYrdO/iGecV2NFmgwA7NSGSQO/vgjERa1THbzxtTkBlJ7
 QcYfQWS6Hb92ZIF1VTiIv4MICr4yAVaU+FjQdlltay2cIBvjZf+RmkVkiPyzANW6ea5/
 a3+lZrTnCAmVRGXuf2h9Mar3y0GTlfAfWrBpD4eXC6OF1hHr6cIPRH/11IlM7sz7kuTh
 /4DxK8ipkptAJI4FGSqttM8GoT7q3vNpaTmRj5ZXpark7lYy/qzh2WSfSF0TUSWNfb5w
 KXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cFoFhqRA5r4dBSOzdMfGhRBEZAuexVVP/n7UE3UBNOk=;
 b=i/Jej7NGwcjFsL30OcGxIQE2ePUR6HALPojtwOAVfs4kNNRHxCERlsp2MwkIafBgI+
 6Ydp2GBCDnowbABA0O9/NlENhyNxtsbmQGBNByEKPWdVhdgkyJHJNc49KX0E+3Clftpg
 uS+PVZgTUEgkWg+qP7i2/XYdrxvyjvEAz2+4S/2FFXCIiXLxrySbtkgD7ut46JnBJ85H
 tdQd95BGiwz8y7dwh+MfL8YiMLjak3ynD5jYI06jZOgyeh7GTXsLVAmzmiSgf/R2iusF
 Y4Z1TyiKqcl3biilN18ESQE6wmrwJdBly3vK+C6iMYvRXq2hxDV13Ehr30J98Nvhc3rQ
 gQuw==
X-Gm-Message-State: AOAM5310rJohO870WPn2njmU/N0COVgXcKU/MSoU1ksa8lMZGsjx9y/R
 eQfY6wN/Afd6n+a6ZqE+zjD44gvSP5v9Qg==
X-Received: by 2002:aa7:9154:0:b029:1ee:fa0d:24dd with SMTP id
 20-20020aa791540000b02901eefa0d24ddmr5381073pfi.17.1614890100450; 
 Thu, 04 Mar 2021 12:35:00 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y2sm254220pgf.7.2021.03.04.12.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:35:00 -0800 (PST)
Subject: Re: [PATCH 33/44] hw/arm/armsse: Add support for TYPE_SSE_TIMER in
 ARMSSEDeviceInfo
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-34-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f73b9067-17e5-39e3-cbf8-843bc6ceae6d@linaro.org>
Date: Thu, 4 Mar 2021 12:34:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-34-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9mKI62vqNwrV

On 2/19/21 6:46 AM, Peter Maydell wrote:
> The SSE-300 has four timers of type TYPE_SSE_TIMER; add support in
> the code for having these in an ARMSSEDeviceInfo array.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
