Received: by 10.223.172.38 with SMTP id v35csp5659691wrc;
        Mon, 11 Sep 2017 08:05:15 -0700 (PDT)
X-Received: by 10.55.157.87 with SMTP id g84mr16366541qke.70.1505142315620;
        Mon, 11 Sep 2017 08:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505142315; cv=none;
        d=google.com; s=arc-20160816;
        b=kRq2Hh2PHrCxDDv0JwbVOAR72okAWf1+ue9LsmJWAnzKuZCe5EIfJ/0edtWVpuXXw/
         UYHTGSElUoXPEgnEGJIKAX7TDMDQmS4JZ7IRE25WG8hEPi/bHrIIxsInJ1PVv/S9HDF7
         gKx2MycmCZEKjvY+TxtRj9HoM4wtC90RP6GP1U4+A9fkl+PeTMx1/NiKpCOSEaRmF6/9
         uFs/OI/jtKqJ+ebe2etCmjQYfqe/szg3Ko9uPpVUwXGAB2vuqKUXDRvCmXH2s3o4XvD2
         n3l+SOBpWZfRUHKUR5VYQUd/B7x/FIjSTA8eR5i2IZJKvR9T1mcmHb8a0gx7Jbv6vWEq
         pe3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=1Q8RjT9fd6L5a5ymtCvERmyO9u1QLI7rMbbYYw/qEpE=;
        b=gBBwRCZDJMOipHcv1eZ+Dg/D7/29lT1oSEMoVMd25Ss0j8FYqwsaYiKB3skBbMg0ot
         nxYw6d0mkLpWrvGEtZZWvr10/D70tp03zpVmvH3UW9+kBfZmkhbOMDT2WhEjh2iXbFvg
         13TTEG6ZRRu93YnrqtFRnnGyf/XJrFEwgZ+BXDueghLIKxQsitB1NEFfCtMSEJ24p/C6
         611LFTMVNLTLy0MtLYTJ3YvabIfa0W2FDXnmw3ZpH9VkmJopGpgWv82IveDU9d4b8Dah
         pBF8d3sDKaV718UK8B26uF15XT2Xcxppm9Q4K/mWZkFjKkpi12eTiqBbyZhwZoHRo8rw
         kSug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NYn6qLcx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1si9097813qkf.94.2017.09.11.08.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 08:05:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NYn6qLcx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drQGv-0003cY-Bp
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 11:05:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1drQFh-00033b-2I
	for qemu-devel@nongnu.org; Mon, 11 Sep 2017 11:04:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1drQFb-00074A-7A
	for qemu-devel@nongnu.org; Mon, 11 Sep 2017 11:03:57 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33087)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1drQFb-00073l-2f; Mon, 11 Sep 2017 11:03:51 -0400
Received: by mail-qt0-x241.google.com with SMTP id b1so3381756qtc.0;
	Mon, 11 Sep 2017 08:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=1Q8RjT9fd6L5a5ymtCvERmyO9u1QLI7rMbbYYw/qEpE=;
	b=NYn6qLcx1Q/HZWX/rrYu0dXu5y/HJWOWNThtMCkzhQeP1GHrrKX+MxD5/l5o7pj9v1
	C42qClv93WJsAX794O6pAdOclReJsfzWJLKrViznQfFtcDKzx55A/OJbhUpKN22GR5hY
	yCfFv/kVVgyPBunaP+lz7SUVjxM27pdCXlNdLYbPs4ccRB17/PhvboAqDIwLVH0KCe7o
	dxcxoRxQ+UpDqqbDb20+4iD1AEINI5W4HunjWtmmWRcaEaDo15J7F/b+NGBoQH4JO8pJ
	e3flFe6lKjloS8ndNhaDtPZFqzlcRy0MvmnJdaytX6qPWn5KZKsvgkVWx1IbVDW9YPkJ
	BsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1Q8RjT9fd6L5a5ymtCvERmyO9u1QLI7rMbbYYw/qEpE=;
	b=miiDmrS99mScth6Uh8e/5S1SU6kZX2i4tsg4op5Avr4Uj6NiyLewgXbyKoO3nqM04j
	Him6ZhkJm5HA6slmsMg7f2KDvqk6Tv9dETja7AJ2gwww9Wr+1f9off5haGRfsb5cwyJX
	qBTLRHS9RVzsL4RkJKEivmt67dWvGHCQK/JsEKZWWIu7JAS6xsO4J0OrppQYEQKMcv0X
	0tIBnoMG6R4p6uokTYR+oF72SxYYAqgBG9BUtYe5ZX7MbF5J6mrLvVFo+sp8ZmZE7Bj5
	0sz1RIVDfwnlvJIZOpL+qFTCdB2nJXmSW4iWW76bhCCCOqsRPOLUsUp/gBK6CGw/lag6
	+ptw==
X-Gm-Message-State: AHPjjUhEWciOlTFwf4AcEToDeuz2MiyOKxK0aduvtD3brkBxfnSnw1E6
	8rkpteCggjjCag==
X-Google-Smtp-Source: AOwi7QDEIeUa1NaSzo+6RLg7OVQQJTrVsCrJzb+yAJPcaH+Ttu2fupz3iRB/Nyv4vuqXNAwCr4XMCg==
X-Received: by 10.200.48.139 with SMTP id v11mr3147663qta.135.1505142230472;
	Mon, 11 Sep 2017 08:03:50 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id w46sm524426qta.84.2017.09.11.08.03.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Sep 2017 08:03:49 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
	<1505137930-13255-8-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eece5841-17c1-a469-81e5-c65a518eca94@amsat.org>
Date: Mon, 11 Sep 2017 12:03:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505137930-13255-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 7/7] target/arm: Rename 'type'
 to 'excret' in do_v7m_exception_exit()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5ggg/82fTLX/

On 09/11/2017 10:52 AM, Peter Maydell wrote:
> In the v7M and v8M ARM ARM, the magic exception return values are
> referred to as EXC_RETURN values, and in QEMU we use V7M_EXCRET_*
> constants to define bits within them. Rename the 'type' variable
> which holds the exception return value in do_v7m_exception_exit()
> to excret, making it clearer that it does hold an EXC_RETURN value.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   target/arm/helper.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a502e4e..4f41841 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6212,7 +6212,7 @@ static void v7m_push_stack(ARMCPU *cpu)
>   static void do_v7m_exception_exit(ARMCPU *cpu)
>   {
>       CPUARMState *env = &cpu->env;
> -    uint32_t type;
> +    uint32_t excret;
>       uint32_t xpsr;
>       bool ufault = false;
>       bool return_to_sp_process = false;
> @@ -6233,18 +6233,19 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>        * the target value up between env->regs[15] and env->thumb in
>        * gen_bx(). Reconstitute it.
>        */
> -    type = env->regs[15];
> +    excret = env->regs[15];
>       if (env->thumb) {
> -        type |= 1;
> +        excret |= 1;
>       }
>   
>       qemu_log_mask(CPU_LOG_INT, "Exception return: magic PC %" PRIx32
>                     " previous exception %d\n",
> -                  type, env->v7m.exception);
> +                  excret, env->v7m.exception);
>   
> -    if ((type & R_V7M_EXCRET_RES1_MASK) != R_V7M_EXCRET_RES1_MASK) {
> +    if ((excret & R_V7M_EXCRET_RES1_MASK) != R_V7M_EXCRET_RES1_MASK) {
>           qemu_log_mask(LOG_GUEST_ERROR, "M profile: zero high bits in exception "
> -                      "exit PC value 0x%" PRIx32 " are UNPREDICTABLE\n", type);
> +                      "exit PC value 0x%" PRIx32 " are UNPREDICTABLE\n",
> +                      excret);
>       }
>   
>       if (env->v7m.exception != ARMV7M_EXCP_NMI) {
> @@ -6255,7 +6256,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>            * which security state's faultmask to clear. (v8M ARM ARM R_KBNF.)
>            */
>           if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> -            int es = type & R_V7M_EXCRET_ES_MASK;
> +            int es = excret & R_V7M_EXCRET_ES_MASK;
>               if (armv7m_nvic_raw_execution_priority(env->nvic) >= 0) {
>                   env->v7m.faultmask[es] = 0;
>               }
> @@ -6283,7 +6284,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>           g_assert_not_reached();
>       }
>   
> -    switch (type & 0xf) {
> +    switch (excret & 0xf) {
>       case 1: /* Return to Handler */
>           return_to_handler = true;
>           break;
> @@ -6306,7 +6307,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>            */
>           env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
>           armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
> -        v7m_exception_taken(cpu, type);
> +        v7m_exception_taken(cpu, excret);
>           qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
>                         "stackframe: failed exception return integrity check\n");
>           return;
> @@ -6341,14 +6342,14 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>   
>       /* The restored xPSR exception field will be zero if we're
>        * resuming in Thread mode. If that doesn't match what the
> -     * exception return type specified then this is a UsageFault.
> +     * exception return excret specified then this is a UsageFault.
>        */
>       if (return_to_handler != arm_v7m_is_handler_mode(env)) {
>           /* Take an INVPC UsageFault by pushing the stack again. */
>           armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
>           env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
>           v7m_push_stack(cpu);
> -        v7m_exception_taken(cpu, type);
> +        v7m_exception_taken(cpu, excret);
>           qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on new stackframe: "
>                         "failed exception return integrity check\n");
>           return;
> 
