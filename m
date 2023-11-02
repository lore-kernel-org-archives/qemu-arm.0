Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp308391eja;
        Thu, 2 Nov 2023 04:19:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoVqKAOdZ7txXXmebRVUkONfOZAmlCgZyuRKqM2RytpQ67XYk2aNaewoZ6qgjhj70+CbDp
X-Received: by 2002:ad4:4a0d:0:b0:66d:13b5:ca16 with SMTP id m13-20020ad44a0d000000b0066d13b5ca16mr8298222qvz.27.1698923958811;
        Thu, 02 Nov 2023 04:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698923958; cv=none;
        d=google.com; s=arc-20160816;
        b=yOCtOnGY+g1EQeG8PLspcG9RwiSBUdty26xFVZgDO3T+gYtnDLTx8ZApsCsEgk/EP/
         yh+Dy8Fyaz1An1rJUsW/0Ne5wuVG8BkIXYvI3KUvkTm0uehIJMY8rk9NswXM5WVA0atc
         fc4q7FFBufZ7YKiCts2FUqZ/eCSSjX2MLAK1ikxM8bFKcpLdv/d8Nqsy1uoHYsY5rr0m
         MfngfPq0SxZNxqrCr+X8yfCtMCp848EfEXiVk+7D8LHpk2hR4mEVDRK8JhKTJ7MKvyh9
         ijhOBQsNd2fbCDrJGzty96+0zW1y9zmForoSTLk9lRUZzmnvGhrcOVokdNwgyujBB79Z
         F36Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=U5w8qmsuzSJNU4CPrveo6BhzOJPzfjxpAznyXKfc83k=;
        fh=2pfcbYKIpLm5LqIE+QJrBdIyU3cJNXddFD6HaCuzwOw=;
        b=k7TyKtCinJksIJjWNCo5GmShXV4eho6fafseUFQpmgrfX74BjAbxA84sAztK3pMywH
         QQ+PMYT0EElfxM9x72g/RzFsztWysIJWYxFI1qD+ZSnWXxgHdfz/0dnm7iW74zd8EDaY
         2l/OnHaGv4el6Z4Wizsba//ewFgYUVyxtXq7HQLwXF9ujdZDGLLMz0OgHZmhcNNR2JsR
         uCZ6yTbDe7593ZoJo4MahDjDNNWiADlTDzXcuMZmUgFqJLoS3WgUpDrz3fJhDoqsOLpW
         VB/mPbaCMxAoYgKiHM5ZLXvtKb6T1EFwkroijXqTXfJgmqqN7sLoEG8/TLNfJ2NT3TbN
         KPRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UVkZZUMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dr13-20020a05621408ed00b00655d728bf75si4309249qvb.518.2023.11.02.04.19.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:19:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UVkZZUMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyVjG-0001dF-Hk; Thu, 02 Nov 2023 07:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyVjE-0001cg-O6
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:19:12 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyVjD-0000Pz-4U
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:19:12 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5409bc907edso1281188a12.0
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 04:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698923949; x=1699528749; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U5w8qmsuzSJNU4CPrveo6BhzOJPzfjxpAznyXKfc83k=;
 b=UVkZZUMz+bsjrhqCN/e9Io+7RGveoQBx3kOmzDlVYUKVm192cPMvz7DVrZ5jyO3W/M
 ATG1w3mql3gvgATjO9eb0Qcoj8A/GQrtQZI6XEnh5JR+HkymGJcAwEhwKD3IbRkBrIt5
 12c7nvXA5k+c6TfmFLQZh1R6R/Z4gyCWbDPdmS3Iy9NP5EJEaYdEfrlcfzNq0uVPX7Q0
 vQ8eTj0qEA5+gYHGIAdFPoA4Xnv4FC3SvGHNXM4F/KvVGcUxUH2U0fiutLWuPOVbVimD
 /djpN9iTysBQRkx4MtWYLJxnw4JTjzpo2XzJr0SugZlfxSPBOD2/WBViVwz0mEFwxXuG
 xVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698923949; x=1699528749;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U5w8qmsuzSJNU4CPrveo6BhzOJPzfjxpAznyXKfc83k=;
 b=aQDvkv3FAn8+/65Qq47VG7GDgMYrUsbVLxXdwJdIyFamFyJja8dfP+iPqJz27Ps50H
 y5AFqbSaIbcZI6U5PBPKnOdAJtmvGpI3cleK4rJg/H3A9pUdSh/CDekqGI2BiD8Fa+/m
 HwxRQj37j/fmiKMzWnG+MGOVaMfDPssurtxCF25w7Kk1EELLTGCgyms07f2NsqdBqfP+
 +rQ6bYJjZ+Y2A9B7LYTARIE/VXe/UPXYZ0XbdWDGxiod8YUC9UE53SLLgh1iWYSQz4nV
 SadnvcLTZnL4Wg5icelphUhYcK60AaGODxHrvcWItj3nxjeqBoqanXEFuvzz6irjigDt
 lsnw==
X-Gm-Message-State: AOJu0YxllW1o7+7vPF82MIFcz5UsQM5EKyvuBZRpX0DoY+8O6+8eah/m
 vyVOBID8bfzoQeiimo6oFVku/6ardTm1YvGVhxJdPQ==
X-Received: by 2002:a50:9fe9:0:b0:543:714b:535d with SMTP id
 c96-20020a509fe9000000b00543714b535dmr6584657edf.3.1698923948872; Thu, 02 Nov
 2023 04:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231030151528.1138131-1-hans-erik.floryd@rt-labs.com>
In-Reply-To: <20231030151528.1138131-1-hans-erik.floryd@rt-labs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Nov 2023 11:18:57 +0000
Message-ID: <CAFEAcA_9_5HGi2Q9ROVXECpd+KFZ=dUAcSpic3gaJLPQrrXnJg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] stm32f2xx_usart: implement TX interrupts
To: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
Cc: alistair@alistair23.me, marcandre.lureau@redhat.com, pbonzini@redhat.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: DGezurO9OZae

On Mon, 30 Oct 2023 at 15:15, Hans-Erik Floryd
<hans-erik.floryd@rt-labs.com> wrote:
>
> Generate interrupt if either of the TXE, TC or RXNE bits are active
> and the corresponding interrupt enable bit is set.
>
> v3:
>  - Drop patch "hw/char/stm32f2xx_usart: Update IRQ when SR is read" as
>    it is not required

Applied to target-arm.next. Thanks for this contribution!

-- PMM
