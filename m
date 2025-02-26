Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp1116105njg;
        Wed, 26 Feb 2025 11:04:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX/h6fetrq1ZKKztckiyrycooSKBQcNgS9Xwq5BZanee8G1iqQ7JFgMTkQFDXzYQQduBz1iUv9rRcWR3A==@linaro.org
X-Google-Smtp-Source: AGHT+IHpr8wVFZC4I/uKYqwHJrb2sYrISzCnca5Rn++kE7H7HPmY/r9xXvFQL4lTwe1UhB1e6hOI
X-Received: by 2002:a05:6122:3718:b0:518:8753:34b0 with SMTP id 71dfb90a1353d-523496045cbmr377503e0c.4.1740596650408;
        Wed, 26 Feb 2025 11:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740596650; cv=none;
        d=google.com; s=arc-20240605;
        b=AkCStSQq1QMjyqfFvAx/1wkNLwSu+7TZhUogryXl67eVyv2uHr7e/dGUR2egaIzcvg
         NaMXnP+T5vlV2UQ+TJzto1+8WzQvbpng4HB6f/i4qBeA6bGVbZyu53/EA9DUXUOcpvFX
         L+Pypi6lOlwk7jWKRJI6GiGSiGWLwv8m4QT5W0CxqoAnp2pCJ8ryXbVQru0OOS02a8ht
         FdeTJh2lyXZvJ9eV1DdqsKnt9sIhW7MwDrGo2405dsrQfOni7gMWtZwHRz0SYrfuJwbG
         nDJSQ6Pt4rbO4yte9MXyebj61K+8+d8LnZn3Mq+B6vku8NBxjTpAv/jkJZw9FK69mEfm
         zljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cMn4a8nyJ6yi+Vap1pbdQF6+GDXZEQnoN32oZDsRlPg=;
        fh=Dr80umQSy8R6nhyZKCGFC79ea5XWgpAGhMJjF/onp/Q=;
        b=G+igQs7+qS9HC7ev/yaKrk8YBp+SAzcYihcEkSCeNgXWSyiKZH+uFZLNzEAxkCrHBc
         xESYfcAdGq/U6yWSdmNsJPxZyOEN/eeJM2Yxu22YxYiQnoGepeHmg8E6r2xZ0jjL8UtO
         dYX0ZFUq0f1yEXEGiaesh8yT2PmmmsGwVrYOF6SwwOavSHpobZ7kYVgtcQwVc9palf1g
         kaRH5YjmO7ImOoBtz32VP/Ci+rZj53P5H6QGwfrLfHwei0V0rqcA7zXqovBO5x7apFdq
         N3WXmJzD9i8Q3nMCR0059sevWEFo+P0WuuSndcgu+RGbDB+OuhPIPQ++cmFQ13yOSxYy
         kirA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b54lC6b1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5223e2115c9si855672e0c.181.2025.02.26.11.04.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 11:04:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b54lC6b1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnMgv-0000Uj-SM; Wed, 26 Feb 2025 14:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tnMgu-0000US-F3
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 14:03:32 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tnMgs-0006uj-Jz
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 14:03:32 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2f83a8afcbbso354456a91.1
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2025 11:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740596609; x=1741201409; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cMn4a8nyJ6yi+Vap1pbdQF6+GDXZEQnoN32oZDsRlPg=;
 b=b54lC6b1w2Luaa/6pSUv5/DiFXjEq4jkvIe9pcYkfjNtwfVgeqgwdSi5GG/fJSINRA
 nHW2F0b9oN81YpIDjGnjSPH93mBMw3YTcqI4KLN72tvk50v61+V+n69K0qrVopdLtd10
 EEea3Kv6yrAXaeShMgdSPt7/JrotOEcbUWiReew1ECk0Dk9b7HGe0CmekYzrJo8xQJhd
 kjz+83ATDd7vOyPAuuSmKCRg1G61lKBib2yBbdhMcfQ1ePaFqbnY3f7Uf9iNaaMVoLcj
 8OL5Tuhy/DkDdWs0tFitqFbGcVKIsvEAhTGNbtz10DRYmSE58XcpYOT7JWYTRc89+qwd
 Fvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740596609; x=1741201409;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cMn4a8nyJ6yi+Vap1pbdQF6+GDXZEQnoN32oZDsRlPg=;
 b=lI2e6xxJxP7byV0V/rfASv2X3KmTGQd74afyNF8Om7hnmI9Uwem6xwhCBtjFTcJ+eC
 dRhUXvKKMWDk6qVleNBx1KfwhsoO/C4GDCjZmUtNoYMtAT2qMJ0w607kEqaYZEr6toD5
 l9utJ/uq6Rnhf96LQ83/Z+VAu6S+JMxt8hd4bDoLTZH/r/ZzTvGfNfJ1dzf9Id3UbuY1
 f+Th58JMEGC7msdimhacXYvNzheM20pY5mUo6XFy4wWsxOql8dW9BVtEQPQgVKo2t7gz
 F7+AHYipBZJixgickCgTVfaFMzF2HwlvO0O3GqQ+3eCY2TyNfXBsY1q9hKmou2DBPyYV
 N6kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5gAP02rdiFjnOA0hhHw2gzqM7J55j3N2yHbAp/7XOMYxWBDxTxG22g7xSIzgjMrIY0Ud1/OyCKg==@nongnu.org
X-Gm-Message-State: AOJu0YxN2ysTpFAoX8UgclWqJjqRF47DYp8mppf09SK+6z20PdRL0+m4
 ANksBZj8V4/+EW2W9lySqiIfHXSPyTGeLwuZH1onld8xd5SFWk3IQRB5LEDgcTA=
X-Gm-Gg: ASbGnctnM+ZZkRuVUtkbkPLUst+Ma3jyhHAt858ZwHWKn9tQJ+wYIQzUg4RA3/Swalp
 dQd0sBTHycM5BCI7plqccQoF6F9nnFdoKWAFiCaAXmiUQk879NmlPCvDhcM5R/K5sLUy13QfF2A
 zJU9WaMW25gfZ6EZeXRVrRms28ofwKJ+KUqlU1b+Jp2cq9TyNnqp/KzF/4A6gJb36mFK/4NwWCE
 15+hgg7qdELinuKb9nfb6KtmavQk9DGuKMmKqIlJ/scfs44H/5EcBsJfdyYM6a+egsRo/MhLh4+
 HWpUaIwKTPUtlgqviCfjrPPjP9etgQeVkMO2UYk=
X-Received: by 2002:a17:90a:d408:b0:2fa:603e:905c with SMTP id
 98e67ed59e1d1-2fea12683b9mr797904a91.2.1740596608738; 
 Wed, 26 Feb 2025 11:03:28 -0800 (PST)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a09d819sm36563495ad.163.2025.02.26.11.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 11:03:28 -0800 (PST)
Message-ID: <5c25f67a-2677-4162-9477-f51f230403b0@linaro.org>
Date: Wed, 26 Feb 2025 11:03:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/npcm_clk: fix buffer-overflow
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, titusr@google.com, hskinnemoen@google.com,
 wuhaotsh@google.com, qemu-arm@nongnu.org, Tyrone Ting <kfting@nuvoton.com>
References: <20250224205053.104959-1-pierrick.bouvier@linaro.org>
 <CAFEAcA_sz-_6WGCQ=4kC2vtK2RUBXbAtMVzh3iZsp0xmNbgaxQ@mail.gmail.com>
 <829e9fd0-2d0f-45e6-ab89-d933d344cfe2@linaro.org>
 <CAFEAcA8BHzA_P7yX+cDMb1WiyGTzkh6xjvam4RHs5aoM1X6mkw@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA8BHzA_P7yX+cDMb1WiyGTzkh6xjvam4RHs5aoM1X6mkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZIP09F86N6Ar

On 2/26/25 03:50, Peter Maydell wrote:
> On Tue, 25 Feb 2025 at 20:57, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> On 2/25/25 05:41, Peter Maydell wrote:
>>> (Looking more closely at the cold_reset_values handling
>>> in npcm_gcr.c, that looks not quite right in a different
>>> way; I'll send a reply to that patch email about that.)
>>>
>>
>> It may be a hole in our CI right now.
>> Would that be interesting for CI to run all tests (check-functional +
>> check w/o functional) with both ubsan and asan?
> 
> We do have at least some ubsan tests in our CI right now
> (eg the "clang-system" job). The problem with ubsan coverage
> is the usual one that we already have too much CI going on,
> and it takes forever and we don't have that much headroom
> for adding more jobs.

I understand the problem behind spending more minutes on this.

However, looking at our CI, we already duplicate functional testing a lot:
buildtest.yml:functional-system-alpine:
buildtest.yml:functional-system-ubuntu:
buildtest.yml:functional-system-debian:
buildtest.yml:functional-system-fedora:
buildtest.yml:functional-system-centos:
buildtest.yml:functional-system-opensuse:

Would that hurt so much to have one configuration enabled with ubsan and 
asan, which catches *real* bugs, and potential security issues?
Yes, it adds overhead, but it should not be x10. Around x2 to x3.

On github running, running -j2, running all functional tests with 
sanitizers takes less than 1 hour, and the build takes the same amount 
in time (-j2 as well). Hopefully we have more cores available on our own 
runners.

> 
> On the asan front, also, yes, coverage would be a good idea.
> Here I think we will probably have to gradually ratchet
> up the coverage because I'm pretty sure that at the moment
> we will find we don't get a clean pass (mostly for "uninteresting"
> memory leaks).
> 

Yes, I run with ASAN_OPTIONS=detect_leaks=0, and I deactivate any test 
that is flaky.

Two of them related to asan are tcg tests:
- munmap-pthread
- follow-fork-mode
I didn't have time to investigate, so I just removed them in my tree.

At this point, this whole list of tests concerned is:
https://github.com/search?q=repo%3Apbo-linaro%2Fqemu-ci+%22ci+fix%22+author%3Apbo-linaro&type=commits

> (I do also usually run a local
> ubsan test build when doing my acculumation of patches in
> target-arm, but since that's a manual step it is fallible :-))
>

It's always said that "Maintainer time is precious", shouldn't that be 
CI job to catch this?
I guess CI minutes are cheaper than engineer ones those days.

> -- PMM

