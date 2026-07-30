Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936A7C55160
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Jul 2026 12:39:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpQ2O-0002Ze-BF; Thu, 30 Jul 2026 08:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpQ2M-0002Z9-O3
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 08:38:58 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpQ2L-0004Uj-3x
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 08:38:58 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-6688dfaed31so2665165d50.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 05:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785415136; cv=none;
 d=google.com; s=arc-20260327;
 b=FzTNrl+w7cqkwvoRXCMLjaMHK1C+A9p5Dl1UEdyUpdLRBZ9271yWRK20T/lo0sGnkB
 4N4cNqr88pkpSJ1q4Z6OahACIQ78C27hJDn2RbEtjHs6k+3c5nkBfck9WHIoDnsMs5Ur
 K5cHnGSGaKDu0fnYt5ocIQsfdtMnq7XWMUvvxSd8fOmGGNTjSvvwZxtxUFKqKoPItULH
 oCv4mPO67fW7mT/XswGVQGgh28gLv2lvpFb3wkdbFk0sMhgFWySRPAEtEkQVtBvAk4mL
 ibq/5jdhtt8LL8a6y8STqkbKuQNnYLE4Z1NSghEeWRGWVg/7C7cmFPVbGeerAyeo9g7a
 yhfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gN8D8F31FDpxGH3YKhqW0xmPQi2EEj1RpT3xmV3JvTM=;
 fh=MY+RTGlDZBw1hjx9sCas5mVeVTtr+VfM/WJHDpsZ79Q=;
 b=nI8a47HDVBRzHhDbjOp1u4MftmBJAKPRtJAL3iAAvab0OQnIuUxO/oqeD4dND9EzT5
 j1IpFDbzdgBXJgmlKKhdaQnx+zGtwAC8mqc42YXt5S/e+cnIuVvmMAd2D8egad2qHMlL
 4wDNIAxLj78lo87cYrUEUe/jUD/6Vs4N+HZJiNxNPcO6pHWZtlL+7vcyXZHv3ev5DmiD
 DnKM/qmjxfkp1xQHZ2HuQAbuofcAOwwGQmfW0YyOoFLUiDCKj+S1tU4h+jUSf7pn9lrR
 Ng/Jx5MZhgzgISsGqYLyq2oLhpDeYC1Fp6eiDL0iceuf7WwcB8NVYv8mmVm8JdOq0PSc
 qRmw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785415136; x=1786019936; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=gN8D8F31FDpxGH3YKhqW0xmPQi2EEj1RpT3xmV3JvTM=;
 b=AxY/jdCH4Y+xxCWcON64afzdgI84JBLoE8UaXGEjCLEQ6RcBbj9ZlqKdqPhzQNfNqK
 WoijcdWU7DBlu61ELpTI6xVPcVd70HlGa4+NgRKZeDFqODXb6kFYmjY4KwFc905MHPpu
 crB61FsXsYVAIjTHO5FlDf8SvwKsutzrro8JLOk4KSX1kG81abEhD5rRCqlYOrOequn/
 qJ8jYLrpvhcMmWExaI9cQKZyZbW05McyIJjIJB7CrUAOYkBpFa1M/F2QK6bTvRtI+PZD
 tTMRMsLLobDDaGGGKI/Q4css7WNYPtFoJPGnVhBXT1ISYhgilbULp0BES5JISVpx6mw9
 m/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785415136; x=1786019936;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=gN8D8F31FDpxGH3YKhqW0xmPQi2EEj1RpT3xmV3JvTM=;
 b=g35jiF5lpTxTV3PGsTUkE+O7/O+rh0O8Vw6WbFs2Gn+9yXRhg9h4BK6U+3IctjrQ1p
 ewmnU4EjdRIyGmhtVnfqI2Ic1+LFVS7Rr/BQbeJlgFSxhE/bqW+f6kt/d0TqIVI/aGi3
 j+txeo9MU4Y51mTTYjNUhCyOZXTs25gCOr7ojKOpfRexF8E17Xn+sT/LsyEIsi7AHid7
 rNPy2E+XOfmIBkvfPPq7+UYZ1AFhTwVWCreqifFnkzu+17T0gM3l1ushLQ28XR7Zaif+
 HiHVC/S0YVMjty8M2vpYAVFcQHWlEvs1NrVJPktIfGpYDbXkAirLhEZ92Fd05e5fDmr0
 eZeQ==
X-Gm-Message-State: AOJu0Yx2b8Z1qInYMdyPAidpyjmA7zYyEDCbEI7Yf2umqYB6qQj/i3ML
 lgvyyBa1Eywn3dunka5DV0hqAI/6k8qUIkMedq/WnMg2ox9f0oqczqIKlIdBJqFbA2aFNtCzp3A
 CVeJ/z3wxs81HXEhpGT6vqb4p6sq6j9Nhfu5Dy3UGMQ==
X-Gm-Gg: AR+sD11YLbemj4zch4LWz/9v+PxDbwptEYPkC/QQRWZN0Q2fywhCHXh+rMk1F6OSHEy
 PpzeorFVMeDf8coNUXRNlT8SOXruKZTAOdOIex1PmOfurj1/hDhrerA/5RlUJwllCNz48ctW3Nl
 VimqhIcbPP+fZ0vjsmh+SHfchXoT8tuq+zSF1pNrmMJJcUXwPzcPhn9+RqADeuvwzVcTuwjM6ps
 0lS0ehb9wI3YhzH7KFphdNRhSHz/8bcL9Kc70ERi/laXpGM/wm6PfRpj417WbhKXmdbrVRaXwMd
 qFXqk4+ATaCeUjfn5rgqTue8Vnez1EFL9CtNuzvH213TZ9Z+FbqLcz9UABOhgAo6elHSxve7ach
 LGQed9fgnNiG/Joedp+7HLmfuYc9u
X-Received: by 2002:a05:690e:4410:b0:668:4c8f:5d47 with SMTP id
 956f58d0204a3-6692f8747c0mr1161521d50.108.1785415135513; Thu, 30 Jul 2026
 05:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260729231325.3808993-1-titusr@google.com>
 <20260729231325.3808993-6-titusr@google.com>
In-Reply-To: <20260729231325.3808993-6-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2026 13:38:42 +0100
X-Gm-Features: AUfX_myq4gjGsCLp9XRmEN2r1W1HG0SpuowqB4jySfBzjmziyPSpMSebNR-ZBqA
Message-ID: <CAFEAcA9OHrycH12LcmUECOsm2Ajqnx4tgWVvrgdrHtDmT9UFbg@mail.gmail.com>
Subject: Re: [PATCH 5/8] hw/sensor: switch adm1266 to millivolts vout
To: Titus Rwantare <titusr@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com, 
 fanjason@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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
> Enables storing fractional voltages for the ADM1266 over QMP
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  hw/sensor/adm1266.c        |  27 ++++---
>  tests/qtest/adm1266-test.c | 150 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 167 insertions(+), 10 deletions(-)
>
> diff --git a/hw/sensor/adm1266.c b/hw/sensor/adm1266.c
> index 2979557309..80960dc1c4 100644
> --- a/hw/sensor/adm1266.c
> +++ b/hw/sensor/adm1266.c
> @@ -263,32 +263,39 @@ static int adm1266_write_data(PMBusDevice *pmdev, const uint8_t *buf,
>  static void adm1266_get(Object *obj, Visitor *v, const char *name, void *opaque,
>                          Error **errp)
>  {
> -    uint16_t value;
> +    uint32_t value, index;
>      PMBusDevice *pmdev = PMBUS_DEVICE(obj);
>      PMBusVoutMode *mode = (PMBusVoutMode *)&pmdev->pages[0].vout_mode;
>
> -    if (strcmp(name, "vout") == 0) {
> -        value = pmbus_linear_mode2data(*(uint16_t *)opaque, mode->exp);
> +    if (strncmp(name, "vout[", 5) == 0) {
> +        sscanf(name, "vout[%u]", &index);

What is this doing? Why do we need to do it now when we didn't
need to call sscanf before? If we do need to use sscanf() we
should check the return result for errors.

> +        mode = (PMBusVoutMode *)&pmdev->pages[index].vout_mode;
> +        value = pmbus_linear_mode2milliunits(*(uint16_t *)opaque, mode->exp);
>      } else {
>          value = *(uint16_t *)opaque;

You've changed this to a uint32_t property, so leaving this as
a uint16_t* cast looks wrong now.

>      }
>
> -    visit_type_uint16(v, name, &value, errp);
> +    visit_type_uint32(v, name, &value, errp);
>  }
>
>  static void adm1266_set(Object *obj, Visitor *v, const char *name, void *opaque,
>                          Error **errp)
>  {
>      uint16_t *internal = opaque;
> -    uint16_t value;
> +    uint32_t value, index;
>      PMBusDevice *pmdev = PMBUS_DEVICE(obj);
> -    PMBusVoutMode *mode = (PMBusVoutMode *)&pmdev->pages[0].vout_mode;
> +    PMBusVoutMode *mode;
>
> -    if (!visit_type_uint16(v, name, &value, errp)) {
> +    if (!visit_type_uint32(v, name, &value, errp)) {
>          return;
>      }
> -
> -    *internal = pmbus_data2linear_mode(value, mode->exp);
> +    if (strncmp(name, "vout[", 5) == 0) {
> +        sscanf(name, "vout[%u]", &index);
> +        mode = (PMBusVoutMode *)&pmdev->pages[index].vout_mode;
> +        *internal = pmbus_milliunits2linear_mode(value, mode->exp);
> +    } else {
> +        *internal = value;
> +    }
>      pmbus_check_limits(pmdev);

This looks like it's changing the semantics of this property,
but there's no documentation either of what the old set of
accepted strings were or what the new set are.

We shouldn't change the semantics of existing properties
in a non-backwards compatible way, generally speaking.
If we do really need to do that then we should flag that
up clearly in the commit message with the rationale and
the description of the change and its effects.

> +static void test_vout_milliunits(void *obj, void *data, QGuestAllocator *alloc)
> +{
> +    uint16_t i2c_value, value;
> +    uint64_t i2c_milliunits;
> +    QI2CDevice *i2cdev = (QI2CDevice *)obj;
> +    char *path;
> +    ADM1266VoutMode m;
> +
> +    /* set a different value in millivolts for each page */
> +    for (int i = 0; i < ADM1266_NUM_PAGES; i++) {
> +        path = g_strdup_printf("vout[%d]", i);
> +        qmp_adm1266_set(TEST_ID, path, (1000 * (i + 1)));
> +    }

These test functions leak the strings allocated by
g_strdup_printf() (the leaks show up if you run 'make check'
under the clang leak sanitizer). I recommend adjusting the
scope of the variables so you can do
  g_autofree char *path = g_strdup_printf(....);
and have it automatically freed as it goes out of scope.

thanks
-- PMM

