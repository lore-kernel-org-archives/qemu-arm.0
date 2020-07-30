Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2533753lfy;
        Thu, 30 Jul 2020 05:57:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoObFyQGL60ruxhQP6nzqn0jQ3zpTWq4RAMw32H5FFzlumOSUQa2ExkFWyjMvmC/aqBh+H
X-Received: by 2002:a25:7908:: with SMTP id u8mr4136396ybc.144.1596113873879;
        Thu, 30 Jul 2020 05:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596113873; cv=none;
        d=google.com; s=arc-20160816;
        b=pXQeQLBz3fqDIgjUQxU6Xr9Y+bGFa2RQZvBVILEJGvpd3ddKxiEHSkwHCIP1LG5/Wp
         U/qBF8qJgnkK1oPdGkV8biBS8WQP+e6xdwJEe123qLUHMiaxRVLGUpmJf5YjHOC6wuuC
         22d096Cs3RXmTa+9tCUjogX4n2rXKhVz5yGft5LpcaTOHxO2srN9TuiKo23tbeQjuDbp
         LPGRjBpaOZIUAk4CflFnKFIQpoeV5MsjHMuPFrxHWPSZgS7Pa2CgmdhAsJ9AG91kyHWE
         DDOLdSDi5A0Slpxu+j86yIXcMmwHMg8EWrKGlUvz9R/VEFsGCFu7u+vvMJCdAx5XIm1J
         Nbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:references:to:from:subject
         :dkim-signature;
        bh=C1G3i+wCf18TEQ2r1EemrQr6jL/9jBSb5FtBTuqzjS8=;
        b=qJUyHUGN6OPa6ux4jhyhvPQooKLPyNRL3+CLeWGisfM7FiqwiJSPb1ROFIxDIfONkc
         4ps6tcF/wD3K9nG0oUlqLMKHY1inUAWaENbOjS6AAvU6utw+2DjE0Sd3GaqVBWngvGgz
         bQRJk79/nErqDhjswPWVZD0ajRjJHnNNq4SNCh3Nj/WsaWFuV47A5JsrzXV8uBvCRUu8
         P9hAxgrqnZahT0zF/+RUXPQYIu+8KlsD4Fhk9TryUdl+iFm386FmxnQgMQ3DwOvlQDla
         Ow7OQIBfK4HZy5BvcNw/p6NCPS8m5VmDDL76RdVD3jMi8dspF9LMDg367KSLA8e7mWav
         Zojw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DVQktXk8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n127si5330476ybc.92.2020.07.30.05.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 05:57:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DVQktXk8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1889-0005WR-6n
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 08:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1k187z-0005W0-Mk
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 08:57:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33510
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1k187w-0001s3-Rs
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 08:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596113859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=C1G3i+wCf18TEQ2r1EemrQr6jL/9jBSb5FtBTuqzjS8=;
 b=DVQktXk8Z+z91Nz6Y0QPLaw4t+2Gd0FIm9pX/76ErRJUHr6vBsVIdb8cjeP8i9I1L7maNH
 A8tBETjO6p7YohvALqGL72T1u4gVs+Bza5CiufCTNkAscqRLUBSOwbiJUh7v+1oVGfpbjM
 DCguLM0K29+3f1MhiR86e8J8kj2Z+BM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-gcxHZU-BPEueIeCjXXsnGQ-1; Thu, 30 Jul 2020 08:57:35 -0400
X-MC-Unique: gcxHZU-BPEueIeCjXXsnGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B9261DE4;
 Thu, 30 Jul 2020 12:57:34 +0000 (UTC)
Received: from [10.36.113.185] (ovpn-113-185.ams2.redhat.com [10.36.113.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC2C719934;
 Thu, 30 Jul 2020 12:57:27 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] virtio-mem: Change PRIx32 to PRIXPTR to fix
 compile error.
From: David Hildenbrand <david@redhat.com>
To: Kaige Li <likaige@loongson.cn>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <1596110248-7366-1-git-send-email-likaige@loongson.cn>
 <9bafb053-a6cb-5738-700f-a71cba79ccc8@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <ca47a89b-15dd-655b-d524-0d39c36b00f5@redhat.com>
Date: Thu, 30 Jul 2020 14:57:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <9bafb053-a6cb-5738-700f-a71cba79ccc8@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=david@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 23:51:30
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
Cc: Stefano Garzarella <sgarzare@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Bruce Rogers <brogers@suse.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vpzg4ewTo7o0

On 30.07.20 14:03, David Hildenbrand wrote:
> On 30.07.20 13:57, Kaige Li wrote:
>> When I compile qemu with such as:
>>
>> git clone https://git.qemu.org/git/qemu.git
>> cd qemu
>> git submodule init
>> git submodule update --recursive
>> ./configure
>> make
>>
>> There is error log:
>>
>> /home/LiKaige/qemu/hw/virtio/virtio-mem.c: In function ‘virtio_mem_set_block_size’:
>> /home/LiKaige/qemu/hw/virtio/virtio-mem.c:756:9: error: format ‘%x’ expects argument of type ‘unsigned int’, but argument 7 has type ‘uintptr_t’ [-Werror=format=]
>>          error_setg(errp, "'%s' property has to be at least 0x%" PRIx32, name,
>>          ^
>> cc1: all warnings being treated as errors
>> /home/LiKaige/qemu/rules.mak:69: recipe for target 'hw/virtio/virtio-mem.o' failed
>>
>> So, change PRIx32 to PRIXPTR to fix this.
>>
>> Signed-off-by: Kaige Li <likaige@loongson.cn>
>> ---
>>  hw/virtio/virtio-mem.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
>> index c12e9f7..3dcaf9a 100644
>> --- a/hw/virtio/virtio-mem.c
>> +++ b/hw/virtio/virtio-mem.c
>> @@ -753,7 +753,7 @@ static void virtio_mem_set_block_size(Object *obj, Visitor *v, const char *name,
>>      }
>>  
>>      if (value < VIRTIO_MEM_MIN_BLOCK_SIZE) {
>> -        error_setg(errp, "'%s' property has to be at least 0x%" PRIx32, name,
>> +        error_setg(errp, "'%s' property has to be at least 0x%" PRIXPTR "\n", name,
>>                     VIRTIO_MEM_MIN_BLOCK_SIZE);
>>          return;
>>      } else if (!is_power_of_2(value)) {
>>
> 
> That's not what I suggested ... and you should mention the compiler/host
> architecture used.
> 

Sorry, I thought this was a resend from Bruce:

https://lkml.kernel.org/r/1b00c0e25ec65e113d4c7fa98b1466689f05a986.camel@suse.com

-- 
Thanks,

David / dhildenb

