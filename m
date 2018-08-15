Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp548064wru;
        Wed, 15 Aug 2018 03:57:39 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPy1jGAjhrHpEZmvp3+P9hEKFC5JnvmaGPWwZDJtcyV/W7q7NU353Q5nHrvrKmfpqaYyCN2h
X-Received: by 2002:a0c:d90a:: with SMTP id p10-v6mr22582482qvj.171.1534330659643;
        Wed, 15 Aug 2018 03:57:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534330659; cv=none;
        d=google.com; s=arc-20160816;
        b=0VqCRphIA4OS0BkakdAXZztkMA9/tHGlNSr6BLDy/Lpx8aTOBMVRQ/Qo1UIPrjLZw+
         uyYCqYmgNiGUVgZb1BEZLsmns3H00pjQP8k/t/B4qifGY3bBiUwYjH/IA/MuGcjVCEAn
         D6Mol3884MGJZ1aWlUb1cebLtFkSWLZRjHGubb/EpmjTl7wU0cWUvhLqfoUahDhMCIbm
         COVzO1Cl8rWAbLT/U8KGu78efviaDUNxgRMXoH3pXCfQf7y+yzADjTV4YsHTjqdjCx44
         ll2X58zqAQYN81ghjkRW/wGhTdw4ljWIMBXnmZph0gX7fJs65JMh6r4fck/QyRM5juB8
         kyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=TkxdP/bEujiFQsojEx6Z5Kilb3AUXsOuDNXSMFOg+3Q=;
        b=ZXaya+L16ZWhRlHF3AM1LB2QI1F7Clf1VYbB7WtkukOOmR8tpDlKzEtwFv2iF/ojPk
         LNHx2uAk2xxK15ruipj3DLGkuAFvL6SOMQ8t2hlgqPMp4k3aU9xF/w8ceECo5g4RLBdp
         Hl3YBzcUXJmRzqe9rEpqL4zoNVUIFKG9Opy4/loYWpcZoc3k86wQSsSKv6uuSanfD/MQ
         Whi3nzlZerLtORqzmc8R81m0Q5W38O+6MebEGbofvwqg3jKTcR+UudqpN+VCjyYd4xMJ
         jdzxEAaOa6QQM/1/SVpe4ivaL0mD6RbNZ/NEhg9kkp58XDV9UYhJfqvOPwF7P79x7iZv
         Yw3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S3JYC6hJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m32-v6si7057873qvg.182.2018.08.15.03.57.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 03:57:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S3JYC6hJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48549 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fptUh-0005mA-5a
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 06:57:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fptUU-0005ls-Lx
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 06:57:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fptUT-0005aq-Gs
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 06:57:26 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:42722)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fptUT-0005Sb-4Y
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 06:57:25 -0400
Received: by mail-oi0-x243.google.com with SMTP id b16-v6so1236744oic.9
	for <qemu-arm@nongnu.org>; Wed, 15 Aug 2018 03:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TkxdP/bEujiFQsojEx6Z5Kilb3AUXsOuDNXSMFOg+3Q=;
	b=S3JYC6hJE89AVvym8AYSJqWuSLHDm7j5z3Z60HcR3ZnG/ueQOvoDeiYWCgoj2mMI+R
	mqm82wq0PK902WzmI8sileOozaWkJ4qJpr6CrDRkmpICERbz8Fk54OEmmGUsLETnarM+
	Z+0Q1iD3mJZLWC5So9/h1xJHoxda4HajBTqr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TkxdP/bEujiFQsojEx6Z5Kilb3AUXsOuDNXSMFOg+3Q=;
	b=ieZ6LSCQ43Yl7VgOAsqSaED33xvfBpME6oHWLDvH6fHN/SmuDcksc4qKF1D8+jmrFH
	a7LciwqtwpOjqqlBHipJ9pjUEsMxYtKakMbYIx86hU6LGBE3hcI/VowHSjqRggg/aGbr
	4fZZOSBxwPDvG2xDtzOz/c9qBDeAvX4QYxskeSEc453UuYqNaER/QMddi7ujMcJDCZXT
	fshnZPyxt+by3nbxmkvEbMjjQKhpsI4awJLvs4VlqlnuqVfUQGdGYi+QdhGzDt7kt/8M
	D8RziRIDwbyBMm8tbMl8guXpFNDbB0UuTfxdqPhZnnC6TglM0/REd8IA/Un9ktFbcbtv
	iwiA==
X-Gm-Message-State: AOUpUlF3NjiGW3bwpB2wzZUomMvzG3v2c8X9tkNUxbkCKIL6xjQMR6yX
	4xfulQBmP9pvQKFAycwb46qvhOZ49d+xeqedvihGXw==
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr27892543oig.13.1534330643861; 
	Wed, 15 Aug 2018 03:57:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Wed, 15 Aug 2018 03:57:03
	-0700 (PDT)
In-Reply-To: <685c5db6-48b6-e103-de94-233602315e2a@sysgo.com>
References: <20180814165419.9116-1-rka@sysgo.com>
	<CAFEAcA8RQ2X83AQOcvg3acJhJ6ioJ7KtJ=V2iFiUmQh4bF_fmA@mail.gmail.com>
	<685c5db6-48b6-e103-de94-233602315e2a@sysgo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Aug 2018 11:57:03 +0100
Message-ID: <CAFEAcA-sEwv2eKtah9M=McjoqzQWEF4zeDZij0zc7MLYgOu2hg@mail.gmail.com>
To: Roman Kapl <roman.kapl@sysgo.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH] target/arm: crash on conditional instr in it
 block
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Roman Kapl <rka@sysgo.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pydikZ86dCxc

On 15 August 2018 at 09:30, Roman Kapl <roman.kapl@sysgo.com> wrote:
> Hi and thanks for review,
>
> On 08/14/2018 08:12 PM, Peter Maydell wrote:
>>
>> On 14 August 2018 at 17:54, Roman Kapl <rka@sysgo.com> wrote:
>>>
>>> If an instruction is conditional (like CBZ) and it is executed
>>> conditionally
>>> (using the ITx instruction), a jump to undefined label is generated.
>>>
>>> Fix the 'skip on condtion' code to create a new label only if it does not
>>> already exist. Previously multiple labels were created, but only the last
>>> one of
>>> them was set.
>>
>>
>> Hi; thanks for the bug report and the patch.
>>
>> This case (CBZ inside an IT block) is architecturally UNPREDICTABLE,
>> but we certainly shouldn't crash QEMU.
>
>
> Hm... I am not able to find that claim in my ARMv7 reference manual (but I
> am no ARM expert).

v7A Arm ARM DDI0406C.b, section A8.8.29 "CBNZ, CBZ":
pseudocode says "if InITBlock() then UNPREDICTABLE;".

thanks
-- PMM
