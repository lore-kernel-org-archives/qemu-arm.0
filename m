Received: by 10.25.221.202 with SMTP id w71csp1353023lfi;
        Fri, 11 Aug 2017 13:29:55 -0700 (PDT)
X-Received: by 10.200.54.98 with SMTP id n31mr21449960qtb.200.1502483395500;
        Fri, 11 Aug 2017 13:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502483395; cv=none;
        d=google.com; s=arc-20160816;
        b=ASWqWJJU7DZOkA1SRfjVrC+hYylvtHvQbN53FW64SfJ6h5KvrFBJkSuryoyB/O1XPN
         m+en8+8ImtWq+a4Z7Tf6kaXQs2yQDxTQv3WYSv8+rBuOO/mxEtNhqAgCi1GgGr5itS7K
         MPN7hNxojOW6R7F69aE4WYTMWuOD2Dgc9GvfEoURhvdLfY0uk01x6Lu6X1vDZeIkLwzB
         SdyNA8miJdZIPl6OJWLJtH0gk/Tn1gds7H2ahGiSDoFZfOWK4XDBP93cDZMnhhoWkvRg
         6Xt3gOabn7R6jbXKAm2SNaXdTNdjPsoIq0GIN3GjIgF8Of2p4AU9vxfANcFPdTiBDfLU
         TF2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=W16gJZxFCiXXtUTxyTlcrMMgyxAEGPS0lTQKTaLlJbU=;
        b=AAPn3aJrKPS4/KsHD3WnV2wT29eDWP4bZl95lT+OT5D94kN+ttxdS9PSgxtcGz2/kJ
         oiuKUsQ946wsVJjI1yqFkmJWzXFhmxfvCs7x94P8IIUrvt1S0v1OCSK32lsScpEC+ExN
         6k1upKFN84w7W5GoIJ4Q5bCz3O57mmB2NSJRz4fEy2l61RCusWqYHB8jhH39SDJe3NzG
         G70B+lN3yF+I7ttft6co9bJMyZHc5TFPf++taIJhN8vVJ90RfMUBdXPl4GKUQN3wEyM0
         yhekaZWu8618tL/yloY5Qw7bHO3EvdMKhvS/4/EJguscUiwF+RvrHPpJiA77zyFZwQRf
         FErg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=haIFYU8I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p2si1476831qkb.44.2017.08.11.13.29.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 13:29:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=haIFYU8I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45261 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgGZ6-0007Yh-P7
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 16:29:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgGZ1-0007WD-2n
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 16:29:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgGZ0-0007mY-2b
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 16:29:47 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:37027)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dgGYz-0007m1-SO; Fri, 11 Aug 2017 16:29:46 -0400
Received: by mail-wm0-x241.google.com with SMTP id t138so7615549wmt.4;
	Fri, 11 Aug 2017 13:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=W16gJZxFCiXXtUTxyTlcrMMgyxAEGPS0lTQKTaLlJbU=;
	b=haIFYU8Ivj8sFbnPnHJYbqHuy8xTwJ9W2ICZCFaTDzpSK2N92jP9pk29yac3ABE6Ev
	T6HXXnPvV7lGQPmj8oHLNEaf3YITyde6jkfpICmmnExJaXbEm/8MkKRQXZ2lmt2ybLM7
	nQJLCHA6/KGOWhAyJay/fmVgYuIFH5Qhd5oy8tM4xGSYhfn+zqUJr5KYp88FYMh5/xXn
	5DUISJkDvTPJxHpoqwczQvJ9LMOxobcrXMcvJsappIXs/BCpFAC+lVfWFzIhZheznzZn
	Qz2R2F5Ogc4zEri6QuEaWyrnEX8Nk9KIPs5yaxVgfAKwunsfXe4YSwaeaW/amMwXsQkd
	2l+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=W16gJZxFCiXXtUTxyTlcrMMgyxAEGPS0lTQKTaLlJbU=;
	b=QLLP59dtM9rqL0PvL7CpPnc4Yoqg6F8KHPzsJvjGFCC4sj/Zge9gHmBKPWOV/FE+WE
	LVVPkLzazwKlUCSfmpmCVNEj7XHdyjIN+LRkWjK3idjx1qrwaapxWgnTXbWFsrWqG/Of
	mA11fJcZb1JCkJ4HxU6uPkXUrfoA9PeOIASsc9xHQSitsdryYfWE9BMqeacARQh2sO1D
	eBqUiBVr14DDF3/NfAuAFqQHKmh7jWv/WHMIyi713y822UKMBqEZlBzMsRP5p46AXbQa
	uJu4xZ62rgAIw6suKmeekV7o/srWRygJHobLreyABrcpSq485K/qpYu+Xp7nap2Kn3uX
	Lxeg==
X-Gm-Message-State: AHYfb5iLSybs87xR0ffln3QwfMW8y/rs3w4w4kZOUjurIeEFJb1WCy+x
	qLgT+NYYVR4CSk3Go6wp0D6pGllfKQ==
X-Received: by 10.28.96.197 with SMTP id u188mr9751410wmb.73.1502483384774;
	Fri, 11 Aug 2017 13:29:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Fri, 11 Aug 2017 13:29:13 -0700 (PDT)
In-Reply-To: <fb2b501e-21b0-f711-19f5-a3087b6007f3@linaro.org>
References: <cover.1502474835.git.alistair.francis@xilinx.com>
	<2fbcf76e4ff63d8527edd3662342948276e2cd37.1502474835.git.alistair.francis@xilinx.com>
	<de3609ba-241a-6df8-b5c3-30eb4535735e@linaro.org>
	<CAKmqyKPLJpv79Dv77t8m2q-pFOBg3u4hDmcz5Wk2t+tt+bT8UA@mail.gmail.com>
	<fb2b501e-21b0-f711-19f5-a3087b6007f3@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 11 Aug 2017 13:29:13 -0700
X-Google-Sender-Auth: B5vEagpSAGZ8MBsJH7rZb12-GkY
Message-ID: <CAKmqyKOCAS1=WPFwBUXwTve1T_VZsQKJdT=15CPRoHSs-eEhDw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v1 3/3] target/arm: Correct
 exclusive store return value
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jp8ahDzpaPR6

On Fri, Aug 11, 2017 at 1:24 PM, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 08/11/2017 01:13 PM, Alistair Francis wrote:
>>>> +            tcg_gen_ext_i64(val, val, memop);
>>>
>>> What is this addition intended to accomplish?  Because of the position within
>>> the code, you know that memop contains MO_64, so that this is a no-op.
>>
>> This is when size == 2 so it's a 32bit operation so memop contains MO_32.
>
> It's a paired 32-bit operation, so we're operating on a 64-bit quantity.  So
> extending from 32-bits would be actively wrong.

From what I can see though, the 32bit memop is carried into the
tcg_gen_atomic_cmpxchg_i64() call so the value returned to tmp is
masked by the 32bit operation.

Is passing down MO_32 into tcg_gen_atomic_cmpxchg_i64() wrong then as
it ends up as a 64-bit operation?

My TCG knowledge is pretty limited here.

Thanks,
Alistair

>
>
> r~
>
