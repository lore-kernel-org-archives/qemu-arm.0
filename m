Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1687034wru;
        Mon, 16 Jul 2018 09:28:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpek2jiQDyahCoz9d4EZkjbYC29Z0eIBNpyUdHxv4NmMcNmF2iT/o1KydLgOnlvPSMqsoyyF
X-Received: by 2002:ac8:404c:: with SMTP id j12-v6mr15895020qtl.333.1531758485123;
        Mon, 16 Jul 2018 09:28:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531758485; cv=none;
        d=google.com; s=arc-20160816;
        b=KzdhF5YNLJqMq5bi+6C3egHU/yRUt4oQQD98BedY8Plf4eB6mSG7cWWAh+A4h+eDDB
         JuSPv+bSeZnd8YGte9Jm9hK9bogJ605/QpRz845y3hXMO8IX7+7WeHGuUEgsuTNACUXN
         jBVUHrf9Mp+1aI6hK3Ei1RT3TnlBddbCU/WyxvTxzJT5gm6nFBsCST9Wem6tMEmRrTnz
         OkasNOFWh+/pjtDeGt2fXlW5f4HfwaNW5ovhDsf2xgMUOEt/8W/6T3KbOH2d1wACCizg
         M+ZLUvvJYUWitD3B9QtQNT3nhX5QboZHoFEwtcaLC07OIQl8Bl9uQ4BNc80tf5BZvhZJ
         8axg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=WZLTT5Y14mGJYXH+22Oi0m7JZQ+CYElQ5ZLc8K4DhUU=;
        b=G9CRWzA/QzF4MwbChwOLU6PrpBLh6RnQsoYO7vZS3PKfwGFRqdB9x869yclLUrxF6y
         QHWD2Cooc+ovLr0czkCLb8jK3Xx2mM+Gq858SsgjROxOKe/oYz1BwXhiKqVOtxahx7cX
         c4BwnpmDkGQYD3mNO3r2VxSEFVxM1+t8O8tqHVgVGwRe65PzjBJ1UMpjNi0r/vsO+yj8
         crwxcCzqura03Sn6ho5G+KUrxW82jB8bkeiCurIMW5KmcmjqB7rY3ZR9MZ3QuRxNhABs
         ClWxMmPfKbgwNBKkJ6a9SDZ9cb34FZGykN6px8eWaMxrRCtOSSwlY0RA/EPT/hJogF5k
         sXKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bfRjGh1F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v71-v6si8268975qka.94.2018.07.16.09.28.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 09:28:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bfRjGh1F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff6M0-0004lu-LG
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 12:28:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff6Lp-0004lf-Sb
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 12:27:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff6Lp-0007mi-0q
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 12:27:53 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35698)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ff6Lo-0007mW-SC
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 12:27:52 -0400
Received: by mail-oi0-x241.google.com with SMTP id i12-v6so75952128oik.2
	for <qemu-arm@nongnu.org>; Mon, 16 Jul 2018 09:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WZLTT5Y14mGJYXH+22Oi0m7JZQ+CYElQ5ZLc8K4DhUU=;
	b=bfRjGh1F8ITCjfpxwd6vcajSc/G+mcCjZ/BmS7khiN2Y1EvTuBZ3QHjCm9Le5JDFb1
	+m0+jC9+AAnXioi/F6Rw4kKlLS/WfJx51iQKEjhUI/bxkrbwNIH2A6FNaASE4ZO5PQ5T
	vihiRSolRVxgbqvI5uwDlpFjDhNCzFtSYorvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WZLTT5Y14mGJYXH+22Oi0m7JZQ+CYElQ5ZLc8K4DhUU=;
	b=RCn20REQgS8O2Giue8Ylkh/gURVbiw91lFjohry2MKjWdIds2ZhXNXBps3b7UHL4Gs
	VmRWe1n8l7eGGJigpyVsnoMYe5NUoiiUh622xXKUOEw1t03Jd4qxTrDvc7/ZIw6yF5Hi
	S35O+scirC+8OH8tiCgK4GgewTJE3qjnBf8akTyAlebvDdNStu+GyOLD1ETYhgHj2Jk9
	C9iRnmZMo/Da1Ghw10iI+hKbOvOHCzUAHdBdVVmzgUjonuwzJMqjFw5UwfudxozT7kE7
	Y83+W5EtavoEnzT9LSQZiNncUja5opRRdMPUhjccyV2hmb+nc7x8Z9yKVNJ/QSJnbpze
	VV7g==
X-Gm-Message-State: AOUpUlGp+icqY7m7QsRo1Z8cJayubFduvT+mZqGpGpFPuZPdd99d+Vlq
	rIt5ZRMYQDiIPGIxidxlihGVfZxgjVfMEnXqlgABqnQH
X-Received: by 2002:aca:a982:: with SMTP id s124-v6mr48539oie.80.1531758472163;
	Mon, 16 Jul 2018 09:27:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 09:27:31
	-0700 (PDT)
In-Reply-To: <20180713141636.18665-1-peter.maydell@linaro.org>
References: <20180713141636.18665-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jul 2018 17:27:31 +0100
Message-ID: <CAFEAcA_CHjuAbe3QgcL+SEc4xi=HQM6TCpY=5gkxt61_+LQVYQ@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH for-3.0 0/2] accel/tcg: fix
 get_page_addr_code() victim TLB lookups
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zS25YSemguMp

On 13 July 2018 at 15:16, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchset fixes a bug in get_page_addr_code()'s
> lookup of the address in the victim TLB, which was another
> source of "we end up with an invalid TLB entry even after
> we've done a TLB fill for it".
>
> The second patch then removes a check that we had that was
> working around the existence of the bug patch 1 fixes and
> the bug that commit 68fea038553039e fixes, and instead
> puts in an assertion that we definitely do have a valid TLB.
>
> Tested with Laurent's m68k image to check we didn't regress that.

Thanks for the review -- I'll take these via target-arm.next
since RTH doesn't have any other tcg patches for rc1.

-- PMM
