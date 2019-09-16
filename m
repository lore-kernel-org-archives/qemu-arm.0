Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4282529wrp;
        Mon, 16 Sep 2019 10:39:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqymzsbXYgM+nGTKj45XtPHltADrV+37mh/+95Fuk9MkMVBddHk5B0sM3E5YPi9viZvCV0N/
X-Received: by 2002:a17:906:8258:: with SMTP id f24mr1136193ejx.234.1568655572906;
        Mon, 16 Sep 2019 10:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568655572; cv=none;
        d=google.com; s=arc-20160816;
        b=G2MPXoGf7YeZa9krJrGKqd1xs8rDYCYbPo9Z/eKzNXFdgaikoOoHvWnbnOkqmQ4sKL
         KtaIDKW6QdQeKCuH1ZbUjEg4UeH9ENLz8P1Onb/LiWfFI7hiJlDBrvso5MKT1XGr7JoB
         /Ot+zr9eRnKqnZd7lLJeqXsBvHrr7+Bs3jnhf8iPr3174mUivpDrxZdrrV2dYPWvEVt3
         2P/gbsjTmGXVEm/XjooBeXvOTeIqXmjjz7S/vpHH+0vlT6QYOFXAbSsIrRsNB+igKw78
         Rv1tNzS4CzPcvsW0E1JF3wcDLz4L+ml69dM5D7UlVek+6/OU+hknmWpbDA06vfpLV1fP
         CTxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-filter;
        bh=5RIkJfA5d/uwOPQpqb0IduLXfG1LxmuMNgKrl4XoKy8=;
        b=HfzqY6qliGqgvMpaSgUYTwMAn0F9c7I547wUlVnMyPPaa5tUKKGeA/0joRyEBaXnTY
         lQu6L75ff6Z7EC+v82SOZCL/FVA8LHVmSEp+1i/ITj/EPxw9RuWzgfLHeBS7qNfdZgpx
         DZ3A23CGSqIj8Y9H35gKyz142y7lgDAVJ0xGRO4P8SMhWA/UDpncUkpHJbEcejLKFNAy
         P80r6u8wnVcLUvyFq/pd851CFGS+gBQ3PxSlvTxpsTcKMzFJXo0t9ge5++fhT0c8qoN+
         k5cdG8+hVNGbZ3dlDgmnjQOhKoeos8FCVNtTQd4IZpzlrC0VHmWfQhzoXbXg4j/pikb+
         z/mA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo19si2943408ejb.271.2019.09.16.10.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 10:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1]:38076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9uyK-0002Yh-0H
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 13:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nramas@linux.microsoft.com>) id 1i9uy7-0002YD-LQ
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 13:39:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1i9uy2-0004m6-3c
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 13:39:19 -0400
Received: from linux.microsoft.com ([13.77.154.182]:38394)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1i9uy1-0004ls-U6
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 13:39:14 -0400
Received: from [10.200.157.26] (unknown [131.107.147.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id ED60320B7186;
 Mon, 16 Sep 2019 10:39:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ED60320B7186
To: Peter Maydell <peter.maydell@linaro.org>
References: <f2c90efa-1412-9c41-ba76-ebad90745f4d@linux.microsoft.com>
 <CAFEAcA9S7Kj5sJVM0Ot6KKpe9z3BfQWyZwUv-Vx_+g5sRbxqmA@mail.gmail.com>
 <CAFEAcA9rrcmJogBAXGeDW_YQ_YtJmOioHGVmP63msSRmRNEbjg@mail.gmail.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <3dc3e460-7854-d686-7c1d-86a0f8667773@linux.microsoft.com>
Date: Mon, 16 Sep 2019 10:39:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9rrcmJogBAXGeDW_YQ_YtJmOioHGVmP63msSRmRNEbjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 13.77.154.182
Subject: Re: [Qemu-arm] Adding /dev/tpm0 to qemu-system-aarch64
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VNAnsySUcX4Z

On 9/16/19 10:25 AM, Peter Maydell wrote:
> On Mon, 16 Sep 2019 at 18:24, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Mon, 16 Sep 2019 at 17:31, Lakshmi Ramasubramanian
>> <nramas@linux.microsoft.com> wrote:
>>> qemu-system-aarch64: -device tpm-tis,tpmdev=tpm0: 'tpm-tis' is not a
>>> valid device model name
>>
>> This is because QEMU only supports TPM device emulation on x86.
>> To add it to aarch64 somebody would have to investigate what the
>> hardware interface for TPM ought to be on aarch64 hardware, and
>> then implement an emulation of it and add that to the 'virt'
>> board. (It would probably share a lot of the implementation with
>> the current x86 TPM, obviously.)
> 
> Hmm, actually a quick grep suggests we have some TPM support
> for PPC as well (via a hypercall interface). The rest of
> my answer still stands, though.
> 
> thanks
> -- PMM
> 

Thanks for the info Peter.

  -lakshmi
