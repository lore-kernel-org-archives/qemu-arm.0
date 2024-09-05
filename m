Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp463415njb;
        Thu, 5 Sep 2024 05:06:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXc8tM1sxOJoII0g4TJ7BVvhHJ6UUs5hNvh3PsjVSVA1e7WcoMjFk5Xvt+JA+cvsDyXEFOtvWDIAadqUg==@linaro.org
X-Google-Smtp-Source: AGHT+IFjdYEVMq1OC6mOkN2ddKyLMNBlht499X8pJm8s0rUHat3fVDlxSTlCp9AXR6YoeF95duqF
X-Received: by 2002:a05:6214:448c:b0:6c5:1151:8cbe with SMTP id 6a1803df08f44-6c511518da3mr107709646d6.38.1725537992148;
        Thu, 05 Sep 2024 05:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725537992; cv=none;
        d=google.com; s=arc-20240605;
        b=NhJRBwNIhwhp8mfceBrDiqRyeADO8CbHK7A+FhPLmYQh5fHRZSk51TlJ2g5ZCRBDYj
         7stuPsbgp8icUOet+sGT2FTVcp6paVNfDr10yYp+4Q1j9fLW+XhQRuEfoeYVH1xZ5T/p
         FaMQz1MiZ/q4egZNv6tXoNhBo9yfwhQa/vp3ghdBhHN3ktmn/lXNgOHB4kHUVWqmKoh7
         98wLW+ZV48Er4NYNr5rgrzwuBt5yZnC0mBnh4H3hc0RqWUeWw32RDztv1RzO0A/SLGc7
         vCDe80yPVnyJXWHoLlo8gNH+ZEaQzaY1ECjeKQJpXnSXI8vrXed2b3QWI9oNKT30WFFP
         Te9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+mcNceJvk1zALDkqACdXnBSGvNBQ2uKqYYEnQOzlNC4=;
        fh=9D19eF7BJvJCRJEfOUDGN36+uYI2HR83VnGNvOmS1Lc=;
        b=M5/wIGExNrqES/K0CKn/xzYp2H6S3PIQMUuu3dY2VqiEa0REhzlP17YHJyVzI+TtAI
         f+CGWb2WcSEAlmR8z8eLp5j3t02c7JnXZwwGe6OTasyh0W3aA2nUCxqDtfYbM28HOw4V
         8HWoGDl/FeFvuFmwb5OGRQvbDp6xJDYxQwyU6fAcUotGLAdTBOg8A4qVydOjo+/9O7yO
         bP9Xnng97BAJZdSBkZ3g2yfskuRiAZU5/VDlzbyRfWrC/TIwj4ux0zb4LlbN2Yu23oOV
         x6NK25m6S8k5q3UOQ/U7aTx9XzAUL/5IVOX+Ojggkw1V+ZN6E7DFj4seU3hAamu8SMg7
         GLsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZoPk6zfk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c5201e131csi18234116d6.47.2024.09.05.05.06.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2024 05:06:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZoPk6zfk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smBFo-0001VY-W2; Thu, 05 Sep 2024 08:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1smBFn-0001So-7m
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 08:06:23 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1smBFl-0005ds-Om
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 08:06:22 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a86fa3dea99so39190266b.2
 for <qemu-arm@nongnu.org>; Thu, 05 Sep 2024 05:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725537977; x=1726142777; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mcNceJvk1zALDkqACdXnBSGvNBQ2uKqYYEnQOzlNC4=;
 b=ZoPk6zfkqoNm03I1xXZmojkIA/Wwcn+MMT3eMnjidPP1HGaeSCGcQ0BPrCz4rXBQaa
 /4N1qL2kIY+yszPvvsJDqVvWPNXu2z5qOrZeIO0pmmmwSHN21eMrlcJs2uJVVzhZ65wG
 YCai/CJYPIl1LkKmOdd6a3PD4dyVSmrqE73OBiNwv9M7i5sFthi3UkNmpp6Rk2ts7GXL
 NszLbr3z77gDTyl6GT56pK1nDIlQDBMh+6+0YrpDuQDsWm0L9gyr9ZYWpUsnXb89DNHT
 jEV+6qiPy33PSOXrnu8aD820CW8W4kovs1zR6GJM4ht/TPq5vmnhPEUYxGEqEknlPBqG
 p0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725537977; x=1726142777;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mcNceJvk1zALDkqACdXnBSGvNBQ2uKqYYEnQOzlNC4=;
 b=Gj8jAcwUa4+kf7D2PLQDtuixxOGvbj/KzMhVoUfJP6CiP6FJpA+zGr6NWXEAZI4nfk
 34CnpuT8sWUVvBjVSxLxn5eAY2rOvYxcdgTM1dna7boQFd2phaujT3ItVD9L2uz9v5fy
 li3tn/7clio+4wyXUdl1vWiF4zDjzZrFcQ5sv0CuXi/GtgJaYCHaXpPuz/08mXjG3C/i
 6bCHP7DFY9G1em5YtD9cpFuHh6kuKHVojYZCpBLKh42uA50hI1s1ypRY/bjOoB44GLHd
 BTwyfpisMuo15uqMIHvBrY+ho8Ni4HnOEAQiiuwIWWytrUuybx3ueqXxHfBDoMX4rBvr
 Q5GA==
X-Gm-Message-State: AOJu0YyocmqtmydVt1rEV4FEYOKoPlsxjI57Xe+syTHJtIBVOsGB896y
 1E48Z4/2JMo/Q9kYpW7VHyuGLssgl3dNnYWKM+Ohix5zMLqO3wqtrNY0qXxOgknUTAMMgxR6aIn
 aohLmo1dyO57EFcLIxz6QHFXr/8keymnNIiJmuw==
X-Received: by 2002:a05:6402:1ed3:b0:5c2:5d34:a45a with SMTP id
 4fb4d7f45d1cf-5c3cd773f0bmr2232843a12.2.1725537977288; Thu, 05 Sep 2024
 05:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <762867ba-8980-44f6-a9a6-5e766bc6a60b@redhat.com>
 <CAFEAcA-uTqq9Ke4pS59aQ_9t7KObRxff8DN_rY-2JkfSCQkASQ@mail.gmail.com>
 <CABgObfY--e1h=fEC=7TxA9eaHog1N4V4+3oEm+W_RSKEEUSU4w@mail.gmail.com>
In-Reply-To: <CABgObfY--e1h=fEC=7TxA9eaHog1N4V4+3oEm+W_RSKEEUSU4w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Sep 2024 13:06:06 +0100
Message-ID: <CAFEAcA_TJ9A1MTOXhrwAHf7+g1bj0sg5utTHxnzCKF70TkC2Wg@mail.gmail.com>
Subject: Re: [PATCH for-9.2 00/53] arm: Drop deprecated boards
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EKDrnOwLo49h

On Tue, 3 Sept 2024 at 18:15, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On Tue, Sep 3, 2024 at 7:04=E2=80=AFPM Peter Maydell <peter.maydell@linar=
o.org> wrote:
> > The PXA display device doesn't pass anything through to the guest,
> > by the way -- it just draws the pixels in the guest framebuffer
> > in a different place in the UI window. As the FIXME comment in
> > pxa2xx_lcd.c notes, this should really have been done in common
> > code, not in a specific display driver.
>
> spitz also passes it through SPITZ_GPIO_SWB ("Tablet mode"), though
> it's incomplete because it should have treated 180 the same as 0.

Whoops, yes -- by the time I got to grepping the sources for
uses of the graphic_rotate variable I'd already deleted
the spitz.c source file, so I missed that :-)

> > As we both note, the UI input layer part *is* generic code so it
> > will do the rotation regardless of whether the display device is
> > also rotating the guest output. But that seems to me more of
> > an accident than an intentional feature.
>
> Yes, it is, though it *is* working. On the other hand I doubt anyone
> is using it. Since we have in the past removed single options like
> -alt-grab, whoever needs it can resurrect the code from git and add
> the options to -display. They can also add rotation of the output as a
> separate knob from rotation of the input.

Yeah, I agree. I'll reroll this particular patch separately
from the rest and include a paragraph for removed-features.rst
specifically documenting that -portrait and -rotate have gone
away and why.

thanks
-- PMM
