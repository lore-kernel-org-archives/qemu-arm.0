Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp2473629ejb;
        Tue, 25 Jul 2023 02:23:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE2aRR56u8g/WzfhcESv8vZktUm+8CMOpuMY1vuYX1uqP5UnVRJyknuEQs41pwOjVXEB6Pd
X-Received: by 2002:a0c:f88c:0:b0:635:93fb:fbf7 with SMTP id u12-20020a0cf88c000000b0063593fbfbf7mr2159740qvn.2.1690277037086;
        Tue, 25 Jul 2023 02:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690277037; cv=none;
        d=google.com; s=arc-20160816;
        b=OaLJXQlxhAuNjDsyLvpfMQig2g1aBUrOZZde5kMnXzlnaIj98v2L0ZlyPcWjAM1+2w
         TAjPsDbvXgUzuEKBirgWZEmw+8gQS61ynNFHNRntxEsOeYZqh9GEqqGK1S+1+Je13PzE
         pn+Nag8C6bPf4ZpbDVQAyeBrl1DTKsp/m0N4f8zeHGP9RlnDHREOzd4xbUSoS1gYDq8J
         9Ss2uQDAHqI+1tkKFzHUqR8/khumarU2gOQcZJ7c+jNQxx5oNgMbP2bSXQYZMMGuFeRM
         Nx8aZc08gi0YwqXbcTDD0hmYvyglihFcjGPU26dDEHprHg7xkB7q65DV5FtB0dzsavlJ
         wHtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gOBnavCrna6JWt2dtfiq1zNbqJHIn7EWAHHgfrt55Es=;
        fh=XBL7wuOnmyes3GPK3AEoJ+XBo7B8JI753uFIVICnU40=;
        b=lxfKETCEW5q7EiDi/O283/syFZ0udk+4qov/O3OHZ5NZgEW+mO0cwf1Qv4x/Yo6Ntf
         +NpZHxVKLiziTE+XVjexbxBy/Vw43pLYg5xhiwB0mN/xBGBQFhxTo2yMDQfolL7YE1YU
         e5kVd4znBlBNJbUnD0+7XxmjHzsNBpv4QmmDWmwMsdhUo6ioEDgiAE+NNIzonKO7C3NY
         jnx2B2a6c4jPDG0ot218LVa+5kaIrVTRTLPFCntyj0Mr97LtdIdlBRkfS/7SN2qUxjKf
         zkWG3tFY6Mfqx0140J+MT9gr3Cmxp4vq1c12EbyGv/MMI9vIu0UbPTjMyq62PRQ8DTf1
         C55A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g8yIqMXj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6-20020a0cdd06000000b0063631ab5dd9si4700054qvk.164.2023.07.25.02.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 02:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g8yIqMXj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOEGe-0003Ux-NH; Tue, 25 Jul 2023 05:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qOEGd-0003US-FF
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 05:23:43 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qOEGb-00044F-Sk
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 05:23:43 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51bece5d935so7978923a12.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jul 2023 02:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690277020; x=1690881820;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gOBnavCrna6JWt2dtfiq1zNbqJHIn7EWAHHgfrt55Es=;
 b=g8yIqMXjkOl1QcpGTWaXMJj7rHs3odpxOVlnazSQaKzFItMd8SDMNLJGsCIXza6UAf
 y3RbVqMFiobEVWlGx2WKlOiXwjXiy3DLfxMsrMI40KKnL6GC2iKEjosfPo+5UtWF6MTP
 I7sliRjiGl65nDC4QPSp4EsNFPEfxPQH+KDrwBRHf6j2tI/k66OXyRRJvGTHdAfYKK5M
 N5c22ota0jmMV9ClfHvaubhd/E7zUT3mhZk900d7l97XPrOd9jIxl/L0pUMbERUnX3cb
 GnUIPX+Jdg/zU74eSq8NHnKKBK+ol8oq4BeHhutmk8QtyAeaB7lc7dhK2HNEKOhtQeY/
 u9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690277020; x=1690881820;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gOBnavCrna6JWt2dtfiq1zNbqJHIn7EWAHHgfrt55Es=;
 b=Ew3HJj1p72wio23r8lrcTOOEy/5BSlGotM4zVudcRteGXl6HxJiD6iAzbcV+f4wFxr
 akc56Yfaa/Ka/BtYvRaGmeQGN/A+Mm5R1i7ErZ9pvHHp5khRMbLu7XDD0eshwBggFTcC
 ABntMU2z6chS+DHf9bkFz96/GZf+e6gv2Z7XRVpfFNA1z+B0q4DDo+1VY/fjb+FXIIZF
 1tmQyUM8FbawHAIT6Z2SwlBhZkXKE2G7BshwLGkuleKIW7/ft+jS+hayFjulCrTAkMnO
 SlFaqf2oMuhZAdRKdn2Od+m2bxxX14PG4ndYurqF5S68Qix+4B/owy9gD78nLqDuGpDZ
 pb2g==
X-Gm-Message-State: ABy/qLZWHOsiXsacJIma2VW7e42zOrS9ZS7stiQ6DiZSn3371RTxeMEy
 OoS6rY8Tqrd/voMHbr35rIq+aAEOvi24X16NX7ibbQ==
X-Received: by 2002:a05:6402:744:b0:522:37da:7920 with SMTP id
 p4-20020a056402074400b0052237da7920mr3515847edy.12.1690277019516; Tue, 25 Jul
 2023 02:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230714232659.76434-1-chris@laplante.io>
 <CAFEAcA_gGia=ckyv4=XHNX4=VHJJ=rmVGXQbdnOAGv5h1rzLzw@mail.gmail.com>
 <uJ83qRpjm3C76JRjI4OOm2NAz3uF-RDUa2WL8sp3ftAzoH16KDfxZhwxsqxqxrHTfXHKkZZXy0JY6UUpq7nD0jfYEUtYM_K340O6E6BFwJY=@laplante.io>
In-Reply-To: <uJ83qRpjm3C76JRjI4OOm2NAz3uF-RDUa2WL8sp3ftAzoH16KDfxZhwxsqxqxrHTfXHKkZZXy0JY6UUpq7nD0jfYEUtYM_K340O6E6BFwJY=@laplante.io>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jul 2023 10:23:28 +0100
Message-ID: <CAFEAcA_HWapg170-7yu2cZ-ePTe4PaX-tWyL7FJzENgig=dq5g@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add nRF51 DETECT signal with test
To: Chris Laplante <chris@laplante.io>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: /IxcS8yiD4uh

On Tue, 25 Jul 2023 at 04:25, Chris Laplante <chris@laplante.io> wrote:
>
> Hi Peter,
>
> > Thanks for this patchset and especially for the work
> > improving the qtest infrastructure. I've given my
> > comments on the different patches, and in some cases
> > reviewed-by tags. (Where I've given one of those, you should
> > add it to your commit message for the relevant patch under
> > your Signed-off-by: line, so that when you send the version
> > 2 of the patchset we know that those parts are already
> > reviewed and don't need re-examining. If I said "make
> > some change; otherwise Reviewed-by" that means "make
> > that minor change, and then you can add the tag, etc".)
>
> Thanks very much for the feedback and help!
>
> > Do you have the parts of this feature that use the DETECT
> > signal in the POWER device, or have you not written those
> > yet ? If you have them, you could send those too in v2.
>
> That part is halfway done, so I will work on finishing it before submitting v2. Two questions regarding that (to potentially save us a v3):
>
> 1. The nRF51 POWER device overlaps with the memory maps of the CLOCK and MPU devices. So I have created a CPM (CLOCK, POWER, MPU) device in hw/misc. Does that sound reasonable naming-wise?

Yes, I think from QEMU's point of view the massive register
overlap makes them a single device. The name sounds OK
(give it the same kind of nrf51 prefix the rng device has).

> 2. I also have some implementations for pieces of CLOCK, namely the HFCLKSTART/HFCLKSTOP events and HFCLKSTARTED event. Should I include that in this patch series, or would you prefer it in a separate series? It is unrelated to DETECT and POWER.

If you think they're ready to go in, and it doesn't
make the series more than about 12-15 patches long,
you can put them on the end of the series. If the
patchset is starting to get a bit big then it might
be easier to get the POWER/DETECT parts reviewed
first.

thanks
-- PMM
