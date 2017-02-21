Received: by 10.103.98.197 with SMTP id w188csp434382vsb;
        Tue, 21 Feb 2017 07:24:55 -0800 (PST)
X-Received: by 10.55.146.4 with SMTP id u4mr24108677qkd.37.1487690695201;
        Tue, 21 Feb 2017 07:24:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r3si15322959qkb.62.2017.02.21.07.24.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 07:24:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgCJA-0006tT-ME
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 10:24:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgBj7-0005wN-33
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 09:47:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgBj6-000248-Ap
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 09:47:37 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:34596)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cgBj6-00023r-4Z
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 09:47:36 -0500
Received: by mail-wm0-x234.google.com with SMTP id 196so29530327wmm.1
	for <qemu-devel@nongnu.org>; Tue, 21 Feb 2017 06:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OlJ64C3MmQLbVD9E1vmLstXSLxSPqsI8RT3aO5qcto8=;
	b=ksVx0RALmHDG0qhK0/kuiFPY0cAUHmjcnd3YTXI1qT1LzjAVomSsV2aVn9+8U6+y33
	UmwL1z9mzz3cQNWa3Yr9v9tvxi25lI7M1HPJUR+RZI+6D9VyBFtqjg7NozSJW3w1fkha
	7DXlMud3gM100+EgLw2LR2uexJCekagB1dH7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OlJ64C3MmQLbVD9E1vmLstXSLxSPqsI8RT3aO5qcto8=;
	b=VmMN11GsajFpjlezodjnLxImqNljmBtBBC1Yt7TRbwUjOW2VjCI8d7XyVuTBsG7SsH
	9CfNHB0Xdf2Yrtx3rD+E8O8hCUVNkg91qwb/wWGB9E87abfLjI2utm/cu2vkKLyChu3p
	hFp5o0DKo7mNdluHeoB/ErMxB3A3+d3fe4SjFgAM/8LX/wY5X9DtCItQj3VJLBNfFpHj
	HD3k5VzSRg0HPfQEfFoyyvtQw8ZcvJsGeotSem5fgx1WUsa2ovBRb6DoQF/49NlxQsF8
	vQgZldySuWBj5GEUVRtIPSfDORPAa3jImRUUFza78VRWSiqMssnwKeY9aH2uGJxCUwiD
	9wJw==
X-Gm-Message-State: AMke39kcD9KorHVnvqUw5QZ0d8KQzKd+hkdlz/PX+b6SU3R/EZjLQi7rSKHBjrr6CHSy4dKHdw6Vx6Nyh/sla53C
X-Received: by 10.28.55.199 with SMTP id e190mr24361273wma.92.1487688454715;
	Tue, 21 Feb 2017 06:47:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 21 Feb 2017 06:47:14 -0800 (PST)
In-Reply-To: <332706f6-7b54-89db-6b89-5684362fb2e3@ispras.ru>
References: <076b0d94-738e-252c-1ed8-4640a864ac34@ispras.ru>
	<CAFEAcA-zURkUb28wVA347AFJX5Wa4GyXbFSVmUDH1BSXRMA+rQ@mail.gmail.com>
	<4d2f2d04-e294-bdad-4f77-9a0171357d05@ispras.ru>
	<332706f6-7b54-89db-6b89-5684362fb2e3@ispras.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2017 14:47:14 +0000
Message-ID: <CAFEAcA-cQwhF5B8cZHVZsJvde_NHhL8iPr4ATr0y=a2yyg1n1w@mail.gmail.com>
To: Kurban Mallachiev <mallachiev@ispras.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
Subject: Re: [Qemu-devel] [PATCH v3] ARM i.MX timers: fix software reset
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: milNdwCvxBy0

On 19 February 2017 at 19:00, Kurban Mallachiev <mallachiev@ispras.ru> wrote:
> Hello!
>
> Problem: function imx_gpt_reset is used for soft (requested by guest) and
> hard resets. But soft and hard resets should have different behaviour (hard
> reset should clear all registers, while soft reset should preserve some
> bits).
>
> Patch changelog:
> v1 -> v2: use different approach, patch completely rewritten
> v2 -> v3: in software reset add preserving of CLKSRC bit as manual says
>
> ---
> Software reset function clears CR bits that should not be cleared and
> preserve bits that should be cleared.
>
> Signed-off-by: Kurban Mallachiev <mallachiev@ispras.ru>

Thanks for this patch -- I have added it to my target-arm queue
(with a few tweaks).

Unfortunately your mail client mangled the patch a bit, and I had
to apply it manually. I'm happy to do that for occasional contributions,
but if you're planning to submit a lot of patches in the near future
you might like to look at your patch submission workflow (we usually
recommend 'git send-email').

thanks
-- PMM
