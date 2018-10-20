Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp447929wrt;
        Sat, 20 Oct 2018 03:27:25 -0700 (PDT)
X-Received: by 2002:adf:eac2:: with SMTP id o2-v6mr6546555wrn.287.1540031245943;
        Sat, 20 Oct 2018 03:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540031245; cv=none;
        d=google.com; s=arc-20160816;
        b=bT7exIlNROQ3CShWSSEKXl6vEUYjCpg4H/N4neJB8JJLV139EIQBELAAfOIofm7KVh
         L5/wBrpNfo4SJ2+Icx4wCD/Ct7ZcVK9oUkvWqJ+51MlPlNH/SDHqRWijbtMuefjSo9DL
         RuJzAtCR0NsDcB92JoxTOnrs00xShJP4jhGUJCLT+H7mSO8Fb3rQjH8l4raxSXNzIaos
         UqRgrZTHlKufezLqr0r2no0Kwv9c7suQy/TJqSz101Aw/9Pquy6E1qpiIOdyNFBT5TX3
         nV+i+Pq4/a3y1qKx0Cn+etXaqw4aglrVVPHby5w2hF5sluCDffXqdbyn8mGf53S5R9xk
         D8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject:from;
        bh=aJXEGhXmOMGadYGZKEnG7wKp5Gdh+tIjkDu3JJdJbB0=;
        b=jUBCMqSm3A5cyLVgC1rrFCt62+zRVvV28fCg38ZpomyZZuddT5E5xZuzGm3Zh0ObR4
         5Lz5brXglt/2MAOpYcxnTtJcPrTRN4ESmCno466+wlk2VvHqlyevz6SjdqLuWYH+uA5B
         MocAnOG3wtQR02keAhA231TkAA/AOATO6nziUJCuLRc/qdJS0rDtA84hKtH6mQIoBhyE
         4nS2p1l0zRGT18BmQv5WE94n026nOATQveN+K2RaY4dWzxh2eQBzmIlFnIfwozonHwWx
         6sY7EU8uXY37IL1AbbdPELT2wB5q5nElUtprorSuuSDJE1yeIsxqZrhW3S7Ip6KjjK+L
         w8aA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j13-v6sor16723514wrp.24.2018.10.20.03.27.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 20 Oct 2018 03:27:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aJXEGhXmOMGadYGZKEnG7wKp5Gdh+tIjkDu3JJdJbB0=;
        b=ZGYVM6S+kbYMvYj94qriIozgsm6OYLy7y/YQujMDGcsau5yA+deNXNAB3RmlQRCV45
         Wltbk5QgCbKy6AuZlNRrQ+cpFKw8lwOQu0CAhtAOuFlW2yPWFTSO/yMWhB7+GYedwUcE
         aJIqCzheewSkE6NRU+IL5b0vru+vNp/kT4IhcSc1DF2xGE7UGqfRMgo15Ppeocli9dYj
         wbNCgO8F4N4nw2MtDNuC0GfCVv0WiSro+T3fxKGJ+tM194YA66roVyN2bqkbsaF/9Yy1
         l+kwLBCjSIKMjGqxMTERVhgcfkEzcU0mjrKfE0OvKrelaSzxehMWVQIYccYUQI7+Dio+
         F/tQ==
X-Gm-Message-State: AGRZ1gJvP3UEHUQVJY9bH1tIjvsw93oiotkl9DmcWoI3GGNv/0K399Mv
	KMGFn1leAYdRGPcXA05qasEYwA==
X-Google-Smtp-Source: AJdET5dMc5El9sxiNblbeTozU508mFXSp2UYlZ8OmJ9OdCtITszc1FLpr2mfRFfezZyT8feFaBZf/w==
X-Received: by 2002:a5d:62d1:: with SMTP id o17-v6mr5577676wrv.27.1540031245594;
        Sat, 20 Oct 2018 03:27:25 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.130] ([139.47.31.187])
        by smtp.gmail.com with ESMTPSA id 67-v6sm4206890wmd.1.2018.10.20.03.27.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 Oct 2018 03:27:24 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Re: [Qemu-devel] [PULL 00/45] Machine queue, 2018-10-18
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Libvirt <libvir-list@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring
 <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20181018200422.4358-1-ehabkost@redhat.com>
 <CAFEAcA9p0dLoNQy7kBdcXMz0HiMGEZTBX67Lq2SizTY3kgeksw@mail.gmail.com>
 <20181019184408.GG31060@habkost.net>
 <20181019215345.521d58d7@igors-macbook-pro.local>
 <20181019202321.GM31060@habkost.net>
Message-ID: <f3d35b09-cec1-7d18-4d42-86dfb5b63fba@redhat.com>
Date: Sat, 20 Oct 2018 12:27:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181019202321.GM31060@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: gGBFVL39joXf

On 19/10/2018 22:23, Eduardo Habkost wrote:
> On Fri, Oct 19, 2018 at 09:53:45PM +0200, Igor Mammedov wrote:
>> On Fri, 19 Oct 2018 15:44:08 -0300
>> Eduardo Habkost <ehabkost@redhat.com> wrote:
>>
>>> On Fri, Oct 19, 2018 at 03:12:31PM +0100, Peter Maydell wrote:
>>>> On 18 October 2018 at 21:03, Eduardo Habkost <ehabkost@redhat.com> wrote:
>>>>> The following changes since commit 09558375a634e17cea6cfbfec883ac2376d2dc7f:
>>>>>
>>>>>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20181016-1' into staging (2018-10-16 17:42:56 +0100)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>   git://github.com/ehabkost/qemu.git tags/machine-next-pull-request
>>>>>
>>>>> for you to fetch changes up to 6d8e1bcc7dd5e819ce81e6a87fffe23e39c700cc:
>>>>>
>>>>>   numa: Clean up error reporting in parse_numa() (2018-10-17 16:33:40 -0300)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Machine queue, 2018-10-18
>>>>>
>>>>> * sysbus init/realize cleanups
>>>>>   (Cédric Le Goater, Philippe Mathieu-Daudé)
>>>>> * memory-device refactoring (David Hildenbrand)
>>>>> * -smp: deprecate incorrect CPUs topology (Igor Mammedov)
>>>>> * -numa parsing cleanups (Markus Armbruster)
>>>>> * Fix hostmem-file memory leak (Zhang Yi)
>>>>> * Typo fix (Li Qiang)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>>
>>>>
>>>> Hi. This had some problems in merge testing, I'm afraid:
>>>>
>>>> On aarch64 host, warnings running tests/cpu-plug-test for i386 and s390 targets:
>>>>
>>>> TEST: tests/cpu-plug-test... (pid=12602)
>>>>   /i386/cpu-plug/pc-i440fx-3.0/cpu-add/1x3x2&maxcpus=12:
>>>> qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
>>>> (1) * cores (3) * threads (2) != maxcpus (12)
>>> [...]
>>>>
>>>> (plus similar ppc64, x86_64 targets)
>>>
>>> Ouch.  Apologies.
>>>
>>> Can we please do something make sure "make check" will fail on
>>> these cases?  I'd like to be able to trust CI systems like
>>> travis-ci.
>>>
>>
>> we probably don't want make check fail on warning.
> 
> I disagree.  If a warning is blocking a pull request from being
> merged, it must make CI systems fail too.  Otherwise we're
> defeating the purpose of CI systems.

We can, we also have the hardware (courtesy of Packet), we just need to
make time to set it up.

QEMU Summit is a good place where to talk about this.

> 
> 
>> Test was written with assumption that s/c/t tuples matches initially present CPUs, hence a warning.
>> Would something like following fix the issue (local x86 build/test looks fixed with it)?
> 
> It works for me.  I will queue it on machine-next, thanks!
> 
>>
>> diff --git a/tests/cpu-plug-test.c b/tests/cpu-plug-test.c
>> index 3e93c8e..f4a677d 100644
>> --- a/tests/cpu-plug-test.c
>> +++ b/tests/cpu-plug-test.c
>> @@ -32,12 +32,12 @@ static void test_plug_with_cpu_add(gconstpointer data)
>>      unsigned int i;
>>  
>>      args = g_strdup_printf("-machine %s -cpu %s "
>> -                           "-smp sockets=%u,cores=%u,threads=%u,maxcpus=%u",
>> +                           "-smp 1,sockets=%u,cores=%u,threads=%u,maxcpus=%u",
>>                             s->machine, s->cpu_model,
>>                             s->sockets, s->cores, s->threads, s->maxcpus);
>>      qtest_start(args);
>>  
>> -    for (i = s->sockets * s->cores * s->threads; i < s->maxcpus; i++) {
>> +    for (i = 1; i < s->maxcpus; i++) {
>>          response = qmp("{ 'execute': 'cpu-add',"
>>                         "  'arguments': { 'id': %d } }", i);
>>          g_assert(response);
>> @@ -56,7 +56,7 @@ static void test_plug_without_cpu_add(gconstpointer data)
>>      QDict *response;
>>  
>>      args = g_strdup_printf("-machine %s -cpu %s "
>> -                           "-smp sockets=%u,cores=%u,threads=%u,maxcpus=%u",
>> +                           "-smp 1,sockets=%u,cores=%u,threads=%u,maxcpus=%u",
>>                             s->machine, s->cpu_model,
>>                             s->sockets, s->cores, s->threads, s->maxcpus);
>>      qtest_start(args);
>> @@ -79,12 +79,12 @@ static void test_plug_with_device_add_x86(gconstpointer data)
>>      unsigned int s, c, t;
>>  
>>      args = g_strdup_printf("-machine %s -cpu %s "
>> -                           "-smp sockets=%u,cores=%u,threads=%u,maxcpus=%u",
>> +                           "-smp 1,sockets=%u,cores=%u,threads=%u,maxcpus=%u",
>>                             td->machine, td->cpu_model,
>>                             td->sockets, td->cores, td->threads, td->maxcpus);
>>      qtest_start(args);
>>  
>> -    for (s = td->sockets; s < td->maxcpus / td->cores / td->threads; s++) {
>> +    for (s = 1; s < td->sockets; s++) {
>>          for (c = 0; c < td->cores; c++) {
>>              for (t = 0; t < td->threads; t++) {
>>                  char *id = g_strdup_printf("id-%i-%i-%i", s, c, t);
>> @@ -113,7 +113,7 @@ static void test_plug_with_device_add_coreid(gconstpointer data)
>>                             td->sockets, td->cores, td->threads, td->maxcpus);
>>      qtest_start(args);
>>  
>> -    for (c = td->cores; c < td->maxcpus / td->sockets / td->threads; c++) {
>> +    for (c = 1; c < td->cores; c++) {
>>          char *id = g_strdup_printf("id-%i", c);
>>          qtest_qmp_device_add(td->device_model, id, "{'core-id':%u}", c);
>>          g_free(id);
>> @@ -148,7 +148,7 @@ static void add_pc_test_case(const char *mname)
>>      data->sockets = 1;
>>      data->cores = 3;
>>      data->threads = 2;
>> -    data->maxcpus = data->sockets * data->cores * data->threads * 2;
>> +    data->maxcpus = data->sockets * data->cores * data->threads;
>>      if (g_str_has_suffix(mname, "-1.4") ||
>>          (strcmp(mname, "pc-1.3") == 0) ||
>>          (strcmp(mname, "pc-1.2") == 0) ||
>> @@ -203,7 +203,7 @@ static void add_pseries_test_case(const char *mname)
>>      data->sockets = 2;
>>      data->cores = 3;
>>      data->threads = 1;
>> -    data->maxcpus = data->sockets * data->cores * data->threads * 2;
>> +    data->maxcpus = data->sockets * data->cores * data->threads;
>>  
>>      path = g_strdup_printf("cpu-plug/%s/device-add/%ux%ux%u&maxcpus=%u",
>>                             mname, data->sockets, data->cores,
>> @@ -229,7 +229,7 @@ static void add_s390x_test_case(const char *mname)
>>      data->sockets = 1;
>>      data->cores = 3;
>>      data->threads = 1;
>> -    data->maxcpus = data->sockets * data->cores * data->threads * 2;
>> +    data->maxcpus = data->sockets * data->cores * data->threads;
>>  
>>      data2 = g_memdup(data, sizeof(PlugTestData));
>>      data2->machine = g_strdup(data->machine);
>>
>>
> 

This patch with Igor Signed-off-by:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
