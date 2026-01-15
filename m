Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADC4D41169
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 10:44:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgKq7-0003c8-Lp; Thu, 15 Jan 2026 05:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgKq5-0003aM-HU
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 05:44:29 -0500
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgKq3-0004Xe-Ai
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 05:44:28 -0500
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-646e2b3600fso576981d50.1
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 02:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768473866; x=1769078666; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y0qy+W4B8slotUaUKZ+AgAKzxweFIy3Nmf0uGPwfoS4=;
 b=fgB8zvsPo+Cs3hIBWC1siBnIQEAzoxm8L1bV2J4av3pVU4Uk4zh4piBA+2901FjR64
 5MdtX/JfUf3UriNdKpGeRVcm8jFrmvsDP+YZXhjBBgWlVwtF99IP69tVXbVx3yp/bS7m
 nPELGo5iFUIBuSHkfeoIyJe7XsnEwCivPd8TmNotIdJZhDTyuNxYVU8CxmWtrUKRHV2T
 +IRolxxhAvqaZuEZ2T6wGRD/gO4YcFX9YtfERq3NrvkNrDkTIY69ZUJLlKQ8dyFQOGtf
 NO0Hcp5XHh8q03VZoRopbvfLR/+tcTOD/I41v8TNH58pVrj2Ddt0gzlXkhGewbbrUvkj
 5yYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768473866; x=1769078666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y0qy+W4B8slotUaUKZ+AgAKzxweFIy3Nmf0uGPwfoS4=;
 b=jOcB7yf8sO9+m8ezFxhUJPmWG9U7i+oKRELMsJaU3LUSidaGoiogtSSqYBsgf8buk3
 nLzlxJod5CX8uBclc1vXdrrVW3uEdQ1oGGEuiTLS5FyFKaUcd0cXZqvTd5ryiyiBxA9e
 liSdas3pXZjCH59+4H85GwcJEloBTME/qa8oc4dRE0ZmvhstVJ/58itXDI/eoYX9pz/5
 oYFuOED5tmSwBjWvbF0iwBxJLFIB29yBjsIGyrlu/pVVS6/kXreKj3dyT8e2CHIm/NMe
 cTzm2hxg/iviCBUwMaLh7V9/Kxk3BEC25TOqa6JFGFRRQmU8hvC/+xxT0s8UJcF8pJv6
 fXHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0bOpQmMFtiUKPHcvlbyeQOtht3k3rBjNetw/Zu+8NMeS+DNXqr96ZNsYmGP3QUxeLM0FNPkDgFA==@nongnu.org
X-Gm-Message-State: AOJu0YyCnXGjQ/0Bo3W32ICHe1e/NNdj1BDxYhXCCtH77L2ybPrvpQvh
 iMwZrhWjjme4+BFOpfrzsbJlDRdazYvMSCz/pC97QhXwUPHbpCjiykTAQpXnbzHBPuXQE92X8Rh
 ksTV1ydBDb2bHiZ9yzOoe7zM+K10FPqd0cKhmS+7jAw==
X-Gm-Gg: AY/fxX4VayVSMcvwghGZrEn+jXVkglFD7099jTsXf+svfF41c5t+pRIQ2Fwf+zDCGAS
 VtoUVSZBSi96qLZp3onSzGu+kRzS6/cO2Pt6gL1/gAaOk6/2Lvr15mQGVn2tWtsj2wuzGCUQKro
 tD56lfbfabl7/F+rG9lDLy8Y/y6r9pKmXoagQ8Yx1Nh4wfiTvhWsMThzR8CTNWbHBqxqeMWysVu
 VXZKCGmJ2qekYyDtFRQ4Q4coF8AxYoaQMGAUzXVsdDgJslMiwPl4pMgc907HeZLtZL1ukpYRhgr
 tfrXb0CFmrjqDmlyLa9FP3A=
X-Received: by 2002:a05:690e:b4e:b0:644:60d9:7528 with SMTP id
 956f58d0204a3-64903b61a9fmr3443195d50.90.1768473865834; Thu, 15 Jan 2026
 02:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20260113135941.3361163-1-alex.bennee@linaro.org>
 <770e5e68-f8a9-4321-821a-aa0930db0d95@kaod.org>
In-Reply-To: <770e5e68-f8a9-4321-821a-aa0930db0d95@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jan 2026 10:44:13 +0000
X-Gm-Features: AZwV_QjsnUeWMFgniBYf7EQ0VimJM_8yHx93jA4QjIPKMzD0weFUTQMmZCXVe20
Message-ID: <CAFEAcA9dz5BPdpB+2wukcJ=jgGCwkCTa7Y=FA4s+qzymg7gHRg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/functional: migrate aspeed_rainier image
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 13 Jan 2026 at 16:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 1/13/26 14:59, Alex Benn=C3=A9e wrote:
> > Cedric has a host for the file which allows us to keep the name.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: C=C3=A9dric Le Goater <clg@kaod.org>
> >
> > ---
> > v2
> >    - host at kaod instead to keep filename
> > ---
> >   tests/functional/arm/test_aspeed_rainier.py | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)

Applied to target-arm.next, thanks.

I've added a cc:stable tag since the old URL will be going
away shortly.

-- PMM

