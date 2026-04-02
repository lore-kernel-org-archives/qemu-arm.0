Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8916CC6B3E
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 15:19:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8JpH-0005Wt-20; Thu, 02 Apr 2026 11:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1w8JpF-0005WR-0j
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 11:19:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1w8JpD-0004Mh-PR
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 11:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1775143154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h6sCJBaxJf/OZjo3HR1LJVu11JKU+l2/NN5vhYf2oxw=;
 b=YFxEZItFM+wrZaL+qeLTkU2nDX9j6AH1lEEoGkrNGPQES8cmexydLrcsah8BClrhKvLVUC
 yHIqLhdXCDrjybunLltuUyTvdT07gTfQhgLpMB1KkPpnp1ilo/EOilDjV2f5sqmqQdTCDe
 +X2OGZSlK+T1Cvt3ZVyWkyYNgjLzVXI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-266-HLk3dZLzPJmlO_jYDceJWA-1; Thu,
 02 Apr 2026 11:19:12 -0400
X-MC-Unique: HLk3dZLzPJmlO_jYDceJWA-1
X-Mimecast-MFC-AGG-ID: HLk3dZLzPJmlO_jYDceJWA_1775143150
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9D4891956053; Thu,  2 Apr 2026 15:19:10 +0000 (UTC)
Received: from localhost (unknown [10.44.49.158])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2BBE119560A6; Thu,  2 Apr 2026 15:19:08 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Sebastian Ott
 <sebott@redhat.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>
Subject: Re: [PATCH v2 3/3] arm/kvm: get demuxed ID registers from kvm
In-Reply-To: <ece352d8-d819-4562-b6d6-f761898a3bbf@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20260204133229.297061-1-cohuck@redhat.com>
 <20260204133229.297061-4-cohuck@redhat.com>
 <ece352d8-d819-4562-b6d6-f761898a3bbf@redhat.com>
User-Agent: Notmuch/0.39 (https://notmuchmail.org)
Date: Thu, 02 Apr 2026 17:19:06 +0200
Message-ID: <87zf3lcrv9.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 4tgV3WzKe0HzUgyFyafgv4I1LnFxyxCsZ5sC2eKTztc_1775143150
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.542,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_SBL_CSS=3.335,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Apr 01 2026, Eric Auger <eric.auger@redhat.com> wrote:

> On 2/4/26 2:32 PM, Cornelia Huck wrote:
>> We now have the infrastructure in place to get and save demuxed ID
> Here we only get their values? What about the save?

We only get, but we could also save, if we had the right interfaces :)
I'll try to reword it to be less confusing.

>> registers from kvm. Use it to get the values that kvm emulates for
>> CCSIDR_EL1.
>>
>> Tested-by: Alireza Sanaee <alireza.sanaee@huawei.com>
>> Reviewed-by: Sebastian Ott <sebott@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  target/arm/kvm.c | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> @@ -416,6 +444,11 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>               */
>>              err |= get_host_cpu_reg(fd, ahcf, ID_AA64ZFR0_EL1_IDX);
>>          }
>> +        /* grab demuxed registers */
>> +        for (i = 0; i < 14; i++) {
>> +            /* KVM only allows 0..13 */
> where is it documented? Maybe add a comment or justification in the
> commit msg. Use a define?

Linux arch/arm64/kvm/sys_regs.c has

#define CSSELR_MAX 14

Not sure if there is any actual documentation.

>> +            err |= get_host_cpu_reg_demux(fd, ahcf, CCSIDR_EL1_IDX, i);
>> +        }
>>      }
>>  
>>      kvm_arm_destroy_scratch_host_vcpu(fdarray);
> Thanks
>
> Eric


