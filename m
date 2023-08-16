Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp370652ejs;
        Wed, 16 Aug 2023 06:51:53 -0700 (PDT)
X-Received: by 2002:a17:902:c1c5:b0:1b8:a697:3719 with SMTP id c5-20020a170902c1c500b001b8a6973719mr1973664plc.25.1692193913513;
        Wed, 16 Aug 2023 06:51:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193913; cv=none;
        d=google.com; s=arc-20160816;
        b=VXrNp6FPkUruDauz58rlvakfq3AVgCtU90dWyTpuJlzwH3oPg8l0lIVlwHh4K3tIdI
         iNrWHeip63QtDoyK80BXHB73XASHLwEoACT9nES3N5MVKSwSwQTcCSr2E32/BXprHd3U
         9PMO/2gKXjDLR//jiLhOohuiPDWU9w7Umf7c6SxVHISDaoZDcNQ16MrME1zHSYY/X9f6
         5z30GLi6RQKatRdI6WrJbU8s3bZgyXZRyJpaLpleUN03J/6lC4bz4gLf3ATO0hrA4XWN
         n5bYhrZu3KqRIxKT8L8PU7srEtO2aPUXgrF51KtJSSQmbNiNCDI+iK6boCqKgFMoLRvr
         UBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mZPCtM4gFlUO1eqBWQfyY/Y18ssOpc6HOYefevkB3hs=;
        fh=EcO5he7kBhkq1+blo3bftTd/gQjAs68nzvCtO96H+rw=;
        b=CCEyDjV9+7ma5lwA5Wp3R+96gPLeVCkJCM0B1FATzEicNf6P3FFB4Wl3Onzc4szU5P
         YQGv8kzCBCpD1cfYM27WibL0ilFGikFDQdAYfcW+Jy0J4kyvMjTexKWDHttfRJk6o9o0
         nNIu6Mf7TzSxv+E2W77unUJRVC/JaC5xekF+bkVtcLS/2jYkGXHMRrA6Jy8CxIFP0H24
         Zj0V/gbWkQXwgrgQHE4xLrMYU9kX8HpdhzJ5Xt6tcUbaTcytlbguRz1kzccqj6SQyutu
         ZiTWYaFSOPAliNQPYFvuexDM5PO7y2EYz2lyLJwTwHz6NP6oNNy3f6Ux2FkrRJGcEcPf
         HyVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=E60lamU4;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d3-20020a170902e14300b001bee7088912sor1756069pla.2.2023.08.16.06.51.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:51:53 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=E60lamU4;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193913; x=1692798713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZPCtM4gFlUO1eqBWQfyY/Y18ssOpc6HOYefevkB3hs=;
        b=E60lamU47sZQxI2mdxzaxIpzQ585cW73J6EcnIGUtt0mZ/TNXdyWMp2/dzxmLzyAfE
         Mu9LEylJIpAXxmDtu/izPvlfN/2tTaEfobzongnhiN/H75mF1tZM5KtcMx7wvcKqdGi6
         q22Oz6PXtIByw2bMo+CyND45GwR4JhJ74HXkvd2h5zmd7Py98uy4BGoGPVopqHtB8LSs
         AeH0zL/KiendIdwPw+xkOFfAHbOK7N/mIXRFAl63WX+dt3nS24h8J5RTTAORqtZfdL8r
         bZDS5s0hCOOkaMA5VCy1sdeKYT7TyloC8v5VknLg8AjYzAnMerp5cNFZ1K4wWw822ChR
         HS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193913; x=1692798713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZPCtM4gFlUO1eqBWQfyY/Y18ssOpc6HOYefevkB3hs=;
        b=Z4+qpi8YDS2hLXeePm9ZbL4LiydKqu3a1XPoEbkw0SZz42Z6fiHpAsRywicUuyVjsw
         J8Y83NkO15OWKKpFrEy9GoNrOoU83YTDL+e9jPo2QrIOXvJw0FJm8VVebLfeNyoQhYL9
         4avyc+vm534v4BxvDGCRrWSGz3pawLPjFFTNiQ1GwZwtHe7zeG2pmYlJOury88S15Exg
         7dJANNUUCVL85fUPFiFma6CqgsLb08SdWtUT7vUe+MZPFb9vu4n+BEKVtfCdU6louvRi
         3bONyhmNHzsmB7DfzEPczN9AUR5SHxCduRL/KicYmYObhuOZorUOsgtF7IgnLqqCegmo
         ogjg==
X-Gm-Message-State: AOJu0YwL2plRzT92vbLeXUY77zYdXwnNNTYGa5EvMUcMeGqMDIlqlXx9
	MlUQRQo6tYPrlOg6BlIEH/wcQfSDyMmcYEkyCOg=
X-Google-Smtp-Source: AGHT+IF76m2gteYuU/ME8SyVTBxUSaRFmuZxrPHwMaaIRkLTBOKQwLw0o3YjJK7lICXb524S6ruUtA==
X-Received: by 2002:a17:902:bc89:b0:1bd:af7e:965d with SMTP id bb9-20020a170902bc8900b001bdaf7e965dmr2060152plb.51.1692193912914;
        Wed, 16 Aug 2023 06:51:52 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486? ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a034800b00262e485156esm14092117pjf.57.2023.08.16.06.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 06:51:52 -0700 (PDT)
Message-ID: <b1b4843e-038c-43ac-8aa0-b95312b0806a@daynix.com>
Date: Wed, 16 Aug 2023 22:51:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/24] gdbstub: Simplify XML lookup
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-13-akihiko.odaki@daynix.com>
 <87jztxrbv0.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87jztxrbv0.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ZTp/LzeRooib

On 2023/08/14 22:27, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> Now we know all instances of GDBFeature that is used in CPU so we can
>> traverse them to find XML. This removes the need for a CPU-specific
>> lookup function for dynamic XMLs.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   gdbstub/gdbstub.c | 28 +++++++++-------------------
>>   1 file changed, 9 insertions(+), 19 deletions(-)
>>
>> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
>> index 182efe7e0f..e5bb2c89ba 100644
>> --- a/gdbstub/gdbstub.c
>> +++ b/gdbstub/gdbstub.c
>> @@ -354,8 +354,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
>>                                      GDBProcess *process)
>>   {
>>       size_t len;
>> -    int i;
>> -    const char *name;
>> +    GDBRegisterState *r;
>>       CPUState *cpu = gdb_get_first_cpu_in_process(process);
>>       CPUClass *cc = CPU_GET_CLASS(cpu);
>>   
>> @@ -364,15 +363,12 @@ static const char *get_feature_xml(const char *p, const char **newp,
>>           len++;
>>       *newp = p + len;
>>   
>> -    name = NULL;
>>       if (strncmp(p, "target.xml", len) == 0) {
>>           char *buf = process->target_xml;
>>           const size_t buf_sz = sizeof(process->target_xml);
>>   
>>           /* Generate the XML description for this CPU.  */
>>           if (!buf[0]) {
>> -            GDBRegisterState *r;
>> -
>>               pstrcat(buf, buf_sz,
>>                       "<?xml version=\"1.0\"?>"
>>                       "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
>> @@ -389,28 +385,22 @@ static const char *get_feature_xml(const char *p, const char **newp,
>>               pstrcat(buf, buf_sz, "\"/>");
>>               for (r = cpu->gdb_regs; r; r = r->next) {
>>                   pstrcat(buf, buf_sz, "<xi:include href=\"");
>> -                pstrcat(buf, buf_sz, r->feature->xml);
>> +                pstrcat(buf, buf_sz, r->feature->xmlname);
>>                   pstrcat(buf, buf_sz, "\"/>");
>>               }
>>               pstrcat(buf, buf_sz, "</target>");
>>           }
>>           return buf;
>>       }
> 
> It would be nice to modernise this code before adding to it. The static
> target_xml buffer and use of pstrcat could be replaced by GString code
> that is less sketchy.

I saw you did that yourself. Nevertheless I included my own 
implementation for the suggestion in v3. It uses 
g_markup_printf_escaped() for extra caution and better readability (i.e. 
the xi:include tags are written in a format: <xi:include href=\"%s\"/>).

> 
> 
>> -    if (cc->gdb_get_dynamic_xml) {
>> -        char *xmlname = g_strndup(p, len);
>> -        const char *xml = cc->gdb_get_dynamic_xml(cpu, xmlname);
>> -
>> -        g_free(xmlname);
>> -        if (xml) {
>> -            return xml;
>> -        }
>> +    if (strncmp(p, cc->gdb_core_feature->xmlname, len) == 0) {
>> +        return cc->gdb_core_feature->xml;
>>       }
>> -    for (i = 0; ; i++) {
>> -        name = gdb_features[i].xmlname;
>> -        if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
>> -            break;
>> +    for (r = cpu->gdb_regs; r; r = r->next) {
>> +        if (strncmp(p, r->feature->xmlname, len) == 0) {
>> +            return r->feature->xml;
>> +        }
>>       }
>> -    return name ? gdb_features[i].xml : NULL;
>> +    return NULL;
>>   }
>>   
>>   const GDBFeature *gdb_find_static_feature(const char *xmlname)
> 
> 
