Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp265275wrt;
        Mon, 26 Nov 2018 12:36:01 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UkIKi7r6D6+n1K6t72HOxr74mcWQ7RBKZbDFnC88QXvdIT07QkOpZwyK5tCcD2wXcEqxo6
X-Received: by 2002:a5b:c45:: with SMTP id d5-v6mr29300917ybr.366.1543264561683;
        Mon, 26 Nov 2018 12:36:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543264561; cv=none;
        d=google.com; s=arc-20160816;
        b=zHhBAcEqpLR1C6vIPvy2IyiPGGeTscKjnIZmocUBaTP+mHDX9CbaqkIDwVpOGZct+4
         ArvRHa9ht3Uqn71LY4YDG6CKMcefu9y7lSq7pPqR2Wq4AG83nVGCYTFgT9NtmNZWw9AJ
         TxgcmROEmb77TLja4Laro1imxesWp2JikikdfB8h39RSYKgi0nt4mkZhgO8g5VCOGlMo
         gF98T9krkwkHFmIaYWGQoIAxT5D9nvBL1cc/7zShSy+O2wbI2r8doWo0JCko1beTP8pO
         64n6pNfvhWRtBWQwMbK4C/7A8VlRz86bQXaze69FArjUBoudPAGQw6Too1Vanm9IM017
         mgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5cPkZU7LNYY8THwlf9HHwC+lLezMUV9Psq1fFsqiyUQ=;
        b=AlcvGp8YyBgGZw6anT7+Zn9hWUAcFAaEq1VmR0cEQltKQRpEGg0zByDSJy2GCXM8gV
         uBWbUuhQoQu2TOSc6zKCsSHX9HS3LIY/UsU0nSjBpVbzj4bMoYrVcGu0+xyvjb/BI0PO
         logJgOorlsZlqCqmleA5N99gUIs4q7Chehib5Hj0xDzUL5Y1jvx5hMqTSKTSU6bVgG3F
         BLVdtd3zNkpLFjRpyIMd5UG/D7vsDNsrr4/T17cNsggSgFcPiXead4/WXzp7i56z41q0
         ndUyZ4w7bGluHgyfX4gT/+akli1jRLXyJrhnmJKdKykqYtp29k+MO4ikkNiEdJAO/yoe
         TfpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DdGsN//v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r186-v6si1042664ywb.299.2018.11.26.12.36.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 12:36:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DdGsN//v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRNbs-0005U4-Pl
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 15:36:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRNbV-0005OK-5w
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 15:35:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRNbU-0007IB-IM
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 15:35:37 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45250)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gRNbU-0007Hx-4s
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 15:35:36 -0500
Received: by mail-ot1-x342.google.com with SMTP id 32so17924649ota.12
	for <qemu-arm@nongnu.org>; Mon, 26 Nov 2018 12:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5cPkZU7LNYY8THwlf9HHwC+lLezMUV9Psq1fFsqiyUQ=;
	b=DdGsN//vMW59vn21lqaZsEvFiGUUrtb7UWnAtqgCqRPhpX89Zdck7l3oJQonYxjAda
	g0PJnWyHlY9e6hnGhpVZliN3vRo0LiWjdmt85l/ps3cDj6t0v4F82BrvQtttr1OHbILx
	Nhn130eHxu5DipfaougWSCGfkKo8LZGQFJasA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5cPkZU7LNYY8THwlf9HHwC+lLezMUV9Psq1fFsqiyUQ=;
	b=aORO+x7uyQAjvYbieNWBKu06o19y/g6U1GdPdaTdH6/EtUypzgx0h/l9ivB4sd/DMV
	fhclg8nY0Cm7ZmSQ21uhr7uSIpJS32hhbB8zR53WG+L+CgSgnLwy++W+58buKuHhdx8J
	3HGXhvo2I6yr4nOWIWfBRFHDRjU0sot61Q+SmanHj0Oh/1qYTo/t2GFo98tRh4+oLEIP
	e9O0mWnSz22ZnGINaywdkibh9LN901H8FpKz9sdMrB5vATXqYTuLv8Gf+ohDOVbakPcA
	NuY1W61hojdW2p9UCergRAU+Q/e5SBwcOHy8aCtFus/MSp4iCaZCO3T0l6K9f7vprfNZ
	CqcQ==
X-Gm-Message-State: AA+aEWb1dqNlyuu1YYXNkcyXuENxLC/2G3sqR53oGo2OcEcamX+RBfYJ
	H5791/84BKhxEDNY6hReFEDGYgiqJMrWUvk8qrPYZg==
X-Received: by 2002:a9d:582e:: with SMTP id r46mr16638727oth.238.1543264535439;
	Mon, 26 Nov 2018 12:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20181126191454.9455-1-ricardo.perez_blanco@nokia.com>
In-Reply-To: <20181126191454.9455-1-ricardo.perez_blanco@nokia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Nov 2018 20:35:24 +0000
Message-ID: <CAFEAcA8MZD1nBPqtPEX91v97si5_MgjXUCPOiJd-tzBg5KvF8g@mail.gmail.com>
To: ricardo.perez_blanco@nokia.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH] [PATCH] Allow AArch64 processors to boot
 from a kernel placed over 4GB.
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
Cc: ricardoperezblanco@gmail.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8u85ndQSKkN3

On Mon, 26 Nov 2018 at 19:15, Perez Blanco, Ricardo (Nokia -
BE/Antwerp) <ricardo.perez_blanco@nokia.com> wrote:
>
> Some machine based on AArch64 can have its main memory over 4GBs. With
> the current path, these machines can support "-kernel" in qemu
>
> Signed-off-by: Ricardo Perez Blanco <ricardo.perez_blanco@nokia.com>

Does this fix an issue with one of the current boards we
have in QEMU? I think they all have RAM below 4GB...

thanks
-- PMM
