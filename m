Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54E4C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 08:54:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjCQe-00006z-5y; Mon, 13 Jul 2026 04:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjCQa-0008Qz-0W
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:54:16 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjCQY-0004GB-Ec
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:54:15 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-667f0fa369aso554968d50.2
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 01:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783932853; cv=none;
 d=google.com; s=arc-20260327;
 b=ekG+azYZa0C5dCASTSbbSyJpqdnSJnF7oVTyhTpSip+i3DVuU5EoNAPU+VpvYfqo0x
 gj/LroCgRKAHyKnMYn8M/8xkoOcC7fXLrmOpgX47zqlukh/Cd9mVhNOqX3vg9D2OiUKY
 udaLgu1l4TwNRoKUvLn+qbR3fPUqhgpw2Qx74tCBjFSbK9EsCgMwC72FeFduMa0ifQ3L
 LFiif8PLQ35jPXH1yuaKNAnj6GpkBxfrjizzm+TrWKb1kD5fs7vPqdnBpcoRJB6BIead
 eljbJORSIBsFjt2YR/CW7drcG4HZOqM/PHUlE4s2qF5L7fKKx2IH12tLtIn4TUdof8Up
 5NWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=hzak/7szTjivZFmxhLRh8gDxneB6K69+JW+oJN1FumQ=;
 fh=/LNLj/a1FQAg+OmmCsUFjT5mEvyCYwcmVNWk+4ICvSs=;
 b=LosoBDW2tQ2uzQH+kJWYDlOvvZ/yDMUBgawAYNEH/B0mtMrD9cyoKQEmePDRXTvb1i
 KAtQ8EwRGl0EoKsZvj4EdrT0JEVv6Fu8uce+izmfco55J7YiU3/4uHm1dbVVWiGFxwsK
 IYTIYYtA4r0+/NIgto39ZNAqKihL91n6Z2fPVdWlTIjz/tspoQDpISf3r+FAJW+Y/z4X
 2tk8BaX/iiRx80mogIRZuwzvkfkIoi7cp++wo0+RgmBs6hkD5xxYVMTBTvBZ8cXf/bdr
 8T414IyCRDC1hUsRDJETtzt1GWkCxwgRYZ4ejOQSQkTQdJLGiX5VY5MwoSVP/HmyPvn2
 pGZg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783932853; x=1784537653; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=hzak/7szTjivZFmxhLRh8gDxneB6K69+JW+oJN1FumQ=;
 b=rqIIcv0NOfBFpUVMcYuhBWP0QNGlSPn5nZ8SHkcpXUipTlCrH2VoSmiBjv+uJB9p1p
 fRMZuwRRDAatZMi3Z+sEhD/iHfstIvPrn6NblKiQv6kp+AWMxW+hMXpC8B/sahvngYmb
 iwMTAR2nhiySnacldB45IjTA/7sKrvDjD5/X0QcZvIBzuBBf/Dqc8HShM6V5RCSmjYNc
 OVH1rYp+KxhzK8n3tznu65keRV6HcvP+7X0islvYWIoF2UTdr5i8vs5swxVGvhTPIfOk
 vnm81rP3o9NFUxVAGIxDe81dYvMkqogLn2QFP8ofuIToFB+qB7Kxo4uvYx1NE3rrEBGB
 qBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783932853; x=1784537653;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hzak/7szTjivZFmxhLRh8gDxneB6K69+JW+oJN1FumQ=;
 b=S9m5nVasyKcM5aVZVMHte6d+Tc+g4c+rj8/E/65XpRyeEVktdg3I9N1YTZ3PZ+dAct
 HZAuUjEG7slJOYyJpZoxfLvuSkk0NC8L0NUKR6EH9l+JMWZAosb/b3zJKwvtp69KYS8T
 gce+Ss5JHKsk9vMWMa2aezwdMaMtoRAiptKiEBdmPXW0xlU60l3VszUpCdtEVapph66P
 KBdtHVz1N5W+HDXl/bf4Wa2X0iDDThzvSmlODKYYLButUo2QiTGAErqapfmhtr2yGmvK
 N1Yidd5YS5MPhBHzwrMDidHlDZVyu7bVw+jFYRNTw2Pg83P8mgpsA9PAezKKtBW+aWhO
 vS2w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrw9fhY8m5fg3o55dJDR2Mvx9hlifQvOOJhG28ODQUxgr0FN/UmWAwa05pPE2R/vEee5AU8uq22cA==@nongnu.org
X-Gm-Message-State: AOJu0YwqObMzheDek+ClUFmQTzTk96DdyiMXZ/059l7c4/kBIPj3I2kQ
 rC1WZHJvImx2jAZ4mYx9KSr8wpaGaEKkI6lskFI7u8MQS4itmVezr2F52e4fOSglr2W1ELyAVX6
 OMGO8AYxYHYwtILJ3on3SIxzW9X613wGc65dL4lIhhHUAQSgDSqPx
X-Gm-Gg: AfdE7cmjdtUkktqEgJQE41Wl8kRrm806Qv9aog4al3UCJGhpqGSvrsJSSD9Q6Z67P49
 kfSRG3UFs/dEmi0odSQvVYGNxKdQNhiRJI+CmAu6laSnAqMVPc4O9knX77lxBN5A87/iHfpKEhz
 ncP3fK0WHL/UwS680RJNLpKxQ9AEF5vc4TgjIg5lHs0P3scxFJq8RVnta5ZWXhDyd5l+IJC/045
 FzrAwG2E8ExFaps7bo0vrUvb18QNIrSXTNhqpdoxJzQr6twY5iiLMwq8x3hLmWCMW911I2SQ3Sv
 3J/tJwXEMF3QD8QSLqB0g951oLa3c+6IF27ngN7tztZ1WjUjOSTeJeEU
X-Received: by 2002:a05:690e:439a:b0:667:9980:6d82 with SMTP id
 956f58d0204a3-667d7c0d51fmr3828385d50.87.1783932852927; Mon, 13 Jul 2026
 01:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260710131500.2323848-1-alex.bennee@linaro.org>
In-Reply-To: <20260710131500.2323848-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2026 09:54:00 +0100
X-Gm-Features: AVVi8Cc_8RswlPwKavUF182A0n0boDX02Ce1rviWFbndFUOc5NI28ny_29kaF7Q
Message-ID: <CAFEAcA-ob0rVwKY6AQ2hzfp4oPFJAVB=EjVXWjCjLHxwROGcQg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/dma: don't allow weird transfer lengths for bcm2835
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Fri, 10 Jul 2026 at 14:15, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The datasheet doesn't explicitly say that TXFR_LEN has to be word
> aligned but the fact there is a DMA_D_WIDTH flag to select between 32
> bit and 128 bit strongly implies that is how it works. The downstream
> rpi kernel also goes to efforts to not write sub-4 byte lengths so
> lets:
>
>   - fail when mis-programmed and report GUEST_ERROR
>   - catch setting D_WIDTH for 128 bit and report UNIMP
>   - add comments that the DEBUG register isn't a straight write

You dropped the comments in v2, so I've dropped this line from
the commit message.

> Yodel did some digging into the specs (see discussion link):
>
> {A} AMBA AXI Protocol Version: 2.0 Specification
>     https://documentation-service.arm.com/static/64256e84314e245d086bc88f
>
> {B} BCM2835 ARM Peripherals
>     https://datasheets.raspberrypi.com/bcm2835/bcm2835-peripherals.pdf
>
> [1] {A} (p. 10-2)
> [2] {B} (p. 51)
> [3] {A} (p. 14-5)
> [4] {A} (p. 4-3)
> [5] {A} (p. 9-4)
> [6] {B} (p. 53)
>
> However was unable to come up with an unambiguous conclusion without
> testing on the real hardware. So in the absence of certainty and for
> the sake of addressing the DoS I suggest we merge as is for now.
>
> Link: https://lore.kernel.org/all/20251111105429.3993300-1-alex.bennee@li=
naro.org/
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3201
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>



Applied to target-arm.next, thanks.

-- PMM

