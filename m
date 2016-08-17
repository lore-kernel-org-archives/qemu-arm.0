Received: by 10.25.21.156 with SMTP id 28csp2576859lfv;
        Wed, 17 Aug 2016 08:35:49 -0700 (PDT)
X-Received: by 10.55.155.140 with SMTP id d134mr44774044qke.16.1471448149074;
        Wed, 17 Aug 2016 08:35:49 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k2si12076388qkd.180.2016.08.17.08.35.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Aug 2016 08:35:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ba2se-0000e6-Hg
	for alex.bennee@linaro.org; Wed, 17 Aug 2016 11:35:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ba2rP-0008Gs-Ks
	for qemu-devel@nongnu.org; Wed, 17 Aug 2016 11:34:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ba2rK-00038P-LA
	for qemu-devel@nongnu.org; Wed, 17 Aug 2016 11:34:30 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1ba2rK-00038F-GO; Wed, 17 Aug 2016 11:34:26 -0400
Received: by mail-qk0-x244.google.com with SMTP id r128so170987qkc.1;
	Wed, 17 Aug 2016 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=/NSvr9n/t07RfIZTw2uXpIm2+OYi9FAz4IuUr5lf0Vg=;
	b=GCKUQRE0bwD0rCsExXrnvckqXmmF9GdNVkMzH/ojah7cKaF69zLs39Bg4QuILRBkNf
	wki8l0zfKDU5Yfw4QN3S3x0x7obf5m1lHlGnt6tF7NRUieCpVDkbeYY2SaxuHNSp7iD8
	VgXHEGVD9/m8K4n9ipg7/lpcuMShPYgb4ptzZ4TMdcLGb8cI6/SiyujJiMzzDBVSaVgC
	DuP3CnoAgqbht2qawrfw2lH5iGqyDAZ8R8Y6Ch8jHnSw5X/aJU6sCIfWV9+Kts40J+yf
	08TVeNmDCFSQqRHFhW2zvMtUJlII8EjWDKG77qCcpcS/wqAFUjxeV6eIO1gxCT0oDcB4
	XQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=/NSvr9n/t07RfIZTw2uXpIm2+OYi9FAz4IuUr5lf0Vg=;
	b=CFzAKuVrcTn9tJ5XsdJfiaWgNO63Py2L7nRYisl3cQYvx2WM1QLrZPr8CHog3bfihh
	fvqm8YnUIt4GXj8m7gGFKWdYk5JPVBTnRl/x0zBnva8Fmu6DZelxp+qkwGGB12psN28W
	cQGkj2Mj2MLRzjMI3m9Wcyr3+5grf4+Tx3okGWe6Fm66t1Qfnv+tKCZYYQURAoRsOtBG
	efGgWHMIyNEzijKXYPjRGYyxGZEZRvehFPrh0YuqwYq7SKzhrY5iQORlJS7VTRB2HdO8
	yly7n+oolW9qmq6zSJnfJLWoJ8hZrzuTaA8/egqNoh6faEeD1lQPyMFK83LKdfB0hGag
	WCPw==
X-Gm-Message-State: AEkoouuKMckoA1XEgbD5h6BD2e0njHzWmAJU/dno0/PNCU4lG8VYBE4fA+pLu323d2c8WQ==
X-Received: by 10.55.195.9 with SMTP id a9mr47509316qkj.237.1471448066023;
	Wed, 17 Aug 2016 08:34:26 -0700 (PDT)
Received: from bigtime.twiddle.net ([208.95.30.164])
	by smtp.googlemail.com with ESMTPSA id
	x42sm18053134qtc.29.2016.08.17.08.34.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Aug 2016 08:34:25 -0700 (PDT)
To: Vijay Kilari <vijay.kilari@gmail.com>
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
	<1471348968-4614-3-git-send-email-vijay.kilari@gmail.com>
	<0f3abe4d-9640-2cc4-41db-7d5e5924e63d@twiddle.net>
	<CALicx6uHyUNzgL4a2g+q-VDp-NmHvXiTeiwOn5-8i9ukNZ-FRQ@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <2186b622-1bba-12fc-63f4-763c93d8b69a@twiddle.net>
Date: Wed, 17 Aug 2016 08:34:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CALicx6uHyUNzgL4a2g+q-VDp-NmHvXiTeiwOn5-8i9ukNZ-FRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-devel] [RFC PATCH v2 2/2] utils: Add prefetch for
 Thunderx platform
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"prasun.kapoor" <Prasun.Kapoor@cavium.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Furet+dpPItC

On 08/16/2016 04:45 PM, Vijay Kilari wrote:
> On Tue, Aug 16, 2016 at 11:32 PM, Richard Henderson <rth@twiddle.net> wrote:
>> On 08/16/2016 05:02 AM, vijay.kilari@gmail.com wrote:
>>>
>>> +static inline void prefetch_vector_loop(const VECTYPE *p, int index)
>>> +{
>>> +#if defined(__aarch64__)
>>> +    if (is_thunderx_pass2_cpu()) {
>>> +        /* Prefetch 4 cache lines ahead from index */
>>> +        VEC_PREFETCH(p, index + (BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR
>>> * 4));
>>> +    }
>>> +#endif
>>> +}
>>
>>
>> Oh come now.  This is even worse than before.  A function call protecting a
>> mere prefetch within the main body of an inner loop?
>>
>> Did you not understand what I was asking for?
>
> No, Could you please detail the problem?.

The thunderx check, *if it even needs to exist at all*, must happen outside the 
loop.  Preferably not more than once, at startup time.

I strongly suspect that you do not need any check at all.  That even for cpus 
which automatically detect the streaming loop, adding a prefetch will not hurt.

You should repeat your same benchmark, with and without the prefetch, on (1) an 
A57 or suchlike, and (2) an x86 of some variety.


r~
