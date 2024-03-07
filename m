Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1117144ejb;
        Thu, 7 Mar 2024 04:49:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWP78zE7WtYCj6Gy2WFV2+0peUeQ2sdQSU8hr92dMliikIRwFS1cW4nqmpUK1L9EannlHBW2cDdZAt0mvzfjo0dcHwSDyZ0
X-Google-Smtp-Source: AGHT+IFMm3rZHg/WLeCh549N1dW4XOeVQV9sLshqrtbs4SOsKAuijmbC2MQUSBdvKGpi7C7N3MAJ
X-Received: by 2002:a05:620a:574e:b0:787:aa2b:e831 with SMTP id wj14-20020a05620a574e00b00787aa2be831mr7647539qkn.35.1709815762211;
        Thu, 07 Mar 2024 04:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709815762; cv=none;
        d=google.com; s=arc-20160816;
        b=dx34LHrlbCsyJSbZSTvThXFXNN2Iq/ThXC5/sXHvHYxeXpdLIhAdZezW3rfs+sBPfq
         qdJ1UTSvPf/dHCvsDjIWrQDNdLJdXZ9joBj77Qfz/6YtP+t4UYUv2UyjFY/GpShjlcEu
         4xHs8LaoSaZxm5A0V1WL2l96V2ZOyBDhhVQF5d9OUxZp0oCbM52KaE1wIWD0i8epiJvV
         hE/ovlOY3O/6R42+V0zRiJU8GJrF3q6l+WE2IM4Y1zbjki8tyZy9alBVqtWmW+wlzRsg
         fO9AoZiLWoLj59hOlJSc6TvDU6wo0jCEEViIdXUSPD0HE0DlBXOZq17btxIBOfEwnssq
         +XXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NlhpGeDgoOR6m0QuS4p5ZaDkH420pj9/t2sQw+n+Jqo=;
        fh=6l5JjFPVi53/Wd5n8DySuV9FDSm2RHMbHZHzdEvbUIQ=;
        b=IM6JKsbF86DxSr2YtOk4OQkOexaC9Eg4GzFOW42OT6cUJ4dJqOimi25C/2O8NYucrZ
         DNrsHbrddBcVZmjxhgnZ/Sy+g8K5G0Le+jxoZMpSRBZaV2ViypGjszK7yYYE4VGFZQ3d
         JXcgFvu+0qYA/cogCJNpksgS2+YCwPCCgwg3a0C91htkoWDVWVCljFta4hRlzPypkCbA
         0A8HDo69H7oWF3F4u8o2cri5wMWvfYaAvL4r9SFgLC1j55lz4RPE1qr4kleFdS99Q7oG
         s4MyC5J1chtrnxkhUGyuv0zZrrS/F8jeIw8P6F/ftwt1NURfP7USCVyccbLBKWJahOi5
         3UYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t3LFh3ob;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9-20020a05620a450900b00787f6204b6esi18478356qkp.541.2024.03.07.04.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2024 04:49:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t3LFh3ob;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1riDBV-0007q9-PD; Thu, 07 Mar 2024 07:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1riDBU-0007pw-Gq
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 07:49:16 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1riDBT-0002kd-2n
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 07:49:16 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5682360e095so67834a12.1
 for <qemu-arm@nongnu.org>; Thu, 07 Mar 2024 04:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709815753; x=1710420553; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NlhpGeDgoOR6m0QuS4p5ZaDkH420pj9/t2sQw+n+Jqo=;
 b=t3LFh3obYoCnMb8u/qqHbpF3t4Qle96laH0Zxs1KdsquFHjQrfX9PeL7xEfVZstooO
 s8Ln1atBpGUxqPJ7CMe+aCf4a09y0tWkoOyJHH6pPcFn1iS7OkpUmwLJ84pM1ITkVq5m
 z3eIDt6jrAsPNzpmSEkK1oCivnbP9AOu2hAV3vWfVnkrsAP+W/1IVPWivEaM1mn3/lNt
 xti6z62OJroXj8vxLCcunSKLk2hSSDHX54G25IK1FYY35fvXxIHwhPJCpfAgill7mixd
 aw9E5c34NM1SrW2/25Akt8P5n/+CXV3Fq4LiOWX82fVWTqwtYG8wxbZMkUEYB13w+12h
 1Deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709815753; x=1710420553;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NlhpGeDgoOR6m0QuS4p5ZaDkH420pj9/t2sQw+n+Jqo=;
 b=XF/YoEdHZsKLcUx+l4JepZ3hwlYvdMRYhviPvfCroKMxngMcFuPQaDheX4ide1Wuv1
 V03VB7gSjsVQJ9/SP+ECdWIkKPZbZ6l0D6hGBSvWThxrsDMdf9te9Q0TOeulsLwnYFZ1
 5RS3DTYCS+somh9WovJopH65mAOIe2n3pyidrryB6H5Sr3IPCzO4PlmJSBpO+Va5wcvO
 6SHkdNeJ5y+3i/FUM16xTOJfT6nueXyGxIlXF1I21N3uGAh6kCzlQPEQID9Zp/o7WWyx
 Sq5Xy/qr4b4N+2obMQvQX2R2DNti2jSvvYPXdCPpUd45FSizjjC8ATkcQzbwoaqRD2gU
 sLqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1pNgrCPQ2zIORWRu55vO8F67tt52zRi5AwIFaBsf/btVoH8unTqKnQTRV39jW31DJ3Wy0qXpItF4EGx8YPD4nFhr7
X-Gm-Message-State: AOJu0YzNNpRvqV4gN6JyNHPZyhqb8NptAZdzsPwthHB66TXAKkcsEMhF
 wnm6NouktAt6dsuydaVMzdwOr4wPBRSL9IphJyavCkfvFYEM5vLDdRR6ry6QGcb1kF+etfTWY4h
 3EHxKNoKC16dbMYD/3J3NNT7hUBpWfzODMrHpwQ==
X-Received: by 2002:a05:6402:2267:b0:564:5764:a5d8 with SMTP id
 du7-20020a056402226700b005645764a5d8mr12750487edb.25.1709815753529; Thu, 07
 Mar 2024 04:49:13 -0800 (PST)
MIME-Version: 1.0
References: <20240305210444.310665-1-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240305210444.310665-1-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Mar 2024 12:49:02 +0000
Message-ID: <CAFEAcA-3818ukCcer9rFed982_RJScFkvXrGCUdiBpWCxOLbsg@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] Add device STM32L4x5 GPIO
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: E6YjriQoohe/

On Tue, 5 Mar 2024 at 21:04, In=C3=A8s Varhol <ines.varhol@telecom-paris.fr=
> wrote:
>
> This patch adds a new device STM32L4x5 GPIO device and is part
> of a series implementing the STM32L4x5 with a few peripherals.
>



Applied to target-arm.next, thanks.

-- PMM
