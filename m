Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D19CD7237B
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Jan 2026 11:59:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vjFoR-00013W-CY; Fri, 23 Jan 2026 06:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vjFoP-000124-43
 for qemu-arm@nongnu.org; Fri, 23 Jan 2026 06:58:49 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vjFoN-00019A-AE
 for qemu-arm@nongnu.org; Fri, 23 Jan 2026 06:58:48 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-7943b51898bso6628847b3.3
 for <qemu-arm@nongnu.org>; Fri, 23 Jan 2026 03:58:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769169526; cv=none;
 d=google.com; s=arc-20240605;
 b=lWVj4T6/iF6Fh+qWH51uPrOmTz9ZTkVkWxC/oaOGpIDBHpoJLnTp9E61XCQW9QrrZ7
 KcxsFAUtHrnVzqlqGBySE0y6m2OvBapgUV2BRKKi/mwPhdgZsplcB9riwXdkn7M7nmVG
 i0JWQN1GHp58OObZ0fVDNm0bJQJnViJb8T/NLOWLTtcbSiX9DahqWpgCh1bzVzRNSdja
 fCGgEemUY+c086B1iUAmhGHBd9letbDAeWTq0l3uRcuPi1DhKU1qVixMIKVOpffwVxWy
 8H6IrhosMT87BX2UrXskWA9vGA6vviv/Prlp5UvTXXhc7l7Wy8guQ3sc2/qafSuaK6kw
 ZFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=O+kYNhCktaG6qohxbKdIw5yol+32W9ziCx/YJX3RCnk=;
 fh=+a0QnppwECzzcU5P+ooT0yS8ewIxlza/1kvmmv/+I4Q=;
 b=bKc8IFhKGXz0V7I/eIkPXSMD27UpfMIKRs1wDm+4MkvkTt0UGBEkus+N55Wf/WujIw
 6NHbHzOdG84Zpt0SKxQWKOGuTPzrts4SiYYwRKGKuZVR6Vgr6OSmo/WiBUwRVkd1Uqi6
 jZCflj1Y24pES+CPtsD5xxR7NK4tWW670zu2TA0V95nb7eJO+XvUDB9k48hDlAMMvJNy
 c3qKn0rYYTXvTUUFC/U4oToXyhVRTO4Nv2VuWIGQnBNZqx7PTY64zh+px5NQMnYUnH18
 DIQHMMpymBveaQAmiqcTfhJlfSnTP7gjzxybROFcxNepjFwN/F3KU4zRssCOZW5MBB5u
 YXCw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769169526; x=1769774326; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+kYNhCktaG6qohxbKdIw5yol+32W9ziCx/YJX3RCnk=;
 b=Ef/1HZXHKs35L8Vu5Syn1ToRsQmURsaYVn38fu1Qcg8BFlPVaC/17Xg3NgnjG+k9vp
 XeU96zH/ZvTsNs7ljNLiYYBYpwTq4OV71BmDBzD0QxUoyWpkkYDfdLeQso9DtPDIESNC
 vjhI7eZMLIUFK4ONiaceXvDwvdT7iOWj141dWm9sSqR64VcsKEpBxIeb7bvBIvWTxepU
 zV9k2q3jFfvvZcu174FGEvOcg4KpPrF6xG6QqmZJlmYC6UxEkhRnFz24C6s4bL2YrFmh
 2LN9oQlhhdMDaTouwo6/QChTs7qwDVdi34waBfz1mWmZBmLWNOP2Hw2S7AcnBFArsBnr
 GJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769169526; x=1769774326;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O+kYNhCktaG6qohxbKdIw5yol+32W9ziCx/YJX3RCnk=;
 b=w0KDQdiz0+xboXBJ214Q8Z6cfuvXmyI7w1S/kwxiIN/y5b6TAh/U9Bp4OIMz1JpkXo
 KDfcSgjGtGgfeAF3+NnRh0QUcQhB02R5GnGMle8aUQTOo9nXZTUxuTBwCIESnWEAHarS
 38M9Bd14e/bkH/41AbNnLomLbsU4hVLoaMyTeu6cpDGJrr2QbmUhFqE2Sy6+joOHp/5a
 wFUnH5dJRNdvRzoRjfZBaQtPgWycAODhRwEUceY4D4H2CMIirzWfyecAUGPMPjmmNgbx
 ar8s+Mhd8NC1JrM97K6JUu+pBNVG2aMq+qrNUHPKxMEej2XPVGfkKylxtQnCjSx7Dt13
 sVKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ2x9jxb1BNdbfd0LnAujJozVIFbIT+7K22aB6g2qOx7aqFl1a0WvDpYextG9E97gAzfv1MJLOZA==@nongnu.org
X-Gm-Message-State: AOJu0YzM5aTXomFD4g0UAGJi3EyiWWqPeFJ5Mx3HyrkX2F8w4dMAKkqz
 sVgh+NzyQC8zyxsLlUdGX1OIB+RNbkQc15qAaTKS7PK6wKX5kxgKenJEjM7qoi0aWALScxRUlyQ
 MVoI3rJNBYsbW1QGDnNCNTlTEeUuzjduzQFZD9ZaWAA==
X-Gm-Gg: AZuq6aIcDh4SLvSPl+RZzjN3fTBFb6Xct/wwVa/xxjFuQaQJYmexiZbsJZf124Uh522
 G60DdMHsD+WfAn+1O4p2pTwNNcs91Hbpggj31AHKI64fFZytcIEaxXeNe+J78tlP9cK3tUULoYq
 YaRAYmOKlfC+lm9LJjdtK2x3b+L74mW8IGFmuxaO68WCoq3WrLOR0T2TWrTKqYYSgjkpawSgo7S
 vLNHmHJh6jjmvvywQVgkWdiDyyiUbwdc3RR3Saj4JjImUcy8UynS6dR1NJ29Jgpz0fMgcv+hXOL
 cS3C
X-Received: by 2002:a05:690c:e05:b0:788:b84:d4f9 with SMTP id
 00721157ae682-794399f84famr18964537b3.57.1769169526071; Fri, 23 Jan 2026
 03:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20260121175248.87649-1-skolothumtho@nvidia.com>
 <4d1a883b-5465-45af-8dcc-eb905f552c29@redhat.com>
 <20260123114149.000065c5@huawei.com>
In-Reply-To: <20260123114149.000065c5@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jan 2026 11:58:33 +0000
X-Gm-Features: AZwV_QgT8BYnogVp90DI71Fb6xW1aIXYZVtm1aHpBqsYXOGEvUr8F6wWkQX93Lc
Message-ID: <CAFEAcA8RFqO-U5ayU2u=dNhjHCj=1mJiAv26QihfqNfqQVq1Lg@mail.gmail.com>
Subject: Re: [PATCH v8 00/37] hw/arm/virt: Add support for user-creatable
 accelerated SMMUv3
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Eric Auger <eric.auger@redhat.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 jgg@nvidia.com, 
 nicolinc@nvidia.com, ddutile@redhat.com, berrange@redhat.com, clg@redhat.com, 
 alex@shazbot.org, nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com, 
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com, zhangfei.gao@linaro.org, 
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, kjaju@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Fri, 23 Jan 2026 at 11:41, Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Fri, 23 Jan 2026 08:55:18 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
>
> > Hi Peter, Richard,
> >
> > On 1/21/26 6:52 PM, Shameer Kolothum wrote:
> > > Hi,
> > >
> > > Changes since v7:
> > >  https://lore.kernel.org/qemu-devel/20260111195508.106943-1-skolothum=
tho@nvidia.com/
> > >  -Addressed comments and collected R-by and T-by tags. Thanks!.
> > >  -Rebased to latest master.
> > >  -Reworked PASID support patches (patch #34, #36).
> > >
> > > I think this series is in good shape now and mature enough for inclus=
ion.
> > >
> > > Patch organization:
> > >
> > > 1=E2=80=9328: Enable accelerated SMMUv3 with features aligned to the =
default QEMU
> > > SMMUv3 implementation, including IORT RMR-based MSI support.
> > >
> > > 29=E2=80=9331: Add user-configurable options for RIL, ATS, and OAS fe=
atures.
> > >
> > > 32=E2=80=9337: Add PASID support, including required VFIO changes.
> > >
> > > Please take a look and let me know your feedback.
> >
> > This big series collected R-b's and T-bs for all patches I think. Pleas=
e
> > could you consider pulling it?
>
> I definitely support getting this merged now.
>
> I'm seeing an indent snafu in patch 18 though which either Shameer needs
> to tidy up in a v9 or it needs a bit of hand tweaking by the person
> queuing this up for a pull request.

I can fix that up when I queue it into target-arm.next.

Thanks to everybody who helped with code review on this series:
not having to do that myself has been a big help for my personal
workload :-)

-- PMM

