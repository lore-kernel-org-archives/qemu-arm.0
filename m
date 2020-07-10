Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp533512lfm;
        Fri, 10 Jul 2020 03:05:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRmnLti5n4cQui8XhWC6upXnkfTOqyK9uPz5XnCVdLXckXcf+sV8gD87b1z6HoULJDiPWo
X-Received: by 2002:a25:9302:: with SMTP id f2mr5854058ybo.238.1594375532255;
        Fri, 10 Jul 2020 03:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594375532; cv=none;
        d=google.com; s=arc-20160816;
        b=ABnNaeQ+JSm5BpOX2aqtJH1MeKk69vUitIbcnFK4g3JzHOpNDDpzFf8IHv9yoBirrG
         xHdwlO4p7qEV1KmfFEl89URyF+yHyeCPBuI0OXWar6BK0ts7ueF8YZ8g/p9pamDJyTop
         eUtn2Cr0ujI/BfXFdzzdUIpZLoLrc9vokCEJIo9GV4RbD3SaP69iI3e2twwpPXgpzJ91
         Z96ByXvokW/j4XPuaQIdNkP1Hjqbrzuv2Znc2vJZ97RYJlKSh0zcgGhGqwVdCvNa4xMF
         YzVOOA9gt0qpDKWqU4qLssxsGplLI18NcAj35QnUXAV/xifTPhGfkUZLgbH78SJFPNu5
         Slbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jdoClQRd0kYRbTPnH/mx31fwlDLsWEJ/umer1a6uy3Y=;
        b=RGtjECrc8Lhtns3sbkG6iLAChHYQaIE8PNyE6cTv77x/dnKqo43laRyBS0vMub5esc
         DXjmby6cbbdTtGFhTGnFgKluHCd9L3Hj0tXGIRYt/H9s0Q50WJ4gKn6B4J4V3zQg56u3
         +PVaft0diJ1rsBf0r4s3sjFL6EtoED8Og/jmn6tu3BtVg2atBIL91OISix9XogpY6Txp
         RX2uBSRUeBoDoV1DOJ2bZzTdT3I5jHfljuRsGPwDGBwPT/O6YiRDelVHakh4PPmFza3D
         LN2/tPGVE22orvlzgi0hVxR8AoaTYwKEUfpvJC+dCqbyxWVZg8ccaLVk0QbS5vMmW4UB
         T6vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AqofYet2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20si5267875ybj.55.2020.07.10.03.05.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 03:05:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AqofYet2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtpuN-0003xc-Kd
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 06:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jtpuG-0003xB-2s
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 06:05:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21206
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jtpuE-0000Ws-0j
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 06:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594375520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdoClQRd0kYRbTPnH/mx31fwlDLsWEJ/umer1a6uy3Y=;
 b=AqofYet2InTs45m6cqFeR8o2g8O99J24KlmMjxXFTK4V6/k1s09Lz9cL8MZslheehb1sC9
 zmaIbgr3g5gfNxY24gAZby2fcVOp28q7Od6vcBKqGFLjJbyqlwlY/IK9ij9TIJjckQ291l
 z3PhCW92Hhj3PHzKRcvz8svRmHD0XEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-syxqKGvbNIGxddEvLqyp8g-1; Fri, 10 Jul 2020 06:05:18 -0400
X-MC-Unique: syxqKGvbNIGxddEvLqyp8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E6C51083E82;
 Fri, 10 Jul 2020 10:05:14 +0000 (UTC)
Received: from [10.36.113.241] (ovpn-113-241.ams2.redhat.com [10.36.113.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BE9560E1C;
 Fri, 10 Jul 2020 10:05:06 +0000 (UTC)
Subject: Re: [PATCH v3 11/11] hw/arm/smmuv3: Advertise SMMUv3.2 range
 invalidation
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200708141856.15776-1-eric.auger@redhat.com>
 <20200708141856.15776-12-eric.auger@redhat.com>
 <CAFEAcA-zXyzq5ph3U0vFuqRz9=NEq-piw_9gsYbrwg=+g9nbXw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <41b72b3d-e0b5-f6b1-69a3-2940246447d7@redhat.com>
Date: Fri, 10 Jul 2020 12:05:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-zXyzq5ph3U0vFuqRz9=NEq-piw_9gsYbrwg=+g9nbXw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 04:36:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Will Deacon <will@kernel.org>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xA4wl9WwHVw2

Hi Peter,

On 7/10/20 11:47 AM, Peter Maydell wrote:
> On Wed, 8 Jul 2020 at 15:20, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> Expose the RIL bit so that the guest driver uses range
>> invalidation. Range invalidation being an SMMU3.2 feature,
>> let AIDR advertise SMMUv3.2 support.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> I think that to advertise SMMUv3.2 we would also need to
> set the IDR3.BBML field to something non-zero. That means
> we need to analyze our implementation of the caching of page
> table structures to see if we need to do anything different
> (per the behaviours and guarantees described in section 3.21.1
> of the spec).
you're right. I need to further study this feature.

I felt difficult to find out which features are mandatory for a given
revision number.
> 
> Alternatively, we could take advantage of the language
> in section 2.5 that says that a v3.x implementation is
> allowed to implement features from v3.(x+1), and just
> set the RIL bit while leaving AIDR advertising us as v3.1.
Indeed :-)

Thank you for the review!

Eric
> 
> thanks
> -- PMM
> 

