Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp821790lfr;
        Mon, 5 Apr 2021 12:59:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYUr/OZF+DXOgUxdh71M4BW1/zwxm6gVOnReIAERsyOko/wVZqzS/JvivXk80qkbuEC00w
X-Received: by 2002:a05:6638:2044:: with SMTP id t4mr26131450jaj.12.1617652744706;
        Mon, 05 Apr 2021 12:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617652744; cv=none;
        d=google.com; s=arc-20160816;
        b=af1j+QYPi9jOo7/GC/PKGse7tZAlnVKHKgHMtg0I5jakfuKWDMXvU0x1h6twgqNsok
         46HrI36npSup0zFk9VitqGv6cuHuf38xwgvG/1AQQHNmsgfURIo+hFfYwWijvUN0Louo
         B2RLz4FYXVhrmY9Nw4KzyhD9BaukdtghLSVjtmvJ1fW7O+42kMS6AyF1Qe40D86Yrjzi
         JMNas+BJKdKUDAefo9JR2jdzvUups4/qFjxg74fETFIFzLuG7sSVmVOkEq5610e+v/iT
         pduaWvtRc4lR3VOfmo7gUWbPc0lnzu+ZmG+3TCQXHOdAOaYOqlCdttjBsTna/ZbIqxch
         LaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=/IugjbICpfQcKtT7503fgZpKtCUS1q/Qdia330voPx4=;
        b=NAv0eyMZEf0s8VNvnZysrjNpnCMvYu4KhpAW7YTaunI2P2q+24Wu8sVYZo26oJPn7l
         xx5rNAE8wq0bYkYy2DLjfKl0gicrkyt4fJJSHY26WWRC+nwN5Y1EeHWNqoU67+Pgp9Vx
         ZtStLHha5nuKbZqwJ2uBKo/oT/5oAjpyQ59uyx47JivjF4gj1i9yuKxomaHKdf2sX2HS
         CV7fcgNJRGgCqnbjvfftDybusw+WN+YfNrKVFy2ZWGUfHNVXo7cTQgpyzVPg3vaMYb0x
         KimU52dIB2gQgRYJ2CY8/oP4FaFj8tflhmiyyNKuT2loWX4co1wms07SmSRKlh3xT7cS
         yHmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=Pq3soCOh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2si14898371ile.30.2021.04.05.12.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Apr 2021 12:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=Pq3soCOh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTVNI-00065K-1a
	for alex.bennee@linaro.org; Mon, 05 Apr 2021 15:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lTVMz-00064l-0o
 for qemu-arm@nongnu.org; Mon, 05 Apr 2021 15:58:45 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:37612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lTVMs-0004X2-Lh
 for qemu-arm@nongnu.org; Mon, 05 Apr 2021 15:58:44 -0400
Received: by mail-oi1-x22b.google.com with SMTP id k25so12723496oic.4
 for <qemu-arm@nongnu.org>; Mon, 05 Apr 2021 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=/IugjbICpfQcKtT7503fgZpKtCUS1q/Qdia330voPx4=;
 b=Pq3soCOhVWbhdHZ208e7Tv7wVA11dd1yYMqV8cYJSbAAIhN8DrI/kvj5uqDNn9/AXM
 Kdf8Ya2THYcQsIhI5YRBm4ge0Rgg56MpYnArqEtelhHtpi1mU/b1W04UyUSs2GS23L1e
 Mmxwdrgt6QFKitGooH33n+SrSmVEjVL6ZEHIjn/hIjsIBmw5/3cJ8QwRbCsaXUlkN0nm
 +/dMSZM5+OQo2tlUnovlrLaIVYFif8+jFdb/LCdB3N3xnxFZq9QC/eOVxEYCSyjVZwoY
 J3GJ2EkinpDEmgiM7ABKaTcmpJR3HgsiaU1ZEQns0P7JxOizxdMnP+w2lBC+37j5JIAn
 P44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=/IugjbICpfQcKtT7503fgZpKtCUS1q/Qdia330voPx4=;
 b=bSoBcOhKy0dmhS7irwVbzMtwNTnxTOk4y3sSUi8gxUXY2TOIjOXlwPpYYODQjM67Qs
 pDNpMg9MKVC0sqYsYEgLzfzcRMpZYWOM5jw5uBuZ9b7yUNOsDZpUtyj1UcazuU6cOcj5
 LGPtSmFhMzaqhCkhckFqAR0CBwzBpZNTICcNQlzKue2KgjR5qjnFAZzOBMj0L+6lRtle
 jhwWJ69EiSUlgIIbBjW7eNXOo9xZOcR1Rdlqorc1BDZl3mzGMw4rWo+9MWvCa7/ibBCp
 Wh4c1db5kxQ1v8vuNm/srrFTcqzt7EvAVQhO7MlaSyi4qUoEHrEO+UBe6F7KVRt4WJXH
 IXww==
X-Gm-Message-State: AOAM533nluaT+Hq2OLEA5fIjxI6JxfVWgYlfKbNncuKYJp03PmfM5tPe
 ZuCKTDexc/HNHrtXmv9UB8C2tw==
X-Received: by 2002:aca:d4d1:: with SMTP id l200mr552925oig.119.1617652716565; 
 Mon, 05 Apr 2021 12:58:36 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:8492:1f61:a64c:bf6d])
 by smtp.gmail.com with ESMTPSA id p22sm4322446otf.25.2021.04.05.12.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 12:58:36 -0700 (PDT)
Date: Mon, 5 Apr 2021 14:58:34 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH 0/2] hw/i2c: Adds pca954x i2c mux switch device
Message-ID: <20210405195834.GF7167@minyard.net>
References: <20210403222810.3481372-1-venture@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210403222810.3481372-1-venture@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=cminyard@mvista.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: uxr4qhKGMAYk

On Sat, Apr 03, 2021 at 03:28:08PM -0700, Patrick Venture wrote:
> The i2c mux device pca954x implements two devices:
>  - the pca9546 and pca9548.
> 
> Patrick Venture (2):
>   hw/i2c/core: add reachable state boolean
>   hw/i2c: add pca954x i2c-mux switch

Looking this over, the code looks good, but I have a few general
questions:

* Can you register the same slave address on different channels?  That's
  something you could do with real hardware and might be required at
  some time.  It looks like to me that you can't with this patch set,
  but maybe I'm missing something.

* Can you add devices to the secondary I2C busses on the mux using the
  standard QEMU device model, or is the function call required?

I ask because I did a pca9540 and pca9541 device, but I've never
submitted it because I didn't think it would ever be needed.  It takes a
different tack on the problem; it creates the secondary busses as
standard QEMU I2C busses and bridges them.  You can see it at

   github.com:cminyard/qemu.git master-i2c-rebase

If you design can do the things I ask, then it's better.  If not, then
I'm not sure.

-corey

> 
>  MAINTAINERS                      |   6 +
>  hw/i2c/Kconfig                   |   4 +
>  hw/i2c/core.c                    |   6 +
>  hw/i2c/i2c_mux_pca954x.c         | 182 +++++++++++++++++++++++++++++++
>  hw/i2c/meson.build               |   1 +
>  hw/i2c/trace-events              |   5 +
>  include/hw/i2c/i2c.h             |   3 +
>  include/hw/i2c/i2c_mux_pca954x.h |  60 ++++++++++
>  8 files changed, 267 insertions(+)
>  create mode 100644 hw/i2c/i2c_mux_pca954x.c
>  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> 
> -- 
> 2.31.0.208.g409f899ff0-goog
> 
