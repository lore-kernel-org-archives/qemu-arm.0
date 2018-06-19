Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5085293wrq;
        Tue, 19 Jun 2018 05:41:36 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLppviGz33W6q4a7dRRsSe1GtjVMM4joJIkN7Y1Dw7T65MBsoMMOhUPXnOK4XMLMCYI4BRY
X-Received: by 2002:a37:997:: with SMTP id 145-v6mr14200419qkj.366.1529412096202;
        Tue, 19 Jun 2018 05:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529412096; cv=none;
        d=google.com; s=arc-20160816;
        b=Jra3nWp8jgYGOl7pdOmN0OEQs/2+lypH41T5E3I7CgBMehPp1ATssKh/VOLA6B2Fso
         a/OmeW+Da56LP4dzL9seeunO97uKA1/8lE5Q1wO3MANdqV9Di1afx/X9ihf0CmV/t2Zh
         7z9ztMA4E/7hvrchKHX7+BubB/dS2AFBia/7C4OIGKhNUv4FP/oTNz+u/Jww4TT7Ns6t
         JmcRn3LgLXP79RX/JVjVC1ezAL0YCkmH48CPhYpWCeW6p55jXwbSP97YDD3J9Ck9Huxv
         u0W4m2ApbuBE6nZq+JHc5rCSCBdp2SKizQL21gvUDpvtHOfP6mD2UuaKWw/54b75BkWJ
         l+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=yEKh782CLCsiJPBQ/kNuO9q2wsmO3WRdAfBBLdLVfNE=;
        b=d/m9y32zG1ndbu0D2WHMwlUiR2onvN4XV/r7buiF4F2tyG5J3yWzhcyXbMS7tN63CX
         J16Ww7TfoNgvGTwnQpjrelchn2r6HNdey1ji0xEwV7JEnIMx/CzbNgpO/a/cBqXB3sja
         yB3OyaCBPUgJY76V6WXA8cX/FhMrPGDdCpY6yITJfwPW6iQ4F/Gfy4mZ4pjGVk0geSko
         yMSui5fY0tLTVGV5CWx33twDmnMp55o5V8pDlhKGj1Zr7O6NbWezjEtkb1EFVKb7fAM9
         /SLtAJBIk59IVpSwZ5WCN30yb4w8MU3o8B61TymdbKKszD4wnwdU1IQ9fSZNcNQwIiui
         zhKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bOJsG4qb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c67-v6si9718205qke.223.2018.06.19.05.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jun 2018 05:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bOJsG4qb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVFx1-00084I-PL
	for alex.bennee@linaro.org; Tue, 19 Jun 2018 08:41:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVFwv-000842-Jb
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 08:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVFwu-0000jO-6a
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 08:41:29 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:33210)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVFwt-0000jC-Q0
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 08:41:28 -0400
Received: by mail-ot0-x242.google.com with SMTP id h6-v6so22390673otj.0
	for <qemu-arm@nongnu.org>; Tue, 19 Jun 2018 05:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yEKh782CLCsiJPBQ/kNuO9q2wsmO3WRdAfBBLdLVfNE=;
	b=bOJsG4qb3bY16IMa6/r9h3KIMtKFfx0dtBrBMTmxRz5ZdDANQ1vdQsE6s7Kw++6Lh9
	DJTrjW7W7Fd/qHTN7eB2Yrji8iejuQo9mFsGLA7mW95TCe2V+SJ60iB7Tey6dbb/FCVb
	YXanTwGnOTwneRroGnQcxPUxvfqz3teaLQbXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yEKh782CLCsiJPBQ/kNuO9q2wsmO3WRdAfBBLdLVfNE=;
	b=Q66NzqNZDUHsZfXf9bD/SvZinR5omU6FURPvWq8Al16X2pbUCYDdSVow21qMl74VhA
	fduIlUdK+A/X8zGhGwITPZ1QvwkCq9J+upbRxM2g/y+G5g9f99UJguI31JSRLzx8Xbil
	qaDdF43MrE7JrS+gJy2g9hCK9Ixn+WRA+ESS79Z/au9lU202ceqTdtf914jR+JNdwve4
	Ab8SevUz28RLF0g08+hQBvhRzGN5/rSnVdEDUf+hKCqYfZX0WvSdrijdIV4JLT9KzDUi
	T40uEpclFIRlM7yC0dizOGE1hR5u6D4Kphmt7jefsIjLJyzY3pL9bBEHg8W70MjWSBfK
	RA6Q==
X-Gm-Message-State: APt69E0/5sSKQ5+YFeaHjt6CgTh5dXA+97vPZABluAm77koSkGEvOrTi
	3zQtAyJbwvXVR+btFh3/ucQwGG9zqG0Nt42IVdiR5g==
X-Received: by 2002:a9d:2371:: with SMTP id
	k46-v6mr10950238otd.210.1529412086975; 
	Tue, 19 Jun 2018 05:41:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 05:41:06
	-0700 (PDT)
In-Reply-To: <c7910c30-6b71-a376-e945-e30a6f954c0e@roeck-us.net>
References: <20180614215422.GA29690@roeck-us.net>
	<CAFEAcA-t9G=HAPH2325rduAKFNUEXNE-Jp_m9fMhfdTCbtm28g@mail.gmail.com>
	<4ff384cf-14ad-ef33-5532-4f8dbb8d0ff6@roeck-us.net>
	<CAFEAcA9+nW7nZb0ZaN__xBGGV9WFcBJ0_q=EYTA_DM6=bVfhNg@mail.gmail.com>
	<20180615181331.GA29302@roeck-us.net>
	<CAFEAcA_ua-FMw_SCYExPNPyFoY_jvokns7R=weoODbfVuP82+g@mail.gmail.com>
	<5ebbb70a-79dd-b3b0-6d87-10a1942af1f4@roeck-us.net>
	<CAFEAcA-Jiu-93wqtWuCQqJsQ47g=Zeb4J7y+eAZBsv1ct_QxYw@mail.gmail.com>
	<c7910c30-6b71-a376-e945-e30a6f954c0e@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jun 2018 13:41:06 +0100
Message-ID: <CAFEAcA_8c6awzGcik2Hzs8zrHpkqGG=tCt_ykjVnSSa1fkkpzQ@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
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
X-TUID: ZA61SkcrvAdW

On 16 June 2018 at 19:53, Guenter Roeck <linux@roeck-us.net> wrote:
> On 06/16/2018 11:08 AM, Peter Maydell wrote:
>> My general view is that where QEMU takes the path of "do what
>> the hardware does", that is straightforward and doesn't lead
>> us into future annoying deadends or misdesigns. Where QEMU
>> does things that are not what the hardware does, that is where
>> it's easy to go wrong. Real MPS2 hardware doesn't magically
>> load Linux kernels and DTBs (it boots whatever the firmware
>> image is).
>
> ... while mine is that I have no trouble running Linux test images
> in qemu when it supports options such as -dtb and -initrd, while it
> is a pain to run and maintain if I have to have a secondary loader
> that isn't part of qemu. Guess we just have different perspectives.

Well, somebody has to write and maintain the code that deals
with the mismatch between how hardware starts up and how
the kernel wants to be started. The question seems to me
to be whether that should be in QEMU, in the kernel or a
standalone bit of code... I don't think the overall effort
required changes much. (Personally I'd put the code in the
kernel, since it's about a dozen lines of asm and a linker
script or two.)

You need a boot-wrapper bit of code to run the kernel on the
real hardware too. I haven't actually tested it but
I think it ought to work in QEMU too (and if it doesn't
that's a bug I'd like to fix):
 https://github.com/ARM-software/bootwrapper/tree/cortex-m-linux

thanks
-- PMM
