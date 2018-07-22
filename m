Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5010009wru;
        Sun, 22 Jul 2018 14:32:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdNzmg0RccYoNcQPPXIJjDE/U7HtvzqzebV2OsdyNKG3HHK/axDkeKlR66iqiENXUMBunIF
X-Received: by 2002:a37:3a45:: with SMTP id h66-v6mr9536611qka.118.1532295122178;
        Sun, 22 Jul 2018 14:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532295122; cv=none;
        d=google.com; s=arc-20160816;
        b=YOrQeYkXX4FMshTGodgMwNUP8yw4ZXTXWrvBrl63wRWaTgQVc6GUUXXs21+v/w/0Pk
         V1oJ8HHuD6sxBSICYVlR49K+a7PEV7YC7zP6AWUIL81iQ7F1hE4whjIpRTtvGflrTlPQ
         lfuMdGFqw0hoWtH0V4pIVpOu9lhsCYNmvDf3Dvzxd6ePAXY8yBNjn1YMuIOYnYmkHATJ
         ofi49LsQVxjlsDhOzF+KsHER3h0MGhhpV0LmUvZPzbTKIuqVPowZBvEjGw1C5lzYu/+U
         NdIGz8gsgqnj3mRj0o/WWsZvX/Bv/+QXAwxoeUH9RiV8Z1QUSQ9Xw7tw9s31wuMg7m0w
         tKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=VJB1A6ngQrMEhClkqvaQsw0Us7eYpyyVIjeX3DNmkHc=;
        b=rpOS586CwfIgeHNQfFHfzrlAZjpGP5REUmY1m4kc2ybMeYfVWcjmJWeridVakKoZvL
         G1AquI0mzbV12ptuSUAu2oYV5xaJIMq6FPAk3FLsCsnEgM72f9ryY3iGrkKpGrQokAF/
         iyMUyJj/Y8uVLMQwmBmUSlT9FLz2x0HJDkTZxnHWA2xwhEjej6p9lzvuZ8HeGBRVtT3g
         J8AN5W+4WBSwwRcYP4xayiA7xMHgD7czN2i33XASBdjWzsseiuIK0RjAKtHXza3xlnAJ
         yDZ4EZrBcD3AS34qcYxGhZtjLYy48VyAH9ew81eIA89/bDEB/NtWs29tkpRAdWK7JF6E
         lxUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W97BVvH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f39-v6si7495479qtk.237.2018.07.22.14.32.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Jul 2018 14:32:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W97BVvH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhLxR-0001MS-Mg
	for alex.bennee@linaro.org; Sun, 22 Jul 2018 17:32:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fhLwp-00018e-Tx
	for qemu-arm@nongnu.org; Sun, 22 Jul 2018 17:31:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fhLwp-00017n-5Z
	for qemu-arm@nongnu.org; Sun, 22 Jul 2018 17:31:23 -0400
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:46945)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fhLwo-00017S-Mt
	for qemu-arm@nongnu.org; Sun, 22 Jul 2018 17:31:23 -0400
Received: by mail-pl0-x242.google.com with SMTP id t17-v6so4805129ply.13
	for <qemu-arm@nongnu.org>; Sun, 22 Jul 2018 14:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=VJB1A6ngQrMEhClkqvaQsw0Us7eYpyyVIjeX3DNmkHc=;
	b=W97BVvH3Hy+b1wViSfO3RrZsjuOnP1Y7vJQbJHdrRXWste6pOYlQIG0dLwHeqJ2DgY
	ksGq9m5CsKIVAkLc09N3H7b8/vFEyKrnC6mOKiER09f/ohcQpemrp/j5xo0QMST+aANP
	C8eFkEocQddf1e4lmlm5stpegZZJLlcIzw58E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VJB1A6ngQrMEhClkqvaQsw0Us7eYpyyVIjeX3DNmkHc=;
	b=ZOsFc+FqLrg6K5HKHZKXfal/BLwV4p2ydyZ1c09QWf+vxchDMvsAdK27mlmKWfsZFt
	9uEpFgdPoYDy8rr/IRNeOgXzVld/izf+NP9odtawq0QetEXGDotgCtVxqDpVpg0pdhg3
	V/1GRkHXpWEYCCrrck1mnPNanfHaU3gDj6586TGrKbwkjh4a/d6hy2CleaWmPHft0UNq
	esQfNE14KcxHDeFnX3JJPGsuqopTVYBPuCDeHwZEF7Xr6oHbS9fsW6kVhik7CIvNIgaH
	Buh5KE/Wtw4jLrZXcFtNyHhVPqol+VK8pS0JmZp/NPF+Ek+XLclW2mkTqDAnH421K801
	DeVw==
X-Gm-Message-State: AOUpUlHsYlC6SDxmTpWpa8r+R9M89IsrFJw3oCg1WPUhqPNTu9Q/Zkiw
	w0FsMM60U02Z1KWmj0zDHspaskRGk1s=
X-Received: by 2002:a17:902:22e:: with SMTP id
	43-v6mr10581302plc.82.1532295081468; 
	Sun, 22 Jul 2018 14:31:21 -0700 (PDT)
Received: from cloudburst.twiddle.net ([2601:1c0:6100:a92d::e452])
	by smtp.gmail.com with ESMTPSA id
	t19-v6sm8108502pfk.182.2018.07.22.14.31.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 22 Jul 2018 14:31:20 -0700 (PDT)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <CAHmME9q8b0Nss8b7DEoGgqoCK4dEvasQN64QWx6Hio+N92wuSg@mail.gmail.com>
	<CAHmME9qX22YP9qrHErc43Z+LUi=ichqzG+OdXqjhJv4ZrKDmWQ@mail.gmail.com>
	<CAHmME9qMASSt2K4vACJTMiGNTt09upRhNFxL_y2KF1G3N1LB2g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b20edb3f-055a-c531-da70-d20a20137ad4@linaro.org>
Date: Sun, 22 Jul 2018 14:31:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9qMASSt2K4vACJTMiGNTt09upRhNFxL_y2KF1G3N1LB2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: Re: [Qemu-arm] [Qemu-devel] ARM64 STR Instruction Crash Regression
 in TCG
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0c0BNuVjIQhe

On 07/22/2018 01:47 PM, Jason A. Donenfeld wrote:
> Hello,
> 
> Gcc 7.3 compiles bash's array_flush's dual assignment using:
> 
> STP             X20, X20, [X20,#0x10]
> 
> But gcc 8.1 compiles it as:
> 
> STR             Q0, [X20,#0x10]
> 
> Real processors seem okay, and qemu 2.11 seems okay. But qemu 2.12
> results in a segfaulting process. I'm pretty sure this is a TCG bug.
> 
> In the attached tarball, please find kernel and run.sh. Calling
> ./run.sh will start the kernel with the bad bash executable that tries
> to execute `config=({1..100000})` and crashes. Also included in there
> is the actual crashing bash binary, in case you'd like to disassemble
> a little bit.

Interesting.  The test passes on master with --enable-debug, but fails when
qemu is compiled with optimization...

I'll dig a bit deeper.


r~
