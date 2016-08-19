Received: by 10.25.21.156 with SMTP id 28csp213848lfv;
        Fri, 19 Aug 2016 02:05:40 -0700 (PDT)
X-Received: by 10.55.22.29 with SMTP id g29mr7345670qkh.267.1471597540433;
        Fri, 19 Aug 2016 02:05:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si3969392qkp.262.2016.08.19.02.05.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Aug 2016 02:05:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bafkB-0005lA-LX
	for alex.bennee@linaro.org; Fri, 19 Aug 2016 05:05:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bafk8-0005kq-3j
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 05:05:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bafk6-00078M-SK
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 05:05:36 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:35422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bafk6-000787-LX; Fri, 19 Aug 2016 05:05:34 -0400
Received: by mail-oi0-x242.google.com with SMTP id e80so5680819oig.2;
	Fri, 19 Aug 2016 02:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8znjuc45eay7iIYLFd9m42zQr78u8GhkXsG5lUIG0qQ=;
	b=feSaqlOqWCAkB2teZaRXiwSKIcIM/z3XaIG6OM6lPHZ7ad3hMFFhoTanU5Z3O1pSnH
	0LUwMOutHNr3oxQJmYkc7FtSmyzKImvfiU5/mP3n/pPXGygp0ug1PeR47wleu6CAvr/I
	Na1DhfJoQdR6a0ptilAd83Afc1BaEbR9eIDQN6u9ZavEGaBHEw17TR4nEOgwUmoZRtYb
	hUQH/QzQj1B9KnuMk8kz0e4VaeOKg4x1FnTEEX3eo8PaUwy68/0z725hGZi0Iqfah9RW
	4XTtOUh8pWCbExtWBzmT1UOAbcrpftegLOBf1wrxvAnVrVUgpM6rCTfcaNvrLkhZWdI0
	MjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8znjuc45eay7iIYLFd9m42zQr78u8GhkXsG5lUIG0qQ=;
	b=epV749lNsq9eXSHcZLB16FyXf8xuSxpn9+AYGGARDRdc4S/V4iHiYjPMKl3PL7W+et
	qNDKiQvj1doby3JRcUmWWO/Z/er22oK8pBtjiI4o9hix7tEp3/ONr5i9Z9E6zgpJFi90
	4EasZQvsAKVWuo0lIxPLhRIPGEedLBnmLvzaIV4R6OA1uTYWAbE7nnydd0eG16eFHfTf
	qIvtPv0r8HyQXpN+RaPlRs9D4mOLGvV3QW4ToqHNpkmcP3OpRFcfUXFI19YnOdp4o695
	KDuHF/Oqs+WjJApb+k22Go1Q1uQkkuf+dvXpxevidxzFPYaBVrpsHzj0DStfdsNgl0cs
	ALag==
X-Gm-Message-State: AEkoouvH7ptrgUPpEIn9hruUOZ9DhyElWr9uvmnnutAr53i56YS4By2A8/JgC1iJHkfLXSTDV8IiUuB/Yjw3KA==
X-Received: by 10.157.36.113 with SMTP id p104mr4037453ota.192.1471597532431; 
	Fri, 19 Aug 2016 02:05:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.244 with HTTP; Fri, 19 Aug 2016 02:05:31 -0700 (PDT)
In-Reply-To: <CAFEAcA9BL3u7WJnqFEVxwyW=D-FtUW7UdDxPhhgiFKObkuXibg@mail.gmail.com>
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
	<1471348968-4614-2-git-send-email-vijay.kilari@gmail.com>
	<151e49bd-d79d-0035-c775-86be29df3ac2@redhat.com>
	<CALicx6vzQyvhQPM2qgN1wkT_M+vr2WL+H5pc9HhuB=kWVU-JnQ@mail.gmail.com>
	<59517fd9-049c-adfc-5793-68165fe87f34@redhat.com>
	<CALicx6tGZ1z68nTBdYrSTcdBzCQwzHtGJ-DixKJjKSq7-cfkHw@mail.gmail.com>
	<f5f56ea7-795e-81d3-6892-f30772631e53@redhat.com>
	<5e34688d-af70-9fed-33c7-96d86868d1a6@twiddle.net>
	<CAFEAcA9J1_xGV7ScRzPNdU0qVa5nREa1ibPVHZgA8Nj7FXeGgw@mail.gmail.com>
	<1d77e7f0-61b6-5533-f0b2-04eae0fed815@twiddle.net>
	<CAFEAcA9BL3u7WJnqFEVxwyW=D-FtUW7UdDxPhhgiFKObkuXibg@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Fri, 19 Aug 2016 14:35:31 +0530
Message-ID: <CALicx6svNmg9G1KDZX8AOW1nXd0bw5u1_JtGUoZA4Ft761VHfg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [RFC PATCH v2 1/2] utils: Add helper to read arm
 MIDR_EL1 register
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
Cc: Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8RIHsRwMQ4Uk

On Thu, Aug 18, 2016 at 8:26 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 August 2016 at 15:46, Richard Henderson <rth@twiddle.net> wrote:
>> On 08/18/2016 07:14 AM, Peter Maydell wrote:
>>> While we're on the subject, can somebody explain to me why we
>>> use ifuncs at all? I couldn't work out why it would be better than
>>> just using a straightforward function pointer -- when I tried single
>>> stepping through things the ifunc approach still seemed to indirect
>>> through some table or other so it wasn't actually resolving to
>>> a direct function call anyway.
>
>> No reason, I suppose.
>>
>> It's particularly helpful for libraries, where we don't really want the
>> overhead of the initialization when it's not used.
>
> Ah, I see.
>
>> But (1) we don't have many of these and (2) we really don't care *that* much
>> about startup time.
>>
>> So a simple function pointer initialized by a constructor has the same
>> effect.
>

 The cutils does not have any initialization function that can init
function/constructor pointer
for zero_check function.

Also creating separate function with most of repeated code for prefetch does
not look good. So suggest to put check for prefetch outside the for loop and
code for loop with and without prefetch

I profiled and found that a single check inside the loop is adding 100ms delay
for 8GB RAM migration. So moving check outside the loop is enough.

Ex:

   if (need_prefetch()) {

       prefetch_vector(p, 0);

        for (i = BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR;
             i < len / sizeof(VECTYPE);
             i += BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR) {

            prefetch_vector_loop(p, i);

            VECTYPE tmp0 = VEC_OR(p[i + 0], p[i + 1]);
            VECTYPE tmp1 = VEC_OR(p[i + 2], p[i + 3]);
            VECTYPE tmp2 = VEC_OR(p[i + 4], p[i + 5]);
            VECTYPE tmp3 = VEC_OR(p[i + 6], p[i + 7]);
           VECTYPE tmp01 = VEC_OR(tmp0, tmp1);
           VECTYPE tmp23 = VEC_OR(tmp2, tmp3);
            if (!ALL_EQ(VEC_OR(tmp01, tmp23), zero)) {
                break;
            }
        }

} else {

        for (i = BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR;
             i < len / sizeof(VECTYPE);
             i += BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR) {

            VECTYPE tmp0 = VEC_OR(p[i + 0], p[i + 1]);
            VECTYPE tmp1 = VEC_OR(p[i + 2], p[i + 3]);
            VECTYPE tmp2 = VEC_OR(p[i + 4], p[i + 5]);
            VECTYPE tmp3 = VEC_OR(p[i + 6], p[i + 7]);
           VECTYPE tmp01 = VEC_OR(tmp0, tmp1);
           VECTYPE tmp23 = VEC_OR(tmp2, tmp3);
            if (!ALL_EQ(VEC_OR(tmp01, tmp23), zero)) {
                break;
            }
        }
}

Also,  If you want to make prefetch common for all arm64 platforms,
Then thunder cache line is 128 bytes so the prefetch is performed
at 128 byte index. If the platform has 64 byte cache line, then this
prefetch will fill only 64 byte line instead of 128 bytes required for the loop.

> That seems like it would be a worthwhile change since
> (a) I think it's easier to understand than ifunc magic
> (b) it means we don't unnecessarily restrict ourselves to a libc
> with ifunc support (musl libc doesn't do ifuncs, for instance)
>
> thanks
> -- PMM
