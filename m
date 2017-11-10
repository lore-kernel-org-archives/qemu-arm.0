Received: by 10.223.150.237 with SMTP id u100csp3646051wrb;
        Fri, 10 Nov 2017 03:32:23 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYykVufnHtsIkewJcNmiE9e9CtpArQ1ZIVU67R2eMPQvKTeDtaRWdfEGtGFvdqR1yrJURA1
X-Received: by 10.101.76.195 with SMTP id n3mr43728pgt.120.1510313543735;
        Fri, 10 Nov 2017 03:32:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510313543; cv=none;
        d=google.com; s=arc-20160816;
        b=qnq3GlBcKs+/h/hINXYGWES7AC0cTu/yGstxoEo7jDMPZwni024j15qbcj8IDLJj27
         x/w70ffhNeN/wh+q6TC75gNfIv+32m2SkkcNY8wBv3SJj4oHyJ/q+/oR0Q8kr57ASF9O
         yG+SSizIo2WaQL+jNQ4lNCff5D3nVG8e3zpEJRw3uP8KwoXz27EGZxoV+tYp9KHpVg1Q
         S04m9Tb62vVtiD0AOODGPwB8WRoWRiRJvc2ciiOpJLprElhiEgwG5CsllcXspnYczHGX
         vajF8i7YrCYZYc31iXwwh0dm/U+97Ilf/y7xLs0wKzdHXz6zvsbcHTaBj5YIqperpg4u
         mjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:arc-authentication-results;
        bh=QIax2QrE6oyQ8VCfuqaX3RlXdbCcSlF4p+fqvUJDc4U=;
        b=X3Ijer1EanSkR265UHF2ZeAy1KXQuE2Cph6OlF33XbRgY74alxTI/TCwDPrFdyOU4t
         lRq9xd5RuETKB5ZZLoWZ7j3B2ADzA9pp7gxx3t9w2Q/M/x0d8FY7Rc/VtswuKHZiL9KO
         U0H9/jr/nfCLR3N2gSieSrBxYtpx6OK3K5ixz5zIv898ZfaD9mApi1/s6oUJA0mqz+UC
         Y3xynGf/bmwyd6Q5GJ2ewU3SMlIdFVuOhUQUs5M84HpDoMkW50W2nrAfehJUezxF6yu2
         CQct3xKtm9HCYX2Nk6WEq38M6SXNyc/NWCwhGGbcUFTiAyDNMz9LFc94zB+S/qWNjs9j
         XZIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d65si8249349pgc.296.2017.11.10.03.32.23;
        Fri, 10 Nov 2017 03:32:23 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752448AbdKJLcV (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Fri, 10 Nov 2017 06:32:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40798 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751239AbdKJLcV (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Nov 2017 06:32:21 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C5D85356D6;
        Fri, 10 Nov 2017 11:32:20 +0000 (UTC)
Received: from [10.36.117.36] (ovpn-117-36.ams2.redhat.com [10.36.117.36])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 65EED6267C;
        Fri, 10 Nov 2017 11:32:09 +0000 (UTC)
Subject: Re: [PATCH v12 09/12] Move related hwpoison page function to
 accel/kvm/ folder
To:     Dongjiu Geng <gengdongjiu@huawei.com>, mst@redhat.com,
        imammedo@redhat.com, zhaoshenglong@huawei.com,
        peter.maydell@linaro.org, mtosatti@redhat.com, james.morse@arm.com,
        lersek@redhat.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org, rth@twiddle.net, ehabkost@redhat.com,
        kvm@vger.kernel.org, guohanjun@huawei.com, lijinyue@huawei.com,
        huangshaoyu@huawei.com, wuquanming@huawei.com,
        zhengqiang10@huawei.com, linuxarm@huawei.com,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
 <1510341591-22817-10-git-send-email-gengdongjiu@huawei.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3017b1b9-24d7-565b-1180-a0eb93c6d57a@redhat.com>
Date:   Fri, 10 Nov 2017 12:32:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510341591-22817-10-git-send-email-gengdongjiu@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Fri, 10 Nov 2017 11:32:21 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: SLUJzkwpjvRg

On 10/11/2017 20:19, Dongjiu Geng wrote:
> +typedef struct HWPoisonPage {
> +    ram_addr_t ram_addr;
> +    QLIST_ENTRY(HWPoisonPage) list;
> +} HWPoisonPage;
> +

Is this actually needed outside accel/kvm/kvm-all.c?

Thanks,

Paolo
