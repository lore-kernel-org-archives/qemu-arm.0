Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16208C61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 06:46:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wz7OH-0003MO-3N; Wed, 26 Aug 2026 02:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wz7OF-0003Li-De
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 02:45:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wz7OD-0007Bu-RF
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 02:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787726736;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dmD553i3R7mbHOfNOQTqDSWokZ9awtN325Ww0u7K5HM=;
 b=IEAFduDd2iq4HiyMK27S83xkddwd806BfqlQKUq7FNzPSR+6HGe5wVD4l9jA6gC4Pn8Yyb
 AOtFVslz2nyuHviUqseQXT5yoeKVt9hcaAc0IECM6Ii6ixiSbA4t1NwNOITttHS/p5Pmkk
 s9BcK/eFec32GJdOXyFPk1RzcaTjK5M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-h9njBEgsM3y3ksYD_XvrhQ-1; Wed, 26 Aug 2026 02:45:34 -0400
X-MC-Unique: h9njBEgsM3y3ksYD_XvrhQ-1
X-Mimecast-MFC-AGG-ID: h9njBEgsM3y3ksYD_XvrhQ_1787726733
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-c15ff68c858so51239166b.0
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 23:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787726733; x=1788331533;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dmD553i3R7mbHOfNOQTqDSWokZ9awtN325Ww0u7K5HM=;
 b=MDbgrMp8lymUDP/iaEHi3xECbX//not6l4Z74UQhOnC9d1y4oa+yop9S3s2Xknb0Kw
 U9m5WArNPp7tYlXywc9DwUHba6hqw5XczN9osoKKQKH4jQYxG6Lc3y3810HlSmn6yoP1
 WMnDx6vXD5KCuwAcWjsozbAn9vmu//7EldTy4vaXmbP4OixkeBE9LsqGWZK9umwR7Kcj
 FEyLkN5MVibbPbixe6aEQboQll2/1sF27JkfV3PDFjYKxPygevCZpYhFeV4wbuicUofS
 OQ8WunCn/eFGTfNsxd/a7PPn3CgJ2y0DLL//Dhfn7LXlHQVR7ZPz55lBj/mLsgdbWmh2
 W70A==
X-Forwarded-Encrypted: i=1;
 AHgh+RrxrABA8YDxk1nk2gcNwJ154tFd7FsSYzDXPKQ54GEp8WByFfnBCt7N0IJUGNAE9+Wa1TxTsRmKvA==@nongnu.org
X-Gm-Message-State: AFuF++mDcqOqrHGC4J0QPfLOUOpQ+jiMlX/0DmxwAAd6jwttipjgUk8y
 4qUqjhUIXIWaglH3yYioCJV2+8WfbQAUQiEhfNxQ7S8nLRDHE/tW2sDmMti3x3ax5xPGgQO6/VQ
 CMX2KtwijqL95jEd/D3JYqgy1aUSXM5AH7XgmmUVdkmHV8GhozWKjyw==
X-Gm-Gg: AR+sD12pdhZvw+ibfdvhz7VwmPAuRoGfKGsBw81hz9C/J83tLmjBXcgJo7V45QUuAiw
 /r8Jpbv2YL+IV/KAiDrgSP7W55Ue1P5D7QZOMUUmCyFM55+phoAKRXFOHDwwfhbsLjl7kjpavoP
 6wNM/6hzk9+ojUjASMzKmcA9FqCJ5ddHhA+yp1fnPyO+CmKlsExhr/gB9yd7SoEheParMTfsSqT
 EowIzFBS/1finCDUQPXMB3d7y3CwuKJ2JuxoEbARJvV3sJ3x3T1Nmhcbo3Qgo/MTXJv194rMHck
 KkTy3qVz9aCcwHEKqSGfwcAeerzhrWZMdWEqWC/cQYARSaUCRveblofufkkwti6rDCX3t/ZaFgn
 oWjYQuuofOkvLQa1DFUymLpEQjDSumDuQU3fRyyN2R5HwPUpn
X-Received: by 2002:a17:907:6d1a:b0:c19:45e3:2f57 with SMTP id
 a640c23a62f3a-c250c4b3348mr459043166b.9.1787726733285; 
 Tue, 25 Aug 2026 23:45:33 -0700 (PDT)
X-Received: by 2002:a17:907:6d1a:b0:c19:45e3:2f57 with SMTP id
 a640c23a62f3a-c250c4b3348mr459040566b.9.1787726732930; 
 Tue, 25 Aug 2026 23:45:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a7303casm437391466b.25.2026.08.25.23.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 23:45:31 -0700 (PDT)
Message-ID: <7ce15b69-11bd-497e-9463-0745700fe6fd@redhat.com>
Date: Wed, 26 Aug 2026 08:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 03/18] target/arm/cpu-sysregs.h.inc: Update with
 automatic generation
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
 "philmd@oss.qualcomm.com" <philmd@oss.qualcomm.com>,
 "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260726153221.24773-1-eric.auger@redhat.com>
 <20260726153221.24773-4-eric.auger@redhat.com>
 <42EB7A4B-9C09-4E31-B435-556C6020E451@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <42EB7A4B-9C09-4E31-B435-556C6020E451@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bUZOzMgmA8Kjur5kBhORCmwk8SKR1dElidn7JsaGEaI_1787726733
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Khushit,
On 8/20/26 8:55 AM, Khushit Shah wrote:
>
>> On 26 Jul 2026, at 8:59 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> Generated definitions with scripts/update-aarch64-cpu-sysregs-header.py
>> based on "AARCHMRS containing the JSON files for Arm A-profile
>> architecture (2026-03)" Registers.json file.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> Reviewed-by: Shameer Kolothum <skolothumtho@nvidia.com>
>> ---
>> target/arm/cpu-sysregs.h.inc | 13 +++++++++++++
>> 1 file changed, 13 insertions(+)
>>
>> diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
>> index ec5a12b0f4..2188cd7be0 100644
>> --- a/target/arm/cpu-sysregs.h.inc
>> +++ b/target/arm/cpu-sysregs.h.inc
>> @@ -1,11 +1,20 @@
>> /* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +/* This file is autogenerated by scripts/update-aarch64-cpu-sysregs-header.py */
>> +/* DEF(<name>, <op0>, <op1>, <crn>, <crm>, <op2>) */
>> +
>> +DEF(AIDR_EL1, 3, 1, 0, 0, 7)
>> +DEF(CCSIDR2_EL1, 3, 1, 0, 0, 2)
>> +DEF(CCSIDR_EL1, 3, 1, 0, 0, 0)
> As CCSIDR*_EL1 are demux registers, a single entry for them does
> not make sense.
OK I removed them

Thanks

Eric
>
> Warm Regards,
> Khushit
>> DEF(CLIDR_EL1, 3, 1, 0, 0, 1)
>> DEF(CTR_EL0, 3, 3, 0, 0, 1)
>> DEF(DCZID_EL0, 3, 3, 0, 0, 7)
>> +DEF(GMID_EL1, 3, 1, 0, 0, 4)
>> DEF(ID_AA64AFR0_EL1, 3, 0, 0, 5, 4)
>> DEF(ID_AA64AFR1_EL1, 3, 0, 0, 5, 5)
>> DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
>> DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
>> +DEF(ID_AA64DFR2_EL1, 3, 0, 0, 5, 2)
>> DEF(ID_AA64FPFR0_EL1, 3, 0, 0, 4, 7)
>> DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
>> DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
>> @@ -40,6 +49,10 @@ DEF(ID_MMFR5_EL1, 3, 0, 0, 3, 6)
>> DEF(ID_PFR0_EL1, 3, 0, 0, 1, 0)
>> DEF(ID_PFR1_EL1, 3, 0, 0, 1, 1)
>> DEF(ID_PFR2_EL1, 3, 0, 0, 3, 4)
>> +DEF(MIDR_EL1, 3, 0, 0, 0, 0)
>> +DEF(MPIDR_EL1, 3, 0, 0, 0, 5)
>> DEF(MVFR0_EL1, 3, 0, 0, 3, 0)
>> DEF(MVFR1_EL1, 3, 0, 0, 3, 1)
>> DEF(MVFR2_EL1, 3, 0, 0, 3, 2)
>> +DEF(REVIDR_EL1, 3, 0, 0, 0, 6)
>> +DEF(SMIDR_EL1, 3, 1, 0, 0, 6)
>> -- 
>> 2.53.0
>>


