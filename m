Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp937139lfb;
        Fri, 10 Sep 2021 01:18:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUYjLTbJpdkaR6PKOtzuejWwB/On5TjhRV+j/+lqmdbS10psUStT1MmD4bVEKv8LpR0cS8
X-Received: by 2002:a25:5683:: with SMTP id k125mr9488939ybb.447.1631261898441;
        Fri, 10 Sep 2021 01:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631261898; cv=none;
        d=google.com; s=arc-20160816;
        b=FtKJCvNoEyH3nzHj6dc6I47q+GxyxWnJ7vsPcE2BlRfL4lQFJlaIfFyY9SuxnQL5F2
         tisoIBHbmtLpbRCmJ3mIbS1Teo3SP+bw8WBGDEDGsPVx3tMinnl63F6w/Im6hFZ2/8Lb
         jyzJNY/Y6nuOim5Lh3CspYJp8quD2b+1HCMyMmyAvE+KYuLfyS2if48xTJAT6+GK5JjK
         D6+LfnNVuYIsu3Q2jAMqzQDVcK03Y115ucajYBc37XAWZCzxRMIOQvmgndpJTZz3jRPL
         g0G8RZuSOLzmZaqVZcdxgzmAwtYEQHQBwm88Gq7ZvB+yqD1RxR871uvJuiqZFScM/6RA
         vbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=X7MUuk/lmbQBjiOz5XQ5oZ0/keF6sjNrAgAK+fRRA8A=;
        b=GVjT8BRQZZjP7qF+eJftiw4D2p6wjORzGaqya0MD6vXEmHMpn3eJG7f8oKEXXDncKJ
         O41nXEADZ8u6DiK9n+RGur4x9FHs/2Z5HvyYyACP3N9vBPyQM58jxKdJM8kKNHtKhzD1
         ntAiVLs5ejTBiFzoXLKDcWzuFPJNc4UreZHga1wFdX7hR+tFDaIV4t6SzBbQVrpZljoz
         FVcpQK9mjrblojubggtlG3E+bZzj85vUnlhGfuk3HcigMYj7KfnQfZT0cA1ikODhwH2c
         9HPus38khiKvB00fF9WrqiBb+sNP91LBxXHZeOIDLmvKwDqs4myZW2lpdfF3s6bGdnWu
         PhtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ccgCbJO2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1si4364677ybi.301.2021.09.10.01.18.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 01:18:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ccgCbJO2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mObjl-0007cn-Qs
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 04:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mObjW-0007Zv-CT
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 04:18:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mObjT-0007Rj-SG
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 04:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631261876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X7MUuk/lmbQBjiOz5XQ5oZ0/keF6sjNrAgAK+fRRA8A=;
 b=ccgCbJO2ASIoPr2rIY86AEARquyfs8R4b/9J+Gmu1E/Oqxbre4UAVmito/SNV5GFVxmBWd
 ZDPBbh8qs6VbWWDbb9CH+j8+s/X9IO/g6SBWY2gJ98mY3gt8kk8W0b6rVgyvF7jBr4vm7W
 M6BFSv3bw0kHpQpvDllsVmKZU9IW6go=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-xcc-2AKqNnaNYRSp5o7AdQ-1; Fri, 10 Sep 2021 04:17:55 -0400
X-MC-Unique: xcc-2AKqNnaNYRSp5o7AdQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so423941wmj.6
 for <qemu-arm@nongnu.org>; Fri, 10 Sep 2021 01:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X7MUuk/lmbQBjiOz5XQ5oZ0/keF6sjNrAgAK+fRRA8A=;
 b=477TXWcN6wlHlNkDfEfgffWJsL6JmwxOKGEi6y1rB0Xaygq9u401WXr34mnQMRR1j/
 YucU0YOzx2CjzTLO5bYdzg6hkcF9Xx76YdXYFR4Gp8dVSNyc20eyFheh0uxsWCHMGJN8
 S2SkhznQRhGEcu5jIJ8UHnP1b6IZrLiE/K3fTEqmV6fLShit9BhARbJ72Zn2u0EMb3kC
 uz10mvT/M2110Bnl6XssFmcbq/9UwRPq6amZS1NDGZ4TvERLWAGn0v0VBLyXPD+o+3Aw
 uwT/bZmz8Z9jUEy6udAk6mbuhmzpom26MxFBnQsVbvmD7bcWxcy7ezTCy3zQrIaPY0/+
 tlxw==
X-Gm-Message-State: AOAM530EAX1fBKUC9LcGEqj4se8eSe1A3EVLRKwbT798WYlysaSlt4GI
 ieFwS83GXo8907gnQoJoG7htAO4m2/fRi9DHVEPcJmfcKXs1bCbbpxkbY0Jfagg5o2P6ftj6OCx
 Ru9GE0+Rfs3NF
X-Received: by 2002:a1c:4e14:: with SMTP id g20mr7028872wmh.64.1631261873878; 
 Fri, 10 Sep 2021 01:17:53 -0700 (PDT)
X-Received: by 2002:a1c:4e14:: with SMTP id g20mr7028861wmh.64.1631261873754; 
 Fri, 10 Sep 2021 01:17:53 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id k18sm3622047wmi.25.2021.09.10.01.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 01:17:53 -0700 (PDT)
Date: Fri, 10 Sep 2021 10:17:51 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v9 07/16] qtest/numa-test: Use detailed -smp CLI in
 test_def_cpu_split
Message-ID: <20210910081751.jptjdea3qhuu6jsa@gator>
References: <20210910073025.16480-1-wangyanan55@huawei.com>
 <20210910073025.16480-8-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210910073025.16480-8-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N4vPDNF+Byl2

On Fri, Sep 10, 2021 at 03:30:16PM +0800, Yanan Wang wrote:
> Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
> the preference of sockets/cores in -smp parsing is considered liable
> to change, and actually we are going to change it in a coming commit.
> So it'll be more stable to use detailed -smp CLIs in the testcases
> that have strong dependency on the parsing results.
> 
> Currently, test_def_cpu_split use "-smp 8" and will get 8 CPU sockets
> based on current parsing rule. But if we change to prefer cores over
> sockets we will get one CPU socket will 8 cores, and this testcase
> will not get expected numa set by default on x86_64 (Ok on aarch64).
> 
> So now explicitly use "-smp 8,sockets=8" to avoid affect from parsing
> logic change.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/qtest/numa-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> index fd7a2e80a0..90bf68a5b3 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -42,7 +42,8 @@ static void test_def_cpu_split(const void *data)
>      g_autofree char *s = NULL;
>      g_autofree char *cli = NULL;
>  
> -    cli = make_cli(data, "-machine smp.cpus=8 -numa node,memdev=ram -numa node");
> +    cli = make_cli(data, "-machine smp.cpus=8,smp.sockets=8 "
> +                         "-numa node,memdev=ram -numa node");
>      qts = qtest_init(cli);
>  
>      s = qtest_hmp(qts, "info numa");
> -- 
> 2.23.0
>

 
Reviewed-by: Andrew Jones <drjones@redhat.com>

