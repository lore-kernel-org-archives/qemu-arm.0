Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995C9606A31B
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=chC8QJe7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLLAS-000507-Vt; Mon, 26 Oct 2026 09:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xLLAO-0004yF-VA
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 09:55:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xLLAN-00005k-Bb
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 09:55:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793022910;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYIyUjcnnUXti+/sgQo976EJjdmpRoD/s64kOynFb+I=;
 b=chC8QJe7wtJlrW7GA5u1hAPphGmzgdWz800N96GIGoXpR88i6gD91cB9Xb9cZiNEs0Sd26
 17cirS7L7ZBuyxW7UEkkmiPZvlbXy3AgT6srPifnMVUhppQFkTSAKD6glr6/SlfDYxoXUX
 xS1vSA3Up3mtNcgNr/wK6oOJCVhIyqY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-tPf1wjzKNGeQt_G8dz6YMw-1; Mon, 26 Oct 2026 09:55:09 -0400
X-MC-Unique: tPf1wjzKNGeQt_G8dz6YMw-1
X-Mimecast-MFC-AGG-ID: tPf1wjzKNGeQt_G8dz6YMw_1793022908
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4a01ba12198so29844715e9.1
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 06:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793022908; x=1793627708;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AYIyUjcnnUXti+/sgQo976EJjdmpRoD/s64kOynFb+I=;
 b=Yp4/kVrBCqPW5gz+pHMUUZL2vHvRcTegLweb3m6BGNa7yhjgN/FCQ+ULgDm7X9yLEd
 6r+SYrUs4KKcDejOQ/2bdQmzr5DlDvDLdeP/gP0rUMj6VqeusZqHHrajf/D0K9ZXBDND
 APIvqmlkqqLHzSybxgCExv6bdgcZ+Y4bLHQkEfa7Phf70ZSiZdWwzfmWTmrKwn/yo0Q2
 XD94sJEo3usIu6hqjOR58McD4wk1fcq6/d/MDTKTe5RkAiil134SWP6sTtT+cf1zfssF
 xPFAz2UaZoRgKLzyKC5bGEVraBlHypi86HXqJ6szfM1/mwBhA3kyz5uB6ZJHgHYtB0mU
 7VUw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwhZetfC02KW7wlPjOR80o6A74uBoYRhsE5SxB4C1MkWbN3E/p8Ufx0Xf2ldaslb2KbnptDKd8Bmg==@nongnu.org
X-Gm-Message-State: AFq9FYK2r+ver1QQ+/36EX3QBlxQiXSfYL8EFN6DqfHCGW5twOUxVt2U
 l5weTDLBnrTDkLd+ZzpXbLzq2wXKUEUCWxiUazIFiB4u2V6K5DqzxZe582ZgRlXHnMIlpMmQE9N
 q76zapFAagGF2XvHK3h2uB2dyVhPtOpNCGT2FgJZwqLkyFlH3Y96i1A==
X-Gm-Gg: AYBFou3I21qKhZHDstz4ReCzjAQnIQxxaWgZbOEhm2qPabXa/SDde/F6207H8WCZAfZ
 dursx+yd7jBjy6aZoI161FoUYz3mK+0Ywm23rVhTE4670fel585VS5b+6OM/ZfkQIKdAzoRvFqP
 DyUDXJUpTUvBQON1AI4cx9qrc18amsThEP6FN0z3A+2gL8zjQPx38Gko1N8q2v361+ccuvrzfF6
 NbaMrW0nEHCzbeypKgSPh70Dfl+t0M701eMyG60szBagi7MllsSCps8jPbhUIiPU1awrgmTqX0a
 Oy8SCWk5sOZi2FNdvsryJ33E2LDO5mzWcrticbpQFkT91nHlj7fdWrStnJPyJCJvCKMLHwx135a
 IUCpuxkFPPLJbYlHmsmRn0cd7wN6rVTNx40BKbuLtz5mL+05U
X-Received: by 2002:a05:600c:4f05:b0:49e:65f2:db64 with SMTP id
 5b1f17b1804b1-4a35ae71b30mr145150225e9.5.1793022907654; 
 Mon, 26 Oct 2026 06:55:07 -0700 (PDT)
X-Received: by 2002:a05:600c:4f05:b0:49e:65f2:db64 with SMTP id
 5b1f17b1804b1-4a35ae71b30mr145149665e9.5.1793022907163; 
 Mon, 26 Oct 2026 06:55:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a56992dsm186668015e9.6.2026.10.26.06.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 06:55:06 -0700 (PDT)
Message-ID: <71a7a633-b0d1-496b-a4a8-fc887aaad685@redhat.com>
Date: Mon, 26 Oct 2026 14:55:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/26] kvm/arm: Introduce a customizable aarch64 KVM
 host model
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, shaju.abraham@nutanix.com, khushit.shah@nutanix.com,
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org,
 sebott@redhat.com, skolothumtho@nvidia.com, philmd@oss.qualcomm.com,
 maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com
References: <20261010133725.642498-1-eric.auger@redhat.com>
 <CAFEAcA9XE0TLxp+DNzFSbkxbj7f0M78N+tf1a01cJ5rNkM7NBA@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA9XE0TLxp+DNzFSbkxbj7f0M78N+tf1a01cJ5rNkM7NBA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -hsp3ekM2vJh_CtnPbZUsvFKv8KNmaqFYEEUm9pUceY_1793022908
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.339,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peter,

On 10/23/26 1:44 PM, Peter Maydell wrote:
> On Sat, 10 Oct 2026 at 14:37, Eric Auger <eric.auger@redhat.com> wrote:
>> This series enhances the current host KVM model with capability to
>> set writable ID reg fields.
>>
>> Since v6.7 kernel, KVM/arm allows the userspace to overwrite the values
>> of a subset of ID regs. The list of writable fields continues to grow.
>> The feature ID range is defined as the AArch64 System register space
>> with op0==3, op1=={0, 1, 3}, CRn==0, CRm=={0-7}, op2=={0-7}.
>>
>> The end goal is to get more flexibility when migrating guests
>> between different host hardware. This series is a prerequisite for
>> aarch64 named vcpu models.
> To help me with review prioritization -- are you hoping this will
> land for 11.2, or are you expecting it to be 12.0 material? (Given
> the softfreeze date is rapidly approaching, it feels to me like
> 12.0 is where it's going to be.)
for the whole series I think this is too late for 11.2. What would be
nice to get in 10.2 is some prerequisite patches like those you reviewed
plus [PATCH v10 16/26] target/arm/kvm: Pass an Error handle to
kvm_arch_init_vcpu which are rather independent. I will prepare a
separate reduced series containing those + fixing the oversight of one
midr conversion.

Thanks

Eric
>
> thanks
> -- PMM
>


