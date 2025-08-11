Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A58EC87FD2
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 10:23:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulPfw-0002T5-VM; Mon, 11 Aug 2025 06:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ulPfu-0002Sg-QY
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 06:22:42 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ulPfs-0001SY-8Z
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 06:22:42 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-7180bb37846so38821857b3.3
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 03:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754907756; x=1755512556; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6f4O++bdhNaX+3I7t67f56Mg5sH0aioF3B6sOmbjKAg=;
 b=YyYvXw5QkJTm3YtaKFmdFUXH/gSNYTY74ZpThVGgeLRsoT6DBrZuHhAFU5BPJmMu7x
 OpeK5EYD7dWuZCz8ilH7I4mWAYpI9iOIHuQiO2FIlBJ/za5eV00siqvxKg2SxpDo6fFq
 7ylndMXVXrg08SePa/JICgPjUUPqInP5fUsAsADMQNrbNqtJezZs8ZHUr9NpGnJXl0uw
 UuZJzrv1GwhkAMLHAWm8OSbfOzuYGVuyjw2OeGkHUTw03+jDkJg3CP61Ap+wMBgyT3WM
 wEdJH13r2QAyCybojHCsm0/WEoEGvj5BJtFpfpWWFPtPnVinV6lxmdfpWOCJg36MMp+e
 JV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754907756; x=1755512556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6f4O++bdhNaX+3I7t67f56Mg5sH0aioF3B6sOmbjKAg=;
 b=Ra4YyOL9VM8tCFJzYoPNM/TtqK3t9wyFesgDHU/UWODKr18uJL2TlnlC6wLpP42dcQ
 lse4oqfXIA3tPuv1aFbFsY83nqcB4cGzb+LKlWkA1r3/asFwWHlcVkNBObkFCF6GiQHB
 Ld2vr3FoVQD45aIzihmu7NY9uX6mcZ15QXkgNnmvnEAfpWggkOBs0ZvbulbLSuSAIyt8
 IlMkWsvr+S5jlAw+bX3RWThmRpUzE2dlC6lQFOBLTQ2VsESGju0aR6SoC/6GrYuSLP0p
 Panrl21cRjQ7ecKl+QpcPoRzDW5N1Vwlazs3+uGThs2jj2SROQ8/ZwWZzxZaBr2oNghZ
 uxFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUacw6AM1jiBGgJmsh97KJiHf7wqD1+uplaJGrE06dKQZmkFf8R+Oi51MAOSzIWXDTqIfi016rg+A==@nongnu.org
X-Gm-Message-State: AOJu0YxxARjd0ULb7LuQtvmFdfv9caXuvMBjGLrAM3ZZu8o8JeewCz9x
 W/9KSctMMPc7F1WyU6QNRgvIUdr0B1dogdSUcvXsufC4Gla4n6g9jgBZnXtO/FHOX8nQr1+hOVp
 EVhARwGwCLsoU9IbCPMZv+Kaoj7IcbZsnDO4oGyi2aQ==
X-Gm-Gg: ASbGncsT0zXIXSSp1mswKfCa7T4G/CVMHyHbUiy+Cxw4j+B1m63NX4Z/lN8y5KtpNkQ
 MJnlTfH5wCExKP4RdsjLvVubIfgq6IgwWUGUVFKiCPub+LMif5Hk/7M4OGbtu1QYB9ksd7UnUHY
 4QlzoZ7vRwAJolLVQ/k7z7IY3fbwEogMVuJkf+ppg0ZmOHz0TSwNmmv/fOwBQ1PZNZRKbkXIkVQ
 jYHkYZld4it7KE1ygI=
X-Google-Smtp-Source: AGHT+IHu4GXC7zQe93ZWav5nevnQdkWlwf12FpNUuiV0XoDPSsNg7hzIwomIhfTW9mL4+BBX6Y26RGpERulLUsXo7a0=
X-Received: by 2002:a05:690c:4447:b0:710:f39f:4d3f with SMTP id
 00721157ae682-71bf0ce406fmr135840277b3.5.1754907756223; Mon, 11 Aug 2025
 03:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250728134114.77545-1-mohamed@unpredictable.fr>
 <20250728134114.77545-7-mohamed@unpredictable.fr>
 <d2e93df6-bbb4-427b-828e-b6f5466ae2be@linaro.org>
 <5CB6CE7B-B122-4BE1-B031-EF44D0A79B63@ynddal.dk>
In-Reply-To: <5CB6CE7B-B122-4BE1-B031-EF44D0A79B63@ynddal.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Aug 2025 11:22:24 +0100
X-Gm-Features: Ac12FXxi0Fiwag_QMrwzPQcSuze4AoGumzDiXdJzEFaySzVnqiK-kfUFyihkz6A
Message-ID: <CAFEAcA-TKwH2pnvK8YcwXnZ56eX-dOpzb8Q9e9HN8BoebjJ+WA@mail.gmail.com>
Subject: Re: [PATCH v5 06/13] target/arm: hvf: pass through CNTHCTL_EL2 and
 MDCCINT_EL1
To: Mads Ynddal <mads@ynddal.dk>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, 
 Alexander Graf <agraf@csgraf.de>, Roman Bolshakov <rbolshakov@ddn.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Cameron Esfahani <dirty@apple.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Mon, 11 Aug 2025 at 11:08, Mads Ynddal <mads@ynddal.dk> wrote:
>
>
> > We'd like to remove the assert_hvf_ok() calls, so adding more isn't
> > really helping. Anyhow,
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> What is the preferred method going forward?
>
> Apple designed the HV API to be able to fail at every function, and it's
> rarely something that can be recovered from.
>
> In [PATCH v4 04/15] of this series, we saw an issue that was hidden
> because the return code was not properly checked (not calling from the
> owning thread). Previously, I submitted a patch (d5bd8d8267) for the
> same issue, because Apple had changed a function's behavior. This was
> caught by an assert_hvf_ok.
>
> I agree with you, that generally adding asserts is a bad design, but at
> the same time, HV is designed in a way, that the code would be littered
> with checks otherwise.

This suggestion was I think mine, and I think partly I was
misled by the name of assert_hvf_ok(), because in fact it
isn't an assert(). (assert() should be specifically "if we
hit this this is a bug in QEMU", and "hvf returned an error"
is generally not that. It does call abort(), though, which
isn't much better.)

But also I think the existence of assert_hvf_ok() encourages
it to be used in cases where actually we should be doing
something more sensible with an error return. For instance,
in hvf_accel_init() if we can't init HVF then we should
return an error code to the caller, which might fall back
to the TCG accelerator -- but instead we have an assert_hvf_ok(),
so fallback won't work because we'll just bomb out.

The KVM API is also one where any API call (ioctl) can return an
error, but we don't generally assert() that they succeeded, except
in a few cases of "given where we are, for this to fail would
mean the kernel was broken". Instead we propagate error values
upwards when the function has a mechanism to do that,
and where appropriate we print an error message that's
hopefully reasonably comprehensible to the user and exit.

-- PMM

