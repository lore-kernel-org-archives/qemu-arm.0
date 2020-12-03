Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp505597lfb;
        Thu, 3 Dec 2020 08:13:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwZQExcezP952RFTiDFm0idRwJ/t8TwrXnn9T00aFAlXlywkpYSSv+2OCUAuBzIyRF/KCO
X-Received: by 2002:a25:c089:: with SMTP id c131mr5262673ybf.510.1607011982454;
        Thu, 03 Dec 2020 08:13:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607011982; cv=none;
        d=google.com; s=arc-20160816;
        b=vTuvYHTjL3rdifIBC/hhxFCujVRrHW5wubFeNPQLTKf6Z69V6O4GWBLfmQSkWypaLJ
         wl5eO7jJ/0iadZeekjnP/YPTgJBD9/7bUNlUxWOo59ldenQcK3zgDpJHhGjN4cirP9eJ
         0PQC1uhIQVAceRc6Jtg+tPpFot/nzUtksQBLaN5R+/AgluKUebKwNoyu7iXsnP8g+lAz
         tM7kJE5Nib7yPFXK1xn9X/8fwM5DQrzSS2RPVJg1eoNe11d8hNTiKqHqoORzrnfq3yAl
         Gqw+FWZbr53Kp4U7KIzlH6fJGFkvD6fElZ/1RvvFLqPWBCRWInZZsQwy3/+YjqHbaTT2
         eZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Etglnnv5VIHecWCvT1ZARm5MV8XjKhnmcSRrUl9qrl0=;
        b=xiFQ+zXPHjbVmrKZywHJteTv1UDUzXZmBUg3drHBfAg+JpvG36K1zhMUnZeQhm3rL9
         NKUk32ujBGpiaSRTm5jL2V0aZ5g8eTAGXxNLF1i6AlUihg2iQxSbDsxQRbTBiTNp/aqg
         DY7/Ug6jzlq7B/e656YDSDkR26789T0zxDbkNh2rXPPwrx0m8kKpT1Xc7fq4vTMzKndG
         PXKSLsU+qg0nboSsqTG5o1HuYQ8oUwnH4V4shjcvzHinubE1pfCSgRWF+qadE5hQgJoU
         tfahU0ZHT0rsu5adbAgmkKXmfwjy4EMJZN3C6n+tr+gFRr467KlvRiqFKXLekYQ+HgDT
         Qw0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si2063687ybn.368.2020.12.03.08.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 08:13:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Received: from localhost ([::1]:44568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkrE5-0001TR-QE
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 11:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kkrBT-0007MN-5m; Thu, 03 Dec 2020 11:10:19 -0500
Received: from mail.ispras.ru ([83.149.199.84]:52064)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kkrBO-0001GX-Hz; Thu, 03 Dec 2020 11:10:18 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 70DDC40AAD8F;
 Thu,  3 Dec 2020 16:10:08 +0000 (UTC)
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <CAFEAcA9XFGbyYfcpoOVhtV_wySi9=DyMGe84C4uwYG14Z6bD6Q@mail.gmail.com>
 <56701347-e0a0-ae47-8bba-f5cdff253475@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <3d6d46d8-04bc-7ad8-d71e-4ce15a6e7e47@ispras.ru>
Date: Thu, 3 Dec 2020 19:10:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <56701347-e0a0-ae47-8bba-f5cdff253475@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BdgHGXIZqU5B

On 03.12.2020 15:30, Philippe Mathieu-Daudé wrote:
> Cc'ing Pavel
> 
> On 12/1/20 4:55 PM, Peter Maydell wrote:
>> On Wed, 25 Nov 2020 at 04:06, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> As reported in https://bugs.launchpad.net/bugs/1905356
>>>
>>> Not implementing SCTLR.A, but all of the other required
>>> alignment for SCTLR.A=0 in Table A3-1.
>>
>> Something in this series breaks the 'make check-acceptance'
>> record-and-replay test:
>>
>>   (30/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt:
>> PASS (9.14 s)
>>   (31/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt:
>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>> Timeout reached\nOriginal status: ERROR\n{'name':
>> '31-tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt',
>> 'logdir': '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/result...
>> (90.19 s)
>>
>> The log shows the "recording execution" apparently hanging,
>> with the last output from the guest
>> [    3.183662] Registering SWP/SWPB emulation handler

I looked through the patches and it does not seem that they can break 
anything.
Could it be the same avocado/chardev socket glitch as in some previous 
failures?
What happens when re-running this test?

Pavel Dovgalyuk
