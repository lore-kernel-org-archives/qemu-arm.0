Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2749268wro;
        Mon, 5 Nov 2018 07:59:57 -0800 (PST)
X-Google-Smtp-Source: AJdET5dm00kl3XpelqQWSYOStiBmDMWwaYrkL/PYBQ1XDs3yC9/boxj2lY7vPsnaCQBRhaFFryhG
X-Received: by 2002:a37:2f01:: with SMTP id v1-v6mr19892469qkh.278.1541433597628;
        Mon, 05 Nov 2018 07:59:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541433597; cv=none;
        d=google.com; s=arc-20160816;
        b=ekEFcR5KrohOdJXVjWqRNwVAIAA1s5uk8WQQGg2blFXRXL+ijFrCjrgKuJqloNAYce
         AvCd3z0vTa3Yyy+fdWP0vV++MGr/cGmqNBFZKunBtqUlVilmRfzUKbRLTQO8DSqvt9cV
         SDVxAfBNstXp6ct7cyJi8vZZ4s5AFiu03Mx3PzGhBibZd+9dHy/47OX+XyK8/1cOOOIZ
         5FktxvdnwVSpKb25a7T3+kBMRhrzitJ5iK2+n2MWpzqdIVbPicxRObGtloh9Sh5dEQQi
         rtVToe495zebUeYSipidnIXW5gI4dHc+ukPkY0RsG3tbgr0cdk5qK7NqjULxXg5n0gTm
         PXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=NAZ+2A0cmaJUrvHTo8recQEi8KPD4RMp0wD8vZ83ss4=;
        b=cuE5cokgUaahPDiJwDmh8IWVRi92+9Kn5YCSPG2MvY1AT9+9K072Yn3v6ddu4ZHPLL
         +tTOlI6Wh/uGPJC1r6i4okpiYUirQfiQtcmbdO5HaBoJRbRtBqC3doq4yLKwtzZR8wbX
         YSqNYKC05+QLkxzgtu+qz2ntzcrtAnKNM6J/1DrVyY0DfcBwNpgML9F2PdfnimKVhJK2
         FkgsqiBihQr3kMuZ+CJpyzQgfTP5liggTC1IBIEgMONLZmnTxpQ7iINmKrc9mk9+CVX0
         qcEO+pFT8v797VWxdymszazx3Wq/cAIc+FJ0l4BQvGpPeKPszXwGziVi6GAhp+ajMOt8
         Xlpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="d9qPbxH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e97si13644015qtb.180.2018.11.05.07.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 07:59:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="d9qPbxH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35927 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJhID-0005TH-1B
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 10:59:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJhAJ-0002Kf-JJ
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:51:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJhAI-0001d3-Kn
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:51:47 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35470)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJhAI-0001TC-BO
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:51:46 -0500
Received: by mail-ot1-x343.google.com with SMTP id 81so8416267otj.2
	for <qemu-arm@nongnu.org>; Mon, 05 Nov 2018 07:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NAZ+2A0cmaJUrvHTo8recQEi8KPD4RMp0wD8vZ83ss4=;
	b=d9qPbxH/Vd6DM0n7ksOtcH2i5kodxFF+eoy9ItT8mZEmYah5gw7nyvS2xKUfp5IMMZ
	ws9drJVlgURkax9VPdW98QxWevLyAp5QMZ9cpAz+KCZL9XCTOXWjI3mqmDyRbyxPpdeW
	aZ6VemNvJXvULywSH2j6Sx4Edo0TcO6tQ4hic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NAZ+2A0cmaJUrvHTo8recQEi8KPD4RMp0wD8vZ83ss4=;
	b=dKYeqURSz6eZ1vUO7sCN/VSKnOyAM1UCclnvlJuJ5JsrEBPCNN7uVfTTrYYjPK1QcE
	SCCFzHE13ceD1Kl1mSWqaC5L2BBvEgi1FxBMPflSnFf5DGPjt7/r1xWYb1c7lD+Q4mfL
	sRS4Dr7NSwrVVdwSs+UwsQVLu3O+RGygYRNcdQw4hSqy1PQ8CgRMEF0qJMd0TnoydaR1
	DGjYHU4Vt4VyDY6Fswxbjt27wFnbpLIBe6VURl/M90XA8kSLaUUbAavvAIiiPeXOmkaS
	KvVpsuAt1sCNtLgB8+KaZiyZCjZ+Vpo/3ntSiJF45IiHUWvvUB1gc8Ck/4k/MDcHZYnI
	wC2g==
X-Gm-Message-State: AGRZ1gIXEwsSImRdYyF0kPxZNr8vHPbVuVlLZOj6ZhWv5ZneJPyscOLD
	R1OhD3tqLwiULbZNsXhV84kZOrq8PHQDQGguIXFTRw==
X-Received: by 2002:a9d:582e:: with SMTP id r46mr9083118oth.238.1541433101097; 
	Mon, 05 Nov 2018 07:51:41 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 07:51:20 -0800 (PST)
In-Reply-To: <20181102001303.32640-8-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
	<20181102001303.32640-8-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 15:51:20 +0000
Message-ID: <CAFEAcA_X6rAA181zpRFdViJKitwHAnN6EvvDS-SA-7znawsbow@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH for 3.2 v2 7/7] MAINTAINERS: Volunteer to
 review Raspi patches
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2/3Im7TpJtAT

On 2 November 2018 at 00:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c41ea5ed3f..a76d047659 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -684,6 +684,7 @@ F: hw/arm/microbit.c
>  F: include/hw/arm/nrf51_soc.h
>
>  Raspberry Pi
> +R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>  L: qemu-arm@nongnu.org
>  S: Odd Fixes
>  F: hw/*/bcm283*
> --
> 2.17.2
>



Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
