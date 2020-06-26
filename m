Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp468241lfm;
        Fri, 26 Jun 2020 06:54:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhFERvB/oAb3122RwuemMOlwQkYxxafK5IG6pITBTZMCYcPNtHnEcjtnquVI6zxbvArqm7
X-Received: by 2002:a25:d689:: with SMTP id n131mr5307002ybg.523.1593179642574;
        Fri, 26 Jun 2020 06:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593179642; cv=none;
        d=google.com; s=arc-20160816;
        b=IT0JbZKQRuLF7JPwgxULQvjeXLKFJaxtbemryDVp2FixwlfE49BOaLylrsu7XltgPQ
         9YPDrCF5sz07NOXrbiA3biDYq1IQS68NeRwsTIsKBdNgK2q9pkkg3HmIeJX3YTT+eK/K
         P1tZAFlIn7HdNyQC5vf6dTS/RkJgx6RX26t6Xbk4kBJp5q1gkQO6i7PJZWupBi2jdO2/
         lVgyTsSErAneCc08/ktm22/1JTM646794qjWRPr+tRye5Dz4mNFTmaGNNc0NEh6M+UTj
         23DVyxt3jGqhdHqePD6dS0VLSHbd6u4AgsxRnNX1mdHs5x4czZAyLiCLc119dn2tn+45
         N3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=mn1ydtPGwBAJexQ9to2YqXw29q/oVmls3ki6AHaXg4U=;
        b=DHXzwlC+SgsowROPlzRlj6Tc6dCUBGQjY25urd/e7DAYknoAFylvinHUHkwzyG8VDQ
         unSxIMPakppjlzhSKEkeXDi52Ye4o79+IjK9hRxw/fLPDBne3vlGUIz7owDQfdbo9UyQ
         P36vugFIl7a7nWsI7WF/cs+QscA9JI51iIzRHHLNCKj1C4peu5MHsIh4A5KCXp/DyHBq
         jM1/BGUCYvdpTT/XUFsXsloUcxh1ItyokcY2r1p4mAUTgWvMAvwWFp744UAz8N8OxLqv
         cZQS7+hMUJTp1KczmX1HmAe1+XrCbvwcCt79wPQsOlJwKnkVuKITlzi4TLZE7hiqhjmt
         fZYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D5kEdFbh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si24725104ybn.417.2020.06.26.06.54.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 06:54:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D5kEdFbh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joonq-00029O-0F
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 09:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jooni-00028Z-Nk
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 09:53:54 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23065
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1joonh-0007N6-4a
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 09:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593179632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mn1ydtPGwBAJexQ9to2YqXw29q/oVmls3ki6AHaXg4U=;
 b=D5kEdFbhRcoRrMa0ceKax+IPhgCoZ5rExgG4qWaZipasqSavkujqvZcl3dcqgVMr8oztaZ
 YMDnFt14EaCdkGg+/o61+hk2hURqakmFZZoUhL35Wjk/VAiHxBuXPw0dvJqS5D2hhlJcgi
 uwDL7E1A2kkVYSOicN6mR4/TSh7rNrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-EO0arRRbOVGbIxBLzjvxGg-1; Fri, 26 Jun 2020 09:53:48 -0400
X-MC-Unique: EO0arRRbOVGbIxBLzjvxGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF6681005512;
 Fri, 26 Jun 2020 13:53:46 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5C9B10016E8;
 Fri, 26 Jun 2020 13:53:38 +0000 (UTC)
Subject: Re: [PATCH RESEND 3/9] hw/arm/smmu: Simplify the IOTLB key format
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-4-eric.auger@redhat.com>
 <CAFEAcA-+eFh7q5-gQwTWxMCSV38ErwB-GZoigW+_sP-=Pmp1kw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <848a0cab-ec2c-5004-d9b8-79d4678e0db5@redhat.com>
Date: Fri, 26 Jun 2020 15:53:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-+eFh7q5-gQwTWxMCSV38ErwB-GZoigW+_sP-=Pmp1kw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 02:19:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s83cQeXpuawQ

Hi Peter,

On 6/25/20 5:03 PM, Peter Maydell wrote:
> On Thu, 11 Jun 2020 at 17:15, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> Instead of using a Jenkins hash function to generate
>> the key let's just use a 64 bit unsigned integer that
>> contains the asid and the 40 upper bits of the iova.
>> A maximum of 52-bit IOVA is supported. This change in the
>> key format also prepares for the addition of new fields
>> in subsequent patches (granule and level).
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>> index 1dceec5cb1..7b9d2f0eb7 100644
>> --- a/include/hw/arm/smmu-common.h
>> +++ b/include/hw/arm/smmu-common.h
>> @@ -88,11 +88,6 @@ typedef struct SMMUPciBus {
>>      SMMUDevice   *pbdev[]; /* Parent array is sparse, so dynamically alloc */
>>  } SMMUPciBus;
>>
>> -typedef struct SMMUIOTLBKey {
>> -    uint64_t iova;
>> -    uint16_t asid;
>> -} SMMUIOTLBKey;
> 
> I think we should keep the SMMUIOTLBKey type to abstract out what
> the key type is under the hood, so it would now be
>  typedef uint64_t SMMUIOTLBKey;

OK
> 
> (and then the code that works with SMMUIOTLBKeys should never
> directly look at it as a uint64_t. If you wanted you could
> put the abstraction layer into place with the existing
> SMMUIOTLBKey type and then change the type in a second patch.)

done this way

> 
>> +uint64_t smmu_get_iotlb_key(uint16_t asid, uint64_t iova);
> 
> This should return SMMUIOTLBKey rather than uint64_t,
> or pass in the pointer, like:
>    smmu_get_iotlb_key(SMMUIOTLBKey *key, uint16_t asid, uint64_t iova);
sure

Thanks

Eric
> 
> thanks
> -- PMM
> 

