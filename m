Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1063055njc;
        Fri, 15 Nov 2024 07:55:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV6SJtraAPBNbCqhfnaBUtSQEqFDbo/8/8ds/cwkZj08k78NY1wsCNRlfq2WIn2bFnzXST1DXgJmC2eDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEcQ6NDxev2twFkkZVYg8PTDAR5RuYuK9QeEW3t+jH7DP5L+vi8zmifjzeOpG/LrbSoMyIa
X-Received: by 2002:a05:600c:3b23:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-432df78c48emr22600755e9.23.1731686120109;
        Fri, 15 Nov 2024 07:55:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731686120; cv=none;
        d=google.com; s=arc-20240605;
        b=SCtCCNlwyWBeEsLb/nMfGPvGXrWtIK264spsE6iHcyXRgTcx8kp4Z2IArK/gAuqHzl
         Vk6AyEICqvBz75ienCyVa9HVy0dVfZh2cza/pD8yvYXUtYMRcKQmFv+3zJ8zCyUEnAr0
         2VEl6TvIvIMMadIdVS2F/5vwCwoyW/HxHPlBxxaM8KryMSVhmDNIPA9ccyEzlpiaVtPb
         /N0JP3tKsDFyfJFOagBC7SIOJ+O2o60BGYizmJxF2BvCQFykMoOt5fuPZIfUwtIJaojs
         XhTE8DUBXgZDAZb0QKSljxIjZomQ6rYSahLWLE9Sy4krtQCjbClfQYX3LLEsgbwu3rtN
         7Mtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=a4HYRRIA5q/ZGEnFka+Byr5VVSYP/JpvMLSv0fXPWGQ=;
        fh=OmGap1BrQqunjWIKW0uCOgrWdNuJ2HRBaVBl46JFxKA=;
        b=heMgCXkIryjfCj5TWvtxgVC5EVDRjP2WbiS61eaaIAwa8fy+xgTQQ9ZXytmwdsy8yU
         82HvFSz/f8X9VXZ0yuUXW5RqdwudbdCmyMZfpegMYBXvd5IWBXN4VBv4xv7ogHXXVFid
         tWu9gjtrqD53hGCjql198olf+/vnTl5oBmGZyKqTgJr2cEBoASNFuJAjvIQ9rIF1XJhJ
         KD0fWWoxA71eBSiL6BrQqS1+1HKy9370sIV99jo3UwonEMspiBhCKs7Y7POpOChGth5/
         /S2Dh8gGlXi6Fi468SGhKvqg1F27GR/ogrGt5Yp7IX+b9L4yFlIjdJtsZLYW7RDyKkRb
         6UTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=XHI2ab24;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-382232d4320si1577850f8f.123.2024.11.15.07.55.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 07:55:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=XHI2ab24;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tByfB-00021I-Nw; Fri, 15 Nov 2024 10:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roqueh@google.com>) id 1tByf6-0001y6-Vq
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 10:55:09 -0500
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roqueh@google.com>) id 1tByf4-00027y-Iq
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 10:55:08 -0500
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-856e51bf038so336981241.2
 for <qemu-arm@nongnu.org>; Fri, 15 Nov 2024 07:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731686104; x=1732290904; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4HYRRIA5q/ZGEnFka+Byr5VVSYP/JpvMLSv0fXPWGQ=;
 b=XHI2ab24JQdCPQ6fJtGvIowFA1Dd9gzJ9ey8vzlshHiK/Ccx5ndW63Bf7DSFBaLRJ7
 cmAcR7Ur6Bddc5hfn9YkuiyrU8LNL2QGNpw92XSK7r20i2K02zg5BNDxKi2byr8iL6Dw
 oMKMyihXwk179xMJecow23zI8p0bwvyMSt/I8lsCZzoVi71gto2J/xbslhPnPfKzb6i5
 qfApwtjIFugi2opGWZ8OSuBmBKe5w6YSEQFHL3K9nAuDjX/t4qR0UedX9d7TSF0yaMYw
 Obg6rVxZk/hoZgtUlPOxnRCeka8HvES4s48/F/jfDRtwBvps7GUskHg+upePGmI3zTCB
 4GZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731686104; x=1732290904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a4HYRRIA5q/ZGEnFka+Byr5VVSYP/JpvMLSv0fXPWGQ=;
 b=cAeHs1jxRLJKSdg51250Gi14PlmEuPvxs6jIXgTIx4F5xf+ro5PTmzqpWnvBib/UF9
 d3abvaDTb3hO8HHHsDD2PHHDX4GkvUoi3S4OIEuOPtnenMCZSf+mUn76zdLJNoIfxCf6
 D8bsfCRo08rOkXpM95sEsVKhsr2fA8a6DqGK6boVmZ6Hb1BkxKYrDwUrGy378o9b7rZh
 fU0Fy2kFzt2W6YTylOAHA0Wml1KOHDSth51pAeW9AUUJyxnFVOdo3oCTX2063doXmFx7
 IA+Nibhtf3L+VF5WVs4ZBpRhdkzeb8dW4kLEve/Q/G0PP7FWmQq3WUDSGI0e1PyQOTRv
 NdbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWike2zoa09NY+ulEUAILFSohn9H1gPhHxYmM7XYnyaVKshaU5AThdfCihL10WU5Iy9Ao0VGAjXtA==@nongnu.org
X-Gm-Message-State: AOJu0YxcbVihHFEMCl9crLSmbtvMvsZ6+bhUcXa5ltHOoYB/5Nei70Mw
 2D0YQcjfWfuWohfRR/89E2EDX2qV81V7dViMGKQK6Xfqrywn/9l3ChpT8mzon33hiyk+v5DIeOx
 CeTkk5y26VqtZtz8zVnd9YvKma96xpa1tJSid
X-Received: by 2002:a05:6102:5896:b0:4ad:635b:d17f with SMTP id
 ada2fe7eead31-4ad635bd208mr2773688137.10.1731686104289; Fri, 15 Nov 2024
 07:55:04 -0800 (PST)
MIME-Version: 1.0
References: <20241108191024.2931097-1-roqueh@google.com>
 <20241108191024.2931097-4-roqueh@google.com>
 <CAFEAcA9DDVqgOs7B3kC30=OgJ8iLZ3R3RB6BdEBMEKNxx0LAjQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9DDVqgOs7B3kC30=OgJ8iLZ3R3RB6BdEBMEKNxx0LAjQ@mail.gmail.com>
From: Roque Arcudia Hernandez <roqueh@google.com>
Date: Fri, 15 Nov 2024 07:54:52 -0800
Message-ID: <CAKbPEtYa6pr2v9rFizo5-TU5ong8j3zJVyWnEwTR2eK=cNA1Qg@mail.gmail.com>
Subject: Re: [PATCH 3/3] tests/qtest/cmsdk-apb-watchdog-test: Test INTEN as
 counter enable
To: Peter Maydell <peter.maydell@linaro.org>
Cc: farosas@suse.de, lvivier@redhat.com, slongfield@google.com, 
 komlodi@google.com, pbonzini@redhat.com, venture@google.com, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=roqueh@google.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: odUQcg1N7gFF

Thanks for pointing this out. For now I'll be adding the extra line in
the version 2 of this patch.

On Thu, Nov 14, 2024 at 5:01=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Fri, 8 Nov 2024 at 19:10, Roque Arcudia Hernandez <roqueh@google.com> =
wrote:
> >
> > The following tests focus on making sure the counter is not running
> > out of reset and the proper use of INTEN as the counter enable. As
> > described in:
> >
> > https://developer.arm.com/documentation/ddi0479/d/apb-components/apb-wa=
tchdog/programmers-model
> >
> > The new tests have to target an MPS2 machine because the original
> > machine used by the test (stellaris) has a variation of the
> > cmsdk_apb_watchdog that locks INTEN when it is programmed to 1. The
> > stellaris machine also does not reproduce the problem of the counter
> > running out of cold reset due to the way the clocks are initialized.
> >
> > Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
> > Reviewed-by: Stephen Longfield <slongfield@google.com>
> > ---
> >  tests/qtest/cmsdk-apb-watchdog-test.c | 214 ++++++++++++++++++++++++++
> >  1 file changed, 214 insertions(+)
> >
> > diff --git a/tests/qtest/cmsdk-apb-watchdog-test.c b/tests/qtest/cmsdk-=
apb-watchdog-test.c
> > index fe535a553c..3777b7bd59 100644
> > --- a/tests/qtest/cmsdk-apb-watchdog-test.c
> > +++ b/tests/qtest/cmsdk-apb-watchdog-test.c
> > @@ -68,6 +68,15 @@ static const CMSDKAPBWatchdogTestArgs machine_info[]=
 =3D {
> >      },
> >  };
> >
> > +static void system_reset(QTestState *qtest)
> > +{
> > +    QDict *resp;
> > +
> > +    resp =3D qtest_qmp(qtest, "{'execute': 'system_reset'}");
> > +    g_assert(qdict_haskey(resp, "return"));
> > +    qobject_unref(resp);
> > +}
>
> The system_reset QMP command only requests a reset; it does
> not wait for it to actually happen. For that you need to
>    qtest_qmp_eventwait(qtest, "RESET");
>
> We seem to already have several implementations of this
> kind of "reset the system under test" function, several
> of which have this bug. That suggests to me that we ought
> to provide it as a utility method qtest_system_reset()
> in libqtest.
>
> thanks
> -- PMM
