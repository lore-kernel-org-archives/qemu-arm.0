Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp380425lfq;
        Thu, 17 Sep 2020 01:31:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuP27cWNlm+FhW4Eb7x8onF02DVnLt19DTtfeZv7mIApToaUm61PtCQMad+tLpoLIQxef1
X-Received: by 2002:a5b:889:: with SMTP id e9mr5418978ybq.192.1600331512838;
        Thu, 17 Sep 2020 01:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600331512; cv=none;
        d=google.com; s=arc-20160816;
        b=sTx3kKaB0DoO/gA93SMMqr0nKuLxw7IW9MvJTNECe0frntnhYpjgB9ggceSFChFJwu
         dwJylWver0H+aXmVWGCRUxlBeCyIuRVyMrL6mG8GDXJbD75u2zlPv/9pohBV7Y2HhQsz
         +5G1nYCPPLqUAoeYlXOIiHq/tLxXmyMA4skGFQXBOxE70aHvojxqoK+RdYI59yZfUoJc
         eMOyXL86NziRFJ0AASEmU2L2BxidKvn7olR/Q1oaUUyuXUUgp4v9A8CcCPhWeCEywWj9
         Gt7GpYqtoEXF+B+d1vjemqJJukVkeg/uj3go6W4nzYpa52rib+2qmdMoLMJ6ORgGF9Rh
         f2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=nTmOOY6ZmAf/9WSAJFVy6jPQ/eMy1StMsvqyxPAhAyc=;
        b=XlIFDIpqWk2MzXmtXJSJ/3+G3b/xA/arn9CmHwtpUERbeB/7Jjj0yakXtjineXW2/K
         2DwjicxiKv9ZIYljzt5k4KFSrG4XzvoUggao4RbRassd2jFtycYlwiuLCKXr48yAWRI+
         p63ZyX5IjiB2qvL4DQdMpglpUOOm4kN8ughFa68mJjpyjioXOAh3CZc+vBnBy37SmlQm
         bKI3hd2KmiE92P38CglJvR6d6Pe4UFEi/cT0zPsFXtfokC6FEKKi81whiE9G3vkacMLb
         53BGj10yeI6k6NDh0G5pgEFQBxS7l5v1CngwHEcqpNwqNBFFW1rH4m28fJmh8StNnPJi
         oyig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Oo+H3pbe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i70si8769259yba.227.2020.09.17.01.31.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 01:31:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Oo+H3pbe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIpKa-0007aY-0c
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 04:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kIpHt-0004sW-Qw
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 04:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kIpHr-00067u-5g
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 04:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600331342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nTmOOY6ZmAf/9WSAJFVy6jPQ/eMy1StMsvqyxPAhAyc=;
 b=Oo+H3pbeyUP/Nub7TeyJ77Tcgk67R4t1uLHGYTf0zEP5deygnYgINfsYKcxfVOJ3Br2JE3
 4GgLVcUpMTUR9gmEkst40dbMcdsg6OgODz4uLb1jhLIy5JRdjokgM6bbhG6pZO9ZhyFZtw
 XSBmGWYCPPiaokhwUEBUfF8g99LHVEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-tGnnHg3KMCmfoiLYKNfPhg-1; Thu, 17 Sep 2020 04:28:58 -0400
X-MC-Unique: tGnnHg3KMCmfoiLYKNfPhg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94FA9873088;
 Thu, 17 Sep 2020 08:28:56 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51C837880D;
 Thu, 17 Sep 2020 08:28:54 +0000 (UTC)
Date: Thu, 17 Sep 2020 10:28:51 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH 08/12] hw/arm/virt-acpi-build: add PPTT table
Message-ID: <20200917082851.mvxldh4eifsfpayo@kamzik.brq.redhat.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
 <20200917032033.2020-9-fangying1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200917032033.2020-9-fangying1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 02:01:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g8+zIVT25joc

On Thu, Sep 17, 2020 at 11:20:29AM +0800, Ying Fang wrote:
> Add the Processor Properties Topology Table (PPTT) to present CPU topology
> information to the guest.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 42 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>

There's a new version of this patch on the refresh branch.
https://github.com/rhdrjones/qemu/commits/virt-cpu-topology-refresh

drew 

