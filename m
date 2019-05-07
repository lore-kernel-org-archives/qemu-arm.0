Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3219510wrh;
        Mon, 6 May 2019 22:18:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDe/tSIYfdUVazTdWT5nFTH66L4xPfQTEtgFTlcQiPBDdAJIvbIhNeLXMbKC8N7D4jcqqd
X-Received: by 2002:a5d:4f87:: with SMTP id d7mr12631842wru.192.1557206299636;
        Mon, 06 May 2019 22:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557206299; cv=none;
        d=google.com; s=arc-20160816;
        b=aQWLbHMDcCrGcfwGLvN28J3V/qKi8Wf4naRUfJkno2K0t1FzFyW2Xje2WH5LzgQXWg
         yr4txOIBAFXpMhNmhRO1oEcuPVLUt1PTpJqITYGxErAmq1XPEJ5UJfzcfyZfD23SLhWW
         t+50UOew6GOiS1tumID7iG2S0jlQdBI4t6Av8KjIRCMGnwGbP0Eqn/IE8vGGbrCZbZRI
         9LVwqYGThkd1sVfLYDe0zYy10khdAm2d4qhWiRoyOh9zp94wupz00KxoMa6L5pRmbs4H
         eu56Ei7Yd9wcaxskXzG7o1hPV4nBmlcr49negvfrbdXr0Wjy7UH8S4DQPvch8bKOM2u0
         Lpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=2mlt/Nivd3xg9klZHlZRU3nWz1AmHiwwGK9asAfsNt4=;
        b=oex9CA1nzLhjVMkM+GdDIpqZKqNMweWRRn9S8kCQ6iIRu/t756yQrjCxlOVLbbKgv5
         V66xB2nqlUS8+LTukeTMBdPof+1BnV+gyRsr8DCpryrx1kLTlvjxOc6kXRa+VE0wakaI
         Rqu0sG349lQnCSC1v3dYbU7L0bU+eEbkxlgyfVcRKkcRVJzQMsHz+Mfsi8/Z2jAnuPpR
         q+VGq7cgX8iJ2lZFvrRdnwDe7OjFt5oUzuH5QcSXw6oQmEP9/oGBjIhdkfe6ipno/lwo
         6oGvODSZHgHeG5PrkKuXNK3zI2Ym+Ed9n3+QZ93GHvoHoR+JSa1ZNcV9Cz+u5gjLpoju
         Mvxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si8642297wrs.59.2019.05.06.22.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 May 2019 22:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNsUc-0000AY-Mc
	for alex.bennee@linaro.org; Tue, 07 May 2019 01:18:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNsUQ-0000AG-UI
	for qemu-arm@nongnu.org; Tue, 07 May 2019 01:18:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNsUP-0002Sm-US
	for qemu-arm@nongnu.org; Tue, 07 May 2019 01:18:06 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40739)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hNsUP-0002Rq-Fn
	for qemu-arm@nongnu.org; Tue, 07 May 2019 01:18:05 -0400
Received: by mail-wm1-f68.google.com with SMTP id h11so17979842wmb.5
	for <qemu-arm@nongnu.org>; Mon, 06 May 2019 22:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2mlt/Nivd3xg9klZHlZRU3nWz1AmHiwwGK9asAfsNt4=;
	b=t5fjQTEPoCzo9IRgIyTx28dCgEQIU9Z+0qiZP4Yn+ggls2JXvSjFLujzPj6QUeWAhV
	Ax4+Nb1YlmoZpKi+sJMc0grSS/wGjZW4EQFhFK3F3TOJ7oM7NW4UeNZqV33DZyXFSRaE
	CTQxoLIwDFCKBMpSTgyNqTRETDrCfhkL8CIIDShJPOxVUZf9Svfs6zuYjp9WLg1V6jvU
	hdBJ0qJGXYhwRvYQgAn5LIoWpyf4/szeh8elSnvhzqz4eccgQely8mAF6/j0/IeQ9coF
	XejjJyaSQvWwkepKB+asXblvLb+bG/oDBiVG1Nhs4avkJnnilBGJYvtm12GnsMBIbGJi
	oHrA==
X-Gm-Message-State: APjAAAU31Cylt14IJR6EdQ5d+1RzVSfzii5Ri4OWZk4N5rXmDgAR5Gmz
	d0g/c6CN2WbPz2qy/uTkzDUp4g==
X-Received: by 2002:a1c:f413:: with SMTP id z19mr20101337wma.71.1557206284418; 
	Mon, 06 May 2019 22:18:04 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	t16sm8233388wrw.56.2019.05.06.22.18.03
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 22:18:03 -0700 (PDT)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20190312234541.2887-1-philmd@redhat.com>
	<d5d84efd-ef8c-4e0d-d48a-6996d91832e7@redhat.com>
	<20190506214155.GI28722@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4202015a-d86f-a626-e87c-57fb328ae64a@redhat.com>
Date: Tue, 7 May 2019 07:18:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506214155.GI28722@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [PATCH v2 0/2] Acceptance Tests: Test the Raspberry
 Pi 2 board
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 23D/mkwx9Nyh

On 5/6/19 11:41 PM, Eduardo Habkost wrote:
> On Sat, May 04, 2019 at 01:52:51PM +0200, Philippe Mathieu-Daudé wrote:
>> On 3/13/19 12:45 AM, Philippe Mathieu-Daudé wrote:
>>> Add the raspi2 to the list of boards tested by the
>>> boot_linux_console Avocado test.
>>>
>>> Based on "Acceptance Tests: target architecture support" v5:
>>> https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg04111.html
>>> Based-on: <20190312171824.5134-1-crosa@redhat.com>
>>>
>>> Philippe Mathieu-Daudé (2):
>>>   BootLinuxConsoleTest: Let extract_from_deb handle various compressions
>>>   Boot Linux Console Test: add a test for the Raspberry Pi 2
>>>
>>>  tests/acceptance/boot_linux_console.py | 34 ++++++++++++++++++++++++--
>>>  1 file changed, 32 insertions(+), 2 deletions(-)
>>
>> I was hoping this series would be included in "Acceptance Tests: target
>> architecture support" by Eduardo (removing the 'print' debug line) but I
>> just realized I forgot to Cc him :S
> 
> Problem solved: queued on python-next (after removing the print
> statement from patch 2/2).  :)

Thanks a lot!
