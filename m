Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2270154lfc;
        Fri, 13 Mar 2020 08:19:48 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vukD2v/vEtzoFw3DXGL7U9V3DF9rqb+Z9LhNKTehaJeE4ILmtvxaY6nwxN03orpU6KeG8CB
X-Received: by 2002:ae9:e306:: with SMTP id v6mr13840550qkf.2.1584112788796;
        Fri, 13 Mar 2020 08:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584112788; cv=none;
        d=google.com; s=arc-20160816;
        b=VpVlEZ/zB/6FXGAIvN9OFytc+R2d6TEe13na1wMryDehQr09FEx1wTxP2zSnTz8oSt
         mp3weJh53WBN9xRRLNrWVyp2HI5MA/+fq+8XLzzuzz++Eu3Gua61z52PSt0K3nUSDm+S
         gnBV2CfunOOXD5jQQjpEhXjgnLzWyJGW5I3ouLrLjOCsj7c/mHLPF3Fj83F1yBXZDZS1
         qE9JvpGIZYEISvLdHnBBePHuWNaeK6HEuyKpvqjdSJa9fikLdysNvyM38IpltWHq+QhR
         /Wt1/wUd8YU3bFnWkUtNMNTk7DMHOx8GBOGZAaLsdxOIQvK1pzbweo1V72t9kj+QEdXL
         EkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1NBaMBE5E/M3P6A7fKEAnS9p8dyD+5TDDACVFx4oZl8=;
        b=0lhu8ArTtFloG1JYDB0Jd/4zGM5c8BtNGn5RM7nEzjjKOTh+saLhnnyvaxgYlcSFLb
         pfMMyKVFpURMc4B5dhsvGZkpaOlLnbysgAqrS7w/jkwnPKT4MsrZEgZb1xKIM2da6D7u
         8g0LGK3ZnheR0hNI209k4UhQroTus9Dra+Jf1H3jTbVxpiKryoEUJ7vN/6BBxruyWW4V
         gqt9Y5InBeVkFUmNq7IlmSOCGhgYrAyT+0cXPXesVikTM/Z9lL+yOnyBe6fV1ATaT4mE
         iT0/WQn8+jl1VikiEikVSPCCogU9pq3ClFiVui/u5/J1R2B70RbyWMJkewpjwpvwJzrq
         qsjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kI3mZ0WI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a58si5438732qtc.4.2020.03.13.08.19.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 08:19:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kI3mZ0WI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCm6G-0006Aj-7w
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 11:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47409)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCm67-00069I-Bo
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 11:19:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCm66-0002On-5Y
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 11:19:39 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41174)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCm65-0002Mx-Ve
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 11:19:38 -0400
Received: by mail-ot1-x343.google.com with SMTP id s15so10446023otq.8
 for <qemu-arm@nongnu.org>; Fri, 13 Mar 2020 08:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1NBaMBE5E/M3P6A7fKEAnS9p8dyD+5TDDACVFx4oZl8=;
 b=kI3mZ0WI9RwDQUGg8MvbCRGr7Whb03ziCKpitsb9cVzQwvV0OTOKDAQsoI0dAOIjlQ
 fe4L01Y5FiOrP54x38FmNuLt9c6q7YPGU4LnsWcHoYNWzmsk7ZOjjM3SSG1TtE3luqfR
 2EqcyeAtcBn/1oR33J2L8UtY0ttp/ytt9vV4jGAFQ/YbJKjbspg4hgXGCyaetrhZIo9j
 wCc6X0R+E9g0FGJCKpK3FbhOAEuOMtcluvxI7tb5UM0OvRDQLi517bIbWJJyOrtdFfH2
 uuObdlVoractHF2HfHsTdYv8UcA4vyX2iLYHSIfCNlm3jdo0dbp6gPhaxwV/iccaeLxd
 wd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1NBaMBE5E/M3P6A7fKEAnS9p8dyD+5TDDACVFx4oZl8=;
 b=Mnvgl/cnVBgHXNrD8VE1KffxOX8jhe+zQ+IG4bUTpotVRjX+vqn3zInbH8z5sVl6U1
 h5wCatghB6f/U9zhyChVFuDhpkJ4NUglkW7dTBkJWwy73WRb+U1xzfgU2Uzz4oC4CWi6
 GX+Bl+BNBS+bH4vk2ZGEZm2jPn/fRPA7g6G+hXXlh8cMULF2qv92IE8vetFyfYvQLT29
 gER07dWwN1IsPfo5Vb+gtNu6PyyvpZnDmt61vtTJECQNWwQK0Ue+ZSUfe8Lj+mmWHAJ9
 Xf20As3O+/b+4msA2WvZUBQKuIB8AZ+WUiHPY4VOpVVzEedLbuNPwd7bYhh/8IfIrA5/
 2rKw==
X-Gm-Message-State: ANhLgQ3moSOegZIqWC4DcWSgLuK7bUo87jwfGzkR/lXE82fUdJmNstzf
 Y5JrklLWl2jZ/yj+psdEtI+rMx3NliHBNIU+ZfJyMA==
X-Received: by 2002:a05:6830:19e2:: with SMTP id
 t2mr10890370ott.97.1584112776806; 
 Fri, 13 Mar 2020 08:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <2159383.tmy0LfLZHX@basile.remlab.net>
 <CAFEAcA_nGY4_UQ7jMdxuZXR=_rpVZVCAMX+UzEoFtSpcCVy9Dg@mail.gmail.com>
 <3125680.9OkiO6kEAj@basile.remlab.net>
In-Reply-To: <3125680.9OkiO6kEAj@basile.remlab.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Mar 2020 15:19:25 +0000
Message-ID: <CAFEAcA9L9qWdb9Qk4N00cEOOxAc056VVgMZW6jn-+1hDh3PhsQ@mail.gmail.com>
Subject: Re: [RFC] [PATCH 0/5] ARMv8.5-MemTag disassembly
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 34cGxHfD4wrT

On Fri, 13 Mar 2020 at 15:17, R=C3=A9mi Denis-Courmont <remi@remlab.net> wr=
ote:
> It does not. I don't know about that seriers. The patches are part of the
> patchset that lead to my PAuth fixes a year ago. At that time, only beta =
spec
> was available, including obvious bugs (sysregs with duplicate opcodes),
> suspicious things (TCO being EL3) and generally being a beta. I thus sat =
on
> that part of the work until I now got time to rebase, clean and update to=
 the
> released spec.

Ah, I see.

> Meanwhile if there's a high-profile developer working on the same thing, =
I
> guess there's no point for me to carry on.

It does sound like Richard's implementation is further advanced.
If you're interested in testing or even reviewing Richard's
patchset that would definitely be appreciated.

thanks
-- PMM
