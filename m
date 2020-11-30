Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4699453lfb;
        Sun, 29 Nov 2020 18:49:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCfNqb9I93F1rdwcLiw26wWoE/KC4af0uin4fGHxahMV47wKPaBnbdk3SJqbuu3lqUJQI/
X-Received: by 2002:a25:d981:: with SMTP id q123mr26569451ybg.50.1606704583471;
        Sun, 29 Nov 2020 18:49:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606704583; cv=none;
        d=google.com; s=arc-20160816;
        b=Kj9CWD89sx2wbcrQy5VKIWrnerGrBd8Z644VZLVVj0/kCbX3qrGd5iScdtb3qlyQBN
         UqboWixh7xJGxI/Q3QxO6OUq3UQnjz1oeH6e7Rrju+qrIJ00faZWG93ZWynhHB2kcg5c
         X/3vNSkQ2rRO4TZ7xK3XbppPfrKxCUD46HYodg2c4YTa8kLSbVc4k0+OUZjjClzQ8rev
         +87WmFdMY8vsa67Ly3LRvF5Zv+wQXgOWnYCttggiXmZBr0I2Vt6I5mGor/rFkeKPPmQe
         K8hOke8pCohYMa5RQLdehr1WnXOlmrxc+tyBalOySyVlxclFpFHQvCqHzwzOJPZxSYR4
         FX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=kOFKwmGnFyMzXNkB3hhxnkWaUkKAb+xUjCFLbmn4BFU=;
        b=HFe1W7a+T18aV+dNgQcMwGAE/aW1LUjPLXnjnOv6Po8qqI7GhERUkv4ZyOi+PqFSa+
         xnSQpIYjUsYu4HmL/bnzyFXQ2n22ef9szT3UfchVLbxZhm1HodUFax1f0fbayZtFcVID
         i5Arr4WClClGkCQ8p32wH0yGGTONasy/dep+1QLW9Qdbtjo5QKUBbba8Y1ELP+1eNI/5
         JikfZwWHtF825cyJmkbmN4wmRWBH6sDkO1LBipb8lj67ZRx6EAg6o9D6YsxoA1dMdTGc
         GNmk4PK4RNVpWEmJuJGSmXqc/j1PHcqe9rDl7Vsh76rkupooZOdjer+RvX7qc6JGCmR+
         evNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si17839479yba.66.2020.11.29.18.49.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Nov 2020 18:49:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjZG2-0002g7-TA
	for alex.bennee@linaro.org; Sun, 29 Nov 2020 21:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kjZ8p-0001QC-Cw; Sun, 29 Nov 2020 21:42:19 -0500
Received: from mail.csgraf.de ([188.138.100.120]:34018
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kjZ8l-0006qo-F9; Sun, 29 Nov 2020 21:42:15 -0500
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id 8768439001C1;
 Mon, 30 Nov 2020 03:42:09 +0100 (CET)
Subject: Re: [PATCH 6/8] hvf: Use OS provided vcpu kick function
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-7-agraf@csgraf.de>
 <20201126221808.GU2271382@habkost.net>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <2281f481-d64a-1750-0bd2-e7f52b26da51@csgraf.de>
Date: Mon, 30 Nov 2020 03:42:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <20201126221808.GU2271382@habkost.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e6LmvYi7zEju


On 26.11.20 23:18, Eduardo Habkost wrote:
> On Thu, Nov 26, 2020 at 10:50:15PM +0100, Alexander Graf wrote:
>> When kicking another vCPU, we get an OS function that explicitly does that for us
>> on Apple Silicon. That works better than the current signaling logic, let's make
>> use of it there.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> ---
>>   accel/hvf/hvf-cpus.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
>> index b9f674478d..74a272d2e8 100644
>> --- a/accel/hvf/hvf-cpus.c
>> +++ b/accel/hvf/hvf-cpus.c
>> @@ -418,8 +418,20 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
>>                          cpu, QEMU_THREAD_JOINABLE);
>>   }
>>   
>> +#ifdef __aarch64__
>> +static void hvf_kick_vcpu_thread(CPUState *cpu)
>> +{
>> +    if (!qemu_cpu_is_self(cpu)) {
>> +        hv_vcpus_exit(&cpu->hvf_fd, 1);
>> +    }
>> +}
>> +#endif
>> +
>>   static const CpusAccel hvf_cpus = {
>>       .create_vcpu_thread = hvf_start_vcpu_thread,
>> +#ifdef __aarch64__
>> +    .kick_vcpu_thread = hvf_kick_vcpu_thread,
>> +#endif
> Interesting.  We have considered the possibility of adding
> arch-specific TYPE_ACCEL subclasses when discussing Claudio's,
> series.  Here we have another arch-specific hack that could be
> avoided if we had a TYPE_ARM_HVF_ACCEL QOM class.


I don't think that's necessary in this case. I don't see how you could 
ever have aarch64 and x86 HVF backends compiled into the same binary. 
The header files even have a lot of #ifdef's.

Either way, I've changed it to a weak function in v2. That way it's a 
bit easier to read.


Alex


