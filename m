Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp438374njc;
        Mon, 24 Jun 2024 07:01:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTK0atgX5Wv3eOYiauemWGgNmcJ1ExyLNH3A9C82aQyr6bpgxPvd/69Bw1q3cVOw02fql3/9UgRt9ghke4GOKbE6m7e2lC
X-Google-Smtp-Source: AGHT+IG0+2it6y0RZ8QS3SzlgNzVhOhJpxTzzXnbUFOMPuW+R9qFRfsPrfgbc1/8SHEWTV5oYKmJ
X-Received: by 2002:a05:6102:b14:b0:48f:1c3b:8960 with SMTP id ada2fe7eead31-48f52669389mr5314137137.0.1719237702614;
        Mon, 24 Jun 2024 07:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719237702; cv=none;
        d=google.com; s=arc-20160816;
        b=UWMKY0auwEF9ugJTkRaVtvULqZ3XsCIRDdmBJM6L/cX5ixPWR2KI1z2aKf5gLNsBM8
         WMmwAgyYvFj7KFIHbeRHHSH2QtJBgZbyT91G8aim8fiFByL/nk62Yc+mWejDPVD29UUh
         UFJzZ/OsM2zCK4W0397iBqmF/1e72ckvU93LHTAjpfr9ngbsOsM2C3BA2ubzRs7aejWW
         txcHMzToYnI01ZJPwoeqNje4auUUT1zrHqvtQKCR/pi0L8zqG9HD2WAkLO8EJiZC30yx
         zE0+aVL+hFtXm66d8HNlh5v0j0E40uOFxfzeHGjG2dikif9/w4KngLXSgxTv7Q3MJDEb
         8Qcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TsEaTKpu47SdPW+RydyV2ylH3pJT/VZC8Bxke+9Lm0g=;
        fh=nf6rXGXqw4BL9Fxo0ZTtS7lUW005VoLIlcx1WuUyeoo=;
        b=RyT8kHyU6jE7SfEDl60C5jlyJo/HT37bGUYZCSWmHMJPEVIj6UgYbTFKx/erlrbv56
         lCBiMPX2PI8TcAq6b0dNGpXgPaxw351T5YnDM8sO2Qz8IoGUMOoPBpB2xNFyPEcgY02I
         bwpac6VPj84qcAgBSjUhmfI1mMyU3kDS8EHQIWMP2WVBbxSSo+zNvgmQ9Y4giCK43kDm
         e4Gvuc5CER8xWiP81udm4oH4p3FB3XWxXnL++s25YeKuBK8xwL84eCUoWfW3A8kl+CkD
         Oqp+3wDUgGYFXFmGXH65DaNRI1QGQZVbdDTe1DIKkCCJvmZKkjnFmJPHTrySue9JNgG3
         f7jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WqIdt4/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48f332426d1si1103903137.302.2024.06.24.07.01.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 07:01:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WqIdt4/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLkGE-0001Wr-O3; Mon, 24 Jun 2024 10:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sLkGE-0001WJ-94
 for qemu-arm@nongnu.org; Mon, 24 Jun 2024 10:01:34 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sLkGC-0007PK-9X
 for qemu-arm@nongnu.org; Mon, 24 Jun 2024 10:01:34 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57d1782679fso5073120a12.0
 for <qemu-arm@nongnu.org>; Mon, 24 Jun 2024 07:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719237688; x=1719842488; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TsEaTKpu47SdPW+RydyV2ylH3pJT/VZC8Bxke+9Lm0g=;
 b=WqIdt4/J1bMTj9Zon6fEHcTURTCi08f8lFLNdEf/PJeQHPeBZ3l/b8EvWjsGSbGTPE
 TuDwWjry2sdRO1wfv3PxEtKJLlvGbe7sZBmNTCH2rJBxPXUqtc6FZEiBLbz3irKxPOA0
 0rhnH/c6EDpl4f3QsuBFr7vbOzzXVHbz0musKSEhp3/d5tOnkWLh/okPIZVth+WZki36
 5d/wbL0Urb4rxAFFusewNpm7XgNsFIT1RntzRxeHYvzr8D1skrGXJdUH1ObJ92cT8pcb
 k7S2urD0XSLgLU4rry0zc7MIfCIKpiyGGc0LN73/A5er7gOODDgLmyQbcfEaxeeUzj0b
 iy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719237688; x=1719842488;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TsEaTKpu47SdPW+RydyV2ylH3pJT/VZC8Bxke+9Lm0g=;
 b=GDeB4eDbhef7VlyVzvNYMo0v2bizDMi/0PXyEXtnH67QEYDhGU9jxA3FshyBqKZJVM
 3ZsOGcPQw3R1Jke7HM+EhtKt1riqHRSPSa7GVKHivwO77Fx/Q26A1bBbo9oT6GSto5iv
 IvAgBwfb+4bi/GvozSMTyRIuUY+DbZ4kpGmAcrEVd+BOVwvmlHxpN2UCueAFwbRoz/c8
 O0SSHjOFgaKYY1DYkGFI8L2lW767q0NbCrP3e7ANmnBFS5UpmDfBXWx1GbQB3z9wMAPU
 qv4FHPeVFJofcJLXf/f7VZEoUoCtgc+AYLB3459NEebwjD2Cs4b1aywoN4Iw4vDu+1Xz
 TzSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3YPaXgtxcehXR+whLes3IK0b7/m34RbZ7DqmUAYW+Y+FFCFooczX/9LjvMZMZKpXKo3EDdu26JzM6o9gUiXNAwRDM
X-Gm-Message-State: AOJu0YxNAjpJX8n1ZHADqBHkKBR/BZ2y42zHWStuJ9DuanSLY+729qIq
 rBltfBedbXIVizHjL/1d14XlQ4nB2wzquNdnbXyc3w61unhSm4wUlpBlvlgYKqWRhMoUjCSPnTa
 pVBwe6FCQOlGZoe5oBrNaGQ/EwvlWVpmCLBFi0w==
X-Received: by 2002:a50:f604:0:b0:57c:aac9:cd8 with SMTP id
 4fb4d7f45d1cf-57d4bd5648amr2949038a12.8.1719237687896; Mon, 24 Jun 2024
 07:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240619093508.2528537-1-jamin_lin@aspeedtech.com>
 <20240619093508.2528537-2-jamin_lin@aspeedtech.com>
 <CAFEAcA8tTHusKOR7JhyU+wwA3JJWq1o5wVaNXugw2S9SjAsESw@mail.gmail.com>
 <b013bd79-c206-446e-b482-91eeb926c70a@kaod.org>
In-Reply-To: <b013bd79-c206-446e-b482-91eeb926c70a@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jun 2024 15:01:16 +0100
Message-ID: <CAFEAcA_fWTUpfRvYjDDXnXBoFuiZZubzVaKDbgKpmsDr98uXtw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] aspeed/soc: fix coverity issue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: +HI/mMlvXBL9

On Mon, 24 Jun 2024 at 14:58, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 6/24/24 2:18 PM, Peter Maydell wrote:
> > On Wed, 19 Jun 2024 at 10:35, Jamin Lin <jamin_lin@aspeedtech.com> wrot=
e:
> >>
> >> Fix coverity defect: DIVIDE_BY_ZERO.
> >>
> >> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> >> ---
> >>   hw/arm/aspeed_ast27x0.c | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> >> index b6876b4862..d14a46df6f 100644
> >> --- a/hw/arm/aspeed_ast27x0.c
> >> +++ b/hw/arm/aspeed_ast27x0.c
> >> @@ -211,6 +211,12 @@ static void aspeed_ram_capacity_write(void *opaqu=
e, hwaddr addr, uint64_t data,
> >>       ram_size =3D object_property_get_uint(OBJECT(&s->sdmc), "ram-siz=
e",
> >>                                           &error_abort);
> >>
> >> +    if (!ram_size) {
> >> +        qemu_log_mask(LOG_GUEST_ERROR,
> >> +                      "%s: ram_size is zero",  __func__);
> >> +        return;
> >> +    }
> >> +
> >
> > Isn't this a QEMU bug rather than a guest error? The
> > RAM size presumably should never be zero unless the board
> > set the ram-size property on the SDMC incorrectly. So the
> > SDMC device should check (and return an error from its realize
> > method) that the ram-size property is valid,
>
> That's the case in aspeed_sdmc_set_ram_size() which is called from
> the aspeed machine init routine when the ram size is set.

True, but if the property is never set at all then the
struct field will be left at whatever value it had, which
is 0, I think. So if that's not valid then it either needs
to be a different default or else the realize method should
complain that the property was never set.

thanks
-- PMM
