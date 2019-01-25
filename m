Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp516231wrt;
        Fri, 25 Jan 2019 08:39:42 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4qay3MI8BkAvZc7EAUkcK7XOk94zbWzRjPL5HT/9cUHjEeRfKZJFHNvoXzhsjveDU1nOWH
X-Received: by 2002:a5d:4a45:: with SMTP id v5mr11639870wrs.7.1548434382134;
        Fri, 25 Jan 2019 08:39:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548434382; cv=none;
        d=google.com; s=arc-20160816;
        b=rCu+jxgRRsSblu2Ti/0TNBIAUEPRi/LDpoucr3W4UZSeJHbiaj6++juKIA5H7JmUd5
         nQQ7HllIcZOLZjvMIgjEQ8FjNHB4D13TawjZcP506sUEjLbPzLlvi94+NNImHV1VqOae
         nes2vWoov8OMDG4+eesZWIAyLtBJhSSkdPiVt9HkoNFLzU8iPjjxu+F9TUQfa2hRGlrI
         hWw5k6cJQvstGCMRygK8xSLG8yfUoWkytCZCzVZtehgj4ddmfOmaK/1YAQJPNMoiJPqa
         8cazNMQltj5Pc3n/rqnonLPpJd4YPTWb0ltZHJM5IZatuhxDCCGLIDHuDtosvLZPCE01
         1PgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=xnQ8Mhp4Tlel3cXNx5LdEzr+uJHYm3KaTuodp3RT4Ko=;
        b=KfzNxAr64yIvgWLRir7HPYknNBBev1IAtDOEhJM0KHUb7o2Ex5inO1XHBbSiUInANi
         qplFWGNjhdbECLPRVRfbNd3RswlcguSlw28RklnAjgduBFMqEw/PZqon+xFq6u/Ov9sk
         id9mqZvPRSC2TLS1n7ZG8XCsJxsY9asdTTAsyGQT0fLU4dSuxWkQYzkIy6z2bOf/yGp0
         ZHyLjuj8cQIeGKG0/oCDeWnscEKjkLvsrDA3SQGpyWkYHOiXVZdvaeeaE+NraEWeuuYQ
         +9PtONVGRasDHUDylv4pswD281XC0UGWpOh/P3mxbPvltn/nP//UftucN4dbYaqY0rM4
         +A/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si44066143wro.50.2019.01.25.08.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 08:39:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47047 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gn4W5-0003Ij-6t
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 11:39:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gn4Vh-0003D4-An
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 11:39:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gn4Vg-0003nL-3P
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 11:39:17 -0500
Received: from mail-wr1-f53.google.com ([209.85.221.53]:45166)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gn4Vb-0003kp-36
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 11:39:13 -0500
Received: by mail-wr1-f53.google.com with SMTP id t6so10934504wrr.12
	for <qemu-devel@nongnu.org>; Fri, 25 Jan 2019 08:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xnQ8Mhp4Tlel3cXNx5LdEzr+uJHYm3KaTuodp3RT4Ko=;
	b=eXoLyZntY9CyqXxQ+ugTEBYGetHaoVfNHHeWxG27ovez6zjjXHgxYUPDvQ+nDcOqFy
	jL9QhJsP1PntJuqBPSByehPTs6UYcdtoHtpf31AHWnTSFQHG2FuzU6ZYxtZAuQShJfmb
	FBPRPlCzsspv81XtWgoxRxKqWPzlbo53tkgtwoGCF1dQKop9zeJeGvpMn2CHtsfE7whC
	ztmcVtGzt/wwZ6K1915MhpDgqERmkzCBOXbyiTMWNg0jBk9W1ssaKJvsnXbu3CHdvM7B
	Mux/3VmamItSN7ofLdzBav9ueL5OgwHHfr3jlq23KT/T9sceeKR+ZCh0h1Vn0BtRD2OT
	MOvw==
X-Gm-Message-State: AJcUukcgf5dLewbh/HbG4Kezh/gWrPRO3saZY4JKPBggdkkevabnrig1
	RWb9iCGF8Z81uDOfEd/4OUGUJ1Pg6pE=
X-Received: by 2002:adf:91c3:: with SMTP id 61mr11781511wri.324.1548434348142; 
	Fri, 25 Jan 2019 08:39:08 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	200sm67201008wmw.31.2019.01.25.08.39.07
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 08:39:07 -0800 (PST)
To: kumar sourav <sourav.jb1988@gmail.com>, qemu-trivial@nongnu.org
References: <20190125155630.17430-1-sourav.jb1988@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <634199bb-6444-a5de-2234-1895b02b5615@redhat.com>
Date: Fri, 25 Jan 2019 17:39:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190125155630.17430-1-sourav.jb1988@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.53
Subject: Re: [Qemu-devel] [PATCH] hw/arm/nrf51_soc: set object owner in
 memory_region_init_ram
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, joel@jms.id.au,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wK+j1E046qcf

On 1/25/19 4:56 PM, kumar sourav wrote:
> set object owner in memory_region_init_ram() instead
> of NULL.
> 
> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/arm/nrf51_soc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index 1630c27594..3a1c7e200c 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -89,7 +89,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
>      }
>      memory_region_add_subregion(&s->container, NRF51_FLASH_BASE, &s->flash);
>  
> -    memory_region_init_ram(&s->sram, NULL, "nrf51.sram", s->sram_size, &err);
> +    memory_region_init_ram(&s->sram, OBJECT(s), "nrf51.sram", s->sram_size,
> +                           &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
> 
