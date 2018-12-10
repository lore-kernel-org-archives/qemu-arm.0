Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3465468wrt;
        Mon, 10 Dec 2018 03:10:09 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XEovip6k8iojWUTzyeyGQ6A7S0qUQyczHLtgAs2DNMb3h2gJzUxddRcGpVpevJGsavbjYp
X-Received: by 2002:ac8:4611:: with SMTP id p17mr11760878qtn.263.1544440209605;
        Mon, 10 Dec 2018 03:10:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544440209; cv=none;
        d=google.com; s=arc-20160816;
        b=xgCHlYi8u20ipwQYNajF7iX+4XpN9Vx36lLC6/rIiNiD8Lpn0LSOlY5iZsLOO07aKZ
         jTS6khye+8g2ML7TOKN6fNGuMWM8QYmW3Kt5R04YOxzPOsHTyRltetRGe3h50DwvcFkF
         2RyYxB/Wih7dsXZ9qbDomPdO+V9arVVbVo2OtbMDOUCJqN9bkXUQYnDMguHx1fvLOhrv
         N5BSyyTW9UJvBqOpNT3diQCl6I3I9gndF+YTjoXqQjxH/uHHIL95dJ+69fkUfNIf1FNk
         R3LFEacvBWhRO6XQ5F87NPHJWgYTSD//OrFcU/1suHMwcNyzp3R28ackFbhWe8pB4Zif
         mj1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=WF3IMjuTxUX4pJ4/uuvj+m3d1ms72vUq/OftEeQvBFw=;
        b=XAtB/uff6blSLp0gzMv0y2aFC6yeW4VSQ/gxSZu0eqZ99z2R84Bjm4rhntsldt/HZp
         VmIg3F7AofABoJ8usIPhSjqGZzmQgNljw1yYKEHNN2sqWvB3ZWvSbmn66bcXeE0sfBwI
         Gv4WxjJtlAOZrcXD8bkBD9CZfcnzqr4Rm0SCqiZeakK7rkLZGv3r6bsUhv23YAynanMF
         ZWvW4uQvTJXubPvALbLQByaWdM5WlxV8Newf6ed1ViF/FSTZys+L1QtV/fQkt0Shl7g9
         OXcV5awMMFgE1X31MP6qmi9zz109xZ/VCaioCOwH8TblLNTxkNQco5fTJ/JNOOiRFVmU
         eivA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="WHrIf/lv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r26si1634095qtf.323.2018.12.10.03.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 03:10:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="WHrIf/lv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWJRx-0007XQ-4I
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 06:10:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gWJRo-0007W3-6M
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 06:10:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gWJRm-0003Xr-Er
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 06:10:00 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40731)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gWJRm-0003XV-86
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 06:09:58 -0500
Received: by mail-oi1-x243.google.com with SMTP id t204so8616388oie.7
	for <qemu-arm@nongnu.org>; Mon, 10 Dec 2018 03:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WF3IMjuTxUX4pJ4/uuvj+m3d1ms72vUq/OftEeQvBFw=;
	b=WHrIf/lvMKJ9yInQg0uynGh1JrwOCDSWpqCDArZ6BcMPk/spIxq05mgpRvOE2hySGY
	/xP5M9CgAfZ3z1eDeAnD48fAeXuBeRrMl2VUO0XkGwt+PM+D6gU3Q1iTM0GijxnS3+Wg
	zvt2st77Qc/D6alFnjqwAmhOJWJ0OjqC6N8Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WF3IMjuTxUX4pJ4/uuvj+m3d1ms72vUq/OftEeQvBFw=;
	b=dHjwJm3C+4F1UVGcEIhtwDa2u61IvMW878V1hWiK2orylWBNeDTlk4EBiTiVZU/E3s
	wskDi96SIRom9nOl6FhCPAhSU47REVRzDqiDsZB8D65GETWxanecoXipLHYG4mMv+mKa
	Llv9zY5ZDULTlrwrSTdwgYy+vCqW1gUWGxBthO/7dMWhxnjgGlEHG1r7wNCUD3s09Ouz
	F/N3A5oO1J+TNvm1EUnJlgVFFwAiCBaRjJDdHNGt5ug7wUuWiwj1RMxUpY8ZHb1/velp
	QyJheOq7jx5g4wszZN4m3YiPxACAaFCIElkmZyW8sttgcWpgnJeptO/93gH6wLHNzadI
	tIQw==
X-Gm-Message-State: AA+aEWYwpK9mqdGSlHeVIWx+F2iDhwxEtKqpn8wES/7eVPcWL7/ukZWe
	GpHe4IBhiT2Qwl+YGGXNhQIVGp5nFE8Y0u7SouadyQ==
X-Received: by 2002:aca:1e17:: with SMTP id m23mr7467224oic.332.1544440197495; 
	Mon, 10 Dec 2018 03:09:57 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9qhe0ZemTkc2jkEO=_hu6PhvKUKGHC9QYTj2j+QHhNf8g@mail.gmail.com>
	<CAFEAcA8fYaKTZkLR8Ja3P590bSWy1cu61-gSxyf6+wXCfCLoxA@mail.gmail.com>
	<CAHmME9qQo4XfRgZUZDt3xbx=5KmRoYbO3N0+3m9gdKi9hvnZQA@mail.gmail.com>
	<96301756-f879-84d1-f5ef-d2615257d309@redhat.com>
In-Reply-To: <96301756-f879-84d1-f5ef-d2615257d309@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Dec 2018 11:09:44 +0000
Message-ID: <CAFEAcA-J8gWONJye0JvuwG5warWKZD1MX-GW8=BPuCo9wF5ziQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [Qemu-devel]  more serial ports on arm?
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ox0A3DeRcsru

On Mon, 10 Dec 2018 at 11:00, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi Jason,
>
> On 12/7/18 5:42 AM, Jason A. Donenfeld wrote:
> > On Tue, Nov 20, 2018 at 11:08 AM Peter Maydell <peter.maydell@linaro.or=
g> wrote:
> >> It's still stuck, because unconditionally adding a second serial
> >> port to the virt board breaks some commonly used existing guest
> >> code (UEFI + Linux), and it's not clear to me what the best
> >> command line UI is for allowing the user to request the second
> >> serial port.
> >
> > Can the UI be the same more or less as for x86? Specify a second
> > -serial, and then the machine gets one added? If it's in secure mode,
> > then it's added as serial 3 instead of 2, to remain backwards
> > compatible.
>
> You can use various -serial arguments.
>
> If a board supports 4 serials and you only want to see the 3rd (secure
> mode as your example) you could use:
>
> ./qemu -serial null -serial null -serial stdio

That's the opposite of Jason's issue, which is that the 'virt'
board only supports 1 serial port but he would like 2...

thanks
-- PMM
