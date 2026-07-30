Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13705C55165
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Jul 2026 12:42:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpQ4z-0003jB-Cu; Thu, 30 Jul 2026 08:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpQ4v-0003iZ-Kr
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 08:41:38 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpQ4r-0005i7-O3
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 08:41:36 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-81eff3ddba4so31434317b3.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 05:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785415292; cv=none;
 d=google.com; s=arc-20260327;
 b=FobBE+2sr2UrEvxm1yP5joVjPyuHoXAimmn/bF33dgnLUcbsQvrYigfcz8mRto2Y01
 bwNAi5msO1pcrdpTjIr4UAhIqM8m0Tgsxvhjx2LvaLxiuo7E8jqa+AAG6mTpwt76ch1F
 CBDjIIMQzyhQy+gD2zjgRjpuAHHvpbw9WIiGhJIv8R3GhCsXobPXCG50dr6N9AVYpa2i
 DauROtezbD0dFjEWkDY9cMqGHesc49w9CvbpoF2swcPxT+lItxm79iU1S997aPVWco3m
 7W2nzB/JSK29OFmzX0j/TVBVfbibHsOLRxTCyi4dgmoq2Hw96/LV+j9lLaUVl7uTBGKe
 cVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=vKRFXhqiLoxOpqsybCQzTM2w4BGpVQWtRIrpO0PPqLY=;
 fh=MY+RTGlDZBw1hjx9sCas5mVeVTtr+VfM/WJHDpsZ79Q=;
 b=PeBgsqqVaRWQ7K8rrfnnJ0NgooUnh+tdcPG8Bi2VWxmc1/JYSE8qGeoQ7orZw468vM
 Gnlz6cR7GtM/tcCq4+4Rmw3BE+mtUjq9WeNhjp/uQWXGfGEiWaRUdoihz8dVA1m2bX7T
 YDvw/Whv/3F7aUrosxbVDizSN8XT8R5C1OniHKRqqWiVK9fUZZLQUgtGNl95vKO3Q5Db
 RixKB8NNY8S3CKi22r192BfHbDQY9bcQY6p4bSIPoWUeCOaQuIvzX5jIc+1iNRVlQHJv
 T+Q1kgwjEUpI3egWB730AqUdJbdTlPOlIfzXRGldYUqVGL1ZmMjdtHv0pP437+jPw7oR
 NZUA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785415292; x=1786020092; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=vKRFXhqiLoxOpqsybCQzTM2w4BGpVQWtRIrpO0PPqLY=;
 b=XimoECa4cAmoPj+IBWREtVYr5NjJXm45Hv0wDSZyCHSv5Pyx0ZSCMRMGih+a/VbeQ4
 L71cBClwmrsKd7FV+cylfXb7qds45bpadWkmat/rtMhxnQViaRZ6CZs3mxkEKr2lqiwl
 a5EfKpsFLx6NYtCM5Nf2HDkuxFs16LJGmeo1BDcBnpIBF8ghhlOpKepB6+/Jvw0jwclE
 QcAF4OFd5xjO+UgOm5DA87BXkGsVvP6iLfBUFyixuDATF+mc1ZAjtNMHfJDxFNLybPtC
 ZJddI5PSwmCgyacPMoe0mKuVFnqCrUse9IX19s9wYMYYWUQdOCfRlHHTB1MrnFxyRUfH
 NmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785415292; x=1786020092;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=vKRFXhqiLoxOpqsybCQzTM2w4BGpVQWtRIrpO0PPqLY=;
 b=DfeNyG+XWb+yuvUZp8RmJJ0iNPQ4fy4qp/zo4OLlRV8h7eqcuJUTu2ideVPKErMLJi
 Y1ZOd42vEye+IBUnY8GBy6tXsQBaecytwMrdE9LeCrEVSNpwA1UGNY8NBeNh3WB8Ak6F
 7Vp/U5i2/ob2RzcFkxEkZImvaK081ttBl7kZw/MzTvG6eUJOW+Su1MY9Gj/7sTJh48pz
 dI/NICkDNBy2aDhHFixAq1iStt8Dud7vYamBUC1OsR9GJt6lg0vXGynev5kdu3P9+4QW
 GmA1KDdAz/RN4td/v7QNE/FrI+70+mA8cF+vFu+WTuveJUWiqhadw9Zz5wDI/FLSAgR6
 G/7w==
X-Gm-Message-State: AOJu0YzfcKtE6RxJInFM2/ezEs7qU8GgZoktuoLSRnOdv5gqbkwhkvzI
 JlPf7FjtaVvRHmQnsVApGeEez+X3hPdhavNWtfn4oKzLdlvPmuCakgDyzjSI0arWNc+LueW0sRy
 01j3BqpQTEgi2yQKsSCOm/isqiumeRUn8FStTLxZZXENaIOmdh97Ks/g=
X-Gm-Gg: AR+sD104ALEg5cWZSJvLqD0+/+mpMzx2PYGWsKBfTPYzDM+RLVbNZn3GEQQfACtOPT1
 hpTYSKEPCsCNVvHCC8Xlv/Pu4jscrQxhy8oB4jw4T1PBHTZvMSIFc9beXwsD3ukKI34HRR+tp91
 cYCYepNPJfp9SRd6hBA0+Sze+1u7ajrftqhUpg+ykwaqep2ifIKLi2QpBzyeELiy/q/cgxEv7UV
 mIrQ3vVRtUJvRcg9u1UrhzckzgjQ1Jo75Sm+CdRA1Lft+QVxxsmy/l75dK3cXJRWzC5nF8QZN4u
 y/IYcWYsteoxl/WELC8bA8t9Uv/phOw+8Tg5f1+7lMpAldFJV3Nz1Y9VNbdNtA+sb72xvu1VDbM
 tG7QvRNpmjwXUjdEirz+XZXOXxe6h/4mSBxi4yOo=
X-Received: by 2002:a05:690c:6e90:b0:808:f9bb:3832 with SMTP id
 00721157ae682-81fc1e626e0mr484807b3.22.1785415292150; Thu, 30 Jul 2026
 05:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260729231325.3808993-1-titusr@google.com>
 <20260729231325.3808993-8-titusr@google.com>
In-Reply-To: <20260729231325.3808993-8-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2026 13:41:20 +0100
X-Gm-Features: AUfX_mxrkzOk3JN6XQCLNv1wBzAX5lhV4CsRs_nYeTZI5fOptDlcH_NkbouaO4A
Message-ID: <CAFEAcA84j_n6MTAmwOkvQwNCq4TEL_zyGmSUc_6b=8i2VykTBA@mail.gmail.com>
Subject: Re: [PATCH 7/8] hw/sensor: adm1266: expose vout_mode over QMP
To: Titus Rwantare <titusr@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com, 
 fanjason@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FUZZY_MILLION=0.1,
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

On Thu, 30 Jul 2026 at 00:13, Titus Rwantare <titusr@google.com> wrote:
>
> The vout_mode registers can now be adjusted to allow a wider value range
> in read_vout.
> vout_mode is per pmbus page, therefore vout_mode[n] will affect
> read_vout[n].
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  hw/sensor/adm1266.c        |  8 ++++++++
>  tests/qtest/adm1266-test.c | 35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>
> diff --git a/hw/sensor/adm1266.c b/hw/sensor/adm1266.c
> index 80960dc1c4..1464307971 100644
> --- a/hw/sensor/adm1266.c
> +++ b/hw/sensor/adm1266.c
> @@ -271,6 +271,8 @@ static void adm1266_get(Object *obj, Visitor *v, const char *name, void *opaque,
>          sscanf(name, "vout[%u]", &index);
>          mode = (PMBusVoutMode *)&pmdev->pages[index].vout_mode;
>          value = pmbus_linear_mode2milliunits(*(uint16_t *)opaque, mode->exp);
> +    } else if (strncmp(name, "vout_mode", 9) == 0) {
> +        value = *(uint8_t *)opaque;
>      } else {
>          value = *(uint16_t *)opaque;
>      }
> @@ -293,6 +295,8 @@ static void adm1266_set(Object *obj, Visitor *v, const char *name, void *opaque,
>          sscanf(name, "vout[%u]", &index);
>          mode = (PMBusVoutMode *)&pmdev->pages[index].vout_mode;
>          *internal = pmbus_milliunits2linear_mode(value, mode->exp);
> +    } else if (strncmp(name, "vout_mode", 9) == 0) {
> +        *(uint8_t *)opaque = value;
>      } else {
>          *internal = value;
>      }

> @@ -321,6 +325,10 @@ static void adm1266_init(Object *obj)
>          object_property_add(obj, "vout[*]", "uint32",
>                              adm1266_get,
>                              adm1266_set, NULL, &pmdev->pages[i].read_vout);
> +
> +        object_property_add(obj, "vout_mode[*]", "uint32",
> +                            adm1266_get,
> +                            adm1266_set, NULL, &pmdev->pages[i].vout_mode);
>      }
>  }


Better to give the vout_mode[] property its own get/set functions
rather than using the existing ones and then having to figure
out which property is being accessed by using string comparisons.


> +static void test_vout_mode_qmp(void *obj, void *data,
> +                                    QGuestAllocator *alloc)
> +{
> +    uint16_t i2c_value, value, expected;
> +    QI2CDevice *i2cdev = (QI2CDevice *)obj;
> +    ADM1266VoutMode m;
> +    char *path;
> +
> +    /* set a different exponent per page and a different value */
> +    for (int i = 0; i < ADM1266_NUM_PAGES; i++) {
> +        expected = 1000 * (i * 2);
> +        m.mode.exp = i - 14;
> +        path = g_strdup_printf("vout_mode[%d]", i);
> +        qmp_adm1266_set(TEST_ID, path, m.raw);
> +        path = g_strdup_printf("vout[%d]", i);
> +        qmp_adm1266_set(TEST_ID, path, expected);

More string leaks in these test functions.

thanks
-- PMM

