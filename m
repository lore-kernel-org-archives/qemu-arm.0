Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39D1C53219
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 09:43:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woHrX-00056S-GH; Mon, 27 Jul 2026 05:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woHrU-00055a-6N
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 05:43:04 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woHrS-0004G1-QN
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 05:43:03 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-66825847b2cso2320271d50.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 02:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785145381; cv=none;
 d=google.com; s=arc-20260327;
 b=QbucZMwipLkdTuFweZFhTh7aC+y1YevIkN1B6tTwV5BGIahPu4VKTVQGetc3Nl3rwM
 vCX69X1GS8j8q+KIqH7lRXpqv/foEHR9aWF/DPTCaSzq/0IATWJNIvpX9tlnIwG0Malr
 tFog5p6a4Fp8bZwoeEhCeQa2/CmzgUktpATRM0BddmfmwVuRNYs4L3aTeKAYG/j/janz
 alCQzOdhxT+AmLXl68+Oub8NPfy9F0HUqwPOvVHuB/P2VIVF9haJeAy6iR+At3vZmBdH
 5ciZNq8RZ0dKOgUmMACvk3aodJZdyP65V+LLcP6oSAgQEHBSmMQSkCbfB4Uc09XYIg6n
 wyuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rNC7jCSwV007iM9m2mqhwvJOl1JGiDv5uBvtV3Jzpb0=;
 fh=oPvCPi6n6cSJoik5QzLl+V3OtaDxfWNrR/eAgZMqfc8=;
 b=fR8YuD5/vJJkilBayhOdj04MIIahxqdHQXVC1/IUeBmBo9ISws9GLT0YT1eve4bMGj
 d2gLMTFcfcbrZNxxwwv2pPin8W7K039yQ7fkawME1eRUkE4nVJuRGGCSgWgD8eAJGkYg
 I0ggNAARNU/ICKhRSEzyjVc03yqWtijyn6HNRi5msdaaY3pnkpW32gsdyo3wirFMpyDD
 RUsYGtLgt6Dn1f5782oZONnqo6vV5dRPfmwS/NBbGl+FrrXnBHHe5cG4+HW/FEhK1LeO
 TdrkZqz9iwnIRPGOXCb1zX7QgFm3aSSZWJM1Sz777m9TaW6nFq36bomUE9XNUbuenL3i
 RQng==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785145381; x=1785750181; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=rNC7jCSwV007iM9m2mqhwvJOl1JGiDv5uBvtV3Jzpb0=;
 b=ieBzf6AZb72HrRuyU5c3L8xIO09+RRHHvoM0z05zUGzuHagDJJZtGL9kNZNoBi6yEJ
 uwS8S0dIK2vZ96FvZwxTt2Hcy0s2jWndYx+gmNQgKvJAv5rl8xki6grc4lHLR0ujRkuo
 VlBTjxhUjTeTL5gplh5BYsoku6XV/tt6kY7cwCu2SuL7Rs0X18Vme/AXqswtpvu48Mh4
 INFu3zlOoWj5nfDg7Vo39z3i3CF7LlZaWWrws+h8YtqRKRHNbhehYw6TsP6focE1/fTZ
 uLsHF5fNa9FYoB2cLkMMDQQ6BoQNGbVs0yi/QCVq4M6RdT7yXi0xlS12tRD3gMQwP70G
 oWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785145381; x=1785750181;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=rNC7jCSwV007iM9m2mqhwvJOl1JGiDv5uBvtV3Jzpb0=;
 b=oNnGrQXkVM7uGGenM7Oy4pLterA911cAKE9VRNIU6ba+ahkSTOqzj5kdc3oXfd+/yZ
 TsYTApPTifHhyRYffqx8Ls/qJqByj1Kp3A9f1VSFNiYrV+crt0DRE6YC9y90Vbin2I4q
 Gdf+egJ/PMAEWa6n3w5xJ3YCqgg8t8g4Zqz5C+If5bGUp7TbTsGBOPOKYTl+pvMB6Wcd
 PgDIhumF2l2TUSsEnXfj3uLBcyAsWJ9TLGF521hN5CWoKbnPygpcP/vLmIpMiXOPMOO0
 rNke8QV7yvVsky1HSsFj2mFLgHZPTusH5J9f7qrtaYPvhBECm/P35eK0B8F7CdEVuWhv
 76ZA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoIOZyGXXuCZmo/GTIferNg1SQcJPU1W0u81KYJBPdFmGgOgru9Ri9kA8PzBJOPP2USZ8XBYs6JPw==@nongnu.org
X-Gm-Message-State: AOJu0Yxeubay3jf8BPsYvN/R3JG1pcaCqhYDBGkmSn9ZPokQc3oOsBU0
 s8Obx9A0y6J2etjUfoNnNsx4Tw9YJW6ublKlJVYdeyHr9GF2bRDCxLLGpx0WTaPnle7E8CeMwz/
 E2Kl2rUKpKn9ivqzNqLFPd4OwFDBEv+KL375xgL/Ucg==
X-Gm-Gg: AR+sD10aBlR8RYmbFdVTz1cQMEJ38rYAxz+lZQqsBNVAHEcWRWA+jj8H5JCWg3zPwOk
 O2BcH51nI9Hk0Fh+2RW8w6r/V1U55d1O53kOb2OEPYqJdG5bguyOEo/3theJ+4YviNrAoh842cv
 nmbEAlDO8IHaQ34ngIiLybHtSTYjBZthoqP5EUyhYyF5p5HyffZw981UEtYjEQO/yHUxsRZtsOH
 +IB2uv0cYlWGZswt/xEDod1rfoDrRY7/9pGvusqf654lk+4WMRpgMSlQ2+CRFNNssqLS/8cNCry
 vAPZxTWtAdFWA32lEHr7QG5MO+3aqm1S8TUWEqhYZnBw00aHCN/pGnsMV0JWO/IEn5GikIVBJjR
 W20WkHvtGZXBYegtuAAZZuaEueJ20vg==
X-Received: by 2002:a05:690c:23c3:b0:80d:66b2:852 with SMTP id
 00721157ae682-81f69e3c5d1mr22464207b3.44.1785145381144; Mon, 27 Jul 2026
 02:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260614222131.5795-1-imaginos32@gmail.com>
 <CAFEAcA-GGP6aALn4Az5By31q1R3d75Mm+p_YXN0y=tO3GxDYrg@mail.gmail.com>
 <CAFEAcA8zLzVLzTq-EJQ9+OpxytMdPuFkUbOF7xjmY0JrhPhYhA@mail.gmail.com>
 <CAMvPwGpaYiE0uwY6oVJjxdoVwGf8Mxr40o_m+PAhdZqqcShf1g@mail.gmail.com>
In-Reply-To: <CAMvPwGpaYiE0uwY6oVJjxdoVwGf8Mxr40o_m+PAhdZqqcShf1g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2026 10:42:49 +0100
X-Gm-Features: AUfX_mxx67fGGJifqxDU2DvcQ166qe0p3xyKUN5CLsJQysQ49Xr6Ir4PeSQiyN8
Message-ID: <CAFEAcA9AMaK0CNQkWur4Cg=Uwx0RDBw87m1fkprD8_XH4pEiUw@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c: pmbus: NUL-terminate strings received via block
 write
To: Titus Rwantare <titusr@google.com>
Cc: imaginos <imaginos32@gmail.com>, qemu-devel@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Tue, 7 Jul 2026 at 00:01, Titus Rwantare <titusr@google.com> wrote:
>
> The adm1266 has a strange access pattern for the MFR_* registers, I'm
> creating a series with the patch that fixes it, but a quick summary:
> the data written to the register is the length of the data to be read
> back, the actual string contents are read only.
>
> I'm sending the patches that update SMBus and the adm1266 up.

Did you send those adm1266 patches? I can't find them on the list.

thanks
-- PMM

