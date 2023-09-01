Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp552502ejc;
        Fri, 1 Sep 2023 04:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6ias6a5orVdJybCs0yuXz+CQXN/5gu5t/IZm7ro5yGU/j2SirLG6QIFObZsOsyhFrDlO/
X-Received: by 2002:ac8:7e81:0:b0:412:2e30:7a55 with SMTP id w1-20020ac87e81000000b004122e307a55mr2898170qtj.37.1693567747433;
        Fri, 01 Sep 2023 04:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693567747; cv=none;
        d=google.com; s=arc-20160816;
        b=QfVmCzREFdnOICxiClsAaT5YTLrvTOZG6CzSP/sYXqmQQ6YsDJrpsbexEOIuAh7ji2
         Dg4Us7BYUeltgqm38CdvlkDFsi31StHfdZ3bL5ojfCvgQEZH7q0drakIrv+N/tepe+iC
         d/8L69GU9IJpSGWnTCc+DG6BRnlMtTSEWRB10RTXYG6V4zo8VyIZDszSnDUHWEmu7NJl
         OkSgWhbj3+iuHUU9ZlL93hxxJOxVbqnyISReop2APa/o93PO/dt2ViiqlyF8sX26SYYr
         EmmT+MbxCk4Y0P5/qnwOSxop4mNqRuXaFzlS10znDSpYUxDuE8btTDe6bUyDNS2nUxFr
         fyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FO7H9E6SndJpylR506Q1WT68aVLxk1+SMgQ1AdsDVO4=;
        fh=KA+RLQtmkguXR9PBCd54YxKlbtkvfsZEgZrb+Qqml6o=;
        b=iE8x/9ULViomgltpL2XZhW8WXU5WgbcI+JKp5FSv/aTpRA4TTInQS05xaLc+oNOBrC
         0l1lfh5IS1UtRa6yQhM7a3UZflBAH85cCBHQmM1iJfPgXzM1YZQ0bqbOji5T6d9qPyOA
         oZLloDT1OTUXduClVfHnp31Sgh1DCRqjWtzviK+Rmje78yQkOquPRQgrF0ve0hTVy3Sv
         XLHpXib7erl9WNnbgcl2EFurvOnxIvnLfUioOSHR6xlRq+ck9z6oWIsoiGPqd//Crn9t
         uJey9NY57oYhtqbUzVk1goUHDqavBAob85YefkYCDVwBChAIy2S+kzY+N6EA5gT1NizF
         97+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FlwVOjda;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15-20020a05622a040f00b003ff1fe3cd40si2221701qtx.162.2023.09.01.04.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 04:29:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FlwVOjda;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qc2KP-0002W5-7c; Fri, 01 Sep 2023 07:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qc2KN-0002Rp-KM
 for qemu-arm@nongnu.org; Fri, 01 Sep 2023 07:28:39 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qc2KL-0003LE-JP
 for qemu-arm@nongnu.org; Fri, 01 Sep 2023 07:28:39 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52a3ff5f0abso2517006a12.1
 for <qemu-arm@nongnu.org>; Fri, 01 Sep 2023 04:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693567715; x=1694172515; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FO7H9E6SndJpylR506Q1WT68aVLxk1+SMgQ1AdsDVO4=;
 b=FlwVOjda2eZdX0eQiZPiTG/haig1U62ARBCFLGDfYiV+fbAyn0ij+bf+xzZTZM9TqB
 utTnF6j0Ai8HkV36O1TYvzwKWt1mI0IJh0SQNrAl3aLrJTlp2pYSAM20madIiYS4voQK
 HSGpwVgc8NI03g/alFRKQgKw/XmfUA7nV+Ul/lYCdh7xxmCDpE3MhlRdVJPBfWvSY4o/
 Cm/UaBYhXqZVgaPxX95Ci50ZULDhzAKvlY6LypZbqK0V+MvrWVdUeTr0b8JcxgnXhEoY
 v2rdHwDii7Xw0D/lFwCgqWTRBCVCbLuDRjJFtDPorFykrbVkCjmU6ZmvRFzSZindmluB
 kZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693567715; x=1694172515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FO7H9E6SndJpylR506Q1WT68aVLxk1+SMgQ1AdsDVO4=;
 b=P+C2tbqhqgKFalGSEWfCjxDm47md0l+wh6mHHQjoeuK0oZSMCoyv5ehPI9jYqFeJWd
 EryBhEBYD9AIOazV1+6IUyalFB2Sh2CWAp4yojehz5bpp2DtxIqN0kyuwXTY2QV8OgDI
 H7RU0P3rh5mS69dAfbiPAGla3FCOzoA5GRLuqevG0SMc4GYeVIzXig4j4+al2q0cz1kG
 7sBNCht8U5Almdkw83Gh0mA907MGIbUsMZ86WxGlomPR3WaW2qXfBxzxVp1rgz5PIBAm
 3m3aDXCGZFOqNrkAURDJTFldd1Hk2nGM3EBJPKPm8zM4P82DTg3GPcj3f6vk4dJiEfzc
 nGBw==
X-Gm-Message-State: AOJu0Yx7B4dLj9EmnMe92gK4FUl/EGVhInk5WGhiE6bXm7mYEY6luol+
 ZckYc7tr9UCcipS8BRlQxo9HUUXCiIiSKNQReB4hbg==
X-Received: by 2002:a50:ef13:0:b0:523:102f:3cdd with SMTP id
 m19-20020a50ef13000000b00523102f3cddmr1931446eds.19.1693567714683; Fri, 01
 Sep 2023 04:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230831225607.30829-1-philmd@linaro.org>
 <20230831225607.30829-6-philmd@linaro.org>
In-Reply-To: <20230831225607.30829-6-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Sep 2023 12:28:23 +0100
Message-ID: <CAFEAcA_mLqoOPWz_SSR6E0KBhnV6hvMPXbv2cbgYCqDS4dfO-g@mail.gmail.com>
Subject: Re: [PATCH 05/11] hw/arm/virt: Clean up local variable shadowing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-block@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: i2V5SPFNWPIb

On Thu, 31 Aug 2023 at 23:56, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Fix:
>
>   hw/arm/virt.c:821:22: error: declaration shadows a local variable [-Wer=
ror,-Wshadow]
>             qemu_irq irq =3D qdev_get_gpio_in(vms->gic,
>                      ^
>   hw/arm/virt.c:803:13: note: previous declaration is here
>         int irq;
>             ^
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
