Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1267972wrt;
        Wed, 23 Jan 2019 15:38:41 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7f0LYEjI1x4ySNe1ZUhXWiuRIzvU+9uapw78jTayxQuaFA/Vyn9QddFI8rsmThwKG4ipUb
X-Received: by 2002:a5d:60cc:: with SMTP id x12mr4499720wrt.193.1548286721831;
        Wed, 23 Jan 2019 15:38:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548286721; cv=none;
        d=google.com; s=arc-20160816;
        b=ya+yKCiG17LGmVEvw321QFCrvXcH1sA9/eSt8gfVCDNCVh9pUUHRqAZYsuQSYZjT9r
         0CKgufQyNzaqaz9Xbuzn4FXSw8uZPY/SYfcYmSaBo6zJX6mjQgZp3qld0G3KonfvQCka
         OK/D00EQlK7Y+jLAznp5qRxuj5LHmFYFSd5tmFqvRqYSDKfGDTFEYGaXhqirwKUaEzx+
         ZRUHLzHEL+1GbHmctRQaKAcS3/QxflRoM8k6gtE6tA6VZ54ahIqvI/ljWKcV/lkrTAqF
         alag4LPCijm7C+chIKig+CgfNAPyKrXkGVF91AnGpmQCCeomF825fnFWQ2n14xLElOqZ
         Im4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=eeX299ojmzosFkfoRjkt/j90+8Sv/HCAhdjJlMv27ws=;
        b=tPqrbvRmF2K3JLDdKjS+AVHlQhTWAlrMAeM3yS8ai+c2KVtPNE3Q0lreWiHKuVshzA
         3rsquUXwc9A3IX0avr8sebYIRVAo7tMDYU5w6WYJndBuLu4jzUsoerTMS7DLpWiXNeGe
         xfFHsyGBZW32WYwJk0vfdvYwwP3Jmn2sZ0CM91byYLTsKnqP05oPpPIZLa8GPxxDiKHv
         JiuEdLc6cgOD3wL1ZseP5+XaCy79z5WUrVphT+FdxvQDYZCbw+SiMMZM1pKaUfVxr6SE
         cM+ArLKNj7C63sbUD4xjuy6wFjCnftGChgjqNiN1q1cKyJaIcUb1nA3luU4W3avIjav/
         tzTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="U49/z1Vv";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si29941849wmw.118.2019.01.23.15.38.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 15:38:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="U49/z1Vv";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:43573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmS6S-0004Dz-Uv
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 18:38:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gmS5O-0003ur-4k
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 18:37:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gmS5K-0002pg-OW
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 18:37:31 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37107)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gmS5D-0002ac-99
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 18:37:26 -0500
Received: by mail-pl1-x62c.google.com with SMTP id b5so1950728plr.4
	for <qemu-devel@nongnu.org>; Wed, 23 Jan 2019 15:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=eeX299ojmzosFkfoRjkt/j90+8Sv/HCAhdjJlMv27ws=;
	b=U49/z1VvZZoT6Txclc0zXIpUU5lAj84WJJ1BXfMahD5RcCJTHHwfLwckjxaPCkMMho
	59e3hDqzxn+zYT2xtwqJbvy9ZwqrsEnPtMKXnrd/OiM2X/GJZWBgdMcLvTIJQVYiBCLE
	lEq26jwBmLbH18b5JdpgkE74YoFyxt7Z4oQKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eeX299ojmzosFkfoRjkt/j90+8Sv/HCAhdjJlMv27ws=;
	b=eO7SY73CJS05yw4LZpjny5VKzPVFdkbpT3jURhQPUpHgxZ+5GjscoAYYEBBISG7QFL
	hCqTq+WW5rNZN338VmYyLLIPtOQwjtR5bW7NQyD6hestoMu/EjAPJC5S2JxW+0yCsN4T
	qbJUXw2fTUG/MlRfCn+NeqSLAcREeBLH4oq0YNew6tjEky04JrKKVSGqJMlVTg2lG1l+
	Dtkxju+AEuACrSqlr5WeDMfuQvydzfn+Dv0mdWIQ+VaBOWHBVMWIlvQU+0s0fq6gO8Mg
	jXyYrEkMiUIRP3czmzw2mQxTxVSAQ/asI7Kf3yk7yCjeXfCfQXlbAHd3jm3FyPR54WKz
	qKGw==
X-Gm-Message-State: AJcUukcXh74FeXzCu1wB0QAQeybLmMhIrw0Mj9UfcB7Ldf+coIw8KWhB
	Ib8Q6joiEtrKkV/m2dfQAjAQmQ==
X-Received: by 2002:a17:902:a6:: with SMTP id
	a35mr4265215pla.201.1548286639628; 
	Wed, 23 Jan 2019 15:37:19 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	n186sm24803722pfn.137.2019.01.23.15.37.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 15:37:18 -0800 (PST)
To: Aaron Lindsay OS <aaron@os.amperecomputing.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20190123213227.17077-1-aaron@os.amperecomputing.com>
	<20190123213227.17077-2-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7794239c-7850-1bb6-cbcb-b648533d9036@linaro.org>
Date: Wed, 23 Jan 2019 15:37:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190123213227.17077-2-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62c
Subject: Re: [Qemu-devel] [PATCH v11 1/2] target/arm: Send interrupts on PMU
 counter overflow
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TISRzGfOrn1z

On 1/23/19 1:32 PM, Aaron Lindsay OS wrote:
> +        uint64_t overflow_mask = env->cp15.c9_pmcr & PMCRLC ? \
> +                                 INT64_MIN : INT32_MIN;

With type promotion, this is the same as writing

    ? 0x8000000000000000ull : 0xffffffff80000000ull

which is probably not what you were intending.

Perhaps just ? 1ull << 63 : 1ull << 31 is better?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
