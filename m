Received: by 10.28.71.27 with SMTP id u27csp4662789wma;
        Tue, 27 Feb 2018 02:29:52 -0800 (PST)
X-Google-Smtp-Source: AG47ELsi7U0J8SoBHs1eabALFrDRyIuuMCljMGzONO1jv++qTleVtAK1ns/ym7GfPqLopFV+p86n
X-Received: by 2002:a25:4a44:: with SMTP id x65-v6mr9221668yba.16.1519727392601;
        Tue, 27 Feb 2018 02:29:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519727392; cv=none;
        d=google.com; s=arc-20160816;
        b=oHT4qu2nAH794Ip/ykGj1p+uAc8Dxq/oJss2tIN0oO7qAFIHb59lX/Ijc6op07XDwu
         IRBPlOZcDn/5dwl6DqhWrdkHVrKG6LZ91eCDtXkO6ygtCKSgMa2T30dmz2dwmUTF5v/d
         zRzq+mW0jgcN9gquJfmdijtDtw/TvcnDODFap0unc4ainFxx5O7CguIucQE1Qp++RVvh
         egSsYEekXEzgFK9xgWzJepJOB3P5+X+5E9EG49tBS8AdjehWhda3sqdbRixPTGt2V6g3
         Ur04yWQSjzcwtWtW+0W3wGa2ci0Mvp+nuG2E8qAMt6qLBRXAteRcvacv5e54b9v9Q4tm
         /MHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Iw2dfIKeHmOJPLLO1hsi36SKeQVbJC4pPAa1MUmRnn4=;
        b=QCawe9SSfPyA5CenISvhUctPkKai4eSo6PIJFs+Oh6F89EVXalqWMaYljoSm3fXlPR
         dQB8QdcV+5RoWLC8uMmH0yw2EVpJpRk0N1NbbTGQHW/nerytmxhsMe9psVTqOd5fVT68
         dapme4/t3eArvzoPKatMSRnVtq8DDEOXWJ26qQcoh96yzDdiNqxJ50pN9PBArsFDvZdO
         ZwiSy6bghr/PFBrwQV6CHm0Pc9Kv3lMMKBjXLaetVxBcyLmZdU1Tnx1tdCUpVwVcHcUw
         n09+n+cZmOe4UWiTcaesVj3B56sCZDzTRdgodb9c0LI3v7B/Ib2fsO2ztc6Z8jWo1Jn7
         qbiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QbGUIX3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h11si165395ywj.503.2018.02.27.02.29.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 02:29:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QbGUIX3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqcW8-0001tk-32
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 05:29:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqcVy-0001sN-Bt
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:29:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqcVx-0004Oy-EL
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:29:42 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:35335)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqcVx-0004OT-9G
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:29:41 -0500
Received: by mail-ot0-x241.google.com with SMTP id w2so750583otg.2
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 02:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Iw2dfIKeHmOJPLLO1hsi36SKeQVbJC4pPAa1MUmRnn4=;
	b=QbGUIX3ZphfvScgwzI5Wg802F9GE+ok8XStDKV42WF2zAxFdRG1d+BtdA1pClzHFdJ
	HZPjvM+18jTXWZ4w+xd9MBj5pTd5lHhRJC18V6ZmeH4oavELND6eJF/FtYcBinN7VQjy
	7IfxpVwHgenBrJpzHi9V4pBcbwDkZ3Y5vE4c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Iw2dfIKeHmOJPLLO1hsi36SKeQVbJC4pPAa1MUmRnn4=;
	b=nradM7XmEHX6vWuWeZIvNsap+FuSYV4SCgZaDQFVhZt00fni3dDDCPM1Gbu2prBOAK
	kX7QqOtgkIKBV1O3S8L0bpgOD17FE+ure9FY/vFJUIyL9fjFir3GL86QV5C8PFK2fDy8
	S3sPmsFqmhz7o5DQ3LIlV+eUddIacqH/jUR5vtKpgY59KxLji3OWtKmg8qQdP07O/YBP
	R7gFvEQtc6Kyuzl5BdSkoRUD0jJ6s7jycOdL2VfBWpC8UYkGNm75z5kruT0vcMpkMaj+
	bFLNoVHhayRDJFSKrCNM/HpI0Z6UTxFL1k9ZjaRw1yHloWajRYJQriRyoG68uQf5GaEW
	flRg==
X-Gm-Message-State: APf1xPAi9zuCJtFAEzzlc45eLl3Bc+f6D4BLHdodpin/kyfUe/JLChQZ
	2bc/fWHxHByPm33XtCat4wZ4GadgOeJ8LF/M0rpDpA==
X-Received: by 10.157.7.227 with SMTP id 90mr9379465oto.126.1519727380619;
	Tue, 27 Feb 2018 02:29:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 02:29:20 -0800 (PST)
In-Reply-To: <CAFEAcA_bZ-w7WWUtr8RE6rU8ELLbZpBmeuDnwZ=rLreXgJ6fRg@mail.gmail.com>
References: <20180217140051.22731-1-linus.walleij@linaro.org>
	<20180217140051.22731-2-linus.walleij@linaro.org>
	<eff4f015-38ad-60e1-e1de-886bb4f93328@amsat.org>
	<CACRpkdZLwbVr2O5__GpHt+y0pqpk3-j_AXD_qv5JQc3JZNRm7A@mail.gmail.com>
	<CAFEAcA-jqgBxoEprjTPed0k_vZFGrAVd87Gj5nAfFysau4WrSw@mail.gmail.com>
	<CACRpkdZuNUmZbHnYwUQFJkBNQWADd5tXfc9PYv8amosbO=zn4Q@mail.gmail.com>
	<CAFEAcA_bZ-w7WWUtr8RE6rU8ELLbZpBmeuDnwZ=rLreXgJ6fRg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 10:29:20 +0000
Message-ID: <CAFEAcA_X7cjFmJMSFsCZYR9weJeBFJqdWj=Chpp3-4afqgbo1A@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH 2/3] hw/sii9022: Add support for Silicon
 Image SII9022
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pKYvbr15Ob2N

On 27 February 2018 at 10:24, Peter Maydell <peter.maydell@linaro.org> wrote:
> docs/devel/tracing.txt describes them, but basically:
>  * include "trace.h"
>  * define trace events with a line for each in the trace-events
>    file for the subdirectory (basically a function prototype-ish
>    thing followed by a printf-style format string)
>  * call them like normal function calls with a trace_ prefix
>
> commit 1b640aa9292bc00beb441e97d862ba322a7ba18d is a recent one
> which converted some DRINTFs in hw/sd/sd.c to trace events.

...and you can test them most conveniently with the QEMU
-d argument: "-d trace:sii9022*" will enable tracing to stderr
of all trace events with names that begin 'sii9022'.

thanks
-- PMM
