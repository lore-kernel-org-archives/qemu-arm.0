Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEFFCCFA04
	for <qemu-arm@archiver.kernel.org>; Wed,  5 Nov 2025 00:40:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGRZa-0000tf-Rz; Tue, 04 Nov 2025 19:40:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vGRZZ-0000tP-EW
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 19:40:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vGRZX-0005jj-1m
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 19:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762303220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+X1Y7+76mLQNegt/yJAOJ1vteZEhNdBaCtKfYGDBYd0=;
 b=VlB/Yj9AejZGLUXrP3/DkDANgJmQjtVa9bJZ2JHvJOjbokqFZYtOPLK+LcHGY8HVe41gMR
 njEToi0sFVjQ5qpSoW1EGAIMGc5saV0CpkyDlsp9+YV1QQqHrfTAcmR19r5uYTn2Hj+oTy
 2oK+QbkhHrS5TJHIjDCnrVnRR/Ljql4=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-gAOo41X-N6a6sQsAr_mniA-1; Tue, 04 Nov 2025 19:40:19 -0500
X-MC-Unique: gAOo41X-N6a6sQsAr_mniA-1
X-Mimecast-MFC-AGG-ID: gAOo41X-N6a6sQsAr_mniA_1762303218
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-29598910dd2so67653945ad.1
 for <qemu-arm@nongnu.org>; Tue, 04 Nov 2025 16:40:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762303218; x=1762908018;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+X1Y7+76mLQNegt/yJAOJ1vteZEhNdBaCtKfYGDBYd0=;
 b=UEpO/lMlsNJXFhZ5APgsTb+DEvqputsPSXuGnVfG1KXKPzmQM8Fo00SAXRW9RlVb25
 O5lZlPa/0731P3oJwcrL/Z8/B1BEA6/1NLQ3FiwVLGjBmlmPcfxMVBccZPmDemtrPMN3
 snteJITK9EHMNUdtrt02glj7FusoCnbsz/yiKbGo/lheT/AKFqBQPLqfdhEe1UyHwk4A
 XTzCxdDOLxuYo8Pcm/Xa9o5JVMWpM5shPOz8tobPojD9TrWAF2TvadmTjOCnbTvacx4R
 D5R+9GMN1JSvVHNjUStllfMZr1AJJ+MQ7FrBr9WrEVKU681UUlV+YLtLLaDicrvuBzui
 FDVg==
X-Gm-Message-State: AOJu0YyLOU5VjLnMWoasNNrNd9iIuqJu8B+w6fUTA4iDJyLAAf8PS8kl
 SIH+PW3EIxetzd7q4k+FSTjfE9nZPpqJ8CF4hbTmlPeRXkkxnx0J7+odPxNvcARKqTJxgubYXJ4
 MYmVqmNU/s2G4yilp5yC0mt+xUK0n2inlwYympLgrYe1mBqZFKsvf3w==
X-Gm-Gg: ASbGnctDiT1UZ5gWtBgjvXYVt6eKcPfYoZVn4R9KKDarJEER0W0vM//3TMXaEjAyHew
 846N8NEcO0yL3DAy7aQmipF+v93ksiziGNnztKtRRPVAhsmceJnyAE8kOB5TCtXzYyGxhGYfJn7
 iaSPmKqJxpY6T7N7XQhl18Ms0fxN+IjsO19zgb2Y/Hpw6Kk9MWBb+STjXq96bZ8/vRQXdAYi2ct
 8HVrXfc7gu2zq7jIebpiZRHXrCpnNAXWni+RynbccciT2K25PgJ3E6KNo+1NXF2ZxtjIzchGqqX
 J10XzCKKjQbJleqVooQuB4743k2aRPO7fjUOH1Q0EFYGpXefBCxjPuzUJNK4n+mbmNEsbmafyL7
 OBpWJMVJD4pxqKKVAddc1GGHlVZE84YAx3sJVl2E=
X-Received: by 2002:a17:903:2305:b0:295:2276:6704 with SMTP id
 d9443c01a7336-2962adcffe8mr17385795ad.51.1762303217908; 
 Tue, 04 Nov 2025 16:40:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkVifaosXPerBJhaIhyI6XjVoHNxOP5J7y/neRpVOOFWjBO1h998NP6t3Q14ooBdBehzkBjQ==
X-Received: by 2002:a17:903:2305:b0:295:2276:6704 with SMTP id
 d9443c01a7336-2962adcffe8mr17385475ad.51.1762303217523; 
 Tue, 04 Nov 2025 16:40:17 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29601998deasm40722475ad.39.2025.11.04.16.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 16:40:16 -0800 (PST)
Message-ID: <a4960b41-dd92-408f-a5e8-620b35be212b@redhat.com>
Date: Wed, 5 Nov 2025 10:40:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 3/3] target/arm/kvm: Support multiple memory
 CPERs injection
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, mchehab+huawei@kernel.org, shan.gavin@gmail.com
References: <20251007060810.258536-1-gshan@redhat.com>
 <20251007060810.258536-4-gshan@redhat.com> <20251017162746.2a99015b@fedora>
 <a635de53-71fa-4edb-87c0-8775722c284d@redhat.com>
 <20251031145539.3551b0a5@fedora>
 <88a41137-d5fb-4b61-a3f2-dd73133c17ec@redhat.com>
 <20251103105216.1f4241d7@fedora> <20251104122151.00006feb@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251104122151.00006feb@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wwY8JtrvyG7tf7z84TCHv8ea2t_9cyHaVlsHUHCHvuw_1762303218
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.788,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

Hi Jonathan and Igor,

On 11/4/25 10:21 PM, Jonathan Cameron wrote:
> On Mon, 3 Nov 2025 10:52:16 +0100
> Igor Mammedov <imammedo@redhat.com> wrote:
> 

[...]

>> My idea using per cpu source is just a speculation based on spec
>> on how workaround the problem,
>> I don't really know if guest OS will be able to handle it (aka,
>> need to be tested is it's viable). That also probably was a reason
>> in previous review, why should've waited for multiple sources
>> support be be merged first before this series.
> 
> Per vCPU should work fine but I do like the approach here of reporting
> all the related errors in one go as they represent the underlying nature
> of the error granularity tracking. If anyone ever poisons at the 1GiB level
> on the host they are on their own - so I think that it will only ever be
> the finest granularity supported (so worse case 64KiB).
> 

Well, I don't have strong opinions, but I intend to agree with Jonathan
to report all 16x errors at once. One reason is one as Jonathan mentioned.
Another reason is per vCPU error source is a bit heavy for the improvement.

So I'm going to improve (v2) series to address all received comments and
post a (v3) series.

I already had the prototype of error source per vcpu, which works fine for
64KB-host-4KB-guest. However, it doesn't work for huge pages. For example,
a problematic 512MB huge page can cause heavy memory error storm to QEMU
where we absolutely can't handle.

1. Start the VM with hugetlb pages

/home/gavin/sandbox/qemu.main/build/qemu-system-aarch64                                     \
-accel kvm -machine virt,gic-version=host,nvdimm=on,ras=on                                  \
-cpu host -smp maxcpus=8,cpus=8,sockets=2,clusters=2,cores=2,threads=1                      \
-m 4096M,slots=16,maxmem=128G                                                               \
-object memory-backend-file,id=mem0,prealloc=on,mem-path=/dev/hugepages-524288kB,size=4096M \
-numa node,nodeid=0,cpus=0-7,memdev=mem0                                                    \

2. Run 'victim -d' on guest

guest$ ./victim -d
physical address of (0xffff889d6000) = 0x11a7da000
Hit any key to trigger error:

3. Inject error from host

host$ errinjct 0x11a7da000

4. QEMU crashes with error message "Bus error (core dumped)", which is triggered
the following path.

sigbus_handler
   kvm_on_sigbus_vcpu           // have_sigbus_pending = 1
   sigbus_reraise

Thanks,
Gavin


