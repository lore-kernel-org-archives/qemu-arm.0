Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp12031669njk;
        Mon, 6 Jan 2025 13:09:01 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVkr0KyruNN2WcKjJV7SmSWoqa+ftKVQX6hyy5f0vx7oerIAo0Dcu5yz7FO4Hs2wU/t/w+u+gcosZXRcA==@linaro.org
X-Google-Smtp-Source: AGHT+IGta2Gqesg26ebiImqHrUsA+gdtQlZHVH5KRAIRyPJEOoLYsMgM6Iej6lXiHh6DgUeJS17a
X-Received: by 2002:a05:6402:51ce:b0:5d0:bcdd:ff9c with SMTP id 4fb4d7f45d1cf-5d81dd845b9mr52250328a12.2.1736197741206;
        Mon, 06 Jan 2025 13:09:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736197741; cv=pass;
        d=google.com; s=arc-20240605;
        b=fWUzaLz13FVzrgX3r6Te5v1irOM6zovuRoZ2q434ZfxyvgxZl3epJ6j8BbzXxB+bVS
         eSosIeSpuaanay9nIJK5vAxyrZgeAY7L1qRaCItQjxjD2Hb8jtVlgxtjhpyvvL3cM5qm
         1DBsefUNrzt73cbSp+UQoWEnx67ZK06SMR/WHNkbT1EyZ1v1VG/P7Ak75S6MbJvBEq4P
         TWQSJcgSqRZTtcAFbFD6QTy073rlATQY24mgF0MkZoZAYNgPyxvemYiryqMK1KkBZbl5
         76xTu7DbNNKHAx5Z2lpGXYquB4Ruadj8naUlfYKUKAYHn2HY9LA237HpSPcwLpYcyJ5B
         c9dA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=Dt1f81EVsgW5OvATu4Z5FjJ0Vm5UWbdIlHsy1CTjJ6o=;
        fh=TU+G0WfsVp4XiFzG4ON1lluFgeymB1lY6VqZ8Kyufyk=;
        b=OdKE6Z8OLwFfE5OKFKi/RaByENX42X8WnbNtEI0xAed6jHUSWw3NGF2ze+HL9XPBLx
         neBraN4BMBBjSpidTgoGAMopf/dSS9FcKE3W0SDPL0lrAmBc4wa7FXrt/AlKHKcls6cb
         hVAk2DP4b42JyDCa9aUs68O8ICfZ4VgER1WRokQ4loBwGG58Na1Pb8UuB8/e2Rl1+K6M
         KPfsRGsjle4cixKtLozX0+m/l/h+bl/uk7PyLWGzs+NfLUWokvS/TZwryv+u7kk+DMrQ
         Ous5N7kOi3SBx6Q0WGaExnW3F6pGnKoqyms3oLX7/+boZtKrXThroEEpAK/lfdcdfGYZ
         jseA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SE9aAQte;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-34642-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-34642-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-34642-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5d95a5bbab8si598302a12.337.2025.01.06.13.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 13:09:01 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-34642-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SE9aAQte;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-34642-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-34642-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 478C318854D7
	for <alex.bennee@linaro.org>; Mon,  6 Jan 2025 21:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF6F1DFE24;
	Mon,  6 Jan 2025 21:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SE9aAQte"
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705521DF270
	for <kvm@vger.kernel.org>; Mon,  6 Jan 2025 21:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736197726; cv=none; b=m7Zs2HmFIkPn8t6TU7ob9Lxjsr6rIU9xNd9BO1vRqh0yDYHQWqvCz3omob+0oBKxhYdFISLFZA11BAyj5mKYhbmHgULLW7bX+3KiivnViceqY5cWNEn1buYyOZ1oxF6zL4VyNeEkJ5zouGPn+43dOlzx4cVHVYGpzjxi2njIFDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736197726; c=relaxed/simple;
	bh=3MHUu2svpEHD48NtS/Y77HnuFCSkfhLaw79EU4MEwoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQAuSB+CRMe4HRUBJqQJF8YrTYxLRRwXvetdMpPl4D9Pjk7kyuUDotsuRt6y3VHVmhwXhJkostxwmVArHgJxfZMNRLZrAzcmR2IsmsXKuEFedxQ0Qx2qPI0dogt0bjw6pAVuEvv4WPCdUbCmXv8e5UGVuvSeipEIXrJScMDQDb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SE9aAQte; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so8158153f8f.0
        for <kvm@vger.kernel.org>; Mon, 06 Jan 2025 13:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736197723; x=1736802523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dt1f81EVsgW5OvATu4Z5FjJ0Vm5UWbdIlHsy1CTjJ6o=;
        b=SE9aAQteQfdGZIHbGPk6eFTinqggRWasWR0381rmAAmG5Vk+08byuClFhIqbskSlRw
         eCSwQ9wA2lDdGh9LOwPS0AAzWwrjO3cz8I3QTnxekWftwoYN4aF5lmgKal6yYrLfBta5
         vNpKuOYibQ51tp/I3Ahq82nuoKmXTRYiCH9Uq+toH0+3+pj+glJhKg66XUuR/WikloBn
         /11n+l0JnYUhWv54gteqKkhw5dWDzga9ZcJ8WxwlFyPk9LmNDDNxq3FMEtdHX+PUMbr0
         Rcgc1GuVEWjgzwMcZFvalJteh1FM5v3Y7kNy5+ys0jDXbWLcCktTPVHdxWusl+oP5/AB
         IWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736197723; x=1736802523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dt1f81EVsgW5OvATu4Z5FjJ0Vm5UWbdIlHsy1CTjJ6o=;
        b=HKWFu429Rnar0YT8XFXsgFa8oARRURGIie55KR6pgbeiCy3CNpdL/qsr8SiXNglaIo
         Sg8wtHUbO0y72Spq/hy4i/M1M+UauyJznpqCaeUz4VnC+RFbS854KHTzSDz6QhV1Uw4O
         x2Y5sIU3TP9qMA16yC986oPXlG0tAC9FodYnp+E16f1t4GIg7UbcsxZ2xojn+ju5lFRG
         izHd+hEi4JPEGd9M6ok3fJ6u6vdpegRrjcPiTZPdYCE+ClRTCQFUp0KHGuT5etds+Rhf
         CeLXbdLtTRJUsTg+4ZPEL0OZlHBcmGMBNDbJZ0p7l1hQ2BKtrRMiWeqs92u8/82HBSFY
         Mu1w==
X-Forwarded-Encrypted: i=1; AJvYcCXnJV7BFXIfStIWXbspMOdLIEl/g2v9EcASW4SDfEFIzqp1eGBUn1xZpXovhWEJaJLRJhc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze0s5Qc5yeLyfej72iNSuNK42HsLuQR5+xV6JUg20xesizxXMP
	onJncsVP1np7RvcqjBgxFufPyHgZ18T6bIGkWbJXV8IUQpGDKyr91s4APumDpQ4=
X-Gm-Gg: ASbGnctNFA5PFzUhmsdmHkgFg5CsxF8tnp/Qs3PL0/HJxqo7eB6I3FWQWot8TSqbVfM
	TVwq/i9+VLMlH5ytvfLWaOpwv0Lhkau64z2PbwjUL70JwCUCJ7MXeAYJGgGkxpCFUDWPE9lB9Yn
	ZDlMIojFAmi/U1ITsZNa1OoT804h+vzRT/D0uCAEJUspo7JQqOKrl6npQ7DXh9SJapSW1nzhEnE
	f11DlIUnee/WMxFqRAadfY5EbkfkqwjDfYW2H8ZtN67wtXoqxVDR1jfy7uQ/wt5mFI30oZFI34R
	n84Rj8ygtYEW0z7AYf7u4Cy3
X-Received: by 2002:a05:6000:188e:b0:385:f840:e613 with SMTP id ffacd0b85a97d-38a223fd52dmr44054103f8f.51.1736197722710;
        Mon, 06 Jan 2025 13:08:42 -0800 (PST)
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e528sm49330255f8f.83.2025.01.06.13.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 13:08:42 -0800 (PST)
Message-ID: <6df59c2c-e29d-4b86-8908-4cb9093bad13@linaro.org>
Date: Mon, 6 Jan 2025 22:08:39 +0100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/7] accel/hvf: Use CPU_FOREACH_HVF()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cameron Esfahani <dirty@apple.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 Alexander Graf <agraf@csgraf.de>, Paul Durrant <paul@xen.org>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Riku Voipio <riku.voipio@iki.fi>, Anthony PERARD <anthony@xenproject.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, Zhao Liu
 <zhao1.liu@intel.com>, Phil Dennis-Jordan <phil@philjordan.eu>,
 David Woodhouse <dwmw2@infradead.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anton Johansson <anjo@rev.ng>
References: <20250106200258.37008-1-philmd@linaro.org>
 <20250106200258.37008-7-philmd@linaro.org>
 <bd8168fe-c774-4f75-8a94-1a67ec31e38d@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <bd8168fe-c774-4f75-8a94-1a67ec31e38d@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rRHKsc5WN71c

On 6/1/25 21:33, Daniel Henrique Barboza wrote:
> 
> 
> On 1/6/25 5:02 PM, Philippe Mathieu-Daudé wrote:
>> Only iterate over HVF vCPUs when running HVF specific code.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/system/hvf_int.h  | 4 ++++
>>   accel/hvf/hvf-accel-ops.c | 9 +++++----
>>   target/arm/hvf/hvf.c      | 4 ++--
>>   3 files changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
>> index 42ae18433f0..3cf64faabd1 100644
>> --- a/include/system/hvf_int.h
>> +++ b/include/system/hvf_int.h
>> @@ -11,6 +11,8 @@
>>   #ifndef HVF_INT_H
>>   #define HVF_INT_H
>> +#include "system/hw_accel.h"
>> +
>>   #ifdef __aarch64__
>>   #include <Hypervisor/Hypervisor.h>
>>   typedef hv_vcpu_t hvf_vcpuid;
>> @@ -74,4 +76,6 @@ int hvf_put_registers(CPUState *);
>>   int hvf_get_registers(CPUState *);
>>   void hvf_kick_vcpu_thread(CPUState *cpu);
>> +#define CPU_FOREACH_HVF(cpu) CPU_FOREACH_HWACCEL(cpu)
> 
> 
> Cosmetic comment: given that this is HVF specific code and we only 
> support one hw
> accelerator at a time, I'd skip this alias and use 
> CPU_FOREACH_HWACCEL(cpu) directly.
> It would make it easier when grepping to see where and how the macro is 
> being used.

I find it more useful to grep for a particular accelerator, or for
all of them:

$ git grep CPU_FOREACH_
accel/hvf/hvf-accel-ops.c:507:    CPU_FOREACH_HVF(cpu) {
accel/hvf/hvf-accel-ops.c:546:    CPU_FOREACH_HVF(cpu) {
accel/kvm/kvm-all.c:875:        CPU_FOREACH_KVM(cpu) {
accel/kvm/kvm-all.c:938:    CPU_FOREACH_KVM(cpu) {
accel/tcg/cputlb.c:372:    CPU_FOREACH_TCG(cpu) {
accel/tcg/cputlb.c:650:        CPU_FOREACH_TCG(dst_cpu) {

