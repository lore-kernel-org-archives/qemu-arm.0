Received: by 10.223.172.38 with SMTP id v35csp2726667wrc;
        Mon, 25 Sep 2017 11:10:25 -0700 (PDT)
X-Received: by 10.237.55.228 with SMTP id j91mr12713271qtb.28.1506363025390;
        Mon, 25 Sep 2017 11:10:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506363025; cv=none;
        d=google.com; s=arc-20160816;
        b=ifhpCvMFYgg3B81sri4+8yzxPxK4d4ZWFhaMm4iuk3gum0OzZ0wK79o/xoR4dch1VZ
         vZkGiMrOk/3CFP3wOJwgnbLn643Z27aB5IueoReHPsyGaJWA9bZDJfsWC1iyWToPs34n
         D62ufWYzWvJsiW82cTcjXPzkOSQH3yQr7ncqJy/w663Bexd5IM8bR+ks515zxGQKxe+Q
         C4bZIXZoH6WnQIS4xfbDzax1WM6kwIFtI0ZTqXdUpKV1JHV/DeqEuRyPpqtGUnOmKRCS
         hXWzBR9F+cGMOEoWJ9JidWWMXWfs4lFNJFIfBgwgDOuVUlOnCtMaGIzH4zDlWenXfGKc
         U9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=3CBgw0bp3pBAqepZHsyN2c+PpKm6r5hz9BM0/nS2Woo=;
        b=AvlaH+3tzJYTn7agDwRXgt4iU48IXv0P5kLji4mCO13XXj1zK74nWUYtUBCueVK79x
         MA0nYj3HlcP2d0VoNRjGh0VX7Oc994yqZOfUNHAfkjt2YtU2NObdOS2yMd2bxsIv9hLB
         cQND5pYWm+4FjsRmQVtp39DNhs3Pdf/cdPA7D77eprq7sAMVbiQo0xIRW6pDJhMN+G7e
         V/Gt2joto2tGvc+lH6A0R865lKb9dYcpNpyI9BuAyu+sK7FCRon73yn7ahUYjLul88ZA
         pKOD2NaHBVt/KlT3D98+duTj0klz9gyas/CJdc0RXC4NslU8XKlNU97HMJBMeA588Epw
         FzpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gYhpXQZx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t134si2422067qke.152.2017.09.25.11.10.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Sep 2017 11:10:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gYhpXQZx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwXpn-0007dE-3T
	for alex.bennee@linaro.org; Mon, 25 Sep 2017 14:10:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1dwXpd-0007d9-TC
	for qemu-arm@nongnu.org; Mon, 25 Sep 2017 14:10:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1dwXpX-0005Pp-S6
	for qemu-arm@nongnu.org; Mon, 25 Sep 2017 14:10:13 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35041)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1dwXpX-0005Ov-NV; Mon, 25 Sep 2017 14:10:07 -0400
Received: by mail-qt0-x243.google.com with SMTP id l25so5500801qtf.2;
	Mon, 25 Sep 2017 11:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3CBgw0bp3pBAqepZHsyN2c+PpKm6r5hz9BM0/nS2Woo=;
	b=gYhpXQZxOp7GtWrFDBIjKTAoX9K68yUFDA1ZFqQyoLx1LoxksaFFA7c8GC8cylqDEZ
	ZSKWo8GJE2Bim+4nMWSIT43XZW+aRgmJGoszL5SQLx8ZESnP4DCTCLWgJZjyojxBy3pk
	BWMQTp/ha8HPCPDuXSDm20j6N8SdV3FuA4l2c1jLOOoNYRaTKpJGkZpI5BaB74RVckcD
	1IrPEEz9X44nYEzvf23VA9/LAZK4tIIDngU26ZjXkVb0oNSVhois/2i/WdY+BoFBxWhM
	OmZHjuv+2DQsTJqSyVewGd5NGAujLxj+2+aYqUVLKMvnpP/qT4LFtAl+jYzYDeAZ9/UL
	7qeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3CBgw0bp3pBAqepZHsyN2c+PpKm6r5hz9BM0/nS2Woo=;
	b=fI8TZSBlYFIW4JOcfS4ze0tCJ7jfur6FKi68CF+9lqTK0LAc+owXsDMSOnkfZ7WyzH
	cGoLx8f8uNEvG0KJPoutCNS0INLNDJM6zB8rJm7oqbW65teeL3nqmUIPK+0lFRluNFZx
	ar1EkUZFw9PCfyg1M5kWHlCOYTC6U4CoRSXLpjVc4sdHb41MljqX9jsJ2BlsH9+JGV8/
	u4jOQhsGiZSXjajit+1LDHMneylyKvnIooGlssVm3Mplfw4K4k4+mIxFEgl6WXB3lT9L
	tU5/XGv5ENR2tLaU19e83X2u4w/gQrZX6N2/E0nu4h9f4W/4bhe2LUVvDqZ5l0+bYEBK
	DopA==
X-Gm-Message-State: AHPjjUjyRV0+soe6OL6oPOQnHNU1Lgi96nd/akAH9abzUbNyVFDGraAK
	1TevzJ6QB/xE1bHMDnFwPm6kWtBtVV0viJZcvsE=
X-Google-Smtp-Source: AOwi7QCMFGym71SXnGaZa/6B6epU5vU9TiRQIr6K2WW3YiFRRadnqtdIbUmN0sHUS3P9Jx2GVsp0qHPZ6NTN9Oy+JFw=
X-Received: by 10.200.24.117 with SMTP id n50mr11646484qtk.6.1506363005388;
	Mon, 25 Sep 2017 11:10:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.23.116 with HTTP; Mon, 25 Sep 2017 11:10:04 -0700 (PDT)
In-Reply-To: <dbc5a135-10d5-e332-94b3-4e59596f1d76@redhat.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-5-andrew.smirnov@gmail.com>
	<dbc5a135-10d5-e332-94b3-4e59596f1d76@redhat.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 25 Sep 2017 11:10:04 -0700
Message-ID: <CAHQ1cqHVuKdSfViMVMSCGB=RUJH3XbSzUL0ad3z0LGpj=VJ6OQ@mail.gmail.com>
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH 04/17] imx_fec: Change queue flushing
 heuristics
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
	"open list:ARM" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 26iemwN/RemR

On Fri, Sep 22, 2017 at 12:27 AM, Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2017=E5=B9=B409=E6=9C=8819=E6=97=A5 03:50, Andrey Smirnov wrote:
>>
>> In current implementation, packet queue flushing logic seem to suffer
>> from a deadlock like scenario if a packet is received by the interface
>> before before Rx ring is initialized by Guest's driver. Consider the
>> following sequence of events:
>>
>>         1. A QEMU instance is started against a TAP device on Linux
>>            host, running Linux guest, e. g., something to the effect
>>            of:
>>
>>            qemu-system-arm \
>>               -net nic,model=3Dimx.fec,netdev=3Dlan0 \
>>               netdev tap,id=3Dlan0,ifname=3Dtap0,script=3Dno,downscript=
=3Dno \
>>               ... rest of the arguments ...
>>
>>         2. Once QEMU starts, but before guest reaches the point where
>>            FEC deriver is done initializing the HW, Guest, via TAP
>>            interface, receives a number of multicast MDNS packets from
>>            Host (not necessarily true for every OS, but it happens at
>>            least on Fedora 25)
>>
>>         3. Recieving a packet in such a state results in
>>            imx_eth_can_receive() returning '0', which in turn causes
>>            tap_send() to disable corresponding event (tap.c:203)
>>
>>         4. Once Guest's driver reaches the point where it is ready to
>>            recieve packets it prepares Rx ring descriptors and writes
>>            ENET_RDAR_RDAR to ENET_RDAR register to indicate to HW that
>>            more descriptors are ready. And at this points emulation
>>            layer does this:
>>
>>                  s->regs[index] =3D ENET_RDAR_RDAR;
>>                   imx_eth_enable_rx(s);
>>
>>            which, combined with:
>>
>>                   if (!s->regs[ENET_RDAR]) {
>>                      qemu_flush_queued_packets(qemu_get_queue(s->nic));
>>                   }
>
>
> Not familiar with FEC, but if you are tracking 0->1 transition, why not
> simply introduce a parameter of imx_eth_enable_rx() to force the flushing=
?
>

Not sure I fully understand you, are you proposing I get rid of
"needs_flush" parameter in the device state, converting it to be a
parameter to imx_eth_enable_rx(), and then force flushing every time
imx_eth_enable_rx() is called in imx_eth_write()?

That should work, but it'll end up making the emulator code to flush
corresponding NIC queue every time the driver is done processing RX
ring. If that is not a big problem I am more than happy to make that
change.

Thanks,
Andrey Smirnov
