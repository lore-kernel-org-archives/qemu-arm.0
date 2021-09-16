Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1129581lfp;
        Thu, 16 Sep 2021 06:34:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMGoQDKCb1y/y/jWuxKq8x6otxcm12wBG/g224VqNMgt0UcgE1yK/F2W/TQUCPQj6VkSri
X-Received: by 2002:ac8:4892:: with SMTP id i18mr5171987qtq.13.1631799273316;
        Thu, 16 Sep 2021 06:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631799273; cv=none;
        d=google.com; s=arc-20160816;
        b=ORxxaXtqAh+SWIoo2F7LqXB8JgbXZPz/z6oxh/8qqHug3FBMahdTkzeXTCjNaDSYQx
         WVNYErd1AkkzQd4kI8xtZBihXa80vGwFymGco3+M0XdYQoG9XQ4BRgsEeqCSt3FqSQ8d
         ARbX1sN+DUfldiJi0r8jqiJ1XgoyevHNkvUT/5WlCrNjZwFkDRI1GPEUVNdTH8PiLgJA
         GwjrI/mQiK2DAvVCQ8m98AUMWT00f0NosfKGN1zLCcqCreaAB8xXeC/kBFXs3PguS+yA
         5ZHZgM1UVB6hYUl+ehHnDVEVRhgWxANB3AbcAwCXZQD/KQ18jbfamkr5BBLMZF2pggu6
         J0yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DJXhb+tnEqQWjMjEHbumJndvoYeZdNemytrjthbTjtc=;
        b=j2FA0TlInjOlIbR1nREe5okn4H3qgwAnFTcPe44RayRsUqRzGkBXrGyTtkBwD6JfBr
         bXvF+R+L0aEIOWuAzddcE+BFFeHyIbARO7ydFPn+NnxGbhtj8wt3YGl9QHql2NTu52nD
         J9jfk3u1ds+TSfQMajQylfQ4E2nQwyP001Ww2udDfvg2rki4X0ONwjXD/euOj2H047ay
         6Xs+/UGKH2DP/elBobgan0ip4fD9favr0pqYBOPuVsmqBogdviGWdlSoaJCj8Ru6Ook8
         43EAerzjfdnRjU4/Q4xjU013lGTi6MO5BPkrige057Zmwg4QkrsL7mJqE3/qx6tSj7Wg
         HERw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oq0G8TRp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18si1632811qtd.295.2021.09.16.06.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 06:34:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oq0G8TRp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQrX6-0002et-NF
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 09:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQrWG-0002ZZ-HN
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 09:33:40 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQrWE-0002BE-BW
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 09:33:40 -0400
Received: by mail-wm1-x32c.google.com with SMTP id e26so4855163wmk.2
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DJXhb+tnEqQWjMjEHbumJndvoYeZdNemytrjthbTjtc=;
 b=oq0G8TRpnqwaJFxmGX5HrrtWblObjLUD5glLW7QoZ64MP9E5CgTmiIO7C1mKkaRLvj
 Le0OJrgq6GRBaZBAAd8JtrI1fEqVblDo4Uaup51MFmMx+OLmHVola0Ce2fNTRc59EZQ2
 CI6UFBETcLMWSO0WJ588ekb8V8Y+HjToXzUAqNZuZvBNN9UaD9Y3drrLNgwD9AJsYbwA
 H0TY5LNoFZ8lzFx/+6mtxHzoAkw56V+mIEnwEllow1Q4AyNpgfLQcgWfSwEPR4JgvqIt
 LebbaOvCbb8F0wgL1iUz4wK8Tbv1/th67ZvTxSYlEIM1ufrCUcZgLI4lRnfVXe59PFV5
 6zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DJXhb+tnEqQWjMjEHbumJndvoYeZdNemytrjthbTjtc=;
 b=U5i4Kg+arhfuSgZjTAUsPx8ezBX+ayLATSHPt2lZWQRXYBjQDV1/b8X5BB+7IfduhU
 69I4g6gMvJ0LL+KX6dtTzgj7dTbfcS0L5kJpJQdd0ZhQ4x1NZ++2uZUY5IVP+xySVgWU
 hKxukWB72TXIbzcGzj/mspFFsHinSi8lYGyG6V4bZK/TvwJiABqj+BURBEhTvoaojelA
 5q3SuhCL8jJzQA3mFtTwauiXLSorffzWGxmPpBNKn/iD6Jqhz7NT/ryNjkuW5x+Ahwje
 Ha1b385hlrp1hzOzcyRWJox2LGa+C2jqVC2XLVscXsyvAOLU9pmo4wNoZ1HZ/yzauz+s
 g5lQ==
X-Gm-Message-State: AOAM530W6s0ihWk0KEsQMTucf0f9gsfgzcFEhBP0GwOvVESxGtKzSmsL
 YZgEsykeFKzU2BImf/vhtvgq5rAEEbNwYbZBP307dQ==
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr9971595wmo.21.1631799214193; 
 Thu, 16 Sep 2021 06:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210909122402.127977-1-eric.auger@redhat.com>
In-Reply-To: <20210909122402.127977-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 14:32:43 +0100
Message-ID: <CAFEAcA9gs4of2tw77YfYNjYKjoeBAHy0SknkCFNuZprGa-203Q@mail.gmail.com>
Subject: Re: [PATCH] hw/rtc/pl031: Send RTC_CHANGE QMP event
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gavin Shan <gshan@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SQHNkWN2IKkI

On Thu, 9 Sept 2021 at 13:24, Eric Auger <eric.auger@redhat.com> wrote:
>
> The PL031 currently is not able to report guest RTC change to the QMP
> monitor as opposed to mc146818 or spapr RTCs. This patch adds the call
> to qapi_event_send_rtc_change() when the Load Register is written. The
> value that is reported corresponds to the difference between the new
> RTC value and the RTC value elapsed since the base.
>
> For instance adding 20s to the guest RTC value will report 20:
> {'timestamp': {'seconds': 1631189494, 'microseconds': 16932},
> 'event': 'RTC_CHANGE', 'data': {'offset': 20}}
>
> Adding another extra 20s to the guest RTC value will report 40:
> {'timestamp': {'seconds': 1631189498, 'microseconds': 9708},
> 'event': 'RTC_CHANGE', 'data': {'offset': 40}}
>
> To compute the offset we need to track the origin tick_offset (the one
> computed at init time). So we need to migrate that field, which is done
> in a dedicated subsection. The migration of this subsection is disabled
> for machine types less or equal than 6.1.
>
> After migration, adding an extra 20s on the destination returns 60:
> {'timestamp': {'seconds': 1631189522, 'microseconds': 13081},
> 'event': 'RTC_CHANGE', 'data': {'offset': 60}}
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>


> @@ -138,6 +140,7 @@ static void pl031_write(void * opaque, hwaddr offset,
>      switch (offset) {
>      case RTC_LR:
>          s->tick_offset += value - pl031_get_count(s);
> +        qapi_event_send_rtc_change(s->tick_offset - s->original_tick_offset);
>          pl031_set_alarm(s);
>          break;
>      case RTC_MR:

None of the other users of qapi_event_send_rtc_change()
seem to have to track the baseline time like this. Shouldn't
this be doing something involving using qemu_ref_timedate()
as the baseline that it uses to figure out the change value ?
(The other users do this via qemu_timedate_diff() but since we
start with a value-in-seconds we might want to expose some other
API in softmmu/rtc.c.)

thanks
-- PMM
