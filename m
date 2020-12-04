Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp342516lfb;
        Thu, 3 Dec 2020 22:17:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyecb6QhJIcGaLxKQE76K0n43WkJRluPNF0WlN8PHZpYTAKNJcGDUqXC5KhPZ3JzMbiRXIx
X-Received: by 2002:a25:2189:: with SMTP id h131mr3761877ybh.238.1607062678490;
        Thu, 03 Dec 2020 22:17:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607062678; cv=none;
        d=google.com; s=arc-20160816;
        b=dOIYy/R4COGMBZmHFbaFcSio5vuuvg8Yk2N16nQ+qzHeY5v2pN2jeNlu5pmFNeXAPO
         huQJ09LYiLf7b1E9n+OmRbGhA7ygXNIjSndPIL6cKGz916gKfnhqngMt9CnX1jcANfua
         ZPHmblWLFPYTK68DKZFI2/yPL426OYJNizA8StrY2Wz3yp/5l1SuwbJvH13/EeXHjuJJ
         uyBgB32HZhqPCaJtaA2CRSH6Ibsm+Se1eBgeLSki7RsEH3EUIfvxqtUt5jPGUptocgc3
         3W4VzAELNg3N2x13Bg8fTtMoTiYYAPXgwTee5+OgzHMRCLpbAVs5oBpX9jrA/9upJHy2
         RayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:subject:from;
        bh=ec3eSGXe29Xq2JYfwp3iAHMcompb+rL52VaMhiEe9q4=;
        b=W+vtetyx8AlkAiRMuz3jSTf3rX42p8NnRBO6wU6GXrWcVG8qUfYMbFG8OtdcNnl0qE
         +allbOKQVheYFdpaw4UORipEAsA/f5gfYZrcRSHFsuW2dDuGUhM1KUqHLBc+i7tn7Xao
         H/yr+hAIAJFEQrLJkzzznDd7R3fDlFrRuUxUP80Dq6uZZeYQjtkyjlgcbach50ihNHrO
         KkJpzE+MWkf23j0iDo0jxsD0n16r3tjrvuAAb3vKJtW5lLQYZWmXZOxEWuwG8pcTxbg7
         7CU1Bl2bS2RQcBDzyZ8NNUjCO5VoDVyZyTjfGrHyjexA++S6j50TwLuMtg32aq4UH1CO
         EAmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 145si941824ybc.160.2020.12.03.22.17.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 22:17:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Received: from localhost ([::1]:51090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kl4Pl-0001jd-Tx
	for alex.bennee@linaro.org; Fri, 04 Dec 2020 01:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kl4PZ-0001iq-KA; Fri, 04 Dec 2020 01:17:45 -0500
Received: from mail.ispras.ru ([83.149.199.84]:50262)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kl4PK-0002Wx-RO; Fri, 04 Dec 2020 01:17:45 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 9E25C40D403E;
 Fri,  4 Dec 2020 06:17:23 +0000 (UTC)
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <CAFEAcA9XFGbyYfcpoOVhtV_wySi9=DyMGe84C4uwYG14Z6bD6Q@mail.gmail.com>
 <56701347-e0a0-ae47-8bba-f5cdff253475@redhat.com>
 <3d6d46d8-04bc-7ad8-d71e-4ce15a6e7e47@ispras.ru>
 <CAFEAcA_ATUZ+v8VE8q34mmi3pLhg3qFDHgi7mQB-JJKDEZuzaw@mail.gmail.com>
Message-ID: <3ab6b7fb-51cf-0ec4-2c70-e86bb01dcc3f@ispras.ru>
Date: Fri, 4 Dec 2020 09:17:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ATUZ+v8VE8q34mmi3pLhg3qFDHgi7mQB-JJKDEZuzaw@mail.gmail.com>
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
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: av4CKihHfLVI

On 03.12.2020 19:14, Peter Maydell wrote:
> On Thu, 3 Dec 2020 at 16:10, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> wrote:
>>
>> On 03.12.2020 15:30, Philippe Mathieu-Daudé wrote:
>>> Cc'ing Pavel
>>>
>>> On 12/1/20 4:55 PM, Peter Maydell wrote:
>>>> On Wed, 25 Nov 2020 at 04:06, Richard Henderson
>>>> <richard.henderson@linaro.org> wrote:
>>>>>
>>>>> As reported in https://bugs.launchpad.net/bugs/1905356
>>>>>
>>>>> Not implementing SCTLR.A, but all of the other required
>>>>> alignment for SCTLR.A=0 in Table A3-1.
>>>>
>>>> Something in this series breaks the 'make check-acceptance'
>>>> record-and-replay test:
>>>>
>>>>    (30/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt:
>>>> PASS (9.14 s)
>>>>    (31/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt:
>>>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>>>> Timeout reached\nOriginal status: ERROR\n{'name':
>>>> '31-tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt',
>>>> 'logdir': '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/result...
>>>> (90.19 s)
>>>>
>>>> The log shows the "recording execution" apparently hanging,
>>>> with the last output from the guest
>>>> [    3.183662] Registering SWP/SWPB emulation handler
>>
>> I looked through the patches and it does not seem that they can break
>> anything.
>> Could it be the same avocado/chardev socket glitch as in some previous
>> failures?
>> What happens when re-running this test?
> 
> I ran it a couple of times with the patchset and it failed the same
> way each time. Without is fine.

I applied the patches and got no failures on my local machine.

Do you have any ideas on debugging this bug?
What does "arm-clang" means? Is the host compiler is clang?

Pavel Dovgalyuk


