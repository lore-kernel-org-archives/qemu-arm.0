Received: by 10.28.173.206 with SMTP id w197csp2397291wme;
        Mon, 8 Jan 2018 04:12:03 -0800 (PST)
X-Google-Smtp-Source: ACJfBouHHfYc2fDZhSBu7kklDxYttF5+HeYkm7lEjjIGhQwaE+lL+ke58nNwx/6vnSAli3kk+KIZ
X-Received: by 10.37.199.146 with SMTP id w140mr960303ybe.193.1515413523522;
        Mon, 08 Jan 2018 04:12:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515413523; cv=none;
        d=google.com; s=arc-20160816;
        b=cRI3FDS907I6hZx4s7oH7016plHx0bU/x+VmnP3RcAEviYDqbKiAt2z7JS4c/MZL4e
         56hxIt2jFWNY0PsjpEZ1L8SyxttKmy1QE/Vdkm/yNy6a0+j/u2iOlWSx/MZBkoNcMpYJ
         P/dEnvSpBRTj3UeUloq0weAZxWVzdlnnMYddwkIxkLSQqB4E9YIoK+2mNTraXsKZJdOM
         WhsC4sfh77Sd9LMEpyaN4oLfY5sfg/8gZNR+6+mhNtEX2vN0qov5JcYCW/xfJupgGpld
         +EXhKV/ZuG713IALEJ4ue7bJG9h7thEUWlr7qImIYc6S4LjrBUbCSXqsUq0XXMYKF+DD
         kqGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=JK4YDXAuuS1MqZquMXtAGaFypjb02yRFO/c1GwiSguk=;
        b=VTjj/T0dIyi9uy/xEtSv6Q0dHDaBruKXpLaS75A2rrcdTqb1md2gkr49gEtIk+Tnx2
         TAB0jWw8Ueu7OmrXR8dQ4bwLuNn/MvHzg/0nJr041ZF4IfSMZBApG4n3bwmKe1klqSaf
         1BxTBpoexfi4UwhPjxuhHUYpZ8VoqxPjbOAaholq87RETN+Gc+xCWSHxwV1uy514spe9
         NVAEW+XDeVp01/UuG7e3ABJkdfzp90DQbaQfzAGYW03B7C4HaTeKmO+/M4xuB7zQurBO
         N/CqcYcUhdlnuPMd7yXoCax/jqwyzQzl8BRcYRitN/gWqfEL2qj6AaF9BxaO9N8zbncS
         6pRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YpA2hi0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c13si2469739ybm.763.2018.01.08.04.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 04:12:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YpA2hi0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYWHb-0002yN-0l
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 07:12:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYWHU-0002xn-HR
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 07:11:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYWHT-0007Qo-CW
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 07:11:56 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:44106)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYWHT-0007QM-7w
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 07:11:55 -0500
Received: by mail-ot0-x243.google.com with SMTP id g59so9042631otg.11
	for <qemu-arm@nongnu.org>; Mon, 08 Jan 2018 04:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JK4YDXAuuS1MqZquMXtAGaFypjb02yRFO/c1GwiSguk=;
	b=YpA2hi0DetKE9JnonXd9w2XqeCcrAMu6OQ9YYLptZErgx5z2KFsZ8ld2+56r/Q3Xlg
	J5YkLNj0oNAUSEZTOwZEMn3BoJrcYt6z/BdJ7llzesIwDZgXLaTRAexyxJnw3B+w2Ty+
	6Ri9mlYkDrbYWLaRg+wyQb028QomIOa586BQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JK4YDXAuuS1MqZquMXtAGaFypjb02yRFO/c1GwiSguk=;
	b=rlgbDKP/kJMxAag1OJDAiTxH9Z6pd7FdqaRPQ3S0AaoFhVI3P9fWpxLUg/AYRdRAEx
	SRdNoGUaK2wJhyw4usWSGjY89BKQC4fxkBP5s7YvgFSKYYjNn8Wec0eZPOOebvQgMX67
	wsHa2YZCh7mWv0cdTYahG9HgRvKE4hV/FW/ibSrplEwkFqbNN/8J6uC3yqFMTy8Pzeo8
	gvSBFfYTVvaz5FjzBW2C2vUHpUCUbGsA6TGGgIXxJTKQdpz7BGrx1LMBc4QN8OdYccuM
	R5BhAHqNM45Za4WkCjlJYhK0ujo3NXIohjaL0saPmpxtJpNpXDgvahsfze84yLyMQjIQ
	HgyQ==
X-Gm-Message-State: AKwxytd+fy+DGTz7RknoY7nU8J+W11LS8HWbuJVqR/IN908VPCMQ2aVK
	3peHXJrc5/6GY7Zm8pF2ey3PZnDFSNH58ua37mQozg==
X-Received: by 10.157.5.196 with SMTP id 62mr6431990otd.110.1515413514623;
	Mon, 08 Jan 2018 04:11:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 8 Jan 2018 04:11:34 -0800 (PST)
In-Reply-To: <20171228082006.xvmw6y4oxkcadenv@hawk.localdomain>
References: <1514423680-11132-1-git-send-email-zhaoshenglong@huawei.com>
	<20171228082006.xvmw6y4oxkcadenv@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jan 2018 12:11:34 +0000
Message-ID: <CAFEAcA918ynH_zcQ21oRNfrRkbS_OJTbS3u-mCP22cMrr_uwBw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v3] Virt: ACPI: fix qemu assert due to
 re-assigned table data address
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Laszlo Ersek <lersek@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BIhWK8x9vOln

On 28 December 2017 at 08:20, Andrew Jones <drjones@redhat.com> wrote:
> On Thu, Dec 28, 2017 at 09:14:40AM +0800, Shannon Zhao wrote:
>> From: Zhaoshenglong <zhaoshenglong@huawei.com>
>>
>> acpi_data_push uses g_array_set_size to resize the memory size. If there
>> is no enough contiguous memory, the address will be changed. If we use
>> the old value, it will assert.
>> qemu-kvm: hw/acpi/bios-linker-loader.c:214: bios_linker_loader_add_checksum:
>> Assertion `start_offset < file->blob->len' failed.`
>>
>> This issue only happens in building SRAT table now but here we unify the
>> pattern for other tables as well to avoid possible issues in the future.
>>
>> Signed-off-by: Zhaoshenglong <zhaoshenglong@huawei.com>
>> ---
>> v3: unify the pattern for MCFG
>> v2: update the commit message according to Andrew's comments
>> ---
>>  hw/arm/virt-acpi-build.c | 18 +++++++++++-------
>>  1 file changed, 11 insertions(+), 7 deletions(-)
>>
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks; applied to target-arm.next.

-- PMM
