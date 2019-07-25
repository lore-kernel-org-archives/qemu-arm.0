Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10894605wrv;
        Thu, 25 Jul 2019 10:40:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyoIz7oueGmYyjyFlVQkYp5FAqxd4V+pVmhIfuJa5ZW7On26Sa8M2m6EX4F+GzhZsxuygx1
X-Received: by 2002:a50:8b9d:: with SMTP id m29mr78423573edm.248.1564076418465;
        Thu, 25 Jul 2019 10:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564076418; cv=none;
        d=google.com; s=arc-20160816;
        b=Vz9pAgRv/pgGRqPyYWMfGZ1x0EIvrhG4Wb6kXqUX9JwkyfkEULWsjPEhfG2b4kBjkd
         uX8vfzIBOeuV/uwliNt5T3T2MeRgSyb8hyQ5JkuGNJn01nszm9YUb9zh5HIGPsea24zf
         QOFmGdF5rD3OmepL3RRa045ONEYXFluleQO6tuBgw54+bdcBOLeluINr4T6djkoSeoQb
         JkOGEWgAtVjZjaahwIlMguoCUCnpnRbjq0M0MKJQ1f8FpLW0XbDKOLhg8+jq64X9VmIT
         ec4CpnTMY9Rw+LUq2Xzf+bf1TVX1/HnI2MzEVoYh+1JD2XZQlxK6JIJ0xovN0aC2g/oF
         nWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=s5UdlQNRFngjQD7uV15tjCwUpVV8erqhBJBgdAU/8Ts=;
        b=qSD4PiY4m8MuDf2VYglZv1hT155k/lnZEHpmZUYWH2enTJDAH9pbYWPNrqewE1BmyL
         A0wp/V1p5q78qMzkgPFPHbyjd0QFBW9iNUEGSYL8DGb3VG+mzOlMg1BKexRsSmYLOs4+
         bUN0NoAF0TjDNhQJLc3KdQ3mrF5iA9ibsBU2u5R/BeuWuzCc6OTH0ca9oHg8KmrjiITo
         73vV3Uxrk3t1LIHJ3TOu53G35deWFyfuJi6bM3y14hRQmcYxA93fOckHEhzofW77wigm
         HYc/qmUKfd4xXk4IQDO7oL4wbADvUYgrdRdNCBe8b6VBwubIgW4AZQ4W29tdQry81uXs
         y7KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19si9878564eje.267.2019.07.25.10.40.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 10:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqhiz-0004Sm-7V
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 13:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45814)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqhiv-0004SV-Ga
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 13:40:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqhit-0002j6-Dr
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 13:40:13 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37594)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqhir-0002ds-Cv
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 13:40:11 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so26584791wrr.4
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2019 10:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s5UdlQNRFngjQD7uV15tjCwUpVV8erqhBJBgdAU/8Ts=;
 b=nzgsKYzOD0220X3/kUKiH1Pkq82qcYfpW5cqW52e2ME9bGztD2jrba2hN3BhRtGoua
 np+FttBPey6BXKOh23mBSXTVaUaEFRnsnSnMAP5CUEyam8LixFwT8JqDyz4Jw3OzlCP/
 13DbDBfKps92sTz2attp3sX9BWnAPggf91j/4GU/uhOx6KAO7y6o4M9QP91tktCzl4Lz
 ZSUEbzfaZuZ8Wo8OWajSQTonXPop81NX7+4QdSdUPUiZjJ40zuqQx3Efy39uq51RgkxH
 ttLyX3Y83VCmhHP+/DOytNnIM/CjS4rkapLJul7uRpC5NiOHOn0rShzr1bzAUrbd08dd
 GHow==
X-Gm-Message-State: APjAAAWJgp1jWtoIlbE91oNIvgBnYBMA3HRB1YElH/xEJlJg60pGxKoN
 Fb/LzjzKIS1o7D7d0C0Y2WZtLw==
X-Received: by 2002:adf:efd2:: with SMTP id i18mr94300869wrp.145.1564076405313; 
 Thu, 25 Jul 2019 10:40:05 -0700 (PDT)
Received: from [192.168.1.38] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id v204sm52408968wma.20.2019.07.25.10.40.04
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 10:40:04 -0700 (PDT)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-2-peter.maydell@linaro.org>
 <20190725170228.GL2656@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c5a0799e-2ebe-5a79-915a-af52d471a589@redhat.com>
Date: Thu, 25 Jul 2019 19:40:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190725170228.GL2656@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1? 1/2] stellaris_input:
 Fix vmstate description of buttons field
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zx4jie7Qftwl

On 7/25/19 7:02 PM, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> gamepad_state::buttons is a pointer to an array of structs,
>> not an array of structs, so should be declared in the vmstate
>> with VMSTATE_STRUCT_VARRAY_POINTER_INT32; otherwise we
>> corrupt memory on incoming migration.
>>
>> We bump the vmstate version field as the easiest way to
>> deal with the migration break, since migration wouldn't have
>> worked reliably before anyway.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> OK, it would be great to change num_buttons to uint32_t and make that a
> UINT32 at some point;  it's hard to press negative buttons.

Since the version is incremented, now seems to be a good time.

> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
>> ---
>>  hw/input/stellaris_input.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/input/stellaris_input.c b/hw/input/stellaris_input.c
>> index 20c87d86f40..3a666d61d47 100644
>> --- a/hw/input/stellaris_input.c
>> +++ b/hw/input/stellaris_input.c
>> @@ -60,12 +60,14 @@ static const VMStateDescription vmstate_stellaris_button = {
>>  
>>  static const VMStateDescription vmstate_stellaris_gamepad = {
>>      .name = "stellaris_gamepad",
>> -    .version_id = 1,
>> -    .minimum_version_id = 1,
>> +    .version_id = 2,
>> +    .minimum_version_id = 2,
>>      .fields = (VMStateField[]) {
>>          VMSTATE_INT32(extension, gamepad_state),
>> -        VMSTATE_STRUCT_VARRAY_INT32(buttons, gamepad_state, num_buttons, 0,
>> -                              vmstate_stellaris_button, gamepad_button),
>> +        VMSTATE_STRUCT_VARRAY_POINTER_INT32(buttons, gamepad_state,
>> +                                            num_buttons,
>> +                                            vmstate_stellaris_button,
>> +                                            gamepad_button),
>>          VMSTATE_END_OF_LIST()
>>      }
>>  };
>> -- 
>> 2.20.1
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
