Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2406853lfg;
        Sat, 3 Apr 2021 12:46:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2+J0k1MrUec7FJNQa7XkyqyHtAwkBkZr3QrPsDoWeQ46PZUVe1kWKp/Cki4i5BDsDAh5v
X-Received: by 2002:a25:244c:: with SMTP id k73mr7577228ybk.352.1617479194339;
        Sat, 03 Apr 2021 12:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617479194; cv=none;
        d=google.com; s=arc-20160816;
        b=v2+KSIB8YM5MLQPQeU+Z8XsY7G7AvUIxl1SLaVZL4d293ue44HKyZX27/krHKk1KZB
         flyUkJnqwT2v5+UVFEOKHROXNQwWZIYQglc/gCqkwGViw6/7UilGO9gvNFjHV39u/I5X
         TCmC/hfz/8aR47kHKVnPNqW0Sdb2BAzJ8E/2iYeTDPZWMgeB2L9LIjxgvskonfjH/bzM
         udrV4515kFS4rDE21nOTxIcfWHrJLXMRmQzh9SbxsRqxaFAOe1LabRaJzQmDE/cw6Osy
         NaZ9t+4hG9PBskDbYL1F/jJiOqKMSrJYKn8JiL9idpFmJN5+5cl+gdSglRERRQ2E7z59
         WfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=aWuMgXK2MjXEvdnVSP4NmEJDJEsKhp+6uFfDHtB0Yvs=;
        b=t/dOhUx9EYSGTv9HjDyyzZigNMLUqU9AEgExCBfKj2mEo7KvDwWkJWrrDhdaIgdM5F
         uSGekVfowiHV0GIZaqdw8kR42avkGK/PxwrmWaWEAoeDjlZ9VO1qsx+ZytmsiMu1Dy90
         SWbAAZflbI8+p31gNkFmiFHFjehCf8lqMMnsyZ3QYW37XAUeBmWY+z0LUpqA1S/Ev4+M
         Yy6mVJ8j/V66FLGooSXRcFI1rTvOberm6G3OtjVDAtFeiUI2oOmBKyGql4idi1Zm19Wf
         GIsyFajOwdFaqRjvvHFDJpSRWGKXuH620Dg4Tr5j3xN6FGOSxSteVSuKE2cM6pD29Kda
         IeVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LgGG3gN9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si11652782ybm.83.2021.04.03.12.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Apr 2021 12:46:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LgGG3gN9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSmE5-0007S8-Mg
	for alex.bennee@linaro.org; Sat, 03 Apr 2021 15:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSmDx-0007Rv-Vj
 for qemu-arm@nongnu.org; Sat, 03 Apr 2021 15:46:25 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSmDw-0003AN-Fg
 for qemu-arm@nongnu.org; Sat, 03 Apr 2021 15:46:25 -0400
Received: by mail-pl1-x633.google.com with SMTP id d8so3906417plh.11
 for <qemu-arm@nongnu.org>; Sat, 03 Apr 2021 12:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aWuMgXK2MjXEvdnVSP4NmEJDJEsKhp+6uFfDHtB0Yvs=;
 b=LgGG3gN99KmLtbYX81UMem31/ijnlDH1Zs2Oy4AWjrc8sOPsPvSpXP8rvrklw+bJXh
 w+7rDGX95lOeaQ7zLkT8HITvXndI9lDeZ/C2vovqW2V1Wt6odsEEewAoOc1FY2h3GQ7L
 WZ7AIN6O0rPrak8kJCU8qv6txXlQS01krNAIRIRw2Ny9EZoEJaLzkJQfGaFdeidLj8l4
 acJA8VyhDlHqGH3SCFaFHpAINFtAc/WRnor1q6etIOtxBOu4ktVIjm2s1C8zFEL+sRk7
 oOxbyZQkk1HpkksNx7LP0pUy10r1htfYDG/9eVD3ybYArrgOWHfk+riW2TKn/fcQzonn
 8XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aWuMgXK2MjXEvdnVSP4NmEJDJEsKhp+6uFfDHtB0Yvs=;
 b=UT4Q7X3tmpQEvdOuFot7y6tAXyqU7cXkxNjNaxhwN9/9nj3VAwiK5SI6rFdqlHcJuf
 Iz8zVFoNq2tSHlq6iIqHv/lZyjoR4OTjmcGvF9OZPGgdyI/HzqbP2NwGrEouyksygg6d
 7lFPNqZrfFQWsMporNxH6D9n9/axtZDYjAXQ/UoepBterzRIeYvof3AZPyjjs11AheMm
 Gb/ywunLZuqXkYE2ZVtIWBwy6+5rg5yOjxTV1ZvIAQgdRGtpPD2b9BS+DdXgW2Tim4dS
 hI4XaCTfc70yz/TfONu95SAkywzGkjTqHGlcNHhG3QJ3+H3amQZtKUZbZj0wlPaRHdRN
 1Dew==
X-Gm-Message-State: AOAM531gbN8wjpOuLzZT4wXGA4ppA9d+uItJb4htsVyAm3UkzM9y7xFa
 itcgeAbmjPVCRstG5NMSDuP/fExPsSlZDw==
X-Received: by 2002:a17:90b:4c0a:: with SMTP id
 na10mr20169860pjb.227.1617479182621; 
 Sat, 03 Apr 2021 12:46:22 -0700 (PDT)
Received: from [192.168.81.184]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id g3sm11424189pfi.31.2021.04.03.12.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Apr 2021 12:46:22 -0700 (PDT)
Subject: Re: [PATCH v3 00/11] target/arm mte fixes
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210402214217.422585-1-richard.henderson@linaro.org>
Message-ID: <223bfe3b-8959-efca-ddd7-2e1103226a05@linaro.org>
Date: Sat, 3 Apr 2021 12:46:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uil2XC7wLr9S

On 4/2/21 2:42 PM, Richard Henderson wrote:
> Changes for v3:
>    * linux-user mprotect fix moved to start, just to get it out
>      of the way while I reworked the others.
> 
>    * Patch 2, the fix for unaligned accesses, has been split into 9.
>      Hopefully these are much easier to review than previously.
> 
>      Technically only patches 1-6,11 are required for bug fixing.
>      Patches 7-10 are only cleanups, but I think they're important
>      for clarity post bug fixing.

... and it fails all of the kasan unit tests.
I'll have to investigate more next week.


r~
