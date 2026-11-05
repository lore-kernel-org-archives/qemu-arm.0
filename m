Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3698A606A329
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HGis64OI
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOxxk-0001wf-UL; Thu, 05 Nov 2026 08:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOxxj-0001wJ-H5
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 08:57:07 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOxxg-0006fm-JG
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 08:57:07 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-8b0a921ee46so18350617b3.2
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 05:57:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793887023; cv=none;
 d=google.com; s=arc-20260327;
 b=BjtMTCCRPKGcCDzazoKXuegw6p/LLZULPj6kbV7Nd0bNQY3dFJ+uKc8F6wNPpmBt2J
 LnocRRAFTuZ6mJA33pHmCU6h0RVN9QYA8dG3Bqtq10JYNN3JFeXR5HWfkP8TYJ0/TDYA
 Hrz0+BFZl60FpuWoYELu7OtQeuTfzvdbdAkdKskzd2XPwQYxl97/al8vlWd45Y1vBTea
 2tzjb+h4upcGZuGlkDjOfNjoY5o2mHIFuTXYQEt5uCjUoGcUMXDsetyBXjmVbr7vjAG/
 /oVC+WIg212O4htQLesuCeOlAkNXlYXdvBdzJ5+dTFqd3eWIZNzvG3HA3McNSq4JEceI
 eeAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=X7wPc0v2tmOL6ug6XoxITK6uOzMeO5kpFhk+t5sbDWQ=;
 fh=Ekld/LqLBWNaCYeHUrk5cXJATuttYgPAVbsbBXa/vUQ=;
 b=S19Kl4IzTiq2a2Do/cfxFk/z2P/wheNgGBUt6xoB5NkVW8NGvQuebFGwOTpEdLX6uW
 qiApIt1YuPqKqYDgJx1E9YuGAuun95F13U4JJ2dCM01Hqx+p5JBX39OQdrT5GBWAZq/0
 HnNIj95xqD2b50d0DF6appGVpQSEinubOyE8abkIVewE+mFLHeqDMMi/mjKVrQpuNkKb
 9x8KErKSpMbs+cQcG/LFLb8xc6XqrricVxEnFJCI1Oez9TouwNeG1PTeQ7QFhVHEKbC2
 Wurv/lHkXYac8hrxIeK/V8B+91VWRNe2IjXCRfwjgkts+xZj8GmOG1UnQBWjlaxoTSd/
 NdUw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793887023; x=1794491823; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=X7wPc0v2tmOL6ug6XoxITK6uOzMeO5kpFhk+t5sbDWQ=;
 b=HGis64OIc15/5kW9d+N6Yd6Ym8Mg1GuNq/jR7ZV72HDu4D+Q8SaXgWBVXklq8woTpQ
 h1wADIe1a0g55z01ekHXXaYIAdYfWDmzMdxiNfp1RBk9qBPK0orvu8zRcGYeWAns/oFL
 GsoK/KUTcy+Hv2tFCzer1sKdhx9ORp7EZ75sD8E+HpGj8NYtPkEGd3U1spY2rU8e2nQA
 4ikpmlXgc4lH0Ee1WxJVjnRsnyHmaO1M2qz+/WmnlCcYA5BhKgIUYVdCe/jKUZj2Xwo5
 sHS+Oy1TccDHLvz1SHr/r1p2uqroxb9QvpnA+GtIq9fSQpZRMWg4rCXSdszJvJINgCVl
 r3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793887023; x=1794491823;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=X7wPc0v2tmOL6ug6XoxITK6uOzMeO5kpFhk+t5sbDWQ=;
 b=q3Hk94dd7h3xGq6abAD31o/vcVbsEyDVa4jRjhAziJMnpZMH9c/v7XUTuAFb6cDLp1
 AIKZUUeZ8DBkLoC2VhmK5myC1qinrxTfqtJn2eHkgUr/OSFHEIe93nt/VVZOirzR+E/1
 PqWuXfs4KcW71NXtKgaTmCE/VJkw5dsJ2YP563jr+eQjo8cBXlp+YNnBXEtKRHyomeYB
 zShsjMf9qOu5HJfSWBLGCPyfSYor9hbe64xlr20WpNSe8fTN+2eIYFMyOzxE9P219VHM
 AmNXKazYjAC3aqAikiFbW5Wadvu4O7tGq2Xeiogy2FnCpldFyskE0pk7J2eKTD6R5F2D
 6Ncw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy4+OScK8MsHd0WWsoHwg3M0E+aPIy/upJ3+/SPEUNr6O97RT7eLLWnePnv6V1MqINo+tCKxKRavg==@nongnu.org
X-Gm-Message-State: APuU4Z9rP571DpkeAg3x9f7txTnKZEGnLAglL2X9TUCZUgfBh5lu1wAB
 Rj5TuRsXa8dR9Yn0284bjiO1g/Z2rjdCmGlbEA3rjxUR8k6GWrxeUWuEE45tvxFNC4rlLZ5wSEU
 8GQT6V7h+z0quhESA3tqjfZtgIFw7w8BYSZXRm3bubA==
X-Gm-Gg: AYBFou2EB1epml9g0uC9PmUNvjRnBtmjdLsoPvsUkVJTRTKzdiJkRyXuJ0wiU90d/dU
 DmFTCbXM5utgz9ZdCejj+GPaEqyp7v4qmS0NMHLi/pF5wqrX71tcR1xPM/TW+YeQ7zuXJxFt15/
 6XGWHetMKQVHGEIugYE3FN1qG/4MeSKMQAoFXZvYWnElgRmybAsMtSrWA45KUmlv5FDajyqWsfD
 +T7eD2PHEbf7o2Xxk803FmaoSQbv22eyvwcSZQNBhP01d9lSiunz+UUFHSEupsxjrSWDYpZUkOw
 gxEgNDI1eiaV4ZDBej8mVy9CDXaFz1ESTZSYlNpWn/31Aqi0jPEeWjOqPJcD0l4ETjbX5keqhjF
 foSBoXiKjabyhh1EAkxVmyaDuiMPC3F0WjeWitAmUNVnZTtgV4J7IrvQ/6PdKmuuSStXPQvS6aw
 0bvh8JKFMQXvvDiqN3Q31LmtBKr9GL/un9D1TzLvoqSlU=
X-Received: by 2002:a05:690c:91:b0:8b3:2b8:85d with SMTP id
 00721157ae682-8b302b80aa3mr34223707b3.52.1793887023022; Thu, 05 Nov 2026
 05:57:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031164009.2048-1-luoyonggang@gmail.com>
 <20261031164009.2048-7-luoyonggang@gmail.com>
 <auxgsFyzv-5UiyNk@redhat.com>
 <CAE2XoE9J++-BHL5BDx4_jxuto+xwVmvFS3F-hE9gLbgfUmaFdA@mail.gmail.com>
 <aux5vwTnbV3cXcFX@redhat.com>
 <CAFEAcA97kTiGVdPO-QtEkQ0+AuVS1z3Ctfc-q8bJJnEqFwavCw@mail.gmail.com>
 <auyJOk0bjHWO4-FO@redhat.com>
In-Reply-To: <auyJOk0bjHWO4-FO@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Nov 2026 13:56:51 +0000
X-Gm-Features: AclHuK8LD2mTPDHojJSa9J_FAUjT9tU71wtHJ7lNPvkJzJHf9yuLTLWXNSjVe9s
Message-ID: <CAFEAcA_T+WtgKYU5QnaGiuAyZYpAmj6vrzvd_kC8FAFqP7i-mA@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] target/arm: register separate max-v8 CPU types
 for arm and aarch64
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, 
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Fam Zheng <fam@euphon.net>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 5 Nov 2026 at 13:48, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Thu, Nov 05, 2026 at 01:45:00PM +0000, Peter Maydell wrote:
> > On Thu, 5 Nov 2026 at 12:42, Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> > > So that essentially matches the historical semantics where one
> > > CPU class magically changes its behaviour based on what target
> > > is running.  So in that sense, it works, and is no worse than
> > > the semantics we've had for 'max' models forever.
> > >
> > > Splitting into 2 distinct types is worthwhile if we want to
> > > make it possible for the aarch64 emulator to support a runtime
> > > choice of both 32-bit and 64-bit "max" models.
> >
> > What would the difference between that and configuring the 64-bit
> > capable "max" to not have AArch64 via "-cpu max-v8:aarch64=3Doff"
> > (which should work today) ?
>
> Is that really the same result ?
>
> It seems like aarch64_max_v8_tcg_initfn does alot more CPU modelling
> than aarch32_max_v8_tcg_initfn, than just a single flag ?

Conceptually it gets you to the same place -- a 32-bit only CPU
with all the 32-bit features turned on that we support.

aarch64_max_v8_tcg_initfn() sets up all the 64-bit-only ID registers,
which is most of what its code is doing. But the handling of
"aarch64=3Doff" then clears them all out via arm_clear_aarch64_idregs(),
and even if it didn't, any 64-bit-only features are by definition
unreachable from 32-bit code.

It's possible it might not get you 100% absolutely an identical thing
from the guest's point of view, but any deviations should be minor
and I think we might consider them bugs.

There are some minor UI-level things relating to CPU properties,
e.g. "qemu-system-arm -cpu max,sve=3Don" gives a property not found
error, but "qemu-system-aarch64 -cpu max-v8,aarch64=3Doff,sve=3Don"
will run (with no visible difference to the guest since SVE
is AArch64 only). It probably ought to error out complaining
that you've asked for two things that conflict, but this is
"minor bug" I think.

-- PMM

