Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1182777ejv;
        Thu, 28 Mar 2024 07:57:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4Xi6y7MXXKdjcK7TFbt7ecxZNhOUPlIcEBMiOrcazhMuceMPXVH09ar/XiJ5e+qVAMW4e02uRFAj7YXjbObI6eu9At1ru
X-Google-Smtp-Source: AGHT+IH5xr8aExEDTJU2S+k5v6SQwd9ZjidABtqvF58zmyrUpbXamQ5AZrnu6cgrRXhXn0tG/2f6
X-Received: by 2002:a05:622a:28a:b0:42e:d04a:4c85 with SMTP id z10-20020a05622a028a00b0042ed04a4c85mr2945459qtw.66.1711637845054;
        Thu, 28 Mar 2024 07:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711637845; cv=none;
        d=google.com; s=arc-20160816;
        b=AZhTQ++WIsNLcqLqJ8ryWqaR7gzDb6NGUgOBSFSnTbIIa3Fs5fOfA5iygfjPJbTFHl
         U8XDrX8fifUic/LzEBraP2IJZA76ryeq+qrWWihcGgvFbmg5AYGBCVAsKVOuJCe6e9JM
         zmclNTPaa5eaRBLzmw1HhTszXpb0jQACPiauth5uYHH0kS5ivrOE4TwuW6PGiU72foTH
         t44ZtyD7T7oQ0P6z0L2Ym8mkemaIe3pHyUTGSeCzBJ+DMCeVT+AhjMs3ZNF0+blq4blt
         NBVPgBsNp44iiksmAOYGyHgS9a5S4B+2rwcXni2umECyAjPwKT3svNbXMBn1u533klWr
         U7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NKXE0QZhzH3DYh38D3rdCYuqyq9+Ifkyb9HxRIzYy6A=;
        fh=kThAUln1OmnV6ooo19hRFQtCZpEPTZ4SAPcyKf/XRmU=;
        b=gvRTsKOJXJIXQHVd6G9kDBdM4vriSiyLzXGj/v6Vg6gSMkt+EhhYAVVr7ILz7tsWyB
         aHuFcxPrtOmgky8VExMWf4yBXU2BLLUbo8cD+OuAXDvhKt8eLXAwrCK5ID2vDlTflpF4
         pWtIgar2wZa9fVYYv3aBh9dP9U+af4+XPQIBoZY4f7dYWNWnxPWVZwvtUBOSB1rTEUeD
         OiEFMb7it4vUtsBhiXeqPjJ09CR7OidaJV13U82QC95uYvdAYPDEKcGO6Se9OMHuz5Af
         gAhc7M0CPsYZdg++Q6j/Vayjgjwe2vvKLWmFKoouplZ6oy6nZf4sY5QdXbmdsr84NnK5
         948A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dux2djIp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a05622a170900b0043180c889fcsi1512425qtk.315.2024.03.28.07.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 07:57:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dux2djIp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rprBt-0001dL-UU; Thu, 28 Mar 2024 10:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rprBr-0001c3-PG
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 10:57:15 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rprBq-0007VO-2s
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 10:57:15 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-515c50dc2afso973773e87.1
 for <qemu-arm@nongnu.org>; Thu, 28 Mar 2024 07:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711637832; x=1712242632; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NKXE0QZhzH3DYh38D3rdCYuqyq9+Ifkyb9HxRIzYy6A=;
 b=dux2djIp/jodczyicx0uqZPBxrcmLnwwYHs1WzJdPzpiejUmoh/l1DAos6fXX5hXVz
 xJDbLjwjjGW0MOnlHven5x7WFm7BM1qfLHGSueAK0GOWiyjk4DATxpograFKVLfWT/uH
 lC4MCSWQVmTHT1xujnudX1fWnKz4PSpkaDVMrsVNRYEyXgKXw8g3+ktT2rMbSIemWnA+
 VNKYlqc2IOZk4RlqPSiPjtvli08XN+Pm2Zv6cOr938rt9Ic76659nLdKZObv9KZbpJES
 68pdBL0kvYBcFTmDyPT9L3JA8GRqxTQwZA54SwTE1+dcEawh/YLuAF86dMHVGRA/Q4Si
 Oxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711637832; x=1712242632;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NKXE0QZhzH3DYh38D3rdCYuqyq9+Ifkyb9HxRIzYy6A=;
 b=vkbae/L5rnt4BTgUJRTRgyPl/BoSphEftoyMCSvlE2R5Y1m84YTAOrhSDAwsHOiXC9
 qlXnLy2w9bf5I0hmy5qpjGDJuCGy+awq18R6GI37a+OIIZM6CwVFAtJB0cXz7He80ycC
 vYK//XSs9yrFZ43icqZ5rVac9fTpbW2EKc5dG9l3QzY9/ttYsv+PK8nuYuft2jAsVGUC
 X0GonAwj0d9fR1Vi0c0tpa5K34PPIGdjOf+i1ih1tdYxBGsWRDqz0DyCvlHNuNAr4fFW
 kipl7xaw4ehqM7IQVfJlsS6kEhsTxtd39wbyriVCD+Dv+GIkNcq5Wul3a3gnUAq2mFye
 rntg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVF4F+SswvF5aWXlgqZxVQpsRElodAa6BQc+dTQxZWwOLyZLCwf6TL0ZXcbYdWqPk/1A2+XZPDYSWi+m5n5RX2yQM2
X-Gm-Message-State: AOJu0YyxW9agw6R1eRT+xgZF2k+oNux0xPNrrdD9RsjUORU4/wbILSt2
 kt1fYyB82Ls2+llJn28i6dtvzQxJa/l5trZSyAA7KGiuH4EM3jtTK5f7rTRmqR8Y9AKcDIKVd9N
 mrk+jPpoXcYk+CVt//6rSfO1+kmaYqVh3/DMX2Q==
X-Received: by 2002:a05:6512:23a4:b0:515:c8da:c96d with SMTP id
 c36-20020a05651223a400b00515c8dac96dmr2048109lfv.19.1711637832185; Thu, 28
 Mar 2024 07:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
 <20240325084854.3010562-17-ruanjinjie@huawei.com>
In-Reply-To: <20240325084854.3010562-17-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Mar 2024 14:57:01 +0000
Message-ID: <CAFEAcA833=Cs3OKPxhxouYKwhtgLcK-brFx_mgfuFa4UhaPOXw@mail.gmail.com>
Subject: Re: [PATCH v10 16/23] hw/intc/arm_gicv3: Implement GICD_INMIR
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x132.google.com
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
X-TUID: B5MyZ50HWfTH

On Mon, 25 Mar 2024 at 08:52, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Add GICD_INMIR, GICD_INMIRnE register and support access GICD_INMIR0.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
