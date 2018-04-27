Received: by 10.28.4.212 with SMTP id 203csp888281wme;
        Fri, 27 Apr 2018 08:17:52 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrzh/r3PkkCFuLqmDJ8BUB9fIwd3GwelO+4Sy+GoX/g/RloGeMfQ/8KhwH2Q0o1/kn1IJed
X-Received: by 2002:aed:3069:: with SMTP id 96-v6mr2423015qte.283.1524842272736;
        Fri, 27 Apr 2018 08:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524842272; cv=none;
        d=google.com; s=arc-20160816;
        b=N9nc0/l3hQ5T3j6ozHAkOOCHbVn900FT7KDgawm3Pn+hfmSFSBo/figIhSG9Kb6CXa
         HBytveCzrU1ZR2x9Yq0LTZ05aIhKDjkRlcgiEtSy1B6BTycJIp4aTVUK+jgnsCFRo3FR
         B3l/kKRmh9Bcc6Kg1xU0WgZ4aTo1J/qEt+HCdmJEUOaHpjXVDkHb78alsYKqZO/yzIRe
         0aG5i6+F3bvp+VN6e7NuY2wWjsK8KnAbQQGVES5JQ2aYjlmR4DyOhVnLxz8ZW/Bqn/sU
         yy2pXMTuF4n6HOKYexEEuZjdHK+iGQAQ3f6qpO0Iy1IRtcacj1SggfFJXhAE4yCvi9n/
         Q7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=x5g4Sa8NRQ9llAp2V44kI6ReX/Kmdu653CIjgwpVbV4=;
        b=jx0LR9qYYZyHH0SX1/raZV2qLlNv/ozAZq6w7IobOMzLI5wYemrMdqpPhdCGxwNb5E
         9mqRfMEGnELFU4mU4kQvQiD5K7f+kLdtnlFedGrCB8Cnll0f3f4gFxozQSQ8wL/ur1Rl
         6ZmctFYT9rTjyQpcys7OzEfkinCXt7VWQuHEXMsm4DaAa092cvpJ5fTsfAnEJdWc+5J9
         Thk7y7kFOkU+wjBmfsjjltUpHk0ZWqAiDx/ZU3IkPE/KsHGWLzpzxV+BoPWCKk+serJS
         ElJuaytrTe1iIN4sLAKnN9e6pNo4BtvxfFyB++VGo8/cVG37VMw+c4JcaPrp+9cAl/KG
         EpzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g89Fd1Rj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l9-v6si1567240qtp.398.2018.04.27.08.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 08:17:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g89Fd1Rj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fC58C-0003PP-6O
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 11:17:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1fC4xa-0002da-OV
	for qemu-devel@nongnu.org; Fri, 27 Apr 2018 11:06:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1fC4xY-0003j8-QB
	for qemu-devel@nongnu.org; Fri, 27 Apr 2018 11:06:54 -0400
Received: from mail-yb0-x229.google.com ([2607:f8b0:4002:c09::229]:43134)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1fC4xY-0003ir-Lc; Fri, 27 Apr 2018 11:06:52 -0400
Received: by mail-yb0-x229.google.com with SMTP id y123-v6so721310ybe.10;
	Fri, 27 Apr 2018 08:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x5g4Sa8NRQ9llAp2V44kI6ReX/Kmdu653CIjgwpVbV4=;
	b=g89Fd1Rj3G1EazJHbTLuOL0HK2bzeWz2KVbTQ+5mfxlAeEUG4FAHYi4jW716Aktvex
	V3CAeqsViYl/bFKZR/BhBAefKsgcbNVF/SE0owE3rEV5prsqOFaKzqwPhkFkSdIDjFH0
	mPmuYZlM+rH8xiskZGbKdbCjEnd2wp3GdezbzHxvVLimV0U/sMXLGJIs2d7vUrmGcdL2
	f8jr9fc3T4fdAr4TnfqKLxoCIgfWGBGcwa3wWBxbBtyJS9IwrlnmsSvnyFbeZ0GaNVqX
	HPaXZ3cOfLx9mmmJYmd+VGznNwzXnNkbSXIi9YFieuGNPmRLwD2dWYvAxknSZX1fZNFN
	F55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x5g4Sa8NRQ9llAp2V44kI6ReX/Kmdu653CIjgwpVbV4=;
	b=q6EpjgCbe0w6Rfd51aeC7BD7+1+GMIkCEusSf+glGB6S/XvVY0lt5xM7LFqzUGJgTL
	+30gXJ8ewniKVrvpsxjgzMRUEKihaiJfH+icR5eszRRW3bX2uYhYDr6pN4mg60vo3Qae
	/708JRcGnMz3hkunJH0SamP08ivdfFi6RDZ9ydIoezcSAlFGHpC5eDEtjEP9KXkK51ZP
	o72L9RaSn9aNoNc/Cw2Q3ZwKWyIVBUUVsAHXj5/P6ZT2dHlZ4lx91/oc4APWYSLS1Znm
	Xizn1cC3aepGgi9OkuqOPry1INDclhdYJ+jD2PcrlDLobyMXKg7ZgtvfcFwzn7GNR+Ri
	5eTg==
X-Gm-Message-State: ALQs6tBqk99CULgWT+7PM3hK+/Xg770EEWu+/8983jE0lRj3ZJpCE0oN
	ZFjhmlJkapKeNCJIsVYFnUB0QNGkz4dVJmSHKzs=
X-Received: by 2002:a25:20d7:: with SMTP id
	g206-v6mr1377331ybg.71.1524841612169; 
	Fri, 27 Apr 2018 08:06:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3752:0:0:0:0:0 with HTTP; Fri, 27 Apr 2018 08:06:51
	-0700 (PDT)
In-Reply-To: <20180427002651.28356-4-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-4-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 27 Apr 2018 08:06:51 -0700
Message-ID: <CAMo8Bf+z2w5hhdwQ+8zUoTeCUK3iCSeAeirB4tX7FvF8o14-tA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::229
Subject: Re: [Qemu-devel] [PATCH 3/9] target/xtensa: Use new min/max
 expanders
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XLD0LEPoUu0t

On Thu, Apr 26, 2018 at 5:26 PM, Richard Henderson
<richard.henderson@linaro.org> wrote:
> The generic expanders replace nearly identical code in the translator.
>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 50 +++++++++++++++++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 17 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
