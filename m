Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp1170422njg;
        Wed, 26 Feb 2025 12:50:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXgsts+gNJHzCCbBeZKwSdsjQ410hW30Bk2xR7hNhggg5inYKiYmItviI5+b2vFR1H2Iz09RE75uYTZw==@linaro.org
X-Google-Smtp-Source: AGHT+IHBAjC5+KAfHHj8j8GbgLt2iWw/gBdvuFxEcD+OLpzKPv1pKp2sfNAED2BR361qAv5tiv1j
X-Received: by 2002:a0c:ea8c:0:b0:6e8:916b:8c49 with SMTP id 6a1803df08f44-6e8916b8f7dmr27650766d6.31.1740603041526;
        Wed, 26 Feb 2025 12:50:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740603041; cv=none;
        d=google.com; s=arc-20240605;
        b=Qe4VRF+Lw+Eu7hDKeUUNospRIL0eP+VEInqfDq3HmW56M8tJo6bCNDlvQ7n9uhCco6
         7xVwYX9w1yatLAR/32w4gD5DyMs8w2ffI3gKBdlz5j7IZR9YvfCrx+J+/73aUNd7dE9N
         mOSST2robZiDQTb8SnJ2uOOrUquRxbs1+7E211dR692hh4erYZOPI6ifJFcEIzQyf+KR
         LiBVTaUiLz7ZNIkQSmzAOx7Va8dSKsQr7c8Y+BU4Rg4nSRV1vozUfa1owBn64wYkkjJ7
         KzHBeCdV+8LPzzCrZJlmbq9ykEPSJiT1zaLH9KNVmmsjbn5Z4f6kJBK+ag/cYmBZ7ehI
         VkZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=U0A6IXzS8YnKUNw5E47iu+Kpl2ECdYRHrLl8CUekn60=;
        fh=yqqA7bbJQhscj3+9FqQDd6hthFy0f2ko5yWPYAjLgck=;
        b=O1Rf3piVdMHma6taQJkVW6T3+kzTVi8AwjKTy4bvanDHEepa6J1D4dLgBHIYjfS+2k
         VIZOEw+fFpg08svdoVc4bIlFf2tbriTR6huNe7HN3/FWoM1J0H2GmQN+ptOtWx3ZBe6K
         6VeKiOV+d9sjO7lxKCk5UVYCQeisZSjh1XwW6NZJeR+ekSH8z6XPYyueHwBqKfO5k8w8
         wHHswkwfOQ0gILNswnIc2KaM7v4y6w2EQ77z11cmJj7ufd2bYRagPVpHFgUG1iy9OkYZ
         hUOri8EIhDGs61/b2wmbwwYvksUD2cPy5Nu38KlGaYTZ5/a1c3afHgX8PygRl13i8xPd
         R9mQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JWtCvJ0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976c0a18si649926d6.218.2025.02.26.12.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 12:50:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JWtCvJ0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnOMU-0002dc-MF; Wed, 26 Feb 2025 15:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnOMS-0002dN-TT
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 15:50:32 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnOMQ-0001qU-JQ
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 15:50:32 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e609cff9927so125051276.3
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2025 12:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740603028; x=1741207828; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U0A6IXzS8YnKUNw5E47iu+Kpl2ECdYRHrLl8CUekn60=;
 b=JWtCvJ0tr6Yqn6UAZhRIld6KVpkm7VX8metW2iXtpG8mVwlNdLLsmM3LQnWPsi+nqE
 C9Qu+dj7kfMM4NK86zmHRtmKV+MBcrf9wZ6TwLpO2LqEPwuBa5skuUKbDwbIJWjBaw4O
 LMzkJV4SBWOejNfmLRZwdDuqhnXlyCJy/E3m9ZAKN9HwN5Ejq/Va5mi7m6445J760yjG
 28whrj+rGMoiStA/j38JtxMB34MSyQqcIL0sAGRGCTdOEWpBWo7QBk7L5SfnfXuvJyTv
 kkRYZBAv9VNEusl7VMNoxwr2hX/CxPDjvvqOGhGgubBtx5vSbjDtFWO0HXCONhIm0h7g
 nj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740603028; x=1741207828;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U0A6IXzS8YnKUNw5E47iu+Kpl2ECdYRHrLl8CUekn60=;
 b=iIeRLziAjF1FQd9KN7XYn13eIcqidTLBwZq/O1Yy8taClV8cpoBkyMQAW01SVkgCh+
 0VPPoLgv2vfOpXitQFZNnfB7bDT346HdlS/1aHVZw53rlOqSTUInhKLhmtcv/vGpzGhn
 Lfn+AckhLwEwCGyEjeHTcUnm59I1v3hFO/lHzA02HaFi3WxgCJDBy9gV+tfLc2MAGU1j
 TIwcXuM4L7r/oK3dTZ4IsKBPz5wxbbXj0pM8lWl/DqqGiZS0+kCClGKkK/R4CUYs6UZE
 iQfC/SuIizK5DYTOJ2VaJLoo8pAm2KQ+xD981b+wCi1Wq055xdOKibLVngSmZVTgJg0d
 3CPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvmFtTnxJbOnFUG7rraYdoW55MpWUc5mQNzinE8iAnGBThbFSH9G96LmZ4EVUx5o628lzBg19hfQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy83I9F4cTaxdo+e9L7OwfIR7kP1fVRg0fQKWnoxE4P6iZ90vNL
 tBQmI19WhrH9Y2HWb99hO2We7iXXM1iZ/RFF14GseAagWIZh9npJsyDLSDYt+kP2U4DHwIaq4Kf
 eFHZhjjgbPiazUZUZgBBlAPoe4PFHJoPtBF/9xg==
X-Gm-Gg: ASbGncuYuYeXqdpilumpVbs9JEcBN7lM9Ow3xlROb1WWqa4d7aES9N7e5Y+oNZVTSHL
 Y43ChA5flsEZcs/VvsShbVWJujwxTNPPecoY3/PBH0IqAkvXOVuLpakep56Ggmu6qvpoVnikf5B
 MZP3gs+SLp
X-Received: by 2002:a05:6902:2748:b0:e5d:d6b8:2318 with SMTP id
 3f1490d57ef6-e607a54eb03mr7771616276.34.1740603028638; Wed, 26 Feb 2025
 12:50:28 -0800 (PST)
MIME-Version: 1.0
References: <20250224205053.104959-1-pierrick.bouvier@linaro.org>
 <CAFEAcA_sz-_6WGCQ=4kC2vtK2RUBXbAtMVzh3iZsp0xmNbgaxQ@mail.gmail.com>
 <829e9fd0-2d0f-45e6-ab89-d933d344cfe2@linaro.org>
 <CAFEAcA8BHzA_P7yX+cDMb1WiyGTzkh6xjvam4RHs5aoM1X6mkw@mail.gmail.com>
 <5c25f67a-2677-4162-9477-f51f230403b0@linaro.org>
In-Reply-To: <5c25f67a-2677-4162-9477-f51f230403b0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Feb 2025 20:50:17 +0000
X-Gm-Features: AWEUYZlSUyybVdgAACEr0gQtv_ujFwhK5De7RqbKJE6ZH21vOsXfQ1pZGzHtdVw
Message-ID: <CAFEAcA8jzYvCLxDTybE34K5DxQqOG4-m8_-oNwiATVBHYbEV9A@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/npcm_clk: fix buffer-overflow
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
X-TUID: qcoXlidzi9r6

(edited cc list since it's moved away from a discussion of this
particular patch and on to a testing/ci coverage issue)

On Wed, 26 Feb 2025 at 19:03, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 2/26/25 03:50, Peter Maydell wrote:
> > On Tue, 25 Feb 2025 at 20:57, Pierrick Bouvier
> > <pierrick.bouvier@linaro.org> wrote:
> >>
> >> On 2/25/25 05:41, Peter Maydell wrote:
> >>> (Looking more closely at the cold_reset_values handling
> >>> in npcm_gcr.c, that looks not quite right in a different
> >>> way; I'll send a reply to that patch email about that.)
> >>>
> >>
> >> It may be a hole in our CI right now.
> >> Would that be interesting for CI to run all tests (check-functional +
> >> check w/o functional) with both ubsan and asan?
> >
> > We do have at least some ubsan tests in our CI right now
> > (eg the "clang-system" job). The problem with ubsan coverage
> > is the usual one that we already have too much CI going on,
> > and it takes forever and we don't have that much headroom
> > for adding more jobs.
>
> I understand the problem behind spending more minutes on this.
>
> However, looking at our CI, we already duplicate functional testing a lot:
> buildtest.yml:functional-system-alpine:
> buildtest.yml:functional-system-ubuntu:
> buildtest.yml:functional-system-debian:
> buildtest.yml:functional-system-fedora:
> buildtest.yml:functional-system-centos:
> buildtest.yml:functional-system-opensuse:

I think that these are mostly testing different target
architectures, e.g. functional-system-alpine tests what
build-system-alpine built, which covers avr, loongarch64,
mips64 and mipsel targets; functional-system-ubuntu
tests what build-system-ubuntu bulit, which is alpha,
microblazeel, mips64el, and so on. So there is less overlap
than it might appear.

(Some of them complete pretty quickly because we have very few
functional tests for some archs; some are slower where we're
running more tests. e.g.
https://gitlab.com/qemu-project/qemu/-/jobs/9213571833
is functional-system-fedora completing in 7 mins because we
only have a few ppc tests, but this is functional-system-opensuse
https://gitlab.com/qemu-project/qemu/-/jobs/9213571852
taking 27 mins because it's testing x86 and aarch64. The
corresponding build jobs take about 30 mins each.)

> Would that hurt so much to have one configuration enabled with ubsan and
> asan, which catches *real* bugs, and potential security issues?
> Yes, it adds overhead, but it should not be x10. Around x2 to x3.

You'd need to have a duplicate of all of the above
functional-system-* test jobs if you wanted
to test all the guest architectures, I think. So it's
30 mins build * six configs plus 60 mins total for testing.
Or we could convert (some of?) the existing jobs to use the
sanitisers if we needed to economise on CI time.

> I guess CI minutes are cheaper than engineer ones those days.

You could make an argument that it's the other way around:
from the project's point of view engineer minutes are cheap
because we never pay engineers, whereas CI minutes are
expensive because we must pay for them out of our project
donations :-)

-- PMM
