Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59779D7788E
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Jan 2026 17:13:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vjKiD-0006cu-17; Fri, 23 Jan 2026 12:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vjKiB-0006ae-Aq
 for qemu-arm@nongnu.org; Fri, 23 Jan 2026 12:12:43 -0500
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vjKi8-0004Nb-LV
 for qemu-arm@nongnu.org; Fri, 23 Jan 2026 12:12:43 -0500
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-64938fce805so2377348d50.1
 for <qemu-arm@nongnu.org>; Fri, 23 Jan 2026 09:12:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769188358; cv=none;
 d=google.com; s=arc-20240605;
 b=PxQNisal5O0lcoJw6nR0GCyrrf2KXp5sJJormsvU3luA4kHjGwOp9IXEdSmhG1ZvL4
 NYAcPteYgfzNPCCbmvJhQ932KaHFs9rw2STQSGqPxg/Yx4YTuwUsxyvrtbgCuaDdljKB
 TPHcm96yWjF5Z6e4BwX9mDKEueYN4t0S9SsgdM4L292J7+w3bhfnyXG7eyVK1ZzjLowc
 UQNrZY4SYycyVeuYNTb30UkwhRHXkR1HJ/peiOxIYdR3OddNGx7kxP3TwjQpinddBL0s
 8QfilzHX2PoDFY/5ZjXPgmkwE+43N6VYvb6wzV5EWRTaBa7Ix+tUKvUi1RyICxfECfFE
 e3SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8Fa4sjNTNYLGAlPOTx72tSfXAvWVjL6wvcuD+e+0VuY=;
 fh=Kfc/6+upTPKFMdDE8zugeUlGL3b+eH1+RNfIypxe0os=;
 b=O+VZhnXWRQ3NOx4YlDHgXvHt/bDBTscdTjt+CasKYRaY7s3v9Rj5wBLykvvJFKa6Yq
 vASAylfy5QHcGeKFyaZUvkkRmu5d8zbXcJyDwWgOZujpy6IEQPZL0WfdDKFPcvIo+YH7
 X+RBmrOtMTph5eRFURNU0eMAFhqldQ6DL9TT3jzIyyOz1LfUVOnccvUaAsEBSh5lhr7O
 WjSi7n4xP+LRUFNPLCUdcPEuCVgJtoILfJMKVARMVgSrvrYgaiiADoL0V4QrcEbPCFcD
 fsqa1LF3uvU/PpXFQEyHCtnrtupXEeykoSg9uyFjus30HJaB+GnBsfFIR+2C5MYVV0T8
 fQeQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769188358; x=1769793158; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8Fa4sjNTNYLGAlPOTx72tSfXAvWVjL6wvcuD+e+0VuY=;
 b=t28+jH0yD0wqGBVDbEuaU5e0adXgJjYUzEq3wey9760LmiRY5LEn5By9Swx+yWaXdh
 7SJeQpb9IYMXL9G7HltyW/sqky3OIVodZudNJ29nQem50v2uv+p0dEC21op3zMQzCgZ2
 +3Fk6/GOyJpmzU690dvZfPF826CNEli+X/IntFE/k1nTZx0fP+6MDtvFpu6v1yS814+d
 ZOOb4OTkGmUIoyKllOou16wX44ag9naLaVUMmL9MoUrKcCx+oSqauA/0vG1lrdBO8Xyb
 e9PxKkI0zQUOrcgB7TznBS1/o4rTW61/IowwrnsfKr1z0uw9do7DMMAP/hdAaVDPDdTk
 o45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769188358; x=1769793158;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Fa4sjNTNYLGAlPOTx72tSfXAvWVjL6wvcuD+e+0VuY=;
 b=W689VXzUEsW+oZxKAaY5Fjrv7I/9WXHFyKqWEG/fixDbtaEwOqK49rtvpjFtGQmXeR
 /5VEw423NuTqHskIsKi0pm5+Zk8F533BlEhroD7IuIbn/B18dc0Cz6G88aPoNz4tNPew
 c2Vce+hryXUHezeMzrrQLWJ3QK/FgbxBJuhRJdEothxZ07ByGCqQKZOb+5msPSYrqcc1
 XC2pPMMpLr0nbofRcsMIqmXEFhbnppRlB+1nAYJEpPM3nOktGn+caN5aAuQNAMcISc6S
 rk3g1sIQXjPjtFmxV3j445+36hDLAXQ0PZ7FO4SfXdg0ftHvnVIn/ZpOA21t3g5XQrNh
 eFZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX81iIOmHkF614j6CphZXcLcOTuGumQhDC4M72wv3/br/xjYGT4VIDQuc6+ATc5WFXlpDpvjGgzig==@nongnu.org
X-Gm-Message-State: AOJu0YwPKpY9a3SDYJSxwisl/RFHPHDN0oNPA1re6RrbbcWZ4UTy2eAX
 ss4HrEjH7CmvZOYwwwK3NjJoBoHKtLfCrPwXaV9bDjTQdQk9sIiMOd/+0dVBmOpXeEr6Rp4PBJU
 OF41EDwFfqoXBvSDZ7cDLasWeev5X7bLU7qt53CFhbA==
X-Gm-Gg: AZuq6aJpHwvqWrOGbWJqDE6FqXn5AgPSEWR+Erayguh03dHOOYC76wNDfTCZ7W2uQIZ
 WQmPlqZc3nnew3Cg1FScc7Qxfn/lxfaEO8JL6ejBCTbZifap9YgdRtnxwYDmUjQkg/80O5YxBs1
 VEUt0dNcOr3MUL4gwCn5v4MUxfbFPxSKR8nxUT8UJnd4OqFJFav2QdO/rwJtVAzI++Rlu9d8mPq
 2i+t3+set8of1kRoAd3CD3OvwE27TPJgRUx2L7C3UUSuGGFHmIr2O2C72udJZDZEIaujQ==
X-Received: by 2002:a05:690c:f90:b0:793:db81:f1dd with SMTP id
 00721157ae682-794398bb7f6mr30309487b3.4.1769188357323; Fri, 23 Jan 2026
 09:12:37 -0800 (PST)
MIME-Version: 1.0
References: <20260121175248.87649-1-skolothumtho@nvidia.com>
 <4d1a883b-5465-45af-8dcc-eb905f552c29@redhat.com>
 <20260123114149.000065c5@huawei.com>
 <CAFEAcA8RFqO-U5ayU2u=dNhjHCj=1mJiAv26QihfqNfqQVq1Lg@mail.gmail.com>
 <CH3PR12MB75480D0CDE889070E1F4C448AB94A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <CAFEAcA_8Zd1_C+94wj2c+pJk3ebFT5_Zgt1Ww0qxzFqW=F98xA@mail.gmail.com>
 <CH3PR12MB75482DA817149816D5CD485EAB94A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <CAFEAcA_w=+RHygwsSQVvE6XU44d6+hgKy=bqdD08aBM5_xyn=Q@mail.gmail.com>
 <CH3PR12MB75481DCD5A4A890617429C55AB94A@CH3PR12MB7548.namprd12.prod.outlook.com>
In-Reply-To: <CH3PR12MB75481DCD5A4A890617429C55AB94A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jan 2026 17:12:25 +0000
X-Gm-Features: AZwV_QiXS-nKtKyX6L5SSG3GrmR-B1057OwswGmoT5KWlW6HgSTNLHq9rokg4po
Message-ID: <CAFEAcA-jxKnmD=8A8b5Rur0F1+_5w+JHY2yjkZQvD4wbhMwvkw@mail.gmail.com>
Subject: Re: [PATCH v8 00/37] hw/arm/virt: Add support for user-creatable
 accelerated SMMUv3
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Eric Auger <eric.auger@redhat.com>, 
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, 
 Nicolin Chen <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>, 
 "berrange@redhat.com" <berrange@redhat.com>, "clg@redhat.com" <clg@redhat.com>,
 "alex@shazbot.org" <alex@shazbot.org>, Nathan Chen <nathanc@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>, 
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>, 
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>, 
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>, 
 Krishnakant Jaju <kjaju@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 23 Jan 2026 at 16:59, Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Peter Maydell <peter.maydell@linaro.org>
> > Sent: 23 January 2026 15:48
> > To: Shameer Kolothum <skolothumtho@nvidia.com>
> > Cc: Jonathan Cameron <jonathan.cameron@huawei.com>; Eric Auger
> > <eric.auger@redhat.com>; qemu-arm@nongnu.org; qemu-
> > devel@nongnu.org; Richard Henderson <richard.henderson@linaro.org>;
> > Jason Gunthorpe <jgg@nvidia.com>; Nicolin Chen <nicolinc@nvidia.com>;
> > ddutile@redhat.com; berrange@redhat.com; clg@redhat.com;
> > alex@shazbot.org; Nathan Chen <nathanc@nvidia.com>; Matt Ochs
> > <mochs@nvidia.com>; smostafa@google.com; wangzhou1@hisilicon.com;
> > jiangkunkun@huawei.com; zhangfei.gao@linaro.org;
> > zhenzhong.duan@intel.com; yi.l.liu@intel.com; Krishnakant Jaju
> > <kjaju@nvidia.com>
> > Subject: Re: [PATCH v8 00/37] hw/arm/virt: Add support for user-creatable
> > accelerated SMMUv3
> >
> > On Fri, 23 Jan 2026 at 15:33, Shameer Kolothum
> > <skolothumtho@nvidia.com> wrote:
> > > > stderr:
> > > > acpi-test: Warning! IORT binary file mismatch. Actual
> > > > [aml:/tmp/aml-7QQVJ3], Expected
> > > > [aml:tests/data/acpi/aarch64/virt/IORT.its_off].
> > >
> > > Any way to retrieve these files?
> >
> > They aren't in the "job artifacts", but you can probably do
> > a patch to tweak the CI job to add them, push to your own
> > gitlab fork of QEMU to have it run the CI, and then look at
> > the results.
>
> I forked your QEMU GitLab repo and pushed my series here:
>
> https://gitlab.com/shamiali2008/qemu/-/commits/target-arm.next-smmuv3-accel
>
> However, I am not seeing any CI jobs running on my fork. In the settings it
> shows no assigned runners under Settings CI/CD/Runners, so it looks like
> CI is not enabled.

You don't need to fork my repo, you can fork the upstream
QEMU one. Things aren't set up to run CI by default because
it would use up your gitlab CI quota. The docs on how to
do this are here:
https://www.qemu.org/docs/master/devel/testing/ci.html
-- you want to push it with the QEMU_CI=1 or =2 settings
to get it to run the CI. The docs suggest a git alias
that you can use to make this simpler.

-- PMM

