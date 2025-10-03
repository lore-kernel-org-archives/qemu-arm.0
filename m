Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0265ECCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 13:31:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4fsJ-0007sj-3O; Fri, 03 Oct 2025 09:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v4fsF-0007sM-LM
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 09:31:04 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v4fs7-0003DD-3D
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 09:31:03 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-330631e534eso2489486a91.0
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759498244; x=1760103044; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GGUFXm2DbRRKSiVdsT9a9dQwJgyQUoVjDCX8pENCzG0=;
 b=cN4+mpeArOR8ZXSuxq3Xr5h1GG7f9T6WPTHnH34p1XlSDTYSTZA1XpUnJRcU1D8FhA
 7VTiuvX7RPpwKwvVY/95VAQu1sWiR/CUN9jMD5e1Dagv0cZEiz7goXnUdnMi8v/MyQ8C
 XQpxXyigohxK6SeoN/BwZ48rOp1Y3GOFdTwSumb7PqFdVIYvB57sCfbCWRobNUA/AwZu
 aKqZvlq81E9Qs4pwXopgCWRCW15QglLAq9gj6CwVm3eC3uVwCI0pZi7Hr3/qqYwpxUwz
 +0lqJZOkV2DfEh/riQYMysiCDEjKspUpk2BUWz5I++uEf5mGYROukhWSEox8PrIfSQwX
 N3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759498244; x=1760103044;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GGUFXm2DbRRKSiVdsT9a9dQwJgyQUoVjDCX8pENCzG0=;
 b=GJTKvA0l5KeqyXY7xYDJtziaAFTxboOUwZGqI9vb4SpGqU6L8VkvvmROewTJ9wF+Rd
 JZKqt+P6xdhxHZZC9o3xGtB3KAeoXRpYJF/p+blwMd+wJercW85VYezy6H2tZWMLMCQH
 djXjVZLqIy2+zIGwHJ7ZDzgFZX5rzWqbiImND5hjTw+gJKPx4BDTylWpCyBa5qQkvsXC
 6+rkyn02u2HnQOcxFGar1RSIHWJ3uCUwHLGdYqAg1gwcx/spupcL+qz44NBgd2KHVeHM
 1QTnl+1iocF8kSc0z1skeVa/fCgT4feSDtV+ZrRnUuWRuAHzrOhfkRXW9pXUXhWltdtt
 kUHw==
X-Gm-Message-State: AOJu0Yzadya4KE5e0/ySJnTFW3zRSQuWcY88d8rmmdhPa9EmiqgLUnvT
 aBsae3UGUBsIDnkKOnsyEzHrqzCc+x+F2GNUKT3e1V4Wq6qfj9p3PsnZpR2gR3ui/ro=
X-Gm-Gg: ASbGncsx2z8spAXpIwxUmW2UTfZetpDDDJ0TRlbN6KqxHR2t6QVpMSOkbfIhddvUeZ6
 t0CyKA5fS/F9WVbmy6RoIB8KtO+pLSj9cPaXYoOC/Qt1rNNIbkFIkMbt9aKYWhz1FipklRVAke0
 vJO9RMq+k7JHbUrI3abnCvgdkxK0BCxOJLa5RM82b20LPp2wOAOtjI3cZ+brmy7JvkitJ0ygfOT
 0ROd+3C+5zQeACI4in6gzI3yQUdDsPODH3NRGZ+8QoI+Lh/CsqCiU1r8jWPz0/77cbEqyKkifRn
 gvqCpdRmnivCeJEUso0UX7T3z+axKkpMc/DE2FHuDvIVq5JxLeO/jKhfH/IL69wk5EIcCEhIB3v
 6Wj8CLZgLxb+Ig3lO3lI5ur3pXbKqDK+2NChveNV5T4A7+yHztP5OBSQGmL++2vFITbZ/oFx/vQ
 ==
X-Google-Smtp-Source: AGHT+IEhX2Mytx5+xFX5JIbffMSu7j1batDPiC+XWi2feJpYvjE2bmBot8y8DV9oyDG99KYjBUdxtw==
X-Received: by 2002:a17:90b:3bcc:b0:32e:e150:8937 with SMTP id
 98e67ed59e1d1-339c2724b7emr4304320a91.6.1759498244505; 
 Fri, 03 Oct 2025 06:30:44 -0700 (PDT)
Received: from [192.168.0.102] ([186.215.59.111])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6099afa5fdsm4733502a12.15.2025.10.03.06.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 06:30:43 -0700 (PDT)
Message-ID: <bb7801f1-67d3-47d7-b5bd-39b1113ea9e0@linaro.org>
Date: Fri, 3 Oct 2025 10:30:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] tests/functional: Adapt reverse_debugging to run
 w/o Avocado
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, berrange@redhat.com
Cc: qemu-arm@nongnu.org
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
 <b5cb30d8-65a2-4bf7-b66f-5bfe61e19835@redhat.com>
 <8fb3351e-f1a1-4a1e-9650-33f0d4ee6d44@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <8fb3351e-f1a1-4a1e-9650-33f0d4ee6d44@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Thomas,

On 10/2/25 14:52, Thomas Huth wrote:
> On 02/10/2025 18.53, Thomas Huth wrote:
>> On 02/10/2025 04.04, Gustavo Romero wrote:
>>> The goal of this series is to remove Avocado as a dependency for running
>>> the reverse_debugging functional test.
>>>
>>> After several rounds of discussions about v1 and v2, and experiments
>>> done by Daniel and Thomas (thanks for all the experiments and comments
>>> so far), I've taken a new approach and moved away from using a runner
>>> for GDB. The changes, I believe, are much simpler now.
>>
>>   Hi Gustavo,
>>
>> unfortunately, this still seems to be broken on Fedora. After applying your series, I get:
>>
>> stderr:
>> Traceback (most recent call last):
>>    File "/home/thuth/devel/qemu/tests/functional/reverse_debugging.py", line 100, in reverse_debugging
>>      self.reverse_debugging_run(vm, port, gdb_arch, last_icount)
>>      ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>    File "/usr/lib64/python3.13/unittest/case.py", line 156, in skip_wrapper
>>      raise SkipTest(reason)
>> unittest.case.SkipTest: Missing env var(s): QEMU_TEST_GDB
> 
> Looks like it's required to explicitly use the --gdb=... parameter of configure to make it work, and it does not work without that paramter? Could you please have a look whether it works without --gdb with the auto-detected gdb for you?

Yes, it works without passing --gdb on Ubuntu. I'm checking it on Fedora.

But at least have you got the test skipped properly (displayed on Meson as skipped) since QEMU_TEST_GDB is missing?


Cheers,
Gustavo

