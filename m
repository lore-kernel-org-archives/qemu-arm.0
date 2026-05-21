Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D82CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:44:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3gU-00050f-8d; Thu, 21 May 2026 09:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wQ3gS-000506-OL
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:43:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wQ3gR-0000ZS-4F
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779371010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MGAqhEoCrxlhG7ghF4d4bubuWjp/PvPTdNOMZxG+QiI=;
 b=UxKGICbKBk7+ZfMSwN2eCAnXlwbnugGRW79hsolGrJH5mX9cGcVo8qZptQnWiL77jpvCpM
 tWdNk7dP9nkwt7CwJ9OgAomt/YgWp/YCYXpQ3LvGgT3/KCGRQhhVp4Dz18Sl53kUOQIs4+
 wk6yaKXIx4BeioXEeqjtV44KLgszIdk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-YYSGDAq9MRyFTuQxtDxEYA-1; Thu, 21 May 2026 09:43:11 -0400
X-MC-Unique: YYSGDAq9MRyFTuQxtDxEYA-1
X-Mimecast-MFC-AGG-ID: YYSGDAq9MRyFTuQxtDxEYA_1779370989
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48fd33b4921so40857865e9.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779370989; x=1779975789;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MGAqhEoCrxlhG7ghF4d4bubuWjp/PvPTdNOMZxG+QiI=;
 b=NEg8G9mscF0nVuiLkePE7M4yBur+uM8dVPS28bEZENVn4HnIC5Ko0vT3czQZwx/Nsn
 KGiGvpnZuLhuMkFywTuUJgrtoRTtOelk01Q4cJsYHdCpVeOvhDyN3os9gjJ3JsmeY9L7
 5U6s2mI7djTHNQVgqllzxd8a5UTESNinWhQ5NFOlRcAm1huaKvngC4aq05HkIC6GUZ/h
 vlmuTPPd9xIjKo3PdCcgJIf+yjzZPNh0g4vZV8bW/JRfIM+tqlm9hOvinphwTlm2Omvo
 BvunO5bd+ZpAYm2IEZKEifZuGe89ZOJwpQAQBe7WBqjKG04r7g3os4NWK4jSWsugv9t2
 rKHQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/oDv971ze1lb9HP69KKM4ybviz0dSUmoHTdYUPQhyEcvDMsMVuJlimxV8nMbUNoaXfaTZ5kwVguw==@nongnu.org
X-Gm-Message-State: AOJu0Yzu5b0QqKT8C0EX1eO8wXVkCJzL0cpma65OGFaMHf8uo6g56G2A
 ceKCndf8jeINB/wowfU8JPu4+ae10MYcm5BfmKjKRDfF6mAGa0+CWSZZO7HKGOja7avFJvrZuW1
 QO85o9rx6E+3fJtNSkq01NBgo2FexRMlJRy18xoEIi8BqSb4CLdiYjg==
X-Gm-Gg: Acq92OHfajkfRBeFkAHf3SWjbp8J6surKmtpfZnevNUZlzEsSih+OY2LnaW84jc9MiT
 yJJn1kqPWOndVo3cXGsRApDSDGMBzGwCiXf1kx9IeCPMtXokkGG3xVRsCQITQMZBgsfd7DpTUhR
 OYCZf2hVrcgDxiGZxcxfd730zpx+Zm+uVOxjIB9T/dt+nfLeBUvLPJLeoC8RigNz5OI0ePd4/u6
 Ko5FhqH4/lWEOWYoZPwGHXuPpWBy6WcPvB95Xar5LCoqlpDXyqYmqJ112FT02wIGnInxclQxB4I
 hbfayUbolVfviz44pl9OF0YgJyMn4b7asvFBEZPNnIA7CUfGQ3F94CWwIar6ZTHEfCycoYLut2F
 w90ar0G9zrlEm5U4CJMLWfSHW9UYnECoZjlaGV+Yd8TBgvHLQBBNTrwGw8ONcVnxbY7mStMM=
X-Received: by 2002:a05:600c:8b05:b0:48f:e230:c3f8 with SMTP id
 5b1f17b1804b1-490360cc5d7mr57949905e9.30.1779370988588; 
 Thu, 21 May 2026 06:43:08 -0700 (PDT)
X-Received: by 2002:a05:600c:8b05:b0:48f:e230:c3f8 with SMTP id
 5b1f17b1804b1-490360cc5d7mr57949245e9.30.1779370988239; 
 Thu, 21 May 2026 06:43:08 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035c219a0sm17063105e9.5.2026.05.21.06.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:43:07 -0700 (PDT)
Date: Thu, 21 May 2026 15:43:05 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 skolothumtho@nvidia.com, philmd@linaro.org, maz@kernel.org, 
 oliver.upton@linux.dev, pbonzini@redhat.com, armbru@redhat.com, 
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Subject: Re: [PATCH v5 09/18] target/arm/kvm: Introduce
 kvm_get_writable_id_regs
In-Reply-To: <20260519132905.145643-10-eric.auger@redhat.com>
Message-ID: <f37a332e-1c0a-1017-f7f9-4df8a92459eb@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-10-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 39hOtG7WQlysS94YP8t0f-1a1S1OsE8drRdN0z9eKZE_1779370989
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 19 May 2026, Eric Auger wrote:
> From: Cornelia Huck <cohuck@redhat.com>
>
> Add an helper to retrieve the writable id reg bitmask.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>
[...]
> +int kvm_arm_get_writable_id_regs(uint64_t *idregmap)
> +{
> +    int cap_writable_id_regs;
> +    struct reg_mask_range range = {
> +        .range = 0, /* up to now only a single range is supported */

.range = KVM_ARM_FEATURE_ID_RANGE,
.reserved = {0},

Reviewed-by: Sebastian Ott <sebott@redhat.com>


