Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1333416ejv;
        Thu, 28 Mar 2024 11:39:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpY5EGelj+GYFcpFphztds0NHayrp2eOvI3V625LHyr5K/gtZFVkE0lymZp+g0YrRgZlCL2Xw8sTB8AsSevLlLIxiCUXQ/
X-Google-Smtp-Source: AGHT+IH8Lv+FHPJO8KBmjuHe+ereRUoMJacZ3Ki5e5nfdxwKW3p4T/IQoxjuHesa4pDrsM/+by9+
X-Received: by 2002:aca:f02:0:b0:3c3:d477:62d4 with SMTP id 2-20020aca0f02000000b003c3d47762d4mr65508oip.33.1711651140064;
        Thu, 28 Mar 2024 11:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711651140; cv=none;
        d=google.com; s=arc-20160816;
        b=OUQCZ3nsPO6Ba56IrmBxxiVv7jqCm+Y2VHvdXdrAamyDrPr9CBHw3UNO6oNPJNUHsr
         aSdKJjfWhCxIcksb75zywt5v/f6pm4tmfmy1y33ZFYoo1Q6pv3hlpefkCPPwIGgEzqMl
         0xo8gZ5RRImwL8dxjSsIHlCkqDmNYL1t0Dur+awOz7BN4pVfvqSxQvsDp1QxnoJgxkBE
         vPTWxgP0kpIsQapKcc3g6OVORl9M30HXOpXwHtmPJcgRcF3iyPmtZrKWQEr3Y/NmOZP4
         P12ZCWrsyGHxl1hnv+yNNAjgpiCZmSI8+uDtJApjS1uMSTVzeO8HtWDXeEvtiGm1TONN
         IqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8k8ShgZpDq6NET7E/sFDOpXqTEBsCxuTZlNM10OEm+g=;
        fh=y7GoU8kqVrGH7C2v2uPbW1AJ4UBHAyh6f9wWn6hYl9s=;
        b=LykZRcNP9bjyyRP42V7weg3EWAxHbBOl6HTu9x6scfJI2suH2wZMSrW/kPDTM0b7oE
         XNvpSNCyn/cvz/V/DaWHe+i2aJOvvbcP6GB9X1P6+wrlgyP8dqK437RAC3b/L8tSu+oz
         4pKosKMpqsX49bgOURQ/DxL/9MkFTRkYNmhUc3Y0zmTau/6brM6p70i37kkhhqjqiFUl
         gRyZwLj4h/lB6fWyvkPh+Z8QNPIMLznEVTKeXUIDvE/m0ymeX9Fk/KFZELimvx/6v7oh
         PZXE6VI+6wRg583TlW/XwtXnoMHL3C2tLO4Yjeh2ZEa2eOnQbBxYw9+EH70/FAtZ5sRj
         p4Jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZMN5YWbB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020ac85f12000000b00430d8e8c0c4si2028031qta.446.2024.03.28.11.38.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 11:39:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZMN5YWbB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpue7-00053R-2V; Thu, 28 Mar 2024 14:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rpue3-00052n-D4
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 14:38:36 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rpue1-0000Qp-FH
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 14:38:35 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6e782e955adso1219599b3a.3
 for <qemu-arm@nongnu.org>; Thu, 28 Mar 2024 11:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711651112; x=1712255912; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8k8ShgZpDq6NET7E/sFDOpXqTEBsCxuTZlNM10OEm+g=;
 b=ZMN5YWbBYo0MOFS9NETgtDrOlN+WZy4s9ypKOgtGWfV9CqoGP3rK0NoFh4tu4sLwuF
 dwXKTahWYrFe66uTTRcL4ThLmOA8O0UjAEVvQGnJABIhPXtQZgRT2HpYFZYZ/eqzweXS
 bRAOEt/jOrLWozaECFoYRUFGo5EEfSELGFbQYEHVxbmpYRW/BOtAd9seUUN4XWA/lqXP
 QtRJTxAokp+Zo2+wDXtDsxfQxJoGvOYPAGh+AeyyrbNR78jtRyQ4xyAtg3W1mqV4hCi7
 pXhOZ7+/GZ/XFqcjtkTdcprCtfVCAInVtfKs5e1Wteuq8FbMQGrhA9jSgup610oIZBEz
 oo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711651112; x=1712255912;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8k8ShgZpDq6NET7E/sFDOpXqTEBsCxuTZlNM10OEm+g=;
 b=pHCOJR4r51LIHQRDo4im14lqK2wLmvrLZSvjGgzokVx3SWN0ylVou/16MDhnEzJCdU
 Dy/Q8TG+iXX8jKwFKScdlPOEm891gMxBk65HPJMHIR8BrqS4fE+0iy9p5ckwc+2sYCfP
 wZGPF141X9f81NGbVwukEcv9LS2qQ9JwljnxY2E+wDASa5DOezCteN9WmrEY5yUKdJIM
 eLj47ztL2nS08ghWXhSi0x8cFYYqVcDyRgNjvpEJIeZ8vSC0OY7R3FH24RD3sEpS80Ba
 wLk4DwseHLPZLO5N3uoAszZjXiHQljngMzNgnPgsFqKdEhNyILKcRcZBLHEset6VrKaY
 gZdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDBnX7NTianwSvGsDQ6VCyYs9GE/Zx1CrfLC5l78quS7bshIMrV+eKS8FcGmsYpC+Ii5AE+3mLcGAp2MNlpfA0PIj4
X-Gm-Message-State: AOJu0YxKEM/nkBrJoUV8ahXwfF7XY1pzM8FGtc5B+Et+F0UUSXXwOcPm
 DqSK34OQGYc74N18NhHmL6LxSFXI1Ck7lwmfJ2cJaCDSctO8hIYepM8qYIhzw6+j63jKz+DuqjK
 0
X-Received: by 2002:a05:6a20:b387:b0:1a3:6a74:2e6b with SMTP id
 eg7-20020a056a20b38700b001a36a742e6bmr3219271pzb.55.1711651111966; 
 Thu, 28 Mar 2024 11:38:31 -0700 (PDT)
Received: from [172.20.1.19] (098-147-007-212.res.spectrum.com. [98.147.7.212])
 by smtp.gmail.com with ESMTPSA id
 fj14-20020a056a003a0e00b006e554afa254sm1698720pfb.38.2024.03.28.11.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 11:38:31 -0700 (PDT)
Message-ID: <364a15eb-ca23-4cd1-aff7-37de8bd7e825@linaro.org>
Date: Thu, 28 Mar 2024 08:38:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/intc/arm_gicv3: ICC_HPPIR* return SPURIOUS if int
 group is disabled
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20240328153333.2522667-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240328153333.2522667-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-TUID: 2LGI/8eI1Tf+

On 3/28/24 05:33, Peter Maydell wrote:
> If the group of the highest priority pending interrupt is disabled
> via ICC_IGRPEN*, the ICC_HPPIR* registers should return
> INTID_SPURIOUS, not the interrupt ID.  (See the GIC architecture
> specification pseudocode functions ICC_HPPIR1_EL1[] and
> HighestPriorityPendingInterrupt().)
> 
> Make HPPIR reads honour the group disable, the way we already do
> when determining whether to preempt in icc_hppi_can_preempt().
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Pre-existing bug which I happened to notice while working
> on review of the FEAT_NMI patches. I don't suppose real world
> code disables interrupt groups which it's actually using, which
> is why nobody's noticed it. Still, it's a safe bugfix so might
> as well go to stable too.
> ---
>   hw/intc/arm_gicv3_cpuif.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
