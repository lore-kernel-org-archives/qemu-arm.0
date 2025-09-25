Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1126FCAC5B9
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 19:41:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1rpO-0001mX-SO; Thu, 25 Sep 2025 15:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1v1rpF-0001k7-80
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 15:40:23 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1v1rp6-0000KX-5D
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 15:40:20 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-57d97bac755so1820e87.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 12:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758829202; x=1759434002; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dGRCvzXb0/08Yj1vz/AcgP+Yf86OKXwxAO5W/B0eQ08=;
 b=YHYBgJ3jNvKc2BID5QIjp5J+FBTv5JcCOX/CtZNLsAV+yCUFIf2RqkKsauP7zdNxAw
 Tri/ITc4N6vNZu8ZCtZqCzh4DXWI+eOKM5mtAtK+W0mizvbrLCuCwJmlDfu+xvBNg04t
 rB1aqkjtWpW97c5hY/SPPJQCTtkHWqOyi7IhkN9HWurO27u481RrqnaL0gzt2X0z3Yc8
 0vveLKmp3wE/VAvGVPBtC9G8ur9JctpvS8Z4588HoZKHRDf11KLrmdJD/SZ3CgTDoT1U
 RvHzXELR5pY+aBwN4ZF8CS7FAr/z0ipb+mFTPT4eYeR+t2tnITHVxCYNKPClbKAQuH/k
 VUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758829202; x=1759434002;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dGRCvzXb0/08Yj1vz/AcgP+Yf86OKXwxAO5W/B0eQ08=;
 b=w246t92easvRFFDuj0Dw+1DjLZBvvbO3VS1pxppY7zv5ReBaZMmG49VcX3CWttqK7l
 JyUVWNcCAdP/kHgpoQKsrPa0LT533eNIqo0X69lXfympDKAYhzeR7LIDLBxBRZaKTeF7
 +pl9GE7gaSTfd4QP9OI4WP/iXtck1OPWq49AQUIyndclNG5TjzzIICV+sy00aMwTbXHC
 YLNpmn6tF/mAf+MVJhnaIAClRaBvtL/HJQc7i26Eet1wN3EBQK4r1Rr2Obb0m1H9gxGX
 uVXVhPL1hPghgg3bN42tUksaYpzBx93NlKYjQ/+n8aMLkVlYfVINRxLj394TLg4O4rjn
 0OEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6okFsRVDwBxraSvo9zm63UrQMv7uZmqDZiLaxZeqxwiD0oa0dlcBIxl78OwuroKJkeUOOjQIamA==@nongnu.org
X-Gm-Message-State: AOJu0YxtP0OQtcH20LETufePIgCBFbm8dox/4ubQT1zWSWd6znBU1Df5
 FScNXiMwSgRzzifmUH4sIVuE9qtZ6QmCZRv0FwAx6EIpIvmpvKpuZymKcBlPES9bk6wVRVeAXak
 l9UJeK3LB9+kibQW6mNGKT9ehcMx8GMLLnnXItiqk
X-Gm-Gg: ASbGncsIrClMuiH06bTe2YBJlyP05eOafMraWowkiSYkZ2Vu/BUulHR4QbT8JGfsIMJ
 jNVU8CbcFdZcVnsj23/fdDy/gz8M3K88qKm7+QU5Xvd5vEfAlUBAqEMTMnJmHlAqFkB4+sFFV8z
 gLqFOeqXdtt57Z2wQb7wVQyI5QWWVE8tw422NXvfmK6VufEpsEAc77fwhHyEFQNy2mvkKSNC8QB
 K8Ko4ijWEWodE+SFBlbjuVcIWbBDokYnqvU0t1uBRPE+uSeHiTAzEs=
X-Google-Smtp-Source: AGHT+IE8l6NG34xbqF5CoVR1uSrYYQ8TEk334Mt1K59wnyIGsnSF2GXHC8JydYw3c7o8d1JYNgORVMbOa6ZQjIQkR5E=
X-Received: by 2002:ac2:5399:0:b0:579:fbe5:4467 with SMTP id
 2adb3069b0e04-5843504f532mr66429e87.4.1758829201925; Thu, 25 Sep 2025
 12:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-pcie-root-upstream-v1-0-d85883b2688d@google.com>
 <20250909-pcie-root-upstream-v1-2-d85883b2688d@google.com>
 <CAFEAcA8QAj54xxTfk087=8dERGiM28Bz2mw9eVtMd6qNOd7aYw@mail.gmail.com>
In-Reply-To: <CAFEAcA8QAj54xxTfk087=8dERGiM28Bz2mw9eVtMd6qNOd7aYw@mail.gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Thu, 25 Sep 2025 12:39:24 -0700
X-Gm-Features: AS18NWBTtowT4M59ZFcVd2Lw5bbNT0R3_Fheh61VDmq6C-fwUa9w9RvuAL0bYaE
Message-ID: <CAMvPwGo-PpapVgYG9RRdtzEOzFzgn1++f-uTHyyDHzfjyNTPfg@mail.gmail.com>
Subject: Re: [PATCH 2/7] hw/pci-host: add basic Nuvoton PCIe window support
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Yubin Zou <yubinz@google.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=titusr@google.com; helo=mail-lf1-x135.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 25 Sept 2025 at 09:38, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 9 Sept 2025 at 23:11, Yubin Zou <yubinz@google.com> wrote:
> >
> > From: Titus Rwantare <titusr@google.com>
> >
> > Adds the windowing registers without address translation
> >
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >  hw/pci-host/npcm_pcierc.c         | 223 +++++++++++++++++++++++++++++++++++++-
> >  include/hw/pci-host/npcm_pcierc.h |  77 ++++++++++++-
> >  2 files changed, 297 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/pci-host/npcm_pcierc.c b/hw/pci-host/npcm_pcierc.c
> > index 3afe92e264f6ce4312e94f05b5e908840008df64..bffdec71acaba6562856b3bdd8aec07c3c153323 100644
> > --- a/hw/pci-host/npcm_pcierc.c
> > +++ b/hw/pci-host/npcm_pcierc.c
> > @@ -16,6 +16,193 @@
> >  #include "qom/object.h"
> >  #include "trace.h"
> >
> > +/* Map enabled windows to a memory subregion */
> > +static void npcm_pcierc_map_enabled(NPCMPCIERCState *s, NPCMPCIEWindow *w)
> > +{
> > +    MemoryRegion *system = get_system_memory();
>
> > +    /* TODO: set subregion to target translation address */
> > +    /* add subregion starting at the window source address */
> > +    if (!memory_region_is_mapped(&w->mem)) {
> > +        memory_region_init(&w->mem, OBJECT(s), name, size);
> > +        memory_region_add_subregion(system, bar, &w->mem);
> > +    }
>
> This looks weird. Generally devices should not map themselves
> into the system address space, although some of our older
> pci-host devices do for historical reasons. Should we
> be modelling this some other way?
>
> thanks
> -- PMM

I can update this. What devices are doing it the new way?

-Titus

