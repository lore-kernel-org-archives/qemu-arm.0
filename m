Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1727776lfr;
        Fri, 9 Apr 2021 11:31:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNZ5bFqmYeWqY5teXm/947zsaPeU2J02kNEj04QVfa34dAmgq0drFH5U7lEUpxb5rIlz34
X-Received: by 2002:a9d:4b8d:: with SMTP id k13mr13064757otf.354.1617993105016;
        Fri, 09 Apr 2021 11:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617993105; cv=none;
        d=google.com; s=arc-20160816;
        b=e8Wj+c8JOhlbHStW57DxupWY5QZdI4jeuCnUDksJjha1q9zJPI2rqgzonbOtkgsgr0
         8xrawIn5lkYZJS9b9uBBoj7m/st9JzFX34mOEOdsKuM/HrUE3nGfGve4dFfjxiTAph6s
         F7GT78R31xbixO8QS1GdOKyhwxR5boBu6MXuiG1CKY9Lo68xOTl+fG/XEUQndrPqWjBv
         0hPV5g6pC4uVM993Kxmme0OCNlHJh7SfPRlPhBhk3eq+yC94qknBfpeMkUBgDXWsw6xp
         jsUP2oo42PrgYvoj7HPPsbhf/lIkXUMoZmzeEBoY+m0jf3hgqDy1sXpk8qAP+upytjkW
         +9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=Qqac6+aH4uhjP9YK4h95DF0MHcvTH/SZ25/HubAq0lg=;
        b=VbKI857WW6qMoKVDbmdqfiEqZxFrNyoMkKYKBEMOAGGLifnnidWL86S/FkqL0lzLV2
         yj4vtoOvTGO6czqjuf0fV3jrelBJ1lVLH7w5bGXLvBeSdm3KjalfW9oW6JTz2K0TTt5L
         gDPhH7eJxfJpZ+3Mxe54pqHUKB6wqfWuIh5KlgJ8cYHSqk5ao3iq2TDKVzIVm6V5IkgU
         srn2hsX60RZT00/QLtBGg4YVvBhPyOoo4qOU2P1gnCr1/wkVyBtPzJKPGfFLgk56ut6A
         XnMkKi0kfut4nrrOU9UsxT3cPUhwnENWODR75N8RSYFGdnYuwJy1/V2WkJ5N3aGFBI4a
         dzMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=wqn7eqEB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si295000otl.20.2021.04.09.11.31.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 11:31:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=wqn7eqEB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUvuy-00082P-7u
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 14:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lUvuc-00080W-7b
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 14:31:26 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:47031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lUvuY-0007Cu-FU
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 14:31:21 -0400
Received: by mail-oi1-x229.google.com with SMTP id m13so6667850oiw.13
 for <qemu-arm@nongnu.org>; Fri, 09 Apr 2021 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=Qqac6+aH4uhjP9YK4h95DF0MHcvTH/SZ25/HubAq0lg=;
 b=wqn7eqEBiNiQVrbdNYw0XWCgr/CL643GPFstyRrt7LyG9GbuyuWNUs1wifOIcaPqnd
 GdVvEl91lyW2W3WCFZrDH3PeI06FSOlPNCzSpV3xug4rWyEdWPQ4gnleRahka7cdRF9A
 HIEpbrJjQ0HY8cdY0kIwoZKXGPt+sGMsavaNngR50TCTkbqQm+nBWJNxyjA0v4PoeNTe
 UCyvVAuRov4tVgKs8xpGsxmIQohwJzL+WJM/EbFDAlb1KHMVBZ7FZgk0cxtacmEiH6ih
 9lMzci1il2kTYw52OVnQ/93sK6LEo5nuUTUVWJNXUp5o8RdEZy4DaWFXi8SQQ06IFCk5
 QHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=Qqac6+aH4uhjP9YK4h95DF0MHcvTH/SZ25/HubAq0lg=;
 b=ZhlaiQpw72cPTOQfcve8k+5igUKZYWcOwQ0xZrxB7H0/P5RBaE0pgnnRew7otqQvrn
 C//1DFMI7IlRJK5wk6ugrhDLw3RcJjmBzbZ9DaJWh6GLkUzb1tUY5sjVFwvdUwAVRith
 nFEH5T/WzPftTv5GribRLf/KMLo0apbMvXOM6ZypfsMRnXGerCY0610HrVajpQTOLLTq
 XDxruQRwfrW82qz9+Si67Bg17MzyNFy8e67UkIphOQDtgzHIoT1LkeHWaBpB5mEPqP/c
 PZzfgVqaq+5S2LfxY4vAXhl4ecJYHbI7ZCJefRnpFrq12zfEDslKF4W5svxd4i1RMa88
 R61A==
X-Gm-Message-State: AOAM532XdJVXgSO4h/pHoklvtUZbHqI8HzGzN5diRxzlp9d5Yu6UlGX2
 nmf3rHvUbrZl91rpLHw4zz2zJQ==
X-Received: by 2002:aca:d907:: with SMTP id q7mr10884706oig.17.1617993076270; 
 Fri, 09 Apr 2021 11:31:16 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:485a:30a4:59bf:2a09])
 by smtp.gmail.com with ESMTPSA id m129sm659863oif.34.2021.04.09.11.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 11:31:15 -0700 (PDT)
Date: Fri, 9 Apr 2021 13:31:14 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH v2 0/4] hw/i2c: Adds pca954x i2c mux switch device
Message-ID: <20210409183114.GW7167@minyard.net>
References: <20210409162545.3705962-1-venture@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409162545.3705962-1-venture@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=cminyard@mvista.com; helo=mail-oi1-x229.google.com
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
Reply-To: cminyard@mvista.com
Cc: wuhaotsh@google.com, qemu-arm@nongnu.org, hskinnemoen@google.com,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZtKlszwDcOnq

On Fri, Apr 09, 2021 at 09:25:41AM -0700, Patrick Venture wrote:
> The i2c mux device pca954x implements two devices:
>  - the pca9546 and pca9548.
> 
> v2:
>  - the core i2c bus now calls a match method on each i2c child, which
>  by default will only check for a match against itself.
>  - the pca954x device overrides the i2c device match method to search
>  the children for each of its buses that are active.
>  - the pca954x device now owns an i2c bus for each channel, allowing
>  the normal device model to attach devices to the channels.

I like this design.  Avoiding hacking into the bus code is a bonus.

Can these devices really have multiple channels enabled at the same
time?  That seems strange, but I guess that could be useful.

I'm not sure if you need to add a vmstate structure for this.  In
general most new devices have them; if it's ever included on an x86
system (or a system with vmstate transfer capability, probably more than
x86) that will become an issue.  I'm not sure what the expectations are,
though.

-corey

> 
> Patrick Venture (4):
>   hw/i2c: name I2CNode list in I2CBus
>   hw/i2c: add match method for device search
>   hw/i2c: move search to i2c_scan_bus method
>   hw/i2c: add pca954x i2c-mux switch
> 
>  MAINTAINERS                      |   6 +
>  hw/i2c/Kconfig                   |   4 +
>  hw/i2c/core.c                    |  55 ++++--
>  hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
>  hw/i2c/meson.build               |   1 +
>  hw/i2c/trace-events              |   5 +
>  include/hw/i2c/i2c.h             |  16 +-
>  include/hw/i2c/i2c_mux_pca954x.h |  19 ++
>  8 files changed, 382 insertions(+), 14 deletions(-)
>  create mode 100644 hw/i2c/i2c_mux_pca954x.c
>  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> 
> -- 
> 2.31.1.295.g9ea45b61b8-goog
> 
