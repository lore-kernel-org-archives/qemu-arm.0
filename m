Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1855989wrq;
        Thu, 21 Jun 2018 04:14:42 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKQbKiksBoCuFXiF7SCDfi084XA4EDvm79PKnYfe8zpLigyuebYtV6/KPyCrtrytBQ7udz4
X-Received: by 2002:ac8:fd9:: with SMTP id f25-v6mr22764510qtk.181.1529579682123;
        Thu, 21 Jun 2018 04:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529579682; cv=none;
        d=google.com; s=arc-20160816;
        b=v5CYt8yqcHaHXX7BlBv5FeXVEJeyJHI9GIRCdgjZFy8b4v9P+fI6057sxawbSHVPns
         r053I+vZVoYazDRY1Rt62N1gAgPwuBFjkl4tP0z7olMH/zOa6w5cEtXeubwDH6+Q6tbw
         GxusX3vywCciIuK/0aJc/q2D3T+fy+voK+DQ/3hnHVAO150jMWOI5N7cyf1Qabprn9Lo
         xRrqykkw2d1TrQpUWTi4PKemkd3NH1reG8WckCfoFZWxOHRvV/65ziof7tQ0ceAdL77S
         9BQFg3IQlmuyLuCu/NYpHcDbS04RJgpNvRYBVxq9qREjT9DTZ2PgGUxfSW82WkvZAhsF
         otlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=hwZXP7FTCsEuf87a4kLZZ5hnUfJ+tDWDqv+VsKv1iNw=;
        b=KsoyvxuQ091fVROzBhw8sWQ3gLPreXwEnNtfv+CuE0Be7e+u7+K2tYMVIos4oB/TVc
         x5+A8N/Ed56NrCJF2uA1YQzY07RYI077UX14gowMGYBm/xZEF81ZRfgxYntEbiFfboi2
         BUgqDHIeXArZtVneMdB4pywq+B7nOkctvHH7RYk/mc+h/rpDcSW3apVGUHmLFzwgBBpm
         cC+rmVVgaiA9pIqV9xUEJFhVH3GuTbsRraEOoKHrveb4z+eF//YkAewlTQr3ImBMU7Nc
         dNZ/jqgvCOuGR2QBk+I2lqBz54euR5lVhEpHWF20/vGETHT1QXJl6ymnhpipCFyCjY3D
         VYZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="u3hTw/4U";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v12-v6si4901316qvb.1.2018.06.21.04.14.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 04:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="u3hTw/4U";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54504 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVxY1-0001tP-BT
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 07:14:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fVxXZ-0001rm-9F
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 07:14:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fVxXU-0001lk-96
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 07:14:13 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35208)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fVxXU-0001ld-4T; Thu, 21 Jun 2018 07:14:08 -0400
Received: by mail-qt0-x242.google.com with SMTP id z6-v6so2429412qti.2;
	Thu, 21 Jun 2018 04:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hwZXP7FTCsEuf87a4kLZZ5hnUfJ+tDWDqv+VsKv1iNw=;
	b=u3hTw/4UcDYzyihFh293w7qC8QeRhXmeJvzYSKVARGEMJzdzv/wWAt0WIO8KIkUeoR
	U1VE49Bapbsn4V8uoZxbHxC0/4UH5qFpfbMFHue+zC9wxn2obKH4pKU05Sc0hj9gHuCj
	EFbBtQpq1Pv5YRaaUaesF36WLoA/Erpo3Lwbk3JLMqO71dpYQlDWOF7LAXwW+oCpCkFv
	sfr8OZvf3Ud9+Y1KSCAx93SDjT9N1o+qHygMww9de+GTZTUcRxfnqhx3GHZx8sUSciqp
	E5yF099n4rdqyevLCGoBKWLgKtQLW3/x30kOaBDkaMYJr6kA6UEwMVDNFV/uE9Ab/0VZ
	+xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=hwZXP7FTCsEuf87a4kLZZ5hnUfJ+tDWDqv+VsKv1iNw=;
	b=dglHWk4ZUQ25CCYDPEFXVLiyqSfrv23SroTPMte4xKwv6BVK36GRk1MENHVo0YHQEi
	nppYq9AGztotTAtzpHAl/t1a9bTmaYciReNHLUYXIv4Zu652VxZLuzLWHKYiHRQEfR+S
	VPIHOe5175rvalNdXQbbwc3qAhQbIhtf0pjLMYs6YkZUnOdGi7MSzjOMZQPivqRGrFIO
	iTQ0cu5wOcZTFLoO2VfPFpizvRmspqpPMKKomPs++Q2oFXf1OE+1KGDZelT0EWyenI/g
	FV+Rgj6NzAbYlznloRIhfJ5APDH8rG2K6IYXZST6UzAhGp7ExOPzoVNRqNF5Yq4d3YpK
	8K8A==
X-Gm-Message-State: APt69E2W+0HNOgL4WILhyvs1y2jqZVHDhxERoOQ56PmiUG/stsVQcrXk
	VUup98jTevW9Qhylca1olFI1wZTV
X-Received: by 2002:aed:234a:: with SMTP id
	i10-v6mr22743240qtc.263.1529579647481; 
	Thu, 21 Jun 2018 04:14:07 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	l66-v6sm3011049qke.69.2018.06.21.04.14.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 04:14:06 -0700 (PDT)
To: Markus Armbruster <armbru@redhat.com>
References: <20180607144645.10187-1-f4bug@amsat.org>
	<20180607144645.10187-4-f4bug@amsat.org>
	<877en9bxoc.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <8b533a03-0adf-a15c-a6e8-6e7641a9e3ac@amsat.org>
Date: Thu, 21 Jun 2018 08:14:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <877en9bxoc.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-devel] [PATCH v2 3/4] hw/arm/sysbus-fdt: Replace
 error_setg(&error_fatal) by error_report() + exit()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TbsU+sMj8yCC

Hi Markus,

On 06/08/2018 03:27 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Use error_report() + exit() instead of error_setg(&error_fatal),
>> as suggested by the "qapi/error.h" documentation:
>>
>>    Please don't error_setg(&error_fatal, ...), use error_report() and
>>    exit(), because that's more obvious.
>>
>> This fixes CID 1352173:
>>     "Passing null pointer dt_name to qemu_fdt_node_path, which dereferences it."
>>
>> And this also fixes:
>>
>>     hw/arm/sysbus-fdt.c:322:9: warning: Array access (from variable 'node_path') results in a null pointer dereference
>>         if (node_path[1]) {
>>             ^~~~~~~~~~~~
>>
>> Fixes: Coverity CID 1352173 (Dereference after null check)
> 
> You lost
> 
>   Suggested-by: Eric Blake <eblake@redhat.com>
> 
> Intentional?

Not at all :/

> 
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/arm/sysbus-fdt.c | 42 +++++++++++++++++++++++-------------------
>>  1 file changed, 23 insertions(+), 19 deletions(-)
>>
>> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
>> index e4c492ea44..8e2784fa11 100644
>> --- a/hw/arm/sysbus-fdt.c
>> +++ b/hw/arm/sysbus-fdt.c
>> @@ -91,7 +91,7 @@ static void copy_properties_from_host(HostProperty *props, int nb_props,
>>          r = qemu_fdt_getprop(host_fdt, node_path,
>>                               props[i].name,
>>                               &prop_len,
>> -                             props[i].optional ? &err : &error_fatal);
>> +                             &err);
>>          if (r) {
>>              qemu_fdt_setprop(guest_fdt, nodename,
>>                               props[i].name, r, prop_len);
>> @@ -102,6 +102,7 @@ static void copy_properties_from_host(HostProperty *props, int nb_props,
>>              } else {
>>                  error_free(err);
>>              }
>> +            assert(props[i].optional); /* mandatory property not found */
>>          }
>>      }
>>  }
> 
> This is not the conversion the commit message promised: it replaces
> exit(1) by abort().  Why?

I can't understand it either, I suppose I cherry-picked from an
incorrect branch, because I also added your R-b locally.

I'll resend.

Thanks,

Phil.
