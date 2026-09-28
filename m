Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAED0C9833F
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 13:35:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBBVq-0006Dn-IL; Mon, 28 Sep 2026 09:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xBBVo-0006DH-GV
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 09:35:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xBBVm-00009a-Bz
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 09:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790602516;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4w92S56W1hEAvyaUrn5PHeutHX5AaS6SnxPCoFTbVlI=;
 b=SWfgunxnu6StXYpneYzJDGgNRCUjRRZlJ4xk1PJqrP8DlZMzJPbASHLB1RTKViHr8P/t1Z
 p7E+V7TX9oOONg1DK86sOM6fTa+GpIgajp0O8qeaiXNEpi6aiQaopcnwqt3lL5fe3BKDP/
 LJAK1c73sewZETsHPO77Wf5NjTT3n8s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-VEpZ__9GNPK8tY9kPZhnnQ-1; Mon, 28 Sep 2026 09:35:14 -0400
X-MC-Unique: VEpZ__9GNPK8tY9kPZhnnQ-1
X-Mimecast-MFC-AGG-ID: VEpZ__9GNPK8tY9kPZhnnQ_1790602513
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-48aec0407daso420363f8f.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 06:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790602513; x=1791207313;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4w92S56W1hEAvyaUrn5PHeutHX5AaS6SnxPCoFTbVlI=;
 b=Kfei6Bw44Dy3PaDlqS3y7hRVsrp2TyjHEl5TyxAruZn3VBZvAERRJzxZOMh3bjr2Nd
 lRofPYh68oEcgkcNwsuqrJ7Hy1gikViiHGQ+NT2f8XGxAEjCtOox5Q+DcoZs0ZQRkSPD
 a2VLLZSp+g2r3bMewMpyVLANZU67VShtX/d1Q/t785EUmLyYAFVua16HvB+kOcz6gUae
 D2dlQNYh+l9jfgTcLL7+QFUqRhWr3wWwVEf8YwyQ7dvSTUU+ZELnfYUfYCIb62E4ikW1
 +MbLJaaoz5v9bz4UWMjVVU5Fj9U4hn7/X1H57Vm0ofQxjiaCNWaSje85BkIWUFJbL8qV
 I+5A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwhKf96VbnecmDd83WPonhowe50ZaQAWYUXdv0QMJFWeeGz8lOXpzhGjfPpKSz34nnyBLghj7cXLA==@nongnu.org
X-Gm-Message-State: AFq9FYKht9lFOmo1l8VhLYP/HfhECFncS06zBEitIw9wuKZZ+C0DlWeg
 lXxwW+58PQHTnluAvEEeivD5O5hYs+qA2TLfbUbs5T8JKN8XZE1WlfqommKr4IApUXBLhZR2Ek/
 2ynlh8GhkGt6AG8zmuKw2nrQ9MGktp4Z7DI1SG8F3eoDAqVDUY4aLVw==
X-Gm-Gg: AYBFou0b9adhBT2HUGpIGn0rMxhxg0yvqNgMLqAboec3Uj19TNh3EU0DBXwpMzNoNll
 mEnWVm6Af+FWVR/zx+qN0HmJYmAZSxjY9YTjrEr4csMEsZnigetpj6rIpgY4z3U3Sm6E3+39cC4
 NsbaKTQaWvMU8M0MbH8py7Df0DwTF0VoXFtA9PKLQB8l/6hK+lxM8dmPNzlLj0vGH+Aq/p0PIHJ
 WC0NiWy6Sfsr1MoZoTPkQqOcIBpNSShMc/YlhiZeiZgfbwlZBLPNXbqrdNW3U7ghYn/yQz76WJh
 uxhLS5BSMRgg10CIGfNtQzZ0XIUUnWAqvC/Y3l9gdJFIVAXjcd6CXdDNMHgRKyk4dDdFJebmTrX
 gtTcggnl797VUeBib3DMHMnv22MRbxBMKNRGHpNPgDqCxXEbJ
X-Received: by 2002:a05:6000:4310:b0:488:8b1d:1784 with SMTP id
 ffacd0b85a97d-4888b1d18f6mr11552391f8f.26.1790602512792; 
 Mon, 28 Sep 2026 06:35:12 -0700 (PDT)
X-Received: by 2002:a05:6000:4310:b0:488:8b1d:1784 with SMTP id
 ffacd0b85a97d-4888b1d18f6mr11552281f8f.26.1790602512135; 
 Mon, 28 Sep 2026 06:35:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a35607bsm25441448f8f.16.2026.09.28.06.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 06:35:11 -0700 (PDT)
Message-ID: <08465df1-4e14-4859-8ecc-b38ad8898506@redhat.com>
Date: Mon, 28 Sep 2026 15:35:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 18/26] target/arm/cpu: Expose writable ID reg field
 properties on the kvm host vcpu model
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
References: <20260916144721.751810-1-eric.auger@redhat.com>
 <20260916144721.751810-19-eric.auger@redhat.com>
 <8C14A4F3-BD37-4754-981A-829464016DE0@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <8C14A4F3-BD37-4754-981A-829464016DE0@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hjMHTxDRf3sxdHLlfcvAZCjWY-etI1ojRDGnpo0qdGE_1790602513
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.238,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 9/28/26 3:26 PM, Khushit Shah wrote:
>
>> On 16 Sep 2026, at 8:15 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> If the host supports KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES and
>> KVM_ARM_GET_REG_WRITABLE_MASKS ioctl successfully retrieved the mask
>> of writable fields for all ID regs, expose uint64 SYSREG properties
>> for all the writable ID reg fields exposed by the host kernel which
>> can be matched in target/arm/cpu-idregs.h.inc.
>>
>> Properties are named  SYSREG_<REG>_<FIELD> with REG and FIELD
>> being those used ARCHMRS Registers.json.
>>
>> When such properties are set, they override the default field value
>> retrieved from the host and reinjected into KVM. Then the actual value
>> being applied at KVM depends on the register, ie. it can be sanitized.
>> In case the field value is rejected by KVM, the vpcu init fails.
>>
>> Anyway there is a first attempt to write back this value into KVM.
>>
>> Then legacy CPU options (virtualization, secure, ...) can still
>> override the previous value. So low level IDREG field properties
>> apply before the legacy ones.
>>
>> An example of invocation is:
>> -cpu host,SYSREG_ID_AA64MMFR0_EL1_ECV=0x0
>> which sets ECV field of ID_AA64MMFR0_EL1 to 0 (enhanced counter
>> virtualization).
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> Reviewed-by: Sebastian Ott <sebott@redhat.com>
>>
> Hi Eric,
>
> The commit message needs an update :)

right! Thank you for spotting this

Eric
>
>> ---
>> v5 -> v6:
>> - do not check writable_map anymore
>>
>> v4 -> v5:
>> - get rid of ret local variable, dynamically allocate and free writable_map
>>  here
>> ---
>> target/arm/cpu64.c | 5 +++++
>> 1 file changed, 5 insertions(+)
>>
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 4e8c472530..e04062e848 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -37,6 +37,7 @@
>> #include "hw/core/qdev-properties.h"
>> #include "internals.h"
>> #include "cpu-features.h"
>> +#include "cpu-idregs.h"
>>
>> /* convert between <register>_IDX and SYS_<register> */
>> #define DEF(NAME, OP0, OP1, CRN, CRM, OP2)      \
>> @@ -807,6 +808,10 @@ void aarch64_host_initfn(Object *obj)
>>     kvm_arm_set_cpreg_mig_tolerances(cpu);
>>     kvm_arm_set_cpu_features_from_host(cpu);
>>     aarch64_add_sve_properties(obj);
>> +
>> +    /* generate SYSREG properties according to writable masks */
>> +    kvm_arm_expose_idreg_properties(cpu, arm64_id_regs);
>> +
>> #elif defined(CONFIG_HVF)
>>     hvf_arm_set_cpu_features_from_host(cpu);
>> #elif defined(CONFIG_WHPX)
>> -- 
>> 2.53.0
>>


