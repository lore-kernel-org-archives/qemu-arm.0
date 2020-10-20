Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4700048lfa;
        Tue, 20 Oct 2020 04:33:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkRVUA3jkklTIEniZ6bHGY38U/OfNQmkuxaS5sNmWshFmeOAP0ckhlODAw0COFDHrTGPkX
X-Received: by 2002:a5b:703:: with SMTP id g3mr3409043ybq.86.1603193619731;
        Tue, 20 Oct 2020 04:33:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603193619; cv=none;
        d=google.com; s=arc-20160816;
        b=1FkKi3s02GOF2/aphjhFJaks7hA2UHoXThIL1qBaRxxwlZCybzd/6pusmn3TETByFx
         M1kewVdNRngrOLU6iGqYVKN7O3aG1YR2sUSu6OQNrMLdWWHI+XWD0+xNpMKKwcEvzDRd
         GvqtemaNLFThUuMOG4AsJYtqdVeUhW4afSds16n0B6CVBo0GK8yHzCny/lLo7kf0oVMn
         sgB0UZcCXsuaYi8IfeGMNOdumMgpUR4dWXjMpQzkbhQgdFoefiKe2SEEUiqfVSPu8cF4
         SAOehvqODQ8Aa71Bv8kBJvfifS3EkrmHXkodcePPLOWRwrnk4NDkH3FobjdhB81dp/nB
         ReBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=TZPg+9SwHgJaxjULwqana2tbErHK4Vnsy6eyIE1guVE=;
        b=bZskQU1K2JMtEctXnK0bpgQy8oIhdlgSj3BtteRyDo8S74lTR2bGsD2aCaYKKF+yqR
         jS7lQkDGKUTlkygcBPTTX5CBCR/n+T2X5YHUbseCCuczOc4+4J84AZLHkp3IaJJ1ZEF4
         zkzTJAgepvtWEG2jkHjMkS49qfjb/jh7p/wf0iubNYG8K8GSpvNBY0Px1uaSUGm41wFs
         uRXhyjGywlXfU98w4qeFmTQ8GMUFg+9UpxHOdwMh7dT2aZTNxH2HahtrT/6O1RSHY1d/
         rqfm3qah/5G15gUMs2H5VwAxSWZgQrGUUrc8ayHrulEOOtIqRvx+xjw5y/5c+7KNT2xE
         GTWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E9vAC8NH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si1606975ybp.70.2020.10.20.04.33.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 04:33:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E9vAC8NH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUptb-0000aS-3b
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 07:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUprh-0007od-CU
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 07:31:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUprf-00029B-BH
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 07:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603193498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZPg+9SwHgJaxjULwqana2tbErHK4Vnsy6eyIE1guVE=;
 b=E9vAC8NHethYG8iXKxo/Wz0irEAfnodHJGrlpjKTvALaixnwI/NBJMDxspKEhbVfyQ1Hj5
 cEoHLavLOYohAxc9zdu9OPi45gp8fVHhoGQIP/3kymMWFXTizH1uKpJkxhW9qwEOQK+1JZ
 IvFxeP2LjrcmQYORRR3dmn8deS2EwtQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-O3iqi9qENBC8MKX8_F2c4w-1; Tue, 20 Oct 2020 07:31:36 -0400
X-MC-Unique: O3iqi9qENBC8MKX8_F2c4w-1
Received: by mail-wr1-f72.google.com with SMTP id 2so694238wrd.14
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2020 04:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TZPg+9SwHgJaxjULwqana2tbErHK4Vnsy6eyIE1guVE=;
 b=OyksjPlec036P66CQ+negwMJ1a2W3+jv/i5r4MGKibgC9hnyobfqMKPIVgo4MIx0QU
 vmN/imxM2FAznS+YDyqfPxovausYap2Zi9ywvuCcaN+MEkT30n7OAu/rfQ68onVlxCOz
 MO25Am4x372cvlJuvJDpZvcxXFQEV98NRbZModPYxMbHtv3eOXLMuyh6drErIfhTxODj
 xaAGOIMJAziCwdjXX4Jxoxsoi8O52Q/5xBRphf/S6rh3y/C4JeCkfMPlQ6AzEM9kv7QK
 vKPlOkVrIb7q+LWVn/L1oOKo8bm+ErjfSm+kqj6+RNhoxS7D2kUUDg6XNyhLVFbEdtPy
 cmyQ==
X-Gm-Message-State: AOAM532KkMqHdeOQZHAixOfqvrj0OVktx4Np7A6kMxbgpZhutYDY66fo
 UpkTzNr1xQVGNXqvyITMtsjy6W59FhLDs/MzymSuyqaZF09AaN8DWe6xxuQsEIVA/BsZZfjZFhu
 s3GJqJdZh5xVv
X-Received: by 2002:a5d:490c:: with SMTP id x12mr2982181wrq.193.1603193495620; 
 Tue, 20 Oct 2020 04:31:35 -0700 (PDT)
X-Received: by 2002:a5d:490c:: with SMTP id x12mr2982150wrq.193.1603193495368; 
 Tue, 20 Oct 2020 04:31:35 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id j7sm2551488wrn.81.2020.10.20.04.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 04:31:34 -0700 (PDT)
Subject: Re: [RFC 2/5] block/nvme: Change size and alignment of IDENTIFY
 response buffer
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanha@redhat.com,
 fam@euphon.net, alex.williamson@redhat.com
References: <20201015115252.15582-1-eric.auger@redhat.com>
 <20201015115252.15582-3-eric.auger@redhat.com>
 <5fae4be4-2d62-7fa3-acbd-7da3154fbc47@redhat.com>
Message-ID: <47caa2b4-05e1-87e2-f7d9-038815b3e9db@redhat.com>
Date: Tue, 20 Oct 2020 13:31:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <5fae4be4-2d62-7fa3-acbd-7da3154fbc47@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bUBYWXkhOZKM

On 10/20/20 12:59 PM, Philippe Mathieu-Daudé wrote:
> On 10/15/20 1:52 PM, Eric Auger wrote:
>> In preparation of 64kB host page support, let's change the size
>> and alignment of the IDENTIFY command response buffer so that
>> the VFIO DMA MAP succeeds. We align on the host page size.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   block/nvme.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/block/nvme.c b/block/nvme.c
>> index e3d96f20d0..088ff1825a 100644
>> --- a/block/nvme.c
>> +++ b/block/nvme.c
>> @@ -513,19 +513,21 @@ static void nvme_identify(BlockDriverState *bs, 
>> int namespace, Error **errp)
>>           .opcode = NVME_ADM_CMD_IDENTIFY,
>>           .cdw10 = cpu_to_le32(0x1),
>>       };
>> +    size_t id_size = QEMU_ALIGN_UP(sizeof(*id), 
>> qemu_real_host_page_size);
> 
> Do we really need to ALIGN_UP if we then call qemu_try_memalign()?

Ah, we need to ALIGN_UP for qemu_vfio_dma_map(), OK.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
>> -    id = qemu_try_memalign(s->page_size, sizeof(*id));
>> +    id = qemu_try_memalign(qemu_real_host_page_size, id_size);
>>       if (!id) {
>>           error_setg(errp, "Cannot allocate buffer for identify 
>> response");
>>           goto out;
>>       }
>> -    r = qemu_vfio_dma_map(s->vfio, id, sizeof(*id), true, &iova);
>> +    r = qemu_vfio_dma_map(s->vfio, id, id_size, true, &iova);
>>       if (r) {
>>           error_setg(errp, "Cannot map buffer for DMA");
>>           goto out;
>>       }
>> -    memset(id, 0, sizeof(*id));
>> +    memset(id, 0, id_size);
>> +
>>       cmd.dptr.prp1 = cpu_to_le64(iova);
>>       if (nvme_cmd_sync(bs, s->queues[INDEX_ADMIN], &cmd)) {
>>           error_setg(errp, "Failed to identify controller");
>> @@ -547,7 +549,7 @@ static void nvme_identify(BlockDriverState *bs, 
>> int namespace, Error **errp)
>>       s->supports_write_zeroes = !!(oncs & NVME_ONCS_WRITE_ZEROES);
>>       s->supports_discard = !!(oncs & NVME_ONCS_DSM);
>> -    memset(id, 0, sizeof(*id));
>> +    memset(id, 0, id_size);
>>       cmd.cdw10 = 0;
>>       cmd.nsid = cpu_to_le32(namespace);
>>       if (nvme_cmd_sync(bs, s->queues[INDEX_ADMIN], &cmd)) {
>>
> 

