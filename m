Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1199416lfi;
        Mon, 23 Mar 2020 02:13:03 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuV5Ja2HKnWyAl8OPNEQy0ifq+MfGQW7U99kDN0FlEbQLv4nSzH/zjReJoYx7BZKHfPjxFC
X-Received: by 2002:a05:620a:11:: with SMTP id j17mr4806471qki.117.1584954783849;
        Mon, 23 Mar 2020 02:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584954783; cv=none;
        d=google.com; s=arc-20160816;
        b=KTyX9w5tSGUD0W7rKsX/Zjs0CVka5g+f2ePyMj92FXxwz6CFvYuB7xTe6xB0qefm3X
         PcrTANVHWfqte5cYzdhvzFe1rUb9SIfeG4gmBPt660VbIPzcW39zCFT1EdYBiGDjt80F
         lBhiS9OriEqT1e+fAlRzSrSHUADBAfDDInPxP4YEJer71eT+PMZYq5Zs/9zKHNoiIeQn
         zY+j2lXINiMzDhe3wuSKiAwjL+4oYuGLCj1bmPYAF17+K8dT92naSIsagz1xgzhuZu/J
         UoOQxITnypASrKXsRKZ2c2AbMIdzhoWhFXWmwisNqFx2nnQzBzjI0m3RzTmc4gLUWFPQ
         MdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=StYhV2lHqDdL8GVjx4Q/ZJ8fCC3CSz1lNcbb9k1iBQQ=;
        b=a7tyln0BtK6vuM4uwUXvmAMT0x6PeP2DA+x+/7Dvgf+jhlioRFzUMfXzCUYSYClT5h
         b5ynn+2WXSU3kTV6+bRGAlcR5aAUZc2qZUvh+/hjFKzmrmYOK0DkmKAP2on0Sk/HGb//
         cf7+2yJKJoCZjc32Pb7eX2gWVHIO3aAcGftQvblE01h22FmAL1qTgSHnBUkKE8q3t2Fg
         RgUTqzVwZRlxfCOUwnSSyFZ9fsZ0IxK2DXjaa5ld0jvaIMZNo0UGfSOc66fp7h3I4UNn
         JhzNyO9MCXn8SCCgzF4XYduvpbyLQM4H/f5NtaOYtnBLW7IOpyNy7dTgtSJuB70SV9i4
         AhHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XS3ABJFP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o66si3817482qkc.50.2020.03.23.02.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 02:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XS3ABJFP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGJ8p-0005wA-7E
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 05:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51532)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jGJ8f-0005vQ-48
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 05:12:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jGJ8d-0004Kt-W6
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 05:12:52 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37896)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jGJ8d-0004Ka-Rh
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 05:12:51 -0400
Received: by mail-ot1-x343.google.com with SMTP id t28so12644750ott.5
 for <qemu-arm@nongnu.org>; Mon, 23 Mar 2020 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=StYhV2lHqDdL8GVjx4Q/ZJ8fCC3CSz1lNcbb9k1iBQQ=;
 b=XS3ABJFPZiIbEtLJAt7sZ9CTqXOF7rsQ8Aha/qKZNVg8GZiz3Ufi8YXwDwUgL2UiI8
 iWzNepWlfYlMl49LMa9ecNHJpB5ifEgsONDOd9CoEbN0uES94MDGtpGP0LDgtfne3qWm
 C56jQf1uqo9j/qT1bOdsTJcdgmlB3sP7ORi7oO+TiIjZ///AqHUupXH1Pz+QcS6UxECM
 7S6jnOoCDsH2JDgF75lP9mRgkKCMqhrjMvdMISkn16glSqYdA86Yl0mZKucwf7iAUJgX
 ZURuA2H25NLq96MjWv6zhnkimJAPlDquQaYnCGr+yDREt21+Tytf+KBM2Fh4Bf/aDEvP
 kWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=StYhV2lHqDdL8GVjx4Q/ZJ8fCC3CSz1lNcbb9k1iBQQ=;
 b=Ky5pN7ilsKJNgJ610qGH5F3gVheI+F38inpU+aRfvD7u6gowxSy/rLanl85vIo7jBe
 RGqDVHgaj1DHwFance29FSZcUZJiyeUbJ8CcU3GElcUXHajn/iy0HNVoza2OtLb1CY2p
 hsv+JFuTHJn4nHmDUGCiHG1mAxz8Gi51RhSFnJP39fC5AmFanjUdwcdcIFm3AV1oj/eX
 17sFC4JUXMdT15zR0dVd5a+iOwmeR4YT4KkQmHr8gCaFvurykiwcNEAqiizepNJ4QHhe
 PZyPORkM8sPrvNNM40K673FiGf4uYpAzeVwCybL5Ad1EFmBV8tk7sq0pwGTCvYjOs2Y8
 vjTg==
X-Gm-Message-State: ANhLgQ2yHYLfyZNWVmKlfhAGVyAvY0ZvnDSuyx5kv6ryUOxhJL1eqTbL
 xzMBpuCWFgqux5wEZfic1nJdZ6Ks7kpHT1FWKnGhAA==
X-Received: by 2002:a9d:1d43:: with SMTP id m61mr17260836otm.91.1584954770862; 
 Mon, 23 Mar 2020 02:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200312213455.15854-1-philmd@redhat.com>
In-Reply-To: <20200312213455.15854-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2020 09:12:39 +0000
Message-ID: <CAFEAcA-i5L1Xz_r28xs1waDcoz5ChnzUcoTb51s31oXBqeO_RQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/bcm283x: Correct the license text
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XFkaUpZcNCmY

On Thu, 12 Mar 2020 at 21:35, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> The license is the 'GNU General Public License v2.0 or later',
> not 'and':
>
>   This program is free software; you can redistribute it and/ori
>   modify it under the terms of the GNU General Public License as
>   published by the Free Software Foundation; either version 2 of
>   the License, or (at your option) any later version.
>
> Fix the license comment.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

I was hoping for an ack from Andrew, but in any case I think
the original licensing intention was clear and this is just
a fixup on the wording.

Applied to target-arm.next, thanks.

-- PMM
