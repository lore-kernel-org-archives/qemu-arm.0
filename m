Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp986170ejn;
        Fri, 21 Oct 2022 02:14:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7gd2Iezw8KDYx2+MXNfeubpdBqlua65Vv6iT5qaf1liXUWiQMMJb6Eubo+xcEKgRSnGuap
X-Received: by 2002:a05:6214:f63:b0:4b8:c0bc:c43e with SMTP id iy3-20020a0562140f6300b004b8c0bcc43emr5829465qvb.119.1666343642440;
        Fri, 21 Oct 2022 02:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666343642; cv=none;
        d=google.com; s=arc-20160816;
        b=ypkcefydQ7QDVUQIKeGmciFj3KlL9Z78zETqnq/1NQr+4130buEeCNkSAh0AtLDHop
         j88SKZoxLkH3XDPqtevCKsGV9WHkvYtI65BFa/RJospbv8pd/WB6zP0lYwbZ2vpHs6Y0
         SmJytU/CCPjXVN78glei87HV3ks6ihaO16L6mykeJmpqA2re8zp3UhppFFEdCAFbH+Ek
         gYvL536NWX67QKcN71EuXkRGKzBrEcw0XYLTz39ZrpONrySuP+zk0V5peFTfuEnwDqAu
         oGZ3nS2GSYPtZe4UllD+M6qhOhrqVO5dqAGe3Md3c86GKLmTvGje1IrGAuHazzjOVrAt
         mwzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=X2dtBxxRHBB7DauWuQoMygKfYOJfO1vsAHNlY5BLQ9w=;
        b=aYDHt36IRNPJRAMaJJIz+nJTH3zy5QJKB3zb+1FY99miVBplezz21f4uSzvj1BMRTO
         bczxg8wMXV9OqhCpatBb3XeUkTOZLlYnEnTPaMaNr/ki83xX0qWE4Uiy8NKA+7hMK0zz
         vS/6gZItHP/3TtOJpFDmQA5dXG4G4hK1CkXYSVShPb6zPjOa+woTxCS2aIqGIucoq5u5
         +R8S3sfmoL1j/eieYogZ2hrY/GeK+9F7EW9nVh/v/M+uAseAuP35jMFf5W5QzmHVFB/T
         jkx72CIbuhj/loOQ+IRvTtKAdoV3psIsQDEFLZQxEjum0kflC+c/EeexOqr9D2C/WzPb
         DihQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d351lmrY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn5-20020a05620a2ac500b006cf1710f274si11580540qkb.326.2022.10.21.02.14.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 02:14:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d351lmrY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olo6L-0006Wc-Jk
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 05:14:01 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olnyj-000760-0M
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 05:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olnyL-0006kp-Vw
 for qemu-arm@nongnu.org; Fri, 21 Oct 2022 05:05:56 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olnyJ-0007AG-Ji
 for qemu-arm@nongnu.org; Fri, 21 Oct 2022 05:05:45 -0400
Received: by mail-wm1-x32e.google.com with SMTP id iv17so1742229wmb.4
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 02:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X2dtBxxRHBB7DauWuQoMygKfYOJfO1vsAHNlY5BLQ9w=;
 b=d351lmrYxep+j+mK8HQuRCuO03UZouD4g0LQ1AjWQ2gSttzjza07PxmIhHCj+UV9Tb
 ahveu+lnmsJDa6SJ+oaEY3eOuBO2gJp2XqbC4MoSeVetCK1a/eZ3vIyEkDqOtmeRQrJa
 T8KQc1LjoaONi2xoOOaBiudkX5ArCYVelTS06CTSvSUQaLt4iamPyj6t93qr2TBeRbNe
 9GbKNeZ0rKPhoDh7jvEb2tEOLyDmHgyru9B9wZ9QRURlTemcxqf6nUcINl9vJPDCSBcI
 R36h5zyJQkLTZzYrI7DCBpoaxyk9dTjkNF82bGRK9ryAjO7YfF/9cdbx+hD0ucyEi2D5
 FV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X2dtBxxRHBB7DauWuQoMygKfYOJfO1vsAHNlY5BLQ9w=;
 b=FgPDjvfuigEDcBUklvEP33rg4ElRfIRQ1W/w9UiGnLhn4D18uiDlPUVnKR4eCQ1h3S
 o4Xf/bP17pIJehdVWub+q1mB26wgYBIrOg7uNCPel3XeSbDTaYRwUo19oYBGqMmVubIB
 2+KL0RkHHS+mt8GBVqnKFcoewjwdI7VhsArMx+RsiUza48US+BkrzM0GP7RlUkT08bYI
 HvybOopI1SjznHyftOninxQv0/5AHZxpfcn3RWDY8o2U0RDodoP1jGlBCIb79PxNRllv
 ryjhpuSqW1oqL8KQd/edD9FyPcKGNt+OB6jSB81o0bgnKIIRt+43VZ2t2vMzaQfMCZLQ
 BA0w==
X-Gm-Message-State: ACrzQf0NmptNWK9P5F859PrTcu8o8U58F3GkvEB69kJasXOoujGa+Qp3
 0yRyGUDZxe5uaIAqa2BG8sJm+A==
X-Received: by 2002:a05:600c:3511:b0:3b4:bb85:f1e3 with SMTP id
 h17-20020a05600c351100b003b4bb85f1e3mr33722635wmq.0.1666343137846; 
 Fri, 21 Oct 2022 02:05:37 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 h5-20020adfe985000000b002322bff5b3bsm22287680wrm.54.2022.10.21.02.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 02:05:37 -0700 (PDT)
Message-ID: <d47ca14f-1dd8-8dff-bdce-6e8223f0b2e5@linaro.org>
Date: Fri, 21 Oct 2022 11:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v5 5/6] hw/mips: use qemu_fdt_setprop_strings()
Content-Language: en-US
To: Ben Dooks <qemu@ben.fluff.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 qemu-riscv@nongnu.org
References: <20221021055808.342055-1-qemu@ben.fluff.org>
 <20221021055808.342055-6-qemu@ben.fluff.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021055808.342055-6-qemu@ben.fluff.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CQKhbKAWQCnt

On 21/10/22 07:58, Ben Dooks wrote:
> Change to using qemu_fdt_setprop_strings() helper in hw/mips.
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/mips/boston.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

