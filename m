Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3417756wrg;
        Mon, 13 May 2019 17:23:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEcrgUvoGFq9vhBWI7RFbVVpeBgX7Zpjl2uYzlVHH3RJiupX0DKhSsDR5WJe9y5T7C6v9P
X-Received: by 2002:a17:906:1f51:: with SMTP id d17mr24700209ejk.290.1557793407922;
        Mon, 13 May 2019 17:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557793407; cv=none;
        d=google.com; s=arc-20160816;
        b=bkzJmE4bbe8IrDhgG+OYSomaLoIS9oE1VKMT/0Id3xyxHrPbH5xgrHDEkGeFIWBbPP
         2MYYD8OxkYCCxbRd+QswomqcyUND13360KABUv7FPs5RGtDQgowWsCBj8TLoJDcU/0zv
         0KZ8CpsdqJKVJixjdPK+69MEdIGqlhTG51a+VzA5n8hXOQMozYuotrhxOFeLg3q3W2fL
         GK3UHLhztmMg7Ij5PS0akhvH7Vg9YrsgcxMnsxgjXatjKANr6j02QE6Wry1KGHmONU+d
         eUt/vwfERxS09ccEcXQ9vEHAOjZA/Thw9w7HVZ5rUQGsqTcAUBpDp9vPaifo2iLknd1p
         t5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=oIkVmNeg/B6R6chvnMOItPsHgkpWpa1zwyyIpqDbq8U=;
        b=awEtBcfXY5n/SvuNXRrRm2UmsZRMP6meShbwx8AzZLWVQnwdG/gLoio2gNx9JAYzRu
         hDWtc7FHcv3zK0M3wGBanv0Y8oEJtlQrKauzoElPTSeIKmODKgHnqLHhcNPL8Hnc9gwt
         CubS2+qC251SxuSqArneW2LcdWCxA8ZuWP7IOMzgS/OWDh4EhhEF0aRLjH8WnvYlByOk
         uJD9ro/b2Wsz+mtQ3IsMq9JEJp2w391rW66Eqah8BfRkiKJzzIEgLPTpg2Uiv8O/zOjO
         /weLGZ2Mmckjo/GsgKRpLhoHrL8FqaTuE4RFFStgqqS+qOhmLfII9szZ7mrRYMrrQpqa
         +YFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=smGEPcvf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w40si75777edw.366.2019.05.13.17.23.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 May 2019 17:23:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=smGEPcvf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQLE6-0007p8-Un
	for alex.bennee@linaro.org; Mon, 13 May 2019 20:23:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hQLBM-0005Pb-68
	for qemu-arm@nongnu.org; Mon, 13 May 2019 20:22:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hQLAp-00073j-2O
	for qemu-arm@nongnu.org; Mon, 13 May 2019 20:20:36 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36188)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hQLAW-0006a4-7V
	for qemu-arm@nongnu.org; Mon, 13 May 2019 20:19:47 -0400
Received: by mail-pl1-x643.google.com with SMTP id d21so7300660plr.3
	for <qemu-arm@nongnu.org>; Mon, 13 May 2019 17:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oIkVmNeg/B6R6chvnMOItPsHgkpWpa1zwyyIpqDbq8U=;
	b=smGEPcvfryodsu89HYqKa+pH71m0dQ4b+n4PT/VkjVHNdcjRgI+pUwOHknA39XXyUR
	21zXC+jAwQZRzZSvXk2np58yvXS1tLdoTI2q3fj+Zqz9RiqWTOyX8lm9+gOtbWYqRlr+
	v0YUff3Lna7ayHDdPdiUC7U9VHicqadOvjGDtABD69KeC+ruTCqz+3leBU91kJTBisrv
	nxCebAT4SZ8KHA1tk8TEB2e/fTHb8Wj4AixPDVwmBu5js4M/5ijxddvUK2gifkqJWnwo
	q72eezB2EgGo4EqwYpX9C+tfvDZ7u1hW4NIs0ousGgzof4r3uUIdUO5+R9FSHFCSCmWI
	fHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oIkVmNeg/B6R6chvnMOItPsHgkpWpa1zwyyIpqDbq8U=;
	b=iSlKQVapadUqrp76kzWDRqiq9q2gfUfbK0RHOpU1ifn88pBV1sfNpHDEOQ6pkVmbAM
	eN0hjcPF7K5GjaQtUDXRuR06V9ByNEyv8aKXjOOKMCG2nglJJSENOAmt/CTmIpjE3Zi/
	L/e7IxU3CoNTwkiYsRN3oXJ7OrZXKVHttBacWTjzq3/KfoKep5FSr9nL/YjYqTlLkefW
	cg1xxU9CKkxe+5Sso8HuZ+qJzFE9A01svtN8jYdp9EptHR6ZFXR3FM+lkpI+rvYFsxXu
	TGwsZmMa5ZhJWGobxsgrJc5o1CzPCdGN3w2yoVPvT2lgJRuvczQ/JcXVwnkFEBtX6flR
	onfQ==
X-Gm-Message-State: APjAAAWasilSL9P1YKdPz8ATO6c7JT9pK7lLZ4aLNyTZzOIAKqV+9Wuy
	l4h8NCjeHjmbRKwUQwYAN7VJpQ==
X-Received: by 2002:a17:902:347:: with SMTP id
	65mr21660592pld.232.1557793175127; 
	Mon, 13 May 2019 17:19:35 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
	by smtp.gmail.com with ESMTPSA id
	w12sm15385978pgp.51.2019.05.13.17.19.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 17:19:34 -0700 (PDT)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <ed7713d9b6c523d1c453ed7ac5de5501ef8cf405.1557792121.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <28f47fb8-78e2-942a-a678-0d44553ddc55@linaro.org>
Date: Mon, 13 May 2019 17:19:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ed7713d9b6c523d1c453ed7ac5de5501ef8cf405.1557792121.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-arm] [PATCH v1 1/1] target/arm: Fix vector operation
 segfault
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alistair23@gmail.com" <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kxwSvgMgd3Fa

On 5/13/19 5:08 PM, Alistair Francis wrote:
> We hit the second switch case as
> NEON_3R_VQADD and NEON_3R_VQSUB don't return from the function in the
> first switch case.

That's the bug, not here in this second switch.


r~
