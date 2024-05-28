Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp5371ejk;
        Tue, 28 May 2024 07:51:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNdeZhyE/IxKNlTCFxWexaSSDWJB5/soTPF71ETmqZ4+KaN0jrOKglpVmpu3Lxv5tysbaOKIaC8lJTx4RALai93E6IfPxo
X-Google-Smtp-Source: AGHT+IFXcRBvIXN5009DSfPAhRhJTtU7yIOkrWF0hFFwXfoyLOhMbJeN7XNLE43TWiPONaBSS1Wj
X-Received: by 2002:a05:6808:24b:b0:3c9:60a3:dfb1 with SMTP id 5614622812f47-3d1a548466amr13623028b6e.21.1716907913252;
        Tue, 28 May 2024 07:51:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716907913; cv=none;
        d=google.com; s=arc-20160816;
        b=I3EKk6GBwaxJbidpTR7qBShGhcGvNlPYkMod346VVEbzskAvE4MR42KKIq3PcpzBQ3
         ZaK78ruSPjaPhW0Ojez2HNRB2xdtFBuOH/yoK6jrjP6UT4MJL9hQe4rtR40rwcCSKICn
         0Io5R61l6XqWSx+NyT87pc2/x0RATdHbKC8TPTOB7JD7U2c8nvxawizkPJqDdMYKj13L
         znVsSxGr93h4JC6tMgOP5PFjgqqsty70FnkeYla/xvQKPF7quIWyNoDmhXba6j2cStju
         t64U0wfBLWQZpcibFBgj46VGcEJ2bl3Uq2SCiJFRAZG8ara3jIhHhvx1mLK3PhWoRmAw
         NeLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jjSXoMmsHLX28IQaClSUKuM1H9Pzj0WilNUutKhfhFU=;
        fh=Q9Mmnuj74O6OisAuMzqh88V4cgrQCtx2RWOCcuEynFM=;
        b=Ej7EyrBwKJumkHAmYErr5kD2+nRXscHGgezkxbbUDMGne1qV4StKWQjdt+UkpNc6Ap
         z1H41tOeIbzdladCXBkZl/8aZ2HHhcm7CW3uCiSxdTEi/V+yr+zryhkTjl2wq6oE1WRf
         XaMdeQXKV0FDhk0CIWlZvGjm31h6MyKL18xe9UwQDO6xSQwbESiaY7wSqWGrtxoiuGkr
         lVQtPtGkhLwc7yENH3qatxSKt/cR/e8zIZ8C784PBVRY7xbEEP0c/yIx6f7n5Z/mEfii
         63xfZ3Q1KNAL5+Kyi/zC+zNpO3irqU1Pnm4EBVOGc07E7MjPNiziB3zJJVs7P6gMSPTq
         D7RA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gpYyUx7J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18c5ad9si121055131cf.588.2024.05.28.07.51.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 07:51:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gpYyUx7J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sByB5-0006CA-DJ; Tue, 28 May 2024 10:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sByB0-00066S-Jx
 for qemu-arm@nongnu.org; Tue, 28 May 2024 10:51:47 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sByAx-0005to-9k
 for qemu-arm@nongnu.org; Tue, 28 May 2024 10:51:46 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57869599ed5so1133442a12.2
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 07:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716907894; x=1717512694; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jjSXoMmsHLX28IQaClSUKuM1H9Pzj0WilNUutKhfhFU=;
 b=gpYyUx7J1siUC/cPXuQliam5hyYzUmKYAkmolYTetIOxm137yWOm3rmnhYL4a4yWlz
 foMOFssuexTCjKMCVpxKPRXLP2PXLsOv3KSYlz1SQv7ul4muf1M2WciXw9A2AirYwmfI
 YpLoj2ESL8QH4BDgg4y/pt/2+JVdFzPXV+87e4DLX7lKU5ysnQoYWMKqzQiq2uisxoBH
 PqOiP8w4nhImCclCBXKfDAzdsKXIEQaR4mxsH6mUjimS0QsHkisIzPL5TXq+3jS2STGA
 79V6lVTHoo5jhzYNwCtvAhonPQpXd0Q7uOIO05ii+CqlObOPMkWrImcLl+5NGcqgjFr1
 60mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716907894; x=1717512694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jjSXoMmsHLX28IQaClSUKuM1H9Pzj0WilNUutKhfhFU=;
 b=RS1yXlNwAR/AMwyNu9u+mdIbowvxdb1Hlu1hMNuH60yglFZw5LfO8v+PS5D3lG2DM1
 5rc0dWuaE0YuAIkip9dNg55NfcMKAknBsYrkVu7NuYae3d+K8fHvyDpd2a3PRnZpOIET
 F1uoLm7Lnn5dQtbELPIV7RUPblIx2FjF9cnoLr/cxQKejfh2i6VR8WRhrZVQbT1H6Cgq
 T8XyCIIgAASmO3skQcrUzNXlL8jiKtIgWjb2OWkqNLGOr/62RG+RqB3yUFwyQwiNZ7u7
 A+fBr7duxTqSh5ftt5XvNAD5hW8Fc1xludOV0JM6mKsLTkAfhFH9KPiF6lRHXxbQyYJ5
 +oTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+U+VehKioaNglgJU7O6jP1LxyGtlGMHltBtsCUsKe9tfR5cuEjvXSf46E7sr340VKl74nqdz1R0MmTYLn4HyvzUJE
X-Gm-Message-State: AOJu0YwsC2x4p7qoW1QbkQL7iVSxiaB+zGQz0zpSN7p0lM51Ta6Islq2
 kSVJdFs+5QUuLYn9EkAmbM1c8FIlPd50y+Kt8RQyuGYgU6FG0UBDNcEj9zQmb5JciLZoVviCVnG
 QzeEGsRbw/AIE7QY2MISyT5p3FTo+a1z3PWAbzQ==
X-Received: by 2002:a50:9554:0:b0:574:ebf4:f78c with SMTP id
 4fb4d7f45d1cf-5785192a71cmr8587923a12.7.1716907894615; Tue, 28 May 2024
 07:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240523194441.21036-1-ines.varhol@telecom-paris.fr>
 <20240523194441.21036-4-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240523194441.21036-4-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 15:51:23 +0100
Message-ID: <CAFEAcA-zpnS08qTcuoAPGVLVa6U+ZewGWT97_eE6ZZ9W-TnYmA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hw/clock: Expose 'qtest-clock-period' QOM property
 for QTests
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Damien Hedde <damien.hedde@dahe.fr>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc@lmichel.fr>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: ehNQtaZVMt1J

On Thu, 23 May 2024 at 20:44, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> Expose the clock period via the QOM 'qtest-clock-period' property so it
> can be used in QTests. This property is only accessible in QTests (not
> via HMP).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---
>  docs/devel/clocks.rst |  3 +++
>  hw/core/clock.c       | 16 ++++++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index 177ee1c90d..19e67601ec 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -358,6 +358,9 @@ humans (for instance in debugging), use ``clock_displ=
ay_freq()``,
>  which returns a prettified string-representation, e.g. "33.3 MHz".
>  The caller must free the string with g_free() after use.
>
> +It's also possible to retrieve the clock period from a QTest by
> +accessing QOM property ``qtest-clock-period`` using a QMP command.

We should add:

  This property is only present when the device is being run under
  the ``qtest`` accelerator; it is not available when QEMU is
  being run normally.

thanks
-- PMM
