Received: by 10.25.221.202 with SMTP id w71csp1338538lfi;
        Fri, 11 Aug 2017 13:13:54 -0700 (PDT)
X-Received: by 10.200.48.133 with SMTP id v5mr24947652qta.84.1502482434005;
        Fri, 11 Aug 2017 13:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502482434; cv=none;
        d=google.com; s=arc-20160816;
        b=0po5e20nuZi7vpVnC0QMjxJ/0PFDvtDJAKOJ+B2ie0+LhxpdAH2Ypc/sdkOG/YoV4g
         t3VvlezTmgLnzLygsAAyCA/BxcQa314k3AxkBmS81W9R7b3oT3Y2poxShwDPp3OgdnDm
         kUqeGAjYdr7jegV7ZbUV/5raCVJWzaqpYxICT18Lpogvk0TttkTYSSyjmKbTSMt4gujO
         ZGxcdEqDz4d3kUI6BgBcyxrAF7JfG5p6KNcZ49cwAVl22y9GjgSH0LAbzQmY+y3FbsNd
         dpumK8mtJoChsDYy+KqT/DM3DuOt3MkOyPZgWrRUb8IK4XQ5eGJnTfXHV+TogY1anaRH
         GoQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bI7yK9Meax/zYzWNY6VGsJeKEo5k/e+KGHFY2N5UywE=;
        b=nDQAfULkKuWRuWTXeDFbo6X1ahghfqhehc21L3+SMC7cGbxwC3fpcM60050Qyhx+JP
         /49TTm/GA6TgeOcVuiPAVK2KXGghtLQmtrE0ypDTsW5YXf2d7If7aAR+01OTGXzZNXL3
         UaNXYV0h4MPDfxMnDujpyD+hRt1uJaJLos23bTXiAJDqHkxHIpK5kOW4s3Z17QzO/BWK
         /RhiMkYJXz3PUB2/Jv0dFoRaVGm8sxf3LtwozZNwWKAqXILTHfnzrXuCjvadvyOWPaKg
         ozK3pgr6b0DtbQtH7cpdrV0UYI3E5UUsu6G/xlyMBhzpruSyum8HxD6o/SXxJbQomZ1h
         guqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pHwun0Uz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k8si1481042qti.516.2017.08.11.13.13.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 13:13:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pHwun0Uz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgGJb-0001LE-7Q
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 16:13:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgGJW-0001Ix-9c
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 16:13:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgGJV-0004Vm-5l
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 16:13:46 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:36552)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dgGJS-0004Tl-E6; Fri, 11 Aug 2017 16:13:42 -0400
Received: by mail-wr0-x244.google.com with SMTP id y67so3185023wrb.3;
	Fri, 11 Aug 2017 13:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=bI7yK9Meax/zYzWNY6VGsJeKEo5k/e+KGHFY2N5UywE=;
	b=pHwun0UzZ7Gxs5iVbpZ8FdFEweoNPvl34bP8NKylUZTyd1Ku3AbRRYZ9zn97Upi1ks
	4ao29ZZtPCN1vCRvE0dkbMKjkIJTJzVxbYtc3QeVMA+QNZxkZxwE0qoPYJex3hiNJd4R
	L0HjAFqu+5aAastAHClbaqbfaIiKs6y1sPQgUuwR/v7rz1zck7PcfvLg2cmgmfCe2fUM
	uDd+A3yC1kpUGwQ5L7aq2sy3pWQ3fQRqUgvVaJuMzsfNDqfs+3VuZyyC1JC46uH28e7H
	FTdRVfQuje4JkW0GSIS11rk1CHjqhPBn7C/2nxMgvjFNjjUwakOsP2T2oDlaSyogmBC2
	IybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=bI7yK9Meax/zYzWNY6VGsJeKEo5k/e+KGHFY2N5UywE=;
	b=hhES+8aXIc4k3xQ0Zh7Pe0XxggM00R5+35hKiiQereSr180yDqA53BIcV6iy1+esel
	b1UKVFpPC1HlJ6sLWQeUo42X88B9UW0pXu3HNNcIKn8LGoaNxMZFw1jg8/ricUqUf55i
	GEfmABfd3IRRMHjuuAkpQIZpo4zWnRBMGzenR4sp1JoVq0yEz/LoU9jkbUAaVnKyyP+K
	zPxdBgecLCjDsMpmP9f145QZSfq7uqBchxBNXJlIE2vj2BpvT69GWa36RskqmB7Mn9d5
	D7/FrN5O2qrtQf8IQ52YMWgystve0mviZOeyChuuBUkoz/BL3rNIhHqJuYj+WrcwzR2v
	QY0w==
X-Gm-Message-State: AHYfb5jd0GmguC44LjYn+prlZ8Ugnnf3ofZiMKMM6RUGkeja4Enp7yts
	TflKZ5N9OfvLdAO5bb7k5bhMRXND/A==
X-Received: by 10.223.166.7 with SMTP id k7mr12836844wrc.34.1502482419852;
	Fri, 11 Aug 2017 13:13:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Fri, 11 Aug 2017 13:13:09 -0700 (PDT)
In-Reply-To: <de3609ba-241a-6df8-b5c3-30eb4535735e@linaro.org>
References: <cover.1502474835.git.alistair.francis@xilinx.com>
	<2fbcf76e4ff63d8527edd3662342948276e2cd37.1502474835.git.alistair.francis@xilinx.com>
	<de3609ba-241a-6df8-b5c3-30eb4535735e@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 11 Aug 2017 13:13:09 -0700
X-Google-Sender-Auth: 9IglbG0mx1btOooabCZ2qFZoP68
Message-ID: <CAKmqyKPLJpv79Dv77t8m2q-pFOBg3u4hDmcz5Wk2t+tt+bT8UA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
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
X-TUID: Mo1Iu/AqOeg5

On Fri, Aug 11, 2017 at 12:46 PM, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 08/11/2017 11:19 AM, Alistair Francis wrote:
>> The exclusive store operation should return 0 if the operation updates
>> memory and 1 if it doesn't. This means that storing tmp in the rd
>> register is incorrect.
>
> I'm confused as to what you believe is wrong.
>
>>              tcg_gen_atomic_cmpxchg_i64(tmp, addr, val, tmp,
>>                                         get_mem_index(s),
>> -                                       size | MO_ALIGN | s->be_data);
>> -            tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, val);
>
> Yes, we load the result of the cmpxchg into tmp, but then we immediately
> overwrite tmp with 0/1 depending on whether the operation succeeded.

Hmmm... When I looked at the values in tmp I was seeing non 0/1 values in there.

>
>>
>> This patch updates the succesful opertion to store 0 into the rd
>> register instead of tmp. It also adds a branch to fail if the memory
>> isn't updated.
>
> Since we use setcond, a branch is not required.
>
>> +            tcg_gen_ext_i64(val, val, memop);
>
> What is this addition intended to accomplish?  Because of the position within
> the code, you know that memop contains MO_64, so that this is a no-op.

This is when size == 2 so it's a 32bit operation so memop contains MO_32.

Thanks,
Alistair

>
>
> r~
