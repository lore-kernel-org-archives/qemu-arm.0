Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2400403lfv;
        Mon, 1 Nov 2021 11:38:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR2i/VDDh3aMsd44WbMTVc4+BOchluitW2Ka6qZ0MiWdqhIOi3xnLfn9dDxvJ78wQseO5u
X-Received: by 2002:a05:6808:2017:: with SMTP id q23mr636079oiw.122.1635791920990;
        Mon, 01 Nov 2021 11:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635791920; cv=none;
        d=google.com; s=arc-20160816;
        b=uBjkwXA0jYBJNImUjvVkRoSmXdNFaXd5YrO+s9CKz9flrW0RY6tjsESRWL6LlzG2fu
         z9jC4WvMW4WrnqSTa+kxppG7CMDgccr6y9zwLJOK4/kDeCxiVsIgBvTrQJ/rBaD7pOpD
         IEzfD0ulEMN98j7cSXK+WcuOOVCPW+MpTld/4cV758nQWahYSLxuclR5Nskk481FBaCf
         20v2KIkBcf6OkKx/mRoxSS9OMI0tlUgDmTvpbauNM4rY7RfDlBeWEZf+kCS4L90oRXvl
         os8lHrL/l2CYuOF8rpLcPJpjOKxqy9aDTlGPZaqMFd426CMTujQhFCkZ9NYz+DU9nUi7
         dTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIfF9Q5jtqgHSiOEzayE5kDcB0EcnOzj/tcoXqeCSWc=;
        b=le6iw8pe+uwWalwOtSLUaGJ7z0H3y/Epbyp7iXXgONIm8ORS+CBhlxnnyHWoV2j+oN
         tN0QDSjrBdyCO54nbCBb1zrY4Mn9n5uayp1rLsjTzr6KtA2GGCO/jlKnzOreVftgpHhG
         OerW9CbQtejMv9MbzK6FsWt83es0jW0dPyW3u1yeXXW8gTIQeMyu7e5RceFHpuRtuVdC
         RTVVrapm34bR0DZxd2em9hz/ieZYhPiZ0Oevz+ku4fUfQoWWVcChIbBudkDzMW/nDfxN
         vZ7h+Bj3tCgp4vBzU9QPNWYYRPQNTu4l+elAIs8Zts+mbZGg5qvkHrIVjDOpPOGdPtKN
         JYVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Yl4FYgtQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si21531594ooe.36.2021.11.01.11.38.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 11:38:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Yl4FYgtQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhcCe-0000BY-Av
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 14:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbDt-0000oi-Lh
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:35:53 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbDq-00034t-O0
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:35:52 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d5so13896375wrc.1
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cIfF9Q5jtqgHSiOEzayE5kDcB0EcnOzj/tcoXqeCSWc=;
 b=Yl4FYgtQ1qDSSsuTJ9fMIRZSFp+niJGkMLksxm1818MTesESzkg/sg3cXtHYncNGIe
 8la4TyMsNh5nnMqHuFIrAtj8nAMAQD/qluZ8ymmnD8RUEipxI5ooTgN/z35hBk3u7OkW
 UjGBNpom/0i07gnnvcC0wGMLp7/V2K0yYLC9mJcf9875C0TM5bC/8zHZGbK0DZjKy1Kx
 Xf+fGvDOwoO8D6sIc9pUXNcYc347kHccyyRvnSkktMo5FmBJpxDT/YtzzVL+O7qXw0Dn
 JWZx1VHYims8OXVyGKlDm8ItMO9darXlvRit9m/9yxnjIhysCj+z+CqT3oO6ZrOOrVQK
 qXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cIfF9Q5jtqgHSiOEzayE5kDcB0EcnOzj/tcoXqeCSWc=;
 b=RmFYldufzVPaETTeh27tayKn08x9jXil7SeyeoMY4q7ooV9dSkF5y1nz3I+iJvKHdq
 04WVch3lBNctZvJkO3J7fcBRNifXF11yDgYsj0m7RAOWmUqwKzYaIJGpy8uMTQNrkD5B
 iR2Sg1z/8CM+jsN0I+q72YyvUBO07fUAa5lBI7fGef6j3s1nzUUDMZA9mtWCvChWKjhr
 3hBA7sSXlghG119SEX9zGdZLeNTImmHSXWQXl1PCV9wMdU+4LHBBEGJJOTLVPljE5+8d
 GdCoe/Dv1d8BqVb1OJ/WQl1ZgZHM10TseBkOTVEqTQyv1+zekisCzcni31l5xSCRcPt8
 IFxw==
X-Gm-Message-State: AOAM533OlBl5OHARGttrxJwGy4Qz5c75WyrwHfNS7CgqCgKMcFMWHlEq
 toYnxk7dkU21slxqy81VKEwsErNEGIHm2ji4rJQunw==
X-Received: by 2002:adf:c40f:: with SMTP id v15mr30103820wrf.302.1635788149416; 
 Mon, 01 Nov 2021 10:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-4-wuhaotsh@google.com>
In-Reply-To: <20211021183956.920822-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:35:38 +0000
Message-ID: <CAFEAcA_aCve9VWBGHoZyzTGZNrX16gFZoioQTYC+Crs9NwbpWA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] hw/adc: Fix CONV bit in NPCM7XX ADC CON register
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TcNAu3m7uyDT

On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> The correct bit for the CONV bit in NPCM7XX ADC is bit 13. This patch
> fixes that in the module, and also lower the IRQ when the guest
> is done handling an interrupt event from the ADC module.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture<venture@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
