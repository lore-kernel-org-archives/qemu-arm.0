Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1651016lfb;
        Fri, 3 Sep 2021 13:44:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZoYHuf6uidXNkQKzdmBVwPA2S0k0vISTJ/7JtEc0Gh3xCZldkhjMBW3h/HCgwcv/ZCNMe
X-Received: by 2002:a6b:b44f:: with SMTP id d76mr611938iof.189.1630701849703;
        Fri, 03 Sep 2021 13:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630701849; cv=none;
        d=google.com; s=arc-20160816;
        b=i/nhWajY6YDNlqUm2t4C1s43NQvHMVC5vI8o+dc95nrJBJRFBy0VcKjLj3siC75VZd
         1dzncUoo8E8V//nq/hUVWHpicGzmjiEnSSK+laZYgFNRcfe1wYp2M5QCFBxXNX/qZmgu
         5Yg8H7o+KGbA6jx17+h5w4X5wqxXjV5fvR7rKRw/Nwf8E3x3Yo2eybOIYEaLSNy17ofs
         C/yQ5XIRYIQd0l519Q5llCwqqc9pIyhqrYt+2XHTV711sdMH8ELBqRUiHZCZDyzDsNOT
         Wqraba7lnHrkHYympzJ1j6N9Z7G7Y6jMFHGHMG4551pNXSVZHNO6T0ZjrMXoN2P1fx/O
         glWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=kHY8X+3WAxrdeSKfSV5cKvDPcFHMSr1zqsSabCFDuj4=;
        b=E59nNkRGxhZvCIfTVOQPdHUuF5LSFdip7c4vlJrY5SuSlv4H1KfUs+dsJgwFIE4o+X
         p5/zMIGOYHchlHaMvuAi0Q4QoCcldwLhzRck5WpU/vhUo2Ibz1OL6TP5+zlgONHc1kga
         RhLGmdnZJX2ENzspnBHS+AAUxeBxUFLuA9VS7Sku+GtnQdViPRihEXhCDsqDV7UmHcV2
         fBNoySBWvkZer1l91NBxUDvwodraNWAHdHwUXoK+wz56Os0T5RwZ+AgopvplZCVs3qBs
         NvrlncCMFkAqxLeCGGtKsIAsNydQvN8oqoEN2jTSmCWAKgdZ7Xe6+HtOTzwGekbhYEsY
         Ehog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y2JE2znG;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id v17si351404ilm.40.2021.09.03.13.44.09;
        Fri, 03 Sep 2021 13:44:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y2JE2znG;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350962AbhICUpJ (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 3 Sep 2021 16:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350122AbhICUpI (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Sep 2021 16:45:08 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A109AC061575
        for <kvm@vger.kernel.org>; Fri,  3 Sep 2021 13:44:07 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id v10so398448wrd.4
        for <kvm@vger.kernel.org>; Fri, 03 Sep 2021 13:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kHY8X+3WAxrdeSKfSV5cKvDPcFHMSr1zqsSabCFDuj4=;
        b=y2JE2znGpCHgDzsU2I9wK0RJ8GE2JJWPW9THeKM+zR9sq8qQv438t3kOx206Jt2Fg9
         HCBj4K5J9LrMW8VCOyReTekXa1iDDwX12LjR7w51Hp6FgTpMfV7mK57QPRaKgTN+mKSM
         c4ydaiundmZ/zqYpEcQ7fTBQRpS/g1xvCPjoSorsUTdNxikH8pbFeAJIqDRqkEeBcdOc
         o6bXO2ZIp6ZGu2T9H1FE0GxSedCTSSR2B/P/X59CRLG9yK22Gt+PLAznez/m/7vmSLM1
         nNLeBSmIfDEWuEX2lL68vLI9//wt72neSXBsIxn05T13a5hBYl9JWV1zFbdtz3FU6mYb
         fpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kHY8X+3WAxrdeSKfSV5cKvDPcFHMSr1zqsSabCFDuj4=;
        b=OmsfZASTEdCyrhDKBLgod6XCuSpu5ZulXG583jJ4E9GCr3SaOEk5Sx7orCRfDmR8XF
         eYSgrBzp4bt9HJUdlwSJe0M8485IV9DmSxqQXY1i9R//pFiGOw4dwKYyfW1Rgik5a5K+
         wSCOCrxHLYT2IIeJ2isV6Il95eMAwUn1zcx1HD3TVKpWYVfRxirp4LZwfuxzRdDSOtxL
         5nMZCcb1mH1I0T7JTK73irkUX1eB9r+CQN6fqSUoCaCtG1F9y2uWfdWiz59yo93yZGq1
         ooX64ewKqLB1xofbm7uuK8JO9mNn2mDZMvBsFDzoZvvux5dTY2AyVD9MeEqauNEjJYOO
         J6oQ==
X-Gm-Message-State: AOAM533B84vtdVpJ2S2deW8QbqcDaWlTGbe9WAeySucmOE/4H28mVaGv
        I0ntTcQQbIbCb8QRhvDWeAVQQQesE4MSOE0yZoo=
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr889163wrw.390.1630701846250;
        Fri, 03 Sep 2021 13:44:06 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net. [2.142.216.190])
        by smtp.gmail.com with ESMTPSA id h16sm264457wre.52.2021.09.03.13.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 13:44:05 -0700 (PDT)
Subject: Re: [PATCH v3 20/30] target/ppc: Restrict has_work() handler to
 sysemu and TCG
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        qemu-devel@nongnu.org
Cc:     Bin Meng <bin.meng@windriver.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
        Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
        Anthony Perard <anthony.perard@citrix.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Huth <thuth@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Chris Wulff <crwulff@gmail.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Cameron Esfahani <dirty@apple.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Paul Durrant <paul@xen.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Alistair Francis <alistair.francis@wdc.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
        Wenchao Wang <wenchao.wang@intel.com>,
        xen-devel@lists.xenproject.org, Marek Vasut <marex@denx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Colin Xu <colin.xu@intel.com>,
        Claudio Fontana <cfontana@suse.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stafford Horne <shorne@gmail.com>,
        Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-21-f4bug@amsat.org>
From:   Richard Henderson <richard.henderson@linaro.org>
Message-ID: <860bd94b-89ce-3aa1-4c8b-b53e4d83b80f@linaro.org>
Date:   Fri, 3 Sep 2021 22:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-21-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: y1zU9xja/rbm

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/cpu_init.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
