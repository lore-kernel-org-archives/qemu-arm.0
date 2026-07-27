Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D158C531C9
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 16:11:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woNul-0006mm-O3; Mon, 27 Jul 2026 12:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woNuN-0006PN-Hb
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 12:10:28 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woNuL-0008MG-Ft
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 12:10:26 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-66771ded50aso3637171d50.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 09:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785168624; cv=none;
 d=google.com; s=arc-20260327;
 b=rIHqPK5PUymnoo5GwVJSheDvtYvgqfJHNcnbHCefKJ7CV9Oec+GXzymEQFlMvyRtlO
 7PulYaeASrkinjmJFAFRqb/nDkw21smTT9jGx0LQC+8TtRmqQwkhOVloQhL6z6zO+vjQ
 VrMhzDkMjcEVohwNaB3Iua2W5csoDGNvWEF1eqdCh6CZSZhYp9lKDluqbDNtO8hUrpcG
 XaZYQ5H9SzYhjwXW0fgbcF/qtUViNcf5JLmJs+BpZRaCSsefAbPakD+N7vigcvyUjdcy
 kL7QjQ3heuD615MgyqDP1hQ1NwcbfFuWCmWzWCjuFKLsjjWIvpOueUMELdt+RqEuF4UB
 BnVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OOsxF6EKGXLBykC9ScLiUIhGyadMeqkWsBstlwVytuc=;
 fh=xDAZstnxU+paHo6U5hnOYNOWJtJwqysS2sZfvLcVIMs=;
 b=riX7rEj7rexrq2kn7OLEOmmp2VmyFirRc6+N5EFdGMnr6why3ettcXTtLEKYLlEtfm
 ROPohU/MdWQaf3zd/WaWmiWpV73L/W4mxSM6lORZlsF6hKZQRWdgYAlwvatK9cBIsK7t
 yG2wB3SqPaFFoobdnZnEGv685hkmD/4YewPL4Cupdj6F2ETi4tvIj3tJx5V1HUU3S4D2
 DOhrYDa7GkTwLwYnYLoGaKlK61GNmbTmsGQ+I37FRYh/hhkzBQCFw4fUmGDNJaH8VzZ+
 0CGf6n4e6znRL52ipjYEMu+EvkD0xW2QiFmvaqudTeimqEJGdS7hVmoFm9B+1O/L1Gwz
 RFNw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785168624; x=1785773424; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=OOsxF6EKGXLBykC9ScLiUIhGyadMeqkWsBstlwVytuc=;
 b=ptlPXRXAiKvuvJeBUG0NiS4Ordkdc1fguUGcRPukmBO1QsLULciRNzlL/0V+hcHiJE
 1NME+VOCOitKPU+Nw0lkyFk4EBYoXFsiPe8F0wJceH227HlLLRg2arKV8MiwaPny6Ymq
 s7CzmbZliUnl04PIdzYK7DqYNqAJJoFwOGY1Z5gdQ4L3eoyl9nVkxdjX8IZcG3qodb6w
 JZO8AFi6JG2Bv/KMiZRVTqv+2LiGRyPm0zL6kfgeITMLnD4ue5RrsNDo9XBld1RUi0cT
 2gfLsNCYMEWkQK7JDPTvb2XjEsHGRuUCszlCiDePuy0rEp1kuyAAhQCKlMWQ67c2VrSV
 oz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785168624; x=1785773424;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=OOsxF6EKGXLBykC9ScLiUIhGyadMeqkWsBstlwVytuc=;
 b=DO1Ps06gJT407C1rMQFzQCl8wJCoPZeJ9PJGw5oWkv+vJgdLUJ/O/RupeuYTudgaEW
 FpmF2t0OwCHFrzRFIA/jDtw/KPLJ+yEpf6w5tAB+Saj974NXbbJEmaaUDJduHMhmM0JV
 5p667m/2WuJkEXXBcqVXpsoUx9rAHgCjgVkQqUTrFr/b+F6/068lrAiP+farLMVbYead
 c6g4MNARTNPvPSyT2/xqv/2UFtjb5CZDVs0emyTajPvKs9P0BAD4nSkUTaIjDHZWrqQQ
 0Z5WzttEi+Cx+2vV1DHNBAVrMBaBAxgtJmbyy0QExuqj5fMJ/nffPADipPA98NxK/1qC
 y0jw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rps2j8YR+X6JCFq8KbkAYHVCFAXR3NyUE65p8IBKE24b0banAwnhALJA/Iep+y1w9J6S5GDOyEoJA==@nongnu.org
X-Gm-Message-State: AOJu0YzUQjLq9jcqRQOXeecJL2B60/v6zE8e+3oSHjFOnt8YTv+i2PC5
 bOR6PDbIWprUnwcZOSieha6PsRLdUmcMDifIaqdDBGIGV6bsOjGBMUA/ba9hHmvmy595Qt4gGn7
 ZQrFcYaFPD+Uc+9LPiRtXVw9W8mLquwGfNaR1HVTLqw==
X-Gm-Gg: AR+sD10qdLdievvOMeXFlFIzUwNE1nKPBvSlXzgS8efON0VlSu6KoKLREsM9zYjjMLb
 psWE5h6SEp9L78Cd/bzODbiWUkOD9nriR5h1FfsA+Qfr6RRxJNibnAyccGgfRQSAdXoxQQDqm5v
 DGmZuZ+6uJou1vEO4pG3LA54FdT7CmWUvnPZysheH65wheoWlRISinW23/PTmIwBXYPXgcEp/bR
 ZL/6z8jdD76izsz+2W2VrxKnO0ZyM3JPWLnvcy0UQh08qMEUbzBSUtSMkcP8ovRsae8tB5HUkZe
 N+LqBXWsFVkBxW2SfGFCaKw9AnLSWXK6fU7ulYBmQayzekI+28SWRame72uOArDl0udv72ZJ35Z
 Kcuw5sgiAxn+2xSor2YeKKEyXefDf
X-Received: by 2002:a05:690e:58e:b0:668:482b:af78 with SMTP id
 956f58d0204a3-668c7a76831mr2025073d50.28.1785168623684; Mon, 27 Jul 2026
 09:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-pmu-v7-1-939518c349be@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260629-pmu-v7-1-939518c349be@rsg.ci.i.u-tokyo.ac.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2026 17:10:11 +0100
X-Gm-Features: AUfX_mymxx0UeI3zaYN-XNOKfFhNqx9ca_fv4qPFNtyAB8qHCBXWywBAQqhTdMs
Message-ID: <CAFEAcA-=u3ZgiAXRNWM1VCMv7FYG2YP=oirf40yGo--p0BSfbg@mail.gmail.com>
Subject: Re: [PATCH v7] target/arm: Always add pmu property for host and max
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, devel@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Mon, 29 Jun 2026 at 09:10, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> kvm-steal-time and sve properties are added for KVM even if the
> corresponding features are not available. Always add pmu property for
> "host" and "max".
>
> Note that we still don't add the property for other CPUs that lack PMU.
> This is because we do not know what a PMU version should be enabled
> when the user sets the property to true while it is defined as an error
> for the "host" or "max" CPU when the hardware accelerator is enabled and
> the host doesn't have a PMU.
>
> This fixes qtest-aarch64/arm-cpu-features on the hosts that supports
> KVM but doesn't support PMU emulation.

No, we should not special case "host" and "max" like this.
The "pmu" property exists only if the CPU has a PMU and it can
be turned off. If The arm-cpu-features test assumes that the
host CPU always has a PMU and so always has the property, then
that's a bug in the test, not in the code handling the property.

-- PMM

