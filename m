Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3257585lff;
        Thu, 19 Dec 2019 23:34:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqw6jpIAB1DpD/kEpjc1pW0z+bl1fp0kRvZKFPDtVd5KI4CcDZmWv4LKxpJuhhKNpB+GcTpZ
X-Received: by 2002:a05:6830:300d:: with SMTP id a13mr13008513otn.182.1576827272451;
        Thu, 19 Dec 2019 23:34:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576827272; cv=none;
        d=google.com; s=arc-20160816;
        b=oEXZjN57GI4peldjEjsYmGsntUbxl7KXU6k7I3TD7esO5RzUVPCbiTm11wN40/AE1J
         xI6zQcFM1Yuu0MDS2lXtBawMbdNaa1qg8RbOgjQtORXRe07qABOcdy5e7Djca2i3EsCN
         U/uB7VIieMaWmNOjZ99CfbF7Jr8A+14MyQDqNAC3FdENZ+FJBeny4MilGDoIrBPah9lw
         SdnaXMk4v6BXavyPhfDZ8Cz5cSffoS2UmzM3k3A/iSMFQM8CPqTg2wmExct+rBqA1hpP
         NROAPH6tWC8Xz/zi9fUwCxv3dyVWqHaYSo3HF8awWc9vy9dikibwI1zQcTIvKhePEep9
         YBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=Tn+wSzZ1/K4XGADn0ztxq8cBcrot1xjTOfrW0v6Kug4=;
        b=AHqep05VKU7WKWghwLh9GP4F6V5uxLaam5HFD5FZD2K7dw9Qt+RbJweNWN5RyF1XAq
         hBRPFuG4oeP/Lua46ZncQHSWVy3nzjRo0U2XEGy4CNs/WLREvUI1UC9Sdb+O+fNCP9rk
         fGL0/vYbN5J1v3RPhKsCNbzSFBqNEUMOfAgvTXPdCXISALKLD4610U0le78LSshrB3yB
         Buq+sQwV8xw1t61KubOMO3NjL1zgbEvYXd8Mq36YBlUgiSl7eB8Aiu0hfaY7Ye0Bb8iY
         UVDOV2cjxNkVno7HZMcXAmRFRhf5TL/q/SzT4yRdiGNcMYddT8DzNX3nX6DeT0g1j+Tl
         NkBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v25si2849368ote.261.2019.12.19.23.34.32;
        Thu, 19 Dec 2019 23:34:32 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfLTHeb (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 20 Dec 2019 02:34:31 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8160 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725874AbfLTHeb (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 20 Dec 2019 02:34:31 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 3DF20FFEDCEF0B4DF2E7;
        Fri, 20 Dec 2019 15:34:29 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Dec 2019
 15:34:22 +0800
Subject: Re: [kvm-unit-tests PATCH 05/16] arm/arm64: ITS: Introspection tests
To:     Auger Eric <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
        <maz@kernel.org>, <kvmarm@lists.cs.columbia.edu>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>
CC:     <andre.przywara@arm.com>, <drjones@redhat.com>,
        <alexandru.elisei@arm.com>, <thuth@redhat.com>,
        <peter.maydell@linaro.org>
References: <20191216140235.10751-1-eric.auger@redhat.com>
 <20191216140235.10751-6-eric.auger@redhat.com>
 <c133ebe6-10f4-2ff7-f75f-75b755397785@huawei.com>
 <6542297b-74d2-f3c2-63d8-04bb284414df@redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <c164db0f-2e18-093f-8886-4746cb197fe2@huawei.com>
Date:   Fri, 20 Dec 2019 15:34:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <6542297b-74d2-f3c2-63d8-04bb284414df@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Eurgj2Gqzy9S

On 2019/12/18 16:34, Auger Eric wrote:
> Hi Zenghui,
> 
> On 12/18/19 4:46 AM, Zenghui Yu wrote:
>> Hi Eric,
>>
>> I have to admit that this is the first time I've looked into
>> the kvm-unit-tests code, so only some minor comments inline :)
> 
> no problem. Thank you for looking at this.
> 
> By the way, with patch 16 I was able to test yout fix: "KVM: arm/arm64:
> vgic: Don't rely on the wrong pending table". Reverting it produced an
> error.

which is great! Thanks for your work!


Zenghui
