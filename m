Received: by 10.28.4.212 with SMTP id 203csp3024994wme;
        Mon, 16 Apr 2018 12:42:47 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/a5sLjZzcQolOxnA5wH8LjHGC20vWEpm6J1yZGc04b52R0JqowqnbH4IChLxKU7ELVYb/m
X-Received: by 2002:a25:c283:: with SMTP id s125-v6mr12311961ybf.279.1523907766991;
        Mon, 16 Apr 2018 12:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523907766; cv=none;
        d=google.com; s=arc-20160816;
        b=lUK3LW3NHoCOTYl6OaCaLhITlQSpcaEodm4PNEeFipLbYzd4fEsKJj3s1ik19Yab0w
         kFgCISURbGrApSn+qw/SH82yTFLDUsKu7LfdQXErSvqlA/bm+J9Ms54HMJopaGlhHGpo
         khr6moeZQwEllvwwYW8h5/k23KP/0ezPWRHF0zm2EuFS+Zkdvqpt+Ffhh/wym3PGOE3D
         jrORLzYo8KZoPJxZjpi3I0i0njPBoBiWJHyo9p+jsPAuksLXco7CaiQVebnC6+JjcH6X
         429UR4+Qlo5g0uoiRn8Xz94sYPRoTN3Ahf1AZXP16Oivgex1TElbnapNhS4jYIRhC86v
         X2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=p29XJKc4mJfSfxHpNaM5M0x9S4Gu3nI6w8oeft8hwUU=;
        b=mENhzl356IK1Zm7zcb5NR0iiyQvJ4DuEcHBsfuqt/OS+XqiNAkG2OYd90EKqLj4Lgh
         Bhrw2+7+PURMTgxKnV8QI82OPpfXXExuSlhPiDxM7wydBJGAXV+5Tt749dSCJUgcTH+K
         XkKTnBQ3oKclEEHuW1My26dlcoCtgmu1N6fcWJnE/jJqaoXrkoqAZ38jxqFXVRa5I74W
         K6CQiaV8EwS4smwltDirddnEpuBks8ncIA5m+ZRy21wLGR8wdu7GRlsOLXOV8qOXVLqB
         04BnUnfhhYio6niPCk49CEmgfXwxnSWiFnFv5v7BlDoe5JQokQLL2KjLqIDarX4OSEkm
         tiKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X7Nn+6fh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s192si6135331qke.261.2018.04.16.12.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 12:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X7Nn+6fh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8A1W-0006f6-IG
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 15:42:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1f8A1J-0006dk-Va
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 15:42:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1f8A1G-0008Pd-Rt
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 15:42:33 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:45160)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1f8A1G-0008Of-LR
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 15:42:30 -0400
Received: by mail-pg0-x243.google.com with SMTP id z21so592175pgv.12
	for <qemu-arm@nongnu.org>; Mon, 16 Apr 2018 12:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=p29XJKc4mJfSfxHpNaM5M0x9S4Gu3nI6w8oeft8hwUU=;
	b=X7Nn+6fhsCcCDNUr2xdpXofkvEa2X59rkc0QQUsm1DIM0QztlQIbvR2EcjO4Xru6XC
	ZV17pQpd3kAGdJHHw1GevOZYpXq9SP1HUUYtm296AI7fNsya8UIOVpI4sy4PaseSWXOC
	r15AwTznA5qE3PY/FTnPrBAg82RglFplAJP5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=p29XJKc4mJfSfxHpNaM5M0x9S4Gu3nI6w8oeft8hwUU=;
	b=O66L/DGxeYGewJB32JOKc2Ia7eNNeC0np+xsJw+vSQoobd6/0GMpI3uiM0nfBxu5/7
	sCe38tQkiQQW9/PHIubGndy9kpeUAZABTT+2xzUhxzW1wd44Vs6OKeKZy+WVnwlPy+HO
	j/2vAnmj00CKeXQIl7FdN1113gPb4NlVGQN27jy6JDPIN32BJlFNaPVzAjOxq/FfRiDc
	5r6ky0ef5oaMTXIv+AH3fukA9XoVMOchj0q7whytBMvZ1mFsFqU8I5VfHFeco44kDJAW
	dPGK5GBsjWoDxQoMAQovHqpRsQ/f/yBAjTPlran7VM7aueHi8Ozt/efBQp0lh9N2QVUB
	UzfA==
X-Gm-Message-State: ALQs6tDQhLeyIMQHC+V09LcC3PJY7y0fAIoX9Ow1+E1+Y0+Xb5VGPHeC
	u9bD6IVOuH15MvplCCspJdfrXQ==
X-Received: by 10.98.83.199 with SMTP id h190mr6361581pfb.146.1523907749618;
	Mon, 16 Apr 2018 12:42:29 -0700 (PDT)
Received: from cloudburst.twiddle.net (cpe-66-75-76-48.hawaii.res.rr.com.
	[66.75.76.48]) by smtp.gmail.com with ESMTPSA id
	f19sm31345260pfd.19.2018.04.16.12.42.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Apr 2018 12:42:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180416151923.22588-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b0d166e4-b84d-e450-b46b-73b609c1185a@linaro.org>
Date: Mon, 16 Apr 2018 09:42:25 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180416151923.22588-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-arm] [Qemu-devel] [prefix=PATCH for-2.12?] linux-user:
 check that all of AArch64 SVE extended sigframe is writable
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t/MUX1mwWwT7

On 04/16/2018 05:19 AM, Peter Maydell wrote:
> In commit 8c5931de0ac7738809 we added support for SVE extended
> sigframe records.  These mean that the signal frame might now be
> larger than the size of the target_rt_sigframe record, so make sure
> we call lock_user on the entire frame size when we're creating it.
> (The code for restoring the signal frame already correctly handles
> the extended records by locking the 'extra' section separately to the
> main section.)
> 
> In particular, this fixes a bug even for non-SVE signal frames,
> because it extends the locked section to cover the
> target_rt_frame_record. Previously this was part of 'struct
> target_rt_sigframe', but in commit e1eecd1d9d4c1ade3 we pulled
> it out into its own struct, and so locking the target_rt_sigframe
> alone doesn't cover it. This bug would mean that we would fail
> to correctly handle the case where a signal was taken with
> SP pointing 16 bytes into an unwritable page, with the page
> immediately below it in memory being writable.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The requirements to trigger the bug sound implausible, except
> that the stack page might be unwritable because we just
> executed some trampoline code from it, so perhaps not so
> unlikely as it first seems? Not sure whether to put into 2.12
> or not...
> ---
>  linux-user/signal.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Yes, let's just go ahead and fix this all properly now.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
