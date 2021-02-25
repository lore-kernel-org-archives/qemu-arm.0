Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp506726lfg;
        Thu, 25 Feb 2021 08:34:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz916d9GDP0MVumhqFDMq3NYJcG34yQu11xsLtp1S3GLEj44VDx1MeQ4X0uBhysTGs19QYm
X-Received: by 2002:a05:6602:20d5:: with SMTP id 21mr3418333ioz.100.1614270884573;
        Thu, 25 Feb 2021 08:34:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614270884; cv=none;
        d=google.com; s=arc-20160816;
        b=TWNH9vA3E3Q0yi6SzwJQtk3GEFIvrZRCRUH3QJEcOla36xZnwctON5uiTqusYaefGF
         g66XJ4W/zteA1VycD4uj62C23Q9IOAreiHc2o0RrZMmlcffd84uPEVjrIkQZAkdyhVxl
         Qk2yPyH+1kHF9zEqZoQBta/i2F0tqJ8Y+SP7tfI9MOJZlxi3qdigtcNJqK08rXG8zSRP
         pTHFEAFwVBdEnP+/gUjV5istk+6Ki+vcXVteWcjg1M4bou9T+QN9POFt80huLIteSfsm
         h0Xh/GDfOevHVzHkpSVy58qtfDVyV+EayOaPIQLjE5/X2LuiQQbahlYc9v/LvO9w/OUt
         rRjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TDBtJAKM1hfJ0ZC5sq+ZLKQyEG0Bd3zlsgkwaHiNwHM=;
        b=IIoH+2IxHCVMXGwHKZ3Zg/EaIii4meOkYp/9JIDa+E95riPS99Vj49ywOtKJx2wX+Z
         Lf/GTk2R0u+Xhs1TTr9xXR3nJwaFi21xV2Gh8hWWnhOzFcFwIhnduZitTp1E9+3AVT/M
         XhqMoi09qgqakTzdx5zrImGXqpPdLGk+2ZfiT9dwQzsvDH2L3go6UBSsjc2YkFWsTxkL
         KrGKJJvec1lU0HDHSN6D7WtejRh1CRZ1eDuyq5NwcT7waeh8bi8eR1MISvpBkvCd1uTu
         NlxaCt7HrDlRZCv5GZ6D2gG/lvJtUMbRSOsC/h+I6w1DS6urChXmkSLVhOvMRAC7uRBG
         Ha2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HAoj1yxN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si5302799jat.117.2021.02.25.08.34.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 08:34:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HAoj1yxN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFJb9-0005eI-SZ
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 11:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFJaw-0005aw-D2
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 11:34:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFJam-0003F9-0T
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 11:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614270857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDBtJAKM1hfJ0ZC5sq+ZLKQyEG0Bd3zlsgkwaHiNwHM=;
 b=HAoj1yxNc8uShV5/VuPPtS8Sf5D5IXq2HpUlAwlRslInJEZ4TsrPpaSUF4ljJLyHQUm27W
 q1BjKGX5NuDcTydMIMAMDjN5LknhGXer0IAjMfNMXhwiPE2irXQZdcbRy22HIxFQFA8sU2
 6QL1fIUQEYmE8E5OJf09HFYaCztNz58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-LaDyMwwMNoumiUDW88VYgw-1; Thu, 25 Feb 2021 11:34:13 -0500
X-MC-Unique: LaDyMwwMNoumiUDW88VYgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EA10835E23;
 Thu, 25 Feb 2021 16:34:11 +0000 (UTC)
Received: from [10.36.112.150] (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1418A60855;
 Thu, 25 Feb 2021 16:34:00 +0000 (UTC)
Subject: Re: [PATCH v2 1/7] intel_iommu: Fix mask may be uninitialized in
 vtd_context_device_invalidate
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, jean-philippe@linaro.org, peterx@redhat.com,
 jasowang@redhat.com, pbonzini@redhat.com
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-2-eric.auger@redhat.com>
 <2e75abf8-55e4-b5db-7ca2-6e0408bf81e6@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <420d0048-e2a9-2571-9f4c-45341c7a3355@redhat.com>
Date: Thu, 25 Feb 2021 17:33:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2e75abf8-55e4-b5db-7ca2-6e0408bf81e6@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jxe5ZcGR8gdm

Hi Philippe,

On 2/25/21 11:08 AM, Philippe Mathieu-Daudé wrote:
> On 2/25/21 10:14 AM, Eric Auger wrote:
>> With -Werror=maybe-uninitialized configuration we get
>> ../hw/i386/intel_iommu.c: In function ‘vtd_context_device_invalidate’:
>> ../hw/i386/intel_iommu.c:1888:10: error: ‘mask’ may be used
>> uninitialized in this function [-Werror=maybe-uninitialized]
>>  1888 |     mask = ~mask;
>>       |     ~~~~~^~~~~~~
>>
>> Add a g_assert_not_reached() to avoid the error.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/i386/intel_iommu.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
>> index b4f5094259..3206f379f8 100644
>> --- a/hw/i386/intel_iommu.c
>> +++ b/hw/i386/intel_iommu.c
>> @@ -1884,6 +1884,8 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
>>      case 3:
>>          mask = 7;   /* Mask bit 2:0 in the SID field */
>>          break;
>> +    default:
>> +        g_assert_not_reached();
>>      }
>>      mask = ~mask;
> 
> Unrelated to this patch, but I wonder why we don't directly assign the
> correct value of the mask in the switch cases...

After reading the vtd spec again, I think this is aligned with the spec
description.  FM = function mask encodes the bits to mask. Then you
actually compute the mask by ~mask.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks!

Eric

> 
> set the mask
> diuse the
>>  
>>
> 

