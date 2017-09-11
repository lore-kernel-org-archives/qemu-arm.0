Received: by 10.223.172.38 with SMTP id v35csp5893576wrc;
        Mon, 11 Sep 2017 11:07:18 -0700 (PDT)
X-Received: by 10.55.4.20 with SMTP id 20mr10962555qke.281.1505153238171;
        Mon, 11 Sep 2017 11:07:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505153238; cv=none;
        d=google.com; s=arc-20160816;
        b=tKs/4ur4H/oIumFyYJ4c/Tsumf5Kp7TTMpG6n4VmpCbtoQXgAPFKFNTMt0Co3ixoWT
         /Wb5lL7O7z7BXUmllXNWXiAylgRfEwuJhWAGpBSEc3iGZik5QmbMf5xsO18l8IL5ZyC2
         DyXy/bxhKodCMglx7/kGi23oBXXBdxlT13zqPNax2tkuLPgAgzCRPqxhp3dpWpfLNTFU
         l5mJXqoAzkRdLbA7QAM+utS3I9j0ISCJEtEgqpo88DSKvc72HfC5+63LLQLU+88fL380
         IcTSZxDP/9VlNYB9nSWfNHi+Dlr4hPe5E9yFN5obaKs2e5CK20b4zGDThT7H9Wr6tJrg
         3mBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=x9mDbGJb/eY5QXJIY+K8tyMg+JSUyy0aalLBFbJXJOE=;
        b=W1wiZYl+8mtQVThBTBAoXFnKSiw27/olkqgUbBcZVGUlFuuD0a3dvnh9jVviiyfkId
         MUJdc16UqfyidDxTq00dKM+Ep6zQLNmSawb1NsXg9No100Q6iaGpIkTbVoBUXLMfq51s
         RqNcMO5tcP1/SrJKx+P7N5rH9OKAk0U16UN4PXPOqJq1qypa79EPwMeJEQ04tP45llo1
         K99oxIscVRJGUDhTKonYPWiU+CFHc/w/15K1YP12Drd28o3taMmjMXqVUbD1eT87dRqy
         1FGGncOv4THkzV7Ji/lCiVsmjGK5UGuDA01GvgG14YS3aliQIm/LYOqXg70VshPj/ufv
         7JRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NJUjWHuY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33si10385681qty.157.2017.09.11.11.07.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 11:07:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NJUjWHuY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drT75-0008G1-QS
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 14:07:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1drSa7-0002Sn-Oi
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 13:33:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1drSa6-0000dh-G1
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 13:33:11 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:38247)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1drSa6-0000dH-Ae; Mon, 11 Sep 2017 13:33:10 -0400
Received: by mail-wr0-x244.google.com with SMTP id p37so4727638wrb.5;
	Mon, 11 Sep 2017 10:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=x9mDbGJb/eY5QXJIY+K8tyMg+JSUyy0aalLBFbJXJOE=;
	b=NJUjWHuYfBnIU/Rkm0CXumlVFjDbBKgqj3fg4stqhaLYFATVyTw2i9Ni6kyq3F8p7R
	B58wsYFyDX/COEhr5fthHsC9z8oFn+Df2IWWLxam/BX1dciU2yJwD9k2GQW+Y/Egu/Ts
	VFZ/smvpW7i8E1L9py31inWCYk1IVlD+e91Jvns3VcXQsW/Yzotz1Rk5dJj7dHI3pnhN
	QUjE8M3pYLpPfs2smMti9pf3kF4kYpQPCUiOMKpXySBMNuJqcInpH+ujtNhgOxoInTUe
	lIPGpssU+TCTfiijzcYZ6qPNhUVgWj22kICcSuFZBj+q7MIK28V2/x2k+GuuBrlRj06I
	2EYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=x9mDbGJb/eY5QXJIY+K8tyMg+JSUyy0aalLBFbJXJOE=;
	b=ZUAkdhQOFrOoUGN9X2lr+rmMkAg2Ba4u8VBVXUGxDReSchmpMSFw6z4Bq/pr6M+SdG
	eoN57NY6loR1MT3/yAFTR9zCQmyK1jX6+ZxdFv4gsxKJFTYI8OKMGEoO6CG4tukFCIbS
	etAPIt9ear1j4vFdhEYdJVYUrPmRSlbK3e+9dveYh9Onz1swER79/LIZoaBwvvyEKT9J
	uFviEjl89hXYcairisn33lLXSoRwCQngnFK0gFn+qbM3RJDmkpuo0GkdgCCTb3fdxb3Q
	C1Z0+VHok5RB6hORkCRjN0ZOQx6NYJPZ8Z6MY8xoTvlyaSovyQ0CGpUFPAaDVHYVo47g
	r4pg==
X-Gm-Message-State: AHPjjUi+nCBYrKg+IAiiQwx6Tp6xESOpx+mElUX2VezsUQAfotqN4nfb
	+pIZ6JlDio71SFXmGuoo6hpk2quyvg==
X-Google-Smtp-Source: ADKCNb5Hfon9VVhI6acT1ybDYQMhejUJnWCU+8YP3yQZlVGOLDb25hPkxy1CbVbtCSZJsv6xRmkl0OGw0PDWv8erXNw=
X-Received: by 10.223.169.143 with SMTP id b15mr5241214wrd.127.1505151189265; 
	Mon, 11 Sep 2017 10:33:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Mon, 11 Sep 2017 10:32:38 -0700 (PDT)
In-Reply-To: <2a61ae5a-dd09-d782-8cc1-66afd7a31559@amsat.org>
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
	<1505137930-13255-2-git-send-email-peter.maydell@linaro.org>
	<2a61ae5a-dd09-d782-8cc1-66afd7a31559@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Sep 2017 10:32:38 -0700
Message-ID: <CAKmqyKNrk_aBGwMs0gL_xf5PiA6BEL0x3xxxsFf+i3NJReEEaA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/7] target/arm: Use
 M_REG_NUM_BANKS rather than hardcoding 2
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0iUR9U1GqbNS

On Mon, Sep 11, 2017 at 7:59 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 09/11/2017 10:52 AM, Peter Maydell wrote:
>>
>> Use a symbolic constant M_REG_NUM_BANKS for the array size for
>> registers which are banked by M profile security state, rather
>> than hardcoding lots of 2s.
>>
>> Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

>
>> ---
>> Philippe suggested this in review on the last round of
>> patches but I forgot about it :-(
>
>
> Thank you, it eases review and looks cleaner :)
>
>
>> ---
>>   target/arm/cpu.h | 35 +++++++++++++++++++----------------
>>   1 file changed, 19 insertions(+), 16 deletions(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 98b9b26..5a1f957 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -81,8 +81,11 @@
>>    * accessed via env->registerfield[env->v7m.secure] (whether the
>> security
>>    * extension is implemented or not).
>>    */
>> -#define M_REG_NS 0
>> -#define M_REG_S 1
>> +enum {
>> +    M_REG_NS =3D 0,
>> +    M_REG_S =3D 1,
>> +    M_REG_NUM_BANKS =3D 2,
>> +};
>>     /* ARM-specific interrupt pending bits.  */
>>   #define CPU_INTERRUPT_FIQ   CPU_INTERRUPT_TGT_EXT_1
>> @@ -433,19 +436,19 @@ typedef struct CPUARMState {
>>           uint32_t other_sp;
>>           uint32_t other_ss_msp;
>>           uint32_t other_ss_psp;
>> -        uint32_t vecbase[2];
>> -        uint32_t basepri[2];
>> -        uint32_t control[2];
>> -        uint32_t ccr[2]; /* Configuration and Control */
>> -        uint32_t cfsr[2]; /* Configurable Fault Status */
>> +        uint32_t vecbase[M_REG_NUM_BANKS];
>> +        uint32_t basepri[M_REG_NUM_BANKS];
>> +        uint32_t control[M_REG_NUM_BANKS];
>> +        uint32_t ccr[M_REG_NUM_BANKS]; /* Configuration and Control */
>> +        uint32_t cfsr[M_REG_NUM_BANKS]; /* Configurable Fault Status */
>>           uint32_t hfsr; /* HardFault Status */
>>           uint32_t dfsr; /* Debug Fault Status Register */
>> -        uint32_t mmfar[2]; /* MemManage Fault Address */
>> +        uint32_t mmfar[M_REG_NUM_BANKS]; /* MemManage Fault Address */
>>           uint32_t bfar; /* BusFault Address */
>> -        unsigned mpu_ctrl[2]; /* MPU_CTRL */
>> +        unsigned mpu_ctrl[M_REG_NUM_BANKS]; /* MPU_CTRL */
>>           int exception;
>> -        uint32_t primask[2];
>> -        uint32_t faultmask[2];
>> +        uint32_t primask[M_REG_NUM_BANKS];
>> +        uint32_t faultmask[M_REG_NUM_BANKS];
>>           uint32_t secure; /* Is CPU in Secure state? (not guest visible=
)
>> */
>>       } v7m;
>>   @@ -546,7 +549,7 @@ typedef struct CPUARMState {
>>           uint32_t *drbar;
>>           uint32_t *drsr;
>>           uint32_t *dracr;
>> -        uint32_t rnr[2];
>> +        uint32_t rnr[M_REG_NUM_BANKS];
>>       } pmsav7;
>>         /* PMSAv8 MPU */
>> @@ -556,10 +559,10 @@ typedef struct CPUARMState {
>>            *  pmsav7.rnr (region number register)
>>            *  pmsav7_dregion (number of configured regions)
>>            */
>> -        uint32_t *rbar[2];
>> -        uint32_t *rlar[2];
>> -        uint32_t mair0[2];
>> -        uint32_t mair1[2];
>> +        uint32_t *rbar[M_REG_NUM_BANKS];
>> +        uint32_t *rlar[M_REG_NUM_BANKS];
>> +        uint32_t mair0[M_REG_NUM_BANKS];
>> +        uint32_t mair1[M_REG_NUM_BANKS];
>>       } pmsav8;
>>         void *nvic;
>>
>
