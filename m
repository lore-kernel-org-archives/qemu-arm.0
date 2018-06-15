Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp568109wrq;
        Fri, 15 Jun 2018 01:23:11 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJp25sEuyOwdVIkBFXhf1yPha6KLliLUB74925lRsyAVF0ARrw2DzrkjBbQYd3keC9el5hn
X-Received: by 2002:ac8:1342:: with SMTP id f2-v6mr568618qtj.25.1529050991657;
        Fri, 15 Jun 2018 01:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529050991; cv=none;
        d=google.com; s=arc-20160816;
        b=Mmxx7WqpCgRhniYUZ1/Kkc2QFbYuoVxQJZMbDX4Jvpbm3itZwAI9GakL1A8wuIYqnv
         3z+o6YSibp9R+xVs2UXIRytJjeBVZA0mmDUheOGITjT1BtU96RVz7eIv7erN0V7MAhpa
         bUKFvUGcRRbv9XracJWxFMq5CNfqYCRsdMfhG7bsXOQMitcixPPdXjsPZb2BFVimj2OX
         hW0+IONYT0KGYOfdNUWl/e5wUvPgAHkQF5SixgzW3NveFOFStgQEq8tweQQo+tT1CB/x
         uGv32RWs9k52ZjMnUSRHufmw+eYTw5P8pT30DNbvfWs33dkse6ZNji9dyUDgnll/G+tr
         SqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=82XrcAPUG2H2mlsJKsUQq8z5bMwrh+G8Zrv/Yo8a4G4=;
        b=R/7+cuJ5gYk5aOBN6GGjq/AGtrvHF2jzeu96Y+liVm09d/bOVpSenpY8syLWwm6qP2
         O1cqgOnhyzB2vMbnnfy36Jn1UX77SGkkh0K9VVgdZhdvz4pzrBb8sqqPSboK8C2Q5heB
         If0bQ4Fs1yRGjeFepnCEIFQg23ZsJdAgBTTDb5kJmjj0yG/EUritA1sFwryOna5cGlq2
         9w/tWb+emg7YzvZ1JJgJUlgC0u+3XjXCWkHrxIa4OqdWSFzLFKmTxUGzGtDVsq6fyql6
         QRbsX17eNJG7srooFKc/vYlI8YqTyIkJ6O8XxymnNGh9KDEAKtGvPycSTTLMzpYeZZzN
         X6/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c21-v6si4512522qkm.241.2018.06.15.01.23.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 01:23:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45014 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTk0l-00082a-67
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 04:23:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fTk0a-00082J-2z
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 04:23:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fTk0W-0000k7-0j
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 04:23:00 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44070 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fTk0V-0000jS-Rw; Fri, 15 Jun 2018 04:22:55 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF19B401EF03;
	Fri, 15 Jun 2018 08:22:54 +0000 (UTC)
Received: from [10.36.116.79] (ovpn-116-79.ams2.redhat.com [10.36.116.79])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E26A563A6E;
	Fri, 15 Jun 2018 08:22:51 +0000 (UTC)
To: Cornelia Huck <cohuck@redhat.com>
References: <1529045897-25260-1-git-send-email-thuth@redhat.com>
	<20180615095752.536f4642.cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <4cc50226-8510-4343-8913-538d8f35c543@redhat.com>
Date: Fri, 15 Jun 2018 10:22:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180615095752.536f4642.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 08:22:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 08:22:54 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH] loader: Check access size when calling
 rom_ptr() to avoid crashes
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JSx8YRWgNFhk

On 15.06.2018 09:57, Cornelia Huck wrote:
> On Fri, 15 Jun 2018 08:58:17 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> The rom_ptr() function allows direct access to the ROM blobs that we
>> load during startup. However, there are currently no checks for the
>> size of the accesses, so it's currently possible to crash QEMU for
>> example with:
>>
>> $ echo "Insane in the mainframe" > /tmp/test.txt
>> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -append xyz
>> Segmentation fault (core dumped)
>> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -initrd /tmp/test.txt
>> Segmentation fault (core dumped)
> 
> It seems nobody managed to trigger the other places yet?

mips_malta.c already seems to check bios_size, so it's not affected as
far as I can tell.

But you can crash sparc64 like this:

$ echo -n HdrS > /tmp/test.txt
$ sparc64-softmmu/qemu-system-sparc64 -kernel /tmp/test.txt \
                                      -initrd /tmp/test.txt
Segmentation fault (core dumped)

I was not able to crash sparc32 in the same way, but you can see the bad
access with valgrind there:

$ valgrind sparc-softmmu/qemu-system-sparc -kernel /tmp/test.txt -initrd
/tmp/test.txt
==14301== Memcheck, a memory error detector
==14301== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==14301== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==14301== Command: sparc-softmmu/qemu-system-sparc -kernel /tmp/test.txt
-initrd /tmp/test.txt
==14301==
==14301== Invalid write of size 4
==14301==    at 0x2C8477: memcpy (string3.h:51)
==14301==    by 0x2C8477: stl_he_p (bswap.h:342)
==14301==    by 0x2C8477: stl_be_p (bswap.h:449)
==14301==    by 0x2C8477: sun4m_load_kernel (sun4m.c:277)
==14301==    by 0x2C8477: sun4m_hw_init (sun4m.c:992)
==14301==    by 0x3272F9: machine_run_board_init (machine.c:830)
==14301==    by 0x23F809: main (vl.c:4477)
==14301==  Address 0x2702fac0 is 12 bytes after a block of size 4 alloc'd
==14301==    at 0x4C2B955: calloc (vg_replace_malloc.c:711)
==14301==    by 0x77B5F55: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5400.2)
==14301==    by 0x3282A8: rom_add_file (loader.c:950)
==14301==    by 0x3285EB: load_image_targphys_as (loader.c:153)
==14301==    by 0x2C8BDD: sun4m_load_kernel (sun4m.c:253)
==14301==    by 0x2C8BDD: sun4m_hw_init (sun4m.c:992)
==14301==    by 0x3272F9: machine_run_board_init (machine.c:830)
==14301==    by 0x23F809: main (vl.c:4477)
==14301==
==14301== Invalid write of size 4
==14301==    at 0x2C847E: memcpy (string3.h:51)
==14301==    by 0x2C847E: stl_he_p (bswap.h:342)
==14301==    by 0x2C847E: stl_be_p (bswap.h:449)
==14301==    by 0x2C847E: sun4m_load_kernel (sun4m.c:278)
==14301==    by 0x2C847E: sun4m_hw_init (sun4m.c:992)
==14301==    by 0x3272F9: machine_run_board_init (machine.c:830)
==14301==    by 0x23F809: main (vl.c:4477)
==14301==  Address 0x2702fac4 is 16 bytes after a block of size 4 alloc'd
==14301==    at 0x4C2B955: calloc (vg_replace_malloc.c:711)
==14301==    by 0x77B5F55: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5400.2)
==14301==    by 0x3282A8: rom_add_file (loader.c:950)
==14301==    by 0x3285EB: load_image_targphys_as (loader.c:153)
==14301==    by 0x2C8BDD: sun4m_load_kernel (sun4m.c:253)
==14301==    by 0x2C8BDD: sun4m_hw_init (sun4m.c:992)
==14301==    by 0x3272F9: machine_run_board_init (machine.c:830)
==14301==    by 0x23F809: main (vl.c:4477)
==14301==

 Thomas
