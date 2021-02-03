Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp181333lfo;
        Wed, 3 Feb 2021 04:26:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsTqlLN+EknIV6SHKR4EoZL+fSs499GlRI0ZCkPqTkk+G04V70Ram+b7dqo7RQH5H1Mwit
X-Received: by 2002:a25:69c8:: with SMTP id e191mr2202724ybc.446.1612355183247;
        Wed, 03 Feb 2021 04:26:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612355183; cv=none;
        d=google.com; s=arc-20160816;
        b=sZvwAPfJi0ASnStshiMNyyQKmI7FXF81vun7cECnuupxhfFbJ7RaDqEXLMoPZpVohV
         8/IbUzTgS47hvR80F0+1UE/QZTWLUYIpRnDjRjDXp81ZItpYNCndy5xTEdtUwE+NE2c0
         S7ansrH3hMVpfr5M/eXgKdGtVVGfLcRzNYp+sG9MPlPiatsKwWII87Y4xci/T32xD9de
         0PFtTwnAEe07PdRiWX1KPVYApnRMa13/MxFwBiy/fCAbTYlnDOl6FVCMcRqbzJsjXOE4
         cQ2t98xWJPqvv/7rIx6ztC1exwjD2JiPsWGmdgqyMcF10swS55JZP8Nlnn6PIFeYDLh3
         fBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=oxMfT/7YoIew+n+1+EvavO1Ar4lv9KXNVU58zCZ30XU=;
        b=VZCNhN9wyWkAbVjcJJEBfQ/HF0684YQW+yQhX8hyNSg/VCPGw5s2x0B6pUtbdzM8ck
         KD2VXLPabZYdm1BU/7kXYt5tx/yNltZncq63hX1gcIYcteiqwnRihIsQCNEHOXZGyXEr
         3s9x4gYBpoYz9mvPulMCtMLN4lOSBvZWASHCaIpsEVIoFKe0O/MVjPvX95IxvRwGKRMZ
         WKb1U343/Ka3hvlyG2rki99hwgLxgv5fQjYn642m171HQ+bqs5b+LFyyZFgPZVynzNn1
         QNNhzvjbWvQ6fQ6QuzFpVjIqNkjYGXQjIj9AC7HXQ6bVawPCQdCUTbM64I0ZyEPUZl8u
         CZjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=iUs5imSC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si2779533ybk.131.2021.02.03.04.26.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 04:26:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=iUs5imSC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7HEk-00089V-Kl
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 07:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l7HEd-00089P-JQ
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 07:26:15 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:32942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l7HEb-0004hl-Kv
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 07:26:15 -0500
Received: by mail-wr1-x434.google.com with SMTP id 7so24056566wrz.0
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 04:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oxMfT/7YoIew+n+1+EvavO1Ar4lv9KXNVU58zCZ30XU=;
 b=iUs5imSCY6AOEUVvH1NWhKsJAFhuXZYOInbIOVe2QDYITvvKYMxYtQGCx4DA3ZLoRL
 s0DVDzUeTSOqQ0TVKtLVy2++nPM2CYweCMuJ4iU1TSwvrNbmg3FRbnJ7OGHfyWPN5FW3
 xP0PnFjcY6vkKa45mZo6+PlJUYOOEJsgbH+8GjwSg5c4G8CTd3njuplKW08aB9Rx/d1s
 RokVFM3iCzO4QwmO5fke63icUQIa8Q/rQhSTb3rRKw+akaKVh+TiMNL7MJAnQxgfYArX
 +CPreK2NRwq76TtIlv21uoGDOMnkuGTHg1lj/ac/iRJpSqvhxNhwNLcdZpj+1K6vwbU4
 7fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oxMfT/7YoIew+n+1+EvavO1Ar4lv9KXNVU58zCZ30XU=;
 b=D/bZ9d3AONGy7znzUH+Ipr1fAs28zBfpn4tB6v4gQZaKnt4pomLxoWO6ZgXW3Rvsce
 6p4GkZLZ/AJRM/lfrk5cL7wN9+htAdwMweUgFcaeIC7HUNtJhiLO62YrqXtn5i1oFcyV
 U/vxRmmrjENEWbjQD8sPjAPrRz0S4PsRduinI7YcFE5neLQYAqhl1zEFcoiXD+Y68N9T
 lCMw8kaJwb4WpsZt6trNnQQ+hvt7wEFZ7tezxzsQ4XyF0Ml7BnSNGU2ZWagTBuLqo6T6
 eYNmjUk0XL3KGx+cb/fHPbG8bk8vBZz7sFHCCLJ7O8+Wuvq38EgL80V/uBBvl8FLezmp
 ySHA==
X-Gm-Message-State: AOAM5300qclI5xvIdySuk8tZTJ3P2TdAoSwxqqybvarLZ+VDuW0iM59D
 5nfEdPi4gfBaA7apSEhrhf+/Lg==
X-Received: by 2002:a05:6000:1045:: with SMTP id
 c5mr3388699wrx.250.1612355172055; 
 Wed, 03 Feb 2021 04:26:12 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id r16sm3434064wrt.68.2021.02.03.04.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 04:26:11 -0800 (PST)
Date: Wed, 3 Feb 2021 12:26:09 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 0/4] hw/intc: enable GICv4 memory layout for GICv3
 driver
Message-ID: <20210203122609.GW1664@vanye>
References: <20210124025306.3949-1-leif@nuviainc.com>
 <CAFEAcA8M2TcRoAyXph1CvX5gOiMqWusV35ygkxOxZy_H_P5upg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8M2TcRoAyXph1CvX5gOiMqWusV35ygkxOxZy_H_P5upg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7oE4t+HznSLv

On Tue, Feb 02, 2021 at 10:39:22 +0000, Peter Maydell wrote:
> On Sun, 24 Jan 2021 at 02:53, Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > GICv4 sets aside 256K per redistributor configuration block, whereas GICv3
> > only uses 128K. However, some codebases (like TF-A, EDK2) will happily use
> > the GICv3 functionality only.
> >
> > This set aims at enabling these codebases to run, without actually enabling
> > full support for GICv4.
> >
> > This creates a ... problematic ... system, which will misbehave if you try
> > to use the virtual LPIs. But it does help with letting me use QEMU for
> > modelling a platform containing a GICv4, and share firmware images with
> > other prototyping platforms.
> 
> So, what's your aim for this series? I think we could reasonably
> take patches 2 and 4 upstream (they are changes we'll want for eventual
> v4 emulation support), but I don't really want 1 and 3.
> That would reduce the delta you're carrying locally, at least.

That would be much appreciated.

In a way, I wanted to test the waters a bit with regards to whether
gicv4 emulation could be introduced gradually, and whether doing so by
extending the existing gicv3 driver was the way to go.

Anyway, for now, I'll address your comments and send out a 2-part v2,
containing 2,4/4.

Best Regards,

Leif

> I suppose we should look at what changes QEMU needs for KVM in-kernel GICv4
> support at some point...
> 
> thanks
> -- PMM
