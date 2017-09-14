Received: by 10.223.172.38 with SMTP id v35csp851609wrc;
        Thu, 14 Sep 2017 06:13:46 -0700 (PDT)
X-Received: by 10.200.23.153 with SMTP id o25mr30648269qtj.206.1505394825972;
        Thu, 14 Sep 2017 06:13:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505394825; cv=none;
        d=google.com; s=arc-20160816;
        b=qVtJ4Q+Ed6qEfP9tNMD+dArZr+/2Ck8HhwBqZ3sgIL4UhFmcrsnvtc8UT8ESjJryLp
         T6RLNmXviNNJthUzGHxI2uqCmw6tS/W5x2LQVEzLLVqesBhfa9/NdqULhCCvYpSZrxSg
         8JOi2baro94V/qnGA08iml6Oq3xtRRbm1aB+/EJhar7O4y14YAS4XtUGNrjfq86AMHZ7
         Gle5i5mYMm136AWVyHdBHQMROPaG9Tw4phzCJW0Hu3P9JRGDFX7cYvYUdCe0iuQvfxPo
         OkGvoDXAbfHAm+OKE/yK2+KFXbHsEQM2585lds2JK54ZW5WZ0dYYFFSDvlutQYDZMVfX
         mLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=61kL2nDQfyCQMPWMOnpyLCSI/jkDrumN6w+0yjxFiSw=;
        b=qUh/mRY8d5OWub8wfO/ZVY0G8KPFLXZRs1nlbAfI46X8xpeCMahjthj1fmLIY5XLyn
         awt/5XJOkchXsSF5YL4eGUFME5N+WHtn+derR6S4x590UDE7J/MjmXG95ah0voYMGIb1
         XNtllYQ7Us4bxTtCmBHeOBxwjZXI9Pd1DPis1ordTRq+14LVNCPzBmZuhu/Bm9Y2ApdJ
         rXaaSbPrHID0kuVhbiaIcWqEHrkJkXuLwiF6ov1XzGuvDHKSVALwNt2mWpaTXZvK4bNo
         kkOCuK8yq+yuZVnBOJULIS8IvTopinN+ioPRb+XN5ivYTOyJr9EOZQbvOvegY7FWh6nq
         2nPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XPGB1cwk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m10si17972801qtf.201.2017.09.14.06.13.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 06:13:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XPGB1cwk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsTxf-0001BQ-Rw
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 09:13:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsTxY-0001B0-MX
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 09:13:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsTxX-0005QQ-E2
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 09:13:36 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:47076)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dsTxX-0005PC-6e
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 09:13:35 -0400
Received: by mail-wm0-x232.google.com with SMTP id i189so321879wmf.1
	for <qemu-arm@nongnu.org>; Thu, 14 Sep 2017 06:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=61kL2nDQfyCQMPWMOnpyLCSI/jkDrumN6w+0yjxFiSw=;
	b=XPGB1cwk5NCbmkH/0ClZIPeVJ47c3lQ087nmwq9S738SMaiiAmJq107h9dRgulv6bh
	SdRmoITFXPBymAdUrMlMRFBdWgUFef/E5pKKTcedKzVt51zO7273ULO8JuyOR30WqiTZ
	Oc+qy3CZXXYTWDa44bOqD1D59iCeSGASZmLh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=61kL2nDQfyCQMPWMOnpyLCSI/jkDrumN6w+0yjxFiSw=;
	b=hUphS5uL81rTouL40rqNr/omFuD6mMBZ/CgI+eMR0G7+/STGWDnZcP3J8UlsFdbQgr
	HSCTFKBQrdOjNbc9tLCdMDdchhW1YrpQMUZIW/vfNadjCDQFpqY9aHW4vfUfjBEgFdvI
	DAzAffqllJe2SpkgWtGm41r4Qwa28Vw3GCoJmbiiFYfErjj/rGZC/O0Rh67rAL1UAuV1
	o4SRz2QvCufmNcC8xfij1iObnSSdeYBoGaDzezzMXZfXym34WygSex5wxy9ho4AbSitt
	jtBoTP2npDl6zifKSVmt1zjU+KzMCyLJ3+VO5mhvMuNArflJLCIUzjvfreoSPAjUBZpo
	WgHQ==
X-Gm-Message-State: AHPjjUi/uRkgfuVsNYGdVvNWK57kEit89mXCXvVsQY5aPdTlIafGO1O+
	H+Cdecb+f0y3Swe1bWLFqfjXbMzMMTUVm46Ktr/kiw==
X-Google-Smtp-Source: AOwi7QDHK24MDzR50mocd6/s9qFdNNNi7mHAsyk9Kndv4G2zB0l0di8AaPJx+MxHDOwfc1CtwNPt5+ZMJJ40m5MOyLA=
X-Received: by 10.28.52.81 with SMTP id b78mr1939886wma.11.1505394814187; Thu,
	14 Sep 2017 06:13:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Thu, 14 Sep 2017 06:13:13 -0700 (PDT)
In-Reply-To: <a9891f10-9643-96ee-7f99-7a384b9ea302@amsat.org>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-3-git-send-email-sundeep.lkml@gmail.com>
	<a9891f10-9643-96ee-7f99-7a384b9ea302@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Sep 2017 14:13:13 +0100
Message-ID: <CAFEAcA8KUtG=2Cr_PndUqOxp5PN6bTJR_t=s+Ch+Y2WVfHVjQg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-arm] [Qemu devel v8 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NcqMn/0mGfss

On 14 September 2017 at 05:36, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> On 09/07/2017 04:24 PM, Subbaraya Sundeep wrote:
>> +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
>> +    unsigned size)
>> +{
>> +    MSF2SysregState *s =3D opaque;
>> +    uint32_t ret =3D 0;
>> +
>> +    offset >>=3D 2;
>> +    if (offset < ARRAY_SIZE(s->regs)) {
>
>
> This comment is controversial, I'll let Peter nod.
>
> The SYSREG behaves differently regarding which bus access it (CPU, AHB).
> You are implementing CPU access to the SYSREG, the registers have differe=
nt
> permissions when accessed by the CPU. (see the SmartFusion2 User Guide:
> Table 21-1 "Register Types" and Table 21-2 "Register Map").
>
> I'd think of this stub:
>
> switch(reg) {
> case register_supported1:
> case register_supported2:
> case register_supported3:
>            ret =3D s->regs[offset];
>            trace_msf2_sysreg_read(offset, ret);
>            break;
> case RO-U:
>            qemu_log_mask(LOG_GUEST_ERROR, "Illegal AHB access 0x%08"...
>            break;
> case W1P:
>            qemu_log_mask(LOG_GUEST_ERROR, "Illegal read access ...
>            break;
> case RW:
> case RW-P:
> case RO:
> case RO-P:
> default:
>            ret =3D s->regs[offset];
>            qemu_log_mask(LOG_UNIMP, "...
>            break;
> }

This doesn't look entirely right, since this is the read interface.
Shouldn't we be allowing pretty much all of these register types
except maybe W1P to do a read?

On the other hand, in the write function we should probably not allow
writes to registers documented as read only.

thanks
-- PMM
