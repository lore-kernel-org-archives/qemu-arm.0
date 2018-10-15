Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4902766wrt;
        Mon, 15 Oct 2018 13:20:13 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63rVrYnAAYHIY5mUYgTwPI8cHcV4w4XoZHSHs8F1Wo8Syw7FGS1lLiZWiWPwkxoYEha61Ar
X-Received: by 2002:a0c:d047:: with SMTP id d7mr13520661qvh.140.1539634813192;
        Mon, 15 Oct 2018 13:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539634813; cv=none;
        d=google.com; s=arc-20160816;
        b=JNJ6YcLofYUpNGVIRcr6D6e/8+YSxDIW/gs6hj/dXNE8QQZcFd6v1fD+XYAvTsXKBy
         CNIt+jk35RoQ4IQQLYP0VBM15dScbFhlO5rFhpydg25Jdf+/AR1vMOhIEufNktyZerz+
         lyI4ST2IBtq5uiftE9I6HIv9s1NZBHqKgyeDDZtQTMA8XPaO8z8udla3cNEQXj6wXcrf
         Bau+Ir7fYPqFH8yRNlc1bogFB09ZBS4jO0AyhJc0PnGrCFg5gY58IcHCyEeOZBFJHO3N
         tV7PqPcxXL6Y+Ot2XVSUNfihZ+sW0JqopjTkJ+cIGdjqT5EijjGSq1cfIkCAE8+OZgFz
         a5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature;
        bh=Sk3qMNj+wU7oshabhHpq0idhvVfkeeElu8xlHLchaKg=;
        b=QHW6RaGujr3HlVqGYStoFrYhoeHKkdnKXfCkVwHCLAS/ZP5atuuRx6ytw6EH2I4Ces
         Y5BiwrKHk69dfW7AEWwVpolCUrQbOGmXOM6eEZHitgwELEQhosSOctcu/frG5Ph9kzZK
         h/LnJ32BHFYdvS5qQJuxVvFTmiHcxSlBYpSrz6xzyN13McbntGmFp85c2Ugp92jWBSLe
         fIY4pHMyEhNKUHsc7erf9rIhrBXaVCcox8cF06qlyCwhMTB5QJ1cQ3Yd04ksi4ovGDP1
         2vznsf1WZNQzMSSjnow/WxKzvcxRfdd4MM8VsSgWRvs6zvxbjpeNdwrRk70/pkvlKVc8
         YShA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R4hbMo0o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r55-v6si2043957qtj.56.2018.10.15.13.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 13:20:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R4hbMo0o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC9LY-0000qb-JP
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 16:20:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC9LJ-0000p1-TO
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 16:19:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC9LG-0002YC-KE
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 16:19:57 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gC9LC-0002UQ-Tp
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 16:19:52 -0400
Received: by mail-pg1-x541.google.com with SMTP id 23-v6so9682524pgc.8
	for <qemu-arm@nongnu.org>; Mon, 15 Oct 2018 13:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Sk3qMNj+wU7oshabhHpq0idhvVfkeeElu8xlHLchaKg=;
	b=R4hbMo0oQzU5S+dfwrhbZKg9D5QdL1Kb/C+pFDVQ+hs4qciq4u4ItKwHVY9gw1Tojb
	CnZ08DYpi76ipfr4ZawZhJxG5LERizpjA/mGp5gPfKHHgcof+12F0WbruFaR4qz5uyh/
	f5rbJlnr8pQEKwiiuw4aRxQehetQ0Ft/v37dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Sk3qMNj+wU7oshabhHpq0idhvVfkeeElu8xlHLchaKg=;
	b=YkNepjSDcrO1rRMbdqeyO1FiwMMXsCm30W+30J7AdC4ZJuhillvaWoELIOk4P2L6p5
	ll6NMBhSdl4P28kmYZoyaK1fpHOn+yKu+Sv65h+YdAHmPCbW4uTxfz69qMRFIVrNfjdI
	i3heU7TnaUQyUonhAdu6Ud4wZKqfsUwHJeCmpCjhO2QsZ6iXgqV7wTJebQiJwpuLegUI
	EsRgy8AjvpStLWptJLTxlXWC/v5x4oD6AhpesXroPmTKCWdkZzS7QyOsrCurerENfGrI
	+paT6uIQREqNdp/oYtJkr4DmqtRFH2g4FJRS56wEZW3V76NIHpKsmKUpK5ZwBgZIFtoX
	ZHww==
X-Gm-Message-State: ABuFfoi+gH7VP5tKLf86LwbYx8xoVXecVc31JdabJfBHCGwTbEPplqIW
	JFcJtkOWl3SyXnfvjfI1pVZrVA==
X-Received: by 2002:a63:4384:: with SMTP id
	q126-v6mr17425243pga.142.1539634787353; 
	Mon, 15 Oct 2018 13:19:47 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	f10-v6sm12562876pgp.72.2018.10.15.13.19.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 13:19:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: Aaron Lindsay <aclindsa@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-6-aclindsa@gmail.com>
	<4fff310a-8fc6-91f9-6caf-315c84d983d0@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8e83cbd8-8c2f-f6f1-4423-f19a5f13aa5e@linaro.org>
Date: Mon, 15 Oct 2018 13:19:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <4fff310a-8fc6-91f9-6caf-315c84d983d0@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 05/14] target/arm: Reorganize
 PMCCNTR accesses
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1b+6vmm/unFr

On 10/15/18 12:50 PM, Richard Henderson wrote:
> Ok, looking at this follow-up makes more sense than the previous patch.  Would
> it make sense to squash these two together?

Or, rather, split into two different patches: the first splits pmccntr_sync and
updates all of the existing uses, and the second which adds the migration hooks.


r~
