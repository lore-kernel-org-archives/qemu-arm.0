Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1726449lfb;
        Fri, 13 Nov 2020 13:29:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhdm4oraDimaENLbNYmkcS+B0XFuEsVN9n7PtWusys4JfPDjdJEtyw2nJxmR5A+2qZwCMq
X-Received: by 2002:a25:240f:: with SMTP id k15mr4197043ybk.394.1605302953981;
        Fri, 13 Nov 2020 13:29:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605302953; cv=none;
        d=google.com; s=arc-20160816;
        b=GcwUFTtbnU9tM9KYsxJRs9Zuq9TeEdoi9EGuy5oNpPRBFsvdsU1QJ+1QXn9Edtevho
         XOdmoUBZq6N6H3sb7CkchZEc/IZ0104EWx83+369V+BCcXaOIXKnhpKKKNLUyFDekKDC
         s6Wdm06uv+aX/c0CMRmsVN/0/x8CEFy/s94GxGn+STmOPqd5/ks96Fh414fOEAaDsImw
         4+LhE+NWzE174n9dOxYlLh/S8Yo5LrtsBS5NKmoIrD5O9pK7ftlGNAfPUnWt6QZnMWFj
         qEUV51i+pGXrQH7QLbCBWVmmdOG/u7QA6TDcxeb9dHDhJk8XRpstjCHwXPFk+tRvgmRU
         PnOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HchRy0qvK97I/8MArW4zQtV/25UEVbu3e2IYvDyPE0U=;
        b=PJVzqW61iolyuI2KUHGECLNEIEzeYgJRDuW5qzFIuz0R9+7s9UMwFznvcgDTXpufhe
         jKxzMzXnrJvBQEJ0DqnfKZn4RWVdUf/Ieb08eeJtQ6jtUp77VfEHRmWQGuaKimRH/EIe
         ni5gaZi85TP/wBkLjVvdHvej91f4C7UGx9ivVYpaX0CjPVI4DTaAcfywHEQlfFi/fTXr
         tZ6L3DJ73zL0JWYfU/UZHLojlmq3iD6FAUTrN9oFy4kCqjR7t43De+w0TGgsMNgLCZqi
         Bl3Qkn8u76rLC9rbJhi+rW5JuPadKX4bvX99z/pZ0I+1e/LuvJGwPWJFh50fnqFy/98Z
         o++Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ijHL2CYU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h97si11600893ybi.405.2020.11.13.13.29.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 13:29:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ijHL2CYU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdgd7-0002hq-Cm
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 16:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgbI-0001BD-2a
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 16:27:20 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgbG-0006nF-Da
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 16:27:19 -0500
Received: by mail-pf1-x435.google.com with SMTP id q5so8705446pfk.6
 for <qemu-arm@nongnu.org>; Fri, 13 Nov 2020 13:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HchRy0qvK97I/8MArW4zQtV/25UEVbu3e2IYvDyPE0U=;
 b=ijHL2CYUEwEzHwsPTnY5LqKw5VCwK59uWlix9VVp2YiarzpvD8BUWvnV9Cbm4ssxf6
 /Eg6lg5t5WPR4uWy9Ccq2pG3lNuoEgWB3eSIc/aQQM2r/fjE+/+DOJmwHiqJBMttfxtj
 r8E8z5otgmcPMmdGgAZnEDMiCbxxHr2UAahbIMOqWg6k6ev7gTHMZiRbzU8kMl1w4+G3
 BLV1MlJiRurdDiW1cYmDkZeqjyZ1rXAuzSRLdCyhiz1RmpCsPGEPxBKaix5l9tyGb/Uw
 OqF6uDCXISeC+AydL++kQHmYB0LodEHEI2znF+Qx3sPTwnIWrloJ+NMsdtAuZGccCHvE
 I5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HchRy0qvK97I/8MArW4zQtV/25UEVbu3e2IYvDyPE0U=;
 b=WnM/C7IxjSp/H+yDJs3y9guHg/IPUCTVZGIwR2KHLxPItd22O6yzahK3ywcBh2bzhl
 0AK6IlwfWa7tMyqV8hYeTWmdnW6ZQ5jipzYZHaT7xW+v+h7SD68sK1+USItYA4OGqMqa
 ngmpGDfwz+Hn688dlZ+lrjyDRPL/4xlPfh9lHhGed6GnWF5Os19quOpEtQCQMDuprvw1
 Fum2ABTw2Tnt1GYFhCfdwzP+RnAoyKWAb6Lil+jc5NqXjQ9aFa7YJdQzyDzNBL/Kq0dP
 0qxBRrPekZOspmIdnfq3Vlcoaf6CeZNRK86F0bLd1wLYB6aMTJwmCwqNl1xBuTFnhx8y
 oRIA==
X-Gm-Message-State: AOAM531uQsihO3xGdrnzFsvJFpTB9klhpZ8BhwhGmcdpoelTfmGSL9PA
 eUyrK7G9/p0nrefWaFTcCAadTA==
X-Received: by 2002:a17:90a:a58e:: with SMTP id
 b14mr4773174pjq.203.1605302836936; 
 Fri, 13 Nov 2020 13:27:16 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id l20sm11080443pfd.103.2020.11.13.13.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 13:27:16 -0800 (PST)
Subject: Re: [PATCH 10/17] target/arm: add ARMv8.4-SEL2 system registers
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
 <20201109141020.27234-10-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <41d975b4-0030-a249-32ea-057fbf66e017@linaro.org>
Date: Fri, 13 Nov 2020 13:27:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109141020.27234-10-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dE9nzC4U4sEg

On 11/9/20 6:10 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h    |  2 ++
>  target/arm/helper.c | 24 ++++++++++++++++++++++++
>  2 files changed, 26 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
