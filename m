Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp200805lfb;
        Thu, 22 Apr 2021 02:55:32 -0700 (PDT)
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr3029083wrq.95.1619085331979;
        Thu, 22 Apr 2021 02:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619085331; cv=none;
        d=google.com; s=arc-20160816;
        b=zQ5CGP9Q42yHyMTBjTx8tDNua3DyRyduEbBL2iCM2Xf3tLmj+4SohsLEZqRqbzvrnj
         Sq/zdTY/r/eTgm2lfH+1RB6cXWoHAMaS9Itn8YbdPebG87XxAkGL3X+PbHlj4uwlM82R
         KH2cS/u7OCAld0aFHS5ewl7lPv184oyShge8Bkor/UcZztJIaUq9AqYtyXqmHasCpw9n
         gdO2CORabuhr+VMd2vwt79f6uaKk7eYMLb17/LphtFh4FWN5HhKZnrZzpm8j2IPpj5hq
         AfFZgQXal8EiTujgvt+khsv+12BPFWwElq8dJIt32SHTZoaw+3txBxfhs9wUX8z5eGCe
         l5/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=j3/CD8iIg7DzJvo+u5RSyI4mS3KD0iDabXy6SoEOmWA=;
        b=fVrgw7Nu7yJ/G3JDGvGo37EliIqgk+NgPlDQP9yl0GYTb9lL4z1HVqSKo4y/mFODxR
         ehV3sDtyy0jwnik18MQXDev1aQjzZZz5qjziBNV3NJymjDiOj5dziuqLuIDOEYMvdb/N
         V/uti/V7/iVxB2ez4f7gpHGxbBIFwKNwG+Hf1U6my+5sgoIX4YeCP0gXlFUOoFiuzEAV
         uqRfHoS36JgcZC9xrCGNN95+tGAir4Xa0PFBChD9SiaIoDjxLyU+cL6yNRADJhiEf26o
         fQb//WoZye5q7G8vAsHIAs28UQCQVJbyBKED4DXBGh2zg9V9Sq8yef/Abqc/UFznyO3w
         VOQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ahUByVxE;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u11sor2475042wml.8.2021.04.22.02.55.31
        (Google Transport Security);
        Thu, 22 Apr 2021 02:55:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ahUByVxE;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j3/CD8iIg7DzJvo+u5RSyI4mS3KD0iDabXy6SoEOmWA=;
        b=ahUByVxEoyMyoyOclcLDZgox6hD6OI1LI1ONbBPRcLOLBfjNWIpDp/DyB1XZ7WTL4o
         k2J/xDpuCxYKp29nrmOMaAaBiVT4rqdc+l4q2t5N8j8wMBSUONs6s5lA6OPHF9HKXyiM
         psZNtjsgALZPEwP8dTewLnq/q/m7dWQLGr2idSfDuSaeMVQ7LOaRZU9N1xbmpG21pQDY
         s7VpBijqNkPGUmW6gj8yBeH9GNCRB8WdIzwvjFir4zfChlJ+TiGRd7QrqsxWKEsAPSnF
         sQOqn+lh4ONsZ6eezqlT6U8qjbvi0E46Q0wgnGWGy42MzgKEsqggt7RxKaKPvjKxPKPv
         xLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j3/CD8iIg7DzJvo+u5RSyI4mS3KD0iDabXy6SoEOmWA=;
        b=Ie8O88OKPhhXuEQYXTVRKf4AgmD3rqh2SmOOdX7Pa/X9XSelCyj901p+7Ki0ShwDaM
         Jftzox5ZA9CgfU7+rYeeT8zf+7CwpsP5lDf8NtdkASZEw07i7oHKkSPiqefzgMgmwazE
         DaMArRSKEnJG9qE3L8Po0g0GqnVEOWv+WEKiSCAXzu1yGooxO0Dw3nIB83wZSBpe7NCI
         /aDah9AKLmMsY5YMzvZzFPIRkiQESeHfZOuawCjO0M654iTXSQSr4i+0olNlaJA5tKop
         ZpsUFIXY7Xyy6V+iwgbZMWv3sitX5SY4jrwCssLKGm/oGvitDSlIEQ6j+CYS5AhKKFAj
         9+8w==
X-Gm-Message-State: AOAM533mGrumVduVrR949MyY9dt+PSceVE/N13fZjKRG2BHXNWP7TVkP
	FZW48xHkmfxSjZlSimRd2yg=
X-Google-Smtp-Source: ABdhPJz0dq2rFL5eVgEt52NmOoqYoFlJrfxA1xWcMFf4QAxKU7w+wcST5BfptlJL3he7lxkxgLxZmQ==
X-Received: by 2002:a05:600c:1546:: with SMTP id f6mr2824790wmg.156.1619085331620;
        Thu, 22 Apr 2021 02:55:31 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net. [81.40.121.39])
        by smtp.gmail.com with ESMTPSA id t14sm2667543wrz.55.2021.04.22.02.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 02:55:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 01/27] target: Set CPUClass::vmsd instead of
 DeviceClass::vmsd
To: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210302145818.1161461-1-f4bug@amsat.org>
 <20210302145818.1161461-2-f4bug@amsat.org>
 <20210421220333.bkxo6zriqe6w3rim@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cccb8e5c-55cb-3f46-1391-ca96ab7c27ce@amsat.org>
Date: Thu, 22 Apr 2021 11:55:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421220333.bkxo6zriqe6w3rim@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: NJV+gl82BvTQ

+Juan

On 4/22/21 12:03 AM, Eduardo Habkost wrote:
> On Tue, Mar 02, 2021 at 03:57:52PM +0100, Philippe Mathieu-Daudé wrote:
>> The cpu model is the single device available in user-mode.
>> Since we want to restrict some fields to user-mode emulation,
>> we prefer to set the vmsd field of CPUClass, rather than the
>> DeviceClass one.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Is this going to have an externally visible effect?

On system emulation, no, because unchanged.

On user emulation migration it is not used, the symbol is here
to satisfy linking:

include/hw/core/cpu.h-1070-#ifdef CONFIG_SOFTMMU
include/hw/core/cpu.h-1071-extern const VMStateDescription
vmstate_cpu_common;
include/hw/core/cpu.h-1072-#else
include/hw/core/cpu.h:1073:#define vmstate_cpu_common vmstate_dummy
include/hw/core/cpu.h-1074-#endif
include/migration/vmstate.h:197:extern const VMStateDescription
vmstate_dummy;
stubs/vmstate.c:4:const VMStateDescription vmstate_dummy = {};

> If it does, how can we make sure it's safe?
> 
> If it does not, do you know why CPUClass::vmsd exists in the
> first place?

My guess is CPUState is the only device used in user emulation,
so it would be a way to restrict the vmstate_dummy to CPU and
not to any DeviceState?

But looking at the introductory commit:

commit b170fce3dd06372f7bfec9a780ebcb1fce6d57e4
Author: Andreas Färber <afaerber@suse.de>
Date:   Sun Jan 20 20:23:22 2013 +0100

    cpu: Register VMStateDescription through CPUState

    In comparison to DeviceClass::vmsd, CPU VMState is split in two,
    "cpu_common" and "cpu", and uses cpu_index as instance_id instead of -1.
    Therefore add a CPU-specific CPUClass::vmsd field.

    Unlike the legacy CPUArchState registration, rather register CPUState.

Juan, do you remember?

> 
> Do you think it would be simpler to just squash this patch into
>   [PATCH v3 08/27] cpu: Move CPUClass::vmsd to SysemuCPUOps
> ?

Certainly cleaner, I'll respin!

Thanks,

Phil.
