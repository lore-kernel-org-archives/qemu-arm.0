Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp543343lfb;
        Thu, 12 Nov 2020 07:33:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxg6WWREFi9rVJ82wnDUTCMmjaBTa0eFgPm7V1bWX9pgISyIbu8zZzTQLwZP2dgHUqSU309
X-Received: by 2002:a25:911:: with SMTP id 17mr14015080ybj.30.1605195234202;
        Thu, 12 Nov 2020 07:33:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605195234; cv=none;
        d=google.com; s=arc-20160816;
        b=jojGdtnBZBPX5UCrBJ4ewXUAg6SoEUmdnNNtLKYBx6JIE5iqL18UaE9o+wpCuMaaim
         w/vdD6RWo8ig2dBTEHBqw0Bq/bMRhKgqLWCRwsOkSZVwb5SvEMZu6eQtZlTbhiGx/ZyT
         T881V3GqfaXxk1zSU5fwcufSF4eoNGQGkAFV9Krnfbu0147wEtS4bxNnlD3dfMKO6yjb
         en6QN7/h2Tf7DiWyqaft+BLv49Jq9zIbKP3gVOtaQpbXgKR1ENdQ0oDY9GBxzypZv6+A
         EUGFY1mjtvUKnC7p27yXHHorq9Da+zU7j9R5N4XZjDxtLaKTSSZc1cM6mQAcqgG0Dc2G
         EAnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h0ymbKeRT8Ee6GVhrUOeThm8iBCVfLsglS2lGAY9kwA=;
        b=ZC+p5DwvY6PTY45uE3JL8YOF0PbzDRHz+wAQViqIwzP/PwxaTDXlAa0Deyj/uEhw6f
         xqMSMDj7NALlup7Yyu3pPDY1MpUztNIwiDHHFJqXtyZQza6YtOIG/L1SBZMoyssaNz70
         b/K8uXzhEmTHZ8rUWaT25mbiU42qPgRGYTDZmG1vDxGcsHOfKLYj6gQOMt+2G/f7yRMY
         IqZRfQTfVmrUFV0RbXvQQPWzzbrwEea1BAhs0u6T3WWmPt4TUlkFK4G1nqA3HB6/DYjF
         QL3dd7ekP3RoL9XZX3TejFqs2pq17N7Hl56AZ8x94sKhf3/LH8PqluE1UQbDDkw3JcG1
         M1gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yXSBYa42;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13si5459446ybp.288.2020.11.12.07.33.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Nov 2020 07:33:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yXSBYa42;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdEbh-0008CZ-JP
	for alex.bennee@linaro.org; Thu, 12 Nov 2020 10:33:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEbb-0008CO-45
 for qemu-arm@nongnu.org; Thu, 12 Nov 2020 10:33:47 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:41577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEbZ-0006gv-IA
 for qemu-arm@nongnu.org; Thu, 12 Nov 2020 10:33:46 -0500
Received: by mail-ed1-x543.google.com with SMTP id t9so6735003edq.8
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2020 07:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h0ymbKeRT8Ee6GVhrUOeThm8iBCVfLsglS2lGAY9kwA=;
 b=yXSBYa42mK42igUr1AxNldE2+dRL/Cb1wi3SzJFoqs3D2khAeGLIpX4JG0S3lniSlp
 zFyH41GzvEx51Gvo3V4xENQ+sC4WrAeDpNDd8ascbKvoJuBL+dgiO09p/cLxhCGJsz3e
 6ZBeE3qEfouMLXq0dSdahlxXx+XXEVnEBrWfA8FwijK8XjvQOpww4WGeGonyu0KgCD1K
 gyfBaXvUBRJI+5GHFjG79qoXnwSg7b8wRzAtiBbmlWOio8YARq1GyVTtT48z+G7CVACD
 a6lhrPLTrZ8qCsJgvw7vTJJgrmTo3XERMmw5VtlWts0sXl2KiswmGQr0gSH6hHSyIACd
 JmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h0ymbKeRT8Ee6GVhrUOeThm8iBCVfLsglS2lGAY9kwA=;
 b=nBr6iTG20J0E550fB9+VTffPHzwwEdvkjhfCHFAzQKrdOvWTPGM4/peu8uh68zv98E
 eYDGbnDOrLoIvQR6GFvIIq3caz5oy2hfvGR4SGDoiasGmszqNah3nPnXHmilqHfNSa/U
 qxzd8QkSblmiBByRqtQYDqmJB5DdYnh+DT3sMxuLt5MjSZsU95A/cLBTjqjdKjkyoayK
 r5q+lDqzjtVp6+Jw/bX4N80wWWDk3YWORYn+U9GA2Ba9olWNYRAY/gB9dZxRA8FZKvWf
 SXHeMdTbDKA1K2ZBn0ntUa0/EcBeX4WrRhJUAksb49Hf6DGZ7CCNH3EBeE1Xy7SqLzqM
 nD7A==
X-Gm-Message-State: AOAM5337ftRCr7tFJXxrgSDYMRPbAvmq3p2YyxUKA5FBIwPfRiFTCsaC
 pVd6ph+b0moj9uCciJVM10fXi2x1Zn2a6WcSs0hxKg==
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr363962edb.52.1605195223065; 
 Thu, 12 Nov 2020 07:33:43 -0800 (PST)
MIME-Version: 1.0
References: <20201111143440.112763-1-drjones@redhat.com>
In-Reply-To: <20201111143440.112763-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 15:33:31 +0000
Message-ID: <CAFEAcA_Rh-OAcrttL9czzaGA2CThtjX7BQyeBJgMnj2XaHqusw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cr//shxrt7XF

On Wed, 11 Nov 2020 at 14:34, Andrew Jones <drjones@redhat.com> wrote:
>
> The removal of the selection of A15MPCORE from ARM_VIRT also
> removed what A15MPCORE selects, ARM_GIC. We still need ARM_GIC.
>
> Fixes: bec3c97e0cf9 ("hw/arm/virt: Remove dependency on Cortex-A15 MPCore peripherals")
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
