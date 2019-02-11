Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp2670490wrq;
        Mon, 11 Feb 2019 08:46:49 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaglmU0Z6sZ6qevFgx4dyPZqJDg8+ccDuOgyVP0iLUlgH+h3sP5tIVVTMWLeNwaW4Fi9FuC
X-Received: by 2002:a0d:e383:: with SMTP id m125mr29571053ywe.21.1549903609652;
        Mon, 11 Feb 2019 08:46:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549903609; cv=none;
        d=google.com; s=arc-20160816;
        b=IOdY3nhkNozwUP2vnwBX0yFHQijWCVDN0noF/+A7BvOhBX1A5EdoBytrxNak3KJSUi
         Z/sr0dON5MC40V5jxdwipklWiAAr4+qpWMFJ1lqKKw0zVTJSbFnJVlp7TOfWnxcyxCdc
         ymSP5IyMzDvSMRPXGGfljr11B+BkEqnyzvQY3RNL7lfeABcGEWVoYJ6wAW0+kPtFF3+A
         DI+7zilIuYKgp9odBx06M8DphvfbXQKVj0L4o1ehdRKYQtVaeIwAF0+uoc2D3Q7qzWHZ
         zvRaJRSan4gawRZ4h/uqMyxWOa2/ikQ1LovxDB56tYHQ6xMinAaZPaaw58TKMNKIf2si
         Y5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=buj+aksa7bn9FdoPa5fhb3WvB681GdR80ltiurXnxmY=;
        b=C0KzcPRYJs4Jt6AhblRI6HV/nzeqv7fQQ9F03Rbnm4jZlBUFzte5LolBe9ClJsbcft
         jRUSz09OzCe8IRffod0XfEsyxrIfMtLwNoSkHhyNXlk3+x7l608YjTut5yg9oigovnQh
         vmrC17QSEBxgYbIzYQlzRsrETPL0a/RpJR4w1n4enLanD5mhvMX/XFbdyHgx3f8x1QxI
         P7oE2Y0CzZxollEiR/dh5pPW4B6b5ebDRkFHjFZw1Hh203WuF2XL6UAEYdPtmfNP6DgU
         iiMjgapilivFkpG4GXDsnWXM0Q87KNXMeczI9fi98lsw9l51RdL4W+HDzrhuiLuKELgm
         aZHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rKvVwf5I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k18si5910890ybm.182.2019.02.11.08.46.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 08:46:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rKvVwf5I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtEjJ-0005GD-4z
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 11:46:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtEbb-00076k-F9
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 11:38:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtEbX-0006re-E2
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 11:38:51 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42378)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtEbW-0006f0-Lg
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 11:38:46 -0500
Received: by mail-pl1-x644.google.com with SMTP id s1so5528931plp.9
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 08:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=buj+aksa7bn9FdoPa5fhb3WvB681GdR80ltiurXnxmY=;
	b=rKvVwf5IN6DVZGJWRhx6wsbuhfhMqmr3PPXgJAjWyAX3It58yLJMax4r5yKxd9y7kF
	t4JruZMdlSmohIHm+kjKi2p2SaZJnEzY2brkQMtkDX8pEOId3JNld/9QRX0DEBalcUFN
	OfC3oxdnXCol7lhrsFqlUOB0j1zTVVyelnx2ShP69XuPpab15XyD9pO7BuotgNIHBGP/
	G7eMs/Qf6Hx5Cm1XYFSHXB33ArZIaRkcKOvmn3H0GpkaH9R+IcRgi8G73YXHnFDzV9Fe
	wH1L+6bmBcJCRjuASdUOIhbryb8FNgZKRrH9OCL5Tjdh6YeVUPbqxzCSmtxyv08gAUE0
	5VIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=buj+aksa7bn9FdoPa5fhb3WvB681GdR80ltiurXnxmY=;
	b=t0FBVpkgV5unPaMabDr1w7UZE3JaRXpczy2XPXnrewbAP4Pr2TXzqtYno55490qm6s
	VKB5X/9Ciz6ZThjgyH8DwRBXkKbZS/e3Qr1cdg5vreqY63ngKBVHK6nTp72QH4BHsZKl
	iRE+ShbF1ec4IRwsAqTZk95FYxAttCd+ivrZQmOgrlfWDslvIQjubiP4KL2kaBFluQS1
	uBJihFZFtNXhESbv3iH1a36KXLWvDyFYGHXzGoQ6i9uayt5q+KHRuGzovzuYqacnEnaf
	1ZuQU+EGE4sp/ovKSWq8nMxBCv0gjxnqTlzmmyTZ3rql8Z9hS+Xa/J64/AE/kKweOuCB
	xpYg==
X-Gm-Message-State: AHQUAua+H06nOVj200o845DtIEMwi0ieKlZST2JoaCurxqw2r/JnTEFZ
	Pl08JP4vYejpfYrFYuW5pnS/VA==
X-Received: by 2002:a17:902:7805:: with SMTP id
	p5mr35907898pll.261.1549901463325; 
	Mon, 11 Feb 2019 08:11:03 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	f6sm18241793pfc.88.2019.02.11.08.11.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 08:11:02 -0800 (PST)
To: Catherine Ho <catherine.hecx@gmail.com>, "Emilio G. Cota"
	<cota@braap.org>, Peter Maydell <peter.maydell@linaro.org>
References: <1548985244-24523-1-git-send-email-catherine.hecx@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <eeb0f275-b262-25db-337a-b6c78b29c124@linaro.org>
Date: Mon, 11 Feb 2019 08:11:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1548985244-24523-1-git-send-email-catherine.hecx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-devel] [RFC PATCH] target/arm: Fix int128_make128 lo,
 hi order in paired_cmpxchg64_be
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U6shzzDeDk4X

On 1/31/19 5:40 PM, Catherine Ho wrote:
> The lo,hi order is different from the comments. And in commit
> 1ec182c33379 ("target/arm: Convert to HAVE_CMPXCHG128"), it changes
> the original code logic. So just restore the old code logic before this 
> commit:
> do_paired_cmpxchg64_be():
>     cmpv = int128_make128(env->exclusive_high, env->exclusive_val);
>     newv = int128_make128(new_hi, new_lo);
> 
> Fixes: 1ec182c33379 ("target/arm: Convert to HAVE_CMPXCHG128")
> 
> Signed-off-by: Catherine Ho <catherine.hecx@gmail.com>
> ---


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
