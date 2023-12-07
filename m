Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp1621357ejb;
        Thu, 7 Dec 2023 05:52:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+vvlosUnZd0kREaPexzu0Y8OvUW+wnc4dxTsw8f8SX5EoXzoMxFEm5U4vmX+y+vynMvN5
X-Received: by 2002:a1f:6401:0:b0:4b2:7749:aa96 with SMTP id y1-20020a1f6401000000b004b27749aa96mr2816089vkb.11.1701957129777;
        Thu, 07 Dec 2023 05:52:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701957129; cv=none;
        d=google.com; s=arc-20160816;
        b=xSb/C6aoCbW3uVlgGD1o0S+1kKLkb2DpdC3++e2OS2uibAfpZYd+BGdfhad4i4bZLq
         jAeRVAJyTowp6pBcT4nSiYCDYU7CmK9GJsjk/wKCWsPGQHDQWBIUJIQH/En8xDIu1V/W
         vjtIylA+ORH+ZuxsxClesqZkYmCwPgsJRDhNmiIOVZpA1aQJR63o6FXDmF5vR3L9LWNp
         MLfBqE6BaNPnbZv5gUkdatyxFtmq9TUNdhS7XQa6DEyCd33OOIOsLd1+H4mBFuCq/UvC
         /fzemqh586Tm40vHI5HReIVp40MQrdGTp1y6UzqhvWUEEc1SNs60n/f5SxWKOznn9NXH
         z31w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=toSc5f8mQug4/bHFu4YFeCu8eE/7YMHHibYjwd+EuR8=;
        fh=7PxpAj2Wwz/BcKBFkylXdA9zpg/I3+oF9qHMSR/vHM8=;
        b=RS28JfIBIHWhc+AGhj9CU7jPikBEqNYlJfZcjnFdkT75XNayJRK19oqRxzvrnVclKu
         UbhqJKALd+O+pqAdWrX7ACKhgPzHmTThWvABotJV5BOL4kmHtTQN4M+0nHXWFr76DCuv
         4v2oTRWI1r8/ff1J8z3O4qY0A0rHBQmiyRSKkx6hNu7R+OMhjw4F8jj8i89XFcq5GFIh
         20g8UB9r2jRrbjoEvDO7maBjMXgUkyDSmBANTddqHZqhYewXr+4Du3/9IXMwWkxBgJLu
         JX9QylA0eVYK3l7h2BTkNR8TAbRpZSgs2P4FQuYLPCHXpKRiKlIysjktnWRMf38a26gQ
         yEpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=heEwPiuU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm40-20020a05620a19a800b0077d6998b65bsi1343418qkb.292.2023.12.07.05.52.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 05:52:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=heEwPiuU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBEmt-00067P-Oh; Thu, 07 Dec 2023 08:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBEmr-000676-LX
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 08:51:33 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBEmm-0004Z8-64
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 08:51:33 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3332f1512e8so870995f8f.2
 for <qemu-arm@nongnu.org>; Thu, 07 Dec 2023 05:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701957086; x=1702561886; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=toSc5f8mQug4/bHFu4YFeCu8eE/7YMHHibYjwd+EuR8=;
 b=heEwPiuUK3Jt/dg20NmdYeOutja+bolN2yGiLuBky69yQb3BMSLMsTq+njW3iowlCp
 pumdb6eTIKx3Rd78FlcZUJHyfhwqGmWhAWpkjgZ/a0lUx2wpSdfwUxho87Ti42irZ1lh
 2MU9lADm1mCXPNGOfUIXLiLNkaeB5AOOd/vjOLk4LkSyPcIo86Oi1qXM/dFzjfd55TAR
 fDZtQ82vzEc/2IqHaKi/r1kn5NAnhBeGZqCsFlKB5JA/8Yy+cTbH7hZycLCien4rbbJq
 mhCzFfpRXMHDUwWobI6v5IEV0KieirhcbaJQA5htJlq2OVdP5hd5VGyau1J1V54D8Xsl
 RswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701957086; x=1702561886;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=toSc5f8mQug4/bHFu4YFeCu8eE/7YMHHibYjwd+EuR8=;
 b=ishEQ1aP5fRkTHDlQJ2wdLjrjf1bJMikmm/aQMfNetIDUD1fh/Ney3cADdiYzL0u+3
 ptXu1OuCspRG5cjbM21dDX8npw/ifqd/M7hU4ug24LrxIzaXxH2V5yH/FAuQQ2icp0yz
 WXcx2KvkRYiVZDVe/IDaq344McEriZHgXhrKDK3gvVfewQ4QwqauKhab7iJ4p5Jwl6D0
 zK9x5wV0oQdNsVpyxxbhj0GNKtZDro6ULg39pB1JXnlPrtr0TewiT7AFLVe3LrH+3bDC
 pi21sQwZ3BosX5mvLdVNiyfZv3WSMTFJfe6E3erZ/CLnLC0tptmdm2760i++D9s8Ls6j
 LpLw==
X-Gm-Message-State: AOJu0YzQGbH7RYT/0t65lK1NjycM9Wsn/a6qeWZMsR6/PpYVhbdtIoxv
 6JFdvoB0O2SHiFJU9J8+YBUKHg==
X-Received: by 2002:a5d:4447:0:b0:334:b3d0:c300 with SMTP id
 x7-20020a5d4447000000b00334b3d0c300mr837078wrr.32.1701957086042; 
 Thu, 07 Dec 2023 05:51:26 -0800 (PST)
Received: from [192.168.69.100] ([176.187.202.111])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a056000104f00b00333320cf08bsm1491076wrx.102.2023.12.07.05.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 05:51:25 -0800 (PST)
Message-ID: <8665d22d-6606-49b4-91a9-124ca68775b2@linaro.org>
Date: Thu, 7 Dec 2023 14:51:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] sysemu/replay: Restrict icount to system emulation
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-arm <qemu-arm@nongnu.org>
References: <20231207102632.33634-1-philmd@linaro.org>
 <20231207102632.33634-4-philmd@linaro.org>
 <41f23b62-15ae-4e1e-98ee-a3cbcf0f7789@linaro.org>
In-Reply-To: <41f23b62-15ae-4e1e-98ee-a3cbcf0f7789@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uNl1lGyA2ij2

On 7/12/23 14:46, Philippe Mathieu-Daudé wrote:
> On 7/12/23 11:26, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/sysemu/cpu-timers.h |  2 +-
>>   include/sysemu/replay.h     |  9 ++++++---
>>   stubs/icount.c              | 19 -------------------
>>   3 files changed, 7 insertions(+), 23 deletions(-)
>>
>> diff --git a/include/sysemu/cpu-timers.h b/include/sysemu/cpu-timers.h
>> index 2e786fe7fb..188f67ee90 100644
>> --- a/include/sysemu/cpu-timers.h
>> +++ b/include/sysemu/cpu-timers.h
>> @@ -24,7 +24,7 @@ void cpu_timers_init(void);
>>    * 1 = Enabled - Fixed conversion of insn to ns via "shift" option
>>    * 2 = Enabled - Runtime adaptive algorithm to compute shift
>>    */
>> -#ifdef CONFIG_TCG
>> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>>   extern int use_icount;
>>   #define icount_enabled() (use_icount)
>>   #else
>> diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
>> index 02fa75c783..8102fa54f0 100644
>> --- a/include/sysemu/replay.h
>> +++ b/include/sysemu/replay.h
>> @@ -1,6 +1,3 @@
>> -#ifndef SYSEMU_REPLAY_H
>> -#define SYSEMU_REPLAY_H
>> -
>>   /*
>>    * QEMU replay (system interface)
>>    *
>> @@ -11,6 +8,12 @@
>>    * See the COPYING file in the top-level directory.
>>    *
>>    */
>> +#ifndef SYSEMU_REPLAY_H
>> +#define SYSEMU_REPLAY_H
>> +
>> +#ifdef CONFIG_USER_ONLY
>> +#error Cannot include this header from user emulation
>> +#endif
>>   #include "exec/replay-core.h"
>>   #include "qapi/qapi-types-misc.h"
>> diff --git a/stubs/icount.c b/stubs/icount.c
>> index c39a65da92..ec8d150069 100644
>> --- a/stubs/icount.c
>> +++ b/stubs/icount.c
>> @@ -5,30 +5,11 @@
>>   int use_icount;
>> -void icount_update(CPUState *cpu)
>> -{
>> -    abort();
>> -}
>>   int64_t icount_get_raw(void)
>>   {
>>       abort();
>>       return 0;
>>   }
>> -int64_t icount_get(void)
>> -{
>> -    abort();
>> -    return 0;
>> -}
>> -int64_t icount_to_ns(int64_t icount)
>> -{
>> -    abort();
>> -    return 0;
>> -}
> 
> Build failure on HVF due to:
> 
>    pmu_init()
>     -> pm_events[]
>      -> INST_RETIRED
>       -> instructions_ns_per()
>        -> icount_to_ns()
> 
> So we need to keep the icount_to_ns() stub until we restrict
> ARM PMU code to TCG.

Alternatively, we can use as a preliminary patch:

-- >8 --
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 20e13215bb..48ab1e0523 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -939,11 +939,13 @@ static bool instructions_supported(CPUARMState *env)

  static uint64_t instructions_get_count(CPUARMState *env)
  {
+    assert(icount_enabled());
      return (uint64_t)icount_get_raw();
  }

  static int64_t instructions_ns_per(uint64_t icount)
  {
+    assert(icount_enabled());
      return icount_to_ns((int64_t)icount);
  }
  #endif
---

