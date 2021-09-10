Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp936765lfb;
        Fri, 10 Sep 2021 01:17:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwM2nzqGXCsz6fIbKkoV93qh2qbfIh75Yj7EV5qrrVeBBYm7DljynmV/4azBJVLEGS1qC96
X-Received: by 2002:a02:c64a:: with SMTP id k10mr3611082jan.112.1631261859391;
        Fri, 10 Sep 2021 01:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631261859; cv=none;
        d=google.com; s=arc-20160816;
        b=f1WeJiHlHLwZpRNtTnuCQeksXB1XyqLxaKw5D8m6U+Z7mIOdgNnuyCMboVS3/cngCH
         s3nL5ExHigF6KU5mVI009RLgzBx1vrDIha51ZhOTpVC5mNj64u7e1HJVkvzfccCAw6Ni
         s/9s+SNJCgeo4DHQ98iXgRVhpL9LGAdF1TIG9x0SWRWYmTnSn4sOhfPOHIC2jVT5NM+L
         0Ysuka/W/7YPPSoWjZeJqOH7GDGGbfDuRdKtAQr7sBBedB4w7t0TLuwVo3l33Yrtq6qi
         WHzgylk5Z77q3vQZrxboViUxFz4sNJtpU4lNFy54coQGBUUxsIiHI9eTilbwRzzoxarW
         6Zyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=RdDI9AlEhfxcHRz6GN8W0hhrroxvN2k4O9RC/r0Ttiw=;
        b=Q+a8HZyNgyyn3t4TfFmhQ1e1jxOD+TLI7A3YRAbsRs9XMtGLTW25loCm5KTHWxktbd
         akatkHGkaUrP/J8/nYNU6jjGS2M52owxNWNW1nmze14EGTSZ9Mr92eDTdDEhIYY0wBt8
         cBIHxA5J+L7GBYc+g6XqaVJhWgR9RL/XrzjHiTJyFkuVlPcIJSSzDous7AakPk1FcWVV
         7qGZZf2QgOWYC/MV8l8eoiv3VhEbAj0K/5dQG2eE0H4pizvWZX/BEs98IWXbPbs2MxPO
         BKX6f5+0OZBBBEce2AZSaMTePozFt+EK9vYhFbDEw0RWdtmTCQPkKuQAfxpbKTxLkxn/
         lkww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Y9yJ/PKa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l39si4284279jac.108.2021.09.10.01.17.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 01:17:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Y9yJ/PKa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mObj8-0006Ki-OW
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 04:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mObid-0006Ia-0D
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 04:17:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mObib-0006iW-59
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 04:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631261822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RdDI9AlEhfxcHRz6GN8W0hhrroxvN2k4O9RC/r0Ttiw=;
 b=Y9yJ/PKaG+cpm8QxZzdDayw02QJoAyuEAqLMkAumeiB8qGPAqhF/kBdA+SMxvGLY0hAdI/
 uVfRwXP0MR49U3CoAAU7DoC31xByBbN64IPsx8yCeHTiOehGQHCJG/cWNYM0rJGqiSRKjO
 3ftl+wciG4HWrhCV4xOkh8o5vlp0Jrk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-ZXGmWReENLaL3VRIh5E3Dw-1; Fri, 10 Sep 2021 04:17:01 -0400
X-MC-Unique: ZXGmWReENLaL3VRIh5E3Dw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r3-20020a05600c35c300b002fbb0888a42so605005wmq.6
 for <qemu-arm@nongnu.org>; Fri, 10 Sep 2021 01:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RdDI9AlEhfxcHRz6GN8W0hhrroxvN2k4O9RC/r0Ttiw=;
 b=gYwRfXj9N8zDBEuDduY5R2ecGmP45s0cVtl1vyT1dFc0/zPR51yAF1NcolO6yF+c7s
 zjuEl7JoGikj9ybjUdGaM0P8xUyRU01fM4rUA07vtNS2I6/zpqieS96TQLgqnLQxbrsW
 3ji+krQWXeMzkEw4ifTvsSeKMjsRe18cJgOTcNZYjI/rXvRCUJF9nTLHQqhdSgjSuM0e
 BKGiPVG4xueBVoNEHLcOcITa7Dwe81inZ0+9csJnQK9iEPXjqtT1cSwZwqCDRo3PgRTh
 D51qT8inlH0DRhRsdl0Cr8+K0QjJQCyMlnI8KtJ4zEY3joxexrjgZZ3QgWtPgh9ALEkE
 IeAw==
X-Gm-Message-State: AOAM532EI4MABdLFeWYPhXzgmA8WdjE54itkCUKnq/bPWyNdJNTDEz3f
 Tt75/lw4hVrnpbQ9RAUPmPtRAyZ3IcHwFsboXtato1Z3GsIYaxh3/9liwrGr4xEjWXtKOVZpD9I
 qX0PH4J7kyJNQ
X-Received: by 2002:a5d:6902:: with SMTP id t2mr6079358wru.23.1631261820447;
 Fri, 10 Sep 2021 01:17:00 -0700 (PDT)
X-Received: by 2002:a5d:6902:: with SMTP id t2mr6079325wru.23.1631261820273;
 Fri, 10 Sep 2021 01:17:00 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id c9sm4079551wrf.77.2021.09.10.01.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 01:16:59 -0700 (PDT)
Date: Fri, 10 Sep 2021 10:16:57 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v9 06/16] qtest/numa-test: Use detailed -smp CLIs in
 pc_dynamic_cpu_cfg
Message-ID: <20210910081657.3622zphyadnso4nj@gator>
References: <20210910073025.16480-1-wangyanan55@huawei.com>
 <20210910073025.16480-7-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210910073025.16480-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hgLUBXSuwrle

On Fri, Sep 10, 2021 at 03:30:15PM +0800, Yanan Wang wrote:
> Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
> the preference of sockets/cores in -smp parsing is considered liable
> to change, and actually we are going to change it in a coming commit.
> So it'll be more stable to use detailed -smp CLIs in testing if we
> have strong dependency on the parsing results.
> 
> pc_dynamic_cpu_cfg currently assumes/needs that there will be 2 CPU
> sockets with "-smp 2". To avoid breaking the test because of parsing
> logic change, now explicitly use "-smp 2,sockets=2".
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
> index c677cd63c4..fd7a2e80a0 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -265,7 +265,8 @@ static void pc_dynamic_cpu_cfg(const void *data)
>      QTestState *qs;
>      g_autofree char *cli = NULL;
>  
> -    cli = make_cli(data, "-nodefaults --preconfig -machine smp.cpus=2");
> +    cli = make_cli(data, "-nodefaults --preconfig "
> +                         "-machine smp.cpus=2,smp.sockets=2");
>      qs = qtest_init(cli);
>  
>      /* create 2 numa nodes */
> -- 
> 2.23.0
>

 
Reviewed-by: Andrew Jones <drjones@redhat.com>

