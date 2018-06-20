Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp506266wrq;
        Wed, 20 Jun 2018 01:52:30 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKV2eUl5874XRxqy6D1c+4Sfu58qjnR03lo6N/U0dCyNckwfOYpZ9NFiYi5eRANyCFT635w
X-Received: by 2002:a37:5687:: with SMTP id k129-v6mr17317852qkb.163.1529484750701;
        Wed, 20 Jun 2018 01:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529484750; cv=none;
        d=google.com; s=arc-20160816;
        b=JTzaa25Lvi2PAA1ZmDbzp/4qN2S2NADXh+4inO27p0Rb3c5hpFtjFRgJxao9moWUNv
         inNaAjcxfA8ADKm7dMPxW/HNQ09zs5a/uEJaTc3QFpbEU2MOVlRscJ3dGfOJCKiDZHoD
         NnEdwRpbkDSZLEis192IgysdFp3GIGrs9H5cYYmojbGi3e68u75OCKxyJ5ZKmZ88XKbM
         CIVST7rxWwpwXFdsfh3x76f1FzTLFFdAZLFqGtrviIzHfXOUTCizcD318ujX9AsZXCe9
         MSSeew/nOloOC5T+u2PDBLnCO7gUK0wHcihiX2TlZShe8kPaCWUlBUZsJjVUAQdQm9KE
         qRBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xjBiN0kRwAhiBuhexs6BkHZEVBbpmETHeWfQVJWT91M=;
        b=OBeV/ieOJ5g5v8f49EUuqCbUtJ7pQjKtJli/x8KOiaUA1Xl9NDTyx9YWRT+ctvpVcH
         2HVNtIJZYQJkjFf5roi1Zlg+Ok8H19vbBfd1gtqFMLRIgnRIgvbzRhwko5ZX2T+Zok3D
         kcuUoM1HCEZNE4HVg6XRFF5ZRJ7/wU/e4H0co6NC+TBFSy2sFYzKMl0KZFs0Febsc5dk
         eR0YfygneP5jmTNnPpjOuQx4pzuXxuoL5n0esorWXhBsTQoIK/nmUazoLXPlHI8QTjAM
         iCgkDqI52QXY+xCZW6Gnn84cULI9V4JhNH+U/U5Pd1t5ZpkFuBsyRVqejq95GCBvFlMZ
         l5Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O64VIC7s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k58-v6si1897735qtf.137.2018.06.20.01.52.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 01:52:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O64VIC7s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46773 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVYqs-0007I6-2c
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 04:52:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVYqk-0007HY-HF
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 04:52:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVYqj-0001zx-Mq
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 04:52:22 -0400
Received: from mail-ot0-x230.google.com ([2607:f8b0:4003:c0f::230]:45119)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVYqj-0001zd-H9
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 04:52:21 -0400
Received: by mail-ot0-x230.google.com with SMTP id a5-v6so2831690otf.12
	for <qemu-arm@nongnu.org>; Wed, 20 Jun 2018 01:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xjBiN0kRwAhiBuhexs6BkHZEVBbpmETHeWfQVJWT91M=;
	b=O64VIC7s+uBSv762E9h0rcm5wCuLjA8qtmIhpCdM1WquOw4FA4yg3ckeIRlGzTx4M+
	uHztkYZXGPA8S+PCCpSCKonYPUvzCwMr3ymhXF2eSSXeyGai9JeZaHaXS0Cez290vtlZ
	21oml7KLotAs2zOOQZNfew45voOlQHHwDMiGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xjBiN0kRwAhiBuhexs6BkHZEVBbpmETHeWfQVJWT91M=;
	b=Hstlm3zMeAQJJrEiTbA5rBnvrLRQZ4R7Z1XpmOgKF/qQEduNO49WnXi50dAL4FWPY+
	SKawmy/lkMmfSzRhOizuesc/9DU28iuiC+m7GTS841UiczuHa9boLv5JkhVRwe/IQsmR
	1VIKr/xMSkJZiFd+rLvzcNavtIXOqgZ537pVV8JR6bumtk6bQLCwT7DAz49YdK9e+63D
	7i6Wmh3hZvdJRxyRoM7fpDxL6MT6XWmp7TP/3RLSS2wbAUZX4n/LYADvehEo8vERXFzE
	q5bn3ATzD6wr4jcqIjt7K+2F4WihUjmXyGGNl4LDLty5kKKryP+ie2ma6zZWFBWkrkvf
	M9Rw==
X-Gm-Message-State: APt69E3w2tHOf8TLRnuhzXKyCby2aYk2KiEcj5Ff5duomenzEOlWkfGp
	KCW/d+6VM3qsTqyAtE4LWpgxsxCd/2R4VpBoQ2lgIg==
X-Received: by 2002:a9d:2909:: with SMTP id
	d9-v6mr11692073otb.258.1529484740671; 
	Wed, 20 Jun 2018 01:52:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 01:52:00
	-0700 (PDT)
In-Reply-To: <20180619174345.GC16846@roeck-us.net>
References: <20180614215422.GA29690@roeck-us.net>
	<CAFEAcA-t9G=HAPH2325rduAKFNUEXNE-Jp_m9fMhfdTCbtm28g@mail.gmail.com>
	<4ff384cf-14ad-ef33-5532-4f8dbb8d0ff6@roeck-us.net>
	<CAFEAcA9+nW7nZb0ZaN__xBGGV9WFcBJ0_q=EYTA_DM6=bVfhNg@mail.gmail.com>
	<20180615181331.GA29302@roeck-us.net>
	<CAFEAcA_ua-FMw_SCYExPNPyFoY_jvokns7R=weoODbfVuP82+g@mail.gmail.com>
	<5ebbb70a-79dd-b3b0-6d87-10a1942af1f4@roeck-us.net>
	<CAFEAcA-Jiu-93wqtWuCQqJsQ47g=Zeb4J7y+eAZBsv1ct_QxYw@mail.gmail.com>
	<c7910c30-6b71-a376-e945-e30a6f954c0e@roeck-us.net>
	<CAFEAcA_8c6awzGcik2Hzs8zrHpkqGG=tCt_ykjVnSSa1fkkpzQ@mail.gmail.com>
	<20180619174345.GC16846@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 09:52:00 +0100
Message-ID: <CAFEAcA-6BHUScxvBNZ6zCF0e9YxDuN-7Y6HveoCUuT3+r=tA0Q@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::230
Subject: Re: [Qemu-arm] Booting Cortex-M3 Linux kernels in qemu
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
X-TUID: vs5mz31coioe

On 19 June 2018 at 18:43, Guenter Roeck <linux@roeck-us.net> wrote:
> Thanks a lot for the link; that gave me enough information to find
> a solution that is not too invasive and works for me.
>
> I need to be able to run a single kernel image against multiple
> devicetree files and root file systems. This doesn't work with
> above solution since it bundles everything together (or, rather,
> it would break my workflow). However, it was easy enough to tweak the
> boot wrapper and load it using "-bios". I added support for "-bios",
> "-initrd", and "-dtb" to mps2_common_init(). That change is simple
> enough to carry in my private qemu branch.

Glad you found something that works for you.

It is also possible to write a bootwrapper that loads a
kernel/initrd via the semihosting ABI (assuming you trust
your guest, since semihosting lets it read/write arbitrary
host files).
https://git.linaro.org/arm/models/boot-wrapper.git/
is an example of doing that for A-profile.

thanks
-- PMM
