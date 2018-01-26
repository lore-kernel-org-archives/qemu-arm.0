Received: by 10.28.71.27 with SMTP id u27csp770852wma;
        Fri, 26 Jan 2018 06:32:41 -0800 (PST)
X-Google-Smtp-Source: AH8x227v6NdwuHYda/VjvtCIUSfTpn8U0haARz19aSDfpVL1DiWUsjiB/ZGxarSEBEwF+EoEzeRB
X-Received: by 10.37.224.135 with SMTP id x129mr10975581ybg.5.1516977161339;
        Fri, 26 Jan 2018 06:32:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516977161; cv=none;
        d=google.com; s=arc-20160816;
        b=TA01MY2EnLYKUFPRGJSWxVCf9cfp1pPs16Nn0bnaBRkj1BSNl8LndlX/F1vQXsoDW2
         Kblb9LN1knb7TEmarH5n9PqU5mq2zRyu5UEBA5WKLrXCezk82eOqYudQIlJR2X3HU5aA
         QGbuS7dvWeYQX+pFa9DGsoq1XeUTmH646C0xG43QuDRbA6fC0MHO3TXTDboe6/XorDfg
         ZW2phjr3hgUug80J+k1vbEecBjVTrr2mC29T29tbs0unL7kVUVj+7IL2UNMb7t9q7+n6
         M0OgmAQ6L4md18Jy0DjmcK4IoZ1TIXAqNPMlzw2RDa3cIbocIdDiVM4RI0yaoen76YB9
         BmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=aZVOOqKqS9hmWoRnuLUl+GZOchlGcWTxHt11jmaJnu4=;
        b=D78MmfQ6fw1ipwUV7XS8sEyXIpemSrtejoMbYjkVqxc6+XO82lFqVVBptjr7l59FcF
         gGvG6wXtbvnGK9ZgOWtCgZIuvptle27QOvwqpqbSexpy9awyHFsheRw0AmYmGc8gauQ4
         NZrByHZSKrrdB1t+eOcCNcR8IuGVENwmK+nmSU6FTFmGtJ/02Xg3It54u0es1WkJIIb2
         haGjX+nis+pb+JQx1X4+dVQJ2+QAEaBlZM3GZYfSGHBR/hvoD9FPore4x+VChmooFWvC
         7NdIx3yEHbUCNkrGyYPtQdF94StPbhDY2DAlSL1V2uytPffoT9nvFU6IaVMDX3joDEVY
         dZxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SwcylCts;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j12si935881ywi.37.2018.01.26.06.32.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 06:32:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SwcylCts;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef53Y-00021g-NV
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 09:32:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef53M-00020g-DX
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 09:32:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef53H-0003Ph-Ew
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 09:32:28 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36751)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef53B-0003Li-SQ; Fri, 26 Jan 2018 09:32:17 -0500
Received: by mail-qt0-x244.google.com with SMTP id z11so1702882qtm.3;
	Fri, 26 Jan 2018 06:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aZVOOqKqS9hmWoRnuLUl+GZOchlGcWTxHt11jmaJnu4=;
	b=SwcylCtslsIgD9ynnJgIB+m63O/qHLqlSgzN+LVGXX9G2eLz1l92mfxrgNNZtuux86
	UcURfufNAc2vKY/GVUhtWZRIU8AdBhV+gb84vJrcIKXQTcpXwfkwMj5Znzd2ERYIQzWr
	JVxWe3U+IjQjQXph+B3dVYBlLjuV0kpqYXYD8nFqrtPkNXyDvTAKDNlBFlvvI8KtrbV7
	3ffIULwgRswJEyV4cuWo8YiiSMWEPmt/TA9IMH1EvcsXtU3Wrb2M82zmnV4J6cAmiMrJ
	Ji166VhmU8e9++Q4wlmrgVtBtRVBonyzPFAgsLZqkQO1KPsUMspIadtO5UEBONc1qVhn
	dEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=aZVOOqKqS9hmWoRnuLUl+GZOchlGcWTxHt11jmaJnu4=;
	b=TH4I6CGnXU4y5gXnSWp3STdNWzi2NsOV2Goj8qtFH7lmTYJrdY0bXhS9lWFjOIeOU1
	YuvNNGKULp2q8aOL4qfs45kVbxRksHREWeTMd0dwPbpQnxQRJAhV8H4kd4D0MYnm22+f
	sooxoxwWROEvIoNitpGad9CK055tD9nPYqFZqSNX/8+dZ4gD5T46/psqptQkZ8b/rB6P
	bCZFBJiLStMegWvgQe5tZ0oZUsMI5YBpw6XjBQ6crJx8yqWA1EqJgac32x+Puj3NS12E
	cWFhzU7REIMw2u36KXhl2YyyBs90CTqiSXwtdyAhtM+0N3208DI2JTbuHkUE6QBMLSiX
	WkXA==
X-Gm-Message-State: AKwxytc/eFRPW1IjIm1lNjEdNH/18dghV+zsiB/w7WUSM0YIfk7/Jcaa
	UgA7FVf8FQufrX++sWxj4A0=
X-Received: by 10.55.72.204 with SMTP id v195mr20087477qka.295.1516977137305; 
	Fri, 26 Jan 2018 06:32:17 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id m44sm5619897qtc.9.2018.01.26.06.32.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Jan 2018 06:32:16 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<1512670493-18114-2-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <3d73ed91-c1be-4d32-e3de-b945dea52ae5@amsat.org>
Date: Fri, 26 Jan 2018 11:32:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1512670493-18114-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH 1/6] hw/arm/virt: Check that the CPU realize
 method succeeded
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
Cc: patches@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FQlBizloa9v1

On 12/07/2017 03:14 PM, Peter Maydell wrote:
> We were passing a NULL error pointer to the object_property_set_bool()
> call that realizes the CPU object. This meant that we wouldn't detect
> failure, and would plough blindly on to crash later trying to use a
> NULL CPU object pointer. Detect errors and fail instead.
> 
> In particular, this will be necessary to detect the user error
> of using "-cpu host" without "-enable-kvm" once we make the host
> CPU type be registered unconditionally rather than only in
> kvm_arch_init().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 151592b..62af013 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1402,7 +1402,7 @@ static void machvirt_init(MachineState *machine)
>                                       "secure-memory", &error_abort);
>          }
>  
> -        object_property_set_bool(cpuobj, true, "realized", NULL);
> +        object_property_set_bool(cpuobj, true, "realized", &error_fatal);
>          object_unref(cpuobj);
>      }
>      fdt_add_timer_nodes(vms);
> 
