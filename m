Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp261350ejf;
        Wed, 10 Aug 2022 20:15:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4WP2RMtynnr4HWt/KFUaAGdFs+gB8+L2LBokk2TjhKfSlCyTSKE0INjawEIU/bWbyd7E/u
X-Received: by 2002:ac8:5915:0:b0:31f:31c8:7406 with SMTP id 21-20020ac85915000000b0031f31c87406mr27940897qty.347.1660187753297;
        Wed, 10 Aug 2022 20:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660187753; cv=none;
        d=google.com; s=arc-20160816;
        b=xLL9AZm8JpbAsFOJGlLyKNKz92IjO8yGpZTLPhh9czUF6xRWgt5dWpNxrCyyamHOTu
         MyGROTYXsBhflOVTx74hB/oFe+UDJ/hNCFYolqsOqo/pmzptc6NGzZOyVQsyrhUoWijZ
         UxS3RFn3D1StFpwWTVZc0MC/64g8R0kbIz1VXvr6wVeOHxHFLHP969eZa6oJViX4M2+R
         RoO4uvszBDELVR39pQ+lc2oDanU/xjPpbyxA0yPGb3Pe4LUMmtZuSKcpLerPIO6Fxue5
         c+3jOnTGEvps0PXtOJgvymZgQZwre+qwt0YgFMK5wGSl9170TU3O1vOcDCnnZdoly9cG
         Pr9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=D2IQtNqdvpHvUz00qnqtMiN66yM6U3oxqDqZn/rUVOc=;
        b=ZhvObafNt1FuQ8TG08JOc0cgxY/YcXmvibhb6M1RlJKGrF342fuk7Ng6sc8WHZw8Gr
         tkU0bBmbEV3e3iiUGwQpE+EARP32VaLA5cGp/7QCnuSN/g2ea/SAxKb1kaHkPYHv6PRD
         HrGoYY0j14JJuuIlrd1Xyazhx2tVj3F4+VRxhnujLK//v7N98c50LI8dx35ZrVl4lHxs
         UeMpsXBH5N1fQDNAlwa1QepYDzoajeR1EY7uKPuFPGtYByrrQjE8MnL4jP+z+/9xoND4
         AxltFLn2lQc5EBj8mkmd6KTRrtJFC9Lal68Her9dbmGgx1Bq4NODBpTvbv2dZjwMGHhm
         T9mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=hVfhhHoF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k20-20020ac84754000000b0034304d67b8bsi815167qtp.326.2022.08.10.20.15.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 20:15:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=hVfhhHoF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLyfo-0003Xq-Ou
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 23:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmw.bobo@gmail.com>)
 id 1oLyay-00043Q-Lq; Wed, 10 Aug 2022 23:10:52 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:44004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lmw.bobo@gmail.com>)
 id 1oLyax-0006Vx-3d; Wed, 10 Aug 2022 23:10:52 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id v128so17084717vsb.10;
 Wed, 10 Aug 2022 20:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=D2IQtNqdvpHvUz00qnqtMiN66yM6U3oxqDqZn/rUVOc=;
 b=hVfhhHoFyE3kJYQLKXDo4wKABkom9XmpMH79W/cRq+Hp3VLCxArg3zNftdTM+ZGwAL
 Jy0XcJIoX0I0TZrBT1qA6h+mhJTro/ARNNyqgijww7CnZPAjATV6wsmcWXS2gpzKu+S3
 xw+qfxcIxF4ELDsfVoOfB7hacSTuNjOOls2J3aVNot/2AYBe/BLujFZwQqVDOyOA/6SE
 V3JhyLvqrI8kKih40V2PuWyjI3GlzUxJg6567McXXuuS4PxlQmZDW5A+z4+eoM8YsGPr
 0G7zVA5B3CdywtrMI9/2WvScoF6iE+bBAYUlEymoFwFWthd6qYHPvoIrxDWM1/W94Isa
 wTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=D2IQtNqdvpHvUz00qnqtMiN66yM6U3oxqDqZn/rUVOc=;
 b=0PqtbwrMLLonjC3ezum+BXyD1oE8bwY1TzaYkyOlVK4By6UNvjwkO5IIcjNWHPKOq5
 yJvF464kUJH1FF0JqMYHMJcZ24okn7L2NX65offh3CEMGuB/VEFmbipZkEqK42Bxf9fy
 QD735jRqJKizscsfBtjgF+9+1c4ZSUa+QARPXn1iLKW3vrEeRvM7s2thArdc5vuE81gZ
 oQsXW0I2x5kqKyMOIItw84Mqzkrp9DM41O0QDfL9HVIf4D/bc1nCklA+mtUmMuU4hR8X
 Fc7++PDoymR+s7rnEUvK/oztR7IJ5bGXxzUK7RxTd1EhrQb0Myw/Z3DhXfQzlu6BxrFW
 Ha1Q==
X-Gm-Message-State: ACgBeo39Wiw5JBt6AEsblbYBTUgXKtgqV/3qHLKuw+7kPhQZH3Z64N1Y
 GmKCCqR0jm178TjMvKjgZiN4HiAP/Stv6613cPo=
X-Received: by 2002:a67:eada:0:b0:388:95b5:886f with SMTP id
 s26-20020a67eada000000b0038895b5886fmr10695438vso.10.1660187447364; Wed, 10
 Aug 2022 20:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAGr_yG0UrfJAMWta3EkR1F0JZ4j--sig74p6vKL3K6TZDx9YGA@mail.gmail.com>
 <62f132aee401b_1b3c294c@dwillia2-xfh.jf.intel.com.notmuch>
 <CAGr_yG389Bm_NL8CLgo_ZkGd4staocNENbtb-ULVA5vh_ywmcw@mail.gmail.com>
 <62f27a8e9acb6_1f18b294e2@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <62f27a8e9acb6_1f18b294e2@dwillia2-xfh.jf.intel.com.notmuch>
From: Bobo WL <lmw.bobo@gmail.com>
Date: Thu, 11 Aug 2022 11:10:34 +0800
Message-ID: <CAGr_yG2_qpDbzB9KxP=yD=PYvjOxCckT5nCv=M53GgENNJTW-A@mail.gmail.com>
Subject: Re: [BUG] cxl can not create region
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-cxl@vger.kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=lmw.bobo@gmail.com; helo=mail-vs1-xe2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T2k4RIUmbUHB

On Tue, Aug 9, 2022 at 11:17 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> Bobo WL wrote:
> > Hi Dan,
> >
> > Thanks for your reply!
> >
> > On Mon, Aug 8, 2022 at 11:58 PM Dan Williams <dan.j.williams@intel.com> wrote:
> > >
> > > What is the output of:
> > >
> > >     cxl list -MDTu -d decoder0.0
> > >
> > > ...? It might be the case that mem1 cannot be mapped by decoder0.0, or
> > > at least not in the specified order, or that validation check is broken.
> >
> > Command "cxl list -MDTu -d decoder0.0" output:
>
> Thanks for this, I think I know the problem, but will try some
> experiments with cxl_test first.
>
> Did the commit_store() crash stop reproducing with latest cxl/preview
> branch?

No, still hitting this bug if don't add extra HB device in qemu
