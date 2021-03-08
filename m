Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1901302lfg;
        Mon, 8 Mar 2021 06:51:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1BuoxegIP/k6AQdvbGFpW4o20TB2HbtSoiH+XS5Gjv0PbOLdUqgfZ5RJsIvcpC1/kFyuk
X-Received: by 2002:a02:850a:: with SMTP id g10mr5106982jai.140.1615215064911;
        Mon, 08 Mar 2021 06:51:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615215064; cv=none;
        d=google.com; s=arc-20160816;
        b=Q16vV2lAhlq3BjuyOdr7QyARjV3c/pFdE29clKwGxIsgserxU0BQkylFE98igcWO7m
         zOjlQgRPo6DTQuIZ7xxtREzAFxlb4h1LyNBQr8A2+NwsyfjZXKD9Z9Unm3t8Nik3HEX+
         x7ik9/XFdvyJiO1AuiX38EAKcdIrywbJEuMJXPhbHQ24Hso9/M6Zbl0VUTDANvKMno0P
         b3ZvMYXY3htwArzXjXvujHt4xfk9ppCisYRwroyddOvhbyqV747vzmYSGgPcMuECLvYp
         jD4TCcqkdHpOkm/OSoF6zhkkj7Rr9J0cYYxmEjaH7T20rO2ogj+31j2Jn1nmLIOQBhdf
         BixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=9mErYVV5g3yI4rEOp1qNKU9bZuW3CgFxqyOHAlVsvRI=;
        b=mDzVhjzz4OJMZdYk2HF7dNSr+leZ5MHlAAcKJAZ1mw80q57M8vbknnsFXwaMWreqFY
         HTeAkBSNClXuxpAf+ktl3YO4d5ZOw0lPtL86JJ4Dj7+PzwRZMi3IIq8KFKW42GwwoXsl
         LB9rJrma7YljN66CP5SH4rMco57G6JzNcsUY6CDQ5h/lGVLs4pDj5Rd5/LvrBNcDAqkG
         JAdYVzTg9rWBgbl0JiW48fAk978ys3pnXSeINu+mIrFStShZKU9FPWWlolb5PJGkSXUW
         B2MkUEOOyj5QtYiRVlywZZ4iVPrJH1abEr9Xjof8cabomuhl88V/wf88fludGHAE7o5N
         cl3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si11121007ilq.120.2021.03.08.06.51.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 06:51:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJHDs-0001uh-8O
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 09:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJHDg-0001sj-Hj; Mon, 08 Mar 2021 09:50:52 -0500
Received: from mx2.suse.de ([195.135.220.15]:44350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJHDd-0002Hv-EQ; Mon, 08 Mar 2021 09:50:52 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52A9EAE30;
 Mon,  8 Mar 2021 14:50:45 +0000 (UTC)
Subject: Re: [RFC PATCH v2 1/8] sysemu/tcg: Restrict tcg_exec_init() to
 CONFIG_TCG
To: David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210304222323.1954755-1-f4bug@amsat.org>
 <20210304222323.1954755-2-f4bug@amsat.org>
 <e927dd5b-85c5-ddbf-aa16-2d1401a10bc3@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <442914dd-1059-dba4-fc14-09671e041747@suse.de>
Date: Mon, 8 Mar 2021 15:50:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e927dd5b-85c5-ddbf-aa16-2d1401a10bc3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9Om7kX8GmMFH

On 3/8/21 2:40 PM, David Hildenbrand wrote:
> On 04.03.21 23:23, Philippe Mathieu-Daudé wrote:
>> Invert the #ifdef'ry to easily restrict tcg_exec_init() declaration
>> to CONFIG_TCG.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   include/sysemu/tcg.h | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
>> index 00349fb18a7..fddde2b6b9a 100644
>> --- a/include/sysemu/tcg.h
>> +++ b/include/sysemu/tcg.h
>> @@ -8,13 +8,15 @@
>>   #ifndef SYSEMU_TCG_H
>>   #define SYSEMU_TCG_H
>>   
>> +#ifndef CONFIG_TCG
>> +#define tcg_enabled() 0
>> +#else
>> +
>>   void tcg_exec_init(unsigned long tb_size, int splitwx);
>>   
>> -#ifdef CONFIG_TCG
>>   extern bool tcg_allowed;
>>   #define tcg_enabled() (tcg_allowed)
>> -#else
>> -#define tcg_enabled() 0
>> -#endif
>> +
>> +#endif /* CONFIG_TCG */
>>   
>>   #endif
>>
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 
Reviewed-by: Claudio Fontana <cfontana@suse.de>
