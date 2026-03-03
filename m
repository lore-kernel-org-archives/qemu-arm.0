Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306B3EC145F
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 14:47:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxR1i-0001Ki-Ck; Tue, 03 Mar 2026 09:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxR1E-0001DG-Kb
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 09:46:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxR1B-0004OK-6D
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 09:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772549196;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+c8AoCeFzluR9KrpvTjGq6/pF+pIQS41oeINMDAlzk=;
 b=VTJDflGfnEnNpXDSEf3EfMINoccFshrwgUuRtNpp+86R+IhPS/HGSqqGG+pvu5/ijZlUAS
 zv6GeOiHeVcN3rFV1v0aPxT0EZ2iRCVK6xcltmvTa/skjCXYMsQSCttJbQvKIDUTwXlUyO
 5W53UOMT/jVxMCVoioo57fKrUweRKw4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-ZZOwcKKcP22QsQIjtQzPkg-1; Tue, 03 Mar 2026 09:46:34 -0500
X-MC-Unique: ZZOwcKKcP22QsQIjtQzPkg-1
X-Mimecast-MFC-AGG-ID: ZZOwcKKcP22QsQIjtQzPkg_1772549194
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-439af95a718so2450002f8f.2
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 06:46:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772549194; x=1773153994;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y+c8AoCeFzluR9KrpvTjGq6/pF+pIQS41oeINMDAlzk=;
 b=Y++YacH60TLlNfXUcn4ieuHjZCZha0IHzzZRhLgaqhkg3JTjRuA45ZV5pHpztCRCq7
 ztQnV5Q6NhuuH6JTWPtxK9LkAR4CG4GDkh5f7vbk3DS4Mpc5SBKCzy42apBDsB1jpuXw
 Q8mDSrzWCLBQ7zoiZVymvhb4McdYoE5L+dlSTBxInw+MEO8KXOC9TDtDvw8eoM/HsyNl
 VQtAA+svGqRszxHylWiEpaulLknRUTI9Ks46R4WRCvpgEYzPpKwf1iP2eMz/043svAkr
 jYSZL6h1EKdzDpR9XBNb/G7g3yinXHGTz5fUTY442EqqyIV0pgxRcZ5QdrVoeb4XPP2a
 fJRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXFU3xFlUSBlxr8dn2X77TPTMd99a65LocUdlADGRTv52JjOHn2tRp23RR9cIlJh3LBRene6ArYw==@nongnu.org
X-Gm-Message-State: AOJu0YyoyU793oNaKS7oh24dPwIxKaLylpls4E43IxdWkuSbAA4X36QP
 zm3Fa2JVeZO8xisdxryOaNM7GfStbttxNWuUc+a+4jRX1MYk7HQeaGSJZVp9+tckOLMTR2qB+qk
 0RqmPnRywn1bmwtIRzLKX/oFQwsiX/LWBZTOHp5M3YQluJNe/ofrwsA==
X-Gm-Gg: ATEYQzz9LPTurS2msmVdLNjfA6GT7ZB8ooiWEBjWPvLosMdKzf4ZomCFQyAvcj9iBmv
 ZpoImqv6Cgl9KsRyz7KCQ04gSfGw+k4dl0iBxl+DBp8hNZn/iumIiKaBY+1Ms+pcLgJU3RfoHh0
 +kqqq+eOZzyc4xeY4LdZ6boANBA0KcHpI7el6rCO0jWUn+5hK61Ssey0wdTZ5Wtf6AM08iufF2i
 CkDNKBMd5qcr2b6/rtiwdKvk5dJkL7aTX1l6iersx4BCDI8i2sLQIiJjNq3svcQvhoNierZw3M7
 gCvuKetDPGw63JQWnVh8UVsqqqnyonuSb4ICEQPgiZfMVl8QbVMNGh6UmE5u5X0bMfzbfoMgH8z
 yYK4Y/DeIC2de8BhGHn49cV0j/97/V28sHLcSRTRKRBjy+MmX8fLx1uOE7dcUH117kxEUZQ==
X-Received: by 2002:adf:f204:0:b0:439:b6f9:b438 with SMTP id
 ffacd0b85a97d-439b6f9b878mr10520477f8f.33.1772549193688; 
 Tue, 03 Mar 2026 06:46:33 -0800 (PST)
X-Received: by 2002:adf:f204:0:b0:439:b6f9:b438 with SMTP id
 ffacd0b85a97d-439b6f9b878mr10520426f8f.33.1772549193194; 
 Tue, 03 Mar 2026 06:46:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c2f8c0e7sm2900275f8f.29.2026.03.03.06.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 06:46:32 -0800 (PST)
Message-ID: <34e0763f-b79e-4149-a4bb-066a158c5371@redhat.com>
Date: Tue, 3 Mar 2026 15:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] vmstate: Introduce VMSTATE_VARRAY_INT32_ALLOC
To: Peter Xu <peterx@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, cohuck@redhat.com, sebott@redhat.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20260226100232.500781-1-eric.auger@redhat.com>
 <20260226100232.500781-2-eric.auger@redhat.com> <aabnCoT3Wp6L_ZuJ@x1.local>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aabnCoT3Wp6L_ZuJ@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j3nDyi5kCnTQ1cavAjbRHJv5EV1WFLfnLhFA2ofXFt4_1772549194
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.322, RCVD_IN_VALIDITY_SAFE_BLOCKED=1.141,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 3/3/26 2:50 PM, Peter Xu wrote:
> On Thu, Feb 26, 2026 at 11:01:29AM +0100, Eric Auger wrote:
>> Already existing VMSTATE_VARRAY_INT32 requires an array to be
>> pre-allocated, however there are cases when the size is not known in
>> advance and there is no real need to enforce it.
>>
>> Introduce VMSTATE_VARRAY_INT32_ALLOC as we currently have for UINT32
>> and UINT16.
>>
>> The first user of this variant will be the target/arm/machine.c cpreg
>> indexes/values arrays.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks!

Eric
>


