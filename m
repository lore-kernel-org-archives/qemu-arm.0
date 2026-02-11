Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278C9E9E311
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Feb 2026 15:08:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqBpM-0005xq-3p; Wed, 11 Feb 2026 10:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vqBpL-0005xZ-1B
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 10:08:27 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vqBpJ-0002P9-DG
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 10:08:26 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-794719afcd4so70358897b3.1
 for <qemu-arm@nongnu.org>; Wed, 11 Feb 2026 07:08:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770822504; cv=none;
 d=google.com; s=arc-20240605;
 b=NwTnkdbctGGXarPQOLRy71mGzvk4LWBBp+wLH2Q040gNd4ZGi7SToGQpF8+B7bigbV
 Mo5nw7iJXlGDQAGLdyfc2RJuCSKNBRIMA+o6ufIDsVVB1opyTWuEFPKYG71qYzmGpLea
 0vF42Xv9kdwWAS4RD3UtBdq3c7y0yBDJl0RwZqqpKqYYdU+U9DGiQLbSEGpkEGd3926T
 omm9frOMx1R6MD2gvQsBDQtXSiKMxyYeIDaffihAue85PXwNrUE6LmfUQFMT1Yk9UO+X
 TDxWEiS5MLpdKlRszwb2sHDYc80RnUdGdDNL75b4ANR1ZvcHleE64r7pJtMQC7J2jvxp
 my5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tAXeJuNXG/11xoILElsy8mgQo4sn6X2VMcX2eWXK9ds=;
 fh=Pl8J1WKZKaM5T/0n7+upNfmA3op+vMN1Pua8zpOOHCc=;
 b=I4rn8rxVjx9xdpO4mYg71FltF02pP4VRY9cPUJIFpAPJYKwU6CZWqyCoX7Tc5xncrq
 TvN8xBowjQGYkvg+UreiKoIuJJf7lpJJQKKlJ91BUS4FfOf3+2r36Ebshxn4IPD6qaJW
 i1Kw2ulyt5mBqPDUlz5f3EE/krEusCuIuNI5AaQ+NAEiqy0v0khSYWlXaPURavb3khvA
 UVRcOSmljfWmOtDA6EqqUtSgxhtyjseciYyhtnsZrHLZ1qpecByprb/l2BTvrG5sEXBG
 tYH9IBnIcp3uPKNxZ3m4VxCJSWYRP9hmAn+m7S738GmiXfxtGbxEPYZf4Xcph8yxuSX6
 bjig==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770822504; x=1771427304; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tAXeJuNXG/11xoILElsy8mgQo4sn6X2VMcX2eWXK9ds=;
 b=xQKijsx5dorTye5uFKvXCWAa1Tyh7eNNOI/QKUZFs2c+pk/yHTggYCvyOX9uy/f5FM
 GVpnhLUEvRKnKuxf0D9a5qNP8CC0lbkhi8yGuSPyQn6erPLBXIYPBUzxcuSJ4WPWDNei
 CrMXnbjGX6qO8uJ07vHlwbS2L/Ez8EhlQN6c8kNmBxefHg5MBMaowY1ohgGe4SeLoNhZ
 ANwuewN8EhXtAYVUJD3BM3hwZl55+L25s15onz7uE2BwsbEzD9YgPKqHwcMu2CDSvDxg
 +Bv8L9xQSzzVktaVzku3yYbHekt/wtACulwmYF15yZtWNn68foggoOp2X5seliDMlhaX
 Aw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770822504; x=1771427304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tAXeJuNXG/11xoILElsy8mgQo4sn6X2VMcX2eWXK9ds=;
 b=Dkda70W787gcA3y29IzKw2UpRZiocHtK6+TAdZ+cGXkWMx8CcTDpgrZL6WIGdxVVUh
 tTjU4Q1AqRkC/5oe8lCJyh/4bvm0zosRIYIZ1L/tPy470nM4Zrh8l12JF63Aj4mt2e9e
 klcvOnfXOIDBL2kxoPYsAoRXqlNxyqYWf/Z6Otc89Ae7QzH8pnY/zIIc4wk6rdtWU79X
 VBdNky9fLZB7BpKPCJycy1zzksEEGv4vLUB3EV1lptyVdiRnVtTb7/IipdEtXdT+MktE
 mrsu41QpDHJUUEh4LLujTbGffLDiXHBk2mEA5QfasO/JOfHvqdxgnl+FTK0m8cAD4ODy
 k7uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl63hmU2Gtqmsyy/395TSk5+nxcy+vGgPatGGcAiOgVotcjA6xnRlrCG4xYqmO0l0Wirdp+3VqhA==@nongnu.org
X-Gm-Message-State: AOJu0Yz+6EN5TeSjGekGFxKHVdGxZVxtAqdKviUMVFcWi/zVnQj5W1EL
 aH9x/meRa/V5VhAlpyyj/ezpTcdSOd8PmbjxPB54JIbG5ZUr23YM7F1sgdtWkPPoXtGfvP1O+Ly
 9rQXV5MAwhqtSL8EzhgaNDXLK6yQiMwtB3ShT9Yxlww==
X-Gm-Gg: AZuq6aLfqrnTp4tP4eXarYatcIMxQ0dX7rn1beiKoHflkSMfdfWextTkO6u5O1rgLVo
 M1YpVpXvXYbrb8JDrpK3AzxF2K8Y/2ITDOAkBh9XwqK+S9XlprhEKzBL56cBAf4oNcugo955uib
 PKR/YHeA2xRdH6UnZvMeR7eCSeRfbD8V+TEHphWn/dfSvRBhnppTtAG29BLdTDLUxnPt6/veEVj
 RmrSOXcUzq8AtG52B6bX5HB3t7qdYgfkLLsFseQBvFhu0Ny4TkipF/S0cPhHnBBr1SmJScg/ofk
 0wLsn+2bC6fbC2gLENCPWx4PZlbL76/6APmytSlz/mCFVzWJhNkdb3p0RMTUgbt7eqE=
X-Received: by 2002:a05:690c:81:b0:796:3079:ae1 with SMTP id
 00721157ae682-7965f047e7dmr50246597b3.50.1770822503777; Wed, 11 Feb 2026
 07:08:23 -0800 (PST)
MIME-Version: 1.0
References: <20260211122759.125094-1-mbawa@redhat.com>
 <BE3C6640-85CB-437D-A038-81762FA5AD33@unpredictable.fr>
In-Reply-To: <BE3C6640-85CB-437D-A038-81762FA5AD33@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Feb 2026 15:08:12 +0000
X-Gm-Features: AZwV_Qh6dt1x2qdmkCqGtAVWpZdbnYac3r-RYhT486zdThNz_e-q9H-ltOpXhxU
Message-ID: <CAFEAcA8qtxXP0Uawc+UdSYmpuC8wmpSVkjnYQ_jDQe6zTuNWpA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Add virtio-transports property
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Mohammadfaiz Bawa <mbawa@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 alex.bennee@linaro.org, philmd@linaro.org, cohuck@redhat.com, 
 eric.auger@redhat.com, sebott@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Wed, 11 Feb 2026 at 12:50, Mohamed Mediouni <mohamed@unpredictable.fr> w=
rote:
>
>
>
> > On 11. Feb 2026, at 13:27, Mohammadfaiz Bawa <mbawa@redhat.com> wrote:
> >
> > Windows ARM64 guests detect virtio-mmio devices declared in ACPI
> > tables even when no backend is attached. This causes "Unknown
> > devices" (ACPI\LNRO0005) to appear in Device Manager.

Is that a problem? There's a device there, and Windows doesn't
support it, so it reports that there's a device there that
it doesn't support, which seems reasonable enough.

> >
> > Until Windows fixes that by supporting, adding a new machine
> > property 'virtio-transports' to control the number of
> > virtio-mmio transports instantiated. The default remains
> > NUM_VIRTIO_TRANSPORTS (32) for backward compatibility.
> > Setting it to 0 allows users to disable virtio-mmio entirely.
> >
> > Usage: -machine virt,virtio-transports=3D0
>
> Hello,
>
> With keeping in mind that this was documented in this (closed=E2=80=A6) i=
ssue
> https://github.com/virtio-win/kvm-guest-drivers-windows/issues/595
>
> Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>

> > +    if (transports > NUM_VIRTIO_TRANSPORTS) {
> > +        error_setg(errp, "virtio-transports must not exceed %d",
> > +                   NUM_VIRTIO_TRANSPORTS);
> Any particular reason to (keep) capping the maximum to 16?
>
> From a cursory look, base_memmap seems to have room for plenty more.

My first question to anybody wanting more than 32 here would be
"why are you not using virtio-pci" ? The whole virtio-mmio infra
in the virt board is only here because at the time we had no PCI
support.

The advantage of this series to me is that it means we have
a way for users to say "I'm not using this functionality,
just turn it off completely" which lets them reduce the
security surface a little.

The other thing worth checking is whether we're correctly
following the ACPI spec in exposing virtio-transports with
nothing plugged into them, or if we're supposed to be
suppressing them.

thanks
-- PMM

