Received: by 10.223.159.74 with SMTP id f10csp6530846wrg;
        Thu, 14 Dec 2017 08:45:29 -0800 (PST)
X-Google-Smtp-Source: ACJfBouE4NlqSzVBPEVHMuR8+xal/ObGSA2Pko/5FuWnUPoDBrqD7znKbQ6NXvFMTmOrUKtWiuiF
X-Received: by 10.13.225.205 with SMTP id k196mr4716112ywe.50.1513269929163;
        Thu, 14 Dec 2017 08:45:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513269929; cv=none;
        d=google.com; s=arc-20160816;
        b=k6QMLXtY1UO451UngQO70X9zGTrKFMnxd4di7W0NLuc3Owxt3mgwxZixUO/oPpyIUn
         Lz0cX2aQMSWKIANq6VPEsVaANAA8EogM49MJNtI1aohVjEHA1rteStqkm2rnx0w+BR2N
         r57jrU1jIac2C9LydjM3Hdy9CHqKqzWS2Utfp7fsLK31n+GPW5AWf50FKjQW6eImMvyT
         cQ+wDSP735XflCiGc+jPbX8gvXpHksk5mx7AU3FW2TSgBN4Tlc8aYf2QQl6jFjJ31i46
         roFuj3l4NDCYodT1q+z2lcPlKo1DvFCJvEcCz6h/oY2rnDyP93ZHIr9wz6mlF/NWB4nS
         EXZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=qP0JmycX1+oGj9vV4w+P2Js6mU0xLMu5FvsxrhWtqXk=;
        b=uapoh4mmNoT0QA483ocvdlkknpNlt6JTy0Xiz93DFlENW4THdvzqYSYn8mlaUzWCJ6
         H5d/wMVHdk4pf8N38mQ1pg1y1O3db4GK7iYAM+lbepwbcbsTrsihgprKOOki6nM3gTF/
         FWtbe2uukleXazpUVfBjuso3zM+P/QxWp6iujv7AM9Y+VOiYf68Ez5bs7pJQFbRhOHSq
         EiudkVEGk8RJZyRex1BU7WAe8iiSjWAV8CL+2MU59SDV16wOR5NsbKfaqarhZDSf+2Zd
         xMxHs7VABWQHIk06qPrw8ETcAJYtf5l8A/AwXR8RJAV2ccCFHHqc4pFkhSsmgrFmOrLM
         xfww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=htB3a2Dg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1si862517ywe.254.2017.12.14.08.45.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 08:45:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=htB3a2Dg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePWdU-0005tM-LB
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 11:45:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePWdK-0005rN-Ep
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 11:45:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePWdJ-000071-Bc
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 11:45:18 -0500
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:41286)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePWdJ-00005s-5C; Thu, 14 Dec 2017 11:45:17 -0500
Received: by mail-qt0-x22b.google.com with SMTP id i40so8688983qti.8;
	Thu, 14 Dec 2017 08:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qP0JmycX1+oGj9vV4w+P2Js6mU0xLMu5FvsxrhWtqXk=;
	b=htB3a2Dgb807/AeaEOSl9ChFrxvYDxi9EPhN1wr8UgB12BI4zIslzVHly8Yypf7VbI
	EKkhqPW+F4MB8PxwY5uv6dHMEBHRkzl+8fLH75C49GPA4ub4SPIs6B74p8OuNtrC9Jsj
	27GqL6RA68J8Tt8Ibfmtk/vIOsYkgvRrGrkIyTIZh+QEVRhkSvsgnJTossO9SEi58KxJ
	H18oOEIYHrmPDQlmmtNxlWw3Ke3z/FQn8RkWGbdsCQhJ3eZlOxUHtf1SQbME6nzZ5sYt
	hOuL0szXT4XWlaX8KEP0oBpJmvtSzsCBDH+H0SzpVoEDfESICQDMiR9BnP9hm/USjnfT
	KEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qP0JmycX1+oGj9vV4w+P2Js6mU0xLMu5FvsxrhWtqXk=;
	b=RKnt5onxRGc/50iWFgZDYeQheS34QTdfhGWzm4ImOzPXiK3ztj1jaVuoPk0nWVJ995
	USw9E8BNb19P7UK7xuN5CsoMDutkI4C2xv7d8KpiXuDTRlBvSu6CxCU4pVepAOC7XpwZ
	oAOwm5o7h4CmmNfzmONqsji2nRkKi2MzYVsXygffwUhmY07Lh5SpX9RifdPJAA+Ur4La
	p7I/59GHadueO9OVihuwP5JvcKUi1PhSQ6eKI8RvVuwKFJs1AiaBa6Uq6F++0E1mlsWe
	oP+xoeDe3hQygQiULlWOqCsDvtAXxD1wzFClg50TweXaHbhZFj/4/fxJX4iP3je6OKQ4
	t1SQ==
X-Gm-Message-State: AKGB3mJHTn4nZN6EXd/A4V4+200MnCOs//2RqRUtCEbKj4XI7IKvQR1M
	+mB3l2WiHD8OBDLSoW4cPdGeFyC2eo9Vg26U6rKiRA==
X-Received: by 10.200.35.182 with SMTP id q51mr16459172qtq.302.1513269915435; 
	Thu, 14 Dec 2017 08:45:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Thu, 14 Dec 2017 08:45:14 -0800 (PST)
In-Reply-To: <20171214145255.31545-15-andrew.smirnov@gmail.com>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
	<20171214145255.31545-15-andrew.smirnov@gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 14 Dec 2017 08:45:14 -0800
Message-ID: <CAHQ1cqHrCv8ENWDUzENRrLaBVMR0oVV_UDqwrGEeJ8Sko8bB4g@mail.gmail.com>
To: "open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: Re: [Qemu-arm] [PATCH v2 14/15] sd: Check for READ_MULTIPLE_BLOCK
 size limit violation first
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fWOGaC0BGtZ/

On Thu, Dec 14, 2017 at 6:52 AM, Andrey Smirnov
<andrew.smirnov@gmail.com> wrote:
> Check for READ_MULTIPLE_BLOCK size limit violation first as opposed to
> doing at the end of the command handler. Consider the following
> scenario:
>
> Emulated host driver is trying to read last byte of the last sector
> via CMD18/ADMA, so what would happen is the following:
>
> 1. "ret" is filled with desired byte and "sd->data_offset" is
>    incremented to 512 by
>
>             ret =3D sd->data[sd->data_offset ++];
>
> 2. sd->data_offset >=3D io_len becomes true, so
>
>             sd->data_start +=3D io_len;
>
>    moves "sd->data_start" past valid data boundaries.
>
> 3. as a result "sd->data_start + io_len > sd->size" check becomes true
>    and sd->card_status is marked with ADDRESS_ERROR, telling emulated
>    host that the last CMD18 read failed, despite nothing bad/illegal
>    happening.
>
> To avoid having this false positive, move out-of-bounds check to
> happen before BLK_READ_BLOCK(), so this way it will only trigger if
> illegal read is truly about to happen.
>

Disregard this patch, exactly this fix is already present in latest QEMU ma=
ster.

Sorry for the noise.

Thanks,
Andrey Smirnov

> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/sd/sd.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index ba47bff4db..ce4ef17be3 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1797,8 +1797,17 @@ uint8_t sd_read_data(SDState *sd)
>          break;
>
>      case 18:   /* CMD18:  READ_MULTIPLE_BLOCK */
> -        if (sd->data_offset =3D=3D 0)
> +        if (sd->data_offset =3D=3D 0) {
> +            if (sd->data_start + io_len > sd->size) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "%s: Trying to read past card's capacity\n=
",
> +                              __func__);
> +                sd->card_status |=3D ADDRESS_ERROR;
> +                return 0x00;
> +            }
> +
>              BLK_READ_BLOCK(sd->data_start, io_len);
> +        }
>          ret =3D sd->data[sd->data_offset ++];
>
>          if (sd->data_offset >=3D io_len) {
> @@ -1812,11 +1821,6 @@ uint8_t sd_read_data(SDState *sd)
>                      break;
>                  }
>              }
> -
> -            if (sd->data_start + io_len > sd->size) {
> -                sd->card_status |=3D ADDRESS_ERROR;
> -                break;
> -            }
>          }
>          break;
>
> --
> 2.14.3
>
