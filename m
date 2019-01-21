Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6457138wrt;
        Mon, 21 Jan 2019 12:32:38 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6oUZNlilWhQ1ttp09Y2Te6O5E0sH+GvJmln+M+NX8SEUqQSX59iZYFto+z/SBKcievhkGp
X-Received: by 2002:a1c:410b:: with SMTP id o11mr810381wma.109.1548102758004;
        Mon, 21 Jan 2019 12:32:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548102758; cv=none;
        d=google.com; s=arc-20160816;
        b=v8n0+aYWsmU0IjxFfFiLDIKeEKATudBq4QPBCvSlUWaQrTtjlq8cDAns/jhdeGAWp7
         oF/PeHo5IbEoHDYC1ESrlTFXjsMWyP0UYkRZ+IwQVGghQE8utn6yetXbbFyHrERA5Hmv
         /OPMo0OLX2Z+SwxGLJXLBe9Tf0Cyks+bwIDBU0KNF+XX4DG9IzEyFZhk2T4K4N6uXnAb
         g7ikFxJiAGD8DcwMnfsd8v58cqIGx50LjmO50oXHVKfd6X+Ydjbohp+ObosXEWi+UH6q
         6POfOONq9AUPXgs4Uz+Eky1MnyT+trbsFXIHW/HJb3pr1gJOEsKN9cLZ5vFsrcK9VPdR
         i+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=lfMzra0TSM4inZipK84Zw1xsl9s1JT1nsQ6wUaWeuEA=;
        b=MRrpgFmcinkKuv/iqiG7tPtziLNyr0qTKJ5Vdf6C1i+cPEkcWZ4f/rHNLyTC+KEgCj
         qZBDQwYcjcHIwZuXSq+7D0WDBii1Ly2POPVzU3nBgK/XJaP6SBiW+mJ2umgsqd1nDsNw
         oOIhZ58OJXwippEJj3koUdNdcTVoE1S9vh376ZqM0z8AExy2QdPfqNDjgY5pMuS6ozkP
         9L/3cjukai7g6zqPz0I6e/t0E5I4GEb4v5y6Qe03+raRQ2hWBjaJPEmiifmYpqnIjRwK
         JD5jqdu38V6sBPNXFNCV5MpG+81JSA+gqKLq0mxb7jIpOub/WglSa5nY28BSldgjFh2V
         Hf+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si63341315wrl.284.2019.01.21.12.32.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 12:32:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59581 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glgFJ-0002No-1A
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 15:32:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1glgDJ-00015j-Ha
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 15:30:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1glgDI-0006ml-NV
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 15:30:33 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44390)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1glgDH-0006k4-AH
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 15:30:31 -0500
Received: by mail-wr1-f66.google.com with SMTP id z5so24844620wrt.11
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 12:30:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lfMzra0TSM4inZipK84Zw1xsl9s1JT1nsQ6wUaWeuEA=;
	b=uCn05QEHBGQ1Cy5X1LagtS6aOmIRtouCWgnjYxY+NzUTfC9wKbmksc4w/uGkA8zMw8
	fAlLTYfRNAzcYgt31B0nhrlIGU92nozFKekBAx/EudMzK/RdzotyY6Qks6pdxK+KIsGL
	cOHj6DXqAwC9TvM6cMMlcaEUxoY8BVKq2O5xuKcYHjJnQqHD/EVtHG/4CBA3Z3Kx9uaA
	5NodwxdVtM6988o0Vnt6GbrVCFm9NXVKzILV5PQJh7gQFfttcQnme8oxhm2B08YH0vGC
	YKXEeex95Lh1feBU497qmWVSlnDf0NWkek5nDx4sSjmhKZF0GDlzY/yYBppB8mpyFHMs
	9qQQ==
X-Gm-Message-State: AJcUukerI32JEEv20LNedpO+1smCtTxVRF4oZMM0Shvq0x+/K7uSc2ku
	OwF3b8YzfvE+Gv8yNDfUQBiyFA==
X-Received: by 2002:adf:9c01:: with SMTP id f1mr30812044wrc.286.1548102629688; 
	Mon, 21 Jan 2019 12:30:29 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	n82sm50578737wma.42.2019.01.21.12.30.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jan 2019 12:30:29 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <679001ca-1217-5ffd-d9bc-54bff58ca3bc@redhat.com>
Date: Mon, 21 Jan 2019 21:30:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/23] armv7m: Make cpu object a
 child of the armv7m container
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
X-TUID: BZtXgLo6xdQ8

On 1/21/19 7:50 PM, Peter Maydell wrote:
> Rather than just creating the CPUs with object_new, make them child
> objects of the armv7m container. This will allow the cluster code to
> find the CPUs if an armv7m object is made a child of a cluster object.
> object_new_with_props() will do the parenting for us.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/armv7m.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index f9aa83d20ef..0f2c8e066cf 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -158,7 +158,12 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>  
>      memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
>  
> -    s->cpu = ARM_CPU(object_new(s->cpu_type));
> +    s->cpu = ARM_CPU(object_new_with_props(s->cpu_type, OBJECT(s), "cpu",
> +                                           &err, NULL));
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>  
>      object_property_set_link(OBJECT(s->cpu), OBJECT(&s->container), "memory",
>                               &error_abort);
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
