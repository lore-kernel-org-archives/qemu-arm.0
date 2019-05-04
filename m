Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp134056wrh;
        Fri, 3 May 2019 22:23:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxdRSBiZcKcBjnsiRFT5GRI5xhSFi4IV8k223EI/sZnHsczi/6yK0jlAAHpsU+DQDFM419
X-Received: by 2002:adf:e907:: with SMTP id f7mr3375609wrm.125.1556947403607;
        Fri, 03 May 2019 22:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556947403; cv=none;
        d=google.com; s=arc-20160816;
        b=eNmEqIlEgA//5BC2IBtvkgF2N0L0iPBMp/4MLPQMoqnButPa+IYtzkcH2eoUrkmZ7l
         lYcuqf5d6jk/6yWXGK1J0K8QlDjAeKp+a9OlzvngAJdkoIHwCMWJmo8xkJlVnOETtCV5
         Ph2sUutaT7Qvke0FnCl1MlMp3ZPAtMRPPjiOxFSOUeBmi9i818B6Vk8ivbpC+VMqH/20
         3kWo9XtHnwOWmgXXInEkSbNU7HvkDzpUNvLUx7esx72YnYiUCZzBvpWfizI+M58el1wV
         jVQrMxrKWud8gmT6Xw7y4HesxzfUTzYc0wylODKFfv0qlVPSs1NMBArVRXAAs2eCQRqI
         O4vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=9eOLzGN7pzprpvTtMLEiO2UWRP7rG9AwJo7pYclFFg4=;
        b=0jIyuTUJCxTGbeHMl7g23PBPL0XksQeDk5FPFNHg8gubjJTiepG0i9K4UaZc2aPIox
         v/YirpEMx7DerFpHTiu8Iqooyk7vNH+fhMbJtk4nRJE+y3FA9jyuvV5iwLQfHD6c1Tr6
         /IACnZ1NygPzQq/clDwQCXQlnX38d8rk9iOiwMRoSAsNLVuTglaRxmywuwIrKQg8DD//
         LEHnKxsdDQlRWaynXOvHhtk1mLlXG1N5X3ouFKZjdV32ypJeWiEWewk91NFCnKopEOKC
         9oZCIOOhN2zcper5MKfRlE88lKKo/3jPJf+F7Ke+OJlsXuzg20TTrOHV8V/Wuhk5sC7Y
         j3zg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 98si3109133wrk.138.2019.05.03.22.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 22:23:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMn8r-0000EI-Rt
	for alex.bennee@linaro.org; Sat, 04 May 2019 01:23:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMn8i-0000E7-9r
	for qemu-arm@nongnu.org; Sat, 04 May 2019 01:23:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMn8e-0003Bs-EG
	for qemu-arm@nongnu.org; Sat, 04 May 2019 01:23:10 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40830)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hMn8d-0003AP-JM
	for qemu-arm@nongnu.org; Sat, 04 May 2019 01:23:08 -0400
Received: by mail-wr1-f68.google.com with SMTP id h4so10290586wre.7
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 22:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9eOLzGN7pzprpvTtMLEiO2UWRP7rG9AwJo7pYclFFg4=;
	b=MjrY9H7oN9VYol3xLHqaaqojw0qoQVPUJFA/WRk1hkh78FEZsEBQJT/gWzdizjpHe0
	VhEtzI9JE7nH/X/KATvC7feboiORMYlNtGWjIQoqTSajrsZYZXoBrRJ0WnLvn+sY3Wye
	dokGG+rj5LjgzudnMEy02HSCWJIyM7Gk2MSODRpA9wFYrcchtkjphaoc3bhvt7OeDXHe
	IpfNu0HZLO5tkLr2VVRqTDQnosi+QA7sl+KTCBhddHZx3b3yM0gVVbC/fq5lsvy2m8hu
	3eGPIr8xgVzgFIc2bT3utVY1takBjZwLl8Q4QFO2yOwC7Golhgvk+m4+pXUBov8YBkhu
	YnPw==
X-Gm-Message-State: APjAAAU1qE7EFooybybdKlBaiE8jgm86V95+5lQH3WJmhU+Hk8Jp9gLL
	H5e+IjlDFTvkPg4tJroyVaEPKQ==
X-Received: by 2002:adf:fb11:: with SMTP id c17mr9589784wrr.237.1556947383703; 
	Fri, 03 May 2019 22:23:03 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	t27sm10521943wrb.27.2019.05.03.22.23.02
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 22:23:02 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190503120448.13385-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <40488c65-1aae-60c7-4d62-52e754f8f026@redhat.com>
Date: Sat, 4 May 2019 07:23:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503120448.13385-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] target/arm: Stop using
 variable length array in dc_zva
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nc6eyemwveFT

On 5/3/19 2:04 PM, Peter Maydell wrote:
> Currently the dc_zva helper function uses a variable length
> array. In fact we know (as the comment above remarks) that
> the length of this array is bounded because the architecture
> limits the block size and QEMU limits the target page size.
> Use a fixed array size and assert that we don't run off it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2:
>  * use ARRAY_SIZE() instead of sizeof()

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  * add a comment to make it a bit clearer that the
>    expected size of hostaddr[] is only 2 entries
> ---
>  target/arm/helper.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 81a92ab4911..10444d12b18 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1,4 +1,5 @@
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "target/arm/idau.h"
>  #include "trace.h"
>  #include "cpu.h"
> @@ -13099,14 +13100,17 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
>           * We know that in fact for any v8 CPU the page size is at least 4K
>           * and the block size must be 2K or less, but TARGET_PAGE_SIZE is only
>           * 1K as an artefact of legacy v5 subpage support being present in the
> -         * same QEMU executable.
> +         * same QEMU executable. So in practice the hostaddr[] array has
> +         * two entries, given the current setting of TARGET_PAGE_BITS_MIN.
>           */
>          int maxidx = DIV_ROUND_UP(blocklen, TARGET_PAGE_SIZE);
> -        void *hostaddr[maxidx];
> +        void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 << TARGET_PAGE_BITS_MIN)];
>          int try, i;
>          unsigned mmu_idx = cpu_mmu_index(env, false);
>          TCGMemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
>  
> +        assert(maxidx <= ARRAY_SIZE(hostaddr));
> +
>          for (try = 0; try < 2; try++) {
>  
>              for (i = 0; i < maxidx; i++) {
> 
