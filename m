Received: by 10.25.21.156 with SMTP id 28csp73715lfv;
        Thu, 14 Jul 2016 06:00:47 -0700 (PDT)
X-Received: by 10.25.219.27 with SMTP id s27mr7291939lfg.129.1468501247063;
        Thu, 14 Jul 2016 06:00:47 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com. [2a00:1450:4010:c07::242])
        by mx.google.com with ESMTPS id 127si1910380ljj.99.2016.07.14.06.00.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jul 2016 06:00:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::242 as permitted sender) client-ip=2a00:1450:4010:c07::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::242 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x242.google.com with SMTP id l69so840354lfg.1;
        Thu, 14 Jul 2016 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=naOLN6Uo1TPkiQTTj9jEfrivjEHNonHVldZi2+yWw5c=;
        b=J9lmXZKMs2BBDiC0ZmqV3kw1wbFOfDKY6MKBecndmXCoopq3bxkQYe42Ewx8kDwjpC
         hqzU6B9srIWY1t5e16vITAEeRs25Z+e3oq6ohrsrkK0OqYlQSgKN535WbwYrBgtLFQiK
         vXN3V3HnMKW0B5n1Bxj4RCp9Jgze+52Jq1EmdSFsAONU/1OdXdqCbJEQzVGrF55t6Cx7
         FIFcAk3B9ev6nGfbzuVWjmksx6zNb9T95GHMVp4hiUhPKkCoqRFE10K4HK9kGUufjY1V
         FI0Tk+tsqixuD5AS4YLryf5hJp4Iy44iI7ORgzbTOxeAkm65BPpXsqWyB9SHbE7vGZ8f
         F8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=naOLN6Uo1TPkiQTTj9jEfrivjEHNonHVldZi2+yWw5c=;
        b=bA8KjZVvBWnlGqrpk95aVj7kBfL+AKlg3DD9k1JnmdtYcw5kQJ1TjRs9Is+Hf5Xkrg
         2P1y06RsTRrB+UaWzzjvqWb1qdIMzSSDTLcFdmP3wtI6MbmquAIQLDFFMNO1XcJMroND
         Drj77fX6Uvx4EkJhKzPLHRys1QiMzkdLeT/jTzNpT4/2BWm8BgCtPaDh2tcOJ+cCcXVY
         cyyLZdwirRfxaJs5OhxSwdryl0kksFgHsZf04u3o5JoofLGanVk89VKHL0+oReDmynhQ
         WFI2QOVmpVFHEAZqsYvm/RcvC7VT0+2+c+8dX9CN70mjEA/bhs4LgDAMEJtEaljc66Z+
         j67Q==
X-Gm-Message-State: ALyK8tInnEm9RNNG2iiplMwcziMOXo0BQAZFEwoyNF/hY5bRFQ2gViFyYS5Z0jtEwyTl9A==
X-Received: by 10.25.16.92 with SMTP id f89mr5958386lfi.143.1468501246559;
        Thu, 14 Jul 2016 06:00:46 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.0.65] (broadband-46-188-120-37.2com.net. [46.188.120.37])
        by smtp.gmail.com with ESMTPSA id i197sm660232lfb.40.2016.07.14.06.00.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jul 2016 06:00:45 -0700 (PDT)
Subject: Re: [PATCH v3 06/11] tcg: Introduce tb_mark_invalid() and
 tb_is_invalid()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Sergey Fedorov <sergey.fedorov@linaro.org>
References: <1468354426-837-1-git-send-email-sergey.fedorov@linaro.org>
 <1468354426-837-7-git-send-email-sergey.fedorov@linaro.org>
 <87oa604bzf.fsf@linaro.org>
Cc: qemu-devel@nongnu.org, mttcg@listserver.greensocs.com,
 fred.konrad@greensocs.com, a.rigo@virtualopensystems.com, cota@braap.org,
 bobby.prani@gmail.com, rth@twiddle.net, patches@linaro.org,
 mark.burton@greensocs.com, pbonzini@redhat.com, jan.kiszka@siemens.com,
 peter.maydell@linaro.org, claudio.fontana@huawei.com,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Walle <michael@walle.cc>,
 Aurelien Jarno <aurelien@aurel32.net>, Leon Alrae <leon.alrae@imgtec.com>,
 Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <57878CFA.4060604@gmail.com>
Date: Thu, 14 Jul 2016 16:00:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <87oa604bzf.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: F9KTSqkzbv5Q

On 14/07/16 15:53, Alex Bennée wrote:
> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
>
>> From: Sergey Fedorov <serge.fdrv@gmail.com>
>>
>> These functions will be used to make translation block invalidation safe
>> with concurrent lockless lookup in the global hash table.
>>
>> Most targets don't use 'cs_base'; so marking TB as invalid is as simple
>> as assigning -1 to 'cs_base'. SPARC target stores the next program
>> counter into 'cs_base', and -1 is a fine invalid value since PC must bet
>> a multiple of 4 in SPARC. The only odd target is i386, for which a
>> special flag is introduced in place of removed 'HF_SOFTMMU_MASK'.
>>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
>> Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
>> ---
>>  include/exec/exec-all.h  | 10 ++++++++++
>>  target-alpha/cpu.h       | 14 ++++++++++++++
>>  target-arm/cpu.h         | 14 ++++++++++++++
>>  target-cris/cpu.h        | 14 ++++++++++++++
>>  target-i386/cpu.h        | 17 +++++++++++++++++
>>  target-lm32/cpu.h        | 14 ++++++++++++++
>>  target-m68k/cpu.h        | 14 ++++++++++++++
>>  target-microblaze/cpu.h  | 14 ++++++++++++++
>>  target-mips/cpu.h        | 14 ++++++++++++++
>>  target-moxie/cpu.h       | 14 ++++++++++++++
>>  target-openrisc/cpu.h    | 14 ++++++++++++++
>>  target-ppc/cpu.h         | 14 ++++++++++++++
>>  target-s390x/cpu.h       | 14 ++++++++++++++
>>  target-sh4/cpu.h         | 14 ++++++++++++++
>>  target-sparc/cpu.h       | 14 ++++++++++++++
>>  target-sparc/translate.c |  1 +
>>  target-tilegx/cpu.h      | 14 ++++++++++++++
>>  target-tricore/cpu.h     | 14 ++++++++++++++
>>  target-unicore32/cpu.h   | 14 ++++++++++++++
>>  target-xtensa/cpu.h      | 14 ++++++++++++++
>>  20 files changed, 266 insertions(+)
>>
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index db79ab65cebe..61cc3a1fb8f7 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -256,6 +256,16 @@ void tb_free(TranslationBlock *tb);
>>  void tb_flush(CPUState *cpu);
>>  void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
>>
>> +static inline void tb_mark_invalid(TranslationBlock *tb)
>> +{
>> +    cpu_get_invalid_tb_cpu_state(&tb->pc, &tb->cs_base, &tb->flags);
> Hmmm are we getting something here? Maybe cpu_tb_invalidate_cpu_state?

Just to be similar to cpu_get_tb_cpu_state().

>
>> +}
>> +
>> +static inline bool tb_is_invalid(TranslationBlock *tb)
>> +{
>> +    return cpu_tb_cpu_state_is_invalidated(tb->pc, tb->cs_base, tb->flags);
>> +}
> Also why are we passing three pointers to parts of TranslationBlock? Why
> not just pass tb directly and be done with it?

I'm not sure we want to include exec/exec-all.h in target-*/cpu.h

>
> I'm sure the compiler does something sensible but seems overly verbose
> to me.
>
>> +
>>  #if defined(USE_DIRECT_JUMP)
>>
>>  #if defined(CONFIG_TCG_INTERPRETER)
(snip)
> Otherwise:
>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Kind regards,
Sergey
