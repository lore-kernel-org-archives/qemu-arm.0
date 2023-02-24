Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1507743ejc;
        Thu, 23 Feb 2023 23:20:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/GvX06woZ1GkLZ+L7oQ0c5AiEeznZt0v5RJaKlm5BFyVXXPzNVp+4RJpi6gx7X0nUL/Mdx
X-Received: by 2002:a05:6214:27e9:b0:56e:952b:7141 with SMTP id jt9-20020a05621427e900b0056e952b7141mr23622797qvb.7.1677223242710;
        Thu, 23 Feb 2023 23:20:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677223242; cv=none;
        d=google.com; s=arc-20160816;
        b=w+Rhqp4iMEgPizluKDzHYvAeXYRXo3lhU/dFmXvYJLHKn1lNtOtiJFmmaSBM75VkBQ
         TFl0wfLrJ9zMWevD7hDvYilXgJlk5maKcGPXgLqZhfYEExFHkLYZ5GDtTXl5sR+H+is0
         CF7TTrJptBQQgQLRXcCgVKXcLclpQB+LgtQaY3ExwcVdPBix2EiGeuaZrOkKiJLQuaNY
         C+FyCqub9Uv12eSR9KEtsDMiZRFaS60fuPL1I6875FvfQaySH0rQGruzFX6eec/WjSU5
         NHjZe0z39WLCk6qJSnF2q0vf0+KEX0eYBIiODUDcohmAFutnvU23Wik5w6uSJ4X2riyk
         RTJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=72YyO8rjn0UeC7XHHGqmX37fsBJMiGzov8gh/uA4jVk=;
        b=khAT51n7x4NR5+0CMuebO//KPgJTUyJ8I3whpqxzoLQh9p3O33P4IIVVjabiI5OKZk
         tGylP6gALZx4pe6riKHaftzgvKPadtTGW/EdmjYOTCzm7iVOzXw9hZ372OmDqmWqe7+f
         UCCTid3FOuntyCzIUgjJGVN0SyFIkltI9giXhHqquG6xFqm6xyMynGsWBaOABV/wmb7Y
         f7KZ+bY14eXIsKBKn3RFKDwZCZu4WVA0mQBxjznxwSimjz6MH4FM3G4jn/SgEv45HuRK
         bDuKJoPheDAk9XsNV9vwYAxc5hjT4G2/PldiT/+yl9olmWS7h187WF7YoyYKNYNvuW3X
         PuNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=INR7mCoS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a0cf1ca000000b00571bda276e5si8277314qvl.137.2023.02.23.23.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 23:20:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=INR7mCoS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVSNb-0001n4-1t; Fri, 24 Feb 2023 02:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVSNa-0001mD-3J
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 02:20:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVSNY-0003b3-G4
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 02:20:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677223227;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=72YyO8rjn0UeC7XHHGqmX37fsBJMiGzov8gh/uA4jVk=;
 b=INR7mCoSDBco7JoL+Wc/0ke+My49bc2CQ9VPwcOXG1WrMkm/b2TTdvOUZTTNf4WeIsZRLP
 ph+2ksH31EAtPPIeGadEs7+ZI3qHUt8awySAVl2by41YtU4EJCcqJXwaRgokCtwR68xMhh
 02qewNhTPnL8opZFr+xPUMr59JvQ4cw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-HvegD9VhP3iPMSAjpsrgUQ-1; Fri, 24 Feb 2023 02:20:24 -0500
X-MC-Unique: HvegD9VhP3iPMSAjpsrgUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C4E0101AA63;
 Fri, 24 Feb 2023 07:20:23 +0000 (UTC)
Received: from [10.64.54.42] (vpn2-54-42.bne.redhat.com [10.64.54.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCAE52166B29;
 Fri, 24 Feb 2023 07:20:15 +0000 (UTC)
Subject: Re: [PATCH v2 0/4] NUMA: Apply socket-NUMA-node boundary for aarch64
 and RiscV machines
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, imammedo@redhat.com, yihyu@redhat.com,
 shan.gavin@gmail.com
References: <20230223081401.248835-1-gshan@redhat.com>
 <20230223122515.mzsubkwv3mgrcvhl@orel>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <abb675ad-907a-facd-c478-8031b63f0db5@redhat.com>
Date: Fri, 24 Feb 2023 18:20:12 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20230223122515.mzsubkwv3mgrcvhl@orel>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ohnDKEf539Or

Hi Drew,

On 2/23/23 11:25 PM, Andrew Jones wrote:
> On Thu, Feb 23, 2023 at 04:13:57PM +0800, Gavin Shan wrote:
>> For arm64 and RiscV architecture, the driver (/base/arch_topology.c) is
>> used to populate the CPU topology in the Linux guest. It's required that
>> the CPUs in one socket can't span mutiple NUMA nodes. Otherwise, the Linux
>> scheduling domain can't be sorted out, as the following warning message
>> indicates. To avoid the unexpected confusion, this series attempts to
>> rejects such kind of insane configurations.
> 
> I'm not sure 'insane' is the right word, maybe 'irregular'. I've never
> seen, and don't really expect to find, specifications stating that arm
> and/or riscv must have 1:1 mappings for numa nodes and sockets. But, as
> QEMU machine types can choose certain configurations to support, if
> everyone is in agreement to restrict sbsa-ref and arm/riscv virt to 1:1
> mappings, then why not. However, I suggest stating that this is simply a
> choice being made for these boards, since the expectation of needing
> "irregular" configurations is low. We should not be trying to use Linux
> assumptions as rationale, since other OSes may cope better with irregular
> configurations.
> 
> Also, I suggest adding a comment to the boards, which adopt this
> restriction, which explains that it's only a platform choice, not
> something specified by the architecture.
> 

[...]

Thanks for your comments. Yes, "irregular" is definitely better words. I failed
to find the statement that ARM64 has the requirement for 1:1 mapping between
socket and NUMA node, which makes it hard to tell if the restriction is required
from architectural level. However, the linux driver (drivers/base/arch_topology.c)
considers both CPU-to-NUMA-association and CPU toplogy from ACPI PPTT when the
CPU set in the core group is calculated. It means the CPU-to-NUMA-association
can affect the CPU topology seen by Linux scheduler.

With the restriction of 1:1 mapping between socket and NUMA node, or between
cluster and NUMA node as I mentioned in the reply to Daniel P. Berrangé <berrange@redhat.com>,
the existing configuration for other OSes can become invalid.

Yes, a comment to mention it's a platform choice, not architectural requirement,
definitely helps to understand the context.

Thanks,
Gavin

