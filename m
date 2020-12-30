Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp12282283lfq;
        Wed, 30 Dec 2020 14:38:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMtCcE0GqX5ErrKUEml9gb7iGOqZ2z0mF/dtkdEjTOQZIXyALSN97xzJq312D075iqHtsB
X-Received: by 2002:a25:50a:: with SMTP id 10mr78326332ybf.115.1609367914642;
        Wed, 30 Dec 2020 14:38:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609367914; cv=none;
        d=google.com; s=arc-20160816;
        b=Tk85bQJRMBzS5KcNUfmJRQIgYoHeogD9aQtBjP317ZSd/TcD3FTSbYOjlhpA0/xG+A
         1zwAsHaBzvYq5WFxIdzHthZbGbwuQyUggaipnUFr5n2bPnHu48BcYDFmIqJd5/LwKdwv
         XZvIbzF+/fzzigSr1aJ/Be8394M9wdfJ1R61rWrEiKMLFJSB7CHw12WGrUUCia/wFXKB
         tsDMBi3qeEzzmtdDOjGZOsRMsP+4qYHHd8TLEi8gegNRukAzk7Noj8xqX3ZzF2+80tM6
         aTzoyH6ADOXEMyrmPp4/cXCoHe68SEj9b7gwx50bWiGO0wG9x5g8rfJNVZn67s//EZnK
         5Ngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=Aj/bWab8koY6Czj/Y98SO0WFOeHwIQhdjdAZnaEgc1Q=;
        b=J/Mrfuk8OIfe2DJLyoQKxXpBglJZGQIUNeq1UM4sbMscl9eWCUx9UVj1O46VKvPIP8
         KVXZZcgwBkflSYz2R0bbhxjctVL21GZsVL/zNcPf44jz1K7gQM+pEi6RPEUujGNpXziL
         pJ7TbxeHz6SMtUL3qhr/0fu0NCNA8Ejrohb5VDIYU8R3rv4KGLSO3oW9kqds+IFWqQd2
         sv1WcoNfYEAwcWcJsyX+NaF/GHxQYNvJUnuyTfrasiTu0VtjhO84MIVUpOxaxi4BUsnu
         EtEUG2Fzd9Z7jZfeWJqiweeylqxzXKwkCc4j9+cz3PkfptIXVKsrx/9w5WE1NzO+23M1
         h9WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EKsWOQPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si27715561ybr.445.2020.12.30.14.38.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Dec 2020 14:38:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EKsWOQPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kuk70-0005d3-0z
	for alex.bennee@linaro.org; Wed, 30 Dec 2020 17:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kuk6m-0005b1-3d
 for qemu-arm@nongnu.org; Wed, 30 Dec 2020 17:38:20 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:32811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kuk6k-00011f-Ix
 for qemu-arm@nongnu.org; Wed, 30 Dec 2020 17:38:19 -0500
Received: by mail-pj1-x102b.google.com with SMTP id w1so2437004pjc.0
 for <qemu-arm@nongnu.org>; Wed, 30 Dec 2020 14:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Aj/bWab8koY6Czj/Y98SO0WFOeHwIQhdjdAZnaEgc1Q=;
 b=EKsWOQPA5RmQuuctMcAhVGd1+zlBXGqeepBBABFmXl5qHLBdRTVEh6jqJTpLNtPTRJ
 MocPXTsysdFEtEK8Ln2qFh4qmIxk4WmOmVFKX2VKU2qzJccCkf9JNaKjKbmAnoH3UmXP
 8b3oRH9ySiT2q/SPc9mJYC1eHBC5zGaSy/NCI+dyqRyTJ+i93wgMVlhIzdmWvEN+Q5Oj
 E18uiIiF4jByDlefinwMdFtwWA7gxFVxbBs4wsTTO1SdPdU0n0ZFtG5ddqS3TJz++Atn
 O7B5JTeU+wugerWJ8X9gAk1DP202DEh3A5NLdqQeCuFWk924FVMUhgXG9O1wM4zHMmI+
 jojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Aj/bWab8koY6Czj/Y98SO0WFOeHwIQhdjdAZnaEgc1Q=;
 b=dSRuM2hTN/t6n2Nip+8mEUZGwr7adGhkgZ/rcqlzC8Qkw+EIRSIp5O/cBJ555MGBaL
 jIiqwDu3piNvtv2Fop59zkd4eQq8bDY7Dq6HXoyGT74TM44G1RLwlxOzhDdKl0VFtANf
 2XcQdCJQp+NL+1B1SjVdHOZh4aCtrVUj73wdLvbXB7UnlHcjg0UvOzebt2lMqTKp9lAJ
 gwPWtDEPcPcgagDEA9BznXeYvwskeKscSgZ8nJL3cbkZM2k8QuhJm3HHjE41Oe5QvnmV
 EZ0NQFFRPAsL3csKkZtndp9WYw3EBme77HfFr4K70oF8LkoSmgQLMTVEOlzlPNnqCBMO
 +5Lg==
X-Gm-Message-State: AOAM533bumOc5kQ/Uku6Pl1CCytdv4grp9h2ighHUzHV0n+nRJ2TinjB
 lhKlVNqyYBjqYANWmEANfXBg+A==
X-Received: by 2002:a17:90a:eacf:: with SMTP id
 ev15mr10917613pjb.174.1609367896995; 
 Wed, 30 Dec 2020 14:38:16 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 a23sm8406566pjh.19.2020.12.30.14.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Dec 2020 14:38:16 -0800 (PST)
Subject: Re: [PATCH 1/3] target/arm: keep translation start level unsigned
From: Richard Henderson <richard.henderson@linaro.org>
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <7884934.NyiUUSuA9g@basile.remlab.net>
 <20201218143321.102872-1-remi.denis.courmont@huawei.com>
 <c2af03a8-9f56-fb43-485c-91ec0fbdef31@linaro.org>
Message-ID: <002743e6-10d3-88b3-961a-8571efb4d1ed@linaro.org>
Date: Wed, 30 Dec 2020 14:38:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c2af03a8-9f56-fb43-485c-91ec0fbdef31@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.399,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2U33XJX0EBGg

On 12/30/20 2:10 PM, Richard Henderson wrote:
> On 12/18/20 6:33 AM, remi.denis.courmont@huawei.com wrote:
>> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
>>
>> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
>> ---
>>  target/arm/helper.c | 14 ++++++--------
>>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> The patch does more than what is described above.
> 
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index df195c314c..b927e53ab0 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -10821,17 +10821,12 @@ do_fault:
>>   * Returns true if the suggested S2 translation parameters are OK and
>>   * false otherwise.
>>   */
>> -static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>> +static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint32_t level,
>>                                 int inputsize, int stride)
>>  {
>>      const int grainsize = stride + 3;
>>      int startsizecheck;
>>  
>> -    /* Negative levels are never allowed.  */
>> -    if (level < 0) {
>> -        return false;
>> -    }
>> -
> 
> I would expect this to be the only hunk from the patch description.  Probably
> changing this negative check to a >= 3 check.

Having read the next patch, I think you should drop this type change.

>> @@ -11203,7 +11201,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>>  
>>          if (!aarch64 || stride == 9) {
>>              /* AArch32 or 4KB pages */
>> -            startlevel = 2 - sl0;
>> +            startlevel = (2 - sl0) & 3;

This hunk belongs with the next patch, implementing TTST, and should be
conditional.  I.e.

    if (stride == 9) {
        startlevel = 2 - sl0;
        if (aarch64 &&
            cpu_isar_feature(aa64_st, env_archcpu(env)) {
            startlevel &= 3;
        }
    ...


r~
