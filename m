Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1767971lfr;
        Fri, 9 Apr 2021 12:34:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzIx8LKpzr3qJKiYDHQKWGFEqhPRADcwAGuTc7qyugGT4I0x4YQvY4/3YDhrK9kiNPjB5r
X-Received: by 2002:a02:aa92:: with SMTP id u18mr16323965jai.119.1617996890142;
        Fri, 09 Apr 2021 12:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617996890; cv=none;
        d=google.com; s=arc-20160816;
        b=LoTlzwXJfpAhTsvsm8cuxsghXF9gpIRHSSbSm/riGT3X7iQcCXqx9Pg6SYowfSUbKI
         qC2jpHwSgU9TLEf120W6XELXRKxv0LtHU8lXsRIO0uujJ69KDsXcsp2rhHQ61sdEp/GK
         dxey12iScbRGOWbKxNWZYETQdyRLeiCzuxbnGCuFI5wLCeHVryrVCErK6jj53fbXchec
         vBEDcCeeRawiD9l52mejl6/P8GRUJrxaYTM0uoBYfH9/F4CRi/hyytT3GeJnKamEitaD
         jV+opY9FeEJfOj2HfpOJKjf9HqDypUFVNFY3pB3lWTyUhzf6Bz7mUH16d8ujvqNKukNw
         UzRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eEvqqfA2j4DDS4JvDoHMM1dQM7AjBlWdKxEXkdhBR5E=;
        b=OFAmsClo0kuekVbjIRonjHebH+sycB9MmP4izXejJI4s1usQ3RIMt6f96CUAR+LUmw
         B7yoMNwy7ESVir+tH2uvkgmjM5nZYk7d1NBlAUuASeQEtGPCw8Rws9pK0cETKsNhRXVE
         yCVAUgZDB2HeZzhLUMK0qxnUPw+bZUhUVCaiZ86WMo4VXlONMkxaquIx+oVIvJJfKpz/
         nXLEoIiqU55QpYzfJO5yVZz5N89fJzYAfqy7Tz4jw5Yt1ZEZDKPbqPfMuLxP+MfroSOj
         qM8QHVfjy82s2VdnUg6qItyHGcdVUU2y8XpBcFLgm6+MDFOF7LguNYjQ1NQDw0ugjoRg
         dVTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=b2Wn++WY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si3501149ill.104.2021.04.09.12.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 12:34:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=b2Wn++WY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUwu1-0000vF-Cv
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 15:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lUwt0-0000UE-AM
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 15:33:46 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:43979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lUwsw-0001Um-SK
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 15:33:46 -0400
Received: by mail-qv1-xf33.google.com with SMTP id h3so3245715qvr.10
 for <qemu-arm@nongnu.org>; Fri, 09 Apr 2021 12:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eEvqqfA2j4DDS4JvDoHMM1dQM7AjBlWdKxEXkdhBR5E=;
 b=b2Wn++WYNO+Q/KyRqv6Pdyure3pAgQnX7ZG7uVo3KF3Ead3hzsNsH+v75XY692mFcX
 L21Q0rWbKfzCtKGZ0Xvejr5ms9HlW6AHZyD8gRCGCwNQpAMcasrIF/vrHZ5q13bBDcMQ
 R3RyMd+cnhklKZAMl6/s0+DsvUnzSce5agFu09ATauOxRLPuDTc4e3bZSPBuvF/rufM/
 VTCcXx/NuqX1l0K8/uxmzqXUUqX1T3lBnxvuTGIooJCgbOe0S1BV37AAmHJvwSwglhBB
 PiNJPbF8DcLcjg4QEBnxxWDosEWPBrxYguCmKgpCTze1ppozhmAbVdoIGwtS1XpHT7x7
 DPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eEvqqfA2j4DDS4JvDoHMM1dQM7AjBlWdKxEXkdhBR5E=;
 b=R++duJqK9nHmHxnH+IP1vSXRxi8R7EeWBi85uNBRu19prcvIW+oFTOHASsz9bp3/Wt
 0PhX+QouM7xaY9AWhtCbj0cOdDQOOS/ikD3SOtQGeLFT8OOv3iCH9wVHCSEX7bGWaYd8
 fGIpO9MsoGyNmFByTahF9z4Hel2mlUzm+Xuw2Fv3mu31nDWY4tn2yg3L3s1mF15EwbNB
 zGlhUe45Diuw1aZqL+8tDrdvieds1P38jFLiFzMwuFmnzyg6GTOkJi6YFtb34fCo2bCz
 /v0UBMKRZ8//w4jEec4sLA5wCerrD/CFckx5wFGU3tlYLGvxFGglgdMHEld/7ELkRT7g
 /Odw==
X-Gm-Message-State: AOAM531JR3bgoxCs9DMqk9eGnq12PDNWG98f5o4ZZcEYYJqyzM+KbjV4
 TLmzZDFOXFaMU5VWeREigCRvONKZWtb4gGDuGcrQEQ==
X-Received: by 2002:a0c:e88a:: with SMTP id b10mr15806685qvo.21.1617996821620; 
 Fri, 09 Apr 2021 12:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210409162545.3705962-1-venture@google.com>
 <20210409183114.GW7167@minyard.net>
In-Reply-To: <20210409183114.GW7167@minyard.net>
From: Patrick Venture <venture@google.com>
Date: Fri, 9 Apr 2021 12:33:30 -0700
Message-ID: <CAO=notzGGKFBAVwJUs4OFiN_v9GukSZe-SXMB2bY=S2=Rx5m+Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hw/i2c: Adds pca954x i2c mux switch device
To: Corey Minyard <cminyard@mvista.com>
Cc: Hao Wu <wuhaotsh@google.com>, Havard Skinnemoen <hskinnemoen@google.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=venture@google.com; helo=mail-qv1-xf33.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g9Ne9klTEbxM

On Fri, Apr 9, 2021 at 11:31 AM Corey Minyard <cminyard@mvista.com> wrote:
>
> On Fri, Apr 09, 2021 at 09:25:41AM -0700, Patrick Venture wrote:
> > The i2c mux device pca954x implements two devices:
> >  - the pca9546 and pca9548.
> >
> > v2:
> >  - the core i2c bus now calls a match method on each i2c child, which
> >  by default will only check for a match against itself.
> >  - the pca954x device overrides the i2c device match method to search
> >  the children for each of its buses that are active.
> >  - the pca954x device now owns an i2c bus for each channel, allowing
> >  the normal device model to attach devices to the channels.
>
> I like this design.  Avoiding hacking into the bus code is a bonus.
>
> Can these devices really have multiple channels enabled at the same
> time?  That seems strange, but I guess that could be useful.

I believe I saw that in the datasheet, and it seems reasonable that
someone might want to do that.

>
> I'm not sure if you need to add a vmstate structure for this.  In
> general most new devices have them; if it's ever included on an x86
> system (or a system with vmstate transfer capability, probably more than
> x86) that will become an issue.  I'm not sure what the expectations are,
> though.

I am perfectly willing to add the vmstate structure in a future
patchset.  My team is actively developing Qemu now for BMC automated
testing support, and we will be adding other pca mux configurations,
and other support, so this will be active.  I don't anticipate a host
system including this device yet, but that's a consideration I had not
considered.

>
> -corey
>
> >
> > Patrick Venture (4):
> >   hw/i2c: name I2CNode list in I2CBus
> >   hw/i2c: add match method for device search
> >   hw/i2c: move search to i2c_scan_bus method
> >   hw/i2c: add pca954x i2c-mux switch
> >
> >  MAINTAINERS                      |   6 +
> >  hw/i2c/Kconfig                   |   4 +
> >  hw/i2c/core.c                    |  55 ++++--
> >  hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
> >  hw/i2c/meson.build               |   1 +
> >  hw/i2c/trace-events              |   5 +
> >  include/hw/i2c/i2c.h             |  16 +-
> >  include/hw/i2c/i2c_mux_pca954x.h |  19 ++
> >  8 files changed, 382 insertions(+), 14 deletions(-)
> >  create mode 100644 hw/i2c/i2c_mux_pca954x.c
> >  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> >
> > --
> > 2.31.1.295.g9ea45b61b8-goog
> >
