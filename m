Received: by 10.28.4.212 with SMTP id 203csp3722407wme;
        Tue, 17 Apr 2018 04:53:02 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49MUptm8DVqLqTe3TGztvjdCOSodb6rglmDERRH4xNI1ui4tY1gHcSR10RwyVEZTuskwWY8
X-Received: by 10.200.37.111 with SMTP id 44mr2062010qtn.239.1523965982288;
        Tue, 17 Apr 2018 04:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523965982; cv=none;
        d=google.com; s=arc-20160816;
        b=FI/Lrx0K/sf9AtXbVjfCJFilKLnCxnZ9EQFlDADFmmfG4LiUPSNqX61KvO1gQ5DFMv
         OfQ98EIJse+M1Ob5oF1IIQjoYo3J2kl/m62mQLZadI6H0cB5D2JWEULD/jeg7gaCqbWc
         vtzU2idMybIR0o/0JotZui9m7MVIfj7+U2o/I6rsPAmtC2M/p9CuXtuwY3F3WPdP4N2/
         SNNni1FbTrcWAc0GTAZmkAFMDd5cP5OM4tKLOwbbCcbunOH4NjWzw5UfMjD6T12xByym
         15oTnHM7KmPBX/LLk+ZlRqDUnFcqnjpyA4fvkMWpslFUANOXapfl6SLGic6VcgtEJ1Nc
         LyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rqYf6CVkXPNASBtGWjvJhCfcijAjfipRZ7rlTfWznnM=;
        b=vwUlrCyFJzWi9p4IC4x50Q32tesW3Mp51Nz1zir2RWF2YH+I/kZ5/fnM/kGtggYEan
         2e/vK7DVKJ0ke7xgyKTLObku33DGE5cZXJI7sfEMcXMKdObUHhTWhx0s5eU1HSyc/k9C
         cW2FNt3QHlWSn9lRdjFvgX2+m1tiEXQrBqI4vN3DvR+NAU21+Dad46XQSia9FS+TrXa2
         0o1PUL9FJWgx/2LrWSPi1BxiCoVi+ZJ8TS5hShV4uKl+FEsbh7OzaLNLBKaArMZdoKr2
         a1EZJ2ACZM1cUvbLpY1ZRCbCfA7drrlac8hqd9rxkG0yM5AyQtzOrwDPHaTOZpG6V4mz
         P4xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jVHzVXN9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 137si4313993qkg.15.2018.04.17.04.53.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 04:53:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jVHzVXN9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8PAT-0007wk-P1
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 07:53:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8P9w-0007v7-L1
	for qemu-devel@nongnu.org; Tue, 17 Apr 2018 07:52:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8P9v-0007Gg-MN
	for qemu-devel@nongnu.org; Tue, 17 Apr 2018 07:52:28 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:44797)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f8P9v-0007GS-HY
	for qemu-devel@nongnu.org; Tue, 17 Apr 2018 07:52:27 -0400
Received: by mail-ot0-x243.google.com with SMTP id p33-v6so20995346otp.11
	for <qemu-devel@nongnu.org>; Tue, 17 Apr 2018 04:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rqYf6CVkXPNASBtGWjvJhCfcijAjfipRZ7rlTfWznnM=;
	b=jVHzVXN9pm1ehURRnf8dFV2+3cQldRMmOnI4OQDX+zhPQVXQMid1dwwC0p1oBexXEn
	Gp5B0RS+wbdTngfgoOs8UHyEPTj+DfKXNTKNGPhwB2jiPrOVHEEAl0J87kMkxWtUXbzY
	RgmFb3KSZjFcWwxkGezC96ml/yaGI0PnzTi0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rqYf6CVkXPNASBtGWjvJhCfcijAjfipRZ7rlTfWznnM=;
	b=K2E5aXb6NuAVefuArYX7UVJpppP4h5wykaa7lXoSvClKnn8spcQXJVuUkvJ1w4g5RQ
	VoM1GLgAt76gR2I1Kxc28B9HtkOl89zJ4c7ylKg5wllItw4XvCQ4i3yl1rtws9YrkxII
	z01LsWQ9mNJswk1dR+XtrLGIbsDVLMf5Ii+gwVg/Jrlrvf5Ydy+0jIhJl9PeGW6VsSdr
	pzMB3AUoO0KldvqAD9D+EJWi1t6jLEylQmsk86zufS502o5Qgx9WxAahqO1SvYztMXx9
	Fx+kb1pv0iIImEuctnxEsvBmmcBlbhj2tigliaJUFXWVQAvHfl+4YuvhxIT8ZJte3QqA
	rrMA==
X-Gm-Message-State: ALQs6tA0T4KgwwdCsK3L7Dk2qzNpCSXHYs34B14wXZd0ZyWWR8O99u8g
	hI3TxTUNtfIDjZFKnPliVYRC2jJf0trwGPhJ2kYRHg==
X-Received: by 2002:a9d:5cc1:: with SMTP id r1-v6mr932969oti.258.1523965946728;
	Tue, 17 Apr 2018 04:52:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Tue, 17 Apr 2018 04:52:06
	-0700 (PDT)
In-Reply-To: <b0d166e4-b84d-e450-b46b-73b609c1185a@linaro.org>
References: <20180416151923.22588-1-peter.maydell@linaro.org>
	<b0d166e4-b84d-e450-b46b-73b609c1185a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Apr 2018 12:52:06 +0100
Message-ID: <CAFEAcA8Q7bN28fPjHzAiBDAnFCDUp_w2bucT20DNsexzXhCx+w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-devel] [prefix=PATCH for-2.12?] linux-user: check that
 all of AArch64 SVE extended sigframe is writable
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
Cc: "patches@linaro.org" <patches@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pv/Pfx7un2lm

On 16 April 2018 at 20:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 04/16/2018 05:19 AM, Peter Maydell wrote:
>> In commit 8c5931de0ac7738809 we added support for SVE extended
>> sigframe records.  These mean that the signal frame might now be
>> larger than the size of the target_rt_sigframe record, so make sure
>> we call lock_user on the entire frame size when we're creating it.
>> (The code for restoring the signal frame already correctly handles
>> the extended records by locking the 'extra' section separately to the
>> main section.)
>>
>> In particular, this fixes a bug even for non-SVE signal frames,
>> because it extends the locked section to cover the
>> target_rt_frame_record. Previously this was part of 'struct
>> target_rt_sigframe', but in commit e1eecd1d9d4c1ade3 we pulled
>> it out into its own struct, and so locking the target_rt_sigframe
>> alone doesn't cover it. This bug would mean that we would fail
>> to correctly handle the case where a signal was taken with
>> SP pointing 16 bytes into an unwritable page, with the page
>> immediately below it in memory being writable.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> The requirements to trigger the bug sound implausible, except
>> that the stack page might be unwritable because we just
>> executed some trampoline code from it, so perhaps not so
>> unlikely as it first seems? Not sure whether to put into 2.12
>> or not...
>> ---
>>  linux-user/signal.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> Yes, let's just go ahead and fix this all properly now.
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied, thanks.

-- PMM
