Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C9CD26296
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 14:21:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viZ5U-0006CJ-3l; Wed, 21 Jan 2026 09:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viZ5R-00069m-3N
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 09:21:33 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viZ5P-0004Uk-J5
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 09:21:32 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-78fb6c7874cso72268567b3.0
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 06:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769005290; cv=none;
 d=google.com; s=arc-20240605;
 b=B9fTl7iVgtZIOmUxauqehkBXvkg6YJcgahBYDWyuCQUlStbYceveV3iMWFLIdajx3a
 xBOf9cQlsfSMwDckQBrhWRuni/SmSShTn2+HUr2bK0cS5PGyEpAYJzyKta38tJ2wl5ti
 sxS4tTRwjeqIvKRm5CjLLKnvJjiuoIxD4nMyAmt/LgPqmpvSXQ4ImIDALgFby+8W2YAE
 4xxn+UNYwfGGwrPl41Do+PWvxd6ULRMoA2ztNzxHYspqgkDa2yqiXtvUFtOm3jxTt511
 WYKLCja97uqokCzPCYUPqTri5wqueg0rb2qwG/UEYzWdYEW+iUK4vG/5O5pvB9Hvz3MT
 jdNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=GlT8dArKU3arklwG0KQOI8CrTV3x3mdeAWBK+R0CWvQ=;
 fh=sTte/PX4GjqhMJejhKqF81D2bL6HVJj+JfWkWcHgf1I=;
 b=d/xarLvc02yK+wkuRGjPnijPq+SE436lRSkweg4er46U6SElGCvixiO9kjgMUWPnZH
 nOzGX6hwRpZ+XG7lrsoKaT47Uo2bfmymMWJmsv3s5WZPTXKgpv6188q21fhhNq0iMIwn
 kTNYZurFrM5mvY6pK8P9dOAUmJCJMAmm+QOEeXhfZV1NEr/a4V9Xys6q/0zhyju9Pnrm
 yJHlIXIMprsXHNPy/Pm0OJmzlOH3Uc7ziDeuFdSEnZULPxC7CrNs6dMLwaL3wVM+UrWm
 a3mHgjEwHVd08W2YWZLdd8xd9C5S10Ux0HEAlq8p6kDj2qykHN0Ind54CAKa3iaOyN6F
 +xRg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769005290; x=1769610090; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GlT8dArKU3arklwG0KQOI8CrTV3x3mdeAWBK+R0CWvQ=;
 b=aEUuqkWNTbTqCSqo3wrlvmbmJABA8Ps08Fc1Eemry6R/zdTDRrXeanU+f5k/hUUxyC
 23vYrJIFwOdrhNLiTnttEtgPql/lUxf680bTiqKXcbC655UgKFCoUlVZQzAqdhmK3Q/x
 boJOu+oMEEQUFjtrO5k7X/LfKX0i5v6XIDLnIkIa6I12Iq6oEOa1zQi3OzltUlxutiOd
 SrkpNXT4GWos7x1qSizM6/UFxyANtEI2uJpwSacl1k1AhyD9abmih4jUoQVgU6XwUq9R
 DTusShtJxXB549yQH7ebcPEazu+kegGzy/9icpos/aM1PtAKJuqV6y1S96dNmMtoHLSf
 vB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769005290; x=1769610090;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GlT8dArKU3arklwG0KQOI8CrTV3x3mdeAWBK+R0CWvQ=;
 b=uTwrN7AWeo1USgph3V0z7ou6KB6adVgPQzV7ON3CzcE9hO3hOLwRgT9XHS5mJkmKTE
 XoPKarxD5WZfjFeqShbkST4Bxi8/qtgkEuHlEydXAEvKpXvwH1JzPU4axYcf7KhZK7h4
 OnaX1uju2fKn1J6wEaZGpeQghJsoxAxA9BfzYcdT5xATe4KXRWZqTLo9c1VpFwLGnZ+N
 QUXM0BbkcHNvQF3Hcn9XRQcF9mP2REme2gi7gllGTY6sDhM5Gia9f3i2Dc8Nkrcw2tdh
 wsE6NE4Y1ppvFBBOtPvTVy8MvKIpUfImh1Ewj9mN6DRkDECysyw7Lbj//L2fID3/iH2V
 DMhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfI1TkiiqA3rlpJSpyTAW/vsFDwwRSj7pyhP1wMsZODd6bn9j2eSCNRRC6A6nkV8OvG8kUK1cdsw==@nongnu.org
X-Gm-Message-State: AOJu0YyL5oLlJbnf8ux/MLgKeGFPHRSlMWP8An4LueFzp7E3ZGU5ICAs
 gJuQYwLiRKNAKyUNxaix2kqTfdHIbW9beY7ZvVMFQHVQc4dTdTV5n0xpdjP3VnrP7S6z+NQXD1a
 KTNLrfZ9e5qJB8aWv25HcJ8+9jp95A9D1ERYjX4nB9g==
X-Gm-Gg: AZuq6aKEp2pKY0RKIU/eQUpRB6EJd9oNSXm5m4G6UC9wccuFlcFMgbln1cxvp/0dv0W
 Z3RDigncN+yxRKpZn3r57voW4ZRGsKuhlu6ce6ecZIzUWE9H7qQeZN1diVhiuzNMrcbaGhPJDu1
 Vn2BYydzAWKMrY/SxipOdHmu/iUjFliYN6ANe89gsJOAYNoOsmF+aSMICdZuJDh1yYpn3HdDs6O
 j3y6jK2Je6RvLV12ow4/w4EsEuRxjACJcZ8EhxBrbfqGY5FKxOu7wPn8cyQL397sKNskw==
X-Received: by 2002:a05:690c:6f13:b0:781:64f:2b63 with SMTP id
 00721157ae682-793c685d462mr147503457b3.63.1769005289673; Wed, 21 Jan 2026
 06:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20260121114111.34045-1-skolothumtho@nvidia.com>
 <20260121114111.34045-2-skolothumtho@nvidia.com>
 <53a51440-c7a6-49f9-bf2f-b71c8e9f32ed@redhat.com>
In-Reply-To: <53a51440-c7a6-49f9-bf2f-b71c8e9f32ed@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Jan 2026 14:21:17 +0000
X-Gm-Features: AZwV_QgQY1nQxR_5dNIh4i-jKjPzlL0pgVwIGHpAV_0s5-sVr4HkllWqHIPKZSM
Message-ID: <CAFEAcA9+kp7K4cGeMx2PTGp1V3SkKoqyHEOZhFD-QQ2Y4WZHPQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] linux-headers: Update to Linux v6.19-rc1
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 eric.auger@redhat.com, alex@shazbot.org, cohuck@redhat.com, mst@redhat.com, 
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jgg@nvidia.com, 
 jonathan.cameron@huawei.com, zhenzhong.duan@intel.com, 
 vivek.kasireddy@intel.com, kjaju@nvidia.com, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Wed, 21 Jan 2026 at 14:02, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> On 1/21/26 12:41, Shameer Kolothum wrote:
> > Mainly for adding support for VFIO DMABUF. While at it, update all
> > headers.
> >
> > The header update breaks virtio-net due to virtio_net_hdr_v1_hash
> > changes. Include the virtio-net changes to avoid build and bisect
> > failures.
> >
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> > Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
> > Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> > ---
> >   hw/net/virtio-net.c                           |  11 +-
>
> Recent commit 503eb470e087 ("scripts/checkpatch: more checks on files
> imported from Linux") added a check on the imported files and checkpatch
> now complains with :
>
>    ERROR: headers imported from Linux should be self-contained in a patch=
 with no other changes
>    #101: FILE: include/standard-headers/drm/drm_fourcc.h:978:
>      *               2 =3D Gob Height 8, Turing+ Page Kind mapping
>
>
> I suspect there is an error in the name of the file in question.
>
> Anyhow, feedbacks are welcome because I doubt this check is
> valid in this situation and I am ready to apply this change
> as is.

The virtio-net.c change should not be in here. The change should
be staged in a way that virtio-net.c gets updated first so it
can cope with either the old header or the new header.

But it looks to me like this is a bug in the Linux headers:
they seem to have changed in a non-backwards compatible way,
and possibly even in a way that makes it not possible for
userspace code to use ifdefs to handle "maybe the header
is the old version or the new version".

Ideally the kernel headers should be fixed upstream to
revert their compatibility break, I think.

thanks
-- PMM

