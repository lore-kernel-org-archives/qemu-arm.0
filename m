Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp405081wrt;
        Tue, 25 Sep 2018 01:45:12 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60AWChkgd69rEIc5dkEBLXmZSQXELVqvP3mPKnRjtWZccpLWTFY5dITuID3ubc2QOuy3hYL
X-Received: by 2002:a37:1519:: with SMTP id f25-v6mr4420qkh.268.1537865112468;
        Tue, 25 Sep 2018 01:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537865112; cv=none;
        d=google.com; s=arc-20160816;
        b=EgTMFGOV4HsdqbamHoRwWV//8u7HXBe4Wsh0f+IgvlCsNHYzKojS9jJAqhOyaLL60D
         JcTUg7UHCBBIcevzJrzeOiGxiLJHdMAeYRilY00b1z7ZyhO1uJZtYDPyo576nsgcwc9o
         RnygQekTxXG+sX+fH2b5CAlMFtT33ieUr8XVNL7FAMPCkrWS8b/fTncB8yavDRBKZJRB
         eDlnY3ENCqFEP1RiE/5Et5hqMcl82QDpx/JvEFSrEblh/G2XwSukHnGOIWTMRtJN77T2
         yAvKZyK5wFX8FFVClwFIbnUfc/AEOCfiBOUdxc12N+DiTJYZk0LIle75Y0aojJ/BA3DB
         N07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=gJzLHDHKTjxsVppZHADb4EWONw+XI55yf2V2cGA+dd8=;
        b=LsTEKAO9yHxz15S2PpsyqgyrtD+EQbKDUpT6rqx3WL0gqa6N32TyvwBg4g41RbSl/Z
         q6m7QfI4MimE8XkXigg276wHKloAroMGXRVdR/NuY/0t86uLsqhxPAO9dIjFmxZyY261
         hDJAMCCDwk0oCxrufpOoznJx9EBKkS9KBGGF40c+VTLcm+78D4I3LDjy4HO4F/yUQjRr
         Hg87nVzK/5C1P88LHCIGL607rFJAKzjvHta1uD0aS8KS3JhjlxsIQwVsbdeH/eNVsmwf
         puzvNIVi0GNaYPgSqx+eKawIOBi4ASQVlM7n91gXq5FCJsWdJT7r3RN3ixjX0PyFTxwE
         bxmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HHudDvTY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b1-v6si497993qkg.187.2018.09.25.01.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 01:45:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HHudDvTY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4iy0-0007Lh-2Y
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 04:45:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4ixb-0007KL-Nh
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 04:44:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4ixa-0003ZJ-PK
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 04:44:47 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46084)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4ixa-0003Y5-Cj
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 04:44:46 -0400
Received: by mail-oi1-x242.google.com with SMTP id k64-v6so809491oia.13
	for <qemu-devel@nongnu.org>; Tue, 25 Sep 2018 01:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gJzLHDHKTjxsVppZHADb4EWONw+XI55yf2V2cGA+dd8=;
	b=HHudDvTYoc3MMKL0wT6HtEVFSwQ5RHeKTkMI143eNZkyjiBTEfc1PsheCm2OYP61tG
	OXORF3QzJv6d1w3DjbiFOUKdAd1Ltz5IA2hAiWf5V8x+Bp5SibkPQaxK70Cdjkcidu+P
	EL0RnYSQOVmCbkp5RKrhNRRiLqmjX5IP6eTWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gJzLHDHKTjxsVppZHADb4EWONw+XI55yf2V2cGA+dd8=;
	b=GkxS0A3pDuLjQ1gZySmwTvXRz5XYBJ/5a5j7lrs4KDyTzlcZZesDKEJ6XmoV2WA4yZ
	Pu+8yMr4hABtUQBfiswpma/m8yaFh5pyaAUarsuaEh6fTnNobTuavqHQ7nEXOmFhGlul
	of7BD49WYIPTK6ELnyl1Ypt2VgQ3vhr4h9BBjDQDBlFQGOhZz/WbwZeI+TIBXn/xe2Ae
	7BOHp6JfZ8YbGssTRTCRWzO6M7QMOVpQ8U2ZgjNUa3645oiklZY3aCmp+37LZ/rPxhrb
	COoKAAOSZFQh6Kd4JOsxVXKgg2UWzWTdCchV+hmPbUDz/AdNlFhupwczuyMjyp5m2DY3
	hDZw==
X-Gm-Message-State: ABuFfoicIiXbQ/fP0cC3HMz8sheV8qE5saUAankx6cXdpzQQsP6Sa2DT
	hCkagj5i1d56atI5hwPLeGGsXIWSVf14vxATqDDKSw==
X-Received: by 2002:aca:1008:: with SMTP id 8-v6mr672790oiq.303.1537865084602; 
	Tue, 25 Sep 2018 01:44:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 01:44:24
	-0700 (PDT)
In-Reply-To: <9310418.Wg32kryeWE@amdc3058>
References: <CGME20180831102306eucas1p1ffbf82383f23675fecb5faf8a2fa54d7@eucas1p1.samsung.com>
	<9310418.Wg32kryeWE@amdc3058>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 09:44:24 +0100
Message-ID: <CAFEAcA--0aJG-BjjyqXZH18Qxbm6bQxVMrfrp4MLhr_VBKdcpQ@mail.gmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH] hw/arm/exynos4210: fix Exynos4210 UART
 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Thomas Huth <thuth@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 41cSRIIVD80q

On 31 August 2018 at 11:23, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> commit 97274d0c05d4 ("hw/char/exynos4210_uart.c: Remove unneeded
> handling of NULL chardev") broke Exynos4210 support as it removed
> NULL 'Chardev *chr' handling from exynos4210_uart_create() and
> currently exynos4210_init() always passes NULL as 'Chardev *chr'
> argument to exynos4210_uart_create() calls. Fix it by adding
> missing serial_hd() calls to exynos4210_init().
>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>



Applied to target-arm.next, thanks.

-- PMM
