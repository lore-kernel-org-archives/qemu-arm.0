Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245D8E81A48
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 16:57:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vs1ud-00034z-CG; Mon, 16 Feb 2026 11:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vs1ua-0002oV-8p
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 11:57:28 -0500
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vs1uY-0003ep-7S
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 11:57:27 -0500
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-649e456e8a2so2787274d50.0
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 08:57:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771261045; cv=none;
 d=google.com; s=arc-20240605;
 b=Vov/QgSIxy1FBAb4+ENuZZawp2nZGdu48HQfca/BriikiRkvcG8ek104AeceGQmEPR
 3nqckieg/RPoYE7FiAoWnnhwDPYAwZKmC0q7kxjkIemZpLy/1geu1TQpwZnXdOHhyHyK
 woveRtfAdFw0rumq/WsHqKA4rTyaxM7fOrfFO/YpDCC4gn8fVoEc+j8VuJglGzUBknjb
 dJqLnOkd3ZiZSFJCU3zgUV+OH1aOP5O0IOf69B4QA7f/VbEDE9gw0QvyrEo1njnDQVzz
 tDyZyAA2A7p2P1qX1SnS232+0fPkRvWHUSy/AktC+6PZbmvV7KAvjBfq2a0tQzxzP41l
 mB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=paKVC9TUcSk7P920JZ2ahUybE/tRhTKxibcgbZBRmdM=;
 fh=pg4+ju+ARJAoXSuW741uUWdZZl14hX5QYdKw2ztUtkA=;
 b=WpsPz4Me0TmQj+8WaUuLeNu79pQo9OnSK4g8nj/5SIBH+gMWDCA2Q5S0YJh2TW/fj9
 ejYPlU0S5RBthx/Hr00ixOR12W7h3wnumRw6KiTsenIGdnVTBFl4tGmL+JF1Qf1qTkpL
 RzfkXgDFe6J4h8Qbqun1eNRsqpiUvOVlHfu6CzWixto4yBbhrggz/gc5n2P7pv89Lmnk
 mAFy4Ut0CtqVsy3KnvdyeKa0vHNojgHRqdwuAqKgFuxS14JKvTJc51jn/aRx2aKIoHwf
 42JDfuGdWb3rRTsH8//MgP1+z/KkZOFUOUpXwLB70Qyf33qx2P5GEIX7kDEjZvph57sk
 h1rQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771261045; x=1771865845; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=paKVC9TUcSk7P920JZ2ahUybE/tRhTKxibcgbZBRmdM=;
 b=IOo6yUTSKQfQ9y/iyIaty3iONembbidXtqQ/wGkg8i4CKvf5PxGjoGwf5uyuBSJq7C
 CjUQqXriF0A6OKk6vs3BPcDiwhjWQoBtaghl5IVkDoWCQynZb3ZWGpJqXo+jrMaHJPwA
 H9pJSbr/YKKaXFORhyf4EaJpTBmllCSHbZnh6lywYDhE6wCoGW3gRA1k5PsnahZyC+L4
 RGvubLLoz0u785W9awagVy4isbFfVtilYxxfwFTrwL2tp3BVYXxsUdBwaR4cgcKGbf2+
 ilqblVh99Z4v4KGexa+XmM6ISnFqcB+4c1LgRbNtYkWZybxnjF9elgQZFEBE/que+NbS
 Wwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771261045; x=1771865845;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=paKVC9TUcSk7P920JZ2ahUybE/tRhTKxibcgbZBRmdM=;
 b=LIvt7iJBcboT5TebdDPtoHLPTbnAe7+SclR3mK/UN0nUvoBAnvU4Fl8QFGMuo+S2RX
 G/sq43dzH74XX8BFHftcioFZvon1E/CRmtdsoKYGBmY+1SaQIfq+WGk2oyzYbh4tDdZ9
 C7F6m4cLNsSaOuEqoRqGfhyUW1env6RBVfOGVE3AbKkDB2rqWXnuN19LKt6+fWNZGvcR
 XJfrbRtQlpQawO3AARYPIwR0HBhoQsP9gpa3ekb3FUB0D6N7ZqtqpDkaCHJz3MexaVYZ
 VmZQfUEr9CAv3+SG9LoPBpms+nVsg8ZlodBoI7SP51SR3EyhQ9jwBUMfUZrv3kQLiFas
 ZXwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBxx7AtEyc+vLyteqvQyS/r05SsdvWlJ9+oaxTkv4tjHVbzGJBdkqZ9y1zfuk05RSCcRAZSZDCBA==@nongnu.org
X-Gm-Message-State: AOJu0YxXJNPEJdu5uKruOYS35n5voo1jxEehhq5mFSym4X32KZfRkpKt
 Dlmt/HACyntZwwAsabqAER6B7Gv8dRdVwGIHxJMRaOCql+GcmWNKUQn2SUx+lhsxGJZSy4n+I5E
 VYZr+7FnU8jc2FPGpt0jBkrj5ITt45DvbIcf+U2pdHg==
X-Gm-Gg: AZuq6aJcGFHm2rFcVk32BDTuthH36YriMgwnFpvOisNCt8J775TIrml3DI3BeyNrxQ0
 KlWdC3Mu86fqbsoj4KHzNAbMjwCkOshHt+sJ8dhUGpeY11nh3YyPSL8A7fSZ+2S0heAet82nLr3
 Lm5UgtjTfxygI4aXWAUz6WcLqNy+k2Dg7pmZweJJOSuGcVw6gaeFE9R7muSxPDK4VhfuGymosFj
 0sePgdZh0Hy8li+e0NJZv2eRr2PzRw1jBV0XVUX7kCfuvv4hs6JH6i4XN6LM8bzPga9Q0Krxv8l
 vTT6l3j/eK+05hbDbwQXJDkE0DDoqdXug8GZxo+8b05LQunDRCSZfFb36dnfWsoUD0E=
X-Received: by 2002:a05:690c:e3ee:b0:797:db54:b856 with SMTP id
 00721157ae682-797db54e981mr25179517b3.35.1771261044892; Mon, 16 Feb 2026
 08:57:24 -0800 (PST)
MIME-Version: 1.0
References: <20260213103942.142823-1-skolothumtho@nvidia.com>
 <20260213103942.142823-4-skolothumtho@nvidia.com>
 <aY+jVfUUTawwPN+f@nvidia.com>
 <CH3PR12MB754850BF9EFF16CEF6130ED8AB6CA@CH3PR12MB7548.namprd12.prod.outlook.com>
In-Reply-To: <CH3PR12MB754850BF9EFF16CEF6130ED8AB6CA@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Feb 2026 16:57:12 +0000
X-Gm-Features: AZwV_QgJH3MO-CdothOfHKXMKQ892BibgmYCYFiKzE9TaddadT_fLaZ1Xr-3oN4
Message-ID: <CAFEAcA9h5_4OaKwJe3ca4o5YfMTn7HCsecjKLWy9qeF4+GF04Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] hw/arm/smmuv3-accel: Allocate vEVENTQ for
 accelerated SMMUv3 devices
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, 
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Jiandi An <jan@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, 
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>, 
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>, 
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Mon, 16 Feb 2026 at 08:58, Shameer Kolothum Thodi
<skolothumtho@nvidia.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: 13 February 2026 22:19
> > To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
> > Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> > eric.auger@redhat.com; peter.maydell@linaro.org; Nathan Chen
> > <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Jiandi An
> > <jan@nvidia.com>; Jason Gunthorpe <jgg@nvidia.com>;
> > jonathan.cameron@huawei.com; zhangfei.gao@linaro.org;
> > zhenzhong.duan@intel.com; Krishnakant Jaju <kjaju@nvidia.com>
> > Subject: Re: [PATCH v6 3/5] hw/arm/smmuv3-accel: Allocate vEVENTQ for
> > accelerated SMMUv3 devices
> >
> > On Fri, Feb 13, 2026 at 10:39:40AM +0000, Shameer Kolothum wrote:
> > >  static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
> > >                                 uint64_t data, MemTxAttrs attrs)  {
> > > -    Error *local_err = NULL;
> > > +    Error *err = NULL, *local_err = NULL;
> > >
> > >      switch (offset) {
> > >      case A_CR0:
> > >          s->cr[0] = data;
> > >          s->cr0ack = data & ~SMMU_CR0_RESERVED;
> > >          /* in case the command queue has been enabled */
> > > -        smmuv3_cmdq_consume(s, &local_err);
> > > +        smmuv3_cmdq_consume(s, &err);
> > > +        /* Allocate vEVENTQ if EVENTQ is enabled and a vIOMMU is available
> > */
> > > +        smmuv3_accel_alloc_veventq(s, &local_err);
> > > +        error_propagate(&err, local_err);
> >
> > It would be cleaner to have:
> >
> >      Error *local_err2 = NULL;
> >      Error *local_err = NULL;
>
> Yeah. I had a bit of back and forth on this. My thinking was to use err as
> an accumulating error pointer in case additional error paths are added
> later, with local_err_x used for intermediate calls.
>
> Either way is fine I guess for now.

Generally speaking we should try to stick to one of the
defined standard patterns for Error handling in the
big comment in include/qapi/error.h.

Yours is the "receive and accumulate multiple errors" pattern, I think?
That works, but do you really want to throw away the second error
message without reporting it if both calls fail?

Plus, from the commit message:

> Also, rename the local error variable and refactor smmu_writel() to use
> a single error accumulator with error_propagate().

If you find yourself writing "Also, ..." in a commit message,
it's often a sign that you should consider splitting the
commit in two.

thanks
-- PMM

