Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp1156572eja;
        Fri, 3 Nov 2023 08:27:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH57dFbBMyi0n1nYJUhd0tB2N6dsczBLYDsZsw1K+RQyXJu0aitmva6/VJ/uBZH9koi2c/e
X-Received: by 2002:a05:620a:19a2:b0:778:9161:c9bd with SMTP id bm34-20020a05620a19a200b007789161c9bdmr23503030qkb.56.1699025225265;
        Fri, 03 Nov 2023 08:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1699025225; cv=none;
        d=google.com; s=arc-20160816;
        b=BV+GNVLP+ajmr23hz5Q34Syr9WfsicJvG05v5uJS180Sx4zSRbrOO30wlK13BiwKTH
         Cg3+c2eT7e24hOiAj4B8ayGPTh+kV6AwUYIoLPflbGWS7alAKw/+qnVQEPz9jVqegc85
         ZbL/9nXpbHajppyjwUua0Wr9v6GBMMu1TIGWq6pqsPYAk3baZ3RpPuxm+ryDEVLPPk5g
         X9VkhTNsnMDSMU115UIqpjE9mNjyFB6la9z53pzhowG4AvABh5afoEqeZF+fe/30iNlv
         ZCx2Usq23USEsRKt8h2CY1DkbS2LxZbxZqwjtJ8DdEtyW7jcJCX8zTJNGb1TwFjwbYJU
         hCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SQOgokHngI/6nscwBaVE2kyd2lmfKIKWbi+1iG7xL8s=;
        fh=wqfvLaBYopGyGisjq/k8ulPaCl1xshcoDnGh5kvEEbE=;
        b=x6qiPzbsPU+9un7E34kqqyskUgcrFjfcWIrLyfJ6VQCWMC4Io7kmJeFoPeoOn7d0gd
         KiWoKNweHs9cpyfNsVyDfpmkV9gKX5/+perJJOSBkresdiLLLPx9esEm9jr5QEHgE/nn
         MOrm1K7hxQZ9TDFp75vW3H3qPHtSQufV4jN6Tbk9C4UJV9MuQGr9zFPvi5FYYeGhzufl
         /FQyjQkp1kU4a+W19iQ9Fh/OfM5DvBT50ugrE4ZIIEG7oHNivYajR/YPx5dW0L4rltid
         Gz852GykP76Mz0lM63DTIcoHhZfi+mk/7MPXULCK8LlTL8uSQAkTvK+iSXIfnz7B4lP3
         47vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=avrDAzVF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020a05620a023400b00768b6bc7aa0si1523539qkm.713.2023.11.03.08.27.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Nov 2023 08:27:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=avrDAzVF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyw4F-0000Eu-My; Fri, 03 Nov 2023 11:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyw4D-0000E8-Tl
 for qemu-arm@nongnu.org; Fri, 03 Nov 2023 11:26:37 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyw4C-0003XB-6e
 for qemu-arm@nongnu.org; Fri, 03 Nov 2023 11:26:37 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-543c3756521so3572819a12.2
 for <qemu-arm@nongnu.org>; Fri, 03 Nov 2023 08:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699025193; x=1699629993; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SQOgokHngI/6nscwBaVE2kyd2lmfKIKWbi+1iG7xL8s=;
 b=avrDAzVFb6ajvMAosX1syeSM4mgs6I+NQfaFM+39CTBnE8PHK8m54MMFXYkMNR04pO
 WWfHYFSprjc4V9/wt9WrXcwUbqTqUi+QsIpUCiX+Q+D9zVSZ7sipzsI7U2AcYlyBTgvY
 BS5SsZgpJn5UwphUOuOsyC/VCPrZxSznKSq3H+HpQZ55YjV4sKk2jEBSeaZLT4gGjuKN
 Zn/82IPehhn4umP4kcrmtiUHX7Rpirs5PZdpJuXvoKEoYeDO74US40YbqKJAQ6xytOSv
 0hJO0kXs+m0VdAuZv+Nq5UXg5SQLKc9qPbmP3R4Gtr0uvqTFx1ZxdT/MPk+aZEPv0vZT
 Nmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699025193; x=1699629993;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SQOgokHngI/6nscwBaVE2kyd2lmfKIKWbi+1iG7xL8s=;
 b=IVQ70FZgKTf9WmiWpuyln7IRJi6R+25Y/S4Ha8Dl6m8JhPYdGAmp8J/6sIeEOkhD6t
 Q7MxKKQErRdMxWDAf2mePTBl0PC16pwmWd5R1OCZ9h3Mfw7fYcD4IdbXfY19drtOrd09
 jkg1mEfKVHYcnP8N6Maxw/pzqgcaHiTEN5AOc6W5AFRAIl31ZiCvHNm01+LSHBfIWNc5
 mHM5YG9loLyd0sWZOWXR/BQKGmAX9GG5HXjV7BsgH3Guo2RXzKNZqeCOR1wP66CTKM7E
 4h9/p3CucOGCMVCHEZKxEoq+LWe0FA7tGJS169GDloRRN8jlxkQn+/jY8DiEiJm1DtGR
 wD7w==
X-Gm-Message-State: AOJu0Yxi9kLT/dS8a83AsHkkMLLdE55CDfoHLzEI9eSWiGBO4B6ahOv2
 DDXrNVr3EALQBjRIRVP8npIULnyPR7V7W/dewv8jhlQbufGHec2f
X-Received: by 2002:aa7:d1c9:0:b0:53e:5dad:dce0 with SMTP id
 g9-20020aa7d1c9000000b0053e5daddce0mr18247368edp.3.1699025193626; Fri, 03 Nov
 2023 08:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231103152120.829962-1-peter.maydell@linaro.org>
 <20231103152120.829962-3-peter.maydell@linaro.org>
In-Reply-To: <20231103152120.829962-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Nov 2023 15:26:22 +0000
Message-ID: <CAFEAcA-iSvg0r7-pRbv07p80Fy4ZEii0Md2DnuGs_=djdBe-HA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hw/arm/virt: Report correct register sizes in ACPI
 DBG2/SPCR tables.
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: gPBVdhRJWaAW

On Fri, 3 Nov 2023 at 15:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> From: Udo Steinberg <udo@hypervisor.org>
>
> Documentation for using the GAS in ACPI tables to report debug UART addresses at
> https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table
> states the following:
>
> - The Register Bit Width field contains the register stride and must be a
>   power of 2 that is at least as large as the access size.  On 32-bit
>   platforms this value cannot exceed 32.  On 64-bit platforms this value
>   cannot exceed 64.
> - The Access Size field is used to determine whether byte, WORD, DWORD, or
>   QWORD accesses are to be used.  QWORD accesses are only valid on 64-bit
>   architectures.
>
> Documentation for the ARM PL011 at
> https://developer.arm.com/documentation/ddi0183/latest/
> states that the registers are:
>
> - spaced 4 bytes apart (see Table 3-2), so register stride must be 32.
> - 16 bits in size in some cases (see individual registers), so access
>   size must be at least 2.
>
> Linux doesn't seem to care about this error in the table, but it does
> affect at least the NOVA microhypervisor.
>
> In theory we therefore have a choice between reporting the access
> size as 2 (16 bit accesses) or 3 (32-bit accesses).  In practice,
> Linux does not correctly handle the case where the table reports the
> access size as 2: as of kernel commit 750b95887e5678, the code in
> acpi_parse_spcr() tries to tell the serial driver to use 16 bit
> accesses by passing "mmio16" in the option string, but the PL011
> driver code in pl011_console_match() only recognizes "mmio" or
> "mmio32". The result is that unless the user has enabled 'earlycon'
>
Oops, a line seems to have got deleted here -- should continue

"there is no console output from the guest kernel."

> We therefore choose to report the access size as 32 bits; this works
> for NOVA and also for Linux.  It is also what the UEFI firmware on a
> Raspberry Pi 4 reports, so we're in line with existing real-world
> practice.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1938
> Signed-off-by: Udo Steinberg <udo@hypervisor.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> [PMM: minor commit message tweaks; use 32 bit accesses]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> --

thanks
-- PMM
