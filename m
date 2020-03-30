Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2665497lfi;
        Mon, 30 Mar 2020 05:21:12 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsNz20Wxdh1oQu+AacYmg7YtJx8STgeaiLIHtuP37EaFXw3FFamAwwrtwVOGJEfTXONSKv8
X-Received: by 2002:a4a:da03:: with SMTP id e3mr9463932oou.4.1585570872680;
        Mon, 30 Mar 2020 05:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585570872; cv=none;
        d=google.com; s=arc-20160816;
        b=CpU55jrFtpmmtZLxpHmIjeK41bR4rVupMn39LTws+7D7dPzXe6QmEHJyyWsYYdofEF
         4lNz7Sg84VuPR+Io3eyNOLYUS2LB92Z3FlOQxhqbHYIuThPtjwiPhSOtMM4oBQHiyzwv
         8w2y+DelWkEpyRkU+QIIkwLEIhzmTpl6PeRQg74N/Owis1NkoaIsLYlVHQ0Vii9xLw8C
         bWHb9vlz00jBnmpSNQsOJQB93gvJIwIeAqYkVaSfWAc9DO1vdT1jU4Vx7DodSLkZ7hlC
         NKVZAZP5rgPmhuWYXJpsRhvUTouQHjfmz9sLt9enw76TS+H3ghQvtk0HyilMZsZPkCGM
         8TAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=mj1FVXGG7ubeOqRN0hbzWsTsxBt+2WyIZXyc14RnRqg=;
        b=akUUTvvKpRlEciR6f6B+BHX7zLD7eOkswyUDEfgXcjeG59Hryur8kjD4zmHlYizUQz
         +QWt98UX9+XZ0zhMfsU7iZbiVa4RqciNwLw7VAaU0vWnz6XhoPMjFJBk3jh3teyDXWDl
         hmdTsn06CYwVYwS3Trlk98+PQBKprcRBped3K7TkS3T+RvbpgWe2Vl1eDhk/t8pRg5UG
         r9DcHSM8gyJ3CX44TQAXyX9rr9O8b71zOBHlvocmhYagiV4Nqwjuc3wYubOQiQkoAK9v
         toGUBmY72vYX48mcESUYY/FDBFdPm01ncA6IgL2v2xUEgcAFJHvISOHH99CtDb/cAFeJ
         +aTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 184si5473951oig.33.2020.03.30.05.21.12;
        Mon, 30 Mar 2020 05:21:12 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730039AbgC3MVL (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 30 Mar 2020 08:21:11 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:12652 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729848AbgC3MVL (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 30 Mar 2020 08:21:11 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 4EDC38D557AA0DF61F53;
        Mon, 30 Mar 2020 20:21:05 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Mar 2020
 20:20:58 +0800
Subject: Re: [kvm-unit-tests PATCH v7 06/13] arm/arm64: ITS: Introspection
 tests
To:     Andrew Jones <drjones@redhat.com>,
        Auger Eric <eric.auger@redhat.com>
CC:     <peter.maydell@linaro.org>, <kvm@vger.kernel.org>,
        <maz@kernel.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <andre.przywara@arm.com>, <thuth@redhat.com>,
        <alexandru.elisei@arm.com>, <kvmarm@lists.cs.columbia.edu>,
        <eric.auger.pro@gmail.com>
References: <20200320092428.20880-1-eric.auger@redhat.com>
 <20200320092428.20880-7-eric.auger@redhat.com>
 <947a79f5-1f79-532b-9ec7-6fd539ccd183@huawei.com>
 <8878be7f-7653-b427-cd0d-722f82fb6b65@redhat.com>
 <20200330091139.i2d6vv64f5diamlz@kamzik.brq.redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <9f3951c9-8ff6-531f-e9a5-abafdab5fef8@huawei.com>
Date:   Mon, 30 Mar 2020 20:20:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200330091139.i2d6vv64f5diamlz@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Um294fzVKmG0

Hi Drew,

On 2020/3/30 17:11, Andrew Jones wrote:
> On Mon, Mar 30, 2020 at 10:46:57AM +0200, Auger Eric wrote:
>> Hi Zenghui,
>>
>> On 3/30/20 10:30 AM, Zenghui Yu wrote:

[...]

>>> Otherwise I think we will end-up with memory corruption when writing
>>> the command queue.  But it seems that everything just works fine ...
>>> So I'm really confused here :-/
>> I was told by Paolo that the VA/PA memory map is flat in kvmunit test.
> 
> What does flat mean? kvm-unit-tests, at least arm/arm64, does prepare
> an identity map of all physical memory, which explains why the above
> is working. It's doing virt_to_phys(some-virt-addr), which gets a
> phys addr, but when the ITS uses it as a virt addr it works because
> we *also* have a virt addr == phys addr mapping in the default page
> table, which is named "idmap" for good reason.

Thanks for the explanation :-). I will have a look at the arm/arm64 mm
code to learn it.


Thanks,
Zenghui
