Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp578551wrq;
        Fri, 15 Jun 2018 01:35:38 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLPicHpcXobCUmEk0ntxT0RskKx8oP8oFyrW3q1x4cnxS5o4CMebHija/OqQx7yP1GM7OXb
X-Received: by 2002:a0c:e8cf:: with SMTP id m15-v6mr573751qvo.52.1529051738058;
        Fri, 15 Jun 2018 01:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529051738; cv=none;
        d=google.com; s=arc-20160816;
        b=lqoa+q0+TtbtGCD4ycg7GK44J9BJluYMB5bMzU3J83bjLAuU+L2RfsR/R5D1jtLGKC
         Hp0G/hHIPqtzCnV/EYB0QnHdHE4X8zCS9rGKY7mX3487O1G9xqHWFomb3wtwtUOasitm
         3rWHmnLQGjdulXKMbAFaeuYcFgbEM8FeYlhgpVZgGN/sburWco3Jrs8GzA5pvRKQs0Uv
         TTqFi+Tr/ivuahmuHUHjL0nKMtnSxBm57rc6gvvMCsBTyT+Zt4ORAdLGi9CQamaFiLkE
         bwO0PN9H9hggWD+RoO9ERtvTlQnKRbc4ORaDBsU8tX3G44efwLpdThilvWgTk0puqJzJ
         jKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:references:to:from
         :arc-authentication-results;
        bh=5OEEHyV/k6xyLCueq2ngl6lb00MJBPg8jSl/KRTEc9A=;
        b=QKB+2ZBzmSBWy2Jucw1NZHNf+TarP+X2vRvtF/QJRbw/8ZtDi+hJWhUgwkmMmWYXty
         6pYj+jDa7hWwyhJBr3bpvjIb6R8thQjdV5wX08lsVWbBvaedeYA/sA9Ppck9AZwWc7M/
         WyH43VBWSqMO+KYRjsyuxTT0KzLy/9tsqaJvPdPsUhb1CSIi7uBRkt1erqNUfMarjgj0
         VkfE22a7mKjvgqWFMya1Cc0Gkd0oNnNcgmarTBy059AUAlOFgv7cP99OEZBUtzgcVWnJ
         jlmaLHmwtqMKgItmw392GAzTYNoKURYmTglrNZtZ6IZOUgtTtDov37H0Gm6oqlJTJTAk
         37UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i66-v6si6383587qtb.200.2018.06.15.01.35.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 01:35:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45053 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTkCn-0003I3-Er
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 04:35:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fTkB5-00020r-2E
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 04:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fTkB1-000429-Td
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 04:33:51 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59600 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fTkB1-00040N-OO; Fri, 15 Jun 2018 04:33:47 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E668F406DE3D;
	Fri, 15 Jun 2018 08:33:46 +0000 (UTC)
Received: from [10.36.116.79] (ovpn-116-79.ams2.redhat.com [10.36.116.79])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11D8D63A7D;
	Fri, 15 Jun 2018 08:33:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>
References: <1529045897-25260-1-git-send-email-thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <5ab4dd7b-b717-5e58-41d8-1d996c515a10@redhat.com>
Date: Fri, 15 Jun 2018 10:33:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1529045897-25260-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 08:33:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 08:33:47 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] loader: Check access size when
 calling rom_ptr() to avoid crashes
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sIwpwkN0OYCt

On 15.06.2018 08:58, Thomas Huth wrote:
> The rom_ptr() function allows direct access to the ROM blobs that we
> load during startup. However, there are currently no checks for the
> size of the accesses, so it's currently possible to crash QEMU for
> example with:
> 
> $ echo "Insane in the mainframe" > /tmp/test.txt
> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -append xyz
> Segmentation fault (core dumped)
> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -initrd /tmp/test.txt
> Segmentation fault (core dumped)
> 
> We need a possibility to check the size of the ROM area that we want
> to access, thus let's add a size parameter to the rom_ptr() function
> to avoid these problems.
[...]
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 0ee779f..2375cb2 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -272,7 +272,7 @@ static unsigned long sun4m_load_kernel(const char *kernel_filename,
>          }
>          if (initrd_size > 0) {
>              for (i = 0; i < 64 * TARGET_PAGE_SIZE; i += TARGET_PAGE_SIZE) {
> -                ptr = rom_ptr(KERNEL_LOAD_ADDR + i);
> +                ptr = rom_ptr(KERNEL_LOAD_ADDR + i, 24);
>                  if (ldl_p(ptr) == 0x48647253) { // HdrS

Darn, that should check for ptr != NULL ...

>                      stl_p(ptr + 16, INITRD_LOAD_ADDR);
>                      stl_p(ptr + 20, initrd_size);
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index 1bede85..8b09090 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -186,7 +186,7 @@ static uint64_t sun4u_load_kernel(const char *kernel_filename,
>          }
>          if (*initrd_size > 0) {
>              for (i = 0; i < 64 * TARGET_PAGE_SIZE; i += TARGET_PAGE_SIZE) {
> -                ptr = rom_ptr(*kernel_addr + i);
> +                ptr = rom_ptr(*kernel_addr + i, 32);
>                  if (ldl_p(ptr + 8) == 0x48647253) { /* HdrS */

... dito ...

I'll send a v2.

 Thomas
