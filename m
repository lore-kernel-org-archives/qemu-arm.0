Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948A6CD4F54
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 15:46:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSGSI-0003so-8x; Wed, 27 May 2026 11:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSGSG-0003ml-Kk
 for qemu-arm@nongnu.org; Wed, 27 May 2026 11:46:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSGSF-0006de-1w
 for qemu-arm@nongnu.org; Wed, 27 May 2026 11:46:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779896758;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9muSlnmiwd2mhBLAgro+7z3m7qZ5WDxt0cKhMmUlN+E=;
 b=PvnAGxp+eoEs1G4NtWTn6aMdVzTcOpDRAcpLTCihzffOyebI03UzoJkTLskBAi+G5yWHyv
 hafbEraNVZlRytJRPKOPbX6uKKTP53DGXlYx1BJ2+x1VkJdVTeUZL4iz4oSVF7DWCs8hPk
 PaQV0jIBbBbCTrdPisYtZtjr+Xw2O3o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-n3hXwhLwMTOpA0K7m5ISZA-1; Wed, 27 May 2026 11:45:53 -0400
X-MC-Unique: n3hXwhLwMTOpA0K7m5ISZA-1
X-Mimecast-MFC-AGG-ID: n3hXwhLwMTOpA0K7m5ISZA_1779896752
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-45ed830a0eeso1398149f8f.3
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 08:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779896752; x=1780501552;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9muSlnmiwd2mhBLAgro+7z3m7qZ5WDxt0cKhMmUlN+E=;
 b=jDTjYx6D6uCgHf61b7M+AXaHNENSD5l9/2V6736ReG2RBG5fFGvdxkyvXvtMfkLZP7
 v7I0/FxSX+JlPaL2q4E22WxLjP/8GHi4nhsRuvuEE8BmNhRTb1aQEEh2nY+fi2f/R+5a
 U9TEFmo7HGDkSzhXscoe8hAKIyo1N9Z1AZHW4PKlibIE3lANPBb5kgaZGTzqVHXNRi3s
 F1C6huKxdDBYDhYOpzEnj3mB49gueNTVDuExrksGBS5RVY/qvProfOoXhYbgYoYWIQSa
 Luc49CFjaFlB9qa28s5BccB1oK6ixez7sH7hd0dgV6IPIQGF8uq5UkeXZ6DOU9RBF5MH
 qjFA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Ys6mBFArKiCsfmjrRKVh0qfIh+bVoXauellfV9vAH0m2eCcy+CAyFPH4j/xqZmWxbLTqoQnuyxw==@nongnu.org
X-Gm-Message-State: AOJu0YyTeoJQi9/pEZpPBij51iMrG1KDmcpo6DaL3M7LzYzHAxFRMSel
 ImGcc4BlrEeSBidtie+TGvOPAvA7zRt7d/dAsFZdpPL8a3ld5y3vlx3tv9QGQck2BQx4WE/EAuY
 LrQYrwcVCIxvgLleMNk1CITE4gEOpcMleA35jIL5SNsc/HrrxNir/lA==
X-Gm-Gg: Acq92OFgZKyMPTgoNv++q+6IVZvUYcfZFzR73PCRRcVHZi3aby8ZIWWuMxcmZ2CxG8q
 cek3shhqSVcwp8JNVol6p+evCQhSJI9oob4+i63rfDFJz+07g59vCwINUg+SBeJASFM0mVmIYZ3
 4FdzUMvqY/ndVVVhyJSjyO3ECkzwF5p46khkIZsZeRGszytZhzHrsKDwOW3Kk29SvmApHkehZjX
 ZAMyCFKKPmBzN/AtOTUQ8WRFWlVH+HWyipXREzYoggl0sbN6I9Wt4y0XLQ1cqlq313nktkOmAej
 cpMsJDt2lJSJ99kvoow2iPwXboE8XAxzxmiwg2TaZiik42tJLrkarb0xOnV0HsHlQ/d5x0cokjR
 IuA7HuxQ77Wpo0zOKAf8n7UIM3WukRR+4/Vo1JYxY0MSsmI47qVpEoihvSxJjf2Eqpts2D8kl+q
 gr6T+i
X-Received: by 2002:a05:600c:4ecc:b0:488:aa33:dcbd with SMTP id
 5b1f17b1804b1-490428db91cmr360447615e9.26.1779896752300; 
 Wed, 27 May 2026 08:45:52 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecc:b0:488:aa33:dcbd with SMTP id
 5b1f17b1804b1-490428db91cmr360446945e9.26.1779896751891; 
 Wed, 27 May 2026 08:45:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4908097a320sm27674265e9.3.2026.05.27.08.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2026 08:45:51 -0700 (PDT)
Message-ID: <80fa5157-2376-4010-88b2-deb6ab50f87f@redhat.com>
Date: Wed, 27 May 2026 17:45:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/18] target/arm/kvm: Ignore some writable bits that
 shouldn't be
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "philmd@linaro.org" <philmd@linaro.org>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-16-eric.auger@redhat.com>
 <E5402D74-AE00-4088-801C-C87A749E17C9@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <E5402D74-AE00-4088-801C-C87A749E17C9@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 49qWOfBc1PGD6WG4yKxdQpYz2rQpcTTNU2Sqci0tjLo_1779896752
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 5/27/26 4:46 PM, Khushit Shah wrote:
>
>> On 19 May 2026, at 6:57 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>>
>> KVM currently reports some bits as writable whereas they are
>> RES0 or RAZ. This is detected because the code attempts to
>> match those bits against a named field and this later does not
>> exist in target/arm/cpu-idregs.h.inc.
>>
>> Let's silence warnings until those bits get fixed in the kernel.
>>
>> This was observed with v7.1-rc4 kernel.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> target/arm/kvm.c | 23 +++++++++++++++++++----
>> 1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 6373a66bbd..1688cc2106 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -405,6 +405,19 @@ static void get_sysreg_prop(Object *obj, Visitor *v,
>>     trace_get_sysreg_prop(name, value);
>> }
>>
>> +static bool ignore_unnamed_writable_field(ARM64SysReg *reg, int i)
>> +{
>> +    if ((!strcmp(reg->name, "ID_ISAR0_EL1") && i >= 28 && i <= 31) || /* RES0 */
>> +        (!strcmp(reg->name, "ID_ISAR5_EL1") && i >= 20 && i <= 23) || /* RES0 */
>> +        (!strcmp(reg->name, "MVFR2_EL1") && i >= 8 && i <= 31) || /* RES0 */
>> +        (!strcmp(reg->name, "ID_PFR2_EL1") && i >= 12 && i <= 31) || /* RES0 */
>> +        (!strcmp(reg->name, "ID_MMFR5_EL1") && i >= 8 && i <= 31) || /* RES0 */
>> +        (!strcmp(reg->name, "ID_AA64FPFR0_EL1") && i >= 2 && i <= 7)) { /* RAZ */
>> +        return true;
>> +    }
>> +    return false;
>> +}
>> +
>> /*
>>  * decode_idreg_writemap: Generate props for writable fields
>>  *
>> @@ -426,10 +439,12 @@ decode_idreg_writemap(Object *obj, int index, uint64_t map, ARM64SysReg *reg)
>>         uint64_t mask;
>>
>>         if (!field) {
>> -            warn_report("%s bit %d of %s is writable but no named field "
>> -                        "in target/arm/cpu-idregs.h.inc",
>> -                        __func__, i, reg->name);
>> -            warn_report("%s is target/arm/cpu-idregs.h.inc?", __func__);
>> +            if (!ignore_unnamed_writable_field(reg, i)) {
>> +                warn_report("%s bit %d of %s is writable but no named field "
>> +                            "in target/arm/cpu-idregs.h.inc",
>> +                            __func__, i, reg->name);
>> +                warn_report("%s is target/arm/cpu-idregs.h.inc?", __func__);
>> +            }
>>             map =  map & ~BIT_ULL(i);
>>             i = ctz64(map);
>>             continue;
>> — 
> This is why I feel the generated cpu-idregs.h.inc should also have information of
> RES0/1 fields as in our RFC. These fields will obviously have only one architecturally
> valid value, hence we will never allow user to write something else.
The good thing is it allowed to detect that kind of kernel inconsistency ;-)

RES fields are not defined either in target/arm/cpu-features.h and since
they are not meant to be touched, it was not that obvious to add them.

What would it change anyway, if we detect we have a writable field
matching a RESx field, I guess we would continue raising a warning, no?

Thanks

Eric

 
>
> Warm Regards,
> Khushit


