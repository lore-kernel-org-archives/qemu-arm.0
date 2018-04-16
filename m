Received: by 10.28.4.212 with SMTP id 203csp2717671wme;
        Mon, 16 Apr 2018 07:31:02 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/NI01ha90YYgnYvLyFvcFw0XIBn5NDaME/30HfE7ZsRV71TkBQcWSWiIPPafwJtFGpa58N
X-Received: by 10.237.41.101 with SMTP id s92mr15002123qtd.114.1523889061823;
        Mon, 16 Apr 2018 07:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523889061; cv=none;
        d=google.com; s=arc-20160816;
        b=05n6jVVRhAU+/LxzLKlfXoHFoXVfMM6vKP17IBA/Vs3akuODBIPIhX7grl/FW58GnG
         J+bBjPtUJ5Soy9YTMNWR6CyvwozZYLVEtvcocjmzH/ds2wqqblMOs0KjO2+dr4GV51s6
         Eq8ykGv0tyXVT/CAfN7pyDl4rLAu7g3R166xVHknP/knIEKDPPi8icqvPNzqDARtPLQU
         80rDM1rp/rTNgvl1NJ8uvM2w0501/4ZMHyUZ7wf+aLH1t1DVjF1QdOA8ROlijUemDFNx
         UD+sjwAB1rbE5XOR0UZVg71MU5KwQcKJsA5V1Q0l/S9ZtDM9yAq6amsXeTFhzwbRU9iL
         OGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=EyjVnTLfVCKCHQQ5+I+72qu+vf0o2VEG9daRAgDZUOE=;
        b=NyFFugNc6SVWysDOcivfNrwM5OXxntM8lqJIJcD4ZpJs2ZcgSA1lG5UvPHOAKNPgEx
         9rhdjDdKf3kZg1+5trpIKAriwz5Ipd/t2eX8NmVTyY+0RjbqGyrHdy8gbHiNSEiCFOMV
         MP0epGvYQG+NUtTvD+VnqAYB9JG055rv2D1Cn/iOIUtGlW1U/wbTkhVEV352K4FJjQTk
         OGXP8wf0DEO9V2HQHBFngKsrksqGB+QI1MESIUj2sNDgXcqjC9P8+CsgAjhM4whtMWWo
         0aNEjHsg2v8VrLNw7bzk5WucXoKlqqSJafqVkpcZ4Brj/VIJGfCIHqpUXLEXzvF806eU
         02YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I/5/CmOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p123si3207080qkd.218.2018.04.16.07.31.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 07:31:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I/5/CmOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49923 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f859p-0005YW-9d
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 10:31:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f859W-0005QS-3q
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 10:30:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f859Q-0006Sr-83
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 10:30:42 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:46777)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f859Q-0006SR-38
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 10:30:36 -0400
Received: by mail-oi0-x242.google.com with SMTP id e123-v6so14685098oih.13
	for <qemu-arm@nongnu.org>; Mon, 16 Apr 2018 07:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EyjVnTLfVCKCHQQ5+I+72qu+vf0o2VEG9daRAgDZUOE=;
	b=I/5/CmOVw09bgpXvQ5bTNc1uqJmXru9ZXO6HBDAfoEcc8QC3JnzzxyLqhiF9HgV6LN
	WczljjPv9A85jvMYZivtusVc5JJ5RsRwuTgv1ttZ+RRcEmFXx1H9XsI7mnl5tJL8wJuk
	I2rzXjgZ4a3xUa+H7wbTz86GVyILU87ybBeNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EyjVnTLfVCKCHQQ5+I+72qu+vf0o2VEG9daRAgDZUOE=;
	b=sb7Gf0TBSndv3L2BWI4kktGzX6z8R7BjlBzML+ejbluGM9pqXjZS08Sy+0CB8WiRdk
	tOIprxX2Bdkxxs7LxrJ1BHVe3WgH6R/dXM5yFG3p/bACbW/YUTdR/+qFqZnKZr+eHU7q
	rcsxd9uofo+/YEaHRC6GkySo7b8XkKNwUPuex8tQEK7dAQUlYgZhURy5GjSA7TyGv8qd
	1nba4rqkkMi45cUR2wL/MTa/x4ERWclgkR6QBsPeAtOM1Ep8cVKVbelCo1y6WWf+NeGH
	8DzOs/RAlEhaZo3ys679NO99DINx6c+MZf7CzFFueg2kxkRJ5N+0zn49DGPur8WqZAP0
	ftuA==
X-Gm-Message-State: ALQs6tBwuxl/zVMtjau1D/17e3mQ3Py5KwOZV7jewxmIw90PtyegriKs
	yOh8A6dJpb4DRzF+DG+SVlG/KUou4atGT0BEPxjOfg==
X-Received: by 2002:aca:e043:: with SMTP id
	x64-v6mr14096559oig.164.1523889035499; 
	Mon, 16 Apr 2018 07:30:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 07:30:14
	-0700 (PDT)
In-Reply-To: <a11d7ba8-4b29-5970-9574-b2ee2fa5c8c9@linaro.org>
References: <20180412140222.2096-1-peter.maydell@linaro.org>
	<a11d7ba8-4b29-5970-9574-b2ee2fa5c8c9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 15:30:14 +0100
Message-ID: <CAFEAcA81fMyUdTAz2d1NkV2gk_hXFdz1PTVgZjq8kVefPz4-2A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12] linux-user/signal.c:
 Put AArch64 frame record in the right place
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
Cc: "patches@linaro.org" <patches@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lWVM0ZG2lxl4

On 13 April 2018 at 05:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 04/12/2018 04:02 AM, Peter Maydell wrote:
>> AArch64 stack frames include a 'frame record' which holds a pointer
>> to the next frame record in the chain and the LR on entry to the
>> function. The procedure calling standard doesn't mandate where
>> exactly this frame record is in the stack frame, but for signal
>> frames the kernel puts it right at the top. We used to put it
>> there too, but in commit 7f0f4208b3a96f22 we accidentally put
>> the "enlarge to the 4K reserved space minimum" check after the
>> "allow for the frame record" code, rather than before it, with
>> the effect that the frame record would be inside the reserved
>> space and immediately after the last used part of it.
>>
>> Move the frame record back out of the reserved space to where
>> we used to put it.
>>
>> This bug shouldn't break any sensible guest code, but test
>> programs that deliberately look at the internal details
>> of the signal frame layout will not find what they are
>> expecting to see.
>>
>> Fixes: 7f0f4208b3a96f22
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> I'm marking this as for-2.12 on the basis that it puts our frame
>> layout back to exactly what 2.11 had, and so seems safest.
>> No sensible guest code should really care, though, so this is
>> in the "only if we're doing an rc4" bucket; but I think that the
>> softfloat fixes deserve an rc4 anyway.

We needed an rc4, so I've applied this to master.

-- PMM
