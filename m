Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp10107261lff;
        Fri, 17 Jan 2020 09:41:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqyQtYvr09BdZxOic0jnG2EeFuvews5Oe+wS4NCVR1Sj64nzHh1U5MB3yzmOnG+B9fyfK2yA
X-Received: by 2002:a37:801:: with SMTP id 1mr40734716qki.326.1579282887522;
        Fri, 17 Jan 2020 09:41:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579282887; cv=none;
        d=google.com; s=arc-20160816;
        b=jDO2gtgzQ2Ev+YaIGG7dq9Hl7EJJ1t/NoyzpeaWMewdCoOIZHOODVhrk5dGQ+56p6g
         JLtMKTg6LUMny4wTkFmfpHnIS+Wki7pS6zIPmkG5w9FqsAkOukiyjobxRIZriUEX52m9
         LeWmfr9xZydI+QKS8I+MQ0SQmttFGi38FEVh6Ppfw5k/s0+4kvCjnm+JiqoHtPT6Xjs9
         p9xgVegZNja1WwNvIVaDbMukAuajrW8MGd1BairrVXToeudRBTdljpzRf2Q+0q/hkslQ
         rOjTroermoCVtmCMUDtcqDH1V3VPWQ+dDd7vvaTrcLXSctk7zpNFH3tEnNagmvS6OsQW
         rwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=ZbltzGJaQyeZ5szrL/Z/7BbqWF9ObYIMgsWiX8bTni0=;
        b=ckXBZDsbXmM1iZnYyyiCWCDjevCwMtytBp+KL79IEQnUVmJ+Ji+pmrzEwF4lJDAejb
         T2cZyLP3WeH6lG4wzH9BcaeFd/krkzUW3pJWA4+GhkTJ8LDOFPX6uS4JsDsfDr73TbGI
         mHhYMbuKPvKLM/Ua7hrTuCbZ92iE1sWVO1FyvtGbxizDiwo3DZBETBBi7yPFbeREbYjo
         IEwaQE/wVR/4lPSIYPiMps6UaV4dBw5/KHzbkKVLdfcOOqSaEBq4eLyl2baXEt4yOi1X
         NiUN7O+Mlv+RV637kFnfl8hM1wfjAdaS2Ntdj8pG0rFHERMVnTVS3XprHtr83HqAopv5
         k0YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EneSngpj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si14682948qtq.67.2020.01.17.09.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 09:41:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EneSngpj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isVcc-0007pb-TE
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 12:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55063)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1isVcU-0007ok-Ty
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 12:41:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1isVcU-0003BQ-13
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 12:41:18 -0500
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:39425)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1isVcT-0003Au-RB; Fri, 17 Jan 2020 12:41:17 -0500
Received: by mail-yb1-xb41.google.com with SMTP id x18so6228267ybk.6;
 Fri, 17 Jan 2020 09:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZbltzGJaQyeZ5szrL/Z/7BbqWF9ObYIMgsWiX8bTni0=;
 b=EneSngpjXgwzpEA+r9mmFqfJlO9Bb6VHgfMHEfHQpZ4sYAt9HI76FdfAILGdcREYDh
 ZoIlAkp32QPh1sTcl/bP8rNtTql6DBWiZrj19tgQ8YqKob5itxkFwP+Ot5y5s6ScOlGe
 wi7W85mKGFMR3SzknwrGMxCxyb3gxScNMcvBHdSSkAUFdKkxi9hZ1MdiZjExjSvEYhgQ
 ymWJvnY/esEKaP0GpxUAIWDX9GnBimBcWtSsk6/IsInoQ44F6EujVF3UdaXmBWKkp8v7
 0wQlHzpGR7dZkpsNBS6LslpuTE3mQYXroQv8e6BIcuX+blVlm6vau+X49IZe1ZH3Hf3d
 tCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZbltzGJaQyeZ5szrL/Z/7BbqWF9ObYIMgsWiX8bTni0=;
 b=Nh341DlpQggVCV+odr6dOV4dCGFjh9whOKz5ATm7t/V8I138lUgSf21tfeAQv78MeU
 AiZMffRfZpmcaKCTrtf8ytzlJebQjH7rOhkAjm7VocLoCPvEDQbZRDtKz4hGY5X2s+Lj
 LXp4AA2uB5PpHvdE4lCSGot8fZT9OnleAv8G+Cb6tsTKXfjdgooX+EcM1e2bKetsskmY
 7vzWZ+G6Jq39UX1wnO0UVz3x1eM1fZhFAUHi6pJMFw0EljsHOtdrg1dzRarElMOxg586
 V2q+eXC6Vww5rHbFxjTbgoOn0MsaRHp6T4L1D0OdGBuZMh58fgUzI/iIB23L9Ef/XoCz
 dssw==
X-Gm-Message-State: APjAAAU0/1cU/Mdp3AE9E4LYD2pBvnqYZCX7ZCj7ujJwQpzyqEsk3Wtz
 VAsxZdZ+5oLcC8nTOjKhdj8=
X-Received: by 2002:a25:1a55:: with SMTP id a82mr13416432yba.497.1579282877052; 
 Fri, 17 Jan 2020 09:41:17 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 71sm11389007ywd.59.2020.01.17.09.41.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Jan 2020 09:41:16 -0800 (PST)
Date: Fri, 17 Jan 2020 09:41:14 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/6] dma/pl330: Convert to support tracing
Message-ID: <20200117174114.GA32278@roeck-us.net>
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-2-linux@roeck-us.net>
 <CAFEAcA_k8xdzmsgMK+m6wSgnBN53UjCNU4nTBx=hnHnHz+Su6g@mail.gmail.com>
 <20200117164625.GA27197@roeck-us.net>
 <CAFEAcA9dvOQpPxkjG4XqYiMXbVsZ1VMCZWEWegeTu-GNW0Znaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9dvOQpPxkjG4XqYiMXbVsZ1VMCZWEWegeTu-GNW0Znaw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: owKxzbzjl+tf

On Fri, Jan 17, 2020 at 05:05:07PM +0000, Peter Maydell wrote:
> On Fri, 17 Jan 2020 at 16:46, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Fri, Jan 17, 2020 at 01:23:46PM +0000, Peter Maydell wrote:
> > > Won't this now do all the work of constructing the hexdump strings,
> > > even if tracing is disabled ?
> > >
> > That is correct. Can I check
> >         if (trace_event_get_state(TRACE_PL330_HEXDUMP) &&
> >             qemu_loglevel_mask(LOG_TRACE)) {
> > directly in pl330_hexdump(), or is there some other means to handle
> > this kind of situation ?
> 
> It's not something I've had to do before.
> docs/devel/tracing.txt says "just use the TRACE_FOO_ENABLED
> macro", but looking at what it does that doesn't seem to check
> the runtime state of the trace event, so maybe those docs are out
> of date. Stefan, what's the current best way to guard expensive
> computations used only for trace output ?
> 
trace_event_get_state_backends(TRACE_PL330_HEXDUMP), maybe ?

Thanks,
Guenter
