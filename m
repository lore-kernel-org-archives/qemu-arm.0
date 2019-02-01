Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp469785wrt;
        Fri, 1 Feb 2019 07:28:00 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6//jE0O0Xlk7zfCoGtIVp7YmYhQYj7Ta7Rkbs6OJRdzd8Jepxck1aWSVkAX9yCbdJVjlfn
X-Received: by 2002:a81:a155:: with SMTP id y82mr30318046ywg.400.1549034880450;
        Fri, 01 Feb 2019 07:28:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549034880; cv=none;
        d=google.com; s=arc-20160816;
        b=haGR35D6I2ZdIPDlLHMLYNAMNnDVcBxEUCK70BbdjAqBAZ6jBb5oadbzYZba4DOs+N
         p35oQkDFzkachPPYZjmTgyOPbMoyTOCiUoZM8vleIdFW81QDP1lvZQwiIMLqU95+fso5
         1BbOQUDRLCJv7RdslZcmuQZMSdsxwzzwa9U/tse6P39DvY9a10uRUPw8YpqtMkof7dWt
         3oFd1aQZUwzb7zglYtBlz1ulea1GbJ3AfDGjHADPFGX9rF4Le63UM7e84xpzJN1C1XNC
         m96ljVPkdKMawT7l37+dBG09xU/Uh/yGcjK9tsK+Cra0XLM4JTqffwUx7zHOWzsT8l4K
         oa5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=zc/4Am9ZiDJtEhSdYluuZU2Lj5Beek5vuuicYy0z+sM=;
        b=PciCrmsDDwGB6voWplllnO2jVM2cTy5W0M0jT4mX1Q498Jaf21S5eErwOXm6r6r/Yo
         /MhMpAnmDEXQWCIkJeyHwbJA61up379SI5fCHuqeQJaE41xNOEuXFTaG1f0rnVb5JiAy
         wlGDCA67YfZ2+Al5IHKcEhIgMG4yqNldoCihxxO3Bz8/D3e3WYFfsg8xmibTc1yVlyWr
         nwGcqNZOOcoENdlhn+BS+qSf/+bIRsDudMUzd1RMtpzY3TSg+7NiATrFolKgi1Dl+lxC
         QPaXLmEmU/NWl3fc6Iu5aj7TGfL+5Q79Si+fF/NuaHJi8gQDvpXPI+FmtFIeiiKDymwU
         c2OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BmRK0okQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11si5057997ywi.448.2019.02.01.07.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Feb 2019 07:28:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BmRK0okQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:56659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpajX-0004BY-U8
	for alex.bennee@linaro.org; Fri, 01 Feb 2019 10:27:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpajN-0004Ar-I0
	for qemu-arm@nongnu.org; Fri, 01 Feb 2019 10:27:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpajM-0001a0-L2
	for qemu-arm@nongnu.org; Fri, 01 Feb 2019 10:27:49 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37084)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gpajM-0001Vn-Df
	for qemu-arm@nongnu.org; Fri, 01 Feb 2019 10:27:48 -0500
Received: by mail-oi1-x243.google.com with SMTP id y23so6092118oia.4
	for <qemu-arm@nongnu.org>; Fri, 01 Feb 2019 07:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zc/4Am9ZiDJtEhSdYluuZU2Lj5Beek5vuuicYy0z+sM=;
	b=BmRK0okQbuhjjOa8qE+d31rw0jwEbKDqYbLzk4aoa0m+F3sITkM554+jG4pjtaxul5
	dKNhp7u8P/HQNH1KsJk1o0elwMLI2u8nG2Yq5t7wRH3IEh49kBPys5AiRBQ1eHux9cuc
	igrQovMgxmGx5JsLBAO1aUeiEP0B9Rl5708uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zc/4Am9ZiDJtEhSdYluuZU2Lj5Beek5vuuicYy0z+sM=;
	b=Fwm2KK/pEAMf4DZit8lFEWh5+QB6neugLkNgzAVQFgnTkaOlt+++OyYX95p8ORS9q9
	R9bSJGWKBTLe0CZ2BsKayb9YnLg3uIyL83jd92bobh02wmL/UA6EcQpUXLRjKi8sKQTJ
	ErmB2E97ThXfV0iqUoeLVBPCdt7U6zrm1jwnw0GqjLG1XWsmMfDT15IIQP4xO1CPdA9o
	m3ytUeqMd6D1EYs993x+TCLc+XxWPpkmaTeoB4sa1a7bA9rTcgOofvfPCwmQSvQ0BWi+
	LyMdtNxS9rOFnVX5zUYox/DjTGss9Zl4RiFFzg0vpuJJeyxt5QcBPvTPWVO0KCoPZAWY
	PItQ==
X-Gm-Message-State: AHQUAubMtRccL7uYcElM+xqMyrPKbBBEA5wjeQgZ3onEeZnuLGB8t5Yy
	PRvtoeZFMqvoR63bBxh0nCHNXetRFTTd5JPxeolbdw==
X-Received: by 2002:aca:2dc9:: with SMTP id
	t192mr19325357oit.325.1549034856858; 
	Fri, 01 Feb 2019 07:27:36 -0800 (PST)
MIME-Version: 1.0
References: <1648289.tQCHxfjYn9@basile.remlab.net>
In-Reply-To: <1648289.tQCHxfjYn9@basile.remlab.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Feb 2019 15:27:26 +0000
Message-ID: <CAFEAcA98cbqquL+mtz00XNgXoVuWqy66tvaw5pym02qy55ubUg@mail.gmail.com>
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH 0/3] target/arm: fix PAuth in user mode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6KIusKyFbGA3

On Fri, 25 Jan 2019 at 23:02, R=C3=A9mi Denis-Courmont <remi@remlab.net> wr=
ote:
>
>         Hello,
>
> As things stand, ARMv8.3-PAuth does not work in user mode. These tiny pat=
ches
> attempt to fix that.
>
> Br,
>
> ----------------------------------------------------------------
> Remi Denis-Courmont (3):
>       target/arm: fix AArch64 virtual address space size
>       target/arm: actually enable PAuth in user mode
>       target/arm: fix decoding of B{,L}RA{A,B}

Thanks for this patchset. I've applied patches 1 (v2) and 3
to my target-arm.next tree. (For patch 2 I prefer the approach
in Richard's patchset which deletes the cpu properties entirely.)

PS: for future patchsets, if you do a v2 of a patch it's better
to then resend the whole patchset as a fresh email thread (not a
followup. That makes our automated patch email handling tooling
happier as it can keep the v1 and v2 versions distinct.

thanks
-- PMM
