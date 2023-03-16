Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp199176ejb;
        Thu, 16 Mar 2023 04:42:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set86MnrRBk1lSlZraWOksGxx5xg7FqWWj/9vTOUmleYeDpTCCU163M+3VT+nVdpjq87636lI
X-Received: by 2002:ac8:5d8a:0:b0:3ba:1d8d:f6eb with SMTP id d10-20020ac85d8a000000b003ba1d8df6ebmr5620254qtx.58.1678966920744;
        Thu, 16 Mar 2023 04:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678966920; cv=none;
        d=google.com; s=arc-20160816;
        b=HVdqFBw9ZC/nMBpZNe7MfzpHRCIxhZCr0GQwUMFhxG87ygiGsCNl4BCJHwXGdDMwly
         RwOrgzJmB+Gmwi7xWqxq1mSEiZw4SHwxGf7FTrYvJdTzpDGCYhZteyDaQHQ67BzeqP8n
         4VwNW1kSDbHMZ6RS1gGAJFBY9mEXmw8bfmQsry9vbA7WCrVaHX4f62AoBfPnLoj8vQ82
         XsQnciHjZNH+2MNs08eyDjcHOMsMkH66cUrCeqZz+8weHXtGw7irJoGxSouDWDgvZM+J
         H+ChM0nlcZytY4PLAsUh4+TNrvypOe5egQ/cgo3A8FOGYjetvzcFxvvOTmCq/ITZ0Cwr
         rDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/Zj39akCcROzUmrFX9bcj8Cao2d39Tn/yjMgtiFgGpM=;
        b=NB/FhmGJmcsWt1m7bJndl2miQFDN1YoopVllYKIG1MusBJAJHIjU/yZTjjVBUAJhRk
         zvgthpIx4t4CWkw6Ngsj+/KMXg0l2psLt0gRVBVwMgdbj1jD8ul6jPuiPVPFVAEf7p9C
         CT0Tf/xRdRYUKipTHFH6e00yppodqsRaC+PTTnUOfsKjrgjxuNlfvCb9PmgY2Nifcldx
         iJUJP5LeDYJJjX28WdbiHzN2UefZneIKqIa2U9E6y3TA7jwizUzdjj40rvjWN3dTwKe9
         deJhWOe+P/LxTXGViPsgZB/48Lqthe5RrU4pfY9HM01nnvSF0CagwtFJA7WfnLc03/t0
         U57Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WIljQG9b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v30-20020a05622a189e00b003b639a807b1si7158144qtc.748.2023.03.16.04.42.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Mar 2023 04:42:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WIljQG9b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pclzX-0005eQ-Jb; Thu, 16 Mar 2023 07:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pclzS-0005Yi-Gd
 for qemu-arm@nongnu.org; Thu, 16 Mar 2023 07:41:51 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pclzQ-0000EX-2g
 for qemu-arm@nongnu.org; Thu, 16 Mar 2023 07:41:50 -0400
Received: by mail-pf1-x431.google.com with SMTP id ay18so938815pfb.2
 for <qemu-arm@nongnu.org>; Thu, 16 Mar 2023 04:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678966905;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/Zj39akCcROzUmrFX9bcj8Cao2d39Tn/yjMgtiFgGpM=;
 b=WIljQG9bsr3o+HZAcTZmV9RAMbqlbbnmVsloieiQ9bUnnZjapqP287L3BHbEGqpgzI
 vxezI42O/xJ0ePQPUOcvzENoSTEkAkLWjHjmFCo10DgfFrMLD+Yofop5tRHE877AJhvc
 2z1ewuxYMC6R3fPkwUq4YtlA8uKp96MksBqe/G85EpoOxiyLMhuq37dkOuntF3gCI61s
 dAT8JKmWPnzSY4bkGpJ161PwmasNxC0AWKCSyPmzXaX7+F7UwumxsIaejY6J8A+6kJox
 rNniBlWtZCIp51yN/rWXSItqtdZdjGCAOjBJPJqTS61OZj0ryuUttJss9ho5n741FdQm
 aLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678966905;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Zj39akCcROzUmrFX9bcj8Cao2d39Tn/yjMgtiFgGpM=;
 b=w4IsCcUjzb+wh4HBwWQJSrpeao+8sx8sA1zUY9BdGfhIwvONPqkW6T3dqYl/BdffKJ
 vv6jlpfKUHGmmi9Eg1AXm8Crdycc84IhS+xTSBoESRzo0BYji2RROfe9LBy7Aout2g0U
 tMxYiCYQY+iUTnMZOdaienbZU2sPaq1zpBOhvNb3/5tXmz+Q6NJdQ21kVrP76BXzSvxY
 Ch7z3j0Ssvo3JQyrx3blqUtkpDQ9c/S5Qc21f//joPbsmExq7zcb+9hzxHxfKrGncra1
 F2oQRp2xTB7IHKzmCRq9HSCDYrPYswRXht+inxcDcI8YW4OEZFoyooUgFt6BL72cJtkF
 Mt8Q==
X-Gm-Message-State: AO0yUKUAJD08No/ya5Ag7lFBbkS+YVF6fseTGt6U0iY0NPp2PGnsTMRP
 +rPjveIls3W/sXDj1jjx96p5n9J7yLxhs/hjEN3d+A==
X-Received: by 2002:a05:6a00:1904:b0:623:129f:6269 with SMTP id
 y4-20020a056a00190400b00623129f6269mr1411466pfi.1.1678966905403; Thu, 16 Mar
 2023 04:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230316105808.1414003-1-peter.maydell@linaro.org>
 <87h6ul0x4m.fsf@redhat.com>
In-Reply-To: <87h6ul0x4m.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Mar 2023 11:41:34 +0000
Message-ID: <CAFEAcA_NiizU4RjRDNFU2==sHSAMZxYJm9dkAXw6M1AZGGyA0w@mail.gmail.com>
Subject: Re: [PATCH for-8.0] docs/system/arm/cpu-features.rst: Fix formatting
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: QId7HrXsjpU1

On Thu, 16 Mar 2023 at 11:11, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Thu, Mar 16 2023, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > The markup for the Arm CPU feature documentation is incorrect,
> > and results in the HTML not rendering correctly -- the first
> > line of each description is rendered in boldface as if it
> > were part of the option name.
> >
> > Reformat to match the styling used in cpu-models-x86.rst.inc.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1479
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  docs/system/arm/cpu-features.rst | 68 ++++++++++++++------------------
> >  1 file changed, 30 insertions(+), 38 deletions(-)
>
> (...)
>
> > @@ -217,16 +210,15 @@ TCG VCPU Features
> >  TCG VCPU features are CPU features that are specific to TCG.
> >  Below is the list of TCG VCPU features and their descriptions.
> >
> > -  pauth-impdef             When ``FEAT_Pauth`` is enabled, either the
> > -                           *impdef* (Implementation Defined) algorithm
> > -                           is enabled or the *architected* QARMA algorithm
> > -                           is enabled.  By default the impdef algorithm
> > -                           is disabled, and QARMA is enabled.
> > +``pauth-impdef``
> > +  When ``FEAT_Pauth`` is enabled, either the *impdef* (Implementation
> > +  Defined) algorithm is enabled or the *architected* QARMA algorithm
> > +  is enabled.  By default the impdef algorithm is disabled, and QARMA
> > +  is enabled.
> >
> > -                           The architected QARMA algorithm has good
> > -                           cryptographic properties, but can be quite slow
> > -                           to emulate.  The impdef algorithm used by QEMU
> > -                           is non-cryptographic but significantly faster.
> > +  The architected QARMA algorithm has good ryptographic properties,
>
> You dropped a 'c' here ----------------------^

Well spotted...

thanks
-- PMM
