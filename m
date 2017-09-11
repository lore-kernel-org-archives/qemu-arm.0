Received: by 10.223.172.38 with SMTP id v35csp5650623wrc;
        Mon, 11 Sep 2017 07:59:38 -0700 (PDT)
X-Received: by 10.55.93.67 with SMTP id r64mr15035852qkb.358.1505141978595;
        Mon, 11 Sep 2017 07:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505141978; cv=none;
        d=google.com; s=arc-20160816;
        b=NJy0tJJMrIa4qouF/e0hpcWbd5V6PQ2ZW5OKPBkMSWaWVn8LZBEY8a0d5AmchSwMAc
         ZZUr0YLNLpxgHl8cvmu+iZW5H3gzIvseuXHLUtRN5mOqlUXOOguwPR1nQqse9xWPAOwY
         XQxgGB20IGqQ4hHGl42BCmOkr9D6uGS3ZubCtegaPKtA9QsAyYTxzf+giB6x6x2UWrjZ
         e6N1JXMrBabEcUIVSDSX55zL0mZyxdSnwqLDSHKmsV6OyZbXtu5Y8nP82XrxfpCJMx14
         8YmNQVfImAIAqU8mp4itKPlMKbQANKXoXBacCQc+LPKnEYBqg0akP88tCP6O5PUwOdUI
         yh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=kU7DXbwbUABxy3hV1NUm8TYV8m5wxefOkBcN1QeQbMk=;
        b=sv82FaNtCT8V8L2NImq0Rt/3NL+4c5Fz4aRKfIFQRJbiy6Y1nuEx64eu5IialF+0/V
         Lci+OSl5vnbyRZKATIRFPu21N2surSKbGXfGJFBFtr2EU7StRcx4Xu/j2ifPSiSxKLkD
         pvlA8s+BvsNtyb7+/aOclXqUjEhbLF1gw75AW8MzYTwqzbi8FRvQyZjVMv68wsh9WC4A
         UpWURSit9rJCY7B6d4D4SPPPa7j51Soy1XJC9hhylQU1+xGJcM282EzXbTs4J73zbfbz
         Gxb19ih2rsHA5nHkl4xtC0QlPYK+7Cwxm7hpmjemsUZ7vEjy9GGMrjcAT6TqyGvpZaMb
         OXDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FssfEeKe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f204si9416321qkb.324.2017.09.11.07.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 07:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FssfEeKe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drQBU-0001V8-AO
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 10:59:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1drQBP-0001T5-HS
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 10:59:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1drQBO-0000ph-EJ
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 10:59:31 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33001)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1drQBJ-0000hT-SI; Mon, 11 Sep 2017 10:59:25 -0400
Received: by mail-qt0-x242.google.com with SMTP id b1so3373913qtc.0;
	Mon, 11 Sep 2017 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=kU7DXbwbUABxy3hV1NUm8TYV8m5wxefOkBcN1QeQbMk=;
	b=FssfEeKe9KWgLOH3svFHHyVKkBGjdwclso4WuTrSaSZbJcyF3I2sFulEv1DoekGeD5
	LTm1rDOuQJcSp8JVH8nTW5+Cv44qo862bV6zzJ+pm5DR+kzttlNTURUN94OR/myiylLX
	v42LOHaC+79rv0Qnw22wc4Mu7AYyelDauk8vx1GX7Kqy/SPtwMR/s9xACca4RavhiMJZ
	WWmWay4FpKJ0dbJjymlow9hnlFcTTwDGjH8YVMlmlN5+Uw+aBlLTOKua55l1sFfiBsen
	SwutpvSXo4TxCH5LOPAHQrz5o+Vqxitm67whrg0EmyngAqsAZTq5D+jqi+ZzGeLS8ffv
	SJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kU7DXbwbUABxy3hV1NUm8TYV8m5wxefOkBcN1QeQbMk=;
	b=Yc0LOsbgQS7dnzwLtdzl5fayaEfhdFZohS1ZIBJGqPWau8TRPAW156EOZR4p9u8EIV
	eLDyDWDsgk3UAEssay+5g4vN1Z+2+MdIgN+aMF/yBPWEqgKrNEkeVFhqbmL9Hh0LAyt2
	PCn8XMqdo8XZTp91baSTRuhwhSMlt1GpZKKb3EAZdZ2IknJPxV8YZgaBxd8MNCRH+UEk
	jvA2npKS58ECzXd9m0jvnsHaeX9JI/B3oTqNYyoI53DObOqM3ugw1TjArfIyL/PvwTeH
	0QZE0rgHjY3s3ruJS6g0pv72kSvKjYn29qsOe7P8y2F8OMl3Zv9aoZkP0UAIHRcDpzz6
	Hxyg==
X-Gm-Message-State: AHPjjUj9bXKjQ4CkcKWBksQj/YzJLnm6aGcA2wf2klYsQ00FM114Bl/3
	NmZwSetLew//9D28FmE=
X-Google-Smtp-Source: AOwi7QD1YGQQ0oh2QWKuGtNuZwsEjaSd/d8TmB0gexfw4vAjFH5g6spPk1fiMVZR+dwR/rWNG4encQ==
X-Received: by 10.237.59.177 with SMTP id r46mr16952632qte.253.1505141965099; 
	Mon, 11 Sep 2017 07:59:25 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id 54sm6306040qts.39.2017.09.11.07.59.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Sep 2017 07:59:24 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
	<1505137930-13255-2-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2a61ae5a-dd09-d782-8cc1-66afd7a31559@amsat.org>
Date: Mon, 11 Sep 2017 11:59:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505137930-13255-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH 1/7] target/arm: Use M_REG_NUM_BANKS rather
 than hardcoding 2
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j7p57/VIzMVf

On 09/11/2017 10:52 AM, Peter Maydell wrote:
> Use a symbolic constant M_REG_NUM_BANKS for the array size for
> registers which are banked by M profile security state, rather
> than hardcoding lots of 2s.
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> Philippe suggested this in review on the last round of
> patches but I forgot about it :-(

Thank you, it eases review and looks cleaner :)

> ---
>   target/arm/cpu.h | 35 +++++++++++++++++++----------------
>   1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 98b9b26..5a1f957 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -81,8 +81,11 @@
>    * accessed via env->registerfield[env->v7m.secure] (whether the security
>    * extension is implemented or not).
>    */
> -#define M_REG_NS 0
> -#define M_REG_S 1
> +enum {
> +    M_REG_NS = 0,
> +    M_REG_S = 1,
> +    M_REG_NUM_BANKS = 2,
> +};
>   
>   /* ARM-specific interrupt pending bits.  */
>   #define CPU_INTERRUPT_FIQ   CPU_INTERRUPT_TGT_EXT_1
> @@ -433,19 +436,19 @@ typedef struct CPUARMState {
>           uint32_t other_sp;
>           uint32_t other_ss_msp;
>           uint32_t other_ss_psp;
> -        uint32_t vecbase[2];
> -        uint32_t basepri[2];
> -        uint32_t control[2];
> -        uint32_t ccr[2]; /* Configuration and Control */
> -        uint32_t cfsr[2]; /* Configurable Fault Status */
> +        uint32_t vecbase[M_REG_NUM_BANKS];
> +        uint32_t basepri[M_REG_NUM_BANKS];
> +        uint32_t control[M_REG_NUM_BANKS];
> +        uint32_t ccr[M_REG_NUM_BANKS]; /* Configuration and Control */
> +        uint32_t cfsr[M_REG_NUM_BANKS]; /* Configurable Fault Status */
>           uint32_t hfsr; /* HardFault Status */
>           uint32_t dfsr; /* Debug Fault Status Register */
> -        uint32_t mmfar[2]; /* MemManage Fault Address */
> +        uint32_t mmfar[M_REG_NUM_BANKS]; /* MemManage Fault Address */
>           uint32_t bfar; /* BusFault Address */
> -        unsigned mpu_ctrl[2]; /* MPU_CTRL */
> +        unsigned mpu_ctrl[M_REG_NUM_BANKS]; /* MPU_CTRL */
>           int exception;
> -        uint32_t primask[2];
> -        uint32_t faultmask[2];
> +        uint32_t primask[M_REG_NUM_BANKS];
> +        uint32_t faultmask[M_REG_NUM_BANKS];
>           uint32_t secure; /* Is CPU in Secure state? (not guest visible) */
>       } v7m;
>   
> @@ -546,7 +549,7 @@ typedef struct CPUARMState {
>           uint32_t *drbar;
>           uint32_t *drsr;
>           uint32_t *dracr;
> -        uint32_t rnr[2];
> +        uint32_t rnr[M_REG_NUM_BANKS];
>       } pmsav7;
>   
>       /* PMSAv8 MPU */
> @@ -556,10 +559,10 @@ typedef struct CPUARMState {
>            *  pmsav7.rnr (region number register)
>            *  pmsav7_dregion (number of configured regions)
>            */
> -        uint32_t *rbar[2];
> -        uint32_t *rlar[2];
> -        uint32_t mair0[2];
> -        uint32_t mair1[2];
> +        uint32_t *rbar[M_REG_NUM_BANKS];
> +        uint32_t *rlar[M_REG_NUM_BANKS];
> +        uint32_t mair0[M_REG_NUM_BANKS];
> +        uint32_t mair1[M_REG_NUM_BANKS];
>       } pmsav8;
>   
>       void *nvic;
> 
