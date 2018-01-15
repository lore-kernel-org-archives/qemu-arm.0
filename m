Received: by 10.28.173.206 with SMTP id w197csp2521510wme;
        Mon, 15 Jan 2018 01:44:49 -0800 (PST)
X-Google-Smtp-Source: ACJfBot/ooVXCLjnka8TF0oxArj1vvpwRSLpEXr9GBynNO9F6G6PGjnIjehrQ2YL3c3n1WgdhJ4+
X-Received: by 10.13.246.1 with SMTP id g1mr32055038ywf.476.1516009489771;
        Mon, 15 Jan 2018 01:44:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516009489; cv=none;
        d=google.com; s=arc-20160816;
        b=h0WoShp3wiE01D/iOixv1mKqRYoUFE/XO2zbpLwZEya+voJwKnYhpgDt8WI8M6I8cL
         JcpBm16vh4kahPv5aaqLuwmwhhNIzWhYsUcMjVJ1Q+NARXDI0cP3NLGrDC1ZCeAy3OKq
         az5ZUEfrziSr1cexz/TXbg6dR+Pde6NQ2c50pSP8dYwpyzLhsMiOvg7deLlw8B9a0rTj
         5elA/pkhoks93lsXSS8UJnTZ1LSzJQj0IEynd/RBRdmlYsqHFN3YExdEoB2GPGUBFJXq
         Z9gTNWLu2liVrcZMys9ZxWn4pNbvTd5c0/b0wXRmS2jNEIJsCSN4SGfhuXElxT5fJGKx
         +raQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=hmeZCVAYZCrgsGZDqpWRQWSQnYxG8XVbPNbzPdmErGo=;
        b=kxPOughfL4Pa5tUG2fhG9FqznP0mhom81FqfkmpFxmrHH+9IuA/Ivf0yf/ZrujE17A
         dTjvtn1348c6lm+KU3NKfM1XD5y97W2V3kRmz+eCtescGQji75kYJEelALB6/4TKwLrV
         YzSc3Pd1mfmmBVNvNsm1SxJXX6Nh/nGbX8uLLSvLisrDkdEUX5ibiJm1rLrnfRhBK8HQ
         YD5KQHoJkhpnTOx5vZZpuBL8yTwjGpaEc5CXn09X4dj3WQrAOyP5IVv5HzD0xEOVI+ST
         t7JkHfWAbTrc8ENbg6T7xHYJNTVwLvfMAfz0xpxBoHUvyZvSCVsvXg/Yt8nB4G7vcU0u
         9vGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wigc1HNf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i29si3657242ybj.701.2018.01.15.01.44.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 01:44:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wigc1HNf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51501 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb1Jw-0000r0-V5
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 04:44:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb1I6-0008Gm-Io
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 04:42:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb1I5-0003Sb-Tq
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 04:42:54 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:45845)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eb1I5-0003Rv-O9
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 04:42:53 -0500
Received: by mail-ot0-x242.google.com with SMTP id r4so6308777oti.12
	for <qemu-devel@nongnu.org>; Mon, 15 Jan 2018 01:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hmeZCVAYZCrgsGZDqpWRQWSQnYxG8XVbPNbzPdmErGo=;
	b=Wigc1HNfmTy1pdALg+vsePviKG6wP05G01MvY85XDwTJ+AAVVtP2X27z+H3nmVXzlp
	1rU0qCVmybg4K3U8xsJ9gFD/wu5gfaCuzCjL5NltbOuas4ozkpIYTJGZRE4OOmnxZVvx
	4eNimou+ExcHcz+pJpQ4v2+U3/jgeup6DCdIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hmeZCVAYZCrgsGZDqpWRQWSQnYxG8XVbPNbzPdmErGo=;
	b=Mo+7qRtnLAc4H3hSBfFHkzqewkBKU7QOfhiUfrjnxSC/qu+UQR5cpdFe7Kzss70wJk
	TLgodcGkYGcB6342GRH8FY5yG7XOwNwKkyRTy3mDBQGPsnhnd8VT+SlplnLzyX8smiBH
	+soZRrCaW8fATYmx6HeZdr/TojfV11OAJ1uDu870r28zxshSOmaGE2UnEIfzOMybpXW/
	Ficd+9YFWA57sILcJbw2uBdGycTNlvGIFcZONCjvw9FVmeDPOgS7pc5kSwvSBEDL2H2A
	03dq1312oEV+K9wzc8O1poddKXVymipktEkvYagubQk34pJ/oUjv55VMGyC4VUdc+/Zr
	mQqg==
X-Gm-Message-State: AKwxytdFZk8JJI/8cbndZv63kuQrTmXpYBtWbmkY4NlqnFqWxoEOacHg
	X+0dMUJO7UGFFZG5eV/B5szrr9EnyNbjnT3fklOtjw==
X-Received: by 10.157.2.175 with SMTP id 44mr18094573otl.335.1516009372947;
	Mon, 15 Jan 2018 01:42:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 15 Jan 2018 01:42:32 -0800 (PST)
In-Reply-To: <f7aa6594-c3a3-fb42-9147-de8fcbddc848@amsat.org>
References: <1512742372-31517-1-git-send-email-peter.maydell@linaro.org>
	<f7aa6594-c3a3-fb42-9147-de8fcbddc848@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2018 09:42:32 +0000
Message-ID: <CAFEAcA-6vSyVtwGgGMHYQHd=ebMWi1+0Nheq6=Oc3Mfa0NuGhw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] hw/intc/armv7m: Support byte
 and halfword accesses to CFSR
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
Cc: Andy Gross <andy.gross@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YEgoOzk++ktP

On 15 January 2018 at 02:34, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Hi Peter,
>
> On 12/08/2017 11:12 AM, Peter Maydell wrote:
>> The Configurable Fault Status Register for ARMv7M and v8M is
>> supposed to be byte and halfword accessible, but we were only
>
> "aligned halfword"

"halfword" is the phrasing the v8M Arm ARM uses. If unaligned
is meant it's always explicitly stated.

>> implementing word accesses. Add support for the other access
>> sizes, which are used by the Zephyr RTOS.

> we have:
>
> static const MemoryRegionOps nvic_sysreg_ops =3D {
>     .read_with_attrs =3D nvic_sysreg_read,
>     .write_with_attrs =3D nvic_sysreg_write,
>     .endianness =3D DEVICE_NATIVE_ENDIAN,
> };
>
> with:
>     /* If true, unaligned accesses are supported.  Otherwise unaligned
>      * accesses throw machine checks.
>      */
>     bool unaligned;
>
> So unaligned halfword should throw excp.
>
> We could add an explicit ".unaligned =3D false,"

That is the default, and assumed by practically every
MemoryRegionOps struct in QEMU...

thanks
-- PMM
