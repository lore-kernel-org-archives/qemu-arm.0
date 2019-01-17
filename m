Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1940939wrt;
        Thu, 17 Jan 2019 07:17:27 -0800 (PST)
X-Google-Smtp-Source: ALg8bN45bP9Lk8n/OPHRZ57flnPOFhED9xVPaypwE09ffR5fg2Jy9SGjC4opdkhFPjI1m/otkOgQ
X-Received: by 2002:a5d:570c:: with SMTP id a12mr3588339wrv.161.1547738246995;
        Thu, 17 Jan 2019 07:17:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547738246; cv=none;
        d=google.com; s=arc-20160816;
        b=crgwCB3V26tK2E3MTX1WUWPGm2e7WeXc61fYZFWo9zipZLsgWpoGq1x7Sw8+Wj8sC7
         T01pV2auqr4WZsbvAQit4xgwjf/5vouHhP1VEcasP5I2uE0W1lN7n4xzsbr4u6/O9yar
         iC3JVKZX0f7m74kUTIQRlQTLpxieMDiOarhTGzabqUAXfmYVqNePZ5UFBG07Cy6yHC70
         7p1mdK/sCaf41nVWOCTeWvtbUnzFrPgYuBVkXx1OGm+LDEo/jXUlsET7KGDcseoEE6Dq
         epMagMuMG+WVakzOelj203RA7bdLJfiuRSqBiACJK94Y/etVXu36Pn5dGx9PfNuPO4tq
         v4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=NcmKGwSx4kzmchecqePYrlZgLHKDTQF6e7oMLRdTaA0=;
        b=0magx6S8gUAvlYgybvKcwCIfo2o5Dizqpb+8Bc+1DlMYL3W87iRwK0/Net3LNNe98S
         ZCFzr0TusjO58dKsDTaL9mD10jwii0dPOb1I7ZNKhZ69UG0iTz1XKF6MnTgClpfDeMIm
         J/ln0m916PazP4S3LF2MGkPxTYM9zlV5DxYUwlgmTdjWHIpywR4Z4oD+UGyEJH+UZlXb
         j7PKInd5CBSuHtGENzaPpOUsAlxj8aS2pcFkT/UYpzqDNaFjJdMiSJjJnxBalrB5xKau
         O3xP8aMhAnje6wbtEcSVsG4R4vxZfuq0fcajC56CBxDclQMV728HaEbtxn3pecBU+imt
         rLJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si59557611wrj.423.2019.01.17.07.17.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Jan 2019 07:17:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46488 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gk9Q4-0003CK-43
	for alex.bennee@linaro.org; Thu, 17 Jan 2019 10:17:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gk9Pv-0003Bc-3e
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 10:17:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gk9Ps-0005SU-60
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 10:17:15 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50374)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gk9Pq-00050q-UR
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 10:17:11 -0500
Received: by mail-wm1-f66.google.com with SMTP id n190so1466901wmd.0
	for <qemu-arm@nongnu.org>; Thu, 17 Jan 2019 07:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NcmKGwSx4kzmchecqePYrlZgLHKDTQF6e7oMLRdTaA0=;
	b=Hq22/67edPgXOuU8cdi/DuqZQxrgwpO60wQvX3yflJi9oZIIGiwyGX+XuMceTi8VID
	JXri6fXTbOQdQWnvja/5dGD4vNfP+kBLULEuhn9Z8MzfVqz5MHwq5yHZ2HO+gdKNZFjW
	5/JvjLMBUXIWsxUcIafqZpfOF+SNOuO1ZXqD1RTGtXk7ZlRw8wjkNW5YUDkDbrAdAuU0
	4mX02r7zz3E+MRvv1j5AnS1dlA99Wa0cKZ7P0+Mf9onXcJARUJ2Wb+JRIrw7ez8Gtz4e
	MzJ0j2yUthiA5O+KY5TorQ7YteQEPhAyi1N3ZjDsOaSC+QJrCmifpC6dGgllpg64By+g
	vsdQ==
X-Gm-Message-State: AJcUukce54QM6RAlpQEZFD+VRLDKAf4jpJ7lcPLSDYDfgN2079pSMNAS
	3n+xOAMKUFFlpu9DCo0Ccqazrw==
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr12824687wmj.105.1547738227444; 
	Thu, 17 Jan 2019 07:17:07 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	g9sm37659992wmg.44.2019.01.17.07.17.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 07:17:06 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190117133834.7480-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <530d35a3-3efd-efcc-3ec2-a113b540b392@redhat.com>
Date: Thu, 17 Jan 2019 16:17:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190117133834.7480-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] exec.c: Use correct attrs in
 cpu_memory_rw_debug()
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
X-TUID: j5yVUwQUEAuR

On 1/17/19 2:38 PM, Peter Maydell wrote:
> In the softmmu version of cpu_memory_rw_debug(), we ask the
> CPU for the attributes to use for the virtual memory access,
> and we correctly use those to identify the address space
> index. However, we were not passing them in to the
> address_space_write_rom() and address_space_rw() functions.
> 
> The effect of this was that a memory access from the gdbstub
> to a device which had behaviour that was sensitive to the
> memory attributes (such as some ARMv8M NVIC registers) was
> incorrectly always performed as if non-secure, rather than
> using the right security state for the CPU's current state.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1812091
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  exec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index 6e875f0640a..2f0f40b0be6 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -3881,12 +3881,10 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
>          phys_addr += (addr & ~TARGET_PAGE_MASK);
>          if (is_write) {
>              address_space_write_rom(cpu->cpu_ases[asidx].as, phys_addr,
> -                                    MEMTXATTRS_UNSPECIFIED,
> -                                    buf, l);
> +                                    attrs, buf, l);
>          } else {
>              address_space_rw(cpu->cpu_ases[asidx].as, phys_addr,
> -                             MEMTXATTRS_UNSPECIFIED,
> -                             buf, l, 0);
> +                             attrs, buf, l, 0);
>          }
>          len -= l;
>          buf += l;
> 
