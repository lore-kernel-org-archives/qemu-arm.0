Received: by 10.223.159.82 with SMTP id f18csp560510wrg;
        Thu, 30 Nov 2017 04:14:57 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZ9Pp/H5QFHxWTivgznnBm+gdEldTYVjxVW+NX6hxRvITONJTyujhtjSvKvuPsdbIZ6FMT2
X-Received: by 10.37.174.85 with SMTP id g21mr1292480ybe.218.1512044097875;
        Thu, 30 Nov 2017 04:14:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512044097; cv=none;
        d=google.com; s=arc-20160816;
        b=aoeU29mXeozluuM1B/hhsB2wYIV5nOGZtHFW1orBOjkxcfxNOIoy3TM9T1J6tBq1lG
         M4y4DQYLQihpTeAHq18Rwfi/ceuW/8JRdsxKmKv0mxTUqm2xJf9mqNY643e9hU17DhSr
         guvM20rNzFwuFrHTTJFBLLFgWb92IVBcamUS8RvjKf/VwmiMBKGf49ho7oZSr/K342oV
         RGQ1Mg4WkcfeG5WVE3YB3aaVWQNxFlJXmLbvSe2NQGpaA+fuN+WxumpZ8Fkp928olbSZ
         CdjWy+MLStP/NjM/l5d88neaN1nSwS3wJa7lS85zetUTtRgHNwBcCzAacY6A+2Xz5H4i
         VEQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=7rHx3ei411hrgYoE2pAQ21/atnu9FfnP9GKnT7piTnI=;
        b=Gy4k3/RSbdna1RrvH2SmOV11Rf6fPXvTorM4hTQPdrfqlsBSRav3+Rq0L3gJQwvLuZ
         r26EuSrqpg1huNOhV3aKj8AdjiIsUD/GxFGzK/8TNQ9oBe/75ORPEKL1W7BysWI58Jjt
         gta89GDASPSzjiw2Z7Dg7LiLRqaWWuYnFQ3ewVuE5/hPG1UFetPCw/MfEuUQws849f2x
         Mv8A0Ky83eJF/6PqIiJxGke/NuQfoYT7GgwjFhD5P/YMB/zWLVJOIjEf62Oy8iK+BP2N
         mo+zPjgb2iKQrWuUBQ+7o6O1z51HND6Fn9CnrtTfmEF1oFqPWalvufBGIFYB+z9EKcyZ
         HARg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GvTTaIFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f188si458315ywd.32.2017.11.30.04.14.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 04:14:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GvTTaIFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKNk1-0005YN-91
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 07:14:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eKNjn-0005S0-S9
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 07:14:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eKNjn-00042Z-0S
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 07:14:43 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:34096)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eKNjm-00042K-OB
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 07:14:42 -0500
Received: by mail-oi0-x244.google.com with SMTP id u193so4677441oie.1
	for <qemu-arm@nongnu.org>; Thu, 30 Nov 2017 04:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7rHx3ei411hrgYoE2pAQ21/atnu9FfnP9GKnT7piTnI=;
	b=GvTTaIFLQtz/9xPIFX8eZRVcHYrjrbKBeEkl08sf4IJbSbh6WF7ETc8JfYamOAvx7g
	cf81t8L+g+ATpuDaDSI7ES9jLKqOuCV/zLKBHp/m/aATrbJer0+QNu5DqqLrhzv0FP3w
	GR/or1iYZsAGlCwt2fNRf4AMxNOAiO4bhVHEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7rHx3ei411hrgYoE2pAQ21/atnu9FfnP9GKnT7piTnI=;
	b=qIM0jRLUND1/lujyqsWeV2HEeLBH2FutiVShcSCg5aVtn1FkQ+BQ0sJEeqDe9gPFj1
	q0HcloUHL2cbnVWgWnuMQqVlogXyk5PRP8x/PUVDc+muV6ZlCA4kuGjQx3YOcR70bS8E
	957qyBSYlMuD9kRDX2v2lattCUQdwe2oVFZnUydO5kglFSLjq+XHzlflpzkjOSh6sB/u
	v49yoaqGYIItl5yr6uvUXwFBEY+ohd3K6RrZlFDz6WhBW/4xR1UTMWwRJM1D1Iu4bBFQ
	oJ7cEaVmniY820kk2wdMUa/2UhwxtPyLdHjJaSxitopWMEPjrGvKTyUOcAAKeXmHGxib
	FjAQ==
X-Gm-Message-State: AJaThX61hOlJeieJ+FgcyTcxj/TB4WLPUy8mTCtCOoXzhsGlkMsq+n0A
	v+dVw31/ag/tXjLWwaIHVZt1Vax4QwF1dRfbxU4cYw==
X-Received: by 10.202.213.151 with SMTP id m145mr4456878oig.328.1512044082049; 
	Thu, 30 Nov 2017 04:14:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Thu, 30 Nov 2017 04:14:21 -0800 (PST)
In-Reply-To: <1512031988-32490-4-git-send-email-thuth@redhat.com>
References: <1512031988-32490-1-git-send-email-thuth@redhat.com>
	<1512031988-32490-4-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Nov 2017 12:14:21 +0000
Message-ID: <CAFEAcA-LBOm=kHja3QJqOw-TT3GF9-i+wJfXdL-FU5NKimknzQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12 3/7]
 tests/boot-serial-test: Add support for the mcf5208evb board
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
Cc: Anthony Green <green@moxielogic.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0mXZRMnAYG/w

On 30 November 2017 at 08:53, Thomas Huth <thuth@redhat.com> wrote:
> We can output a character quite easily here with some few lines of
> assembly that we provide as a mini-kernel for this board.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/boot-serial-test.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tests/boot-serial-test.c b/tests/boot-serial-test.c
> index d997269..dd3828c 100644
> --- a/tests/boot-serial-test.c
> +++ b/tests/boot-serial-test.c
> @@ -16,6 +16,14 @@
>  #include "qemu/osdep.h"
>  #include "libqtest.h"
>
> +static const uint8_t kernel_mcf5208[] = {
> +    0x41, 0xf9, 0xfc, 0x06, 0x00, 0x00,     /* lea 0xfc060000,%a0 */
> +    0x10, 0x3c, 0x00, 0x54,                 /* move.b #'T',%d0 */
> +    0x11, 0x7c, 0x00, 0x04, 0x00, 0x08,     /* move.b #4,8(%a0)     Enable TX */
> +    0x11, 0x40, 0x00, 0x0c,                 /* move.b %d0,12(%a0)   Print 'T' */
> +    0x60, 0xfa                              /* bra.s  loop */
> +};

This approach doesn't seem to be scalable to me -- are we
really going to have 50 or more fragments of hand-coded hex in
this file to cover the various board models?

I'd much rather see us have a framework for being able
to build test blobs from source using a cross compiler
setup (and docker or similar so anybody can rebuild
the test blobs). That will be much easier to maintain
and easier to extend to having tests that test other
parts of the board or other aspects of TCG emulation.

thanks
-- PMM
