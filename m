Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp382608lfc;
        Tue, 9 Jun 2020 04:12:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDWkXyUrit1UinLV0bfTQgwFMATfzKMd/FlbfH7mKNpH4TPUSaQ4AwvfVl27Pg2mKHE3E/
X-Received: by 2002:a25:af93:: with SMTP id g19mr6100465ybh.109.1591701166364;
        Tue, 09 Jun 2020 04:12:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591701166; cv=none;
        d=google.com; s=arc-20160816;
        b=wGkgtBV5HCSYfoXkmF17gA7z2WVZwyWhS6n6TAcaq+0lX8QJeEUD+JsvegeMNx9tY4
         /0kaUH9iw9KAGDsIamPq8IASGJzQaQAafxn3k1GjCuxi6TJN8sx3uHCfdOyy58QN/65p
         9zkQamR63kbIYUXFpuZ/ALLxr6RjmB3MtvCbt0oP2/ONZvEsaup8Bzn7BpT/8THdP5DQ
         NyUzhL8wZgHmjPGTwJKRllB6TrfJVyE7n7w9y7QJF57nUQILxuRiniw9d8QLJtPJCj9M
         9bu1TXpunWnXXJrh0vbplQ/JISPpDEMSgsjoFIdZeOUApxj0rcZvWACuHt7oBfwCqrWV
         oH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6lAgcTDN/dV/f7SK/NrjUs5/i9Qjg44Eo04qPw3cNtk=;
        b=zwezNS+hcZaEM8kSDaOsukdM5a796rZ7v+Id2JPB6mefNbULrXk44DsPPqkxA5BFOe
         BTPLUOBqO5jkT81R3j0mDaUCQCcRkFheWcwbgqQSjPeVi9QA/dqMO7QxwNO77YyF6htA
         hZWzRbIXamofbwy0f/adoaHeYSP/uSaDVPJCRgS72FaJ05S2adBceirm+RywLMXn/aXv
         bv53KR+CBGpofkSoMhLbF+F4nbPRaBwlIpo1pxQTjGxlp8huVYipCYoikLCHlnLz3pgy
         sKA+tHV3cpe1o/8a1gnWI/E6CNYlonX42g3C4PDjdg82J92zDbRUrmHMgl04ACy0rZIJ
         INIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BVc8WLX6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g185si2172629ybg.259.2020.06.09.04.12.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 04:12:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BVc8WLX6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jicBR-0007dn-Lt
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 07:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicBH-0007bA-8B
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:12:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49046
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicBG-0002As-2n
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6lAgcTDN/dV/f7SK/NrjUs5/i9Qjg44Eo04qPw3cNtk=;
 b=BVc8WLX6sk2GSnIdXYzj5hVsj7jp4k07nA8Jf9MUWDW4qAGIEMaySUJeRVfazHyXbHfQVl
 VaMGRF+Xcrox0dEQNn3cYuSyf/Q5xymai93TYKPdtwGMH2oMnSipeBNgLtWQQZrqCTxZHU
 WJWulZWwQvnJjgI9rJ1WdypLxEjlO9I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-iq4XczZiM1i1SPvmc-0Xew-1; Tue, 09 Jun 2020 07:12:31 -0400
X-MC-Unique: iq4XczZiM1i1SPvmc-0Xew-1
Received: by mail-wm1-f69.google.com with SMTP id g84so606884wmf.4
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 04:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6lAgcTDN/dV/f7SK/NrjUs5/i9Qjg44Eo04qPw3cNtk=;
 b=uW+kuOl4lyJ3jed7eaFjGbvPlIOW+Zd6Vny3hLlHkbKSaqCZAqD6agiPJpyLw2zBpM
 MBQtllUXtwzXOWnxJHM5oXMBUWESFFLq4QC1G+7LUf/eWBN8nYRNFmwYxRXrzRoHvC8Q
 KpSeOhcOXzFJkeUTOSc9qvoFdXs9w+6qLcD5YcB5Ir31IP9pkgM03DEfUeZMSDHgxc1J
 3IbHN719CBs+T7Jqxgz4TMMy1dqLvZIvruVxPeiKwmwB14A0+hQyBBf8laUrifR8U3Xb
 mqzRBB/kn5+eXazSEypOXB6LUidGvn1hB5+Z2OrzGwcXvdKdvThORNwu/E+/0lQ/gs7T
 9w/g==
X-Gm-Message-State: AOAM533cEn216cpQSiqSo3gQtPy+LDiCs8cnCtHcUaYobZkM2zo3/1Iq
 SvaEq2zURnrKK/uQ1Z22cZIM1vsy5UkFq0j5iGayTZaMoTot29d5D0coxaidOf0fNtQQefFB8VK
 KQJhb2WfMzQJJ
X-Received: by 2002:a1c:a7c3:: with SMTP id q186mr3257037wme.141.1591701150721; 
 Tue, 09 Jun 2020 04:12:30 -0700 (PDT)
X-Received: by 2002:a1c:a7c3:: with SMTP id q186mr3256994wme.141.1591701150493; 
 Tue, 09 Jun 2020 04:12:30 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id u130sm2587221wmg.32.2020.06.09.04.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:12:29 -0700 (PDT)
Subject: Re: [RFC PATCH 29/35] hw/ppc/ppc_booke: Emit warning when old code is
 used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-30-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c932d51a-1b7d-bec3-5dfa-222c9ba5090e@redhat.com>
Date: Tue, 9 Jun 2020 13:12:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-30-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 01:38:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1ZspV/fakR2S

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/ppc/ppc_booke.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
> index 652a21b806..a9e5e68578 100644
> --- a/hw/ppc/ppc_booke.c
> +++ b/hw/ppc/ppc_booke.c
> @@ -31,7 +31,7 @@
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>  #include "kvm_ppc.h"
> -
> +#include "hw/qdev-deprecated.h"
>  
>  /* Timer Control Register */
>  
> @@ -338,6 +338,8 @@ void ppc_booke_timers_init(PowerPCCPU *cpu, uint32_t freq, uint32_t flags)
>      booke_timer_t *booke_timer;
>      int ret = 0;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      tb_env      = g_malloc0(sizeof(ppc_tb_t));
>      booke_timer = g_malloc0(sizeof(booke_timer_t));
>  
> 

This one is okay.

Paolo

