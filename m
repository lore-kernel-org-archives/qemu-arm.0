Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3355744lfy;
        Fri, 31 Jul 2020 02:47:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs7xCEp2dz2Xmfyn84RW8mxh8LbDjXvcRb16RhoKe/AnF/78yEpla+nmqm3t2Uud/0DT2w
X-Received: by 2002:a25:a104:: with SMTP id z4mr5412643ybh.40.1596188850733;
        Fri, 31 Jul 2020 02:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596188850; cv=none;
        d=google.com; s=arc-20160816;
        b=hTeVs2MMPIEyUV8tV/0RM8juMOBsY1/s3ejIjrXai1GKppuOeW1xfjC/n6KftLDQIU
         7WM2rMgBSNc1L/5qbDGJCtL2++1v2KClmoBAzAFl73770jLL92JdLtKUhkDpuUrscBgN
         vZpeTmNirXSgf7/5qGrtnEdNK+nk0F1+JBdnwqc0Mdgqu8kaCJcLrkHDi8UTsGkCIy18
         U6f3QeYdA1DD+xI0NHoJmFL2Mkvt9rfxTW1BOyzCp4yBnh3bnYdyhJ2ISmZiXkdwJy8o
         ZLNaLvKUdS2drBWWX8A0tGhiI2k/PKjGgZZbyM4SPmU0j1kZgr04ue7jPdBEY5kf0P+w
         TPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tO62oqyYFXAABc1+xlCrGDLE5JMEv4dAt+OxOR6NLeg=;
        b=d4XEOqCO+7q2NjbOq4USuQalNrvNkJSrL0WBrd45GKKEIH+Uzj3iC/rtFQOkZl87Rh
         dxA+IZ9g5PocUZE5lQdTCYszf8l9GMAe71Kv7xpe5yW6g42H49fDGIXWn1hPPxCyRd92
         hyAjFMvBYk3d25WkOtdK5+o8Px3nBErhw0D79DbQTyOgrvwWg9pSBUFl+J9w+Gd1X43d
         Q4ACtbcBcIx5AVOS9DvJPbzYfteC2+rnYJeF4h30ujW1n/QycjE7oiR/0y2RUVStW7w7
         UWYxDDrITIKvGepqdaw+WXUbCkqKIJtL6OC9uzQfuDI7i2vw2afoncJOTIHF/5GOhkvz
         FAtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SduCl/CS";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7si8267314ybt.453.2020.07.31.02.47.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jul 2020 02:47:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SduCl/CS";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1RdS-0005yA-4f
	for alex.bennee@linaro.org; Fri, 31 Jul 2020 05:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k1RSc-0005xi-Tb
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 05:36:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31580
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k1RSb-0004KM-D2
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 05:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596188168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tO62oqyYFXAABc1+xlCrGDLE5JMEv4dAt+OxOR6NLeg=;
 b=SduCl/CS+G+rEmmOUm9U9kEm1Xlgkem0QEhl96tuSXblVQ5D/y5whj8r5xrjwinUHBkcMJ
 5ah7X8wTKNKRw00Wz3/wsSixPYLsNHCgPYLvH2QCoHWNSaVX+07CpjdJhf+KI1nj9EnVzy
 o5JkCo0I6ZsYgCVU00r8lqUw/mbu1Sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-Zf5DtDjvM369PnfCL-8xSw-1; Fri, 31 Jul 2020 05:36:04 -0400
X-MC-Unique: Zf5DtDjvM369PnfCL-8xSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E98C2801A03;
 Fri, 31 Jul 2020 09:36:02 +0000 (UTC)
Received: from [10.36.114.127] (ovpn-114-127.ams2.redhat.com [10.36.114.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A702D1C92D;
 Fri, 31 Jul 2020 09:35:52 +0000 (UTC)
Subject: Re: [PATCH for-5.2 v4 05/11] hw/arm/smmu-common: Manage IOTLB block
 entries
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200728150815.11446-1-eric.auger@redhat.com>
 <20200728150815.11446-6-eric.auger@redhat.com>
 <CAFEAcA-gMh43545mnHRoRLuAV63o3r-GWFBF+zYZfd4apfw_mQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0bf88eb1-c7d8-f81d-e8ba-7c8493c09070@redhat.com>
Date: Fri, 31 Jul 2020 11:35:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-gMh43545mnHRoRLuAV63o3r-GWFBF+zYZfd4apfw_mQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/31 03:06:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Will Deacon <will@kernel.org>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iKoEn0DFlW8l

Hi Peter,

On 7/30/20 3:38 PM, Peter Maydell wrote:
> On Tue, 28 Jul 2020 at 16:09, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> At the moment each entry in the IOTLB corresponds to a page sized
>> mapping (4K, 16K or 64K), even if the page belongs to a mapped
>> block. In case of block mapping this unefficiently consumes IOTLB
>> entries.
>>
>> Change the value of the entry so that it reflects the actual
>> mapping it belongs to (block or page start address and size).
>>
>> Also the level/tg of the entry is encoded in the key. In subsequent
>> patches we will enable range invalidation. This latter is able
>> to provide the level/tg of the entry.
>>
>> Encoding the level/tg directly in the key will allow to invalidate
>> using g_hash_table_remove() when num_pages equals to 1.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v3 -> v4:
>> - also use the tg field when computing the hash
>> - in the key equal function, compare the fields instead of
>>   using memcmp()
>> - fixed a couple of indents
>> - added Peter's R-b
> 
> You say that, but you didn't :-)

Please forgive me for the oversight.

Thank you for the review.

Eric


> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 

