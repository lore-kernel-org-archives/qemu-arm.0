Received: by 10.223.197.9 with SMTP id q9csp8746656wrf;
        Sat, 21 Oct 2017 03:18:19 -0700 (PDT)
X-Received: by 10.200.4.130 with SMTP id s2mr11346775qtg.338.1508581099648;
        Sat, 21 Oct 2017 03:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508581099; cv=none;
        d=google.com; s=arc-20160816;
        b=ESHDVIywYuCTSqIljPO9eb0/vjObuO9Sfq8ShB+xnG1o5uxFTvSVv+iE2sPZ3M7+DM
         te5qftGIhoLKOY05QD22BnO1u89WzFE1joHX7YitAdmltbuR539pLtYyamNtFi4HxoCW
         YhicJcNQJ7WhMbHL0UkWLqqX0mG7MSZmmyOdmTNibXUa7ci9CTuzKDln3/fVfu9quavs
         O5hquNMF8ynlUYGbKV7gUbyZboIsF6hGWqqyJkmA1Ym7NFvvmEwLI4nt6g70eTRgVxe3
         qdLno+esnGjxc5A8hNtk77mn63BYOUZ/nEuntgyZbkqxR1l7P6GWVQk7yTsWlpdzauVz
         dgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=vqfzCLwNWUyzXeGFnYtp6Lj4vtIH2YWpJuzJB1dlAwc=;
        b=yUMzYeMvwyvNc6pM9Yk2VAn6wssuBYg7RBlNUS3jSlV169Vf9esiev9/LbKbGOgdqe
         uWAoRAlkAqB5euHY6S5Hnx0JvL480+HAqd+pcL2BLMUz9h74NNPrSFJFki0AVO0LZyxN
         yQ5vmtGJdh6dXvy0yujzA+ur8F1XkJa0qNbtgNwNpvts1zeSO60/gYaCkgSgtdfMpXnZ
         RYIEvdp1V0sloWcUCEybDefsUcKp7Aln8F33/qZYMN6/YBH3LJruRMA3zdssOlhquSzE
         BFPF6jrlJDcV0e7/LFV9NWL6M+NvG0f1z9kB0wrtzV5QXbKrI+mpYbk7RsYR5eEMZdXU
         bGYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gwhEqtQW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n44si2507610qta.8.2017.10.21.03.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Oct 2017 03:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gwhEqtQW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57261 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5qrB-0003Sy-ER
	for alex.bennee@linaro.org; Sat, 21 Oct 2017 06:18:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5qr2-0003Sn-IR
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 06:18:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5qr1-0007QJ-Lw
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 06:18:08 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:52213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e5qr1-0007OA-EY
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 06:18:07 -0400
Received: by mail-wm0-x22d.google.com with SMTP id f4so1883171wme.0
	for <qemu-arm@nongnu.org>; Sat, 21 Oct 2017 03:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vqfzCLwNWUyzXeGFnYtp6Lj4vtIH2YWpJuzJB1dlAwc=;
	b=gwhEqtQWa5W4fgyYNCcw5ACrpoqXj8iHctYW0vdUl8jfQSNndw0MgbO7RUHPfKk1uo
	9oxzGmbb0jjfpudR8dEyX16iaZJRZj9vet2nYPItPNu8/m+kOzuEWpzR2sb93jze2BCI
	JpMTFYArwVUSuq5OwkL83mf0sa3mC+FOg94jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vqfzCLwNWUyzXeGFnYtp6Lj4vtIH2YWpJuzJB1dlAwc=;
	b=VQSkIAD+Pq8FfDcvkVLzT0h4VMyuvfswNtgX9jK7hMKOwCm4ddI7FZry4IuKCV7K5R
	hXZz1ILMlkTsbzW42PkfdCNtfRddF2UsHsqLSdxBi6doqxVQsrqzee/u0OAXttCqyQBR
	+3CUJp5Vf4hiaPZNwEbmj9Inctf5tkeBkALdwwtyiEaOxkeEivPzQpwaQWtpfSYcAFwL
	Jr+pTuvjhqUa1v20chOBhOkQ+Gf8Bm8Yirp3ibVDijsGEpzZYYcSt+AIc31hLXdMUW0l
	39JgvIFmKuwnzm1r6LV27EMztvp5d9oW9aSY0O3Br7hrmWd7Smaycmuh7IA8d2LJTnXK
	8dvw==
X-Gm-Message-State: AMCzsaUnLubYN4xVygVYXx/Z4r4gJnDkSpP6Mm/O2OiBn+tgtrNuUWtb
	fq92jXfTIO42d65wB7k+vgczddwYAesFlLBj2EFAtg==
X-Google-Smtp-Source: ABhQp+RJIJClunBDs+BzKjOnOMxmhTXv9H4QfyxnTkeZFd65EhJrzOOKUyDXwSrvhP3NKD19BmXONesSoVj9PytDthw=
X-Received: by 10.28.14.195 with SMTP id 186mr1124150wmo.56.1508581086173;
	Sat, 21 Oct 2017 03:18:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Sat, 21 Oct 2017 03:17:45 -0700 (PDT)
In-Reply-To: <19d12a08-9ecd-8c91-4652-28773ca35d8e@twiddle.net>
References: <1508522170-22539-1-git-send-email-peter.maydell@linaro.org>
	<19d12a08-9ecd-8c91-4652-28773ca35d8e@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Oct 2017 11:17:45 +0100
Message-ID: <CAFEAcA_HWF_TD190CSVNbgeu-NGrzWsJmFN_u97CRNA8y-yW0w@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-arm] [PATCH] translate.c: Fix usermode big-endian AArch32
 LDREXD and STREXD
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
Cc: Christophe Lyon <christophe.lyon@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jJL3K7pPvBK7

On 20 October 2017 at 19:15, Richard Henderson <rth@twiddle.net> wrote:
> On 10/20/2017 10:56 AM, Peter Maydell wrote:
>> +        if (s->be_data) {
>> +            tcg_gen_extr_i64_i32(tmp2, tmp, t64);
>> +        } else {
>> +            tcg_gen_extr_i64_i32(tmp, tmp2, t64);
>> +        }
>
> The test against be_data must be of the form s->be_data == MO_BE/LE.
>
> The actual bits have MO_BSWAP non-zero, and then set MO_BE/LE to either 0 or
> MO_BSWAP depending on the host endianness.

Oops, yes.

>> -        gen_aa32_frob64(s, o64);
>> +        if (s->be_data) {
>> +            tcg_gen_rotri_i64(o64, o64, 32);
>> +        }
>>          tcg_gen_setcond_i64(TCG_COND_NE, o64, o64, cpu_exclusive_val);
>
> We're not splitting o64 to parts.  Are you sure it shouldn't stay as frob?

This is confusing, but I don't think frob is right. We want to
be matching either (a) the transformation we just did to produce
the 64 bit data we're storing, or (b) the transformation we
do on the ldrexd, don't we? Neither of those is frob.

I think I need to think through a bit more carefully about
what's actually going on here, since we seem to have the
value in two places (actual memory, and the cpu_exclusive_val
TCGv.)

thanks
-- PMM
