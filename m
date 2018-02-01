Received: by 10.28.71.27 with SMTP id u27csp1562873wma;
        Thu, 1 Feb 2018 13:55:12 -0800 (PST)
X-Google-Smtp-Source: AH8x224xIe1tOQlZFtUiPgkZ3n36Pf7Zl1AhYdROTS7eXCrUxlnQoUyxA1Bq2lFi6Eu0YXjbkjz9
X-Received: by 10.13.239.3 with SMTP id y3mr25661743ywe.330.1517522112603;
        Thu, 01 Feb 2018 13:55:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517522112; cv=none;
        d=google.com; s=arc-20160816;
        b=c7SZfi/FWdRMkGNZ51bN5dQoZAKXcz3SQRDWfvXWTZkZ915H0p8X1zRLyJIgJeoMeE
         2PnVowLBeoOrqkIfM/e2OlV4kGS7xG6jo0jLdJthej8kIrXr4FHch8golchtbl2HH67U
         4MrTPtoIBnr3nJwBCzn2uVjHw+138Xe4prtN2tCucwyiCN+8h6jQ8mlPokg7tT5q+wLq
         1ZfMxgQQT18r4gaOpRjoB4i6i4Nu3ieKM/DuqVwt8kdMsWHZY1LO8ravw1SrtqvDuvc2
         bWO81uSRYXsBOwHPWIs9bld5wfYfA4HrjJZR2iuyLMrFQ/nAXiKTQ3QLYLS6wg4SfhOf
         vZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=pS+oBy+CX9eWf3XP6wXCbI3HEacVdKzNFB+W6slNRD8=;
        b=J4xxe9tx6puNa2xNxjV54dykknOIPOAx9OZfWs8o1KpArlVlDLECOTGD4Ry6NRbXmn
         qJxmVwHCz55wSR/mQ2iquw86qWeGqHBou6sff9/k7z2Xwil0TNhoHn3rluIrlvuAHyAk
         90G7Jk0kxXidyRBZmSU76vLsS009baq59QMa+8S/TO57cMkOk7JdYLmVLaqlbMlp6KIy
         37pshB3aU1J+WDT4nncb22I07uRkmZk4BHWGY1XeYWOcphIok8e/h1LpT9kz/ZfbxrGB
         prs3j39srs0Se/tvkWsI1aawz4zOtDtqgut7atEorNw33LKSYwwdSLcLOtdbaiith0i9
         hLvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 201si108214ybd.61.2018.02.01.13.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Feb 2018 13:55:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38075 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ehMp6-0001jO-2r
	for alex.bennee@linaro.org; Thu, 01 Feb 2018 16:55:12 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ehMnw-0007jk-Jh
	for qemu-arm@nongnu.org; Thu, 01 Feb 2018 16:55:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ehMlt-0003on-CW
	for qemu-arm@nongnu.org; Thu, 01 Feb 2018 16:52:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45332)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ehMlt-0003nK-2F; Thu, 01 Feb 2018 16:51:53 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5619E356C1;
	Thu,  1 Feb 2018 21:51:51 +0000 (UTC)
Received: from [10.36.116.52] (ovpn-116-52.ams2.redhat.com [10.36.116.52])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7909760BE3;
	Thu,  1 Feb 2018 21:51:47 +0000 (UTC)
To: Wei Huang <wei@redhat.com>, qemu-devel@nongnu.org
References: <1517506091-10396-1-git-send-email-wei@redhat.com>
	<1517506091-10396-2-git-send-email-wei@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b27de831-936a-39e3-6335-b21cb78d05d6@redhat.com>
Date: Thu, 1 Feb 2018 22:51:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517506091-10396-2-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 01 Feb 2018 21:51:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/4] tests/boot-serial-test: Add
 support for the aarch64 virt machine
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nC/cgZSlSqhu

On 01.02.2018 18:28, Wei Huang wrote:
> This patch adds a small binary kernel to test aarch64 virt machine's
> UART.
> 
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  tests/Makefile.include   | 1 +
>  tests/boot-serial-test.c | 9 +++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index ca82e0c..ebdb151 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -367,6 +367,7 @@ gcov-files-arm-y += hw/timer/arm_mptimer.c
>  check-qtest-arm-y += tests/boot-serial-test$(EXESUF)
>  
>  check-qtest-aarch64-y = tests/numa-test$(EXESUF)
> +check-qtest-aarch64-y += tests/boot-serial-test$(EXESUF)
>  
>  check-qtest-microblazeel-y = $(check-qtest-microblaze-y)
>  
> diff --git a/tests/boot-serial-test.c b/tests/boot-serial-test.c
> index 418c5b9..66f7a84 100644
> --- a/tests/boot-serial-test.c
> +++ b/tests/boot-serial-test.c
> @@ -55,6 +55,13 @@ static const uint8_t bios_raspi2[] = {
>      0x00, 0x10, 0x20, 0x3f,                 /* 0x3f201000 = UART0 base addr */
>  };
>  
> +static const uint8_t kernel_aarch64[] = {
> +    0x81, 0x0a, 0x80, 0x52,                 /* mov     w1, #0x54 */
> +    0x02, 0x20, 0xa1, 0xd2,                 /* mov     x2, #0x9000000 */
> +    0x41, 0x00, 0x00, 0x39,                 /* strb    w1, [x2] */
> +    0xfd, 0xff, 0xff, 0x17,                 /* b       -12 (loop) */
> +};
> +
>  typedef struct testdef {
>      const char *arch;       /* Target architecture */
>      const char *machine;    /* Name of the machine */
> @@ -87,6 +94,8 @@ static testdef_t tests[] = {
>        sizeof(kernel_plml605), kernel_plml605 },
>      { "moxie", "moxiesim", "", "TT", sizeof(bios_moxiesim), 0, bios_moxiesim },
>      { "arm", "raspi2", "", "TT", sizeof(bios_raspi2), 0, bios_raspi2 },
> +    { "aarch64", "virt", "-cpu cortex-a57", "TT", sizeof(kernel_aarch64),
> +      kernel_aarch64 },
>  
>      { NULL }
>  };
> 

Acked-by: Thomas Huth <thuth@redhat.com>
