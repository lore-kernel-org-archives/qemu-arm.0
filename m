Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1425773ejb;
        Thu, 27 Jul 2023 09:49:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGOtgxKy0OE3YGevY5vu0k3C5lZrjexD/WG2HVu1ma46Hl89alGXrCsPNYP4wsWn+SToZKE
X-Received: by 2002:ac8:580a:0:b0:402:2e84:f06e with SMTP id g10-20020ac8580a000000b004022e84f06emr75390qtg.27.1690476595048;
        Thu, 27 Jul 2023 09:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690476595; cv=none;
        d=google.com; s=arc-20160816;
        b=EJ524A8jphgT3Ey7kGoCk/wvMCYCL68iy5f9E63+o6iLMLIOdokbjzv/znEUKmALfx
         nMXqr9TwJhf+Kd8mYP8eQP2F9+S/Y15/8ZOUrqhaUZXz0aZwwr5S+uY9+i4Y6Z0RKWxy
         OOVmRsWUhx3S/WHanMCI8jmMIEDqY4G8gb/dQt26QpgpBqkKgNDiq7PCfBPvFYOENNGk
         BLJh+49HXZfr/O85imHLWn61PDpQuLkSYa8HUxx0V7q/eoiGVitwUQgQ6L00Awb4Zi0B
         BPMBRQlCFcateCmTxmfuNWwlNoFjvczJsY3muTRBNo6zvujk3TOxOH9D9cgXjh9mr3kG
         NdNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ATtLFGQUcWDGOEGU9Sv7z00BgRg1ac5CcPUhNhDpLYw=;
        fh=XBL7wuOnmyes3GPK3AEoJ+XBo7B8JI753uFIVICnU40=;
        b=DSC7UjpB/iaFGRIUGdcgXqijElsaeHdOhkA1MjJrIT/s2oZ/mZxgRoM0hpQu4eM2zR
         v+hjUVMytWFYwTHCeJhUCzmI3ROhgdi+L/MQ4tn0bRusIchz6ZWUKaha6zY6C9To59Hq
         kEWLU5diGm5tdQ7zjAM9+pM3dvW6v9yJXHNaaSIW7aLK3SmP6L8OpHKlhQKMSRNFVyfC
         JJ/xvW9+bO7nX2Ay+Z9G9DVx8ZgkvSKXrdu0Iq7PsoIGKSU/MJRPlJfz96LldjRi2JeE
         Az9OFWbF/yOqpPjs5Ux/pTAAWN79hkzMWrgDosyUrBGIPX6iOtrkbIYrfhlpa+/Tc0uJ
         tJWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YWsgSyZ3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14-20020ac87f0e000000b00403c6a9fa74si1029121qtk.350.2023.07.27.09.49.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jul 2023 09:49:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YWsgSyZ3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qP3nY-0003U4-FR; Thu, 27 Jul 2023 12:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qP3nW-0003T8-Bt
 for qemu-devel@nongnu.org; Thu, 27 Jul 2023 12:25:06 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qP3nT-00006S-M2
 for qemu-devel@nongnu.org; Thu, 27 Jul 2023 12:25:06 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31758eb5db8so1185484f8f.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jul 2023 09:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690475100; x=1691079900;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ATtLFGQUcWDGOEGU9Sv7z00BgRg1ac5CcPUhNhDpLYw=;
 b=YWsgSyZ3RJzki4VOYiozlA4stCKofK8Vnq19e43XLjUPKyoJnTB4rVscRk1rjkbPf3
 OWOZNKEqpFzOfMcNGWe0rYujrbqyTQE/zxeX8AeZSaGI+Rctp5ID2CMDR5GHAS54UvNE
 lpr52G015g24ke/jt4ufNNODIWJFX4+SclBdvVmLh+INFhFsBAwHEJksQytN2m0ajfD4
 zXPCQwH526L/IR0qX14Dam/DtPwIo2A+sC013iYLHo5K+O5FIoqQibYxucjAuDdZxJ91
 VqgBI23I2GGjxwBIRPj9gwWevOjci/82f5zzXzFgCm2WRthzYh7764Eh1i9XmX+eUry2
 A9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690475100; x=1691079900;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ATtLFGQUcWDGOEGU9Sv7z00BgRg1ac5CcPUhNhDpLYw=;
 b=j4veH0NvwO+Wh+kX7JCjxxi8KhKBmPQsKhtyRlQW6VKmgYW8UY34vyfovIB3ncyHk0
 eprzaKDsfEXWU2fkpaFpRQBNTECVtR+NB2qKpSyCpG62Oj6v9XacRH7nmNr3/u5/YoJw
 10oqmqHXX2pwA87j+k9EdCB6c5IZiPXPnNYI89qFAQWEffpcEHscHKDxfNK7fg0cRmDo
 vsDoDeBS/D2tvY3Dnoip2qWAczHgUcA3ljWirv7zdy37Ud2TvjuQzj/P+s3blLiR+IBv
 IHnohi/oCRZuDvSvlCBe/TtBVdap0Zy9pg1WUOy0eNGIfvEc3OCyACYz/80pDEL4D3ST
 2yZw==
X-Gm-Message-State: ABy/qLZjF6PdRrELCZVkODIIKhi/dNgdrxH0j+4j5cRtjcJq+zghTwMO
 pDoO/mUOiiSIHQdfc9a8CXeTxjNq2tHNPptzxq2Dlw==
X-Received: by 2002:a5d:4c4b:0:b0:314:c16:56a9 with SMTP id
 n11-20020a5d4c4b000000b003140c1656a9mr2309208wrt.7.1690475099825; Thu, 27 Jul
 2023 09:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230726030450.757462-1-chris@laplante.io>
In-Reply-To: <20230726030450.757462-1-chris@laplante.io>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jul 2023 17:24:48 +0100
Message-ID: <CAFEAcA-a-xqeuKWpimA46kneXPGz2oWnp6FowpuGX=s8jh9myQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Add nRF51 DETECT signal with test
To: Chris Laplante <chris@laplante.io>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qzpWNTvocTiX

On Wed, 26 Jul 2023 at 04:32, Chris Laplante <chris@laplante.io> wrote:
>
> This patch series implements the nRF51 DETECT signal
> in the GPIO peripheral. A qtest is added exercising the signal.
>
> To implement the test, named out-GPIO IRQ interception had to be added
> to the qtest framework. I also took the opportunity to improve IRQ
> interception a bit by adding 'FAIL' responses when interception fails.
> Otherwise, it is frustrating to troubleshoot why calls to
> qtest_irq_intercept_out and friends appears to do nothing.
>
> v1: https://patchwork.kernel.org/project/qemu-devel/list/?series=766078
>
> Testing
> =======
> Passes 'make check'

There was a trivial typo in patch 2, and I think patch 3
needs some (not very big) changes to handle named GPIOs
where there's more than 1 GPIO in the array, but other
than that this is looking good.

thanks
-- PMM
