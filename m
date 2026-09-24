Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29A8C98317
	for <qemu-arm@archiver.kernel.org>; Thu, 24 Sep 2026 11:48:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9hvb-0007uy-PY; Thu, 24 Sep 2026 07:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x9hvb-0007uo-2i
 for qemu-arm@nongnu.org; Thu, 24 Sep 2026 07:47:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x9hvY-00026E-PF
 for qemu-arm@nongnu.org; Thu, 24 Sep 2026 07:47:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790250467;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFEpJJW2Ygnswic7m+wgOQUXXnuzXBT68x93F9YM8Dk=;
 b=B6K8t+yQ7g2niudN5RrvhZli/DUy03kyS1hs4Jf4dXyRYpgpWchZ8+KOdICX2KiZzsyc/Z
 n9NYqEOxOhS9gY4HxlLK3zTAeVj4D/nYMIloOqu1DgRBjNK+/JJNHIExJD9UIw6oqLyqbc
 mHCazG/JuWW9KsBGTctAO0AIcYl62n0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-jsjG47oNN-6Fc_IkaFgM3g-1; Thu, 24 Sep 2026 07:47:45 -0400
X-MC-Unique: jsjG47oNN-6Fc_IkaFgM3g-1
X-Mimecast-MFC-AGG-ID: jsjG47oNN-6Fc_IkaFgM3g_1790250465
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-487038bc9b8so1076795f8f.2
 for <qemu-arm@nongnu.org>; Thu, 24 Sep 2026 04:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790250464; x=1790855264;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zFEpJJW2Ygnswic7m+wgOQUXXnuzXBT68x93F9YM8Dk=;
 b=OwSuGkoB6+JSF4CZPZlmDhLSLzYRmGhkkkm4AeAbLW7de8SfNt5yBE1DQ29tM7uSU8
 8hSH+1hB8Og2jeSiGzYmkoaSKQlnT7Ti4N7nprFuvp3As0rQeJbdJ7z9tbA7Ae7jV06U
 kwnd0jDS34uC0YlZdXaTGzHo8+5r/xH3ScsRNlvJpVcmL700niaI/fxprE3ZJqakLsD0
 MkuIiQpRiAf1jDqlGTOCj/VzPZkoP6+EHmpNlKHf2Gcv3gbEpQ3c2qtG3TXCAGAFXBT0
 PFLzKC4PldSiaJ5IbxJt1GzPR1bmuYgfoX2z7C2wOgF3Wn60LzBubnVrdPf+C8VJbphd
 GqQQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwEUnFvLHVzHnMzCMH9j6HczMFg/JUPJiTA7QqfvDzPX/izNXiLSeWAGctT4kVDz75zM1YdzTqMRg==@nongnu.org
X-Gm-Message-State: AFuF++nIF6r249eH4AifyndRdiLjPuRe1UvoRs3l/YBHuCg1ezzIAS1j
 Qd4B0LDauOMZwCjjdiy6kmX1U56ec6K+PMQeBZTGOLbvgRoZjwFdOaUSEFLJT52yDMG3cEO3LYz
 SxOPWyRGlGKq5UoIpDzwfmjcNX0Cq+cI4L3qykqBiE5PAKmYfGfk6PQ==
X-Gm-Gg: AYBFou1krNkS4bJjZzy0zo98Xs+r7fDdMSbGmlDr4yDXOvHhsxz57ECKReIXG7SaXg5
 nOqnLPd5GCIwjXmw/n7ONRlgUx0Ug2EGIrZBMTtvh5+9UTdfUq97FCXtVpJkJqyY9vmskFu8/2o
 XaqDfggDw0dzEAr+R3uqKUZx5QWJcLNfzI/2zkgd099Yd2nPlsFQhLrnZ0I3x2ypwOQpN90S58m
 ElGAPqvVoOvfZHhiLKOZUj46l8mb+H75KFiDa8rAPAYMRFNPsMKRSklbfqbJSEh3DyJSpWho5Zi
 HIyR4lFsu5p8i0TlkINmEG+PL4rwsqj1gdBJyb7Lu8gRwTVwnUrWT7/sh8NIS27b1xMDf3zXgUD
 QSn2Pe9LAtfqyZosqNuBCi2rj5YlDeTC1KdNFQKCIMNyJHEiX
X-Received: by 2002:a05:6000:4012:b0:487:930:8acc with SMTP id
 ffacd0b85a97d-488717168c1mr3343497f8f.16.1790250464693; 
 Thu, 24 Sep 2026 04:47:44 -0700 (PDT)
X-Received: by 2002:a05:6000:4012:b0:487:930:8acc with SMTP id
 ffacd0b85a97d-488717168c1mr3343461f8f.16.1790250464334; 
 Thu, 24 Sep 2026 04:47:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886877c379sm13964440f8f.29.2026.09.24.04.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2026 04:47:43 -0700 (PDT)
Message-ID: <b32547b3-c6ac-4887-8a10-59ee84b28938@redhat.com>
Date: Thu, 24 Sep 2026 13:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 08/25] target/arm/kvm: handle writeback for special
 ID register fields
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "philmd@linaro.org" <philmd@linaro.org>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 "ping@khushitshah.com" <ping@khushitshah.com>,
 Sandesh Patel <sandesh.patel@nutanix.com>
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-9-khushit.shah@nutanix.com>
 <aabcb61b-8341-423f-b113-e7ab2b34c2ac@redhat.com>
 <C220B122-8B4A-43DF-A665-AF1B9DCE3734@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <C220B122-8B4A-43DF-A665-AF1B9DCE3734@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5hP-wm-uJvFCVOqueld8kHEsBx9rthylhXwblgF7jRA_1790250465
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



On 9/24/26 12:21 PM, Khushit Shah wrote:
>
>> On 24 Sep 2026, at 3:27 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> v9 has changed the way new field values are stored. writable field props
>> and non writable field props could have different setters. A non
>> writable field setter just needs to check the new value is the same as
>> the current host value. No need to record the new value in the hashtable
>> for further commitment.
> How will that work? as based on certain vCPU init options, non-writable fields will change… right?
I meant the new value does not need to be written into KVM because it
must be equal to the current value. But maybe I missed your point

Eric
>
> Warm Regards,
> Khushit


