Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp15506972lff;
        Mon, 30 Dec 2019 06:56:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqx+vFsqyxWxeFOo1YMAFR6jzL/9WxgT9kHK8jZk80SfNU/SyILtR7WCVnZ54onO9BNUZ/fR
X-Received: by 2002:a05:6830:1402:: with SMTP id v2mr63399147otp.12.1577717800326;
        Mon, 30 Dec 2019 06:56:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577717800; cv=none;
        d=google.com; s=arc-20160816;
        b=csgAQKoVRMvemCQHbBMrnhhNa0EaNhQySfa2W/nFLiXUdHzwOC2DF9/U5gjXQyX8qr
         2RGUxwcFsx4OIFgtFkAH5gGquKqPAeHlxByTBP0+0YFRV234q75NdSbbYuwXNN8ROxSd
         4UCxUqeBdJU7HYd2eJXTniOKIMrwZc6bBkt1rlVUQf6Zxltiam+YgoEz6A40TzGz9MCa
         GhdWRQa+CeAIwRcoDkxO1xa9D0wYJu1bwCpKpL/8cMdpdwOf5mdVd6DdZuOC6mFyjK6n
         qBCsLhSZxMQPMwPUv2QXcHPxDCcakHz/yUllhrDvfFD//Hpo+/t3EXM0XH6o0kpix7Wz
         TSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wgFR1xDac1SK2J4H43k2WJfgpKX1rkcdRy+S1pJTjLg=;
        b=J92TWr5QvAsVcHXKohUQvJoCEEdlkJe7TBlPARr4qs4GCuqqs1hdJL7WWKleUFNkp3
         ERsUkemnppGvWaD1Ym29ph8VxVXAEFj3bEpKdOAGFk+ngDYtDTWmdznPLTwAjl2xyUzx
         iMYDIQJDQt+FR9+GOUgo3BFlwC/yNrHkvA1ZKAjVn//w8b0FzWM6sSjcnMg20HwontYH
         3lSZaKYY/UwIC2y0N4f5dKoYdEahlz7O+9HzN1uAgJ6vSEUk1Ic5RgL5ui5Km86PI0ig
         CIFFYWtgsIKiPQRaGZzXwQvGA8AT4yTsqkuY4nL1+09u1pAGcffX8+RqY1AaFrUeLpbO
         hLJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OL0Xr5HF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si23563699ota.71.2019.12.30.06.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2019 06:56:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OL0Xr5HF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ilwTH-0004JB-AL
	for alex.bennee@linaro.org; Mon, 30 Dec 2019 09:56:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38967)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ilwT1-0004Ij-K8
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 09:56:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ilwSz-0005X0-RN
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 09:56:23 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53783
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ilwSz-0005Wj-Ms
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 09:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577717780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wgFR1xDac1SK2J4H43k2WJfgpKX1rkcdRy+S1pJTjLg=;
 b=OL0Xr5HFkPagZ47Z3KaqK4oMBnQ+vYOUFRe8DlPo36Sv0bulxAwbsNkqFzBv0o5SndP4UN
 Ti2DF9kyNx0qoFzKyCqw0TD55BBYa9Tv0P2if3IOuRUMc0YJDNFwSJ9Sbe4HudybxzpXt7
 FpolfrbCI4TcJv1qRJLxOodJIqctQM4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-fNi3vCv7OY6BBakGRkNAwg-1; Mon, 30 Dec 2019 09:56:16 -0500
Received: by mail-wm1-f71.google.com with SMTP id f25so1695394wmb.1
 for <qemu-arm@nongnu.org>; Mon, 30 Dec 2019 06:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=03s0E4aQWCdqgJM1YJTbLIKn6CEi/zKfH+0EXS+0kcs=;
 b=WPxyltAEpp1gs1UeIlIBsk+E5w4H6mP6IW5I0yL+qEIf1iyMC0eyuZYh+bZJOGHTJX
 AxzOjXqcLAxva5Vo1jjHdJu4/ZlvR0eLQdn0yzz03eRuPzT67aJXCloRKvBm6yOfA9gx
 CfiyWA37Yz3x6elPI1wsypIPbDpH/wFuy5R53KMiJk9UqJH5hCaY/P/8CVE381yAlJB/
 uHuItYAj29GVNGEfwkynHgj66dljOF30wAtqFsctP7MUrWc4IVdDFyld6GsPjT57h83E
 ctHHoa2dKkKp7BUob6Eo5g3GKd5MCzKh5PJOwvxokmZnNOKn5IK/n6nE7tRiV7LAUZwV
 dviA==
X-Gm-Message-State: APjAAAUhRjW9q7PXuR/22G4ImJb21wDxK2f5SumPP1zcxtaemM2Vo8+p
 bobY37LwyUZ961k6n7esSu1ADXSQTm+OMkH9n7M2Er9dXyNif08ofc/j0uZbxXzbA/aCCYpsL3o
 7VSeIosiyH8t+
X-Received: by 2002:adf:e547:: with SMTP id z7mr69179057wrm.258.1577717775674; 
 Mon, 30 Dec 2019 06:56:15 -0800 (PST)
X-Received: by 2002:adf:e547:: with SMTP id z7mr69179042wrm.258.1577717775489; 
 Mon, 30 Dec 2019 06:56:15 -0800 (PST)
Received: from [192.168.1.25] (abayonne-654-1-186-92.w92-134.abo.wanadoo.fr.
 [92.134.161.92])
 by smtp.gmail.com with ESMTPSA id i8sm46050169wro.47.2019.12.30.06.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 06:56:14 -0800 (PST)
Subject: Re: [PATCH v2 00/10] Add Allwinner H3 SoC and Orange Pi PC Machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20191216233519.29030-1-nieklinnenbank@gmail.com>
 <CAPan3WpDbWb_cBMJPgokSLKAJndMQLvRdOav6CPpDbFv+ChN0g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9756419b-55bf-23a9-556a-d5bc5fb29331@redhat.com>
Date: Mon, 30 Dec 2019 15:56:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3WpDbWb_cBMJPgokSLKAJndMQLvRdOav6CPpDbFv+ChN0g@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: fNi3vCv7OY6BBakGRkNAwg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oeIjBJJnprcN

On 12/30/19 12:28 PM, Niek Linnenbank wrote:
> Hi,
>=20
> Here a short status report of this patch series.

Good idea!

>=20
> For V3 update I already prepared the following:
>  =C2=A0- reworked all review comments from Philippe, except:
>  =C2=A0=C2=A0 - patch#8: question for the SID, whether command-line overr=
ide is=20
> required (and how is the best way for machine-specific cli arg?) [1]

Answered recently.

> - added BootROM support, allows booting with only specifying -sd <IMG>
> - added SDRAM controller driver, for U-Boot SPL
> - added Allwinner generic RTC driver (for both Cubieboard and OrangePi=20
> PC, supports sun4i, sun6i, sun7i)
> - small fixes for EMAC
>=20
> My current TODO:
>  =C2=A0- integrate Philips acceptance tests in the series

You can queue them in your series, adding your Signed-off-by tag after=20
mine. See:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign=
-your-work-the-developer-s-certificate-of-origin

   The sign-off is a simple line at the end of the explanation for the=20
patch, which certifies that you wrote it or otherwise have the right to=20
pass it on as an open-source patch.

See point (c).

>  =C2=A0- integrate Philips work for generalizing the Allwinner timer, and=
=20
> finish it

We can also do that later, and get your work merged first.

>  =C2=A0- test and fix BSD targets (NetBSD, FreeBSD) [2, 3]
>  =C2=A0- further generalize the series to cover very similar SoCs: H2+, H=
5
>=20
> Does anyone have more comments/requests for the V3 update?
>=20
> [1] https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg04049.html
> [2] https://wiki.netbsd.org/ports/evbarm/allwinner/
> [3]=20
> https://wiki.freebsd.org/action/show/arm/Allwinner?action=3Dshow&redirect=
=3DFreeBSD%2Farm%2FAllwinner

