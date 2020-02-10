Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3460264lfp;
        Sun, 9 Feb 2020 22:15:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwk0+EM9iIPvuztGPqSW6/MU3CWQXPfxiM0DkhO+74aNUMxN0kj0dSivALgJM8bxz8tv4Id
X-Received: by 2002:a05:620a:100d:: with SMTP id z13mr8313qkj.266.1581315323419;
        Sun, 09 Feb 2020 22:15:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581315323; cv=none;
        d=google.com; s=arc-20160816;
        b=z0ub/qcfR3rK19AqB7/0BFOvb2ho7VldFYcVQYv300zqDbwR1ZVXHLVDWBzjifx6Li
         Ql8HgMXdaz5EjfL6H7Tu1V2KYGCdgaTOnQVZawnITo71G0OafEhAoOPKWRSt8kQChJii
         yTtlT2oGPiYlO/83T3O3tMx3cyOkLuElrpSwVenZ9VBl9Natm6uED5/9wm+2iZlBc9eb
         ibCFrGabxUDWwsVIViOMnguMDrNKyT4LrXUSlK5uwARzpzspTXRPQSkDiducSVW4t+1C
         tsRWunnWIibDk9FACBsmR9R84UI3YvU1AYy4+dwDT8cJWU62Bpt8WqkHYXZgpLmK3Dtr
         8VJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=380eBZytJeEj3dRGpmtB0uZK+pQa1AJYDapODsU3Gwk=;
        b=DqU5QsEA3HEbgYX2dyrzp6ndLDZ/to0mBsxWVQJOLEseIaOtdO85ecuXa9PXTLKAST
         EIT19aSrEyy18PlDP3ud6cMMowCSIehEyXjKWKZ5AyC/mEeJCMmkoTvmqw9CczYXpNgP
         T42+Jmq5EM2GsvdgiJH8BhpwCSYzci66WiRWASqsDuxYfnpjdak0lprcKZ7K/iBbUUjd
         ijal+do3qojdelIXhLTbnntcc6urW9HWKn0zR/fPxvsc2IvUQ2YY5VtIAMudUkfuC5R4
         Z2lOT6QuDjUGe28xH366M1TxvboyTlRQmWQz76vdGXiugmN9aDcVlh2msJ8kIwiZuYdG
         B4wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q65si4001126qkf.0.2020.02.09.22.15.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Feb 2020 22:15:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j12Lq-0002a7-Rw
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 01:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1j12Lf-0002UG-D1
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 01:15:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1j12Le-0008QH-6r
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 01:15:11 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2759 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1j12Ld-0008Ir-Qy; Mon, 10 Feb 2020 01:15:10 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D981BEF02B095D22878D;
 Mon, 10 Feb 2020 14:15:06 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.230) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0;
 Mon, 10 Feb 2020 14:14:59 +0800
Subject: Re: [PATCH] migration: Optimization about wait-unplug migration state
To: Jens Freimann <jfreimann@redhat.com>
References: <20200204050841.44453-1-zhukeqian1@huawei.com>
 <20200205144027.55qsz3j7qf26pzfd@jenstp.localdomain>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <dc6a6b77-5513-d0fe-f167-42987c266920@huawei.com>
Date: Mon, 10 Feb 2020 14:14:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200205144027.55qsz3j7qf26pzfd@jenstp.localdomain>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uDEwGxXm3wLi



On 2020/2/5 22:40, Jens Freimann wrote:
> On Tue, Feb 04, 2020 at 01:08:41PM +0800, Keqian Zhu wrote:
>> qemu_savevm_nr_failover_devices() is originally designed to
>> get the number of failover devices, but it actually returns
>> the number of "unplug-pending" failover devices now. Moreover,
>> what drives migration state to wait-unplug should be the number
>> of "unplug-pending" failover devices, not all failover devices.
>>
>> We can also notice that qemu_savevm_state_guest_unplug_pending()
>> and qemu_savevm_nr_failover_devices() is equivalent almost (from
>> the code view). So the latter is incorrect semantically and
>> useless, just delete it.
>>
>> In the qemu_savevm_state_guest_unplug_pending(), once hit a
>> unplug-pending failover device, then it can return true right
>> now to save cpu time.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>> Cc: jfreimann@redhat.com
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> ---
>> migration/migration.c |  2 +-
>> migration/savevm.c    | 24 +++---------------------
>> migration/savevm.h    |  1 -
>> 3 files changed, 4 insertions(+), 23 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 3a21a4686c..deedc968cf 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -3333,7 +3333,7 @@ static void *migration_thread(void *opaque)
>>
>>     qemu_savevm_state_setup(s->to_dst_file);
>>
>> -    if (qemu_savevm_nr_failover_devices()) {
>> +    if (qemu_savevm_state_guest_unplug_pending()) {
>>         migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>>                           MIGRATION_STATUS_WAIT_UNPLUG);
>>
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index f19cb9ec7a..1d4220ece8 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -1140,36 +1140,18 @@ void qemu_savevm_state_header(QEMUFile *f)
>>     }
>> }
>>
>> -int qemu_savevm_nr_failover_devices(void)
>> +bool qemu_savevm_state_guest_unplug_pending(void)
>> {
>>     SaveStateEntry *se;
>> -    int n = 0;
>>
>>     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>>         if (se->vmsd && se->vmsd->dev_unplug_pending &&
>>             se->vmsd->dev_unplug_pending(se->opaque)) {
>> -            n++;
>> -        }
>> -    }
>> -
>> -    return n;
>> -}
>> -
>> -bool qemu_savevm_state_guest_unplug_pending(void)
>> -{
>> -    SaveStateEntry *se;
>> -    int n = 0;
>> -
>> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>> -        if (!se->vmsd || !se->vmsd->dev_unplug_pending) {
>> -            continue;
>> -        }
>> -        if (se->vmsd->dev_unplug_pending(se->opaque)) {
>> -            n++;
>> +            return true;
>>         }
>>     }
>>
>> -    return n > 0;
>> +    return false;
>> }
>>
>> void qemu_savevm_state_setup(QEMUFile *f)
>> diff --git a/migration/savevm.h b/migration/savevm.h
>> index c42b9c80ee..ba64a7e271 100644
>> --- a/migration/savevm.h
>> +++ b/migration/savevm.h
>> @@ -31,7 +31,6 @@
>>
>> bool qemu_savevm_state_blocked(Error **errp);
>> void qemu_savevm_state_setup(QEMUFile *f);
>> -int qemu_savevm_nr_failover_devices(void);
>> bool qemu_savevm_state_guest_unplug_pending(void);
>> int qemu_savevm_state_resume_prepare(MigrationState *s);
>> void qemu_savevm_state_header(QEMUFile *f);
>> -- 
>> 2.19.1
> 
> Looks good to me. I tested it and it still works, so
> Tested-by: Jens Freimann <jfreimann@redhat.com>
> Reviewed-by: Jens Freimann <jfreimann@redhat.com>
> regards
> Jens
> 
> 
> .
> 
Thanks,
Keqian.

