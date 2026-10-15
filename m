Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBFECC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 13:03:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHL7G-0006gT-5R; Thu, 15 Oct 2026 09:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHL7C-0006fu-TD
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 09:03:23 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHL7B-0002gj-Df
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 09:03:22 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-8ab432273c5so46430577b3.3
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 06:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792069400; cv=none;
 d=google.com; s=arc-20260327;
 b=jJ1U6lCjb4jRJKnB3hchsEcv/z6lT9WQXK3jhrHfod/xghvpfZv2C+JyapLeOKh2Jd
 ARpQHMpCgOdkmSYRxP3tOwoe5NeFl4cyGw4PuYq5Jm4PIGv5FTKTE2/YAUq9MQJZChtY
 lzWOZDcnyqfeRhQgO8FCRcYabGn3AMEf5jEQfBdYCrKNq8+Z5l5VsKyBWoudFTRrLKBu
 Q8/ip0+Qq4dnN57QPuOu9QAtoQvVbwV84aHzBptK4EWDlVVB5txkoSz2o0c72zW3+ZcG
 YjBJHxib+MWwXGaUvrDeVC3HfaYnjD9tJKYTlejvslxvi70o353HzivgJuzGYVqrhbSe
 izwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=2XhhcCKa83qkhWqWSnAh5aVDUKVrsLbFwX97HYthI54=;
 fh=OhgQ4ETKf+/zP+rQ22iu6L9IV885hYVmQJJzEftdJvA=;
 b=QTtzIVCAe7Ydfa5I6R8PRCrrEId1ayTMatjV56GCMv/zuoT/P04onp3xDWd8WmXsUN
 TXcxV/oL1PTCI2JyZZ4sIlK8YnkII2nIkOB6eadBBLsw8quj92k331Oaj8Pwr3XphekD
 IvTPASKZ1w3L5nkw2mQb/x77bvBirFtOE2HM5Tx57tEfp4XHIFR3JthSKMrwPHGCymBN
 X0A0yeCmoj66ZeBDMcMmwWyBADC4pLikX+aSIqw8fYxzhWdoARGq2dWlB36LxPmob7+8
 hYbDY+cp2ll3NnlBfPkVQI26zOa3DHbJ9NhM5tL6l+YWqqit1Griz9HaDyNJ1883LNPP
 VIwg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792069400; x=1792674200; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=2XhhcCKa83qkhWqWSnAh5aVDUKVrsLbFwX97HYthI54=;
 b=f+er6R/27u5sH3P+7r8bL8i0c8MOGzzz0t690lKgc8TWRDi7R/BrYybscCd/UZgYGp
 jb3bgUsU/V+GpvRiZkaiW5DM1Naq91hUyTZbba3aev5cMDW2y+9M0GM4087/bWBVd1dq
 fDFswQqVoYQS0BINv6JYuVVQeRREcDVK4uQXfQtuT0rme5fMb64XUCp3nnU3qbr+4k8r
 ex9CASH+NGmtpWpxIswwWt/AVQug9VR8iUkR4dcLxEtisvF8ETFmfB1KK94uFM6/jQmm
 Rkem7lE/l2cL8rij9Q6aBwW74JwPGJ1J97YZpYqetVtLMnSJa3dhUJ5xsB3toug+pim/
 t/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792069400; x=1792674200;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=2XhhcCKa83qkhWqWSnAh5aVDUKVrsLbFwX97HYthI54=;
 b=BywsU319Kbnc+143MZGECbbuXg5ZJSx+vWc720BwO5ae4mXrevRPOQ3C6T3gJHEiMa
 zF2UfFNGFkIjJWx0gEHKXhJUYxJbiiwF3bOJs9e6iBTwvz647qcq2Ufgzpc2cWglHlsn
 AHghgCGgiH7+b7MJn0rpp5g0hUxcBzKgyEtqQwozupck2/ynAcV0vgdmZLWbF8RO8/Mh
 Dwqlzp65bgiHEfeTE08Rfyn/UPRB1LqTBbEx8mufA5VB3LOOZGQctHTUd/LPW43cZSsD
 CuMhejQjxSdF3QwU9KXEyPfJVsnEzisz8x9+GSY268Zzrsy5Tom/WEGETJRec8G7jdDe
 mBGA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwW+v7bVHbjVOvkjCTs26ldVHMOxqFv7BhLfU5xEvi++dR7VlIpidElCyZJE5oxX9aW7YAx8o/bng==@nongnu.org
X-Gm-Message-State: AFq9FYISzpjxQS2QjiXAG2VXDla4q79SxPXtFNMlM0ZVSwPJ9JeU3BJc
 zTQf5r9F044N5FKacqWMR9pvq6LO/LIs3YtFMRg2MSJZAQJQxXkJVnvUCH52HF92P7UJq5pPTEq
 QKJqykvoZDYQBg/TP3UsC+VRf8KTOzZLB1PgE0CfanrIIR0vO7k4zTGi1hw==
X-Gm-Gg: AYBFou0JRvUfbx0ckXxm1IP2ilOHFeJXgwY7b8P1pH0pAvSXNEH4S9mDPuLhbDyEyeG
 ME7u6lvmxjuwuVyf1h3E780FrscdE2GnLsaTFGzFq/sR0ChouNrl6EjlXdhfkX2LJiMpSZzjnbu
 Y//EpvWje1thehY0xeQur4ZZjcDOBQW/rqeWq8FBRicr0mmKydNaj0vJHsauF4xhFJBbQHqupIp
 SZUNvOXlYsTuR7jUoT5HXM52gA34DGB9agP+0cq8Zb+fsF31vUBpw2WvRYf+oX1iUnxhKR6npSH
 E8v2ED7tAw6bJOko+PoGt5yilJxcqA4JQxfrccCxWm40fBT+b9DxgVxqawuSrtA6VFUwg9PiHi0
 UXkjul6LYmaGtltTx1D84r9DfAakzajWVVbNhcfw=
X-Received: by 2002:a05:690c:e1d0:20b0:8b0:702f:1d77 with SMTP id
 00721157ae682-8b07ee5ef66mr53154947b3.36.1792069399564; Thu, 15 Oct 2026
 06:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260725012635.4925-1-marcelomanzo@gmail.com>
 <20260725012635.4925-6-marcelomanzo@gmail.com>
In-Reply-To: <20260725012635.4925-6-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 14:03:06 +0100
X-Gm-Features: AclHuK_aiOBfidFNao5RYJOjLgqv0T23QlaGj7ctXYIF4gBVa0j-3dlXvEKdsmQ
Message-ID: <CAFEAcA9DsSgC_rypNbx3h10XGTq2M-qoCgC2DPKEyNNOtADjQg@mail.gmail.com>
Subject: Re: [PATCH 5/5] tests/functional/aarch64: add raspi4b RNG200/thermal
 test
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, 25 Jul 2026 at 02:26, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Add test_arm_raspi4_rng_thermal, exercising the raspi4b RNG200 and
> thermal sensor devices added in this series: boot, confirm the
> RNG200 driver probes it ("hwrng registered" in the kernel log),
> reach a shell, and confirm the thermal zone reports the expected
> fixed reading and /dev/hwrng actually yields data rather than just
> existing.
>
> Verified locally against this series with the exact kernel/initrd
> assets this file already pins.
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>

As with commit 49aecf39008eb, I think it would be preferable to add
the couple of tests this is doing into the existing initrd boot test,
to avoid spending CI/test time booting the same kernel multiple times.

thanks
-- PMM

