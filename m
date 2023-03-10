Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1725207ejc;
        Fri, 10 Mar 2023 01:49:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9G58LILKwT0sB82bOW8cbDiIQKAMeV0pCHUxDA3n/G/4V5/AnlIEGq8c3JQGb4PQ4Zb64Z
X-Received: by 2002:a05:6214:d83:b0:56e:fb1b:3c7b with SMTP id e3-20020a0562140d8300b0056efb1b3c7bmr42963188qve.38.1678441777412;
        Fri, 10 Mar 2023 01:49:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678441777; cv=none;
        d=google.com; s=arc-20160816;
        b=B3NCkXTc4xyX7fICNmxifnyQqKB0bT0Pbh+DubH3yuVvjYuIoDX8gslHD0XsVQDCUA
         QmzzyZHnoU1YZfeKw/XCdz7u9bEvWvPbmMDgfxeY9P6F2CGbgJ2OTg/KYS13AbRREhXM
         TELJUSY8qD+y1U7Xegi4Xr52kxuu3TcbeeycXZrKPzsrKYUp7OLFo1ZIp41ZLbB6H5Zc
         njFG1b1IV+AQVV3DYI1XzVOWkyqS8k7jFCq8HsPnJ6+mS2gQCUzvZSs1YoCQ4f9nfaBL
         OR4/8x4JlJAEux8XvGbLdyklF6tZolbJZlX6XISMSxbayjXmMSXCq10IoaaqtbNCmVgv
         sOIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=e03sQOMrmWIaQfCQxqdPKUhG43m6vHDtMFADqhTUi1w=;
        b=lIkem7GXnZPZqFLgvyvwgx/uzC9WI/Hg3TqrSYQIOSySz/rriJkYZkvdljPYGnW3No
         yoWNwBZhoaVLYgdSAVY8n82PMaq2I0yoD71ZdvxADG/5MUyjmBsmYsaCuqZSgT1IW3VE
         q6tRnxGTX7Qb8yS8svcMXyJylump9z6apaqM1p/dExYXC/3suqFcSjEFhMr0/3Za/g3M
         NCTYAN+x8zFUzF+HaQBhgUIHbukculy1Qhj8Uw1MgWWp4lULdr8+tSjuRtfCUkQXcttJ
         BblTHtoGBw3XZ8SBBUNR591CVX7plnZGKfCZI40acFJN+WAWkxk/mXSXdMI/a2iXL6Vm
         ZzjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cRadii3F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11-20020a0cf34b000000b005376fc51789si1402306qvm.43.2023.03.10.01.49.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Mar 2023 01:49:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cRadii3F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZNL-00032T-Km; Fri, 10 Mar 2023 04:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paZNK-0002wG-HF
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:49:22 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paZNI-0002Hd-U5
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:49:22 -0500
Received: by mail-pj1-x1031.google.com with SMTP id bo22so4801458pjb.4
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 01:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678441759;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e03sQOMrmWIaQfCQxqdPKUhG43m6vHDtMFADqhTUi1w=;
 b=cRadii3FBPZ8HinJJXyk2hsR9I9RoDbBIIaSBwesoK7n5XMX9OoTByE0rA42XsLhBG
 FAWriaoeWL5hjs64IBuc1jLWHjOJIVObXLOL51DvmiN2bHfN2UZ4XP5YqlPRKsgZnIGF
 lc9X/ItgO4MKhdTaaobWTwZz+LbhCUX4MVEMxY2++ebSnUDJ26PNUPXQDj/kSgnIxHTq
 Ya1WYVkfHSz+xixIE2h0asJB2UkkzRq4FX3tdNS6GjLZjSZOvhUSclsdZqZAR8Sk3G3V
 E7mkrAM6+xppHVs3adC/oNQkZ53QkImIGLs4Bf8EwZKxDf8T2XRBrqR2v54dJRqNls0K
 NaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678441759;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e03sQOMrmWIaQfCQxqdPKUhG43m6vHDtMFADqhTUi1w=;
 b=yhOHYt96V6WOIHna2yH+NjiMYELUnQBDsMgEq/oRzw3RNGU6An8v6ehBK27xj1cN2F
 SYoup4JjmegoQgJg2FSHDC6uMPd1zfLqtSOX172Q217wMDEpogu8iAhWRf0Xn82J0mq1
 tVwvhR+//zYRgOf4w3rGCGcwj63SVaPUwiM6Lg3bX1XUQVmPrWqS3ELccX1uqXIKhDjI
 uJDpz2JuPiq/oKMcl9uI7v7QM1dUNyFzHGTu4UH4sC5XLsGTMWwTQ6oRv+LTtLc9epUU
 ZXKKWZ88A5lDQT+S2fygppJNhf7oPal9QveC1wZK6llxRwAGvyGcMr7QUbiCDt/wzWKg
 ey2A==
X-Gm-Message-State: AO0yUKWSy36iBWy4Cgua4ZjegM/fA6/ctrLkqJWV1wecH7R3BKaW6Jse
 RoDauO8k+Ayk+kUHu9C44RO1xCnxc6dCCDc7eEFPOg==
X-Received: by 2002:a17:90a:528d:b0:236:a1f9:9a9d with SMTP id
 w13-20020a17090a528d00b00236a1f99a9dmr597109pjh.2.1678441759068; Fri, 10 Mar
 2023 01:49:19 -0800 (PST)
MIME-Version: 1.0
References: <20221219220808.26392-1-agraf@csgraf.de>
 <CA+E+eSC-Q9SvTR29qbYRMPfo10xhM9OtaXZNO6iJp0UAA96kCg@mail.gmail.com>
In-Reply-To: <CA+E+eSC-Q9SvTR29qbYRMPfo10xhM9OtaXZNO6iJp0UAA96kCg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 09:49:07 +0000
Message-ID: <CAFEAcA-40Qt5XCK7_M6kdCYNWy+nrkx2CKgrBuDYRmGA_u_oOA@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Add support for GICv3
To: Joelle van Dyne <j@getutm.app>
Cc: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: AO9QHTcxpvFt

On Fri, 10 Mar 2023 at 04:55, Joelle van Dyne <j@getutm.app> wrote:
>
> On Mon, Dec 19, 2022 at 2:08=E2=80=AFPM Alexander Graf <agraf@csgraf.de> =
wrote:
> >
> > We currently only support GICv2 emulation. To also support GICv3, we wi=
ll
> > need to pass a few system registers into their respective handler funct=
ions.
> >
> > This patch adds support for HVF to call into the TCG callbacks for GICv=
3
> > system register handlers. This is safe because the GICv3 TCG code is ge=
neric
> > as long as we limit ourselves to EL0 and EL1 - which are the only modes
> > supported by HVF.
> >
> > To make sure nobody trips over that, we also annotate callbacks that do=
n't
> > work in HVF mode, such as EL state change hooks.
> >
> > With GICv3 support in place, we can run with more than 8 vCPUs.
> >
> > Signed-off-by: Alexander Graf <agraf@csgraf.de>
> > ---
>
> Tested-by: Joelle van Dyne <j@getutm.app>

Just FYI, this patch is already upstream (commit a2260983c6553).

-- PMM
