Received: by 10.25.21.96 with SMTP id l93csp855497lfi;
        Thu, 23 Jun 2016 21:48:41 -0700 (PDT)
X-Received: by 10.200.57.116 with SMTP id t49mr2435721qtb.58.1466743720958;
        Thu, 23 Jun 2016 21:48:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33si3558126qts.26.2016.06.23.21.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 21:48:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGJ2m-0006Cr-G9
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 00:48:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bGJ2i-0006Ck-Kr
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 00:48:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bGJ2e-0007Q2-DZ
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 00:48:35 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:36472)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bGJ2e-0007Pf-7v; Fri, 24 Jun 2016 00:48:32 -0400
Received: by mail-qk0-x243.google.com with SMTP id r136so423486qke.3;
	Thu, 23 Jun 2016 21:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=HKhy1XrrjFWXnQ3A4ad8X3Ov1qhepKQaIL0fffGDExE=;
	b=ufYA/PvdgHjHYfwWCc1WhvetDhsNuILHgut22IbLpgVfvXXxO01D3BDYOs+fQaJxfN
	sXej4S7KUagzLHkXY4qysrkm/Y41SfOWtTySoo0+K1HAoA+uM83gUxq8U/3ZKPK1IN9i
	/cpsptap4lEfhESFvT2YUpCjuMFEl2gZwqw8zZpmBqj67PSPO7NhhLDg0iLyW14WQe2m
	bQREOwlRa3ZGrhIXyxKh0EFhaAndGvygxvEmXnhqbXTUpuXmCyi4ebh9bF3gA61G/1N6
	zSlfd9kmZOyMRrI4uW+kz+yiavIda/WRFEBRstgOK+97waZqz4KtGSRTDfTgulgwu9X4
	Jhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=HKhy1XrrjFWXnQ3A4ad8X3Ov1qhepKQaIL0fffGDExE=;
	b=j6MMrp3lEGRhhhDvcOubNZ/1KxcsMHYt9lQ8qj2QbMo81/OIPJbPHU6MKuC3iMnIcq
	k6uUkzIokB9mBhKxW2N7HyAGeKo3/odgQ6YNlH59TN5p6c5JaGyREL8gfPd5aLhwuyv4
	XLIF8xPGuZ4uhqGprvn6sYTjnqH+VhZE4dHahW1iXu+WzarS9WVWJXs5dhNcHwNuW3R/
	56gKKexVyiWqpcjwj+uZmRTUkjOVANRONmTsFylIzl4vQiut633/d+XsYvEKVy9k2bi5
	3348VU4GJL5YPv2pLQeXoFHPXErmslEVtb5txyDVfpry+5mQkk1kWehs/4DyYdAir+6m
	EQqQ==
X-Gm-Message-State: ALyK8tI/EjYgYqPy7Jyz0jjTRkkRBSkDhpj+S1GmhPLI56cWnf86OKWftbOKOL3U+TXO7w==
X-Received: by 10.55.154.72 with SMTP id c69mr2421189qke.47.1466743711717;
	Thu, 23 Jun 2016 21:48:31 -0700 (PDT)
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net.
	[71.37.54.227]) by smtp.googlemail.com with ESMTPSA id
	v12sm1503400qtc.3.2016.06.23.21.48.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 21:48:30 -0700 (PDT)
To: Sergey Sorokin <afarallax@yandex.ru>, qemu-devel@nongnu.org
References: <1466705806-679898-1-git-send-email-afarallax@yandex.ru>
	<2e0293e6-987c-43ec-e9c1-3a63aa593fb4@twiddle.net>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <98aa90b9-8f11-b613-1330-3ba79b8c5ac4@twiddle.net>
Date: Thu, 23 Jun 2016 21:48:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <2e0293e6-987c-43ec-e9c1-3a63aa593fb4@twiddle.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4] Improve the alignment check
 infrastructure
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
Cc: Claudio Fontana <claudio.fontana@huawei.com>,
	Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org,
	Vassili Karpov <av1474@comtv.ru>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r9pCayLmpOad

On 06/23/2016 12:18 PM, Richard Henderson wrote:
> On 06/23/2016 11:16 AM, Sergey Sorokin wrote:
>> +#if defined(CONFIG_SOFTMMU)
>> +/**
>> + * get_alignment_bits
>> + * @memop: TCGMemOp value
>> + *
>> + * Extract the alignment size from the memop.
>> + *
>> + * Returns: 0 in case of byte access (which is always aligned);
>> + *          positive value - number of alignment bits;
>> + *          negative value if unaligned access enabled
>> + *          and this is not a byte access.
>> + */
>> +static inline int get_alignment_bits(TCGMemOp memop)
>> +{
>> +    int a = memop & MO_AMASK;
>> +    int s = memop & MO_SIZE;
>> +
>> +    if (a == MO_UNALN) {
>> +        /* Negative value if unaligned access enabled,
>> +         * or zero value in case of byte access.
>> +         */
>> +        return -s;
>> +    } else if (a == MO_ALIGN) {
>> +        tcg_debug_assert((TLB_FLAGS_MASK & ((1 << s) - 1)) == 0);
>> +        /* A natural alignment: return a number of access size bits */
>> +        return s;
>> +    } else {
>> +        /* Specific alignment size. It must be equal or greater
>> +         * than the access size.
>> +         */
>> +        a >>= MO_ASHIFT;
>> +        tcg_debug_assert(a >= s);
>> +        tcg_debug_assert((TLB_FLAGS_MASK & ((1 << a) - 1)) == 0);
>> +        return a;
>> +    }
>> +}
>> +#endif  /* CONFIG_SOFTMMU */
>
> While it's true that usermode doesn't support alignment checks at all (either
> direction, I'd prefer to leave the function available and isolate the one
> assert that caused your build problem.  E.g.
>
> static inline int get_alignment_bits(TCGMemOp memop)
> {
>     int a = memop & MO_AMASK;
>     int s = memop & MO_SIZE;
>     int r;
>
>     ...
>     } else if (a == MO_ALIGN) {
>         /* A natural alignment: return a number of access size bits */
>         r = s;
>     } else {
>         /* Specific alignment size. It must be equal or greater
>          * than the access size.
>          */
>         r = a >> MO_ASHIFT;
>         tcg_debug_assert(r >= s);
>     }
> #ifdef CONFIG_SOFTMMU
>     /* Make sure requested alignment doesn't overlap TLB flags.  */
>     tcg_debug_assert((TLB_FLAGS_MASK & ((1 << r) - 1)) == 0);
> #endif
>     return r;
> }
>
>
> I'll give this a test with some target-sparc changes where this will be useful.

I've merged the patch with the above change for tcg-next.


r~

