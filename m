Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4057873wru;
        Mon, 30 Jul 2018 11:02:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdTa1I8fJkUz9XarS+TuFm2UM4ziLapfUDzsDS+pKCFWAY95CCgY57Y7DN314Kc51u6ERty
X-Received: by 2002:a37:2a65:: with SMTP id q98-v6mr16531394qkh.174.1532973751588;
        Mon, 30 Jul 2018 11:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532973751; cv=none;
        d=google.com; s=arc-20160816;
        b=OgcNSiOIW/AZRSajGAm4N8a+XAJTS3aOL8GIQbXr7ZryjydkKxcbTNSSdeiTpmun8j
         huhADcqehMUuuRQeAsovxD/tjBGU159d+q+Z92sZg7oROTU7svPyqwpdfnUy+p9wJBp7
         lNlZWUiZSJi3YT8Ilwm+G3EAL0IWWCxxklWvnhspp6FiE1qZzP1zzmlKGnfmPW+XcCAg
         YIJxynnBC5WPKz67tQazveq1TIaNrKEQwcQi8X/kMYHL+zgssaPSIbwtWGbp9OYdU6JI
         wA3ksPlWpF3xcBU0QyPvHQqmFgsXTALO/XAaThj2uuzDDOkCSHpNkbtYRmTNcddtznEB
         KBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4Tl22w7Y4aiTck+Psuvfk1mKu4gldlJX4m4nXVLmolA=;
        b=FV601tdxJfrqFBEjztT0l3fUOrcKgw5Rft+8DSH+YZ9vyEqLnDvhEGmYw579g0DqaD
         91rcaIsZggC1/5Pyn8EiyvD8Kfc7lpuMWvbxJI5IZLq3EoZyNQQVMXQwATtml9BPzB0H
         jDq6X+xYstdcz99XJNDGMRxTQnZvWXMwNLz1OZI/lO2tJXjBJ6vZmd8BbB+iOYTYKDBX
         DkzaNZr5KTqI8Otp/magzHo/Xef3IP9KYUwC8kBrdrIwWEBiVJLjgFvNnB3PivI4fd5B
         69Hy6JQnVnFMy2bjuARA6EbNZJvCL+nabgUVMRWtDAUIEsz6vZ0ctzZoF4O1HNRlOPXU
         gOcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cO0bTg/3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y46-v6si724643qtc.394.2018.07.30.11.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 11:02:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cO0bTg/3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkCV5-0002rc-2I
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 14:02:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkCUp-0002rO-OV
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 14:02:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkCUo-0006S7-Se
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 14:02:15 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:43122)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fkCUo-0006Rp-O1
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 14:02:14 -0400
Received: by mail-oi0-x241.google.com with SMTP id b15-v6so22909968oib.10
	for <qemu-arm@nongnu.org>; Mon, 30 Jul 2018 11:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4Tl22w7Y4aiTck+Psuvfk1mKu4gldlJX4m4nXVLmolA=;
	b=cO0bTg/3snPX3DIgsZt0616+txefywhqGpHEOb8eT74bjQ+sOPjPYtNwO8nCMFUHdo
	lgj2+NFok0nkaD1fK2rw7Fd8Izr/gN/SoM+xE1yFYEYcwfrNVqi+3MHkxL2+6N8Ojy3B
	Fn0d8aMe00GJ0yX+9KxaW6kIR9N6WCZ+xnqWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4Tl22w7Y4aiTck+Psuvfk1mKu4gldlJX4m4nXVLmolA=;
	b=FykmPdJ8zLXBHWxmsdN/So2C6qpX3wXe2jIvkeX9d/J63kMSiyH3H3L7+1vPC1yNJO
	HHDGivjZ3QDK7c7QnTfFb8GERFQB+IFl/J8Sa1xh8Oyma6vTbsR9Jgmec0uJ2v+YjW9D
	A+2eDqrjiDyecp5gFCN63hOHelcU2Ja77I8BncHdf3B7OQ5cbolC5Lw5InQrSUSto9a9
	ukP5Kp8Y1l+aOkeddIjRWsea3X4iE1LxP1WwgBBjPYi4VuHXHAPTt62anYoWgJxOzFSO
	UJCjw87g6JuUDmT6jxX+obZmKTDKYL5o1af/0sC+AYdoWbeNqarmXCFsFGPoMZ3vi0gb
	zKtg==
X-Gm-Message-State: AOUpUlFLI7PbkmWGLQba0E/wu9zSPQ+UpFPTUVi/RZYDIuqUH6zc+atA
	rzGhZ35TpBDsF7/9T/oL75FHvMIjC44ZXob/v6J21g==
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr17075455oia.11.1532973733673; 
	Mon, 30 Jul 2018 11:02:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 11:01:53
	-0700 (PDT)
In-Reply-To: <20180725085944.11856-7-stefanha@redhat.com>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-7-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jul 2018 19:01:53 +0100
Message-ID: <CAFEAcA8m2f-DRiDNF0ry4nMH9bzZ1gODV4MTgtLwR5jTNdgeJA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v3 6/7] loader: Implement .hex file loader
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>, Liviu Ionescu <ilg@livius.net>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZNa2VGWrEKqw

On 25 July 2018 at 09:59, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> From: Su Hang <suhang16@mails.ucas.ac.cn>
>
> This patch adds Intel Hexadecimal Object File format support to the
> loader.  The file format specification is available here:
> http://www.piclist.com/techref/fileext/hex/intel.htm
>
> This file format is often used with microcontrollers such as the
> micro:bit, Arduino, STM32, etc.  Users expect to be able to run them
> directly with qemu -kernel program.hex instead of converting to ELF or
> binary.

I'm still not convinced we want to add another random
special case only-works-on-one-architecture-and-some-boards
feature to the -kernel command line option.

Adding it to the "generic loader" device might be more plausible?
Or just get the user to create ELF files or plain binary files,
both of which we already handle.

thanks
-- PMM
