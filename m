Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1852458lfg;
        Mon, 8 Mar 2021 05:51:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzti0d71pI/4Ajeu0PCDI6OtrV1ypQi+fg93z8TpiyWQKvMlpmxsWMudFEMSrvoXgKeZ5yC
X-Received: by 2002:a05:6e02:ca1:: with SMTP id 1mr19697212ilg.242.1615211480017;
        Mon, 08 Mar 2021 05:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615211480; cv=none;
        d=google.com; s=arc-20160816;
        b=TYYQa4IL4Dy5CoYHaqP0Zvlt/8mQAHXmfKqPZjfwR9rhCvAIBOhzjprFj5sdJdcEJJ
         1VoxCYFO2daQvaUD4+d13tdw6uKNG2d3Z00ue7AZ9VLUpOkuc0LvDz743PvmlC1rMzog
         mHd9NDk+QonNRIYcX/04QbFG78e+Inb+oZeFv9Ep12+MFMKA3sC8Iw2uwTUmROJDbeLV
         UKzavZz62OpOl8x3ZeEJZ+AccF+zX3nyDZtL4YK014JpeBARMUW/vckrNF6Lv/eroVf7
         cyBeS5ecDxNoK0p3EUhvi5z7n2XraWxvjj4goGfd/uPe6+NAtekh7S+lilcbl7mS8cnV
         Pz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=P26XU5A2Ztslhnr/o+XDQv6sKntmkGm3RLFFw/EZ+a4=;
        b=uvxjM3i8hHkrthCWd3dh6HVV+AHDmUgqq4lufA4tTNbWjxi0QoSZ068Xc88/8/VUZY
         RXI+r9Jme+wbVHnTGhxepw92Yidh8D+48riSx9Q98wMt7MKtOawnQLroM/eQbxFjnP/T
         mEmuv6+OLT/xsC+KK6att0EHnMl3zyhwZkAMNM0Yaa2+6VKSET16a/QgxxAMP9xLEIck
         5jl9v+MbG83Cu8mr//FgnlRK71zBy596ORAPIwN5Xn6iI5dDSngXEXKAwxMGHDYeCh9t
         3qT35AbdUncIWAz6IPebbzZxzvUqEOC0ggaWf9pg3DaURtu1eLFGnTMki75oQFxaMaVS
         yb+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TTQF1huU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si12943604ilm.45.2021.03.08.05.51.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 05:51:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TTQF1huU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJGI3-00060v-B5
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 08:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJG7b-0006Yx-Ve
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:40:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJG7W-0004Uc-Jy
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:40:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615210825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P26XU5A2Ztslhnr/o+XDQv6sKntmkGm3RLFFw/EZ+a4=;
 b=TTQF1huUIWXzg1l3u4LBSA2RCsSqbNRxWGvby30wPE37eOqMbB8MRRYrqWW0+9bomzoy3l
 6vU2sHjWvI9aqGQHCoNl7lQVNABJLnbGdgk/zbhucInlO0p+kwun2vydNI9rh2/RoF6Yw+
 lSeibBj+X+bF1yOfh0oi7vUDCP7qelg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-OWt9f6tYPo-XBiaZoCdkyw-1; Mon, 08 Mar 2021 08:40:21 -0500
X-MC-Unique: OWt9f6tYPo-XBiaZoCdkyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF3EF63ADA;
 Mon,  8 Mar 2021 13:40:19 +0000 (UTC)
Received: from [10.36.113.123] (ovpn-113-123.ams2.redhat.com [10.36.113.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 453FB60C43;
 Mon,  8 Mar 2021 13:40:07 +0000 (UTC)
Subject: Re: [RFC PATCH v2 1/8] sysemu/tcg: Restrict tcg_exec_init() to
 CONFIG_TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210304222323.1954755-1-f4bug@amsat.org>
 <20210304222323.1954755-2-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <e927dd5b-85c5-ddbf-aa16-2d1401a10bc3@redhat.com>
Date: Mon, 8 Mar 2021 14:40:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304222323.1954755-2-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IPEi7SzowGFd

On 04.03.21 23:23, Philippe Mathieu-Daudé wrote:
> Invert the #ifdef'ry to easily restrict tcg_exec_init() declaration
> to CONFIG_TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/sysemu/tcg.h | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
> index 00349fb18a7..fddde2b6b9a 100644
> --- a/include/sysemu/tcg.h
> +++ b/include/sysemu/tcg.h
> @@ -8,13 +8,15 @@
>   #ifndef SYSEMU_TCG_H
>   #define SYSEMU_TCG_H
>   
> +#ifndef CONFIG_TCG
> +#define tcg_enabled() 0
> +#else
> +
>   void tcg_exec_init(unsigned long tb_size, int splitwx);
>   
> -#ifdef CONFIG_TCG
>   extern bool tcg_allowed;
>   #define tcg_enabled() (tcg_allowed)
> -#else
> -#define tcg_enabled() 0
> -#endif
> +
> +#endif /* CONFIG_TCG */
>   
>   #endif
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

