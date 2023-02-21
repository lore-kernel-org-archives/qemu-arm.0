Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3476205ejb;
        Tue, 21 Feb 2023 09:46:03 -0800 (PST)
X-Google-Smtp-Source: AK7set93B29lwsS4Sa0L7RyeAzOJN9a5750ScBtbjDMmxqLWmlxkV6XwpBVnZ8qR8Y35iyW3mEub
X-Received: by 2002:ad4:5fcd:0:b0:56e:b273:fb46 with SMTP id jq13-20020ad45fcd000000b0056eb273fb46mr10968386qvb.51.1677001563448;
        Tue, 21 Feb 2023 09:46:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677001563; cv=none;
        d=google.com; s=arc-20160816;
        b=OElvaihONtqjoDNa4ztleJa3yef6ca2ZCr8IhNFb4mkadVljj5TIR6zi8jLaHUm+Qp
         Sw7z54qJH5KomLboWRlZ4qx+osHOaj9hVoqFK582Po9712IrZqTudjfvayy2zU22VRRQ
         CKSXuo7kRzNpapwp7fjlxqafRl6ODdIdSCsTJIX3UMnim0TLVu+AhK0lpcSc2nZAhR2D
         KePEbc8u12s02SxIwuZF5fj6OJZtiueCAnoFb/1G5xP21b1YHIgrSKLYUIZ3LP71gALC
         97/GXIu7JCZ3tdpPWbwoi/0HWyvux3LfQOMLZCZe+EJAdndywKuPnG0fcmsSZWYslE2u
         RENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IhD83yxvzDaHbqeI26AP+r9/NfMFFQ9TlhAHai+e6DY=;
        b=ff/CU5EwRsDpAamR0IBdVpc6c8zwa4gxEQYJgq17paWTPuKb8tWkaIKdGKrQdjgpdK
         31Wq0Ui4fm9dLEgNGFY0Iha4PCaBf+RP5NTA8+/0PnzRtpnDumOkiFRf6GOCdRnnWD2r
         qpDfn9Q7XIvpxobB1oldQFU+xP20MZ2w+CpugB+fAR7Q5hX1kCrKW7L6+MG6XVMMnB2E
         esS5KATbz2C82jWINaWHY/w0sDXeYR8wA4PaSiUf4yVxTClRIhg47J/DlHsqnqVkNYAz
         oGetlDsET0CFOgHoFfK9lUrNWCopbsJMajTXDkauUwQUlciHRytTVcyFx1pUs1shgGyV
         BVjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UsLtMC0n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a28-20020a0ca99c000000b00571b9530189si1839813qvb.430.2023.02.21.09.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 09:46:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UsLtMC0n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUWi3-0001Ov-D3; Tue, 21 Feb 2023 12:45:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWi2-0001OO-63
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 12:45:46 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWi0-0004Uq-O9
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 12:45:45 -0500
Received: by mail-pl1-x62d.google.com with SMTP id c1so6142940plg.4
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 09:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IhD83yxvzDaHbqeI26AP+r9/NfMFFQ9TlhAHai+e6DY=;
 b=UsLtMC0njip9tDsoOPmx6FVGidNP7m6Sgmka3Qa81vtkgFchjcnTF+J7z5ewovt4xm
 2AVqOZGcZ4hTMKAaBIjCtZ5AfsCZAmGLGIPqlzM/7e9yBtc8XmcwWkpmMHujyOLBItw4
 glDPQfw/8cWfASCVam8+8g15VpQ8Z+Lkx/5lFytDcBirvKkgdavrzseXN7GgRWg7Ggzg
 PmHGpZj3VauCZ7eNofdIrRASUVirsIx4B1xRamCF1t2o3dmEeEDO1/NCwWWEEvtAELYt
 W2fQx+dbIrdgjEB+FpNSbYRgI7UrtG48rMFSwx8mMlizVK4CbehukLnpzY3gX0TYnjX7
 VJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IhD83yxvzDaHbqeI26AP+r9/NfMFFQ9TlhAHai+e6DY=;
 b=M0leUQ62hoN1WGp5BUyWzSp2GzqgXVaW4sNUPKPQDXj48lomnZ9QbNsMIuevL1plVi
 2tlMstepNeE5vwUYUe9Oz6JsXNRbUCxVqV/4w4If+IeDcgASZE9ZkS6reHscY8yLKRog
 WbTDtKxE2PIP+xkuzAwOD1WbYYlXWvOGeDszK7ttutEkI3rRkzwewNQmXkD2c7/HWTNS
 ntC7pmKc33M7mLMTRmFDUSRe9D3GZfe2SeBi1p1WOOq0Xculry7XZnixuuxzow6EoJ1W
 SzZGLssEMKgrt2JNuZxYdjLj4o+kb9YLS1Onu0SHP3qFJvh4ghRUVo8n68ZQE95bNl7W
 Bccw==
X-Gm-Message-State: AO0yUKWbbMKOcWIbMUOJu43y5Nhj6WeZd7Gcqxjoxqb77uFxahT8Afoy
 HVPcHr0SMM1SM0NF6HckWcqPQZ99Q1QsrYObkzTlHg==
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1939456pjb.92.1677001543194; Tue, 21
 Feb 2023 09:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20230220115114.25237-1-philmd@linaro.org>
In-Reply-To: <20230220115114.25237-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 17:45:32 +0000
Message-ID: <CAFEAcA-FT8aLaOzH96Zmvw9yZH5L37TnWpirFwVFC8QUdZqAVA@mail.gmail.com>
Subject: Re: [PATCH 0/8] hw/arm: Cleanups around QOM style
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: z+fQ2vmdsXsl

On Mon, 20 Feb 2023 at 11:51, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> - Reduce "hw/qdev-properties.h" inclusions
> - Open-code various QDev helpers used few times
> - Use QOM cast macro when relevant
>



Applied to target-arm.next, thanks.

-- PMM
