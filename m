Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp565598njb;
        Sat, 24 Aug 2024 09:36:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8YeBxgsZ69VruNuvVhiveasp6OO4OQtCARgHGZDKLg7uGXzhwrXvsDGhaymGa9RJLTSRtS2bSb88ZDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEy/6R0DDoBKIhI2PDt0fxPyDKD8urspF7wXu9JRlO4tiHU+L8IcQ3D13gIUoatnSEUMQ1o
X-Received: by 2002:a05:622a:591b:b0:44f:fb58:8c3e with SMTP id d75a77b69052e-45509d21ef1mr79063521cf.46.1724517390119;
        Sat, 24 Aug 2024 09:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724517390; cv=none;
        d=google.com; s=arc-20160816;
        b=A3rTV4nX0BXcIRVZQFYimrGs9MkmCiRGHoIhrMwt0lam41fhm6w9qANZwZVQqtVQuZ
         f/GWs104jxJ18CjBC8AqBvVwWosk+IpRN4O0X8bjAd/ixHc4qXfkg/w9WzLEGkLDt8Nn
         MKFUeWHUihDp3KuobS8dBFSyG8rgppT9C0D7KFqplfBZ9hvS3l4v8E9f3/syBTY62X9j
         CNdBRigGJpGgAs6kr5CRKvwJIDkYkJO3dVXgFjnZeLDnnL4xZYzLth43lymb0NG7juwo
         1Fn+xTkm6BwTQvdO4I4bmpuvf9jDBHixBk3ctb0d2eAnu4eEovPgzh6ga7RKGFaUFrCT
         RGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:cc:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sH/QiTEgbTNIqK+XvtSniUZyfSTINGeiLTCgiJHHDIU=;
        fh=KVK/ENikhcaN0nR54wLN7PJeP5CAsLPHawRFhPUJI24=;
        b=B3GtdWdFKepks02MIvWxDcHPlu57Teb3bhphxf1Ofg9DMjiSn/IEtepZx5udpb4fob
         +0tsqfts5KaR+/ITQ9XGWetH8/q+sG6ies2kK0bJmveizoMyZLIbDSeQGm4vxT3D2kmt
         oOrctKZAsDxkH/irnkdT/aKiDJhsLco9bYwV7WlV8ysgx73TBaGK7lUJV0PslSgdq6UB
         CKKItW8EH/b1yZJEaa08KmP5bbw2gXdqiQN3DA+aH8TFbAFq1/41Az/f9OE3szOFFs4c
         oZdSK9CIxSLZvAra4Pi+adi5pbIaKQD/1EnV0UVZVKxFTMXnakKIlvIdxDvtUNQpe63q
         Ne6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rl63DDjG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe0d2e7asi72624901cf.1.2024.08.24.09.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Aug 2024 09:36:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rl63DDjG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shtkO-0001tc-Px; Sat, 24 Aug 2024 12:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1shtkL-0001rN-RR
 for qemu-arm@nongnu.org; Sat, 24 Aug 2024 12:36:14 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1shtkK-0001Xu-8o
 for qemu-arm@nongnu.org; Sat, 24 Aug 2024 12:36:13 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so304598366b.0
 for <qemu-arm@nongnu.org>; Sat, 24 Aug 2024 09:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724517369; x=1725122169; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sH/QiTEgbTNIqK+XvtSniUZyfSTINGeiLTCgiJHHDIU=;
 b=rl63DDjG4OckVYK0cYhXvEMCmSIGYOlbN3PJzUDWBcbBY5P+DVKy6Awvh3mOoZ6FSM
 WCW4Co7TF13ltmJ3ylIXSd66HvORbBtAJnjir/Kfo7uKWeZOT/TijMh/5aDFTLWczlli
 ZFttcnvRXN4HXpt9HouzvK6RHHwdAlQCrbyQi+oQb+DdvMOzbeF+0EwZdosSgWf+QET9
 5tpBSH4t0I4Hay1nCLNoaOMgsyQGptRz+AlmwI+CFkaedywuX6HUNyemJ2WkcqC4v3r4
 vyf4vzkSTa5rwirSBx54gLPBizpj+3glNwfTDFXVgqcRmqE1xh42LJfF5RYsi2gsCBUe
 cZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724517369; x=1725122169;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sH/QiTEgbTNIqK+XvtSniUZyfSTINGeiLTCgiJHHDIU=;
 b=Z4V+wpjx5dXj+V+cxfWWDI1jwSxX6dgmO/ORgpODw3k/INqcSLq3SHxByZUK86ztTU
 t3DMw+tyf5tAXyeBDhBDV3o9M3AMhH+9HOwl/sfZC7XaB1ub/N7+8l8rYY0ZzTPunKU2
 RzmOGrmnOYvKnNSe+wBSTnMNfhHr5g9MjqTVr2rf/tcMoBV/1evXPmD8YZRUHtZDSMxJ
 MD953JU6x04WRIl/FPnxrUDUjdrX8xed0LA7kIvjzI+Ay5tpC3U2xiHX8eapOyg8UEpU
 yh8PEL0Oom/Dpu4hi7VqFi8KbYsLxY2labc3fLuRCf9m0yUtsVGx01zM9+5wsku5Hwev
 pe/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuCy5Oz6etg62dA/Q/2vs7Chmnizojt8fnYUuL6ygyFipnbzh6TCCUGmYW/auvLMRMnGLi1bYeIw==@nongnu.org
X-Gm-Message-State: AOJu0YzzSoKQiD3Bc0c4Y3u7OIGlxDLVkinHxIoavO9Mj3wWZwKkZwL7
 QQW+P24Qr/qzAbVu64BjvzjhWCvfI1Brbhm6X1IbjWYI3/pkKO5n2KwT3U+Q5O4=
X-Received: by 2002:a17:907:1c2a:b0:a86:97e3:c6c with SMTP id
 a640c23a62f3a-a86a54df91bmr387352566b.65.1724517369456; 
 Sat, 24 Aug 2024 09:36:09 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.198.30])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f43661dsm420279166b.100.2024.08.24.09.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Aug 2024 09:36:08 -0700 (PDT)
Message-ID: <95246f95-6231-4c16-8d46-421901778507@linaro.org>
Date: Sat, 24 Aug 2024 18:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel panic - not syncing: Unable to initialise architected
 timer : unable to boot Android 14 with qemu-system-aarch64 on Ubuntu 24.04
 X64 bit
To: Mario Marietto <marietto2008@gmail.com>, qemu-arm <qemu-arm@nongnu.org>
References: <CA+1FSiiUFeXRvyCk3KK7XfmUjLzOvBLo=VhcQDiZ1z8kgfpjyw@mail.gmail.com>
Content-Language: en-US
Cc: Sergey Kambalin <sergey.kambalin@auriga.com>, qemu-discuss@nongnu.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CA+1FSiiUFeXRvyCk3KK7XfmUjLzOvBLo=VhcQDiZ1z8kgfpjyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: rZkojZnBGvYn

Hi Mario,

Cc'ing Sergey & qemu-arm@ list.

On 24/8/24 18:11, Mario Marietto wrote:
> Hello.
> 
> I want to emulate Android 14 by KonstaKang using qemu-system-aarch64 and 
> as model virt on Ubuntu 24.04 x64 bit installed on my PC (Intel I9 + RTX 
> 2080 ti).

You already opened an issue for this:
https://gitlab.com/qemu-project/qemu/-/issues/2533

Please add "-d unimp,guest_errors" to your command and attach the output
to the issue, we'll update any progress there.

> [ 0.000000] timer_probe: no matching timers found
> [ 0.000000] Kernel panic - not syncing: Unable to initialise architected timer.

Regards,

Phil.
