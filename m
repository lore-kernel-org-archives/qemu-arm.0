Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp844699wrq;
        Fri, 22 Jun 2018 06:38:09 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc1P8ZXccUiBjFOJ4whd+zrm9Hsna2yy1yRmsk/Y63lPHVMo5m7wSy16JentFBQLENlhGbM
X-Received: by 2002:a37:a4c2:: with SMTP id n185-v6mr1296807qke.230.1529674689480;
        Fri, 22 Jun 2018 06:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529674689; cv=none;
        d=google.com; s=arc-20160816;
        b=jz9Bry/vlYJbMWD37Hqoox6iUQCuWXtMr+o+/MabEI6OqXayyQwcsHOyrh6BS3/EDJ
         RpiZ8xjcVvoHf0dY3qz6aufFchPJYP0jYubOwwBHxjmzMvXne7kVmbifygPeqDk7Q3Xe
         n1WAvusiuRJ1yisMCp/qmfwBAj9UwrOxdqLugFJcsSRS4k4Oc9mtDMlv7I+wU81BpDNR
         gPp1CKEonxEbK9KOzW7gDoIWaNqVDPBXJFAWQC8Xr6Fk9d97F8DYZGiFLvgRnyuMSoUs
         wsDmN5Wvv1TIGk/oFoaBp8VnVIxWW2VQef6AXEKIyG4ZnXd3GSE7CQghysnYzstkVm9/
         feQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ZW4HvlzcY5Xc2TRp91BW/YIucMX2WLbM95X0e8eVsu0=;
        b=qtcFNu/3oZ/uS3KYnCXQQTIe7uMpi1zni7nSZw5BbxZoVul+rHNVoL3hzyZxx2rSrK
         uB+YS5grGk0B58/5imMp35/Yktt6zkIGJcKSGgutV94r0xaYMrnmTLDihBGVaK7WDIqo
         q2whRYbK2vs20G8rQDY1n3JEuqvgIxmQUnT+yvsIIQHQADeD8tyGrwr+8reJwbw1IZ9c
         MFqPYDil4YPnBT1VzsBgup3JS0HYENsw5QwKYxf/U+MrZ6Bju5k0XjQQpyFGVlp42b3i
         zHyvAAz5++2tptJdAocQpfYvoFS/KtUwcBCKHATt4uOcR4l1aRkdsMbj0h/dwtD3Msen
         J8lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O8c2XrG2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y57-v6si6198783qtb.337.2018.06.22.06.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:38:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O8c2XrG2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMGO-0002OR-QN
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:38:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM1u-0007on-SA
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 09:23:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM1p-00053V-V8
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 09:23:10 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:46529)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM1p-00053E-Qx; Fri, 22 Jun 2018 09:23:05 -0400
Received: by mail-qk0-x241.google.com with SMTP id o2-v6so3622646qkc.13;
	Fri, 22 Jun 2018 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZW4HvlzcY5Xc2TRp91BW/YIucMX2WLbM95X0e8eVsu0=;
	b=O8c2XrG2p3DngMwsxqBfLR3hdprPOjflFHkkpxnl9hw8BtK85SThUIQ4jKUA+sEscE
	aWkav5V7UkXRpUfMsKBddX287xvQ7HJbwqDoAhs5lznaV6vNRxlv40S/Ggjc0txi5yeF
	mQVLjBMujO7AnWx1xqtkjVWqC6ZTVaJZBbzJiiyyzebBYLw1lLwhVqolAj11hbEKuD7b
	7p903GUSeUG+QlPfEraJ8NrfXSrMTHUIKuSIO4qTszv6vCKxCvKyNyaOrwMJiprpC3zG
	6kIPF+KgA0vWjWufhyzFmxqPnT8Me1ZJu/pOy52D4h8ik4f45gazIelWqC0daccIYU5l
	4RaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ZW4HvlzcY5Xc2TRp91BW/YIucMX2WLbM95X0e8eVsu0=;
	b=ROkEPJpDM+hD1EMgDlB4i7qlFBk0K0JeyHc75qtBP3OLSjjSVKFv5k6KxkQZBejp7W
	v28rsX4nb8pqd+/7oMtONNDlxSylWV/S0ILfvuRrSdiH4ZB4sD8ZwSgtcjwpRfJSeZZW
	9bFRqU72qhbdtZRiKWrJVdIfqcrBN4xu1WxJRmEr2wP0V9DKPlTpE9nW9YTN0w7SATo/
	GmvdHqyMoHxfPfuyZWMUXs9tq6+MJYZD72YR38oxbznEQ6oeCO44W4EAqstJKvwd7Ys3
	ugfRwrTGOeuCvVGEiXCA8WHo1k0Ubc+Do9fiEzZZDjx0pjPAWHKT00otScs3Li7A+f0c
	hbZQ==
X-Gm-Message-State: APt69E3g56JLTWuVUKqAKAMkJbO2VZikAwujD3tbXLJR/BAxZEvb8tWn
	3nfxxfcbrMskqi3VDAeBwjBmT10h
X-Received: by 2002:a37:4cf:: with SMTP id
	198-v6mr1239415qke.186.1529673785152; 
	Fri, 22 Jun 2018 06:23:05 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	k6-v6sm4455139qtm.30.2018.06.22.06.23.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:23:04 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
	<20180621180224.8312-5-f4bug@amsat.org>
	<cbfadf4b-e3ef-e7bc-921b-2926c270f51f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <aa4f6d42-7784-a462-3110-f88b0ff64970@amsat.org>
Date: Fri, 22 Jun 2018 10:23:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <cbfadf4b-e3ef-e7bc-921b-2926c270f51f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-devel] [PATCH 04/11] hw/dma/omap_dma: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oj90B+Q5Ql6X

On 06/22/2018 05:24 AM, Thomas Huth wrote:
> On 21.06.2018 20:02, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/dma/omap_dma.c | 66 ++++++++++++++++++++++++++++++-----------------
>>  1 file changed, 42 insertions(+), 24 deletions(-)
> [...]
>>      case 0x78:	/* DMA4_GCR */
>>          s->gcr = value & 0x00ff00ff;
>> -	if ((value & 0xff) == 0x00)		/* MAX_CHANNEL_FIFO_DEPTH */
>> -            fprintf(stderr, "%s: wrong FIFO depth in GCR\n", __func__);
>> +        if ((value & 0xff) == 0x00) {
>> +            /* MAX_CHANNEL_FIFO_DEPTH */
>> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: wrong FIFO depth in GCR\n",
>> +                          __func__);
>> +        }
>>          return;
> 
> Not sure, but doesn't that MAX_CHANNEL_FIFO_DEPTH comment rather belong
> to the if-statement than to the print statement? If so, could you please
> leave it at the end of the line?

OK ;)
