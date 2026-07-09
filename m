Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA18C44501
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 11:15:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whmia-00005T-SY; Thu, 09 Jul 2026 07:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmiZ-00004z-GS
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:14:59 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmiX-0008ME-V4
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:14:59 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-664d22d7337so1617341d50.1
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 04:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783595696; cv=none;
 d=google.com; s=arc-20260327;
 b=NgasWEolcJHRd7tiyMI1BGp+YgqJZbicDKAdypjFboWUxobiBns4LZknuIPjjEjTHe
 gSWrB2RjHA6WQgqkR5hBlrdYoUOBsC45Y6FBi5D1ooTk8pnU6rW2Tt7CR0GJxKKeg3ec
 5IRCNVppQXfh0zCrY7zHdXPxnYaEWf5xKxMQlFGzm1wEx+PBw9ApbDwcPbteXEu/esrt
 VhA1oPTSbPLLvrv/ku3fp4r29u/P0C91jFCR1RC7cAlyVdNvhcPMSaBMQqAqbgd4IVxj
 05eCbW5fMg+TdiL/lMaBzS70Tlu0nEacYSzalJt9RubFCuJcfVx+OSP6INn5uVyay+8B
 SrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=0csda0jsAzoG1JAlcaVdEg3eavwvBUv+flzLXMAW0Wk=;
 fh=oR7TsPg3OTmNosGgopAXF0ZXV9nY+FQmXuneIKe+VyU=;
 b=WS79hmm6rtgU2Oa1oICaZZnWnu2hVTcUnX33NHHkjj8uRz5+Whaj7NHx6PKD5b2hVP
 zYLXsxWy14s720QOIk7LfIXBj/jwGdlbYx4db0h9rsNL0o1uO2zId2qaLW1hHDcovLcx
 hq8sc4GRJUZOHgfLBPa3afQqDyC8SVcl8NQOjXqpsvK/vwJvqm/PiXhHjbi5lORFZ/TQ
 tXggrdI1szLO03pPhdlAPKlntSQScpoARba0CG6kCftMeBlMvVsjGhQHmBEwU1N4zv7b
 mikqn5svu7BioyBZOAC7ym8ocaCIIZyrl2JOvkSgFEVTid+LrzSNbI1zlQJ4/459m/J2
 Tp2Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783595696; x=1784200496; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=0csda0jsAzoG1JAlcaVdEg3eavwvBUv+flzLXMAW0Wk=;
 b=kpgj0X6gG8/t8qh1ekYaBqFUcsAvy4s2gJxp/SQEZCquD+P62ruUpY16j3D2vhnQ9a
 mpLqN3OFbxqcKtaQ05LkTNrSEO63buEDE+e+bjlUqwTWN8YlnJN0a26h64mod5/9OjXU
 atkWZ4iLEf3Xm9FoxUVFwWNRlAWhIBalP5zfgMi6Z8MEgu7EmvgHoz/LuofiRt4DFAb7
 T2E02Tvuu7vwsdUHP87H8BMMTiKmewd5q+d2hlzFOnI70fjgLFQ3VF2Ne9K549mB4aE5
 f+l7+Ohd5Smk9RPzeKQndRM5490piuiCfFRWBI4+DZcKsXnYCnGTQ8HEnlns32klPHf5
 xktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783595696; x=1784200496;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=0csda0jsAzoG1JAlcaVdEg3eavwvBUv+flzLXMAW0Wk=;
 b=RuEJZQCErMOwK5GzySc3UtmP2MtfRQAzvPNS+BeqsDx/W900QkZOiDlJ14ZljX+sNO
 pm8tzuZsn0f2ggs8cnyfW1mvXJKjZ8Ag419I1LjcJtBJlGY/nIViDdvLxRtIAn5vX9Kx
 jn2sqkhNuATSvGTbevCx8AdRNiMadCjm+Dum7bDjsB9lJXUKzhsdtE5GqWf0suYgexb+
 GPA3bZfF0xJvnI7T7h/XumcVBjR0gpcYs+vziFXWONOxZEG95D92C0ONd6XFagykvfpW
 TClB/wq9fOQSowMT/Bmbxor6OwwSin6JAYf/Qo8YPH0a+Fxp0iozsqBXLhoJf+u4DXAR
 jfVw==
X-Gm-Message-State: AOJu0YzpiBbGEJwu2uYk8R/inHi2K6fCE2HrX4ipLMlslJYujXkgnLN8
 txBZHPJbUMMseIiSTkFk5l2J/BevrWbBAXc4SfANmFkRXrJMtk9QJ0W3K/3xxjxCICLsRoIh9qO
 cIA6Th6NtSfNYHIU6Zbkjjk/1EwPFzEc9q2kxqnErJA==
X-Gm-Gg: AfdE7cmO/jlqd+YC92+8ZIYJtnHxvtpvFojjyfQ16WCqUUqqizYVe8MbM7elnFG2CMe
 AjHItky2oYL9S/lQn+LL4b7BD1wVsR+J8QWBCgThtlSWmkflovKt6Z5YWqDoRJXmCbxlHN3DXtA
 5xkE8unZfg/4fdCpJG2mXfT63pUMKe37Y64Wa163yaU7Fn9ntyhtKZ/4eUHbK0TlpUmLGebEKIy
 blWtEy5wv0Atsk1CPMpmPMCeg8H8GcxxvJ1LAWZFbsitezJs5zdAHk7TTyhs6l/Bn77Ei0FxWfN
 8D5BQLpDt5xX3Ljo4OJcL8mSYGZlZpv2QA2fHZrFtzH35308WlXgurf8
X-Received: by 2002:a05:690e:d4e:b0:666:4ba5:34be with SMTP id
 956f58d0204a3-667b8120bdamr1466206d50.4.1783595695560; Thu, 09 Jul 2026
 04:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260706230056.1888992-1-titusr@google.com>
 <20260706230056.1888992-6-titusr@google.com>
In-Reply-To: <20260706230056.1888992-6-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2026 12:14:44 +0100
X-Gm-Features: AVVi8CfjCBmfJqwv0fn4NcGcmPMlTauUoW2ZCNchD8omWzDzQEYZfm1l7Vvf1bM
Message-ID: <CAFEAcA9YSeSy1rmu==REhuOfw4cWfGsWc5CFcuE3uqHjorYs3g@mail.gmail.com>
Subject: Re: [PATCH 5/5] hw/i2c: pmbus: add Linear11 format helpers
To: Titus Rwantare <titusr@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Tue, 7 Jul 2026 at 00:01, Titus Rwantare <titusr@google.com> wrote:
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  hw/i2c/pmbus_device.c         | 12 +++++++++
>  include/hw/i2c/pmbus_device.h | 46 +++++++++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)

> +uint16_t pmbus_data2linear11(uint16_t value, int exp)
> +{
> +    return (uint16_t)((exp & 0x1F) << 11 |
> +        (pmbus_data2linear_mode(value, exp) & 0x7FF));
> +}
> +
>  uint16_t pmbus_milliunits2linear_mode(uint32_t value, int exp)
>  {
>      uint32_t ret;
> @@ -58,6 +64,12 @@ uint16_t pmbus_milliunits2linear_mode(uint32_t value, int exp)
>      return ret;
>  }
>
> +uint16_t pmbus_milliunits2linear11(uint32_t value, int exp)
> +{
> +    return (uint16_t)((exp & 0x1F) << 11 |
> +        (pmbus_milliunits2linear_mode(value, exp) & 0x7FF));
> +}

Nothing calls these functions, and they are the only users of
the new functions added in patch 2. We should add these when
we have some actual callers, otherwise this is all dead code.

thanks
-- PMM

