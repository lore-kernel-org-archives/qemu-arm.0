Received: by 10.25.21.156 with SMTP id 28csp375869lfv;
        Wed, 24 Aug 2016 07:55:21 -0700 (PDT)
X-Received: by 10.55.132.68 with SMTP id g65mr3945767qkd.8.1472050520975;
        Wed, 24 Aug 2016 07:55:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y124si6569769qkc.83.2016.08.24.07.55.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 07:55:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcZaK-0002B9-F7
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 10:55:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcZZp-0001rz-9k
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 10:54:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcZZi-0004i7-01
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 10:54:48 -0400
Received: from mail-yw0-f194.google.com ([209.85.161.194]:35970)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bcZZh-0004i3-So; Wed, 24 Aug 2016 10:54:41 -0400
Received: by mail-yw0-f194.google.com with SMTP id u134so913441ywg.3;
	Wed, 24 Aug 2016 07:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=A1U/bgF0Zn7VRw6g5Be/DtJ8jGa7gdHetJYuHoi9Xkk=;
	b=0loDoFf5qgT6QbyR3q6WOOm0/dyCYHqtViNQ4JGH683Xz7y+zeRyBwxxXMKmnjlJU9
	kqCb3LwWk8LTT9vaOm88PKXW6v+DjPwU1i7Meqv5iJNnZqdLkngkWWLkpL3H9yQyVPu1
	vN175mlfX+Hv601u9YlTl49sQvDznGjsNH1T9/ZGhaXFQmAjxdtDXbPRPKSoLZ+eQqKi
	/sfsfwSSho2pM26PQJ1uY44yQnbHW9mcJJW4hrDJrgU4+dp14LPxSBLUv+lu6F9sn+t+
	7vGYQiqfjWmSNqiEvX3uXINwNwH4E93VeDj3tiT9K7hdd8PB1/Kn/Bpl9AOANVjerg9p
	qWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=A1U/bgF0Zn7VRw6g5Be/DtJ8jGa7gdHetJYuHoi9Xkk=;
	b=ji007ClAqrCdNpG5osDo+3+NgEG1fsHWE+0jyAn9bshXO+9MefTWMFREaNZ+yCsQBh
	fwE/P4OjrlqUVZycygtvrQogdFxs8YVg6Yf+WTTHBUIDpHEzVORnUr/yP53aUyzUY0q8
	RLbWvCIkalPbTxxl9V9KWq/pJgWmuiHO7Ul+D57MtYN+giy+AUh/o1MbWZO164WCGmhe
	/C7+j79iEZpEkAMg97JL40hTpKHtRK+BIW3wZXG/XBN4NnxSE/BwfaTBLDfiu4OFhyq3
	v4n6mRwrNx2pHRxhEsrGXn7UKgnD+jXTP90S2rg5zf2EL3PN5lFNK7Iu5XagFOtM7xwF
	JUlA==
X-Gm-Message-State: AE9vXwP2vNnweiTqwTz9qoCTqEeue5Go42tlbs0qVbG2XKfqQUrgRGWF572QvCWsz5hsSA==
X-Received: by 10.13.213.3 with SMTP id x3mr2858756ywd.253.1472050421252;
	Wed, 24 Aug 2016 07:53:41 -0700 (PDT)
Received: from bigtime.twiddle.net (174-24-157-40.tukw.qwest.net.
	[174.24.157.40]) by smtp.googlemail.com with ESMTPSA id
	n18sm5558116ywn.36.2016.08.24.07.53.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Aug 2016 07:53:40 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
	<20160824043048.109542.39014@ex-std-node742.prod.rhcloud.com>
	<535318f1-8178-714d-7487-5aeb0661280b@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <566a869d-1042-0bb7-7a4b-928efa5ea676@twiddle.net>
Date: Wed, 24 Aug 2016 07:53:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <535318f1-8178-714d-7487-5aeb0661280b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.194
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/7] Improve buffer_is_zero
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, famz@redhat.com,
	vijay.kilari@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2feZBv7vAlw/

On 08/23/2016 09:38 PM, Paolo Bonzini wrote:
>
>
> On 24/08/2016 06:30, no-reply@patchew.org wrote:
>> ERROR: Use of volatile is usually wrong: see Documentation/volatile-considered-harmful.txt
>> #44: FILE: util/cutils.c:289:
>> +        __asm volatile("vmovdqu -0x80(%1),%0\n\t"
>
> Other errors can be ignored, but please use __asm__ __volatile__ here or
> just __asm__ (I don't think volatile is useful).

I had to add volatile to keep the prefetch in advance of the loop.
I suppose I could just add the prefetch to the asm block...


> Also, perhaps move this function to its own file since you're rewriting
> it anyway?

Sure.


r~
