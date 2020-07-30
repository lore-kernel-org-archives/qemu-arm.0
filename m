Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2462395lfy;
        Thu, 30 Jul 2020 04:22:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl4AJw9lEtYs57UPaRLbltTKRPDDeLTlsI4wfSUxUL5dKrpiqdWZqyZJDkapMfPtjcrjD+
X-Received: by 2002:a25:e015:: with SMTP id x21mr3532546ybg.1.1596108121864;
        Thu, 30 Jul 2020 04:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596108121; cv=none;
        d=google.com; s=arc-20160816;
        b=s8J2WuB3HxQrj/Hf1ycchebAz9fmTyEN+6v7iFnQMgK6+amIk1JEx66RGQ+CtqEa8T
         y+sloCMNomaz4+oQnmX4t6NRSaQW24x9AwLMeSrycuG6zUnkVX/L4UJXSU+3crFtq3WF
         guJDtT5pH6ohXuin14nKfLeA0j3UFpSNhO9H7e9UORnIjwEYVVbKwFy+H/WiKWLMzFjf
         PLCDIFVJ+iEpXu0MGmXLoupevtb+bb+C7Wi7+06ai8QuiEfqQ35haFnu/xa4l7sysM8O
         182CIL04PelgKKiRHCXLsT+kyo26T6gHbCcEu8AS6JqhRE9cvdgQ17UM7mENcuxsRUYB
         BFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=nW7AKJ4vYC3+boL8MHhZC9J+wbz691Jws/nMErt9LVw=;
        b=DdlgtzaYpZLWOKRR/pTviHYrsTHuOGiMHQRYznldzHER6a1X5lSlOXzOGrZ1hh1pL3
         M1iLeU9U+dDf2dMH03393JcNDfPQskdDZmq2bmco5nX4pv1n5nnU3Ccs+WmvW9Oww5JM
         3eROl4rCCFuJAFovEG+RsT+vwXmSt1xNxGG7gc8yC5573dMd1k2cSwb+zoaAW52AhrmW
         pDRkqANwayaz4L/8m8zup1XxhiNxFIUTA7lmdAbL3XOmzhVmHFCOHDxqf77r0ajuPnV8
         pJ/7Zy7rxrDEVkS0GpUunFBDWJvkJ2OW0Z2BUT2Z9/NW7Q+qV6XuhP0jp0+U2gkoQxTG
         Mf+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CCwqsUZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k136si4149036ybk.184.2020.07.30.04.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 04:22:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CCwqsUZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k16dN-0001Zb-A5
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 07:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k16dG-0001Yo-0B
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 07:21:54 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k16dE-0004Bs-4e
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 07:21:53 -0400
Received: by mail-ot1-x344.google.com with SMTP id l27so12642574oti.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2020 04:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nW7AKJ4vYC3+boL8MHhZC9J+wbz691Jws/nMErt9LVw=;
 b=CCwqsUZhS2+MYU5WawIvm1qLGO8ZqhQgsosgrb8cwE0xRLrueE8dBDjh92JXBlzyE6
 7L/B9ABxNnAdnK2RvHZuUkAj3h+4QWqE3X4+P14/HOZfpVJ47HjEQDehZ7iTH6moDEzF
 UwDARA/ks2AvVqcXV7Z7F2pgvLjY1VRjpT+jAPNTh99MuT739QMW7x7tha6xU5ZSwrJR
 BmzvhadkfmFbnFt/53W/vidcQWnbl3+LPqeZ8z0ta1DmGP+9TckP2Q6mSPLsNcqyKKZL
 /k1aM1yRp37I3bUvyEC8BxkIFEzRoGnj7zQenuSrbJj7wgij8cbdBu8gsYo3kOrVXYrt
 N+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nW7AKJ4vYC3+boL8MHhZC9J+wbz691Jws/nMErt9LVw=;
 b=In56AjuKaWxkcFvVc12BKIoMU7uq2/t40BQiJ2k1cqx8CO6o6pFwM6iGAx9Be3JJF2
 v4m6Y72IiNtX0eNrrzFl7gCpqQC7nwPZAQMJXt9G8mkWGrq8dD3dOVy+mpfOCTNqiYPh
 NlzZAmvVPpV5ptkz/SBiVrvaAQeTrgS2QT9baxeTwxXpPPX3jRoMYlp7SU/soB+zrTWs
 AQikjXM062k/PrJWlm9pRwj6DAwKi42YQcZJKA6i6dshlsdHqyWjgBszBGkjZ0Mzmd4N
 52LWiTcYUngMim8Yr6kfTmrzUMtbYjYT6mp2zS9VV5Kz0cVwLkaH+bzaxUFOmRGVsg8f
 jPGQ==
X-Gm-Message-State: AOAM531HgkyHiuOGyyzN+q1pWBQzyHYY2juLERPGKGoxnZDdLO6Bxlac
 LZeOwB1pFLswifCzhSErRIP5jax8GoR4k24rhuqYaFKptAc=
X-Received: by 2002:a9d:3b61:: with SMTP id z88mr1981398otb.135.1596108110740; 
 Thu, 30 Jul 2020 04:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <1596074182-4920-1-git-send-email-likaige@loongson.cn>
 <1596074182-4920-2-git-send-email-likaige@loongson.cn>
 <CAFEAcA_ZgrkcpwYZD-stZGDDjhTgMOSLx--9KHPnxfbKz58s7g@mail.gmail.com>
 <25c0ba1a-088d-c932-1f17-030211af5d4f@loongson.cn>
In-Reply-To: <25c0ba1a-088d-c932-1f17-030211af5d4f@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2020 12:21:39 +0100
Message-ID: <CAFEAcA_uy0dpxQ07S=THCBaMx2R0-xaM_BUn8OxLkOwR9LJdWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Fix compile error.
To: Kaige Li <likaige@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, David Hildenbrand <david@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CpFUHn0yWAMi

On Thu, 30 Jul 2020 at 12:19, Kaige Li <likaige@loongson.cn> wrote:
>
> On 07/30/2020 04:44 PM, Peter Maydell wrote:
>
> > On Thu, 30 Jul 2020 at 02:56, Kaige Li <likaige@loongson.cn> wrote:
> >> When I compile qemu with such as:
> >>
> >> git clone https://git.qemu.org/git/qemu.git
> >> cd qemu
> >> git submodule init
> >> git submodule update --recursive
> >> ./configure
> >> make
> >>
> >> There is error log:
> >>
> >> /home/LiKaige/qemu/target/arm/translate-a64.c: In function =E2=80=98di=
sas_ldst=E2=80=99:
> >> /home/LiKaige/qemu/target/arm/translate-a64.c:3392:5: error: =E2=80=98=
fn=E2=80=99 may be used uninitialized in this function [-Werror=3Dmaybe-uni=
nitialized]
> >>       fn(cpu_reg(s, rt), clean_addr, tcg_rs, get_mem_index(s),
> >>       ^
> >> /home/LiKaige/qemu/target/arm/translate-a64.c:3318:22: note: =E2=80=98=
fn=E2=80=99 was declared here
> >>       AtomicThreeOpFn *fn;
> >>                        ^
> >> cc1: all warnings being treated as errors
> >>
> >> So, add an initiallization value for fn to fix this.
> >>
> >> Signed-off-by: Kaige Li <likaige@loongson.cn>
> > What compiler version is this ?
> It's the latest version: v5.1.0-rc2, but VERSION shows that is 5.0.92.
> Commit id is 5772f2b1fc5d00e7e04e01fa28e9081d6550440a

I asked for the compiler version, not the QEMU version :-)
Clang, gcc, OSX clang, something else, and which version number?

-- PMM
