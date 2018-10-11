Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2830136wrt;
        Thu, 11 Oct 2018 10:47:10 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60FCGaaEVrcekiYi7PRncgQy0iMQXKJDWhWx/O6lKGoIKOoqQGJT6yEGBNIjZfFCYMKxf9x
X-Received: by 2002:ac8:b0d:: with SMTP id e13-v6mr2553971qti.375.1539280030484;
        Thu, 11 Oct 2018 10:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539280030; cv=none;
        d=google.com; s=arc-20160816;
        b=E32n631zxNpJAG0+ZVQk4FzbtFVGeL6i21ryCdmBcdIoalsnzTbMlaguStBbqxsPCX
         XYpedsmwcA8beB1DcKMVv1kw8Bv0dHNZsz1Cxe9HJs0SFojlCsSeOIcmrJ8M1elt51b+
         GPI9TCwi/wZB+HxLNrnPRtsfyK4hnlV7xUTcjaB8rALXB45ZuF/ahq/b9QCdX7PP7iCb
         W3yODNOTrKYXlcXO6WbowU8P9D1xCNXbka0agYfL0qV1fwnZbdkJ00tChBVI8mGKQixh
         rtYllyOFes5Nrh0WED4D3mxLcW822eh2JqzGIT488HApPfoI09iNxk74KTN/RKi3F/dr
         zbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=dfxheMsG3Fh2WnGGj9SG5RNA0FLF1tPJ59uJUnsodqo=;
        b=KsnZArcNfcK5dXGXkDW442PF6fbvOERfST142rQtW/UhBU5i/Ouihc6UDFmZP7Mk1f
         ve+Adw0rp9uOJ3/UydRZPzBeP5fnOr/93CFvF1gihFko1XG/S4VX4gu3QLsQeHtjssb1
         Z2VfFhAPQTtezFRY+09ivkwEDlCKt8PU7ORBATlsgTBAQPnSMubcz5BUJ9UhlaDxKRjs
         QUdHyY1CXrZBKjmgyWfqK5BmzMUduDG2SfoaTYpWJNMb0o1biGd9NSInenrlUB+Vahep
         twtekJxZj32IsYvGIbxjPSNgNZYogEMJ1954V2W8lDXZkWOh3fQjck2mETyA99gBX4Pa
         OGOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PTZQ71wX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x194-v6si3922219qkb.211.2018.10.11.10.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Oct 2018 10:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PTZQ71wX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAf3G-0007ei-13
	for alex.bennee@linaro.org; Thu, 11 Oct 2018 13:47:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gAf19-0006Et-9i
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 13:45:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gAf15-0006Bj-4N
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 13:44:59 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:42810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gAf12-0006AP-RT
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 13:44:53 -0400
Received: by mail-pg1-x542.google.com with SMTP id i4-v6so4511929pgq.9
	for <qemu-arm@nongnu.org>; Thu, 11 Oct 2018 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dfxheMsG3Fh2WnGGj9SG5RNA0FLF1tPJ59uJUnsodqo=;
	b=PTZQ71wXLPlAZ8oiPZOK6Md3bmXZia52ZrKphnfLpx8qcQH2fMyWybtjKSVzGqz00b
	Rw/+9SK4siv8KDi/fY/AK2rikBelEPdPiDc02eZRwdtf1/gAx1WRBhScMpiHIBfsrZ9A
	g9n6hU2JYBBjDVjjvvhRVA8Ek32lgFK+1X9vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dfxheMsG3Fh2WnGGj9SG5RNA0FLF1tPJ59uJUnsodqo=;
	b=NLKkYnakcsi4uiF+2hIxOQYheOpXRCKptypW0Ura9Y9DLLy+n7V1PFjxLZRmvPzgSl
	xPlLZ3qMsoiE7BDXHFDAo7dnlyqBSNX5L4zNgr01XNx70VVq73WfZZ1qMfzIlYfhS0IU
	YVoPt6jaLNbwDJGCQCOnXYTYa+PgLFUl41O/ghX5GcBcqY6JcUocshfuR5MAxKLcEMMT
	mJV/u9mSdAlrlnyA8dQwzRVFAREL674o1aeYf0t1HLYWrO+HNSqdkLXRv9noLX2/Cdwr
	6WgwSqpbHi6zf2xBqPP3rHZP+/TBCurg5OfVhLPlz4/rhg51PZ3wKu8Q8ijW1QxJaMQN
	jbOw==
X-Gm-Message-State: ABuFfoimIabmlq5bEE71VoDNRLl5TQT4VbPQw5LtN8krMGaL/mQWSVbj
	mcHFtTc/uXaQv4DfibtcwaOOyw==
X-Received: by 2002:a65:6204:: with SMTP id
	d4-v6mr2242302pgv.121.1539279891433; 
	Thu, 11 Oct 2018 10:44:51 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-8-179.tukw.qwest.net.
	[97.113.8.179]) by smtp.gmail.com with ESMTPSA id
	f68-v6sm58228484pfe.143.2018.10.11.10.44.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 10:44:50 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181011172057.9466-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ec34b8bd-0939-4ab9-b94f-08ab4a3c10cf@linaro.org>
Date: Thu, 11 Oct 2018 10:44:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181011172057.9466-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Initialize
 ARMMMUFaultInfo in v7m_stack_read/write
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5v6yZVZLWj5S

On 10/11/18 10:20 AM, Peter Maydell wrote:
> The get_phys_addr() functions take a pointer to an ARMMMUFaultInfo
> struct, which they fill in only if a fault occurs. This means that
> the caller must always zero-initialize the struct before passing
> it in. We forgot to do this in v7m_stack_read() and v7m_stack_write().
> Correct the error.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Noticed this in passing while I was working in the file on
> an entirely different issue.
> 
>  target/arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
