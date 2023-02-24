Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1500946ejc;
        Thu, 23 Feb 2023 23:10:10 -0800 (PST)
X-Google-Smtp-Source: AK7set9Y/FFapy8Ug2fNDkLjI55ANf1ztjIo52fiZpdsMWh/zjxo6RKjJBT476u+jHSMfWuc0QGI
X-Received: by 2002:ac8:5850:0:b0:3bf:9f6e:a383 with SMTP id h16-20020ac85850000000b003bf9f6ea383mr23228018qth.20.1677222610321;
        Thu, 23 Feb 2023 23:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677222610; cv=none;
        d=google.com; s=arc-20160816;
        b=UWLBnhp+QDRjSTZt4SooItD8GMOLmiT5OdpAQp/heMrvcWnsyR6zA6JFdZg+vi+mT0
         EwoTdsKdLaI0JUshsoh1aUj0AKjgjK3/jd93wzpdXqsV/uQy8gIT5nP04GOkUPnNm5yF
         Gs5qdQv+jGcHldcRq12WSaqccIiISxgy1GRBQ3U3n4mYqU4+M7e+uPvlPOD0xFXFk/9p
         Ri9iPyObwXa/VsxF9HA1v7j/vB3UiDEnOD8EbPxWKOpWrIGLut2vv7HXdDXkRl5zx4p6
         xgN3kuhvdY83Lp7bFnXumPeRpSe5nZ0l8MsQCVTCwwIChhiS+Q6l1AgV/nzdutExSiTk
         Oljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=K4ZvmC9FbcEEulfeWUM/vzyyQcGof9qH0iQevbTe1ko=;
        b=L3qDUtBW8nbjGRueCkSmJYKhblR3W+4sbRwS4JwPb+4ehBoFXA7JMw+V+g+sOji4r6
         e8ryY8+YKPd9NmEIcxVJd1aLUlvxj/I3h+Pb2yj7UpvDiAE8VNBKe/3rbZPBflCbJ8AU
         Pz3/J3+gyl0Onmtjnv5cHDa9uAdyav/0POXGks9fK6CTqtQmeHM+mJlfOybbDz16kBmC
         8tHdjTT5eUWl0v/enjLMk/5bgHaP2B9oxppwvEyHZ4hY4tZyyOFfu8cdvdUkifz7rBxb
         JSdVhjFOIqaHj0A8h6RmnvoDRZs7f7KPbHFI+XO+mwg2Pg8ug3dyd62LmG8nkgrxJhMu
         ZV1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dvpaOwTu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020a05622a054a00b003b9b60dd798si7477644qtx.761.2023.02.23.23.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 23:10:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dvpaOwTu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVSDC-0002sj-2D; Fri, 24 Feb 2023 02:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVSDA-0002ji-G0
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 02:09:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVSD8-0006D7-Uj
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 02:09:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677222582;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K4ZvmC9FbcEEulfeWUM/vzyyQcGof9qH0iQevbTe1ko=;
 b=dvpaOwTu0dg6seo4UwSvzqCcCW6g3f50YXvocbld+WTOKpby3GBHAtI1BYy22Ps+33v/jl
 WOXsG6JH7Ju863YsRjpBow5ddYqcrAfyHNJ6CUg28B410DalSqghODX2MuOjSoF2y/rCwm
 Kf0TgC39W7DmEd3xUgevErqYy8dKX6s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-lVfD_nH0PpWY81IJBXPjqw-1; Fri, 24 Feb 2023 02:09:36 -0500
X-MC-Unique: lVfD_nH0PpWY81IJBXPjqw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BB9D380452A;
 Fri, 24 Feb 2023 07:09:35 +0000 (UTC)
Received: from [10.64.54.42] (vpn2-54-42.bne.redhat.com [10.64.54.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88E2D492B13;
 Fri, 24 Feb 2023 07:09:26 +0000 (UTC)
Subject: Re: [PATCH v2 0/4] NUMA: Apply socket-NUMA-node boundary for aarch64
 and RiscV machines
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, shan.gavin@gmail.com
References: <20230223081401.248835-1-gshan@redhat.com>
 <2d37d157-12a1-07aa-4c70-974ac1503283@ventanamicro.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <fc0d2c66-5600-c33a-62d7-c72f1d16518b@redhat.com>
Date: Fri, 24 Feb 2023 18:09:23 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <2d37d157-12a1-07aa-4c70-974ac1503283@ventanamicro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +Wzq+Tz3NBkc

On 2/24/23 12:18 AM, Daniel Henrique Barboza wrote:
> On 2/23/23 05:13, Gavin Shan wrote:
>> For arm64 and RiscV architecture, the driver (/base/arch_topology.c) is
>> used to populate the CPU topology in the Linux guest. It's required that
>> the CPUs in one socket can't span mutiple NUMA nodes. Otherwise, the Linux
>> scheduling domain can't be sorted out, as the following warning message
>> indicates. To avoid the unexpected confusion, this series attempts to
>> rejects such kind of insane configurations.
>>
>>     -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>>     -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>>     -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>>     -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> 
> 
> And why is this a QEMU problem? This doesn't hurt ACPI.
> 
> Also, this restriction impacts breaks ARM guests in the wild that are running
> non-Linux OSes. I don't see why we should impact use cases that has nothing to
> do with Linux Kernel feelings about sockets - NUMA nodes exclusivity.
> 

With above configuration, CPU-0/1/2 are put into socket-0-cluster-0 while CPU-3/4/5
are put into socket-1-cluster-0, meaning CPU-2/3 belong to different socket and
cluster. However, CPU-2/3 are associated with NUMA node-1. In summary, multiple
CPUs in different clusters and sockets have been associated with one NUMA node.

If I'm correct, the configuration isn't sensible in a baremetal environment and
same Linux kernel is supposed to work well for baremetal and virtualized machine.
So I think QEMU needs to emulate the topology as much as we can to match with the
baremetal environment. It's the reason why I think it's a QEMU problem even it
doesn't hurt ACPI. As I said in the reply to Daniel P. Berrangé <berrange@redhat.com>
in another thread, we may need to gurantee that the CPUs in one cluster can't be
split to multiple NUMA nodes, which matches with the baremetal environment, as I
can understand.

Right, the restriction to have socket-NUMA-node or cluster-NUMA-node boundary will
definitely break the configurations running in the wild.

Thanks,
Gavin

[...]

