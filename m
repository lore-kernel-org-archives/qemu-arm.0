Received: by 10.28.71.155 with SMTP id m27csp391344wmi;
        Fri, 23 Mar 2018 05:11:47 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsLwDyznvvofZDyNILOh+zB0HnL0kErcKPMslqgbl/rdXPNLKhQbQnm7W9kZEEFn0RpUNdz
X-Received: by 10.200.64.129 with SMTP id p1mr29471366qtl.108.1521807107731;
        Fri, 23 Mar 2018 05:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521807107; cv=none;
        d=google.com; s=arc-20160816;
        b=vLLFmGpnS79TtKe6wh+mcZ9Mv1QjH5ysW2oM5jrf2G0pEA2Fz5t2liFhpxZwq3knD7
         8hx4T2WiE4QeYvJXnRLmpw0iHNwt82/YjHkoo/3jE1YKn9vmRfw3NY0ap2oblJ1IHZh1
         FtFPG9OhJ1FxrkhO9Og3x9vfh6INIVZrgHQBnGvHVq7EJyPQroMAkYJM0ssFGVRVUK1L
         LipqXBDIa3yszBN4GL4xSlecWq+aUY2raYIc4y8A5ii9vHsNfTcHBPT1gEA+1XVuVmcR
         fhLJnBVMCn6azBeAVbO/YR38y+3vS2lCLM6/v1ylLuWmAuY2UAP0s/hRkQsRQAWDb2R4
         OD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=EHxIMBzS5d+Hf2ZdVHglvdNeDptnNl629ssWyGudBLI=;
        b=rGeDQfZ4hmnsCM45nhGElbSIXXMlnKsrcNzDVfp3RVy6spxpnkGZ2YNr63FJzzsp4T
         3U3hsfimlP1N+2izZo5PxH+LUdbKy21/vQi2bIaOuSGmdp13BVZIyur/h3YmLs1y3vX/
         s4veCsgZwDZZHeVYYZLqKtWCUDlHJw7ywRblRwwTCzeJyzBSEob3KH8nfsBweD0bHa78
         FoBsciNnPOaPo9I7SVtNHOxsCO1+5+b2+WnyTkfhuxvTw8pTppDj3h3Cv35LtqFalfXw
         uwsmlfk2L2mxddMF8RSUtRuZKIIRi4zx1UGxVu6psARXzosLpHy92Wc3GyS5kbYOuOvo
         6pYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PhxYSuZM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m22si6493043qtm.56.2018.03.23.05.11.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 05:11:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PhxYSuZM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezLXv-0004HR-74
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 08:11:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ezLXn-0004G2-7q
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:11:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ezLXm-0000Zw-Cn
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:11:39 -0400
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:37197)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ezLXm-0000Zb-7c
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:11:38 -0400
Received: by mail-oi0-x229.google.com with SMTP id f186-v6so10116471oig.4
	for <qemu-arm@nongnu.org>; Fri, 23 Mar 2018 05:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EHxIMBzS5d+Hf2ZdVHglvdNeDptnNl629ssWyGudBLI=;
	b=PhxYSuZMnXRnh2KmumI2EFxI1PnHQ2b8B/DEPc+H7stTR5Ag1vDIMFKlsXxEoh08nh
	UGgHujhh3zp9S7Ao9+wQXntZUaE2QoaQ8O4sr6qfQ9g3BVDRBvKfc/drdP+g/xEYr3W+
	VFdQyBCucNEYOc00Bq7zV22n7DsMyt4GBPk9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EHxIMBzS5d+Hf2ZdVHglvdNeDptnNl629ssWyGudBLI=;
	b=FzD7VNziUx+oY9HzrlC5rssCYgHoTTY6MyLtVV7UVnpN7ujzJGXUCkpBsJ3Srkafc0
	Uu7OMKdc+s7S2L+zBQQDyMP7Ynwrcaljo8Uo9MqXDMno4ckGhZnTLxlLAZ45meswZG8u
	aLDf4vAsV1l+GvFYzbxVsUoidfGcT2cU3L5kuz58rbuqtMN6tlpC7fLXqVU67CKAYmz2
	EY4qgfJ62hZH6ivpRKzZTTcWofU18H8w4MKoDcj6+mWCkeuYioI+p+AymSFVdoK/HZPO
	MVBSjRo0hqlgzBqnEeNum5JIfzB1N17plvj3pH9fzwAbSbejriTrIKC1OyR/GXnJa5DP
	jG2Q==
X-Gm-Message-State: AElRT7E6hFzxFOoSUe71jf/MT370QEA3IyGU5idX10Arzmk8NmocEymh
	9EYz2WB045tWu7ewbYSYa8ilR4vpqbIS/YFWWZNS/g==
X-Received: by 10.202.224.67 with SMTP id x64mr2640847oig.164.1521807097597;
	Fri, 23 Mar 2018 05:11:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Fri, 23 Mar 2018 05:11:17
	-0700 (PDT)
In-Reply-To: <6b4fbb94-2c28-27c2-17e4-b3ce593eb04d@redhat.com>
References: <d29ae6aa-5758-277b-b754-4e6fe7666e6b@redhat.com>
	<CAFEAcA9dHPLj6aF=JsS8dXaDWf_ONQ_A+SD1xXQO7DdsWK3yAw@mail.gmail.com>
	<6b4fbb94-2c28-27c2-17e4-b3ce593eb04d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Mar 2018 12:11:17 +0000
Message-ID: <CAFEAcA_rJ_=-dKauAmrJPGRJ6C09_9CQzRdXK53va4NB_xXKpg@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-arm] Regression on KVM qemu-system-aarch64 since
 "monitor: enable IO thread for (qmp & !mux) typed"
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>,
	qemu list <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oR3GFh7Rcz61

On 23 March 2018 at 12:01, Auger Eric <eric.auger@redhat.com> wrote:
> Hi,
>
> On 23/03/18 11:26, Peter Maydell wrote:
>> On 23 March 2018 at 10:24, Auger Eric <eric.auger@redhat.com> wrote:
>>> Hi,
>>>
>>> I observe a regression on KVM accelerated qemu-system-aarch64:
>>>
>>> Unexpected error in kvm_device_access() at
>>> /home/augere/UPSTREAM/qemu/accel/kvm/kvm-all.c:2164:
>>> 2018-03-23T09:59:59.629439Z qemu-system-aarch64: KVM_GET_DEVICE_ATTR
>>> failed: Group 6 attr 0x000000000000c664: Device or resource busy
>>> 2018-03-23 10:00:00.085+0000: shutting down, reason=crashed
>>
>> Can you get a backtrace for this? (I guess you'd need to fiddle
>> with the kvm_device_access() code to make it assert rather
>> than passing back the error).
>
> OK. I will try to do so. As I could have expected, I cannot reproduce on
> a standalone qemu command line. The problem observed above is seen with
> libvirt launch which may be doing some other QMP stuff concurrently?

Hmm, that could be a bit painful to debug. I dunno if libvirt
has a "launch QEMU under gdb" option. If not, you could try
something like:
   if (condition we want to get a backtrace on) {
       printf("hit condition, attach gdb to process %d\n", (int)getpid());
       for (;;) { }
   }

and then QEMU will sit in a loop waiting for you to do a
  gdb path/to/qemu <pid>

thanks
-- PMM
