Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2572CA5FB1
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 11:41:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBsh7-0001a6-99; Wed, 30 Sep 2026 07:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBsh4-0001Yy-Sd
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 07:41:51 -0400
Received: from mail-yx2-x2b.google.com ([2607:f8b0:4864:41::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBsh3-0005eZ-61
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 07:41:50 -0400
Received: by mail-yx2-x2b.google.com with SMTP id
 00721157ae682-8ac8e048735so2819127b3.3
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 04:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790768506; cv=none;
 d=google.com; s=arc-20260327;
 b=AaaG98p9XfOoM1vC0yzRz4apZI58V6Xzmmc7BRKlyecik9EWtKG+hrE2l2VbapatYn
 jEyJZTWy2AuRHfcHyX47Nf6mqucbrPgsTOk6UAAQrKMdmPBtRvSGgSUqCBMJPPkUmVe4
 5J3e40rquOOuqz2uhsxVrCoq4FQPJIPFS+JKZwWsjt1BrrbqzdHGQvwQ5NAWmQsMD7Oj
 9/k0eV6jnmxuAC8BCfQo7ruyizFcVlNmQ0LfwtEoXZsalDMq1RENTS0qvPTrl5X3mTbT
 xK+sGP9pVphXx3NHvILU7kbhokI+v2XGIT4hspPua+7+dbaBOONNInPV1BKmuIrzIcgx
 mcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wiakC44092UwtolGmldq2paoAbPU6s6+vx4SY3K0vos=;
 fh=5bQAlmYl7DcEh7xLMBnp5q7Z5Z0LfLqlXUG8LkRzwi0=;
 b=rnQdhhhdVzA196gPz+CVJKkxszf8ZRjP7v4o1xS0aExfwu8tIRKk/QMCAHaAXup0tN
 fCaCuwwGB1f+IitpMcuI/KOsHO6oNjy7KnGnUnPdA3FukWtUCRQ4lBk9ehdvs3e5o6Vi
 KC2ZbvN+nc1R/ym04OfRK5WG8bL2+2YgMueuMnsXI56xIT7a+WUP5HyCOvjmzvYhILCC
 3F8HvjBvPUwzdPG7dh6MPqZBBei86xf0JDFRSKPSjn9TjGqEQ7JodrX2Zq4hkFIu+Xrd
 Eg4gk4kZ4UnPhR5w626G9HXmh5oLqCQYlWXmLbiAWyEdwShJbzcncbLSMoL6tsIyvh1G
 qfvw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790768506; x=1791373306; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=wiakC44092UwtolGmldq2paoAbPU6s6+vx4SY3K0vos=;
 b=HeSh2QthZEKLgV4cpoMbRRfVZ6adyw9kspwoW4QBagCvkPcIfTV1D2KBxWVieMijPk
 oFzUT9T6UAgLC/nUSTRbFwKDj4BDTILlGYYmncKXvjlPwwWOcReOfqlSkrW4CRouy1+B
 a07oZunWwyRtcaXdHBfL0UqiEfcYT5KvvdgYzjoxFL6+hgxtbiKadLkwmTBgZYV1C/yc
 Ir0izLYzQUYcDD51DtCkq1044S1esk3u/fjAaBXt2LZWUe0AxQRuZvZa/IR2L2J8t0e8
 3UYmpC9c0/Y1LTK8ICr3YVWb4w9b7+YSiUMiUshbrzluhlvaJhJYrYRD3iRMwJS9EeJu
 fQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790768506; x=1791373306;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=wiakC44092UwtolGmldq2paoAbPU6s6+vx4SY3K0vos=;
 b=krOt13Af/5f5JGX7SNoelrgppJCTZgEE/4adx66YramlzObuOJAx/mnNqSApJOpF8J
 Q3TAFcYKXLCP8zvrFfPPZ1O8mC7DgIxIy9+fLvfNVweFYZ6KbjlLvNjsi8mgVOb2ovYZ
 YB7118AtiC0ypbDFk6uEQ+F8EerUdm/7soEB1atG+7fffLjsZM+I2y3o0FttV9d8Klsf
 VEpefJ2aM2MEqCLr1hbb924VF5KY1iTJxj9UqDL9KVNkEsxQdkp2QVcv+ZHICNoVhfC7
 7gspDmud+1SDFlUaM4Gx5vzfmRmOp7I+VGRdsmkQwx7MuQAQPXYOTEHJr8X6lrh/95fx
 VSBg==
X-Forwarded-Encrypted: i=1;
 AKwUvByGezbDfHNyf8Qbw7xsK8HYVfTqLZ7cS8gaXn2DiP5c62Gj1rskig9rFT/E7QlRU0sinPpe39YMnA==@nongnu.org
X-Gm-Message-State: AFq9FYLQy/MIMZHnRO6ixCEqqCYnUErXelEhVmm9BYzVzW+zHq8JqDmw
 wbvuRThkm+16j/1POVafoC9PN0juTjFFPJF9aj0SFatXU5afsj8qFvBE5m6mn+LNRrp74OGRA0j
 QOiS35Yt1Pn3DK8dKYii4+k6+vCcwe5QzDxWXBH/mpg==
X-Gm-Gg: AYBFou0GcFsPT9OnsH09PrWIfi0poNDZjGmTppPC3YVKKxyOI+hGx/+4q4LIrABzsKB
 AD+RB/RMw9vVsfzmNkz9Wcm1kP59rlAPIDbSuiwE8HDEdCQvqcUt/WTY7BAwl7vkbwEVyyTI3e4
 mfMgYfotTnW5UiJjGodRk2tX8pdNNxci8+SIyAb4iddz0INrsLHHQJywp8eg7Wrd2ZnW4I+Tuiy
 mkGCJzfhdVoFQTDsRaipjh0Pb5wEiE/i6oVDihul33iqrpn7RrqMKeHM/B2s6a130pB2CiFuuRF
 VXUB+dlCmd+5uG5CTk1euLT51UxJU2rvRQQOtmbUx16Y9QaPdbU9bf3S1g5JTiH3k3uToeu69P5
 +MEAxSgNOfAp7+YCjzRNPv3DLHcZfthVMkKlhPVk=
X-Received: by 2002:a05:690c:dc7:b0:873:17c9:b054 with SMTP id
 00721157ae682-8ac9341f375mr2294117b3.21.1790768506180; Wed, 30 Sep 2026
 04:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260921074451.3158645-1-fuad.tabba@linux.dev>
 <20260921074451.3158645-3-fuad.tabba@linux.dev>
 <5eb74929-f605-4acf-875b-e561385182f0@tls.msk.ru>
In-Reply-To: <5eb74929-f605-4acf-875b-e561385182f0@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Sep 2026 12:41:34 +0100
X-Gm-Features: AclHuK8hwDgyXHr-z2aiWpkLgQD4iZFZy5EtVm9BkdmUmjHVZaIl5VVJcmeq6C0
Message-ID: <CAFEAcA88ZjsNmCPp6N-DX=wcVPhOgRiq9HS_9VHWziYBzkoJMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Fix WFxT timeouts when the offset puts
 the count ahead
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 qemu-stable@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, Will Deacon <will@kernel.org>,
 Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Wed, 30 Sept 2026 at 09:56, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> [This has been applied to the master branch as 998b6db69e3ec58fd52ddc7a06ece6cf286f3c77]
>
> On 9/21/26 10:44, Fuad Tabba wrote:
> > The WFIT and WFET helpers arm the wakeup timer at count == timeout +
> > offset, treating an overflow of that sum as "beyond the counter's
> > wrap" and arming at INT64_MAX. As in gt_recalc_timer(), that reading
> > is valid only when offset <= count: with a CNTVOFF_EL2 that puts the
> > virtual count ahead of the physical count, the sum overflows for
> > every timeout still in the future and the wrapped value was the
> > correct wakeup. The CPU then waits until an interrupt or event
> > instead of waking at its timeout. A Linux guest uses WFIT and WFET in
> > __delay() when FEAT_WFxT is present, which -cpu max advertises.
> >
> > Arm cntval + (timeout - cntvct) instead, so only a physical count past
> > 2^64 is "never", and add a tcg system test that issues WFIT and WFET
> > with such an offset, with a timer interrupt 1s out so a broken WFxT
> > still returns: before this change both wake at the interrupt, after
> > it at their timeout.
> >
> > Fixes: a96edb687e76 ("target/arm: Implement FEAT WFxT and enable for '-cpu max'")
> > Fixes: da9b86c35fa8 ("target/arm: implement WFET")
>
> Hi.
>
> For stable-10.0.x LTS series, which does not support WFET (commit
> da9b86c35fa8), I'm picking up just the first half of this patch,
> and half of the test.
>
> An alternative is to pick da9b86c35fa8 ("target/arm: implement WFET")
> for 10.0.x, which does not actually look bad.  It will probably require
> v11.0.0-332-g4575da5ecb7 "target/arm: report register in WFIT syndromes"
> too.

The WFET implementation relies on the preceding set of patches
which implement the event stream, SEV and SEVL (and on some
later patches that fix a bug or two). I think the feature as
a whole is a bit large to try to backport, especially since the
failure mode for "we forgot one of the bits it depends on" is
"the guest silently hangs because it doesn't get woken up from
the WFE when it should".

thanks
-- PMM

