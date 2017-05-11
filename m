Received: by 10.25.0.6 with SMTP id 6csp787792lfa;
        Thu, 11 May 2017 06:38:45 -0700 (PDT)
X-Received: by 10.55.55.17 with SMTP id e17mr427999qka.63.1494509925637;
        Thu, 11 May 2017 06:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494509925; cv=none;
        d=google.com; s=arc-20160816;
        b=NeTXeKAqLkbat2630ZUw/K9FYFnv9Mg4K2EJPdkU5UgM4ABTeqh+ZK47DYQTMhMRI9
         kbJq9VNHXIKRdB/jPnWRzoJO5uBjwIgxD7EUlRTp4OmOz7FgTO2po2iARho6mKMJznIW
         xUsebedKx+pITxHs+PjW38btB0xybA+YUUDVJ5iNR4yb51z6dxnJm7sopQt7lvPRnoRG
         /82QhH5hvJOIYLCD0ioAcqq1Dfm6LIemPhpopSh6URCTdvlw1wWXDTr4x7v0CgDFehto
         7ebkY2Ij4OmJliCZW8BNHKzuHXZJGwBJCqAm8JrkKq8z+DHnEVnpjN7VMkYZymHUBwSD
         QgyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=ObkffB07WFQrsghj6AjxlWg06fqRHH8RYrXXmhnsMxM=;
        b=nkDVjdQvOggeMaSzJ7TiDSN+5gIgyuATKa3sj7GsWE84X84wcxm7JMdCG4loOjaViH
         92L6TldiUCYVl8tkaSkvbGr9yhls2YEOtGC3q+TSF5JwEn0nEPSBfIVzKKuNgSC/8Gbj
         u+Rkgqi4FF4aAvauTCxcznW/YFFP121h+c6h4MnfCEHF6ksxtHwX+F5KSglnqxs+hbHb
         Qyi7oAUXqrR6cfasER2KmEC/BzWBvulNr6sRAqzEDqrJTzgyXR2psg1G5FJWV4PwBc3x
         Dp1y9DF/RFvVDvk3sqCLDWqnJn5HAq8qs/dPm0uqW8vf9lSWSO/FAE+TnUXcKpZK1dp+
         e4Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h33si185658qth.52.2017.05.11.06.38.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 May 2017 06:38:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8oIm-0008KO-Pj
	for alex.bennee@linaro.org; Thu, 11 May 2017 09:38:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d8oIh-0008K1-E3
	for qemu-arm@nongnu.org; Thu, 11 May 2017 09:38:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d8oIe-0003JJ-Bt
	for qemu-arm@nongnu.org; Thu, 11 May 2017 09:38:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42492)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d8oIe-0003Iv-6Y; Thu, 11 May 2017 09:38:36 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A4AD37EEE;
	Thu, 11 May 2017 13:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1A4AD37EEE
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1A4AD37EEE
Received: from localhost (ovpn-116-42.gru2.redhat.com [10.97.116.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02DBC7E219;
	Thu, 11 May 2017 13:38:33 +0000 (UTC)
Date: Thu, 11 May 2017 10:38:32 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170511133832.GI3482@thinpad.lan.raisama.net>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 11 May 2017 13:38:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 00/18] numa: add '-numa cpu' option
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZbZjpkd7BYT4

On Wed, May 10, 2017 at 01:29:44PM +0200, Igor Mammedov wrote:
[...]
> Igor Mammedov (18):
>   numa: move source of default CPUs to NUMA node mapping into boards
>   spapr: add node-id property to sPAPR core
>   pc: add node-id property to CPU
>   virt-arm: add node-id property to CPU
>   numa: add check that board supports cpu_index to node mapping
>   numa: mirror cpu to node mapping in MachineState::possible_cpus
>   numa: do default mapping based on possible_cpus instead of node_cpu
>     bitmaps
>   pc: get numa node mapping from possible_cpus instead of
>     numa_get_node_for_cpu()
>   spapr: get numa node mapping from possible_cpus instead of
>     numa_get_node_for_cpu()
>   virt-arm: get numa node mapping from possible_cpus instead of
>     numa_get_node_for_cpu()
>   QMP: include CpuInstanceProperties into query_cpus output output
>   tests: numa: add case for QMP command query-cpus
>   numa: remove no longer need numa_post_machine_init()
>   machine: call machine init from wrapper
>   numa: use possible_cpus for not mapped CPUs check
>   numa: remove node_cpu bitmaps as they are no longer used
>   numa: add '-numa cpu,...' option for property based node mapping
>   tests: check -numa node,cpu=props_list usecase

Queued on numa-next. Thanks!

-- 
Eduardo
