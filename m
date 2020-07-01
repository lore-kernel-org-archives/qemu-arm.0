Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp15925lfm;
        Tue, 30 Jun 2020 19:33:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyluYmDyRQiNt7DtE8D8lEojsSeDE/kA8weaz1VcGu74Lk9JmB+y+POatjkvx+gTeJNYTB
X-Received: by 2002:a25:bfcf:: with SMTP id q15mr32762155ybm.39.1593570802215;
        Tue, 30 Jun 2020 19:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593570802; cv=none;
        d=google.com; s=arc-20160816;
        b=M7CYG3kfnGrvReqrkaW/CYRX7Kj+WsbGQhSjRfT7Dk3GT32ADpgqVsabpjwg5xj2ev
         NV9uA2kSiu1+tMA3h9SeRs56JavoiuIB6Z9WgemOf/BS8+E7sUJJ5/xYB5YXdsS4QImn
         oOqr7/o7zTkuKsspyK/A0e8YFdeNzfyksKjyA/qSGxv/vreKF4p6/ufuwGpWUp3XcUoC
         /xD4imQ2OCRwYFG0zoX0pLLpKXMIM+uTvwd7N+vpboClUv1f0ssOZzO75E+JaC6Kj8aM
         ITmB95yj8sg2T/cl/osOEYkgbGwScJ7j5/YymYpGBAy5gcBB6w0+jBHRWVRWgiBmSP78
         1ZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ZWWfjuDqSXeZIt1m4SZ/3tdgtZ9goXmuhQ0mJabq1mM=;
        b=l5ztXHdThMte5IKLQT2pIXMK6iSPsNNxefjRRHB+D//wTZjczhQNf7jBlujfc5HsMb
         nAesb8h3fbo01WMa8Cilv8HsNJD32mF/gJbuakz2F5s8nP3gRCMD9RIZHWxJP1j0sftt
         jOnUkVggdegHNNGhRz+IY21Dc6YiQbOOxYNOh4T+ybvfDr8hFHqx5KkEOoC69u79cUSI
         zwtm7BcP75EWvEGVNHDcHM1iTuInkxqDeeQUKSuQUrWQsKqIoOb1dbyMOHoTOuYxhPwr
         73RHdDWzO68YPLc2bwTHO7gMfKlFbVERBSyG+oIOwmOIOMPuTLYMiI4uHKLKW0kIIoo0
         PnRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=FzewqP9l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g204si4264736ybg.404.2020.06.30.19.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 19:33:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=FzewqP9l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqSYr-0007tt-FD
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 22:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jqSXx-0007Oy-6X
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 22:32:25 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:34521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jqSXt-0007l4-Se
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 22:32:24 -0400
Received: by mail-ed1-x542.google.com with SMTP id a8so16971128edy.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2020 19:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZWWfjuDqSXeZIt1m4SZ/3tdgtZ9goXmuhQ0mJabq1mM=;
 b=FzewqP9lq0kJCZ21h1QrXN/S+JMJJ5xLAj44xk1T/jJ2phGNu2YQNIlNUWBGlvkz3Z
 Jrf6GYLHX19lJ2Qa/jDNWARweFudDYkT1l7h9vR4bizGT8PtYnnFcaU4ZkmtZF2vUrU4
 PV3XbdO5EeJcoYhwu7G5cM2TQkHN6AK4udsq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZWWfjuDqSXeZIt1m4SZ/3tdgtZ9goXmuhQ0mJabq1mM=;
 b=rodrPQArenlx0Ce5nVC2745kZbSOEede1hT6LalOofsLel/e/bPfCGpkpBy2HaowHL
 1JRSKXJXnitYVQ7BMthPbNuWTroi43/ydP+B8j8D46j7BrEvo7sT+8pWqIriwM2On0wq
 vTQSlPa5rJ4sFl9B+WVtyU5+gXBAoD4oAZvdxEzJpTrE0qTXHquEhwlfxUREBzp5f58F
 VSBmcQeaGsSFBE/X5h66ZQW0x/bEg+kzuqeJ3z99499Q/2KBfUoUL0PWkoXl9A64jM+3
 /Nm7v+lEVrruFj9kbwKhWBXaBGi5WB32vf4X2wp9ZpS1DdjJft6MMxWlkzkfbi1PT/HO
 MNsA==
X-Gm-Message-State: AOAM531+cJgL7dN+ZyCm3g7MBVU7SDDYncizWL25canxugkFV8GAkppl
 2LSKZ5HQJsh+GCHehp/LDwmwDdtT4/a7UwjjKr0=
X-Received: by 2002:a50:ee8a:: with SMTP id f10mr6811579edr.383.1593570740342; 
 Tue, 30 Jun 2020 19:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MHfoubt1g2FzcjTw3a0vNr7X2T8Jb+nYoc4_x=Z2TP51afKg@mail.gmail.com>
 <a7acba46-5a9a-5dd2-71c6-7e4586485823@amsat.org>
 <CA+MHfot6FdS2yT0mEsCW36bCfwy-WY-1KPQ-KDfYBKzTy=Gd7w@mail.gmail.com>
 <CACPK8Xdqr+EufMgooCY=D+Vt98qu11YTHE5Fzi5+xqX=wKReeQ@mail.gmail.com>
 <b3480de1dece41ed80091feba584c500@TWMBX02.aspeed.com>
In-Reply-To: <b3480de1dece41ed80091feba584c500@TWMBX02.aspeed.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Jul 2020 02:32:08 +0000
Message-ID: <CACPK8Xd=zz5oAXxu0Hd_szVQ5btQCMPPP7K7OrvAcoYr7zdpPQ@mail.gmail.com>
Subject: Re: hw/misc/aspeed_scu: 5d971f9e breaks Supermicro AST2400
To: Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Erik Smit <erik.lucas.smit@gmail.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zaXsDP85Kmmz

On Wed, 1 Jul 2020 at 01:23, Ryan Chen <ryan_chen@aspeedtech.com> wrote:

> On Tue, 30 Jun 2020 at 15:32, Erik Smit <erik.lucas.smit@gmail.com> wrote=
:
> >
> > Hi Philippe,
> >
> > On Tue, 30 Jun 2020 at 17:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> > >
> > > Hi Erik,
> > >
> > > On 6/30/20 5:11 PM, Erik Smit wrote:
> > > > Hello,
> > > >
> > > > 5d971f9e memory: Revert "memory: accept mismatching sizes in
> > > > memory_region_access_valid" breaks Supermicro AST2400 u-boot.
> > > > Supermicro AST2500 u-boot is fine.
> > > >
> > > > The u-boot tries to make a 2-byte read from address 0x84, but
> > > > aspeed_ast2400_scu_ops has min_access =3D 4. When I change
> > > > min_access to
> > > > 2 or revert above commit, u-boot boots again.
> > > >
> > > > Is changing min_access to 2 the right way to fix this?
>
> Ryan, do all addresses on the AST2400's APB respond to single byte access=
es?

>         Most register is not support byte access, it need to refer the da=
tasheet descript each area. [chapter : ARM Address Space Mapping]

Thanks Ryan.

Summarising that table:

 - most addresses are 4 byte write accesses.
 - all addresses support 1/2/4 byte reads.

The regions that accept 1/2/4 byte access are the SDRAM, SRAM,
ethernet MACs, video engine, the flash controller regions (2000_0000
-> 2FFF_FFFF and 3000_0000 -> 3FFF_FFFF), and the AHB to LPC bridges
(6000_0000 -> 6FFF_FFFF and 7000_0000 -> 7FFF_FFFF).

We don't model the AHB to LPC bridges in qemu, nor the legacy flash
controller region at 1000_0000 -> 15FF_FFFF.

> > >
> > > If you have access to the datasheet and can verify, then yes.
> > > Else I suppose C=C3=A9dric, Andrew or Joel can check for you.
> >
> > I do not have a datasheet. Aspeed seems quite picky about sharing this
> > and I'm just a random researcher.
>
> Erik, can you point us to the image you're using?
>
> What is the command line are you testing with?
>
> Happy to fix the model to support random firmwares, as long as the fix is=
 correct for other (open source) firmwares.
>
> >
> > Best regards,
> >
> > Erik Smit
