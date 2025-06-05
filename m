Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp264808njc;
        Thu, 5 Jun 2025 06:59:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/RBOGJI9om44aOLm3hXAqYhOstaRjjZn97zu73MhbYUNWIXpGMVeNs6jhm4V5fptyMX4q6Qf/Sqgzlw==@linaro.org
X-Google-Smtp-Source: AGHT+IHx8og3P8eHjU4qdvJTAdmmjiYGnFeWKxSDE12oqmLGxbIdwKO5tetdmDa6rFY4uFgi2A2H
X-Received: by 2002:a05:620a:2996:b0:7d0:a1d2:436 with SMTP id af79cd13be357-7d2198c6aabmr882308785a.33.1749131977892;
        Thu, 05 Jun 2025 06:59:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749131977; cv=none;
        d=google.com; s=arc-20240605;
        b=i/VulW3OK0JMCmxPRhBYVV3wjs5V5WtjuxhiwvdIXB/ZP2w3nH8obVSjIcxn8bL1QY
         K9nml1cPDCHs7BOs0dDHWVuBgER5vIiWNy2GuRHgBxVbpfrss5QW6akvoJ2EA+uCirig
         y4No0Rt8T+sUul57ztSCJUPDusVmWR1XrthJekTEoSl/U9GVRsyoWj7T6LDmp5ieVV31
         KSeVFYI0ZQWg/K3F6UUDAcAMIZ+uGC2KUFYPI2sbcQnmnCEEqwlQ24Oo5w4a6AB/LCN1
         Dpe2ftHKhjNfBbtcVVVcKPJGZXGqFx3QqJRMYKvUNSBzqihGIFhoTaUkeREI2W5i+2jO
         YQWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=l2UqNJbpj/KHV4ki6MjMjGrhzHvpPctu2eZCEC+laPc=;
        fh=MF9SVcCegvMiZGwHUcy3UCUv5DaFhOZ51hhYoCCni3U=;
        b=HasWbqY6eKMBJQCH/JqkT/V+eKPzYlRBewIGXxi5+HXamXQ2vLZBAsMnKwYUE9FjCC
         T7tBlK1CO3Rd7E0G2uus0g1zK/t8MSrISSJ6ZcOixk4yjkUcDjFffu07QOkUIqjkh6XR
         U91pPKX4tHVlhd9FVLsWeBCi1KrIEkhD3ShKaSNhkCma4oDCAbIUNVGCj2jGSo6ldjbT
         xdqiV619r25VNipknIn9eKJjBayMcqY2pQK6xcmNlCnas4UL1iN4+kXFCvSSmYl/k9Wi
         aT3B1X3KB1Ot1g2M7R48XS7tJcL0bqMVZ7vrCPIvx8bc0ujW8h2ybs/rKFT2aJk5MXvZ
         u8yA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p89iCpFx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a1fd78csi1702449685a.407.2025.06.05.06.59.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 06:59:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p89iCpFx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNB7y-0001c4-WC; Thu, 05 Jun 2025 09:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uNB7y-0001ZK-3Q
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 09:59:30 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uNB7w-0005XY-45
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 09:59:29 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-70dd2d35449so8384587b3.3
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749131966; x=1749736766; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l2UqNJbpj/KHV4ki6MjMjGrhzHvpPctu2eZCEC+laPc=;
 b=p89iCpFxs19EAj/ulq/He/wBh6FNr6JvgHJSlTizk/BbpDXIrSxNyvJjiQGW55IC3B
 7dzviR5mvcQ7GRAZeVJq8jVnOWRk60KW3B3rRE1rtgxGlNMN3UjlOCp66ELhDhfYZQo5
 zrzF9djxZuyc8vtUXzX8vHvbOimJZC/10fmq+9u8Yl0Zg2U8ijtWK2IFyjXJaGoiDo85
 PjQHTijUnAh7sBpB5dmWIoRu+4ltDyaKy505R8RQQeNtEVGmXQoONWi804VD1eEGVI+g
 g3w3TG94fWaNUQs/CQqFJQa8v+dZMfL6nAIrqhL+kZoRVgQWQVqeKv87k3Vk/GHfQUnc
 bgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749131966; x=1749736766;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l2UqNJbpj/KHV4ki6MjMjGrhzHvpPctu2eZCEC+laPc=;
 b=QM/IJ+ne1hSnbOIXF87cRbOukBjSK3VamVhJ0kYXY5ISgbJqrNtTLO+jN3bl2xUD+t
 k9RWRo/39bcNb2wPGgP2pqFsmiyQVzBAzXqww26Ssh3hAQojvL0VKNt0rDo9OmbswSbu
 ptod7U2PkFBOwtGs6/UHkdH5JslWPealjTvnZJcLWeGfHTF5de8GXmKKjNMwotb69493
 JTfnrcxG1Ehna1Kppo/9Hemqdf59sd33QSTWuYTEq2MdXAgJPezHu2IBClsVVBAoWbB6
 QJv93iloeORdLFL6p5mzTN9KuZCPwniCxKKyfdzWvfXWQ90ZOTXFvCN4uVwIpK6XNQR7
 mHkQ==
X-Gm-Message-State: AOJu0Yz2TjIC/b6o5McyO+0CVGI8BDHTwJs4OgPHuh8XgjkLKVRSvGAm
 MltKEgK4Oam0UcpLuu8+Fq76Rw1I5/1gCXW2Fls+II7zwVUj2s86c/sxgQRMtGW+64fK+rIa+Uz
 ao+mCI8rPg2SODWyD4PS+sYsKsYR7H+uQMiLXwRooXXBINJhaZIO9
X-Gm-Gg: ASbGncuQ2on4F2vRweq9KnCugC0JqAKogvyFBXbPBzuT/graoAi0mSHbN7pqyL/4Awi
 9vVMSNmcm1rX9Jx30Xvtq6KFqCnw2NFpB3Tr7BcdMGte3EWCtcXAL045ijfYHUdOTwsC3jeppEv
 FOz1danzdMProgGqEgRn1LKxGze4pEqTd1SA==
X-Received: by 2002:a05:690c:a04b:b0:710:f39f:a2bc with SMTP id
 00721157ae682-710f39fa8c8mr8256957b3.8.1749131966508; Thu, 05 Jun 2025
 06:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAPwCrcOwX3Atxwzrk=Rtpya_i_STv9+Gi8uY6ryJigPvhk5+DQ@mail.gmail.com>
 <CAFEAcA9y0P9KEQnv7fPxc8k5paCZQoQc2CqaVHTLFWm6+Aau5A@mail.gmail.com>
In-Reply-To: <CAFEAcA9y0P9KEQnv7fPxc8k5paCZQoQc2CqaVHTLFWm6+Aau5A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jun 2025 14:59:14 +0100
X-Gm-Features: AX0GCFuRIE2jCdqQ883tkM23-elXtvXXWQ9_jp25AGZ5Wt7o4PhGnWgbfYfCdhE
Message-ID: <CAFEAcA-OiyxE31buBMriMAEFzJ-_G97xcrRKsO21jknOzDwjWQ@mail.gmail.com>
Subject: Re: Inquiry About MPU Region Limit for Cortex-M7 in QEMU
To: Corentin GENDRE <cocotroupe20@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: tMy/BoZI7RK8

On Thu, 5 Jun 2025 at 14:49, Peter Maydell <peter.maydell@linaro.org> wrote:
> This (only very lightly tested) patch ought to fix it; I'll
> send that to qemu-devel in a bit. Let me know if it works for you.

> @@ -224,7 +224,11 @@ static void mps2_common_init(MachineState *machine)
>      switch (mmc->fpga_type) {
>      case FPGA_AN385:
>      case FPGA_AN386:
> +        qdev_prop_set_uint32(armv7m, "num-irq", 32);
> +        break;
>      case FPGA_AN500:
> +        /* The AN500 configures its Cortex-M7 with 16 MPU regions */
> +        qdev_prop_set_uint32(armv7m, "mpu-ns-dregions", 16);

So lightly tested that it had a critical typo :-)
This ought to be "mpu-ns-regions", without the "d".

>          qdev_prop_set_uint32(armv7m, "num-irq", 32);
>          break;
>      case FPGA_AN511:

-- PMM
