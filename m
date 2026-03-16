Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899A6F46441
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Mar 2026 10:07:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w24qJ-0007q2-Mo; Mon, 16 Mar 2026 06:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w24pv-0007hK-On
 for qemu-arm@nongnu.org; Mon, 16 Mar 2026 06:06:13 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w24pm-0002Zk-AC
 for qemu-arm@nongnu.org; Mon, 16 Mar 2026 06:06:07 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-64acd19e1dfso3983594d50.0
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2026 03:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773655556; cv=none;
 d=google.com; s=arc-20240605;
 b=hFyp3oGxXYHSSjsHM2WyiyxDdYYKw6EAocYKv2F3mA6jwi5br0qefxp2vx4TpR1NOs
 65DoMOiuombJDCgdSLxikxtVLJK+KYkMubP2kAdiWzrsJYukfCJtF+9iSd5Z4ypfuuaD
 xMJyqjuSwRm6ItWOeSG/LpW6cC/YiIh9sqBV0m6X1HFzyn9UfRCgNLuE1/b2ipAMJ0aL
 QOeSGCgGifn/oVTnw/hvXmMP/fHOZmY+wuQk9kbEWluC1qK9YPXwmKuL5vNhHyyhzrmZ
 DN1ZJznz4dSmCYVGwP2wg+K6dDbnYFN/pZz7M0rk81P8gh9a+Mo2eyerVXNF9hht8oK0
 xgow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=evLupH/yWp2vQEvNZgqDdfr4GAiZrF7fUPDdQWSzT8M=;
 fh=ItMV+fwF/Wpq+l9cTHtyXGknlVV97wNn8xh6uWLJZ4U=;
 b=JUdK/mBwWjA8/tWQnGRU3+yIDw0JlyHX/jBpu21Se/rqMfPwitZyUfsoY9UoNzaw2X
 MkzLOKmn7wsUWklEIBF5sMJMR41pzkVsjoM3OuumQwZujabBI1d9Lyv3A039B/caqfXE
 IdS6qMEdRzcXQAGfTxr53+J6t2KWDoQJac/4hLweK153yhoWq/QyiZyD0rPUYRLxuEhH
 jlAGinqhosYaRSu05gnJunCEMZ+f1vXFjAoxrsrt/obGd6Nq9tEnVRkjc4+iafcuzN91
 RyFMFcxarnQDtkmunosmBFNWez0iLCUAYqXzPHeExyQa9JTyx4kB3kPXYW1YhTMCN5Gi
 bVnQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773655556; x=1774260356; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=evLupH/yWp2vQEvNZgqDdfr4GAiZrF7fUPDdQWSzT8M=;
 b=ERjuZu3Qa7XyilYwKYiUlBJh817M+01YX76FE5voMqLMyLWVHiIh6Fu/6ZRoYaGmHM
 QY9S8hdoTrmw54Nxpv/b1+BBj9IcS1ptYXUYOeqTCvkhjkypaKbI4KDvFKA1q3bCjBaI
 bVj8rJHIW8Gu6NoAqP5F3CWxcchJoMwxa95TIFX7HqXDp9wEfD+/cHSl6dF+KDy/8WUR
 ck8Vu8w/pjXtmNNSl4LDRfq3BTudbuE28rUqFkO7wb5C602UXE9auJ+NqZA6d2WUeKkT
 HvmXEJ9hFz2f4CVGUP8f2c08TNanjB2EQyPmf0o/ueqyScEVPTujE16LwjgSmuD18mjm
 k75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773655556; x=1774260356;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=evLupH/yWp2vQEvNZgqDdfr4GAiZrF7fUPDdQWSzT8M=;
 b=ZKOgQZ3PXSjaaaIwd7OYAM3EsM5jC8nDPGF9z9IXLXFgZ8kB9V5n3txOgmVJHJQEKJ
 dtdsZZ9/vB88kjzdO7Acf9gERYmzmi3R499eKsADNsw5GsYNorL0nbIq3MFBwZ5Mb05L
 ZAMdZ47+6V0Q+X981lDPP63rRdRNE1UjuBS9EP7MzEFaFW2WovjB8McEVAqbGx0Gyajr
 rsqxoeGs56QPbGblJTiTnnEiJp1lmp4rjurDiMcuW3uYq8IGKoRcEVIghmu2D2l/lBct
 nHOkOgxoD5j/vFXjFM1wJ1e5EOLkoa6mYbV5yaL2xHKM1KiY5hbKLWamJn/vaGVfQL4s
 FtSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRhnMsdoFZJjbqNyN3xLNHh3wwFFrSOkYHnnDVCWtcZEyXYSzr+Qh/u/iqPPRx3pEdzSogSq6HtQ==@nongnu.org
X-Gm-Message-State: AOJu0YzbsLPHWZe6R7JZBJqgvaYM0u2Q4NPmRliGKGgc33FFqH8MfZqV
 aL4N8Ixbd+gQqXFQQ4hgMXvwDq+2LB/DI5SUHw1Gr1ryMvIO/ErqsMiOVN/z+/kbs+kLS5IHWJx
 uHq9ZghCOJ2vyszFv9VCRG5etAUmlFl/Nx7s+65isr5PUBb2wEvbH
X-Gm-Gg: ATEYQzz8S9NnZ1QB3Tvh0ij6k/y+zjnLtI7jnpew6DZPP4hTK88eM46ZXuf/dbaB8w9
 c+cu5oz16ieKFMfMOb+ge3rvpYVEsCRLPMhOTmeBi8wWPQ9bnNcNG2iixSZL9tasWgyrTgYroVx
 WZS0BSCWN79WNFbUhOSfNV2uYyrHUm6A3gCjwLm7K2TJG5ucF+oI8VsI6JvzInO5qSN0q6I2Dd2
 xlQ3jVbcZJj8CsKUO1f9g1xUxio0qP4Y/zSRq0WWMK6EirzrHpNwDdYCEOshK8pdJuN2ldt/W42
 y2TIEmsZm/+LL8ADJ9nm3S/4a0DUsBuSMJsMRIqCrJOcNhVOgaaymMJbnP4o6vg5iZE=
X-Received: by 2002:a05:690e:16dc:b0:64c:a41a:3a64 with SMTP id
 956f58d0204a3-64e62f98e92mr8644108d50.34.1773655556106; Mon, 16 Mar 2026
 03:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260312210328.2016191-1-nathanc@nvidia.com>
 <a0ca818f-8e05-4756-b6bb-8f986c59cd54@redhat.com>
In-Reply-To: <a0ca818f-8e05-4756-b6bb-8f986c59cd54@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2026 10:05:44 +0000
X-Gm-Features: AaiRm50Pm_BrjeMMsmtJMn7c8zm8sFv0fzYVJaUiNHtBXur5nKgkk05aDdfCtUo
Message-ID: <CAFEAcA-NjFCaZC-UAykS98J4DAEXyANj2QfAgc3bqT4eQsO=zA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] hw/arm/smmuv3-accel: Support AUTO properties
To: eric.auger@redhat.com
Cc: Nathan Chen <nathanc@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, 
 Nicolin Chen <nicolinc@nvidia.com>, Matt Ochs <mochs@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Mon, 16 Mar 2026 at 08:08, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Nathan,
>
> On 3/12/26 10:03 PM, Nathan Chen wrote:
> > Hi,
>
> If we want this to be taken in qemu 11.0 you need to clearly indicate
> that in the series title:
> using a subject prefix like "PATCH for-11.0"
>
> Then you need to clearly justify what those patches are fixes for stuff
> introduced in qemu 11.0, something like:
>
> In qemu 11 we introduced new options for vSMMU but feedbacks received
> when starting the integration of layered products shows the need for
> auto/host retrieved values. To avoid breaking JSON/QMP compat, we want
> to fix the option types so that they can later support the auto mode. At
> the moment the auto mode is not supported though.

Yes. At the moment this is on my "look at it for 11.1" pile.
If you want it in 11.0 then it must very clearly state the
justfication (i.e. why it is not new feature work) and be
as small as possible to achieve its aim.

-- PMM

