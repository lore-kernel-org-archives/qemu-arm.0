Received: by 10.28.71.27 with SMTP id u27csp842008wma;
        Wed, 21 Feb 2018 07:10:10 -0800 (PST)
X-Google-Smtp-Source: AH8x227Hny0SQHD8wOsTB7kRK/UWIvXncL5rlxj4dL0Di4sgyPxM9q+wwO7gcxz9BgZFaZ35CfiV
X-Received: by 2002:a25:6112:: with SMTP id v18-v6mr2508492ybb.15.1519225810091;
        Wed, 21 Feb 2018 07:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519225810; cv=none;
        d=google.com; s=arc-20160816;
        b=csyQ6617zf8CE0WsCqH51kHJZZlkwphduX2XUtC+Aeoi2AnLs4QcWp3ii7mOtMUUld
         vBNKLXAG7yYvD3YbjuhcEiBddRZMabtVjpzyil/Wx3jfBdXbO8GwM77ifuEouIsBsUA2
         fF2mCFSIXD5y65qC0EXGp5K2gi/OmLxrBcKB/EbZgu/WKLAyd99OjSpb2Tmc/QJZJnbh
         05X5xbqvpTVe9gbUT+vUOEd2lxHouhh002HvhizRubmI6yrTnRV53m3whJhh4j+MujUR
         nDrf3/aVyhLsK+5W76s+ryctSSW7PSAwefnyyvbHp3tfM0Qa990ChFXzauGXq9JJ8WI8
         JQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ll10/j4mbE7F/4S6nfWt4mp7aX5Ql052SlQyv7mHQRA=;
        b=OapKyhrchNkFNubx8Nb1EmQ1oyEdB6ej1xsOmtBvJcAb/WXOnnVzwjSMaFJzuQEl7W
         TIkERcPrSOyPWzCsk7q8xCLEtW8kaZ4k+AFHt/nKM//WXfYQTQLR6ex/+7D6uxwhBtG2
         P/uGSazYq9YyBA1OTrVrLGL8JN3xB5u2eYyhGb16p+TP2ozlamuuUkJL8yxJzFPouAPO
         8VlcJuMFiO9SeIbyyVfBnCbDMjMiXJbkeqqHQOZNsI9pw2qhLwLsvHiNxBV+PokwIVmR
         LWLyZUw9a9zB080pvSSs9MMP1cJpEKPr8q9Q+S+9jS1Lwt0TYzVkVB+UBFFT9A6wexqY
         t+jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cQ2MGsDT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v67si2083155ywc.471.2018.02.21.07.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Feb 2018 07:10:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cQ2MGsDT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoW25-0007bJ-Iu
	for alex.bennee@linaro.org; Wed, 21 Feb 2018 10:10:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eoW1z-0007av-Se
	for qemu-arm@nongnu.org; Wed, 21 Feb 2018 10:10:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eoW1y-0003fM-W5
	for qemu-arm@nongnu.org; Wed, 21 Feb 2018 10:10:03 -0500
Received: from mail-ot0-x22a.google.com ([2607:f8b0:4003:c0f::22a]:44064)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eoW1y-0003eq-RR
	for qemu-arm@nongnu.org; Wed, 21 Feb 2018 10:10:02 -0500
Received: by mail-ot0-x22a.google.com with SMTP id 79so1664866oth.11
	for <qemu-arm@nongnu.org>; Wed, 21 Feb 2018 07:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ll10/j4mbE7F/4S6nfWt4mp7aX5Ql052SlQyv7mHQRA=;
	b=cQ2MGsDTc4V8yuJGzKZHbqPYjhQoVtRra4GNiBBW/lwgrbWR4conEhFEfSPtQpjp6r
	r5i82or9qgvGAzejngw3Mh2vx2UNHiQBMtFn91Av7kl5YwTQKwLJbPDNPklXFrwVHeR9
	6W8AK30NCPwGilC2bogZCL8PKja8GX3YF4hvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ll10/j4mbE7F/4S6nfWt4mp7aX5Ql052SlQyv7mHQRA=;
	b=IzVR7af34MCPRO+rxiVSTjBI0e87IhoAAjeLekrrbJcJhFy3BfxnurlOeaXYxFa23F
	rAfBfRWEpThGYAiwbCrSa4v1Zwbc4CNlfZrH7au19dhxBF0kT4qSWU5mN0eAgG2N2Qg4
	ekWEg/kqkV8MxBWempY6ZsVE+VwcxMrBLPx8nsn4f3IwuGfLCBGz2Z+/fTBM8p4Vm/yl
	JCHdCHH/sUcVi4MGplc5oKq/o5OBs5X821upPyC0p6Nl92XUG5gkRHnS7fLTPc1UWLKm
	ajroDCF0hFvRhJv2izRzn3DicWuluBMD3F+vBKSgxFhFbwrtFLcFTMBNkJSHRevT8r24
	pjUQ==
X-Gm-Message-State: APf1xPBWaFent1viHtlXarVxKSTU4BOMNU4an4w6HHsP47Sctye4wKAP
	EjCGzSVkDaHpa9iEGBfRCBNgT4yysjMroPNkvDMiWQ==
X-Received: by 10.157.27.17 with SMTP id l17mr2672321otl.294.1519225801961;
	Wed, 21 Feb 2018 07:10:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Wed, 21 Feb 2018 07:09:41 -0800 (PST)
In-Reply-To: <CAFmp02xLicV+dSFhJjYX8djQMGvVaYtih6hB9HAd4HqnA2=VfQ@mail.gmail.com>
References: <CAFmp02z8NnRq6eSCDa2GYJDXE2-cK6+yS1SKHAbiBDhKV_F2yg@mail.gmail.com>
	<CAFEAcA8fnqL9tKa4tVPDoWTKYsOVKhxZ04c39fvgKNgQ-F+ESg@mail.gmail.com>
	<CAFmp02xLicV+dSFhJjYX8djQMGvVaYtih6hB9HAd4HqnA2=VfQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Feb 2018 15:09:41 +0000
Message-ID: <CAFEAcA9q=u-wF96WW3oJ=1PDuA7bAn_k-YiGRf2gn8Appj8mBw@mail.gmail.com>
To: Rd Cheung <rdzhang@vt.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22a
Subject: Re: [Qemu-arm] ARM cortex-m3 instruction fetch misbehaves during
 do_v7m_exception_exit
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xyJ0/7vtgfvi

On 21 February 2018 at 14:25, Rd Cheung <rdzhang@vt.edu> wrote:
> Yes, this looks like misusing ARM mode instead of Thumb mode to me.
> I just checked the local variable xpsr in function do_v7m_exception_exit()
> by adding a qemu_log_mask line at the end of the function. I turn on log by
> -d in_asm,guest_errors. And the xpsr = 0x1000000, which has its bit 24 set
> to 1.
> And bit 24 is the indicator of Thumb state according to ARM info center. So
> it
> should be correct, or am I getting something wrong?

Odd. In that case what should happen is that the call to
xpsr_write() should cause env->thumb to be set, which is
the QEMU internal state that tracks whether we are in Arm
or Thumb mode.

I would recommend adding also int,exec,cpu,unimp to your tracing
options. That will allow you to confirm exactly what the CPU
state on return from the exception is, because it will print
a register state dump to the log. (the 'cpu' and 'exec' logs
do slow down the emulation a lot, but hopefully this bug
happens early in execution.)

thanks
-- PMM
