Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5805276lfp;
        Mon, 17 Feb 2020 22:46:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqwwj0JbOj15it1sh/rs4T6r84jYQaVkXyNJCIIEivusXXNisnz7/UfxkSJqeT4QeLAsF5QN
X-Received: by 2002:a81:2e57:: with SMTP id u84mr15214136ywu.98.1582008399171;
        Mon, 17 Feb 2020 22:46:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582008399; cv=none;
        d=google.com; s=arc-20160816;
        b=uVSRqpz4QsA/Kggr474S8/ndUQcGFLFJUAznwgtB1Z+Y4hXPrZbeaS7INppiOHFWdG
         jry7e+GNulKy6CXo3M+Be1pd5Wiaw6DXNtRYwF8JEMx3CcUTsZ2Y61DzyDAzO+zNIJ0w
         EiGV7qGDiYTT0cju5b2KKwkbK+tambcFS1RfYUdeOiMLyUY0/X5HqPiUVY2LQj/STT0a
         Cm5ZvtUtvggW3qoANfbETj33ekqKxbaZa2AKpKExm1zEfSDWMy8Imf3rzAGcbTsYFtPw
         JzfBOr6F5frTDFE87/Mv6SknbNLDGEYDnpR/34YYYYSqchYdo2vgXJDvXQ5/Ip1UD+tj
         NCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=7EexfLdD5JSfQpqO5jqNe6EOqoeJQYPvSvd4DEM4l58=;
        b=svX/sN9PSk1iNOf6fPXmei7pAz9/MDZ+4Y+kWYaFD9vZDQevtAi0jVNcUNbUIMzcQl
         ZG9oVD6D+a6sPE5B/ZFnOtrMlI3lZpmgsLsL1eJYhHb/IxtE560XMptS48Z/NGERDgRc
         e6vGg98PIh0+o5dKE4IMGqyh4QzvajNHnRRitbZa8CzzlxrW5FTz/2cCQDIIhveKkCdj
         OWXl1gZB05dH98q8+xiqIYxcPfVnBYVllVf/NUi/YQv+gqB5uE3dfMJT9Oh52Qewb7L2
         iejLEUBecYok/SXn2+fOqFW7ssHtiPoNEARTircEhz/Ua8enlHazBCdKEI63vrVArxdt
         ynjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XCD1gOYo;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id n18si1193537ywj.258.2020.02.17.22.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2020 22:46:39 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XCD1gOYo;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582008398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7EexfLdD5JSfQpqO5jqNe6EOqoeJQYPvSvd4DEM4l58=;
	b=XCD1gOYo0FDid62MdVhstGEIPxLzamVPl1NUB9/mnlr/6AVGTGXZnI5sT0rTQdQzJ/dVhX
	CyQqe0EA4CEIIsL6XRek68M2LSzYdWU8qrL9dvUBOpVF58fG5kifc+rtn9g+EMLVA9pRGs
	cxdmdCgWoysHh8ReAab7xAB3WLGV9DU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-k-RerAshMIudHFMAt0jIUw-1; Tue, 18 Feb 2020 01:46:30 -0500
Received: by mail-wr1-f71.google.com with SMTP id n23so10273513wra.20
        for <alex.bennee@linaro.org>; Mon, 17 Feb 2020 22:46:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0Xfzg04uB8sMZPMiaMCiM5JFy9tm9UmJ6U9SQouTgD8=;
        b=SSmKHEYGnyMiys34GG5/2DULoMFPm0giaq0fwiMxGa1ONqlxBxmR5yXPfNTPwyedHJ
         QkqBmFY4hexHlFOV6OgLW+hlJGna21GlWVmLotIPvocJ7N7TCAiW8eKcS330K4+eJlwK
         4yvq3IbvX2jBzSbD6JuNq3+uEvPyVP5iFYVuN9eLO52kC/lgRgwaiTD/s/ZiABWRuD+5
         cbCgSXSePth+WmMz4ACKa68GpClQPLlSiIN1T/MZazm5DArYVTYdL+OkAIehCLkBzXGe
         No1lgjaWbJ3UdtzMLnpXYWJ0uDcP75VnI9ToUEOfUjRwUZZGEg8ojVRwY4hVrwPyCPXh
         3VZw==
X-Gm-Message-State: APjAAAWm7D0rcSbQSLGo+QVwFhUEM//YJfyYVRCloGWT2zQGlqi03Np3
	VBSV5NtDui4g7Z9TPoNDN0t3vExVWxVpjz8m8cy4v15zlZtRq0GVjy/QW2r9ZgXYe1OPsLzYvpj
	mH0QP4qwGaaS9twal
X-Received: by 2002:adf:ab14:: with SMTP id q20mr26592228wrc.274.1582008389541;
        Mon, 17 Feb 2020 22:46:29 -0800 (PST)
X-Received: by 2002:adf:ab14:: with SMTP id q20mr26592197wrc.274.1582008389256;
        Mon, 17 Feb 2020 22:46:29 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net. [88.21.202.78])
        by smtp.gmail.com with ESMTPSA id m3sm4340179wrs.53.2020.02.17.22.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2020 22:46:28 -0800 (PST)
Subject: Re: [PATCH v4 00/20] Add Allwinner H3 SoC and Orange Pi PC Machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, jasowang@redhat.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <CAPan3WpV2m9HXLXZDopKUb2EfX2KE9y530m2pJG4-D96==ggCg@mail.gmail.com>
 <ee95179f-c15f-9615-e241-80199e6948b7@redhat.com>
 <CAPan3WpG0yPu5sbS=mpHk=xNVGaqwWFrBcDBcovLLRit==5dwg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3aa04b23-80a8-21d1-7481-d52b6d8f88c1@redhat.com>
Date: Tue, 18 Feb 2020 07:46:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAPan3WpG0yPu5sbS=mpHk=xNVGaqwWFrBcDBcovLLRit==5dwg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: k-RerAshMIudHFMAt0jIUw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: AJn92ssmU+pz

On 2/17/20 9:27 PM, Niek Linnenbank wrote:
> Hi Philippe,
>=20
> On Wed, Feb 12, 2020 at 11:12 PM Philippe Mathieu-Daud=C3=A9=20
> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
>=20
>     On 2/12/20 10:47 PM, Niek Linnenbank wrote:
>      > Hi all,
>      >
>      > Short status update regarding this series.
>      >
>      > Currently I am debugging booting NetBSD 9.0-RC2, which is recently
>      > released [1]
>      > The problem is that, apparently, RC2 can't mount the rootfs proper=
ly:
>      >
>      > [ =C2=A0 3.1871510] vfs_mountroot: can't open root device
>      > [ =C2=A0 3.2141370] cannot mount root, error =3D 6
>      >
>      > This only happens using the RC2 filesystem image. However, the RC2
>      > kernel can
>      > properly load & boot the RC1 filesystem image, and the RC1 kernel
>     gives
>      > the same error
>      > on the RC2 filesystem.=C2=A0 But I dont think its a NetBSD-RC2 iss=
ue,
>     because
>      > on a real
>      > Orange Pi PC hardware board, this problem does not show.
>=20
>     Linux shows:
>      =C2=A0 =C2=A0console: mmc0: Problem switching card into high-speed m=
ode!
>=20
>     QEMU MMC support is not in good shape, and high-speed SD card
>     support is
>     limited. I keep procrastinating at reviewing your SDHCI patch hmmmmm.
>=20
>     So you added:
>=20
>      =C2=A0 * DMA transfers
>      =C2=A0 * Direct FIFO I/O
>      =C2=A0 * Short/Long format command responses
>=20
>     I'd start diffing the trace output of the following events:
>=20
>     allwinner_sdhost*
>     sdcard*
>=20
>     with both kernels.
>=20
> Thanks for the kind suggestions Philippe.
> Indeed, comparing the trace files of both the RC1 and RC2 kernels is one=
=20
> of the things I did, and many more.
>=20
> After extensive low-level debugging, I discovered that the issue is much=
=20
> more simple than I thought.
> In particular, when using -sd <file>, the emulated device gets the same=
=20
> physical size as the file.
> Normally this is not a problem, but for the NetBSD RC2 image, the kernel=
=20
> reads the MBR partition table,
> compares it with the device size and concludes that the NetBSD partition=
=20
> in the image is larger than the actual device.
>=20
> Unfortunately, this root cause is not printed on the NetBSD console,=20
> only the final=C2=A0 'can't open root device' message.
> Also, when running on hardware, obviously the SD card will be larger,=20
> e.g. 4GB or more, so that is why this issue does not show.
>=20
> So the fix is to extend the input image by a few megabytes before=20
> booting it.
> And on the positive side, with this search we now have more confidence=20
> that the
> emulated SD/MMC device in Qemu works as expected.

Good news!

IIRC from the specs, cards are block devices and the only alignment=20
required is the size of a block (512KiB for your 4GiB card).

That said I never saw a card not pow2 aligned, but the card firmware=20
should be able to discard blocks and announce fewer. Maybe FreeBSD is=20
incorrect assuming a pow2 alignment?

>=20
> Kind regards,
> Niek
>=20
>      >
>      > I'm comparing traces and adding more low-level debug output to
>     NetBSD
>      > and QEMU to find the issue.
>      >
>      > Also I processed the review remarks which were send so far.
>      >
>      > Kind regards,
>      > Niek
>      >
>      > [1] https://www.netbsd.org/releases/formal-9/NetBSD-9.0.html
>=20
>=20
>=20
> --=20
> Niek Linnenbank
>=20
