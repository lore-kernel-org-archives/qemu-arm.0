Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1970656njb;
        Mon, 10 Feb 2025 06:23:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV5mRlZczrHvanxtxjU6VuqmyWqyCK6Pap5A6U4iie2M70OMu7BcXMfOHVcdykyH+9QMoVyTDlccE61Cg==@linaro.org
X-Google-Smtp-Source: AGHT+IETMQcLcCtZafvqqwRvDcWQRA9Xd8VZpYB/nWJZINCQ/sahxDfcv2ys63JGpHgUB+EN+eO8
X-Received: by 2002:a67:f298:0:b0:4bb:ccf5:c24b with SMTP id ada2fe7eead31-4bbccf5c73bmr1513615137.2.1739197403758;
        Mon, 10 Feb 2025 06:23:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739197403; cv=none;
        d=google.com; s=arc-20240605;
        b=LMOez12WJGKjX1UQF4pwOxnAOKiHfHTg6+dEimsLrkSNobf8943tS1oQeLeGJHz4kv
         XmQJpdZzxtuRl1fqYEMdnvh/a6A/Dy95ZeBbbQDX/Yd0fF50Yn8IYFNIdxZBzu8GRoOz
         L505qltaFj770w8MDCgJ8fWCMOPMGohGh6h6aow0OoIT8fOk05UWXyUoKhAHiwKFQ0ny
         UIR+2S4+zVj2KQKvYfKuFexcw4uDhTFjX8L352Zci0IOix7J3SSu/5g6ax5uWjuc2VLi
         QW+VOa+4mB6CZ8+csoGuAeZS9hLA+7babEaHC5aT9t70isb470Gix05CySsaE74WtKNa
         kJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QPvyExTaD3QmjxtU+fytRH974XXHx/8qsCgK4X6TVI4=;
        fh=zYhMXjgWjEuAWx/OR9NSLsgj6pTxvXQMERp+C6VBfEY=;
        b=MewYUxTwj1otf8K+iZQdO+YYuDC7vAtluR81DJshhfLeMvRRs7VFMuFAXzk5rOIRNg
         Z5e26z3Xi8ztzj3tqOQOXdx860gFMPdAc3aAsjvHoMfzmBnbW8O/PSjU/aJfP7dE2D7G
         o5xSwXDUJ8cXKv9zHuiqRVsQjV7+syRMwbFWydqmniOtGD6Bh76B1KS4EC16Ec0BDIU0
         7iu+fHsvtvvqpdfRxJu8iUPO4s6TLIRlDJmiBhRUgD5+KbeoOwzQLeSqScHsQ9Agi8OZ
         BmZarE5qzex4spBhyKgwjYCM0zYIl8TslYUPlRiv2zN8LWNtmuKcrKbxhSjta29/KNYF
         rrMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=imtihAFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-866f97ba603si1766622241.95.2025.02.10.06.23.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 06:23:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=imtihAFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thUgt-0006DP-79; Mon, 10 Feb 2025 09:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1thUgp-0006Cs-54
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 09:23:13 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1thUgm-0006pn-TT
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 09:23:10 -0500
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e5b1837d182so4386754276.0
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 06:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739197387; x=1739802187; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QPvyExTaD3QmjxtU+fytRH974XXHx/8qsCgK4X6TVI4=;
 b=imtihAFZF5X8mH0bmoObS3UG9Zod5pf27IgrjNI1WXYh74RMBs6vQ96tqf0MGtYM+C
 mVG6opDXOpn0r2C/R/derMYigvfikBrE55oKMwy37gIHcs9iheNHzJB+Dy/cI01PM4c9
 V7NWOBkZh8JHxV5CcyLvwHUDaYi/u3/JNWspcJwWKKed8VmJBQgDU+Bf1PcQXsDjrZg4
 mHww8mFhOLxv4W7HkRBFKFxUn1tqTAa1WcOHVBQ3G49o1SM91vlBf7iR/EO0NXBDHKar
 NDXDD99bMHNMQCV3HvvDRpIxwUHsyiItC6Vz/Dj9mi5FG3rUh0M1qGqgK2qNNufMM8za
 8wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739197387; x=1739802187;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QPvyExTaD3QmjxtU+fytRH974XXHx/8qsCgK4X6TVI4=;
 b=TOkKplQdBolXdoR0hLcOwDkeRx0aWRS8X6qErele2FIUPq3hDlyqkyfcNKqU4EoI6m
 c6vDVKXRiwrv7V0r323lDPmYm0kIWXjkZn04+eNHsKuCb1Jp3onUfb6VZv/+0xnvQb0I
 SLwubt/YIqAygbsKYTf/8tZRQ9Qxi2K4A+RKryseQp+FHHW5V4aayFV+jx399EXJtvCb
 IJDQbDcV6ahugeK1g2ixoSmRPlB/xko53R9HCl1+SF9riRIdv8rVbiiv4aqjoKrBKoOF
 0AJQIllmmf4BxArHt0vwBxuAVg8bFu5ue2JjLK0PL0wAIADbk5n7ogEa7vcDLL0uyh5b
 8N/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvSymKWd6BnBriR4b2JaHSYtqYeDO9NhayKpnc08cX82NWTNKK6WIwiC+Y5gE1NYRMa0vR/2WHww==@nongnu.org
X-Gm-Message-State: AOJu0YwZJm9Fu5HOwnJcrtlkoSjvFyNR7MVRIufJMnzRwLhe3ANmL76w
 J22iKx3RHDk75KFFjUKWKBwTZFvRIVBEEX9PzHNlQH2i5X6cuoU2hK8Lf5FwJWWSwPxjmxd4kDj
 WuYhACx7Yovtv4Bq701tyuttXm8cFlSp9tIcxDw==
X-Gm-Gg: ASbGncvGMlVytxyL4C9IAowrvL0SAMnVmJFHPG9suKTNhzzRSpNMq62LPl0qF34ERkV
 la/gL+jPNBHFfrWz5Yr2wPImvT7ckVu3OEVAf3vHSUlUlrIgsiuXgShwp5hPg95sGfdpPT7o/eA
 ==
X-Received: by 2002:a05:6902:218f:b0:e5b:4651:b5c6 with SMTP id
 3f1490d57ef6-e5b46c9a8b8mr12117740276.23.1739197387591; Mon, 10 Feb 2025
 06:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <20250206142307.921070-5-eric.auger@redhat.com>
 <CAFEAcA_LgrBRbafVQ0vLGPd8xG=wsLjWnKTJ2JSEREYUqgRQBQ@mail.gmail.com>
 <7102d470-ac72-4c02-b8bc-20f1379a4843@redhat.com>
 <CAFEAcA-XK5GwT0b_Ff-8fYnWcDgzaE-0Ei-YqDoXv-aXFGNXUQ@mail.gmail.com>
 <Z6ZHTStx_S9ALdxt@x1.local>
 <CAFEAcA8ovoGsQ9oEco88iw3iUy_3kBOUaYHL+oq5VF-i9xg4+A@mail.gmail.com>
 <Z6oJzRCt_fJLfkmQ@x1.local>
In-Reply-To: <Z6oJzRCt_fJLfkmQ@x1.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Feb 2025 14:22:56 +0000
X-Gm-Features: AWEUYZnWjovpjjUXcsKu10xZTHp8n_Z7dx_6vwaK5cZSlyL3OIC1egmzqup-5rE
Message-ID: <CAFEAcA9640s-Eu7PHxJ-Xb5X38n-25pnUG+GxymsAWkJf8YfcA@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/arm/smmuv3: Move reset to exit phase
To: Peter Xu <peterx@redhat.com>
Cc: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, mst@redhat.com, jasowang@redhat.com, imammedo@redhat.com, 
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org, 
 zhenzhong.duan@intel.com, ddutile@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0wjTB82OBgj8

On Mon, 10 Feb 2025 at 14:14, Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Feb 07, 2025 at 06:18:50PM +0000, Peter Maydell wrote:
> > On Fri, 7 Feb 2025 at 17:48, Peter Xu <peterx@redhat.com> wrote:
> > >
> > > On Fri, Feb 07, 2025 at 04:58:39PM +0000, Peter Maydell wrote:
> > > > (I wonder if we ought to suggest quiescing outstanding
> > > > DMA in the enter phase? But it's probably easier to fix
> > > > the iommus like this series does than try to get every
> > > > dma-capable pci device to do something different.)
> > >
> > > I wonder if we should provide some generic helper to register vIOMMU reset
> > > callbacks, so that we'll be sure any vIOMMU model impl that will register
> > > at exit() phase only, and do nothing during the initial two phases.  Then
> > > we can put some rich comment on that helper on why.
> > >
> > > Looks like it means the qemu reset model in the future can be a combination
> > > of device tree (which resets depth-first) and the three phases model.  We
> > > will start to use different approach to solve different problems.
> >
> > The tree of QOM devices (i.e. the one based on the qbus buses
> > and rooted at the sysbus) resets depth-first, but it does so in
> > three phases: first we traverse everything doing 'enter'; then
> > we traverse everything doing 'hold'; then we traverse everything
> > doing 'exit'. There *used* to be an awkward mix of some things
> > being three-phase and some not, but we have now got rid of all
> > of those so a system reset does a single three-phase reset run
> > which resets everything.
>
> Right.  Sorry I wasn't very clear before indeed on what I wanted to
> express.
>
> My understanding is the 3 phases reset, even if existed, was not designed
> to order things like vIOMMU and devices that is already described by system
> topology.  That's, IMHO, exactly what QOM topology wanted to achieve right
> now on ordering device resets and the whole depth-first reset method would
> make sense with it.
>
> So from that specific POV, it's a mixture use of both methods on ordering
> of devices to reset now (rather than the order of reset process within a
> same device, provided into 3 phases).  It may not be very intuitive when
> someone reads about the two reset mechanisms, as one would naturally take
> vIOMMU as a root object of any other PCIe devices under root complex, and
> thinking the order should be guaranteed by QOM on reset already.  In
> reality it's not.  So that's the part I wonder if we want to document.

Yeah, I see what you mean. The issue here is that the iommu isn't
actually a parent of the devices that access through it. This is
true both in the "qbus/qdev bus tree" sense (where it is the PCI
controller device that owns the PCI bus that the devices are on)
and also in the QOM tree sense[*] (where usually the iommu and the
PCI controller are both created by the machine or the SoC, I guess?).
Instead iommus are separate devices that control data flow but
aren't in a parent-child relationship with the devices on either
side of that flow. There is a guarantee about reset ordering between
bus parent/child (so the PCI controller resets before it resets
the PCI bus that resets the PCI devices on the bus), but that doesn't
help the iommu.

[*] I have a vague idea that ideally we might want reset to be
QOM-tree based rather than qbus-tree based. But getting there from
here is non-trivial. And maybe what we really want is "objects,
especially SoCs, that create children can define what their reset
tree is, with the default being to reset all the QOM children".
Lots of non-thought-through complexity here ;-)

thanks
-- PMM
