Received: by 10.223.150.237 with SMTP id u100csp2218979wrb;
        Mon, 13 Nov 2017 00:41:26 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYg9zvmVD1ZVh0/daTR4Z+Wy6dPI7NT7G+V8CHH6tybQik8+uzRWRl8bIesov3p17hdFnGg
X-Received: by 10.98.155.22 with SMTP id r22mr8966394pfd.96.1510562486469;
        Mon, 13 Nov 2017 00:41:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510562486; cv=none;
        d=google.com; s=arc-20160816;
        b=KqANlZtml4OyHCGabD6yU9k+goAeb/6jAfQPu+95jrdJrjj5MgJ7a5sWJM9URaFMqa
         mEbx9S0W7FQCtBOtbau0LbGNYBX+a6sgIqI3N43MX1JRT0HMCX/nEbes/jKRR8y/+nIK
         ekRsL2vqv+k313ZNxo6LUoGC8yoQRZvZiETOMOUSf5lqr1uWIQfcHr+roCuiWQOprovQ
         fY3ynHJCW/SWvZvxllYg5pDAKLNBImafpIhY4RL/TqpNt5MBzwsRnUqmFlhet2f/bKkc
         9GtPx3mL58jXq9BbovLaJfG3DFtno+ULYHHkimvq7JcFNCkbzg2D6b3huwFy2CEqdu+1
         vquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:arc-authentication-results;
        bh=lQcBRiOvTBZQJaxORFzlAmigtFWu0+DBqtQB4OuZR8Y=;
        b=EJCzvi3xovaEwHjslefBWy2qskidTWgKzMukt67L95w8REd5ysSn1Q3qrBDQ3RRNT2
         4I8Dmemy11z/OeISYENMY42ToJQcqQcFHiWgsqzvYc492bTtZl2T8NvZzSAj+XgFww6V
         2xyDWqyv6CzilVnQxBanSwLA6HFdTr/1y39fi8pqrYPVeoaKl6hYKc8GYP0Hcp34cwbd
         QX1gxbpMPyPy/oUNxGzqf7iZsZFEc9VRZ5lauFbruddh0uSuGR2payKOP8C5OVCC4b0a
         ZfcJoDA+UwKdaKuD0B/FEH+9xL6xFgX/jX+HhhmFsf9EMSchSeeV65bNCt7aP2p+uUzr
         lEaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 42si1949851plb.653.2017.11.13.00.41.26;
        Mon, 13 Nov 2017 00:41:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751836AbdKMIlY (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Mon, 13 Nov 2017 03:41:24 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10469 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751585AbdKMIlX (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 13 Nov 2017 03:41:23 -0500
Received: from 172.30.72.58 (EHLO DGGEMS409-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DKS69283;
        Mon, 13 Nov 2017 16:37:49 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.361.1; Mon, 13 Nov 2017
 16:37:39 +0800
Subject: Re: [PATCH v12 09/12] Move related hwpoison page function to
 accel/kvm/ folder
To:     Paolo Bonzini <pbonzini@redhat.com>, <mst@redhat.com>,
        <imammedo@redhat.com>, <zhaoshenglong@huawei.com>,
        <peter.maydell@linaro.org>, <mtosatti@redhat.com>,
        <james.morse@arm.com>, <lersek@redhat.com>, <marc.zyngier@arm.com>,
        <christoffer.dall@linaro.org>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
 <1510341591-22817-10-git-send-email-gengdongjiu@huawei.com>
 <3017b1b9-24d7-565b-1180-a0eb93c6d57a@redhat.com>
 <572b8361-ee14-35ed-6c85-a5e5d8ae5b1a@huawei.com>
 <b948cb25-dad9-ec7e-8406-b829d21cac26@redhat.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <85576ff7-5847-615d-787d-c7a652be024a@huawei.com>
Date:   Mon, 13 Nov 2017 16:36:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <b948cb25-dad9-ec7e-8406-b829d21cac26@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A020206.5A0959DD.0062,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 583cf0ec8b0ab2c0d0fa5c48ea179b46
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: m5LhGbIlEhCi



On 2017/11/13 16:27, Paolo Bonzini wrote:
>> If you think this structure should be added in accel/kvm/kvm-all.c, I will move it.
> It can be done later; but if you have to send a v13 series, I would be
> grateful if you included this change as well.
Ok, got it, thanks Paolo.

> 
> Paolo
> 
