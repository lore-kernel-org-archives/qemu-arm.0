Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1482358ejb;
        Mon, 20 May 2024 07:31:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSz0p62KcD/S2B8+D8edBdluu2bS1Xumeo3yVZcAC/cD7RxnGHEZEB+JTxPINjcakS0aul7gp6ptTecGAXB9Kk5dSYeELT
X-Google-Smtp-Source: AGHT+IHZBjUmELpoSYlHUJ5jpKmX+VHEpgdhDA7Bgxj/DErrVx+JfEkJw9b3oqQGZQ3Rx+xnq48/
X-Received: by 2002:a05:6102:160d:b0:47b:cba4:42d2 with SMTP id ada2fe7eead31-48077dcfc17mr28387475137.6.1716215489564;
        Mon, 20 May 2024 07:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716215489; cv=none;
        d=google.com; s=arc-20160816;
        b=rB2ArRJJkhPyKry03Xxq9jIdG218IDZ1ILdd7CCw7XU8nxJfwlaG30B5Jsd0c6FK1s
         eH4DOdlKU4qQ7ldpkhEoUJ1Ogv0yRIZfq4ebvL2x4UPnCLUjmhpuC6jRMLXrQdmpH8Gu
         17ZDc7csd6VQW8uzE7pOBcKdNq6eoG5ycNyZ9qcdMxEQMHbObrHv4qyQfD72ZHHRmYmL
         Fh2FSP2JAbIT087jUpI4d9OWLfweRu3QY+R2iRVo8OF4AECqxdQyhSLgy3dlujfHoZc9
         FsBlevZ2GK2yKNIyiq3xniTIWPgTRmyTxQtIrI/UTpFqPjlrzsIdoC95wDtZvArfmLf2
         +eIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KgF02fbQr9/mZN29egUpXZwL8PXdvcdglJ0V3IEev0E=;
        fh=w5edna8LBT7G3VOOhCW9WUJUhLT+IA/Ybv9OmS6ITcg=;
        b=hL5Mj5GrUQ537H0DjnsDtyR5/TBl2q2gAlp8ClXoZcy4nuyel+n6VXGYYBGFMY1Qed
         UK1pMKyU6pWcCKbCSdPZSmuKdLb1Fq6VB4mPFn7np4j+vwS/t7Vk+zWy4auVdBY5pFWP
         4vv+e0xSusCx2WYUCBblgFliPWGHHHl/O/egqEhhkQHBSeFmpLkowRve2NPWCpIRV/K/
         SEtkk+8VmWTEfIdgJD26am84b00q4lmMFrSp2+NeDjPUnoT9OTSvgQdhGRbDTaBm4UR9
         l9iecQu+15J49nsjhqkF4JF+BhHvSuK00J/PGEdmfCFrag14m6mOsh6e5dsPeHcVsc5f
         VFbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ooKOybPM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4806cb7fc6fsi4001225137.65.2024.05.20.07.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2024 07:31:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ooKOybPM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s942m-00070x-MK; Mon, 20 May 2024 10:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s942h-00070V-F0
 for qemu-arm@nongnu.org; Mon, 20 May 2024 10:31:14 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s942g-0006Wy-29
 for qemu-arm@nongnu.org; Mon, 20 May 2024 10:31:11 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-574d1a1c36aso7340056a12.3
 for <qemu-arm@nongnu.org>; Mon, 20 May 2024 07:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716215468; x=1716820268; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KgF02fbQr9/mZN29egUpXZwL8PXdvcdglJ0V3IEev0E=;
 b=ooKOybPMM2vLGFKQ96JkUwHTh0nK3IT+Kf69IcXeq3CkVzaSRqfeCUkASvMqRDNuoH
 tOfuTWvfANmIEiPskRuFyE6h3xKDyZ6wwxvLVTr7ql5iBqRUqlwn0YLKwAbaJsrrs9QS
 cXDL1+H5pFT4rPazYKlwbXmUbC/G8M+vaGxm0O+T0PUym5iCbJz59nkXwWjpu4V46Iif
 OhHRIaFSg4H0oylEAGAcU8MYc+KkkOCDYd5dA2osJzhPbLDBvAvUKmo4kN7/p0/6K+NN
 hWkabTu2x/4Lo9BR+uKQw54JBhPFkPOQy4MeGhUgQDD0sZt3zXVmZB/uHZ9lmrqI2d+i
 VIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716215468; x=1716820268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KgF02fbQr9/mZN29egUpXZwL8PXdvcdglJ0V3IEev0E=;
 b=CyK8vlA4NmKMZAu7clCkory+LkajPD/nt5Ad6SWr3k5+7eA4ZPSmm+A237jl5MKd9y
 V0nosmbYHEROLzx8YIzYVVWI8gqcif/80teFfzIzFXVGcGGfuJReLEierI6PBOXEENqn
 y70Mi52WKlzDQDK3uHrsTEQRj8c+LaHO3ofhyOHMMbwPLo/0bjVsC/Ae3rI7TSnt7w5n
 2k2V+s0mXRZD5R3t2czgR7P+f4C8UMefblbsGce1Yr6X5OqTpR1rumtH+LSuOZIIZtl7
 ldUfWRI0Poiferr2E8Kz/EPmB3mCuntFXmHeCU2Dr/VxFsgTtHeIBgx54hYmgKHoTwI5
 8J9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWePByh5iqfk/7kp94WzDmXi8slrvNcGnuK23Vmkm58t5KIeTVtf00o50zckxrr3wJjPuk9UU0EuGC/WoKW5oXf/sPk
X-Gm-Message-State: AOJu0YwDyeOFxnYX6c8a16sXVx7sHY5l5ZpKp9dA6aeuNgCv7e6s4l+x
 tmpnAwY8nbeong5nsZZ4d+vcj9Yr21NO38PbE5oBUOhzux6wLcbB8uF+WCH/dnUgvyVzNVw1cfI
 MOmNFpGhEBkDtlHJcftHngAhhXqrsyCSkkvsjvA==
X-Received: by 2002:a50:b410:0:b0:574:f657:e0e with SMTP id
 4fb4d7f45d1cf-574f657198bmr10211328a12.25.1716215468377; Mon, 20 May 2024
 07:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240512102013.211127-1-ines.varhol@telecom-paris.fr>
 <20240512102013.211127-2-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240512102013.211127-2-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2024 15:30:57 +0100
Message-ID: <CAFEAcA9hcRYi9R_amp047UtJi_ieS-Ga9ZJH63WkTxAy+rdc2g@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/misc: In STM32L4x5 EXTI, consolidate 2 constants
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: /WaI1D7FBdY5

On Sun, 12 May 2024 at 11:20, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> Up until now, the EXTI implementation had 16 inbound GPIOs connected to
> the 16 outbound GPIOs of STM32L4x5 SYSCFG.
> The EXTI actually handles 40 lines (namely 5 from STM32L4x5 USART
> devices which are already implemented in QEMU).
> In order to connect USART devices to EXTI, this commit consolidates
> constants `EXTI_NUM_INTERRUPT_OUT_LINES` (40) and
> `EXTI_NUM_GPIO_EVENT_IN_LINES` (16) into `EXTI_NUM_LINES` (40).
>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
