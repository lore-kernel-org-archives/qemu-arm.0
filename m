Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3989531wrq;
        Mon, 25 Jun 2018 09:15:01 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKU4PRTuxWLGVATzGEJ0yz++/XKx79Weh7eBFoXx3YGddDpEI3HhTr9fnxhoHcUjkBY5EJU
X-Received: by 2002:aed:2c63:: with SMTP id f90-v6mr9505414qtd.352.1529943301047;
        Mon, 25 Jun 2018 09:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529943301; cv=none;
        d=google.com; s=arc-20160816;
        b=fwNgP6taNkQxiCuTFa4p9o0DkQxY91zyJm5O12EygANPSEKR7yLssBa4PCvH/GG+eo
         eRD7AfqtJO4cjCIhJ62PkudaEbC7pL4KgEp7Q3vayuY8hlBhFOSmt98po8XHFlRYTJ6r
         rwqtPqUkaKoKRB7QY/lmW282o1hrV/gbR+ne2u4FuNEZInn6AvALv+oAVOgKbZdbKk4j
         5pmnrwstRU591oXin8xQaI/89JpeqknrOv2aUpkh1umbmJ4xc16dQQhkYD3rexXT7Sa1
         w5nYane2RyGdg9Id+L5NFXIMxA9Vcj76kAOk9Y2liUtMLm+rIxLuOir7keZ1qlsXtQkp
         hIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=XZ6qSI6E6/PWndehIpYluqNdk6s7vYnz3RE+sa4aC/w=;
        b=GattUc3L2Ad/uMUVfZHa4hRwC3l+BwHRlfO/3/S6gGfsopFDx2G8IWK0/FpL9SlrpA
         HhP2Gm0KPEkyeUzSo2QO8BIJUU5fVVbN+gLJNW+8Z9IgmekYWE9SPocbGLEWQkj/Avxm
         hLmZ/GYoH1MdsibPdobaTGXWEuLnnPl7R6+P0mbyk4bc9bYkMtbChYxcmNp8rA2bmtwc
         ebd32UEGa4584ENpkRoRj76LUcDofHv0ZqQC3TqVUtOcGY75c6kzs01ZL1D6nlT9aW1q
         0ufnBfADrwmN0V2WTPH8RtbM0ZvkEijTw8Ng7U8UP7R9a/5dyx6zJEbKo46J290rDLxi
         XNeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hbr99Z1S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e199-v6si2748693qka.150.2018.06.25.09.15.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 09:15:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hbr99Z1S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48120 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXU8q-00007K-35
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 12:15:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXU5W-0005ls-Ss
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 12:11:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXU5T-0002gY-Fr
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 12:11:34 -0400
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:46546)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXU5T-0002fF-7Q; Mon, 25 Jun 2018 12:11:31 -0400
Received: by mail-qt0-x235.google.com with SMTP id h5-v6so12397227qtm.13;
	Mon, 25 Jun 2018 09:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XZ6qSI6E6/PWndehIpYluqNdk6s7vYnz3RE+sa4aC/w=;
	b=hbr99Z1S+I7g2Rey6JS9RjpNXeyLFytpejkC5Qe0tZDtmbnCzRr94QYIVlKlTH6+1D
	KGiQl2teLqvjC7Sr96T6/9aKBBUfuJ8rl7gLSEcIZXZTQZ8FhR8bZUSVAYXtBu37ZqpO
	0u9Yn59gTmLe17isUPyUsVWRln4+xhW1ijIJSa137plbBlXP2cztbjyFg6itZ72mWr6e
	Bj+9EB570jP+ktNVbEqejURIPj7rxCuVDMr7WlHP16wsk9HU2Zv2THUFXklGgA9ImgCZ
	SfHO3mI6nkq7jhkAudIwChrHTzTjf9wliXNMv/0RJnGZ9tq5ck9wm0FsqBpKlgosYRrv
	3mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=XZ6qSI6E6/PWndehIpYluqNdk6s7vYnz3RE+sa4aC/w=;
	b=CjqTDFcbuaIe74BgYCBaYDLNODgutouYj2MAmk86cnSAP1nPTwS0XY1hGcap//x+Xk
	4Sr0/sOff+hDuiIU1iVn+fUxhlZaumls8CNtnbpMVp7wll3KLGnTzo/I6MplSLrV54rD
	kBXPnJevVK83BcMr08Q681/iVNTUdyE0mEOCtNT1vIggOjmA1240qAjq27Vv3PT9Q6jA
	OfqynNnizHlChacsURtqurbtEuJtcSeSH2khu8niLb01hGDar4ihspvOQ6GXNx23y/7a
	6SyG6MYdfqWOBSnJeter2SEyifC616felzWxV6vJG6aASuEblqbIVN5i7IKCS0S5EjvW
	EQpw==
X-Gm-Message-State: APt69E3SGIpns9avBuMW4lscwVoom/K/J7pwTYdlbD2wVuvQ1FI3wzE/
	FLj5HNHgJWs8DARJTEf74ULsEe+isUI=
X-Received: by 2002:ac8:5191:: with SMTP id
	c17-v6mr11716074qtn.35.1529943089969; 
	Mon, 25 Jun 2018 09:11:29 -0700 (PDT)
Received: from [192.168.1.124] ([190.177.167.108])
	by smtp.gmail.com with ESMTPSA id
	s128-v6sm9678326qkh.2.2018.06.25.09.11.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 09:11:29 -0700 (PDT)
To: Auger Eric <eric.auger@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20180621114015.9207-1-f4bug@amsat.org>
	<20180621114015.9207-3-f4bug@amsat.org>
	<988a6d50-a911-6ac0-2955-0f99292d8a15@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <c1e03b95-e883-ca93-19b8-86cf37e71bcc@amsat.org>
Date: Mon, 25 Jun 2018 13:11:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <988a6d50-a911-6ac0-2955-0f99292d8a15@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v3 2/3] hw/arm/sysbus-fdt:
 Replace error_setg(&error_fatal) by error_report() + exit()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eYRgKgHDovw2

Hi Eric,

On 06/21/2018 10:02 AM, Auger Eric wrote:
> Hi Philippe,
> On 06/21/2018 01:40 PM, Philippe Mathieu-Daudé wrote:
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
>> Suggested-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/arm/sysbus-fdt.c | 45 ++++++++++++++++++++++++++-------------------
>>  1 file changed, 26 insertions(+), 19 deletions(-)
>>
>> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
>> index 277ed872e7..63b74a353e 100644
>> --- a/hw/arm/sysbus-fdt.c
>> +++ b/hw/arm/sysbus-fdt.c
>> @@ -92,7 +92,7 @@ static void copy_properties_from_host(HostProperty *props, int nb_props,
>>          r = qemu_fdt_getprop(host_fdt, node_path,
>>                               props[i].name,
>>                               &prop_len,
>> -                             props[i].optional ? &err : &error_fatal);
>> +                             &err);
>>          if (r) {
>>              qemu_fdt_setprop(guest_fdt, nodename,
>>                               props[i].name, r, prop_len);
>> @@ -103,6 +103,10 @@ static void copy_properties_from_host(HostProperty *props, int nb_props,
>>              } else {
>>                  error_free(err);
>>              }
>> +            if (!props[i].optional) {
>> +                /* mandatory property not found: bail out */
>> +                exit(1);
> reading that code again, I am not sure this does the same thing as
> before. In case case the property is tagged not optional and is not
> found in the host dt, qemu_fdt_getprop will fill err with error_setg.
> However prop_len == -FDT_ERR_NOTFOUND so we are going to call error_free
> and no trace will be output to the user. Before the
> error_setg(&error_fatal) printed the cause of error error and exited. Do
> I miss something?

You are correct something is wrong here, I'll respin.

Thanks for your review!

> 
> Thanks
> 
> Eric
>> +            }
>>          }
>>      }
>>  }
>> @@ -138,9 +142,9 @@ static void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
>>  
>>      node_offset = fdt_node_offset_by_phandle(host_fdt, host_phandle);
>>      if (node_offset <= 0) {
>> -        error_setg(&error_fatal,
>> -                   "not able to locate clock handle %d in host device tree",
>> -                   host_phandle);
>> +        error_report("not able to locate clock handle %d in host device tree",
>> +                     host_phandle);
>> +        exit(1);
>>      }
>>      node_path = g_malloc(path_len);
>>      while ((ret = fdt_get_path(host_fdt, node_offset, node_path, path_len))
>> @@ -149,16 +153,16 @@ static void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
>>          node_path = g_realloc(node_path, path_len);
>>      }
>>      if (ret < 0) {
>> -        error_setg(&error_fatal,
>> -                   "not able to retrieve node path for clock handle %d",
>> -                   host_phandle);
>> +        error_report("not able to retrieve node path for clock handle %d",
>> +                     host_phandle);
>> +        exit(1);
>>      }
>>  
>>      r = qemu_fdt_getprop(host_fdt, node_path, "compatible", &prop_len,
>>                           &error_fatal);
>>      if (strcmp(r, "fixed-clock")) {
>> -        error_setg(&error_fatal,
>> -                   "clock handle %d is not a fixed clock", host_phandle);
>> +        error_report("clock handle %d is not a fixed clock", host_phandle);
>> +        exit(1);
>>      }
>>  
>>      nodename = strrchr(node_path, '/');
>> @@ -301,34 +305,37 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
>>  
>>      dt_name = sysfs_to_dt_name(vbasedev->name);
>>      if (!dt_name) {
>> -        error_setg(&error_fatal, "%s incorrect sysfs device name %s",
>> -                    __func__, vbasedev->name);
>> +        error_report("%s incorrect sysfs device name %s",
>> +                     __func__, vbasedev->name);
>> +        exit(1);
>>      }
>>      node_path = qemu_fdt_node_path(host_fdt, dt_name, vdev->compat,
>>                                     &error_fatal);
>>      if (!node_path || !node_path[0]) {
>> -        error_setg(&error_fatal, "%s unable to retrieve node path for %s/%s",
>> -                   __func__, dt_name, vdev->compat);
>> +        error_report("%s unable to retrieve node path for %s/%s",
>> +                     __func__, dt_name, vdev->compat);
>> +        exit(1);
>>      }
>>  
>>      if (node_path[1]) {
>> -        error_setg(&error_fatal, "%s more than one node matching %s/%s!",
>> -                   __func__, dt_name, vdev->compat);
>> +        error_report("%s more than one node matching %s/%s!",
>> +                     __func__, dt_name, vdev->compat);
>> +        exit(1);
>>      }
>>  
>>      g_free(dt_name);
>>  
>>      if (vbasedev->num_regions != 5) {
>> -        error_setg(&error_fatal, "%s Does the host dt node combine XGBE/PHY?",
>> -                   __func__);
>> +        error_report("%s Does the host dt node combine XGBE/PHY?", __func__);
>> +        exit(1);
>>      }
>>  
>>      /* generate nodes for DMA_CLK and PTP_CLK */
>>      r = qemu_fdt_getprop(host_fdt, node_path[0], "clocks",
>>                           &prop_len, &error_fatal);
>>      if (prop_len != 8) {
>> -        error_setg(&error_fatal, "%s clocks property should contain 2 handles",
>> -                   __func__);
>> +        error_report("%s clocks property should contain 2 handles", __func__);
>> +        exit(1);
>>      }
>>      host_clock_phandles = (uint32_t *)r;
>>      guest_clock_phandles[0] = qemu_fdt_alloc_phandle(guest_fdt);
>>
> 
