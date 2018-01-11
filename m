Received: by 10.28.173.206 with SMTP id w197csp900135wme;
        Thu, 11 Jan 2018 11:13:05 -0800 (PST)
X-Google-Smtp-Source: ACJfBov5hvoAPv5FaJGkmibis+wUOm9KYnwaEDreh6f9mkmJ0BL8LJCPxbJuEe/3sa7l15+QnWU/
X-Received: by 10.129.86.139 with SMTP id k133mr12964281ywb.253.1515697985751;
        Thu, 11 Jan 2018 11:13:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515697985; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1LlSvSH8dzJKFLPZwvigjwJkQQVHQs+H4LwS/KnAUQ2lVKLGuWyXfPKDzuXjMTnzS
         KnRSCbMR0Lwtu5kdmxRVZDgoKsaFKXVc1VbJ2kWc3YVKDbZf+PhpcyqwLUfns4o3cn0d
         ds71HtByK33CwhammfZAPTs1vkInF3C8ywJAR+VtLNumuwdo8fEx5qrFkVP73nbi5d3I
         uQ0zA/2w6zV1S4zK2J6hSxebNNAtC0XtwRNzaUhwNUxOsvAdRzMjIKPdiH2rGy53jZgJ
         tTkzL281wTSbQC3jnof0TLRGAQ+48Z+ohPFUgnmLPw6JVzhdRTfK0ljqMqiyvIZ1WjV/
         7HqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=2XC5tUL/QOXoQcj97i2EKUrbhZWLRFRA3gKggJ6nYFc=;
        b=cDfyt8RoJywLK1XIsEQ6FJHU6jawYXLBnH2rX+IlufjRJ57rHEpUTLEeemvV4VRZ7D
         8EKf/JYb1LViun0919ebq6MvTWS/wFkReXtOgpveyoFXKHzuJyhVKHPJksae8tvikStF
         uOC/XWP2b2Cv9DUrxpifWQlusvFBJORozLFA8ttryxjgqll/R5cUY9bSfhhEhjURDnsP
         zriufczYsjlYqxQwkyhDEAEs4cJcge4KX1UC0Gu52bIysgLVkYgqNZvW6REv2PwsL1RS
         4mzw6no6vfDVN3B1gtSUEJFPpbI163PKJxXfq4UXFxTEcPDsPTFYf6urm9dGUa8bbgsj
         A0NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SJ9VboWp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u206si2310792ywf.657.2018.01.11.11.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 11:13:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SJ9VboWp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZiHh-0002eh-8C
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 14:13:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZiHb-0002eJ-B3
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:13:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZiHW-0005Eh-OL
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:12:59 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:34129)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eZiHW-0005Dp-Iu
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:12:54 -0500
Received: by mail-pg0-x244.google.com with SMTP id j4so2835537pgp.1
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 11:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=2XC5tUL/QOXoQcj97i2EKUrbhZWLRFRA3gKggJ6nYFc=;
	b=SJ9VboWpS3uakpfK5XiRE5GrPRphaPuSw0rbbz+QlSBMXgMcQKEysrDFzkM5jgATQS
	doOPCSOkDkaUiIbtDTYoSNQ8H3Pv+QstKZk+X/RN0KSjno26nKz+A6yQV0AX9+tB8dTR
	LZ3IFIpeCV7sw+Ln5GiCwty+8NjW6Cc4pw1rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2XC5tUL/QOXoQcj97i2EKUrbhZWLRFRA3gKggJ6nYFc=;
	b=kfK5ZqCdOyOs5NrkFu6AqO1Bqt0Uw96eeUcITqulgHo5KH+RBucYEAxvUAC22il3rr
	bOItNF1h0Sgy9QJicfW7tDYuEruzhcLChVCXqBTGLUeBtt/HjMHsaX/5KAdmRd0cfObX
	ZWK1HnsGsrckiiRNF4AR/U5clS38wQnNhtc0uY2TMp9Y/d2mb6eNqa1WCLp641Ba9Twj
	nOVvWDKv07/HElFzEp+ZddhWi7y1kKsKms+uTET65fv5hEMbkI4JW7x9uw2Q2nw+vxKd
	jjScsgAunv4GhYA50neneGy9Eaxoy0gdXBaSI+9abWpJPhi4bNhkh5QJtMjCBzVEoLTq
	eSWw==
X-Gm-Message-State: AKGB3mK84XzDyFxaSByN8zEeMLSHbNUGXsN361K8xy7C4mqoe203gWRi
	GVK21M/VehR7GJhHuCITZlz/VGn2fng=
X-Received: by 10.98.172.7 with SMTP id v7mr20973765pfe.181.1515697973233;
	Thu, 11 Jan 2018 11:12:53 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-183-164.tukw.qwest.net.
	[97.113.183.164]) by smtp.gmail.com with ESMTPSA id
	m24sm4722038pfj.184.2018.01.11.11.12.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 11:12:52 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<20171218174552.18871-3-richard.henderson@linaro.org>
	<CAFEAcA9igMy9u0WdTBvJWms1G4Cd2m0QXUucJeXCJ1Uo=7OAMw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <300b87dc-7a0c-dda9-058d-674b115d06a1@linaro.org>
Date: Thu, 11 Jan 2018 11:12:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9igMy9u0WdTBvJWms1G4Cd2m0QXUucJeXCJ1Uo=7OAMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: Re: [Qemu-arm] [PATCH 02/23] target/arm: Add SVE decode skeleton
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1nXsqLlA+gwE

On 01/11/2018 10:20 AM, Peter Maydell wrote:
> On 18 December 2017 at 17:45, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Including only 4, as-yet unimplemented, instruction patterns
>> so that the whole thing compiles.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/translate-a64.h | 111 +++++++++++++++++++++++++++++++++++++++++++++
>>  target/arm/translate-a64.c |  91 +++++++------------------------------
>>  target/arm/translate-sve.c |  48 ++++++++++++++++++++
>>  .gitignore                 |   1 +
>>  target/arm/Makefile.objs   |  11 +++++
>>  target/arm/sve.def         |  45 ++++++++++++++++++
>>  6 files changed, 233 insertions(+), 74 deletions(-)
>>  create mode 100644 target/arm/translate-a64.h
>>  create mode 100644 target/arm/translate-sve.c
>>  create mode 100644 target/arm/sve.def
> 
> This will be easier to review if you split the stuff that's
> purely code motion from the .c file to the .h into its own
> patch.

Ok.

>> +target/arm/decode-sve.inc.c: $(SRC_PATH)/target/arm/sve.def $(DECODETREE)
>> +       $(call quiet-command,\
>> +         $(PYTHON) $(DECODETREE) -o $@ --decode disas_sve \
>> +               $(SRC_PATH)/target/arm/sve.def || rm -f $@, \
>> +               "GEN", $@)
>> +
>> +target/arm/translate-sve.o: target/arm/decode-sve.inc.c
>> +obj-$(TARGET_AARCH64) += translate-sve.o
> 
> If we're serious about the idea that this decoder script is
> general purpose, we should have a rules.mak rune for
> generally invoking it to create a decode-foo.inc.c from a foo.def.

I didn't want to attempt to generalize this until we have two users.
Particularly if we wind up with extra options to the script to change other
behavior.


r~
