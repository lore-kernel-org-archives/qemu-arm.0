Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2716BC88E64
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 07:55:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x61Wg-0005b3-SO; Mon, 14 Sep 2026 03:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x61Wf-0005am-JR
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 03:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x61Wd-00045u-SI
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 03:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789372490;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dYuLJW4P/YrBVk/hs4Chg8zTHAJI+p8avT4eA1ZbX3E=;
 b=K/Pq8LoDUBD13F60SkSwcp3dve7L/af2PwcT2BuUG7vBAqnESlZdix5KRWukFN4tXo8U1n
 TV8eIfuuNgYdnjRclVu7h79VuLB5WbJJFpxXVF6GkTkAHLmP9mHtOzBFOg8VMWOMWVnvw/
 U87nL3kUBfL75qRLwEWPHBHjYr6TSDs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-1JgAdSFzNKmo_Z65TpEMug-1; Mon, 14 Sep 2026 03:54:49 -0400
X-MC-Unique: 1JgAdSFzNKmo_Z65TpEMug-1
X-Mimecast-MFC-AGG-ID: 1JgAdSFzNKmo_Z65TpEMug_1789372488
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-49d156c917cso25186375e9.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 00:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789372488; x=1789977288;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=dYuLJW4P/YrBVk/hs4Chg8zTHAJI+p8avT4eA1ZbX3E=;
 b=Ud3j5TigNt0f4nqLNUYTCqi9vtAcao+/jhVvc4psHrIqTZDzWFSQiioVf57PN4/fBI
 DERP1sCu+Rer/mZVABW2ff1nbFczppkv7yRqrj/waOjOueVmop3wym3V1+jLI6HO9CSJ
 YtLlPCax3lIrRbrtFcVu6Un3C0JTyrJRiFCGimYK47hmtLXCaK2ikPFfTKhlxpn3IVxU
 EbuGWbhrf6xVGG2vf0cdFi1Jd70sQbN4DKuQdmSGql3ZHr+5MoQgxO0inNjlt5KGp60N
 JonZBJmhdRGYd+fPX0iF+qX2uy/n9ouadKC37quyzpJRvx5C7JJQTM9UAZeceWggZHFy
 zDAg==
X-Forwarded-Encrypted: i=1;
 AKwUvByWPz/xb5wIDwYqFC+cPlJDfI7XWUPGzUS0/f/zIvRsdJc/nknj8s5rwFLywsk//CgPUsS3qG4DDQ==@nongnu.org
X-Gm-Message-State: AFuF++mF8b9zApyOyBB1aA1f6rcvmDwyW/6GnIqJ1YUW6d987lAPJQWg
 HkHeKcsyQVVJO0+PVIMXNv70Z3VhWCm6jU64NuenPMoidzDY7KEtL436MNUcsiNfc95G7LOlFG3
 ldgUe3diDH0vkEl8LMHnqG0tl3Crt8ALqFXwJEyaozA5/c9tNRvbl4Q==
X-Gm-Gg: AYBFou1nBzoYrtXY89ENNnmLzCAr8qPUV8qTMUhtsEFd4Ie1tOad2eI7o3ThDM1yDgQ
 NbdcAiw0NWx27QNW5ImCATROrLWlQ3/KdYlz71TBUuLVrxW2LMb74z4cO3Zr+4DDgoqlQwtZk/+
 jMerRoLqxVL9EJbTDFL/KetNb39suo0nAnPkhmp0qMiPauXeXVPVoFK8ticKX1j6yjhnKD+gcbh
 ByTHvkuV8/vWgpMEhF4vw8TDjqcGXfOHrJQEEwqOQCPOLYd5mtL0v+W/qn96GYDJ1hPG0/dWb0t
 3EOpoDbw8z9c2Ljp0Z+QAHRRA18sfZ2IrsDEL4qbFu083mef8Jkut9AqVHUQW8ibqhXrOskk2Xh
 1d23BR9AfVJL930pN9QyQW8ZUiCI8h+bkrHArVUowJ4zJMNMA
X-Received: by 2002:a05:600c:3484:b0:49c:f13e:e52 with SMTP id
 5b1f17b1804b1-49e7a6865c1mr15391835e9.15.1789372488009; 
 Mon, 14 Sep 2026 00:54:48 -0700 (PDT)
X-Received: by 2002:a05:600c:3484:b0:49c:f13e:e52 with SMTP id
 5b1f17b1804b1-49e7a6865c1mr15391265e9.15.1789372487661; 
 Mon, 14 Sep 2026 00:54:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e6499d57bsm442316115e9.3.2026.09.14.00.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 00:54:46 -0700 (PDT)
Message-ID: <7fdbeeb9-3439-49d2-9ad9-33c3379d58c4@redhat.com>
Date: Mon, 14 Sep 2026 09:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v8 15/20] target/arm/kvm: Ignore and trace unexpected
 writable reserved fields
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "shaju.abraham@nutanix.com" <shaju.abraham@nutanix.com>,
 "khushit.shah@nutanix.com" <khushit.shah@nutanix.com>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "philmd@oss.qualcomm.com" <philmd@oss.qualcomm.com>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260826093747.1670077-1-eric.auger@redhat.com>
 <20260826093747.1670077-16-eric.auger@redhat.com>
 <SJ0PR12MB8614E4CF6C7C81CAE67A018DABBE2@SJ0PR12MB8614.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR12MB8614E4CF6C7C81CAE67A018DABBE2@SJ0PR12MB8614.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HMl4QXxyziwTVpxxcl-O3-rPdBlubUBiNmd_GPz-sio_1789372488
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 9/11/26 3:50 PM, Shameer Kolothum Thodi wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 26 August 2026 10:36
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; kvmarm@lists.linux.dev;
>> peter.maydell@linaro.org; shaju.abraham@nutanix.com;
>> khushit.shah@nutanix.com; yangjinqian1@huawei.com;
>> cohuck@redhat.com; richard.henderson@linaro.org; sebott@redhat.com;
>> Shameer Kolothum Thodi <skolothumtho@nvidia.com>;
>> philmd@oss.qualcomm.com
>> Cc: maz@kernel.org; oliver.upton@linux.dev; pbonzini@redhat.com;
>> armbru@redhat.com; berrange@redhat.com; abologna@redhat.com;
>> jdenemar@redhat.com
>> Subject: [RFC PATCH v8 15/20] target/arm/kvm: Ignore and trace unexpected
>> writable reserved fields
>>
>> External email: Use caution opening links or attachments
>>
>>
>> KVM currently reports some bits as writable whereas they are
>> RES0 or RAZ. The code easily allows to do some sanity checking
>> for such inconsistencies. Let's add a trace event when this is
>> encountered and skip the field
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  target/arm/kvm.c        | 8 ++++++++
>>  target/arm/trace-events | 1 +
>>  2 files changed, 9 insertions(+)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 2557d7b0d9..8ec9bc51cd 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -433,6 +433,14 @@ decode_idreg_writemap(Object *obj,
>> ARM64SysReg *reg)
>>          }
>>          lower = field->shift;
>>          upper = field->shift + field->length - 1;
>> +
>> +        /* Sanity check the field is not a reserved field */
>> +        if (strstr(field->name, "RES0") || strstr(field->name, "RES1") ||
>> +            strstr(field->name, "RAZ")) {
>> +            trace_unexpected_writable_reserved_field(reg->name, field->name,
>> +                                                     lower, upper);
> This hangs QEMU on my setup, the guest never starts.
> I think, we need to advance map/i: 
>
> +            map &= ~MAKE_64BIT_MASK(lower, field->length);
> +            i = ctz64(map);

Thank you for the report. Corrected in v9

Eric
>
> Thanks,
> Shameer
>


