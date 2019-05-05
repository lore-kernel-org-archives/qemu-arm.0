Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1509533wrh;
        Sun, 5 May 2019 08:33:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwT4f7mF0YhO5BFym9FW7H1RDwshEI3WKqDlVjYQ1Ttq4hXoyiQeMo4ucJB+k765aitWnso
X-Received: by 2002:adf:ef02:: with SMTP id e2mr1662911wro.280.1557070437176;
        Sun, 05 May 2019 08:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557070437; cv=none;
        d=google.com; s=arc-20160816;
        b=u9FMSPn7p6lN33KBlM3fsOJoOplZVt7W/HZM7e79GTwPUgbsVIlKlpVGBtMPE4lpkq
         2D5y2T7tuuOjB18pWC29+byHFRCI/grL6+sJ/s8UMMpz55qTujrHuUZqvCrqZwdHjXm5
         8uRJCNr6IjkKcWKplSPjb+X3CxMq+Fv8/s3Q7ALCA/gRoCx0mmAZ4rREdMYqjZyWMREo
         JlPBNgaMnsJ9NqByVEEirwzxl5rwYtuXwD8k9aOEPFTVX958BwCpdGungLn+7RcrUNNr
         VUkeSmY5IOEKhBQFIasHD/t+MN9lqyexZmPauutvMOe411S6EwZuluHzV8IdSYEg8quk
         K1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yZA//yKboVF/o1NlHhWCIer4wuOolNU3QH8fQ3xmRFc=;
        b=l8cDCzQcuz47W5GIdUcipTWv9NBb3p6rkhN3aQ/YC9lB/jismIYqr7kHWk84qgW26i
         tt48Xtwm0ESjhqr8+G9sbyRK8PrS93ZFszV7Yf9mi2jTnupv83NTr9gAwre5S34CB/eT
         N9IB3uZb3zz/S70jtliQJBgTWsCaOIwMdSYV5FFdTgy4aNrsuFZlOqJpFTmmm1h5LnAm
         Do7yvwubWEI2ThzyKZJRzwzud9uL7ZDHt+bXUF6siLyqYaMOZNbnHjHRkNyj4swfeDqU
         YLrenQDLld3AF6LpRwvLum6xL63vwGT3P3KT190ZUVChWuX9pbhHgxR2Osq5nERzBLgd
         y4pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rs+tcfgu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17si5216079wmh.161.2019.05.05.08.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 08:33:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rs+tcfgu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNJ9I-0003XY-AS
	for alex.bennee@linaro.org; Sun, 05 May 2019 11:33:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hNJ6p-000270-8y
	for qemu-arm@nongnu.org; Sun, 05 May 2019 11:31:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hNJ6o-0005IS-4m
	for qemu-arm@nongnu.org; Sun, 05 May 2019 11:31:23 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:39852)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hNJ6n-0005Gg-VD
	for qemu-arm@nongnu.org; Sun, 05 May 2019 11:31:22 -0400
Received: by mail-oi1-x22a.google.com with SMTP id x16so1947183oic.6
	for <qemu-arm@nongnu.org>; Sun, 05 May 2019 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yZA//yKboVF/o1NlHhWCIer4wuOolNU3QH8fQ3xmRFc=;
	b=Rs+tcfguCwi04Vhm26LL8kg6MwF6H3KjSKsZfGVxgksrb+bB54wIwYtGOs9LktNAHz
	95qo85DoSZmedMmzEtqKlVyT6w+T8dn4i6Ikohdt1FG2l1LqOke49zZ+2CxCYezAKgOW
	T6gv6BXzRw5r+mnwwtd/X8CyRtEWq4QRJqXNtNPYbafyL5lHBaa7qIGbqn820+144H8d
	JQ4NQ4zw4xQkoZxs5uFmO3d+EbnUK4hXOglLQ2DJDCvUfENmC9jxBVOnywI5JNYk/arI
	CTWYyRefT4W2AWSnPLY7GcLLp6HefrfR5vgAAt7/TkeShBcckRaxYxs/3lnMFwzP1RWj
	8A3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yZA//yKboVF/o1NlHhWCIer4wuOolNU3QH8fQ3xmRFc=;
	b=ONRXGrN2Vm2itlykoUMsSbAbfnwYggBa9hTz/Ltrs7sf8PpwsH6PSPdmSIfTov6sBI
	JepkBmMJKPwcx3lYz5PVPXmq7JWunHPpB/S4xPJ0rhDLlUMaTBueaL1HRw52s9CnlMfk
	BwJQe8LDz95MVeC9/YjoBO7eqVkeuzMYfHr+CHp+p0sJe2QExAZe4UaBAkGPf9n8FRBD
	KI8ft0oEJXWjXLIRdZLUamCUjCrLZLy1hRE5kBYSRVpK3VX7zzhChq0NegH26Hz9Ldwg
	OXF68XIsue1tlNv6LdLrj2RMSSvW1B3i8fPIm2XiLwP0RrSE5j+LU/iz8F4DzKmw8rkU
	NZSA==
X-Gm-Message-State: APjAAAVtGPc/3X58wKIuojaJt0b6ZliZZkhx6AsK6+PcDihS7CVA21+5
	/igvlzD86MGeUreQuCIk4+0nRiG3YXcT8lJ76mqyVA==
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr5787264oif.98.1557070279548; 
	Sun, 05 May 2019 08:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAAVaN8zqOM4Fz3NfJ1gL9-G8WCBQyBt+p+Fgnrj3kgUwx2cKiA@mail.gmail.com>
In-Reply-To: <CAAVaN8zqOM4Fz3NfJ1gL9-G8WCBQyBt+p+Fgnrj3kgUwx2cKiA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 5 May 2019 16:31:08 +0100
Message-ID: <CAFEAcA_YU-MdnrCcSTyL3b93wTCCDzN0GcbSRe28ZPh14FPB6A@mail.gmail.com>
To: Andy Ng <andreas2025@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22a
Subject: Re: [Qemu-arm] qemu-system-arm with GPU support for QT with OpenGL
 on
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
X-TUID: zMiaLOTh6Hmg

On Sat, 4 May 2019 at 21:42, Andy Ng <andreas2025@gmail.com> wrote:
> I have tried to create Cortex-A9 images based on vexpress, however
> qemu will complain about the PCI. I have tried to use -M virt, but
> this one brings up cortex-A15, compatibility issue.
>
> Any ideas what would it be the best way forward to make it run on
> Qemu?   Do you know what is the best -M type that I have to use.

Our recommendation is to use "virt":
https://wiki.qemu.org/Documentation/Platforms/ARM#Guidelines_for_choosing_a_QEMU_machine

> realview-pbx-a9 ? I do not want to recompile the code in different
> architecture of CPU model.

Cortex-A9 and -A15 are very close -- any application level
code built for the A9 should run fine on QEMU's A15 model.
The kernel will obviously need to be built with "virt" board
support and Cortex-A15 support enabled, but you need to
build a kernel that works for the board model you select anyway.

thanks
-- PMM
