Received: by 10.25.0.6 with SMTP id 6csp1855978lfa;
        Tue, 30 May 2017 07:56:40 -0700 (PDT)
X-Received: by 10.55.40.151 with SMTP id o23mr16426750qko.210.1496156200611;
        Tue, 30 May 2017 07:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496156200; cv=none;
        d=google.com; s=arc-20160816;
        b=zKALWtOcJkPEz5/g5ky1rB0je/NyLIrb3lIzHiMivOLlvMeu9SSot3A/3E8krotCNz
         wEy8EQKbF7wJwGHf1ZyCLkfN18X++1n9zDroXfKATtpSdrMgdW3vlyNP6l89rQJTssSy
         Km7Y16byTlH90HFObE6vr+6iBBuxhAYRW7dy+g6gmo6NSnT8TMS9vZh2CkKWy4VpSezL
         Ne2XAga99UgBcuHSVMV+AESlP8JEVAG5AbXZrU5+hmHr7B7lmlt6wuGt1yzoxO76ztj/
         4MInK5ZI01Bscfrzoc7NmXlpm65aKr8n7PS1Ocw6p2org8guLAs2d80B16VIN1hKgxTu
         K8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=REovwz4hciPzcWZQ3Km9CGVTvgCUX2RWLX1tqRFnG3Y=;
        b=oVriVcHDaTjyFkuNlz2d2LtxP1vb5TNMPvV8fj9ZtSBmVDFJmpkLt8gaXOvULv/mmW
         gNt5b4a+wPgtTf93Omrc1qwuXFGOpff7H8zE2T0P+n7iNuxvCu6CrsV29cAs0N0pxvDm
         K4kcezXRza//I4M100iEa0Y02kCZhSsiQAXuEXVSmfGeLwx2srDrrQrr2j6PFOHEY05J
         mp4ZKccr2DDXibb4G+aihV+7l48MetmBw5T5qzGGKYzUq0Q6Z+ffaxJG6DagRYKEsoWf
         mDj7sEnOA+weAjgPWHMqWNbvKcnPTIddSYg8RVZ5UORpj6C5rIw/AR74lyyTriRB234z
         lu9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n143si12931082qkn.4.2017.05.30.07.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 07:56:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFiZc-0000H5-1u
	for alex.bennee@linaro.org; Tue, 30 May 2017 10:56:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFiZT-0000FJ-SL
	for qemu-arm@nongnu.org; Tue, 30 May 2017 10:56:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFiZS-00016D-PX
	for qemu-arm@nongnu.org; Tue, 30 May 2017 10:56:31 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35515)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFiZM-000152-32; Tue, 30 May 2017 10:56:24 -0400
Received: by mail-oi0-x241.google.com with SMTP id v80so16183114oie.2;
	Tue, 30 May 2017 07:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=REovwz4hciPzcWZQ3Km9CGVTvgCUX2RWLX1tqRFnG3Y=;
	b=PTsEo3ZTPwrI/j671ynYmIS2K7gPv9qbbwby5FdNP0tvwVQSAKg9nOkS9EIepC87rF
	TULgkqUlrTyNtueBkKk8UaIytA4610uBeyJPC2/6OFe88r4cM5VaE2WwHQQCSNd/dRS8
	JMvenHztEkeqJFjeTQ7o/Y4OaXfCiUpfcP/H8Jm1g1wP398FobFwu/kHVI5wbhJgjOHa
	vCNvPbwOuMyDXWsc6NXu7nCKpr6DfQs2Bk4PAU0gr2IL0LAR8hbO4NlBwq4UEHoQK0k8
	B6x0eBOXVP/KdMbHIg5JWQPnUBwjctYcX3pKY9oqIWIbqjFj8iFIQzROcCT07/x/ETXW
	uKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=REovwz4hciPzcWZQ3Km9CGVTvgCUX2RWLX1tqRFnG3Y=;
	b=JLfKPpi88emb+gumsMYMG1ZHAreT2tPGBgGiAlOIbyLQD889+Fq7tJ48V2Hewi47rC
	TxysDjFNSiB+C3LNc5ERSl27N6u0+sl7V2CgCRpzRm5gspYrWFngJQF8/zMsiHafmS6p
	5CtUz3ucb8QfOZHyKzj2rnlY9W5GOGeBdBRVA3qGQZSLRLcMsE9R9Ihi8wsGGzfJmC7w
	ffw3bJ5PHzI1tcjkEhbVIlD/d6+KlObZ1SBYDLN4ThGsIFt/SmH/5ehvxsLVD7DqAFV+
	yTggfqPNnzimA9N8FmnMVz4DsWvx1UO+AhCobnGH7u6SxmUZRIm0oPHaWOu59PlO4o2d
	SMGQ==
X-Gm-Message-State: AODbwcAVfmZnrZppR1XNIO8SXZVlYMPpZnQI6+w5qlLUwgqQh5mqJugG
	fRiKQuMLL180eQ==
X-Received: by 10.157.4.48 with SMTP id 45mr8516971otc.46.1496156183055;
	Tue, 30 May 2017 07:56:23 -0700 (PDT)
Received: from [192.168.1.107]
	(162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
	by smtp.gmail.com with ESMTPSA id
	q83sm5905980oig.25.2017.05.30.07.56.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 07:56:22 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
	<1493122030-32191-10-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c9954451-ad9b-2365-5ed7-bc4c29f40abe@amsat.org>
Date: Tue, 30 May 2017 11:56:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493122030-32191-10-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH 09/13] armv7m: Implement M profile default
 memory map
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
Cc: patches@linaro.org, Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vGnnfL7v7/Wq

Hi Peter,

On 04/25/2017 09:07 AM, Peter Maydell wrote:
> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> Add support for the M profile default memory map which is used
> if the MPU is not present or disabled.
>
> The main differences in behaviour from implementing this
> correctly are that we set the PAGE_EXEC attribute on
> the right regions of memory, such that device regions
> are not executable.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> [PMM: rephrased comment and commit message; don't mark
>  the flash memory region as not-writable]

"not-writable by system caches" maybe to clarify?

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 35 ++++++++++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 9e1ed1c..51662ad 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8129,18 +8129,35 @@ static inline void get_phys_addr_pmsav7_default(CPUARMState *env,
>                                                  ARMMMUIdx mmu_idx,
>                                                  int32_t address, int *prot)
>  {
> -    *prot = PAGE_READ | PAGE_WRITE;
> -    switch (address) {
> -    case 0xF0000000 ... 0xFFFFFFFF:
> -        if (regime_sctlr(env, mmu_idx) & SCTLR_V) { /* hivecs execing is ok */
> +    if (!arm_feature(env, ARM_FEATURE_M)) {
> +        *prot = PAGE_READ | PAGE_WRITE;
> +        switch (address) {
> +        case 0xF0000000 ... 0xFFFFFFFF:
> +            if (regime_sctlr(env, mmu_idx) & SCTLR_V) {
> +                /* hivecs execing is ok */
> +                *prot |= PAGE_EXEC;
> +            }
> +            break;
> +        case 0x00000000 ... 0x7FFFFFFF:
 >              *prot |= PAGE_EXEC;

I checked at Table B3-1 on the ARMv7-M Architecture Reference Manual I 
got at https://static.docs.arm.com/ddi0403/e/DDI0403E_B_armv7m_arm.pdf 
and the on-chip peripheral address space at 0x40000000 is eXecute Never.

> +            break;
> +        }
> +    } else {
> +        /* Default system address map for M profile cores.
> +         * The architecture specifies which regions are execute-never;
> +         * at the MPU level no other checks are defined.
> +         */
> +        switch (address) {
> +        case 0x00000000 ... 0x1fffffff: /* ROM */
> +        case 0x20000000 ... 0x3fffffff: /* SRAM */
> +        case 0x60000000 ... 0x7fffffff: /* RAM */
> +        case 0x80000000 ... 0x9fffffff: /* RAM */
> +            *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +            break;
> +        default: /* Peripheral, 2x Device, and System */
> +            *prot = PAGE_READ | PAGE_WRITE;

This body is correct, however what do you think about using cases with 
comments instead of 'default'? This would be clearer.

>          }
> -        break;
> -    case 0x00000000 ... 0x7FFFFFFF:
> -        *prot |= PAGE_EXEC;
> -        break;
>      }
> -
>  }
>
>  static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>

Regards,

Phil.
