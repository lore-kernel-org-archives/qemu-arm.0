Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1062537ejb;
        Thu, 30 Mar 2023 00:37:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set+HLhd75LTTRwTZL1UC/MxzBwpo4dI9CiqdMNurhc9o9iCPg9jfbMKleFxb7Mdyl/jzRRoI
X-Received: by 2002:a05:622a:1705:b0:3bf:c29b:678b with SMTP id h5-20020a05622a170500b003bfc29b678bmr36771527qtk.50.1680161865468;
        Thu, 30 Mar 2023 00:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680161865; cv=none;
        d=google.com; s=arc-20160816;
        b=sgvPpnhpHCwrUu+7rBC91Dblq0Jpa/aa+ml45t1KV/PfqqMfZsqDEXj5JipaE9Bq2S
         PFKU1vu79tP2RY7q+XsSC+7Bwf87eslbWawfswZDMSIjo4AgMBYtcUcWaTYsY8emyk5X
         +cs0kuX1VYjdeTxdtNfqkb+YGz+nSo7yAN8crIvBdt+T+MjYOXb8VM5UNlnusAHHK7yX
         qjbyfFjsgBJnpumFmke6beBYPoQP/xMSTBQGpIbe2WRmx7Rng60f9mIPpez7PtCCikXA
         I36IgpWWOu3Be7qT8etMQm+HjWQvRl2NUrTnrv/q1DPlSqt/rwTQFwWRyQ1a2y7I110Z
         gqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:date:from:dkim-signature;
        bh=2gq94IK4ZLJS+KnGYiw/95gbOzDKGWiFVmEQofhI6gs=;
        b=ScRkMz0zAQ+fZaiqANEVVdRGz2/vYG5YU3sYEJcBj+qS4L+cdPF7v2h1t4qWzRrxMS
         hK3umbTTViDcwyduwIOrpaecS5c7LToEQ41Xvh+QlZh9YoNdgH7PsZfFNVZPxAK/TaTe
         tv/ESJ5ZQdNhihlYe1uOvSERHSSopLzWw+zq1QmKY1+mOpNhX70YYGcntH3XNI2cnBoZ
         9m/izHTDPTWgRoCVVriz0/OOoYoDNF5eEezHJTKQJN41Lwbx1lumL8yHlAtkjXE8aLgn
         J879+wuTQMdt1H8pFhEnX91jZkddnUYSvzWeuXC7s1hK4JYD5PsG4ZITd2kHaQ2RQTH9
         NCoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=kNA5RU8I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6-20020a05622a118600b003d72cf4dda0si6492650qtk.15.2023.03.30.00.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 00:37:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=kNA5RU8I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phmqR-0001ry-PE; Thu, 30 Mar 2023 03:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1phmqP-0001rS-SU
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 03:37:13 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1phmqN-0001ju-HE
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 03:37:13 -0400
Received: by mail-pl1-x62c.google.com with SMTP id kq3so17267880plb.13
 for <qemu-arm@nongnu.org>; Thu, 30 Mar 2023 00:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112; t=1680161829;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=2gq94IK4ZLJS+KnGYiw/95gbOzDKGWiFVmEQofhI6gs=;
 b=kNA5RU8IiMaUuf261+0rSxPs5f3VMhydioPKTMXATv/+0oPGnoFOkY4yA00RVL6/Wf
 Xk4AzU9DS4KgdaEDiuM0VRSHBqp4g5m1xyIS7WxDAJomSu7oaI7A6xkPPgAQrKjcAfzg
 zICaV9gVoBkoFvfv9PSZCE4MYNd4K97HVs344F23C63HxWp+VAgaXqLU1HsvuYW0TYyy
 MaN7ky2pNiYwHS+hJieAE8BFKm1ToNfS7Js/ZS7kJGUb20CJPscqAqpY5x49bl2RZ20p
 NjdNF+RYmN0miGoh9fJvO1YdcXAp6Gq/tHrQHe355vAiHMjFKj7AIoVGnMuQkDfP0/z1
 G/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680161829;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2gq94IK4ZLJS+KnGYiw/95gbOzDKGWiFVmEQofhI6gs=;
 b=N4ztaQQynTSW6OesTHSVvWKPb61GMmdRLJJ9EMQBUcy6P23yD8BZWPX1GBT/JpXnJ/
 yZOo5I0Vn5FuTziH2CyP00Ox+hPAA/zzZvD8F2/u+pODrVaE2En+kbDySQ89+8V5UMGF
 BTLFMMWOeqI/ZHJAYYTVjO5GMh6pMZ4bRycSk/YoB3X111D48qggjovXhVpQ7cHdoIl1
 p/rP4mU4SeDqugeChVUmSw1yMDDOwbMHYD49cqHFirJnkL7Uf1kbFgUBemwO2J9aQguw
 Hm3sCTtxeXhsa9mzkOSFh7QwsldwaiWXugt9mejCZkRpYfJ5fTVCuHOlRCL7CSKKD+wu
 O4Ow==
X-Gm-Message-State: AAQBX9fWwnYi0rYWrHyzv9mB+rtRBsKyxAmsfuHcY5NDxyaeYAicQy5F
 dAdjCyl7e9q2V3UyRcqjmGh+UQ==
X-Received: by 2002:a17:90b:4f89:b0:23e:2b3c:d4bf with SMTP id
 qe9-20020a17090b4f8900b0023e2b3cd4bfmr25112072pjb.45.1680161828909; 
 Thu, 30 Mar 2023 00:37:08 -0700 (PDT)
Received: from rhel9-box ([203.163.242.253])
 by smtp.googlemail.com with ESMTPSA id
 85-20020a630358000000b00513973a7014sm1170376pgd.12.2023.03.30.00.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 00:37:08 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 30 Mar 2023 13:06:36 +0530 (IST)
To: "Michael S. Tsirkin" <mst@redhat.com>
cc: Eric DeVolder <eric.devolder@oracle.com>, shannon.zhaosl@gmail.com, 
 imammedo@redhat.com, ani@anisinha.ca, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, 
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net, 
 boris.ostrovsky@oracle.com
Subject: Re: [PATCH 0/2] hw/acpi: bump MADT to revision 5
In-Reply-To: <20230329124442-mutt-send-email-mst@kernel.org>
Message-ID: <68579d53-cbb5-154a-6c1e-e733f16540@anisinha.ca>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230329010406-mutt-send-email-mst@kernel.org>
 <96144a1b-efa7-ecc2-3e35-56825fcf48c6@oracle.com>
 <20230329124442-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: un1qgd0Dipw3



On Wed, 29 Mar 2023, Michael S. Tsirkin wrote:

> On Wed, Mar 29, 2023 at 08:14:37AM -0500, Eric DeVolder wrote:
> >
> >
> > On 3/29/23 00:19, Michael S. Tsirkin wrote:
> > > Hmm I don't think we can reasonably make such a change for 8.0.
> > > Seems too risky.
> > > Also, I feel we want to have an internal (with "x-" prefix") flag to
> > > revert to old behaviour, in case of breakage on some guests.  and maybe
> > > we want to keep old revision for old machine types.
> > Ok, what option name, for keeping old behavior, would you like?
>
> Don't much care. x-madt-rev?
>
> > >
> > >
> > > On Tue, Mar 28, 2023 at 11:59:24AM -0400, Eric DeVolder wrote:
> > > > The following Linux kernel change broke CPU hotplug for MADT revision
> > > > less than 5.
> > > >
> > > >   commit e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
> > >
> > > Presumably it's being fixed? Link to discussion? Patch fixing that in
> > > Linux?
> >
> > https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
>
> Great! Maybe stick a Link: tag in the commit log.

If the original bug is in the kernel and kernel upstream has accepted both
your fix and Mario's patch on the acpi revision mess, I see no urgency to
fix this in QEMU.

Maybe we can address this in the 8.1 development window.
