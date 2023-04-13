Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp1041487ejc;
        Thu, 13 Apr 2023 06:25:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350bQQSecz4p8hvLLHEnolHpvb/Wl9X9Nmsb0w9ICRWq+E5/WwZraKiGksA2GJRVqv5TAygKC
X-Received: by 2002:a05:6214:482:b0:5ee:f961:4b56 with SMTP id pt2-20020a056214048200b005eef9614b56mr3344685qvb.9.1681392314957;
        Thu, 13 Apr 2023 06:25:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681392314; cv=none;
        d=google.com; s=arc-20160816;
        b=UdOdDxPuiYIBzCNh9oRezmibPQpdBOSZk4CvgVLTC4PzAY/OOuJ+cTQYQrTYUx/9m0
         TtuSvbV9xajNeL9dB5ntN+phWVlICHTDqMJlnZZM0jEhsZYtawS0RLOuQplNK8dtS7qQ
         1M81l+Yw4nppOWyDbDeKiZ918wjpi18mlucrBj2DtVLEJ8wVW91xHxh0xFuqycpiLNfv
         vpkYdKJmGIZav92wR2BIFTPPCln8HCuOW6Ig9gKjzK1GADYOo4xjJd29evzIpFZT5LSR
         RAaCPKyJrKCJvqffn/TdmyZnj0RRQFUFLfPpSeQCJ22yegBT9sJn44AhaBciVcc135yB
         iyHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SVIQkvA2WP6zeEPbNmVjGiFz8zy4V0Km2NjASN8wmp4=;
        b=JUYeDCnKdsQzWYprXQFGmtGKc1eaSWw6OGrhk+n/DcmxY68ozXftqJ+XKffJzzKFw0
         HK8Pn1i4R0nW0FMUNXVv+7ynOmGsoiBaYVaoyd/Z7QIhYVuEtaknskP7URF6YLh3auvE
         iEJeMl8MfPML+wUcLQRiwDFuDBstO1460pEkXGiFldtfYLn35w2c6RM3H2LzakY9JThs
         yJZVFm8p3XmX4Pl40I/R6kuvPZix4gWAxnJAJAIH5FxMnSqLUZQTEBARtuWJo09gxNls
         Qk5kjWP0mdSO62devjKR3hq0eXj7gkjBuIP5KMK4quoGaiKUN4035T4G5YYbxk3Llfi9
         OeFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TkkUoYOv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020a05621421ac00b005e05935d813si834826qvc.593.2023.04.13.06.25.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Apr 2023 06:25:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TkkUoYOv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmwwT-0006e6-Bb; Thu, 13 Apr 2023 09:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmwwQ-0006dV-VR
 for qemu-arm@nongnu.org; Thu, 13 Apr 2023 09:24:47 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmwwP-0004ti-0t
 for qemu-arm@nongnu.org; Thu, 13 Apr 2023 09:24:46 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94a4a898649so272288766b.2
 for <qemu-arm@nongnu.org>; Thu, 13 Apr 2023 06:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681392281; x=1683984281;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SVIQkvA2WP6zeEPbNmVjGiFz8zy4V0Km2NjASN8wmp4=;
 b=TkkUoYOvmJpx9dNAre6sOohlO+9mD4W5VBnxGxTF5Ky6kdFi2xmje6F5+C7G6NwQCd
 xg8yW29RqiCdXxBsk0dnnIAqeHlkCeRyc0B2XiHOpYnyaHNL8IfIMwFBcNSZSRmOEp6Q
 bp1y8zUpiUi4AG5dvu3SgRVQS9woi3rM0/hv5AxWPQPKxWKx2upEpTFWNcn0tKG+TE57
 uNgSK5willU1iUGs3DNQjN4UKBqC9hzp1EWzTqdSXIUybbhi36qFYXfWxY8mjklD7twY
 SQLfkCEbghdTs3ecPoHZ/gCzDCQSjKGA8EhAOw4L36Rnj4vYxtNlyRckssJ1RQT36vnS
 TLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681392281; x=1683984281;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SVIQkvA2WP6zeEPbNmVjGiFz8zy4V0Km2NjASN8wmp4=;
 b=am7h9ac0hLac/xmG7ie2vT2oAHYQQj+ly6OnW+tsVOnIoSqIWwPe90QtDa2tpWZ14i
 HNylBN53cFlbcQz56mx7dYCKIQ2BGuWGYNzhtDm97T9ei/VVrcgVRNqBGL68tHtE0gDG
 X5/s6J4b9UPVSQ2NSaxFg4Ok2JeaM/C6tJkSqUX3zaRWGKMrcXsaNoGDOpZeyOspWkZq
 qqr/JJRCuy+jIUMjOYGnA0f7soLGUZ5aqLyNILnVhkL0xAfttYCm8/SU+jQkeVnXdh4E
 MvnBKv38cdudHQ2u4LYyeAvtqT4aR2tqRjURRFjuVPG53y6fgKTmbKAdlbWydnEKIrpt
 zTdA==
X-Gm-Message-State: AAQBX9f5bXPk3qnxxI0O3u6eycCAXy5/4NPInmjk0hf8hLVXAxvj+Xzm
 eYBvT4Bl/MN6FQ0hoVKz6/HQDYD39qusCt5t0dNGJw==
X-Received: by 2002:a50:d783:0:b0:506:6ca5:3128 with SMTP id
 w3-20020a50d783000000b005066ca53128mr1227711edi.6.1681392280863; Thu, 13 Apr
 2023 06:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230406151441.1027662-1-leonid_komarianskyi@epam.com>
In-Reply-To: <20230406151441.1027662-1-leonid_komarianskyi@epam.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 14:24:29 +0100
Message-ID: <CAFEAcA_koyJSR_7kF6TByA_rm2nJQr-8UnXrtu3JqwgpqUEctw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Add overflow check for gt_recalc_timer
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dmytro Firsov <Dmytro_Firsov@epam.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
X-TUID: S2of4KOrzmtP

On Thu, 6 Apr 2023 at 16:16, Leonid Komarianskyi
<Leonid_Komarianskyi@epam.com> wrote:
>
> If gt_timer is enabled before cval initialization on a virtualized
> setup on QEMU, cval equals (UINT64_MAX - 1). Adding an offset value
> to this causes an overflow that sets timer into the past, which leads
> to infinite loop, because this timer fires immediately and calls
> gt_recalc_timer() once more, which in turn sets the timer into the
> past again and as a result, QEMU hangs. This patch adds check for
> overflowing of the nexttick variable.

This is https://gitlab.com/qemu-project/qemu/-/issues/60 --
thanks for sending a patch.

> Suggested-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Co-Authored-By: Dmytro Firsov <dmytro_firsov@epam.com>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> ---
>  target/arm/helper.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2297626bfb..2fbba15040 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2618,6 +2618,7 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
>          int istatus = count - offset >= gt->cval;
>          uint64_t nexttick;
>          int irqstate;
> +        bool nexttick_overflow = false;
>
>          gt->ctl = deposit32(gt->ctl, 2, 1, istatus);
>
> @@ -2630,6 +2631,16 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
>          } else {
>              /* Next transition is when we hit cval */
>              nexttick = gt->cval + offset;
> +            if (nexttick < offset) {
> +                /*
> +                 * If gt->cval value is close to UINT64_MAX then adding
> +                 * to it offset can lead to overflow of nexttick variable.
> +                 * So, this check tests that arguments sum is less than any
> +                 * addend, and in case it is overflowed we have to mod timer
> +                 * to INT64_MAX.
> +                 */
> +                nexttick_overflow = true;
> +            }

Rather than adding in a bool, I think I prefer the version
of the patch in one of the comments to the bug report:

             /* Next transition is when we hit cval */
             nexttick = gt->cval + offset;
+            if (nexttick < gt->cval) {
+                nexttick = UINT64_MAX;
+            }

i.e. we just saturate nexttick, and then let the existing handling
of "turns out nexttick is too big" handle things.

There is also a comment or two from me in the bug report pointing
out that the handling of wraparound is also wrong in the other
half of this if(); we should look at that too.

>          }
>          /*
>           * Note that the desired next expiry time might be beyond the
> @@ -2637,7 +2648,8 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
>           * set the timer for as far in the future as possible. When the
>           * timer expires we will reset the timer for any remaining period.
>           */
> -        if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
> +        if ((nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu))
> +             || nexttick_overflow) {
>              timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);
>          } else {
>              timer_mod(cpu->gt_timer[timeridx], nexttick);
> --
> 2.25.1

thanks
-- PMM
