Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp266647lfh;
        Thu, 26 May 2022 05:33:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQO5fBVbtR2q4jYOJZKMtkojL4A0e3yVDO91s2qSjc/OK6K37TijERC8FSkAwKSyH2ggAg
X-Received: by 2002:ad4:5d66:0:b0:462:e89:fb8 with SMTP id fn6-20020ad45d66000000b004620e890fb8mr26080730qvb.80.1653568411734;
        Thu, 26 May 2022 05:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653568411; cv=none;
        d=google.com; s=arc-20160816;
        b=CNhihUf0pCXh7Yrr3LO6CKF9vQxj4DKxNfNcaE1ubxQzGCg7pE7f/5IiZClBFK0T7c
         DsVWdhR/GpRSNrP9zl4O+w2A3dAL049UmDOfkOhGsiK7yqn3GFbka7hWDK5tLMx8GFrm
         hunNo3USZ+5mtmiJkIjl1OCZdarGYGvvnBoxu9ZgcDHhLJNrBfPBuTqzY83poE8xRcUE
         exi6jB85zZV8jeONrwOCHU1Ch5O3rHuV6I6N3LaVU4tiApzcXbKzqzm0TNf6QhByrKXS
         7/51ZlQJ/IwCtHTK0/GPXBQdRI3QfdZ8eCaUXNCXf5owwEpqOXiL4azf2eNKLBYzaZ46
         hn2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=NiK7oLaNyQ97Rr7aPIZFSL6fAgvz9b/oxgmxveTBSqk=;
        b=SUUBSXElEHlz655n+lA4X/bCZChUFDNCXeWmO8/FSTWNqmgQjjFXtZVEi9MuqhukWP
         HQQIl9Lm62JVjuSg+eLU1QZ2SiC9p8iw5eWwTVmEz7tO355upmrkYMZ1nod6K1QON8cP
         4t/KSx9IiG5Yzs6OIDj7wBBsTABE9LjnaApBU07UYkkoyQSw/0TXQuy1Jr122OCjnLWG
         nIN25OoCr/+xWkXfDVRaykCdYNO2CeHT9McE6o4/3D+sO1Ti5je28e95J1LcTgvzl3/h
         mGz3xOhYBSdHjpFIRW2/bY4VUKhmVlF9GiiI81KTKWu68rdCsTEe7IjC/6gy+8o2NRTB
         5PtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Sh64cucb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10-20020a05622a174a00b002f926c5f1cbsi759264qtk.457.2022.05.26.05.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 May 2022 05:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Sh64cucb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuCgD-0008Se-VU
	for alex.bennee@linaro.org; Thu, 26 May 2022 08:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nuCYL-0008FZ-AG
 for qemu-arm@nongnu.org; Thu, 26 May 2022 08:25:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nuCYI-00034s-Ol
 for qemu-arm@nongnu.org; Thu, 26 May 2022 08:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653567917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NiK7oLaNyQ97Rr7aPIZFSL6fAgvz9b/oxgmxveTBSqk=;
 b=Sh64cucb/OICSXEMXICcWXRtgHXp+q2evJvbuaWsNYTQMV19eFtiAHJlfyh2QlR7Xkd98f
 Vu2/2IoPRuVwOaNnLicOO8/du9ZSD0xDv6tNRsisaqiJJ5uHcW7XFDYVMmnQ50cxY5qOvr
 GPYwLimzRS+Gk5ADxgnrGC0A+yOqdqo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-n-L1cRoVP5-ERUMiBp2LJA-1; Thu, 26 May 2022 08:25:16 -0400
X-MC-Unique: n-L1cRoVP5-ERUMiBp2LJA-1
Received: by mail-ej1-f69.google.com with SMTP id
 r13-20020a170906c28d00b006fec5bcd396so739572ejz.22
 for <qemu-arm@nongnu.org>; Thu, 26 May 2022 05:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NiK7oLaNyQ97Rr7aPIZFSL6fAgvz9b/oxgmxveTBSqk=;
 b=HoKenoNq/F/quck1EC7AdYyh8UtjQIHMwyumOv4eYFmPD1i6sYYVpMTL7xH8N+Za0k
 ucA3QCKGrdM2r5Q18TBwoANgqZA8QbsTe9fIFAx4LcqYUWAP2ACxVLm/9JygcxyBFTSj
 zeXJMg7W9pQSBspU8nmx09kD3Z+uCuMylt6DvNmz31B7pTLV0EesqlA9NOwFDbnGfQui
 YkcJNZ+lQOzfbJr9GBqfLdCThxfH1YokIt5Bm4z9ep4NngGg8RFhCtiNAXkxNsTFBeC0
 /p5MvenfPuGFxy1LXL4Jd9B6MDVDQ8pMWGFNYWBHkFuFQawA9kdztESYfHj5bQAa7IjI
 TIDA==
X-Gm-Message-State: AOAM533Ng7Do5Uan8bGPPAt9v/Uldd1gZ2edm/3+YuOtFBB1yn3JOrk1
 znnlxQzXXI/4WK7wRiIyt6b/Ghe8F3nMR/3jTIi+n5wTcBzNuO3fgS40nNvpg5DYqu9Sp01CWcg
 m+T1v6nVShmm8
X-Received: by 2002:a17:907:9243:b0:6fe:976a:e117 with SMTP id
 kb3-20020a170907924300b006fe976ae117mr32606481ejb.398.1653567915607; 
 Thu, 26 May 2022 05:25:15 -0700 (PDT)
X-Received: by 2002:a17:907:9243:b0:6fe:976a:e117 with SMTP id
 kb3-20020a170907924300b006fe976ae117mr32606454ejb.398.1653567915381; 
 Thu, 26 May 2022 05:25:15 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170906a38800b006f3ef214de7sm478722ejz.77.2022.05.26.05.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 05:25:14 -0700 (PDT)
Date: Thu, 26 May 2022 14:25:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 ani@anisinha.ca, drjones@redhat.com, wangyanan55@huawei.com,
 Jonathan.Cameron@Huawei.com, peter.maydell@linaro.org, berrange@redhat.com,
 thuth@redhat.com, eduardo@habkost.net, lvivier@redhat.com,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 2/3] hw/acpi/aml-build: Fix {socket, cluster, core} IDs
 in PPTT
Message-ID: <20220526142512.32129b2e@redhat.com>
In-Reply-To: <20220518092141.1050852-3-gshan@redhat.com>
References: <20220518092141.1050852-1-gshan@redhat.com>
 <20220518092141.1050852-3-gshan@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 3oQU+/UEOt82

On Wed, 18 May 2022 17:21:40 +0800
Gavin Shan <gshan@redhat.com> wrote:

> The {socket, cluster, core} IDs detected from Linux guest aren't
> matching with what have been provided in PPTT. The flag used for
> 'ACPI Processor ID valid' is missed for {socket, cluster, core}
> nodes.

To permit this flag set  on no leaf nodes we have to have
a corresponding containers built for them in DSDT so that
'ACPI Processor ID' could be matched with containers '_UID's.
If we don not build such containers then setting this flag is
not correct. And I don't recall QEMU building CPU hierarchy
in DSDT.

> In this case, Linux guest takes the offset between the
> node and PPTT header as the corresponding IDs, as the following
> logs show.

perhaps it's kernel which should be fixed to handle
not set 'ACPI Processor ID valid' correctly.

> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64    \
>   -accel kvm -machine virt,gic-version=host -cpu host        \
>   -smp 8,sockets=2,clusters=2,cores=2,threads=1
>     :
> 
>   # cd /sys/devices/system/cpu
>   # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
>     36  36  36  36  36  36  36  36
>     336 336 336 336 336 336 336 336
>   # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
>     56  56  56  56  196 196 196 196
>     356 356 356 356 496 496 496 496
>   # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
>     76  76  136 136 216 216 276 276
>     376 376 436 436 516 516 576 576
> 
> This fixes the issue by setting 'ACPI Processor ID valid' flag for
> {socket, cluster, core} nodes. With this applied, the IDs are exactly
> what have been provided in PPTT.
> 
>   # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
>   0 0 0 0 0 0 0 0
>   1 1 1 1 1 1 1 1
>   # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
>   0 0 0 0 1 1 1 1
>   0 0 0 0 1 1 1 1
>   # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
>   0 0 1 1 0 0 1 1
>   0 0 1 1 0 0 1 1
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/acpi/aml-build.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index e6bfac95c7..89f191fd3b 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2026,7 +2026,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>              core_id = -1;
>              socket_offset = table_data->len - pptt_start;
>              build_processor_hierarchy_node(table_data,
> -                (1 << 0), /* Physical package */
> +                (1 << 0) | /* Physical package */
> +                (1 << 1),  /* ACPI Processor ID valid */
>                  0, socket_id, NULL, 0);
>          }
>  
> @@ -2037,7 +2038,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  core_id = -1;
>                  cluster_offset = table_data->len - pptt_start;
>                  build_processor_hierarchy_node(table_data,
> -                    (0 << 0), /* Not a physical package */
> +                    (0 << 0) | /* Not a physical package */
> +                    (1 << 1),  /* ACPI Processor ID valid */
>                      socket_offset, cluster_id, NULL, 0);
>              }
>          } else {
> @@ -2055,7 +2057,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  core_id = cpus->cpus[n].props.core_id;
>                  core_offset = table_data->len - pptt_start;
>                  build_processor_hierarchy_node(table_data,
> -                    (0 << 0), /* Not a physical package */
> +                    (0 << 0) | /* Not a physical package */
> +                    (1 << 1),  /* ACPI Processor ID valid */
>                      cluster_offset, core_id, NULL, 0);
>              }
>  

