Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1210716lfb;
        Mon, 20 Dec 2021 09:28:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdwAg3io1SO3JxyzFBpemIjb4oqG7A8fZ/Zwcmtp3WdFp6S+8A+4qP6mYcRuQqP1u6pH2r
X-Received: by 2002:ac8:57ce:: with SMTP id w14mr7966920qta.252.1640021298436;
        Mon, 20 Dec 2021 09:28:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640021298; cv=none;
        d=google.com; s=arc-20160816;
        b=AKzjU/YxMkfI7hwmOLXjGvAuWlU+fJZ9SNJ9Hzk0htu0MLMSiLuoPpzFqOSPSxc04Z
         NtINSckOJQRWpIuUTWV4vHyyBavWlNoSG5LmP6Qz9fb+0XpOVjvvghEVYUv1n5gPPMTA
         32+fxZPhEan+buJgaKBs7eVB4nZ5VwRiDjUhsC+P1KxQ7+O4XWj14cY/OA2MzsnmzmAr
         jfH+rTjiVJUS8F9ysc9SInSo7FHqiYcS776INukAxF93EBFBI2xUcNTFwLSsn0FAvk+j
         y6QBF0YKjBqHUjZ3pjls4gGSlj8hs6e6Lt77K+/0t3yvrM8gKJURafxT+lt7BOf8UdKy
         h7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:from:date
         :dkim-signature;
        bh=XJr9ohjSbY2mtqEGDUiSRXtOeTpWdTfoJN+NgFRGTw4=;
        b=Sb8pmENbcp5BcJKlxOJvajlmgGgIgbNOQYH7rPK19CXFCEIOxKdM06fgvgdP6kZCZl
         opqy3/InQgYDXIL7nQuVJONRqFsEU2D7pVam1+6XoqyZ8EN5s7CB74eOsKchqxZtjDs3
         /wjxQf79Ym2n4qUHPwvTrDsfnv1HJW3QwSvgo2CNmcJpTUqgExtYkrpVRs0VvaLOCQwY
         cCCqtSjisur0yyhxug41iYqVk0DnuWr3O7XToqaDPFWXT0voj4U8ZTxkILzQhFBCGcLW
         hMcao1dPI9ygGCHuV7dck014Kk/VxrT+GdVWvfjX1fQFxQZXzrLq6iLCXn91QAVsKcwf
         QZ/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b="y/3sqiAL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si908486qvd.458.2021.12.20.09.28.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Dec 2021 09:28:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b="y/3sqiAL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mzMSP-0002Mj-Rl
	for alex.bennee@linaro.org; Mon, 20 Dec 2021 12:28:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mzKaM-0005d1-LL
 for qemu-arm@nongnu.org; Mon, 20 Dec 2021 10:28:22 -0500
Received: from [2607:f8b0:4864:20::136] (port=42758
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mzKaH-0002Xs-Qd
 for qemu-arm@nongnu.org; Mon, 20 Dec 2021 10:28:22 -0500
Received: by mail-il1-x136.google.com with SMTP id w1so7867941ilh.9
 for <qemu-arm@nongnu.org>; Mon, 20 Dec 2021 07:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=XJr9ohjSbY2mtqEGDUiSRXtOeTpWdTfoJN+NgFRGTw4=;
 b=y/3sqiALMDYsr42Ls7geAa1ShUBCm549GMgJMEKjYF5v+Dbm12HrBpimyTl7xqc73O
 2GLMFchjyepIOxolov5zo0w0M2tyeJDd9gWgqOjtrg0oiNmZNYBF0sjr0kzmthmCnru6
 v+62K0/4ky4ON5D5X5pIZq3X1bOhaO8I0Qb1oO0GGdTogkGXxwK9TAUcGLSkxx6COoEA
 oc+/IVAENKVLKZ5hTMuLdH2vYdxVCo9Qt7zbAEf0wypWiQ82sD9kSbOsE5fF0nAi6Rhk
 Y/hZjFcYpCL3/VIhUFDk5OMqKEtKsy2reJYJ2Mjr9AGHh3kVZoI8GBOt43KsNTVw+Yhf
 L9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=XJr9ohjSbY2mtqEGDUiSRXtOeTpWdTfoJN+NgFRGTw4=;
 b=teUAYkG6o0kEKd6dXksOl+8oIMixgvLtioUbmbX5b9KssICBw8DR5oPmucI3m/Sj6j
 op8z0R6YP4Usmm8qwSASZzjY8QSHuNNiGkADgNm9vlOcTIUUAepXzPpdM2XiDIGoYGde
 GV1pjpNPoexF0dihNm1IZbIdQsrum13FWgrqnl7DdNJiHuNR91nMmEYbc2ipezBBi3Sh
 E1NsWNJ+hhKyAdv055W4wBsQyinj/9gAWzozl8swbHCT7dlGH0MQifaSU0uhWirFrxr4
 BuU+SczCkEnLN0OU55xEpSAwCKb14Z0yRAAUdw9uiTqUATbC0f1l8EJV18azuiAkDGEE
 yZQw==
X-Gm-Message-State: AOAM533thTV0coXhYyk13Lii5cm+t+OIRrByCVC2l2wrSEYo6pNXC1dL
 80LFhtB1TU9rc6x5JZrF9dBkZpkaZtW03w==
X-Received: by 2002:a63:1a46:: with SMTP id a6mr7067642pgm.373.1640008549226; 
 Mon, 20 Dec 2021 05:55:49 -0800 (PST)
Received: from [192.168.1.5] ([203.212.246.92])
 by smtp.googlemail.com with ESMTPSA id 59sm17373907pjz.34.2021.12.20.05.55.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Dec 2021 05:55:48 -0800 (PST)
Date: Mon, 20 Dec 2021 19:20:24 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: Thomas Huth <thuth@redhat.com>
Subject: Re: build qemu on Monterey?
In-Reply-To: <4dfc91ff-1835-e796-772c-0774e089b57b@redhat.com>
Message-ID: <alpine.OSX.2.20.2112201919570.23921@athabasca.local>
References: <alpine.DEB.2.22.394.2112182006430.46303@anisinha-lenovo>
 <4dfc91ff-1835-e796-772c-0774e089b57b@redhat.com>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x136.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mbt5N6v8MQdI



On Mon, 20 Dec 2021, Thomas Huth wrote:

> On 18/12/2021 15.38, Ani Sinha wrote:
> > Hi :
> > Has anyone tried this? Yes, I know about
> > https://wiki.qemu.org/Hosts/Mac
> >
> > but I am getting
> >
> > $ ./configure --target-list=x86_64-softmmu
> > Using './build' as the directory for build output
> > Disabling PIE due to missing toolchain support
> >
> > ERROR: glib-2.56 gthread-2.0 is required to compile QEMU
> >
> > when glib is already installed using brew.
> >
> > Any ideas?
>
> 1) Check "config.log" to see the exact reason for the failure
>
> 2) Check .gitlab-ci.d/cirrus/macos-11.vars to install the same packages on
> your system, maybe that helps...?

I ended up using a ubuntu docker to build qemu on my mac.

>
>  HTH,
>   Thomas
>
>
