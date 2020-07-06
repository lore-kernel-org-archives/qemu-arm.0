Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp172614lfm;
        Mon, 6 Jul 2020 10:17:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKUnhrWYOsSGrfdeLXDHqg/x1aUOzaZpBIY2lg50kOB/aA1LU1v89wWq2UwNCCpnktJDvD
X-Received: by 2002:a25:338a:: with SMTP id z132mr18199129ybz.316.1594055865508;
        Mon, 06 Jul 2020 10:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594055865; cv=none;
        d=google.com; s=arc-20160816;
        b=pSOUPXGk6rhTNIWnkNtBK0UIZHtVaPashKNwbYCMLXj6CbkiwG6pT3EPOpJieSVxn7
         3cKQFKq+ZGV/dxDEd+cIPlb89AR/PdX+j7eFdME7oxLx2IS/x8uRWp029ZU/Lx3CGCQD
         7t7jGw7G7Qj6ub+Jx6o55XrAlno5M9wf5EOoIBI53WqrhXMoSyLaSLV37k4sC8AP/eyM
         6p8NIvbuht3SqxggxU56KnRC9ryKeXiFvt8NKEFJ76TcqGzklO5RT/6En3qG5EedyRjL
         P3OJDQWk4SBnTez4UKI0eGY2ylg5DtJjnuGmecrArE4mA17go5P3JOv6oCCfMACGMhdC
         VWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=moO3+lGkJ2sBGKmNWn7n87wS9tUDIgtnaNaBNy+qKy8=;
        b=II3zmYV1W9nrb1BklS89FUwoFf2sO0l1+0uBI1ClHZufbozOtaVqfG8e2VeamdIAd6
         9FiT+N7YfyPosNUaBWQt8hWypPWK31zZtisH0v3AaxazvqdMsnNAPwtWhV7hT+lAEJEi
         y99R1zWnKlHCNR1rWYMjVVnCRWxKJbSBdV6sryVl8zfQeHn2AdWDMG5q/rJ8o5TJwPBy
         VtfVgul7Uh70jCYFJWBvA7w1FCtk4Kw/YniBmqhqTLpyozog9+Iwo0Sw1CzSOga4vTA7
         JENuoQkCsq9/FJ0v2DYafQK99UVlndWGrtBJY6DMJoVarHpF33bHbmql/gYRGmrh14M7
         rbLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZXiliWdW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71si21636925ybe.370.2020.07.06.10.17.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 10:17:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZXiliWdW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsUkS-0001er-U0
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 13:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jsUIG-0007Zy-PJ
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:48:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52638
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jsUIE-0004Jp-1l
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594054113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=moO3+lGkJ2sBGKmNWn7n87wS9tUDIgtnaNaBNy+qKy8=;
 b=ZXiliWdWpfbfryFVzo5PMzijwCMOhu/CG0B444JwNwzNRlkWBlIK5qLr2Cl6WqOe3NpGsT
 ZwxgTf208QtPpgYACRbBtuI7pocxw1cxpTJeAQo52mpzGJq6uDss8QXf8wBqL9kESh4pRf
 MvhW4eVbNQBsRxAVAwWWGg3srQqQmuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-iTRLvVAZPM6FyUykgXLYyw-1; Mon, 06 Jul 2020 12:48:31 -0400
X-MC-Unique: iTRLvVAZPM6FyUykgXLYyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0298100A8E7;
 Mon,  6 Jul 2020 16:48:29 +0000 (UTC)
Received: from [10.36.113.241] (ovpn-113-241.ams2.redhat.com [10.36.113.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D9B660C84;
 Mon,  6 Jul 2020 16:48:21 +0000 (UTC)
Subject: Re: [PATCH v2 9/9] hw/arm/smmuv3: Advertise SMMUv3.2 range
 invalidation
To: Robin Murphy <robin.murphy@arm.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 peterx@redhat.com
References: <20200702152659.8522-1-eric.auger@redhat.com>
 <20200702152659.8522-10-eric.auger@redhat.com>
 <10bafac8-a230-c545-662c-bcbd9f3902dc@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3f4dce7c-14e9-f97f-1de5-d39a501bd229@redhat.com>
Date: Mon, 6 Jul 2020 18:48:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <10bafac8-a230-c545-662c-bcbd9f3902dc@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:52:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: jean-philippe@linaro.org, mst@redhat.com, zhangfei.gao@foxmail.com,
 shameerali.kolothum.thodi@huawei.com, will@kernel.org, robh@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +54KMTIJsNT9

Hi Robin,

On 7/6/20 6:18 PM, Robin Murphy wrote:
> On 2020-07-02 16:26, Eric Auger wrote:
>> Expose the RIL bit so that the guest driver uses range
>> invalidation.
> 
> Hmm, this is a v3.2 feature... so strictly, in order to advertise it you
> would need to claim at least v3.1 in SMMU_AIDR and implement all the
> mandatory v3.1 behaviour ;)

AIDR is not modeled at the moment in this emulation code.
I do not see it used in the linux smmuv3 driver either. I can initialize
it to 0x2 for the sake of completeness.

With respect to the 'mandatory features', could you please help me
determining what are they. Most of the features that would impact this
emulation code look optional to me (52bit support, PBHA, MPAM).

This emulation code is tested against the latest linux kernel.

Thanks

Eric

> Robin.
> 
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   hw/arm/smmuv3-internal.h | 1 +
>>   hw/arm/smmuv3.c          | 2 ++
>>   2 files changed, 3 insertions(+)
>>
>> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
>> index 5babf72f7d..4e7ec252ed 100644
>> --- a/hw/arm/smmuv3-internal.h
>> +++ b/hw/arm/smmuv3-internal.h
>> @@ -54,6 +54,7 @@ REG32(IDR1,                0x4)
>>     REG32(IDR2,                0x8)
>>   REG32(IDR3,                0xc)
>> +    FIELD(IDR3, RIL,          10, 1);
>>   REG32(IDR4,                0x10)
>>   REG32(IDR5,                0x14)
>>        FIELD(IDR5, OAS,         0, 3);
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 89ab11fc36..add4ba4543 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -254,6 +254,8 @@ static void smmuv3_init_regs(SMMUv3State *s)
>>       s->idr[1] = FIELD_DP32(s->idr[1], IDR1, EVENTQS, SMMU_EVENTQS);
>>       s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
>>   +    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
>> +
>>      /* 4K and 64K granule support */
>>       s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>>       s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>>
> 

