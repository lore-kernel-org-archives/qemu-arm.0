Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41B1C9EC97
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 15:06:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfJKI-00008v-8B; Mon, 12 Jan 2026 09:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfJK3-00084I-W3
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:55:15 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfJK1-0001rU-LQ
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:55:11 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-7927541abfaso16216317b3.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768229708; x=1768834508; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=66RAiGQHA8GMWTjt6n8PWtrv5ZOH1p/ZRrn2xlZl6Bw=;
 b=ekQz8qnPHTaMhtJvfOyu3q4HdbgrxniLBVZbdb/wpG08QCcZuTfpmpV27aBBqqsDoV
 vfSy75gf4L5uFUAKuG1f1HLFJpFbfFCtxOK9XLVr/6xFAcRQ7Hba1xYZGkGYv2j8iMrY
 l1l1BT7fjLMmWf9SoJbfLg8HSooWl7ROwFsoHsyGU0sEcvi7TSzgRkbXQrk44RnecO4M
 lGyLvx3pXFelAdouGzF1ZcXMB5cdoFlKtUPtACLzgibNY9dsx/2LVyUItJAZ8na1Scr2
 0TMqHF+KPqvcZ0j2xdAJBBVwsokK5thMKiLrOQIx1DlTfGqHK4cFnVhhobuoLkDBqsVW
 YVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768229708; x=1768834508;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=66RAiGQHA8GMWTjt6n8PWtrv5ZOH1p/ZRrn2xlZl6Bw=;
 b=wlo1AVucWmVBBwQ0WzYhQY3YWuPqqCBhDspdVEE51qlsvkx1IYyJl40nM9sae3F3/0
 kqwwsc4pX9DEUzT0Ec5PLX6F8Q3Qz6noaHHXfbShKDVBTVaRtGhfmedWWP/LkCImFirh
 uLKv1Y3g5R5lTPuPVna0NalVMwn3tXdt1d1vwWrGDF2CgyunFbzYtN8mKX1/RtRpmqBQ
 XL+hUOsYrzGs6RBIL0p2trbkTFuQoQIhnjAP/J0MoWIGXGiKF/bsw9smeMzcl1RPhXJh
 Aacidfqb0kK5bnDVtGrnaUEec2BvaJF5zfPUbqA0r5sOtP18ErP5IKw0R4BQd3+hF2Xm
 t64Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0eJ45MT0j9eWE0xq6IG2t1SI4fjbWCdQrmg0VtXnWx8qSJXuoscJvLUfNJzmjYHrhhzEutjHWoA==@nongnu.org
X-Gm-Message-State: AOJu0YxgT/N5xpfRL43jLcxAqHKiH2VwTLpYadMIK9KZDl8FOTfO465e
 aRUcFJHUOKAPPfc2u2g+RTwtngZXfGeDZjksbZCI2ZIIMpefDbWyQsdg6RCJeHemJoMjoqMGrVD
 YLAt38racE7fZxbN46CiIThX7y+Ql2aReZKK/U3XLxT/TeOTZKvO1rIs=
X-Gm-Gg: AY/fxX6p67JRVNUACfiH3IZkVa+7UABD6TrG57j1xJCXUQej75xGITs/bnyXIvxtLYc
 fJP5y8ZJBTrJ2H/M13rk3cyTY46EXpUM3CjMkBLZ5DE4sd0KE+easdP86GxiGEjh1JNxR1U+QjX
 OsyTlGi0Pr6dSxBIp0D2PWc+D4fEw5yR0oOrj3lFE+k68JpdxJ8eM6SftT0nU8MTIY+TtBa1K/k
 UEqWcseAHGbotDAwTaBXBPkPo1M437fL49xYcGBBDYrNXnN2OX46m97QFMOVQq+6JEtn80dTzBC
 g7sR+NipcIzfOZbnYWheyHQ=
X-Google-Smtp-Source: AGHT+IGn7LHteegYfZ9t2JQ9O1k8UAZYFlYopwwU+5PZ561ZBu0T8DbLaSyqlLUuDXGhnqAlVNd1+1peAp7HJI/9pvE=
X-Received: by 2002:a05:690e:1202:b0:645:54a9:11b6 with SMTP id
 956f58d0204a3-64716c67c2bmr15459992d50.52.1768229708199; Mon, 12 Jan 2026
 06:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20251215170548.2594651-1-alex.bennee@linaro.org>
In-Reply-To: <20251215170548.2594651-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jan 2026 14:54:56 +0000
X-Gm-Features: AZwV_QjIMH7s6AS77QZdjwUlBptzLO-GUgV1qW68GeZpcCSFsWs5YfeSNYt-sUA
Message-ID: <CAFEAcA_b1=OFe1PnhhV0CPo=iHB2-gMCXONi0LUTTzHmm8jJJg@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/misc: make the tz-ppc-port names more useful
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Jim MacArthur <jim.macarthur@linaro.org>, 
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 15 Dec 2025 at 17:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The TrustZone peripheral protection controller (tz-ppc) sits between
> peripherals and the main system. However this results in "info mtree"
> looking at bit confusing, especially as the sequence numbers can
> overlap and miss steps:
>
>       0000000000000000-ffffffffffffffff (prio -2, i/o): system
>         0000000000000000-00000000003fffff (prio 0, i/o): tz-mpc-upstream
>         0000000000400000-00000000007fffff (prio 0, i/o): alias ssram-0-al=
ias @tz-mpc-upstream 0000000000000000-00000000003fffff
>         0000000028000000-00000000281fffff (prio 0, i/o): tz-mpc-upstream
>         0000000028200000-00000000283fffff (prio 0, i/o): tz-mpc-upstream
>         0000000040080000-0000000040080fff (prio 0, i/o): iotkit-secctl-ns=
-regs
>         0000000040100000-0000000040100fff (prio 0, i/o): tz-ppc-port[1]
>         0000000040101000-0000000040101fff (prio 0, i/o): tz-ppc-port[2]
>         0000000040102000-0000000040102fff (prio 0, i/o): tz-ppc-port[3]
>         0000000040103000-0000000040103fff (prio 0, i/o): tz-ppc-port[4]
>         0000000040110000-0000000040110fff (prio 0, i/o): tz-ppc-port[0]
>         0000000040111000-0000000040111fff (prio 0, i/o): tz-ppc-port[1]

> So as a quality of life feature lets expose the name of the underlying
> region so we get something more useful:
>
>     0000000000000000-ffffffffffffffff (prio -2, i/o): system
>       0000000000000000-00000000003fffff (prio 0, i/o): tz-mpc-upstream
>       0000000000400000-00000000007fffff (prio 0, i/o): alias ssram-0-alia=
s @tz-mpc-upstream 0000000000000000-00000000003fffff
>       0000000028000000-00000000281fffff (prio 0, i/o): tz-mpc-upstream
>       0000000028200000-00000000283fffff (prio 0, i/o): tz-mpc-upstream
>       0000000040080000-0000000040080fff (prio 0, i/o): iotkit-secctl-ns-r=
egs
>       0000000040100000-0000000040100fff (prio 0, i/o): tz-ppc-port[gpio0]
>       0000000040101000-0000000040101fff (prio 0, i/o): tz-ppc-port[gpio1]
>       0000000040102000-0000000040102fff (prio 0, i/o): tz-ppc-port[gpio2]
>       0000000040103000-0000000040103fff (prio 0, i/o): tz-ppc-port[gpio3]

Maybe we should print both the port number and the downstream device,
so eg tz-ppc-port[1:gpio0], etc ? Especially for the uart ports
this would disambiguate:

>       0000000040200000-0000000040200fff (prio 0, i/o): tz-ppc-port[uart]
>       0000000040201000-0000000040201fff (prio 0, i/o): tz-ppc-port[uart]
>       0000000040202000-0000000040202fff (prio 0, i/o): tz-ppc-port[uart]
>       0000000040203000-0000000040203fff (prio 0, i/o): tz-ppc-port[uart]
>       0000000040204000-0000000040204fff (prio 0, i/o): tz-ppc-port[uart]

(and if you are actually programming the thing then knowing which port is
which might be helpful).

The other thing that is confusing in this output is that there are
multiple TYPE_TZ_PPC devices in this system, but we don't have
any indication of that in the output. (This is why the port numbers
repeat: port 1 on one TZ_PPC is different from port 1 on a different
TZ_PPC.) I was going to suggest that we could make "info mtree"
print the owner of the MR, but it looks like we already have
that, we just don't document it: there's an "owner=3D' suboption
that can be set to true...

thanks
-- PMM

