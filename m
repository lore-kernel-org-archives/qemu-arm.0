Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp581639lfa;
        Thu, 15 Oct 2020 06:33:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjC3sA+Wa6K0WgU4OccLpggEVVVESblZpLfWS1gW+c03YPNbDcdtZyf6Kebs7T+xw44Oay
X-Received: by 2002:a25:ba81:: with SMTP id s1mr5992972ybg.0.1602768816732;
        Thu, 15 Oct 2020 06:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602768816; cv=none;
        d=google.com; s=arc-20160816;
        b=uUfyxTr14fJN91A9H6iOCxoxKHOC2bwJkDARLyjBzDH4QWAVeUuzkXqpunddDRPQxD
         HNYchUK5KdB7tlggR40UaccxE5y7pe0jyCn80gPssQqcU/rabW9aIsS7jaWyOTkhC+kJ
         73koaXe89wQESzxf6u0xc6bIN/Xmx1eal225fia2MdLLV60GX+f+xMVW0JutVV5AZ8mR
         K6TxslHy30ZTyDriFKeXhLb8To3cNvfbBXFiK2IqoNYWMzdBNGm3sarW32t4X8puK1BS
         tbVCxSBenlIeAru2DC9ftwrtyZ/c+jkQpEpaMRin+7DtmMFTn/08SKhjBNeZwz5j1Oss
         hIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=zlH9AbW2nMap1YXCmxMKaftOvfQfspTNqbpp84Phbfw=;
        b=jBInfPh5ME8DOioiZk2s1a8cfDXo+x9WYw05xHvgxdW/2p/LzOz8AnohCryCA2zKpW
         ohWytbXamdMjmyd8PciwB2PIQ76/ireb1quqzXyAAnpFkW6cdYeuR4+TOKKisLmTN7pM
         AsCHusShuxs+OGYxIC8f/zcvlWz7vQwEKbYvszYPBbuy6h3S4cu5fVJ1guJEF95GkK08
         LGUJPj0nuuek4/HKf5j3Mca1xZ/naDx+K3xrCBxNaCAbbS2tqZeUoXq/rUuA+dLTCokN
         +U1xZZpT51cCP0k2IpfNsGkpLoaEn5/ydFMcvkhfSEHefYQ/wwR+bYhXRiC/cw7Su/LR
         dfXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SLa84P2b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q128si2540960ybc.121.2020.10.15.06.33.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 06:33:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SLa84P2b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kT3Nw-0005tQ-56
	for alex.bennee@linaro.org; Thu, 15 Oct 2020 09:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kT3MV-00058g-Vc
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 09:32:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kT3MT-0007nv-V6
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 09:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602768725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zlH9AbW2nMap1YXCmxMKaftOvfQfspTNqbpp84Phbfw=;
 b=SLa84P2bYvFlC9f1OoAnak+e8It9NEkQolRA1/w99ne5EQ676ZV/cEGnU0a4u4V4ezCzLz
 3o6B1zOt01GMWtpeJ7dZXyOamZCBofNquuO92LW34RGNkNBiRwuRDlUi0xGqeo75FPPaLn
 mxlRAQRjklhi5fJr8EN/lVluYuH89+4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-_1ZDziPWNmSfM_-6YcO_BA-1; Thu, 15 Oct 2020 09:32:03 -0400
X-MC-Unique: _1ZDziPWNmSfM_-6YcO_BA-1
Received: by mail-wm1-f72.google.com with SMTP id c204so1869918wmd.5
 for <qemu-devel@nongnu.org>; Thu, 15 Oct 2020 06:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zlH9AbW2nMap1YXCmxMKaftOvfQfspTNqbpp84Phbfw=;
 b=ft8paauPhMfih93oc3x56ipScsYlRv/pSezc5xM9fWVRE1F1Plz915E32GTYBSksPd
 MLtyNu1FaoFwQnnEUVpieD1aiDSsO4iDyyk8CQfIiWTddd/Amb/pLJ7KsG+j/rVM+PBP
 3u88pYRxEU56FKY2FHY/wgLNDJH8qMYvBdo2nROQdlRdbqlRfVa7IQdyUY4u/kXSxhKY
 sJGZ8E2AlET4Y94jtk0SGsDWjzFLW3tuMeQAT2NXxHUQie3xLe+M7fdMxrDfD6j1nbmg
 hqvkdjVk+DgLTw00hh+2c5yhTg5Wy5+tr8KMQXlYBYOpLc3bbu/4DJM75zfsfWeB03xT
 BdbA==
X-Gm-Message-State: AOAM530lMNtZ6zigxAnfjdZkyxo31tb56IbswNtUDakcM5xBhbdK3Lbu
 E3b2WpSmIGDw7LPfwdDReusiRb8IHi6zISMh5jNXzfh/nuG1MYzm+pZJk/pjNVfSvMGaji5fjOR
 pd9dsTHJr3zYhoDM=
X-Received: by 2002:a5d:6904:: with SMTP id t4mr4628378wru.410.1602768722053; 
 Thu, 15 Oct 2020 06:32:02 -0700 (PDT)
X-Received: by 2002:a5d:6904:: with SMTP id t4mr4628355wru.410.1602768721850; 
 Thu, 15 Oct 2020 06:32:01 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id v4sm4405771wmg.35.2020.10.15.06.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2020 06:32:01 -0700 (PDT)
Subject: Re: [RFC 1/5] block/nvme: use some NVME_CAP_* macros
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanha@redhat.com,
 fam@euphon.net, alex.williamson@redhat.com
References: <20201015115252.15582-1-eric.auger@redhat.com>
 <20201015115252.15582-2-eric.auger@redhat.com>
 <ca512856-40a7-01a6-ec82-3a5b8c81b52a@redhat.com>
Message-ID: <e479e77c-9061-22a4-eb57-3997a3a4910b@redhat.com>
Date: Thu, 15 Oct 2020 15:32:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <ca512856-40a7-01a6-ec82-3a5b8c81b52a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:38:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.019, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qheM8pZGHkWK

On 10/15/20 3:29 PM, Philippe Mathieu-Daudé wrote:
> On 10/15/20 1:52 PM, Eric Auger wrote:
>> let's use NVME_CAP_DSTRD, NVME_CAP_MPSMIN and NVME_CAP_TO macros
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   block/nvme.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/block/nvme.c b/block/nvme.c
>> index f4f27b6da7..e3d96f20d0 100644
>> --- a/block/nvme.c
>> +++ b/block/nvme.c
>> @@ -728,10 +728,10 @@ static int nvme_init(BlockDriverState *bs, const 
>> char *device, int namespace,
>>           goto out;
>>       }
>> -    s->page_size = MAX(4096, 1 << (12 + ((cap >> 48) & 0xF)));
>> -    s->doorbell_scale = (4 << (((cap >> 32) & 0xF))) / sizeof(uint32_t);
>> +    s->page_size = MAX(4096, 1 << (12 + NVME_CAP_MPSMIN(cap)));
> 
> Are you suggesting commit fad1eb68862 ("block/nvme: Use register
> definitions from 'block/nvme.h'") is buggy?

Buh I wonder how we missed that :/

> 
>> +    s->doorbell_scale = (4 << ((NVME_CAP_DSTRD(cap)))) / 
>> sizeof(uint32_t);
>>       bs->bl.opt_mem_alignment = s->page_size;
>> -    timeout_ms = MIN(500 * ((cap >> 24) & 0xFF), 30000);
>> +    timeout_ms = MIN(500 * NVME_CAP_TO(cap), 30000);
>>       /* Reset device to get a clean state. */
>>       s->regs->ctrl.cc = cpu_to_le32(le32_to_cpu(s->regs->ctrl.cc) & 
>> 0xFE);
>>
> 

