Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4079557wrt;
        Fri, 19 Oct 2018 09:46:59 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63tKw+h8210SL9oW41vP+kSmeDkDe1HjG7rQbJ0SoJ9f+zBxqU3sKbrF7KaGoE0VBK3UTE5
X-Received: by 2002:a37:9dd5:: with SMTP id g204-v6mr33542179qke.41.1539967619409;
        Fri, 19 Oct 2018 09:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539967619; cv=none;
        d=google.com; s=arc-20160816;
        b=incA/q/6qkENlhk3JBtZFszkYc4lY8UFMynMIQvgabsKFHsg9Cii0x3WVEP9zm++oA
         61H0yH+Jup2+LQUUgdOA4KWIv+rAh6XQVtEI0qRlUXwogA7cQZOhVAJB9WmygwFwsN+r
         /QMDa8gpa7MpQQoDBmYG7COAEnbH75+Wnq4XxbUEDi5Hgu0eGGQaK4oITPUFOQ8FF12X
         GNPsYj9q3qFz2AeyOb2xXJbQcIYs6u0O0YMqtHT9ikOo8k6NlhBjH4PGkGtbCj/iMdJP
         Njg7kUnRih6HmZbMx77id+ClURTS2YLObWdxogbuLWSiZ+kSIufOdDWBhy0l7q+XmAql
         fqYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=ptBZ7KNFtP+0O/fk4DMKkjAPcjWQiZ5FbYEY6C2yVZw=;
        b=X8qWd8S8EXG03+/bN3JfjP4LvILAi4JpKQ3O96adejjYacU7R6I65j+oloMqHoZbpr
         xeFdWt9ODPfQ0OLG2AhkXvKmQClhJWuYOPh0EuNYuMSK5r2F9UnlIfMEHbe8Ij7z6Nmu
         vZurd9jAwTGQ397bXB4mfVh6x7e6Kx9xWj8PD+k5+6W+i3eoNeIHsEDgeYxtMPIsZZv6
         bXRhWHTS/QpE+9YsCq/QVDw/uvHyf8LChI6jXlMyhnxVa0kFbQCoaRz5E3JqwlDrb0nZ
         e7GeL7I4y0MROcjkuv5bALSEK0WS9JcwVUOQu4kBzhJ0idSclcUOraASx7v4xYSazBwi
         XZPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y27-v6si999217qtk.149.2018.10.19.09.46.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 09:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDXvO-0000oS-Qz
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 12:46:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gDXkT-00068Q-S3
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 12:35:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gDXkQ-0001Db-Ff
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 12:35:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42911)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gDXkQ-00019H-64
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 12:35:38 -0400
Received: by mail-wr1-f68.google.com with SMTP id r17-v6so5730391wrt.9
	for <qemu-arm@nongnu.org>; Fri, 19 Oct 2018 09:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ptBZ7KNFtP+0O/fk4DMKkjAPcjWQiZ5FbYEY6C2yVZw=;
	b=hWi23+6N10yvR6J4A2O1tL/lPFgsgqUV/OMdCbcdUwopgnZy3VgxC0DfiiufYn1VWY
	SPuMdaIFd2nVh3Y9FNiH+5wR2W8d4EEHhSPawHGmtX3NCt04OOMTs6hqTFcGuMscIj0y
	Lb2ajM2oiQ7D7TF7MRYQxJv8hdUWXuwJFqT6wq9Og14Ikf7OJMcPBtbiswqaGCP/dz2B
	pkJYxNgQL/xBM/+eDVAcKuqllA6Eu+0gITD2zTccf5+4tyYmgqFIOWg2cPl4uxfXmQWm
	xhSN+NCKdx9yIs/9iYnHFyKLXuhD/HxtcD3TOePyZGD97lrYfrQDTHYR4qnPDvVY/CiQ
	nm2Q==
X-Gm-Message-State: ABuFfogNtAk5k37dOnPMwEXAJrK2GQR/FkiUwkfScYktoPmu22aw/FkX
	H4EkgcA1qTYvaDSIxkfWPyCRrg==
X-Received: by 2002:adf:f88d:: with SMTP id
	u13-v6mr33075051wrp.311.1539966936724; 
	Fri, 19 Oct 2018 09:35:36 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.29.77])
	by smtp.gmail.com with ESMTPSA id
	w4-v6sm25264025wra.83.2018.10.19.09.35.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Oct 2018 09:35:35 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
	<1539954845-26716-6-git-send-email-thuth@redhat.com>
	<CAFEAcA_NkdZtbM9n4633_hSr38eb9FJsi92=+Eeuky+U=eDtZA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6ea8c64f-272f-6645-8a2f-b94117a24027@redhat.com>
Date: Fri, 19 Oct 2018 18:35:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_NkdZtbM9n4633_hSr38eb9FJsi92=+Eeuky+U=eDtZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/5] configs: Add a
 CONFIG_SMC37C669 switch for the "smc37c669-superio" device
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PwOxJqJkYKXA

On 19/10/2018 16:46, Peter Maydell wrote:
> On 19 October 2018 at 14:14, Thomas Huth <thuth@redhat.com> wrote:
>> This device is not user-creatable and currently only used for the
>> "alpha" target. So if the user does not want to compile alpha-softmmu,
>> we should also not compile this device. Add a proper config switch to
>> be able to compile this more flexibly.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  default-configs/alpha-softmmu.mak | 1 +
>>  hw/isa/Makefile.objs              | 3 ++-
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/default-configs/alpha-softmmu.mak b/default-configs/alpha-softmmu.mak
>> index bbe361f..eb58b40 100644
>> --- a/default-configs/alpha-softmmu.mak
>> +++ b/default-configs/alpha-softmmu.mak
>> @@ -19,3 +19,4 @@ CONFIG_IDE_CMD646=y
>>  CONFIG_I8259=y
>>  CONFIG_MC146818RTC=y
>>  CONFIG_ISA_TESTDEV=y
>> +CONFIG_SMC37C669=y
>> diff --git a/hw/isa/Makefile.objs b/hw/isa/Makefile.objs
>> index 83e06f6..9e106df 100644
>> --- a/hw/isa/Makefile.objs
>> +++ b/hw/isa/Makefile.objs
>> @@ -1,9 +1,10 @@
>>  common-obj-$(CONFIG_ISA_BUS) += isa-bus.o
>> -common-obj-$(CONFIG_ISA_BUS) += isa-superio.o smc37c669-superio.o
>> +common-obj-$(CONFIG_ISA_BUS) += isa-superio.o
>>  common-obj-$(CONFIG_APM) += apm.o
>>  common-obj-$(CONFIG_I82378) += i82378.o
>>  common-obj-$(CONFIG_PC87312) += pc87312.o
>>  common-obj-$(CONFIG_PIIX4) += piix4.o
>>  common-obj-$(CONFIG_VT82C686) += vt82c686.o
>> +common-obj-$(CONFIG_SMC37C669) += smc37c669-superio.o
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Should isa-superio.o also go in its own config flag?

It could be, but pc87312/smc37c669/vt82c686 inherit of TYPE_ISA_SUPERIO
so would require something like:

common-obj-$(call land,$(CONFIG_ISA_SUPERIO),$(CONFIG_PC87312)) \
            += pc87312.o
common-obj-$(call land,$(CONFIG_ISA_SUPERIO),$(CONFIG_VT82C686)) \
            += vt82c686.o
common-obj-$(call land,$(CONFIG_ISA_SUPERIO),$(CONFIG_SMC37C669)) \
            += smc37c669-superio.o

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> thanks
> -- PMM
> 
