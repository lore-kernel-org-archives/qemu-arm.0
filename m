Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA15CD13D3
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 17:41:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIVOG-00070W-Qm; Thu, 30 Apr 2026 13:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIVNH-0006RT-77
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 13:40:33 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIVN9-0001QO-VX
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 13:40:27 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-656d749109cso742603d50.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 10:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777570819; cv=none;
 d=google.com; s=arc-20240605;
 b=XnjIOyqV5Z9JQ6lhvbfugF45AtH1fyaX0IMaA9KJnMa32Tn0vysZqnL1hoAEUm6BF/
 iJhwQbJJ3hjwvSin+tW///8tsuBbsw3jmjUT+Ots869jomSW/0dnb011G7l/VzqXDaZk
 U6RhWdcfEL8pSketsooqde9q2vs7/1LZvDw/29Unnj9XCEHnSOQRmUJALFiK2AD/XS91
 3kNx//LzidY8BVL04ExhNz5tX3vgHYgs4nZbGCzGurRxfBBKWVRpBtr5Iu2dMYAJv6is
 ICX/U414JxLIg+vKC52E0KVnac68IM33UMLv5WigLo1r33hJpx0qVSuzPLgJqMltKIbl
 mZjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wRNqp1a791PplT4I6/Q+eQ0RRbtFxylwW9MjMq9JYVU=;
 fh=hvcz60CBxbhy2A0hdHY9nKgTtdGRzKwBT92QnRSbisw=;
 b=UAqw0XNDRAWqGqsUqQXwzZz+jUSZBIzRTuE1mH6aY/ZO+bdh5+AZ3e3N9oQNSOkKGf
 WiFQaL9D7WOK1IGqGDbaxDfCstF4ah2OT4aezu9lOdbOaaF6FxEznoCoScrx3o/yMCwW
 vU8GeJ6vs+UWOMpoL4oTle3KIkaiKNBeJQ0sW4CPBqVVUJPaHpk4naTBR2rRfqgKmvfI
 85bfsXLCn62q92nyz/dT3LGsqksIxJMhtLD71kslGCqtboFJ1E4Qh347Z+Yvv18NDeP8
 dwoijXCok8rTf5T0a6p0NEdqaf1fdotDfDdd0iCtlxhQGb9ovNJwGdl4tZPd4uR3pVXk
 ao3A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777570819; x=1778175619; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wRNqp1a791PplT4I6/Q+eQ0RRbtFxylwW9MjMq9JYVU=;
 b=gZRFeiEmbtFGVqDfmSRFE3o61wCOt4HPC8s/iCG//wSjRmKWl6rAFitO3QjlQ8Ii1e
 HVK11m+9siAsxxx7AOz6jYZ6zxggiMCczKJnTCuIINJgIaclZQe3ApXQipnlhybDhFdM
 /zyJOMELBjpq6IFLvAeNL/crKUsAjoFZ3H04wDs5hkiQ7vQ5hzNX8NaxBmevxTT2VazZ
 4RLPqB+7lGk1GJ5kv0A9Hev1fhOD53IeXH/C4rE1VCKE59E66+CcLECOKjqjl8moBGhi
 +3+1WJaUzyoXNi5vSE6RvyZuM24dbzJ6+8ZW26sJs7npOgzO0tG4NFSm6fBvr3Qe3QhJ
 Xhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777570819; x=1778175619;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wRNqp1a791PplT4I6/Q+eQ0RRbtFxylwW9MjMq9JYVU=;
 b=Rorzs/hBbX+1SyYIOMfXdgaRcEYJzlSKBgPC/TMfN24UoxSshJMhBypuk4pTRvsSjg
 xDoZjROvY1vXdI1aOH688RYj5cKH2SEH9YOyWXYb0Ly4laTZiahRyzgMobZSXsQkQl5k
 qhzf8MMPDbeY/YtMhSXThQ/1aLCmJgihGdaxjqs2ssXUefJwoOOlw3jlyofMyzJXgKfE
 dVPvQ7BInkxxBFPFvdsTfqR8TDFkZ6RSw3Ox3+EB20WO9754fmGQ0PGfFHG3eLdkEwdK
 MCCahrdp8yhVKtbeZ21eotlsHjUvXydhRnQguPhi4JSiOttKowxhKfnEc9Zo0s6gF7bY
 9y9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8xAo+xH/H/Ygi6dKc1rGi5JeqBij0ES3s1bgrO0223fZvfOGhbRNlEYDfxDV2JSjtMH6zWlPgyOg==@nongnu.org
X-Gm-Message-State: AOJu0Yza8I1wCB6nB0RGT+ohiZX1eb0KzI8ck0BgHseUKSuYAhcsW2Ln
 jP6GYZOi9zGjKzdz9bUSMpPcIe5VhWc8OnA4CHMnQZovjPe9Y3DVBp8lL9p6T9mOS3jLlUoFF5q
 9qRjy+BU2qFzdSMcJ02kkixvahfm3W1ZVZT7a4YqgpQ==
X-Gm-Gg: AeBDiesohWocCo83dMxoffM1PvWfXbjYOjZt/FpytQs911zDB+HBK4LzhLiTPxLXRNw
 4LRT+mGCvZl/6NK0MxVNJF7mrnyY0nGI4gGgLEVuGCq1v5pcuBe0GT6bZWmaV95AzLM8MjVVAV1
 WszGcm1c7mzc66Kjs4h4+I4vy0S3bL/QmnN/bhBd7LL0UMTMEqbUORjq61WKHRnF7P3T9rnBodN
 fzvJ8R7+7el0N4RToAnxgFF6zHBo4JfitaU+wr/CIAHHWMltbdaooPwzuOoSxMR91SYffRGlIVE
 3c4qOh4dTAbZ/5tSpcgtLO1jEoBe5uL67QDYCjcJqP5SNUQieqj32mHdcACcjClxWGsPK7ZGOaj
 wZtpmETOcKarT
X-Received: by 2002:a05:690e:4092:b0:649:6b96:8025 with SMTP id
 956f58d0204a3-65c18b04cfemr3212339d50.9.1777570818956; Thu, 30 Apr 2026
 10:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260420064933.64765-1-thuth@redhat.com>
 <c51c87a7-e224-4785-8f64-f4c59af0d066@tls.msk.ru>
In-Reply-To: <c51c87a7-e224-4785-8f64-f4c59af0d066@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 18:40:06 +0100
X-Gm-Features: AVHnY4IExqn23MVcz5gIFdch2_2WomB86JJbwsWg5gPi572yXRiM0muQ21qYRbI
Message-ID: <CAFEAcA_brmxEaxR+fzNFCaC+n0TnJg_5vF8vrpuah7PvWPD8fQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Remove hw_error() for the unimplemented
 CM_LMBUSCNT register
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Thu, 30 Apr 2026 at 17:50, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 20.04.2026 09:49, Thomas Huth wrote:
> > From: Thomas Huth <thuth@redhat.com>
> >
> > When writing to this register, QEMU currently aborts:
> >
> >   $ echo "readl 0x10000018" | ./qemu-system-arm -audiodev none,id=snd0 \
> >      -M integratorcp,accel=qtest,audiodev=snd0 -display none -qtest stdio
> >   [I 0.000000] OPENED
> >   [R +0.001907] readl 0x10000018
> >   qemu: hardware error: integratorcm_read: CM_LMBUSCNT
> >   [...]
> >   Aborted                    (core dumped)
> >
> > This is bad, a guest should ideally never be able to kill QEMU like this.
> >
> > Now, according to the "Intergrator/CP User Guide" from:
> >
> >   https://developer.arm.com/documentation/dui0159/b/porting-integrator-ap-and-im-pd1/registers
> >
> >   "The Integrator/AP CM_LMBUSCNT has been removed."
> >
> > That means this register does not seem to be implemented on real CP boards
> > at all, only for older AP boards. Thus it should be fine if we simply
> > ignore this register in QEMU and handle it like all other unimplemented
> > registers in the "default" handler of the case statement.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3407
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> Not sure how important it is, but from the bug report it seems this is
> a real issue which triggers for real use cases

No, it absolutely isn't. It's just somebody who's been pointing
an LLM at the codebase and asking it to find cases where the
guest can do things like triggering asserts or aborts. No
real guest is going to touch this register, because (as the
commit message notes) it doesn't exist on the real hardware.
It's a harmless change to pick to stable if you want to, though.

-- PMM

