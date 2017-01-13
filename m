Received: by 10.25.205.13 with SMTP id d13csp182815lfg;
        Fri, 13 Jan 2017 04:43:51 -0800 (PST)
X-Received: by 10.55.104.22 with SMTP id d22mr17379919qkc.127.1484311431342;
        Fri, 13 Jan 2017 04:43:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q3si8334183qkd.22.2017.01.13.04.43.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jan 2017 04:43:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cS1Cw-0008Lr-Pb
	for alex.bennee@linaro.org; Fri, 13 Jan 2017 07:43:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cS1Cr-0008Lb-T3
	for qemu-arm@nongnu.org; Fri, 13 Jan 2017 07:43:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cS1Cr-0000LB-0g
	for qemu-arm@nongnu.org; Fri, 13 Jan 2017 07:43:45 -0500
Received: from mail-ua0-x229.google.com ([2607:f8b0:400c:c08::229]:34925)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cS1Cq-0000KV-OC
	for qemu-arm@nongnu.org; Fri, 13 Jan 2017 07:43:44 -0500
Received: by mail-ua0-x229.google.com with SMTP id y9so36050153uae.2
	for <qemu-arm@nongnu.org>; Fri, 13 Jan 2017 04:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZmSEIYS4iA5qX0ZpUzLLVCXfTkzEbS4iup658r+MaoY=;
	b=PJKYyasLLrpxJN15QeMjML86g1pBSxr5n4aOiBKHHmxUySy2OmM3Adt8T2boPOavdD
	omWJnh5BbOv94SzIgIBXAa1mSDsjTWvN3RKTjrIv/paM/FQEwlLpSoQxXjrJ/ClhNqNT
	OK/AkKZIH425gP3OJovtj5BSoemDqr8z6LGZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZmSEIYS4iA5qX0ZpUzLLVCXfTkzEbS4iup658r+MaoY=;
	b=ZkI+Ti7tKdXPeoQ8QVQtgxFt3AFD0Cjw/UxJHiyxGROws/I5sKt70z95/3jEpwJJ/E
	cLDG11Pi13wpR5sF1K1MgDymo/xvxHVO72Ku823qwgiTZxUZxhoDhANqhhT6zK47I7mI
	h45T5ipF/pi/s2WFeNhWnvpjagseiqgI+E6Jz6Jv59JEkTYwO4nmvS99ovwNwx50gCQF
	5WbwpGYSUPdD0MLRjYmZuiV5t7uGfEyJeKHWbSEjDDrMd3qg3PcmXSLDp+BSX4w6jnlT
	DhFO8gZrP4eBr2cISh5q4KBGYllNd5y92F5chD/96Hda0VZvWJ49FiliQrG4zZ/TNy9/
	Btlw==
X-Gm-Message-State: AIkVDXIO4Jx2VeTRauNnOd6+NFzlmjvC8Wfz3ZDyO4+obvMsqPmjU+kCxBc8/ZiIu0SM73BamZs+rTeAuvSgd1ZJ
X-Received: by 10.176.3.196 with SMTP id 62mr9000057uau.120.1484311423982;
	Fri, 13 Jan 2017 04:43:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 13 Jan 2017 04:43:23 -0800 (PST)
In-Reply-To: <CAF++6AOnuOzwiiPRJEGatzX7LuoJKU5ij2xWRLkKbxhytJscqA@mail.gmail.com>
References: <CAF++6AOnuOzwiiPRJEGatzX7LuoJKU5ij2xWRLkKbxhytJscqA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2017 12:43:23 +0000
Message-ID: <CAFEAcA87460MwQA2bjOxm-z6nfkNobQZC8X1qEFKZioWsznR3A@mail.gmail.com>
To: James Hanley <jhanley@dgtlrift.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::229
Subject: Re: [Qemu-arm] [Qemu-discuss] system_clock_scale unset in
 hw/intc/armv7m_nvic.c
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
	qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hws4z7Fs9qUs

On 13 January 2017 at 12:35, James Hanley <jhanley@dgtlrift.com> wrote:
> How should system_clock_scale be set in hw/intc/armv7m_nvic.c - there is no
> API for the global, and I've defaulted the global to SYSTICK_SCALE which
> seems to work, but is not obvious.  This was needed as this value was set to
> zero and the arm firmware was selecting the external clock source causing
> zero to be returned from systick_scale() and the interrupt to run
> continuously.

If I recall correctly, this is an external-to-the-CPU thing
(wired up by the SoC or the board), which suggests that it
ought to be a property on the CPU object (or perhaps on a
currently-nonexistent container object which has the CPU
and the NVIC and the other M profile devices).

As the code stands today, I think the answer is that the
board has to set the global -- this is what stellaris.c does.

thanks
-- PMM
