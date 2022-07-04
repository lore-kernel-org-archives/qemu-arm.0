Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3324025lft;
        Mon, 4 Jul 2022 08:58:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1trjp5gQ1+Uh/H/HPwi93n3LalFttC0rgRoMuLBffjfxTIqUcF/8rc4mCB78TCIfEnuPJzO
X-Received: by 2002:a25:ba90:0:b0:66d:d8e3:a87a with SMTP id s16-20020a25ba90000000b0066dd8e3a87amr21666275ybg.32.1656950291463;
        Mon, 04 Jul 2022 08:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656950291; cv=none;
        d=google.com; s=arc-20160816;
        b=gscX3az+GOHz9CCDZcOxtedwCxxA6rCe1QtQJVM2oS4SL+BIPhHU1Rkbxm2O8ggLhT
         xXVgRjni6p6dvBwLag6W/c8LeBxJcXbZEVCa6M60m3nNgql/2gqfEEfN3A6cigZn0WGX
         ZyFwgbVzfEo9HrFqJb6nSqE6x4ID0pjFf5Up66aIcRzzmLXdg6d4JZtC1CjDrwEUErHz
         UzrG+bAcdpXLmOhFQaKlTl7tIlDw9ZbbJgX9ZGSqHoPZAP9FEgBF5OpvIvegK9wO6Eao
         fi6bV5zyKF3MAXXYUCy/MrjXx7vBKrFRnE4eVh9eznQTzCHFeI9iuiCnXywSjw+hx4yG
         MKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+6F4PCKhzFBdFwQmc+mBMmF3yxissWDsbGajyOXABQU=;
        b=V+ngCs2m0lFj+i2ybyjW1mWwuDXxjUFRF1KaQgdokbFRBW3mzE4Kncr67hbMFxdGGJ
         q68F6V1f+LCBfSxBvWQPMckDEfrwbj8RcVor9+Q9HNLETo0m8PSq9B7brRP40eHlb1VD
         vdgTwdaGBHU3emtPLe2RsR/kiwvJPJpXtSDxcA2/8d5rEgnHCIkBOzuX/vgghB0laSw7
         nf0QWfVoqIZzgW2i/sUQROYgipzAmWDJviZaPznS9iozYo3LG+v4WtqHdqwCxRfjC1Fy
         p3KfL1sBkM48jUSwMP5xLW5ClNxcai2UwX9WxV4FFqo92Gcz7Ei/GUS0gK3dKw8CkeV1
         1mVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q+V/Dniw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c132-20020a254e8a000000b0066e24022344si9071879ybb.99.2022.07.04.08.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 08:58:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q+V/Dniw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8OSg-0006LD-Ps
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 11:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8OSA-0006J1-4A
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 11:57:39 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:46779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8OS8-00081c-IY
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 11:57:37 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id l11so17535201ybu.13
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 08:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+6F4PCKhzFBdFwQmc+mBMmF3yxissWDsbGajyOXABQU=;
 b=q+V/DniweCYk/EcytaFlNsbLhTRMPKliBSe98IOZ9eI0hd1tQcdIeLUBZHwLa7M29y
 pyoKdjpx1YbpTFYqmP/qoDRkote45SUPxEUJfAtNNMn6b8a/Hbp+6lJNT19u1zY0G3Er
 UnDjSTU8YiqsWF9mCffjjzHWkKmmgwKhUrUbISWBGI6lk5BaW38bxEr77k1S/mdQy5N/
 C3rF32CdvLeKpjSGFY+kAzX02t/LleaaxgrwGS9/llUy3uISY4dO9HpxtU1DzN3YlzDy
 SYsnVXKl4B+nnvzCJIRFbENexpN0PaBEAVuTq+VSVUWqq6g2lFtnU7mb4qdqGedndoxW
 u8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+6F4PCKhzFBdFwQmc+mBMmF3yxissWDsbGajyOXABQU=;
 b=GsX6EXD0I8OSnBMQ5osoyjmP/e2pEmOVcfEzHmppDXMrMp5SIb84htWJNxqgE5XMsZ
 ec/W2+KSMmYY3FHpdmyJnvaC9ykD2n/e22eoqVT7SvW1YZSlyvCCSwMDxod/SXaoNLUM
 llslsH3h2c8to0aB7RMIGK4s7strEykYkXwoga4zhQFjp1buKeVWNB3H2jg7FOb72TX3
 sLA7hHrhso1M9f2GLnxh35WRGs3iDQWk1deA2v7QzJ8TSWYXAU8TFq+LU/6U1tGvZstw
 RIsEdMVOZxC6IFSwedI3gM9GL+l6j5mDn0qYOxrXUkaxEncoN3Ve7X3TGwceHzt0NiWr
 +d6g==
X-Gm-Message-State: AJIora8jpc0VD2Kw0xzuietX+jCWNqYopPs5GGA4VzjijJoKTHWOpe7e
 UA9vqzOvv8gvCdif/DzTwON+OWsEC8CTthv9R5cmUpYUdHM=
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr13005742ybf.67.1656950254482; Mon, 04
 Jul 2022 08:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <CAFEAcA_5s3avpeHNO5cC0HS5Unq9QsCp9mTof4uqLJwE13h+pA@mail.gmail.com>
 <6bad14a8-a6dd-4bbe-7808-d51e6c3f777b@linaro.org>
In-Reply-To: <6bad14a8-a6dd-4bbe-7808-d51e6c3f777b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 16:57:23 +0100
Message-ID: <CAFEAcA-aLdqTaGKfF-b9zmjUwdrmHwc2hHwam-oLe9ruHBbApw@mail.gmail.com>
Subject: Re: [PATCH 00/62] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bzk5cDvTSHOA

On Mon, 4 Jul 2022 at 15:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/4/22 20:24, Peter Maydell wrote:
> >> Previously, we had A-profile allocate separate mmu_idx for secure
> >> vs non-secure.  I've done away with that.  Now, I flush all mmu_idx
> >> when SCR_EL3.NS is changed.  I did not see how we could reasonably
> >> add 8 more mmu_idx for Realm.  Moreover, I had a look through ARM
> >> Trusted Firmware, at the code paths used to change between Secure
> >> and Nonsecure.  We wind up flushing all of these mmu_idx anyway while
> >> swapping the EL1+EL2 cpregs, so there is no gain at all in attempting
> >> to keep them live at the same time within qemu.
> >
> > Is there no SMC/interrupt/etc at all which is handled as a "just do the
> > thing at EL3" without dropping down to secure EL2/EL1 ?
>
> I'm sure there is, but it's only swapping between S EL[012] and NS EL[012] that concerned
> me.  Is there something that I'm missing?

Oh, right, EL3 remains its own mmu_idx, of course. (And I guess
also Monitor mode for AArch32 EL3, though the degree to which we
care about performance of emulation there is decreasing I suspect.)

thanks
-- PMM
