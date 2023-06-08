Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp388366ejb;
        Thu, 8 Jun 2023 07:47:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6gGLnBOSzbPHJTx3yjBrUT85Tz6EXdcI2w6Arw/CQbxds+OmvpzIWOPw9Prj1zNiyHYySL
X-Received: by 2002:a05:6808:a88:b0:398:2b78:3272 with SMTP id q8-20020a0568080a8800b003982b783272mr8330001oij.26.1686235627147;
        Thu, 08 Jun 2023 07:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686235627; cv=none;
        d=google.com; s=arc-20160816;
        b=SuX7KY5y0kJTrlRYpL9w6iuFeduoAcA+K7dK7RS3CHI+mQM838MIJuqEZuIfd41Qsh
         EjT3fpB1y1t/9Oj9ccjauviMuhzKQTEe6IPwjG/vIcqdimiXGu1LsFeDefs7HzmXKTE9
         WsM0ItPuhtDv7O6Nkw09ixbqtacAWf0BXZVhFVbeg121CGhQw35Hj2AEMtwB57fiFGKX
         pqUaPBz9Yy8/BZIJDJcX/3N+kgcxLaVe6MJxmpocJ2k/+tq5V5SSBn7NNVM68CZHJwWb
         qcW1mxO2omL2xihF+voqIt+jrOIGdc+yS4S3sUoej2GP2atWUq07ZkR1gDhnbJIPLxnr
         W+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9YymtRz8dt3CDxGiat6ktH2WYKwEJl3Y2thtAxKI/9A=;
        b=tGQKHGgkZaI/h8J+loJKE/Rh1kxlAUkbM40bkodLqxBUDMF60ePgQkg5dm1i39gqqG
         QiOlZRtjvVm+vDuwTohbKtx/eX8rshKiGXJkmQg2GSDiIgPN6yNfyo/lzdeKXCRDjXXt
         +kRDr+kk22a2OIMhyQ1RoxEkPpK93zVBOqMNdqIxFniMEPHSlmJZcEh3XSsqcGye61BZ
         R5KJOSGy7I/LC0XJI6tUekfHV9mxM5jT5xAB/3bIs3cOC8WkAr3uA5MEwi3qyheeo0gt
         N0UjYcsaSRRViyRUGoCrdncew6HF3msT/FohJDDHIaSHMtuTx8AlyMhZokirrPF8vOpK
         1GkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZzGBtAzv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a05621420ac00b005eda1d1d9aasi787760qvd.598.2023.06.08.07.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 07:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZzGBtAzv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7GuX-0007Fq-Mf; Thu, 08 Jun 2023 10:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7GuV-0007ER-Mk
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:46:47 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7GuU-0000Z3-53
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:46:47 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f655293a38so420464e87.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 07:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686235604; x=1688827604;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9YymtRz8dt3CDxGiat6ktH2WYKwEJl3Y2thtAxKI/9A=;
 b=ZzGBtAzvcI+0P6Nz/U4i1eWdLurG+/ILYaUwISU6+o+TlGSX+1GhMngkVL+E3fBwQl
 03aGbzAgUfQjIT3kIDoBnrKfbe9ry4NHd+oesOmgxbWyvJ0RImtK4Jn61uB98ViYrwBf
 O0boEH3o2nPgktiNjhldkmmRuCaY9cKOYL82eTV2+74ckusiTM/jRL7qMbRL4SvRk6Fs
 uS95Bi0LGyi0YrfQXHC01nuNUdvUtAjbh1RxfYhiQXVu0WtzdJfSUTrxbphRd5W8a6DN
 AOwKzcRSncTFGVNdZR1jGuvmXO4FlMndjkD6rErRSDXbve/LgxnOfTagIkNyR9v6X/eI
 hSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686235604; x=1688827604;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9YymtRz8dt3CDxGiat6ktH2WYKwEJl3Y2thtAxKI/9A=;
 b=kSQTU9jObk1mSdtAzYoP/MLD7OvdrMy5ZKWWOTr4bj5x1vjv3ivoyVw3Vin9si2Cfv
 NGJF7XeiAMaqsz6PLZkPdSZVYNMto9ROrBFaKQfSLVYJCS/Ek9FaZG+XRzVsiZ8p5/uE
 8JJgMMEDNFXDhM2GCpGR6iyxnIXuNBte2Y83I0yn0Bf/5aG2wFyF2l956TAYDe7fBdiV
 PI1QcfamfFef6Ywyk5JCCbtT96gc/oux7E36asgGJatcLVealgk0WNA6Hl/igwDB5i0y
 U/xoXDXARh3Cr0+gjn6iBnhMyD4uNs6pJW7DMuqDBd/+pnJ77BT7jPDc4/uaA0oNpKuP
 7k1Q==
X-Gm-Message-State: AC+VfDwZ9ZQbiGYFQJD+RCkXOTilh8lDX03pOP3Io3wqVkfOZ1AaOyY0
 Dk//O+tUBTt08tt0ZcH5FUeGyiR00U+sl/A8KSP4ZA==
X-Received: by 2002:ac2:538a:0:b0:4ec:8816:f4fc with SMTP id
 g10-20020ac2538a000000b004ec8816f4fcmr2998436lfh.6.1686235604234; Thu, 08 Jun
 2023 07:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-8-philmd@linaro.org>
In-Reply-To: <20230531203559.29140-8-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 15:46:33 +0100
Message-ID: <CAFEAcA928VCeRVz7JQFGefxuyDn3LZC25zuLSJfYUg-7PkgyXw@mail.gmail.com>
Subject: Re: [PATCH 07/15] hw/timer/arm_timer: Extract arm_timer_reset()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Sergey Kambalin <serg.oker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x133.google.com
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
X-TUID: YJXYiYacbLXU

On Wed, 31 May 2023 at 21:36, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Extract arm_timer_reset() before converting this model to QOM/QDev
> in few commits. This will become our DeviceReset handler.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/timer/arm_timer.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
> index 2cd8c99b4e..54318d0a57 100644
> --- a/hw/timer/arm_timer.c
> +++ b/hw/timer/arm_timer.c
> @@ -172,13 +172,18 @@ static const VMStateDescription vmstate_arm_timer =
=3D {
>      }
>  };
>
> +static void arm_timer_reset(ArmTimerState *s)
> +{
> +    s->control =3D TIMER_CTRL_IE;
> +}

Reset also should zero s->limit and s->int_level.
(in arm_timer_init() this was implicit in the g_new0()).)

thanks
-- PMM
