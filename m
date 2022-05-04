Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp325307lfj;
        Wed, 4 May 2022 06:47:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxrjFQMDxxwGvW3Qk15F8gR6KSMQB8A5ptG7sj+RTb7IF97ImZxkL08qoU7qA9zBDDu+yy
X-Received: by 2002:a05:622a:1649:b0:2f3:a6bc:73ea with SMTP id y9-20020a05622a164900b002f3a6bc73eamr12589961qtj.506.1651672056913;
        Wed, 04 May 2022 06:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651672056; cv=none;
        d=google.com; s=arc-20160816;
        b=cloIG64QeDPnM1FMNF19/T7rlGSQGB7SyOslVhBA2fEuYcW4Qiw2a0egViCZ+dumie
         XqGC/yQpheycQZ5OK/co6WxH2kv5HKVKVU0i8xgehcHmqB9MRRYpA47A2hS1amj91KRp
         tL03HvV3dJRkurAREO/SDZA7QeQGHquzmoAj/v/i1fyPH3C4TrEJty5zurT5iDA0B//2
         3yhq2ngs7/tRZm74+Pq42hOKS0h/wEec/HfPl5A6smsQmLZXAGLY76+6S4YmWotXvtnn
         OUnazwccw9OTFGBxgGoTB3EqInbe/z6qGOI3wtdpd0xmVt9iPZ+STJkHmIj7gE0YXvg3
         odRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=/lpDh6gK9irmqxQs1mt+Zsz8sF8AUdOJKIPrb5KkDjU=;
        b=NPBOCqblF8m0g45yWmphdRBVwGg8BuZDYdXXNLWQbgA5HddbVlwZmHpgn9vadvO1eb
         5Zs8NMgQlBtyPdm2ugK9/G6ZOm9XFbx8je0bC+0qyT71SjBe4H9CVTY6CCCvboSOW9KS
         U9C4zQIoNzGW/NUplXfkO8z9EvTYolP++woU5ydcIviOXv0Hz400RHHtSGpF7jqjjO6x
         jTr/KFhDleAd4GKps9aqr8j5Sj2C27rX1QoeVgc1p0pekvAWROVsyi64Cnm2ABYgVT62
         8W2RqZnUaXid6UwWEwkpQlpvJaRvLu8cLw1cwk2fxsUM2YSqeV7Pimhoy06UriVqdrAI
         5YFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WUe0MeZn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020a05620a0c5400b0069f846674bbsi10688977qki.579.2022.05.04.06.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 May 2022 06:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WUe0MeZn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmFLs-0001FF-7U
	for alex.bennee@linaro.org; Wed, 04 May 2022 09:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nmFL5-0001Ci-4y
 for qemu-arm@nongnu.org; Wed, 04 May 2022 09:46:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nmFL2-0002eJ-0u
 for qemu-arm@nongnu.org; Wed, 04 May 2022 09:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651672002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lpDh6gK9irmqxQs1mt+Zsz8sF8AUdOJKIPrb5KkDjU=;
 b=WUe0MeZncehCLdtrCbHuzOxDTlCbgd7StlrT9YpFuk9DeFIJkWmJDHlwK7ozNFhlI6DhjA
 KftzkMDFZdIM3jEGUaK5nwdh7gD3NPOV6ER7hAnEhK444SDfezVTtbsRhcglYrT4FZE2/6
 8ZR2MPimkzRktsEO82VDV0K2C59gcxM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-Wve0lnHXM4-5L3SItrya3g-1; Wed, 04 May 2022 09:46:41 -0400
X-MC-Unique: Wve0lnHXM4-5L3SItrya3g-1
Received: by mail-wr1-f69.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so389311wra.15
 for <qemu-arm@nongnu.org>; Wed, 04 May 2022 06:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/lpDh6gK9irmqxQs1mt+Zsz8sF8AUdOJKIPrb5KkDjU=;
 b=BOvzFYTwZfAYhuaS/skp/uRC67xzDnz1KUGduEcM17lZ6zPQv4G9MMlwr8vRLPT8uH
 uATB+ubavkeTJPbtucFof/39v53pNxy8ZUTQkSy3Tt4tE5ROsxEspKs1PL5eaKEUgX9W
 xCtC39neomtBUe0dcejfRzbTDHnQxEHtnJdsp+pslTVb6PSDDKrBXbAj7rt2tzyMBSW+
 tDWTkOiP9+jXwFlvzuzL1HMS9YovinQmKTtYHHUVJLRAubj9HLp/x+R5TaRnwuOJqxDz
 BQiIIths4fbw/ChXO/pP2KTim422co8ZYkThtQPCEW7qPnrcxqb5Vr3pxRiRxW8sqalJ
 prJg==
X-Gm-Message-State: AOAM531fLFUdy+nuKa9Y8knBBJBYXR5c1kgv530jGcg00IZGo6n9fm8k
 Jva0wq1IsnK9950REASzXERqOjcCBKoe4vTwaH3D+gxQaP1se/l+9P2HgH9VN0yi1J7R7hC0wyt
 DMqSFOX2FneJq
X-Received: by 2002:a05:6000:381:b0:20c:5e07:f75f with SMTP id
 u1-20020a056000038100b0020c5e07f75fmr9310485wrf.678.1651672000116; 
 Wed, 04 May 2022 06:46:40 -0700 (PDT)
X-Received: by 2002:a05:6000:381:b0:20c:5e07:f75f with SMTP id
 u1-20020a056000038100b0020c5e07f75fmr9310449wrf.678.1651671999787; 
 Wed, 04 May 2022 06:46:39 -0700 (PDT)
Received: from localhost ([185.140.112.229]) by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c4ec800b003942a244f57sm4023378wmq.48.2022.05.04.06.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 06:46:39 -0700 (PDT)
Date: Wed, 4 May 2022 15:46:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, Jonathan.Cameron@Huawei.com,
 drjones@redhat.com, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH v9 4/6] qtest/numa-test: Correct CPU and NUMA
 association in aarch64_numa_cpu()
Message-ID: <20220504154637.17cfc995@redhat.com>
In-Reply-To: <20220503140304.855514-5-gshan@redhat.com>
References: <20220503140304.855514-1-gshan@redhat.com>
 <20220503140304.855514-5-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HnW/iOpLEDMl

On Tue,  3 May 2022 22:03:02 +0800
Gavin Shan <gshan@redhat.com> wrote:

> In aarch64_numa_cpu(), the CPU and NUMA association is something
> like below. Two threads in the same core/cluster/socket are
> associated with two individual NUMA nodes, which is unreal as
> Igor Mammedov mentioned. We don't expect the association to break
> NUMA-to-socket boundary, which matches with the real world.
> 
>     NUMA-node  socket  cluster   core   thread
>     ------------------------------------------
>         0       0        0        0      0
>         1       0        0        0      1
> 
> This corrects the topology for CPUs and their association with
> NUMA nodes. After this patch is applied, the CPU and NUMA
> association becomes something like below, which looks real.
> Besides, socket/cluster/core/thread IDs are all checked when
> the NUMA node IDs are verified. It helps to check if the CPU
> topology is properly populated or not.
> 
>     NUMA-node  socket  cluster   core   thread
>     ------------------------------------------
>        0        1        0        0       0
>        1        0        0        0       0

I'd place 'socket 1' on node 0, so it wouldn't look odd.
But it probably doesn't matter, so

Acked-by: Igor Mammedov <imammedo@redhat.com>

> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  tests/qtest/numa-test.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> index aeda8c774c..32e35daaae 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -224,17 +224,17 @@ static void aarch64_numa_cpu(const void *data)
>      g_autofree char *cli = NULL;
>  
>      cli = make_cli(data, "-machine "
> -        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "
> +        "smp.cpus=2,smp.sockets=2,smp.clusters=1,smp.cores=1,smp.threads=1 "
>          "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
> -        "-numa cpu,node-id=1,thread-id=0 "
> -        "-numa cpu,node-id=0,thread-id=1");
> +        "-numa cpu,node-id=0,socket-id=1,cluster-id=0,core-id=0,thread-id=0 "
> +        "-numa cpu,node-id=1,socket-id=0,cluster-id=0,core-id=0,thread-id=0");
>      qts = qtest_init(cli);
>      cpus = get_cpus(qts, &resp);
>      g_assert(cpus);
>  
>      while ((e = qlist_pop(cpus))) {
>          QDict *cpu, *props;
> -        int64_t thread, node;
> +        int64_t socket, cluster, core, thread, node;
>  
>          cpu = qobject_to(QDict, e);
>          g_assert(qdict_haskey(cpu, "props"));
> @@ -242,12 +242,18 @@ static void aarch64_numa_cpu(const void *data)
>  
>          g_assert(qdict_haskey(props, "node-id"));
>          node = qdict_get_int(props, "node-id");
> +        g_assert(qdict_haskey(props, "socket-id"));
> +        socket = qdict_get_int(props, "socket-id");
> +        g_assert(qdict_haskey(props, "cluster-id"));
> +        cluster = qdict_get_int(props, "cluster-id");
> +        g_assert(qdict_haskey(props, "core-id"));
> +        core = qdict_get_int(props, "core-id");
>          g_assert(qdict_haskey(props, "thread-id"));
>          thread = qdict_get_int(props, "thread-id");
>  
> -        if (thread == 0) {
> +        if (socket == 0 && cluster == 0 && core == 0 && thread == 0) {
>              g_assert_cmpint(node, ==, 1);
> -        } else if (thread == 1) {
> +        } else if (socket == 1 && cluster == 0 && core == 0 && thread == 0) {
>              g_assert_cmpint(node, ==, 0);
>          } else {
>              g_assert(false);

