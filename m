Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp228665ejy;
        Thu, 22 Sep 2022 04:57:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7WqkyisrIOT7CnpFmuE6qNZKcCAnlxJBHtqEK3G8NKjOQxEcNEyPwqr6Hc5XSX3yPA+tEn
X-Received: by 2002:ac8:5fc5:0:b0:35c:e881:6c96 with SMTP id k5-20020ac85fc5000000b0035ce8816c96mr2449158qta.466.1663847835809;
        Thu, 22 Sep 2022 04:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663847835; cv=none;
        d=google.com; s=arc-20160816;
        b=rKCpYVKeBix/do8FIJYaVIC+onpes/eQKuut1SfLuvtGSVNAp9LgPeo5cQVMlcQN0C
         Vpw6rCeO9r5Zv8qAnSu7ffI0MdNTNzgEgXkO58WuvyNvs3RD8lB9wcE8VuqccIgWDOMM
         ZpU71jEjRo5gkTgaw58KMj6+IHclP1LtOzdxPXkwUrek1HrKKrO94TegClXH32SP/15a
         Xzw+86BL2uFn1IFJS3A63/XJfQNg6kGe3LmyH4le8oyclXayRurKro78TSEPJdOFdGVo
         iP/Q+Hlsgcmat3sXhwfzrmNpseIyN+qCZoM9kmmF4snik9zUIYw/LntY8ZcCBqX+jTcm
         xpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DBxu8oBCazvdB2SbjQpjzcq6y/5GSsJwjR9oyLAsvp0=;
        b=Y+Lf/kUMmPkcscuBsL0CW8WNgUhbLySYjje/mNIDWr4PhBWqWQ5iwWjkrv1xwhgAd+
         8DqoiOwU0Ba+4mB+dENX8WGYkBmgdYluy1hPZILge+HngLlWzLSy8mKL199CasrzLzos
         sfxJcuPdUN0ZWud9UEeq0Ks1EzsEt9MbBBGObV4dmpvLwvATkVvaP0BzZCLEc1MEKH+F
         ATlHYTyCT+/KTdP5POc5WNjPxmJkGZbsNTecXkLLpkeb5XrsuhPPkeK0UKGwXyaLI0M8
         SsK5KSgNaZ/DmipkIcjui5Yk5ef0x2PSsqVI1J41/nT1dvH0/puV2H7x8/B4zzoq4eHD
         8C5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YmZ7hGCm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15-20020ac8610f000000b0035d08c1da3bsi2916381qtm.461.2022.09.22.04.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Sep 2022 04:57:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YmZ7hGCm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1obKpO-0002yP-Qs
	for alex.bennee@linaro.org; Thu, 22 Sep 2022 07:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obK5e-0008BX-9f
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 07:10:07 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obK5W-0006cX-Sq
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 07:09:52 -0400
Received: by mail-ej1-x634.google.com with SMTP id a26so20244499ejc.4
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 04:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=DBxu8oBCazvdB2SbjQpjzcq6y/5GSsJwjR9oyLAsvp0=;
 b=YmZ7hGCm6qyWfHGM8guRCCMCiz7RUUL94N+1XE3WjJzFhpF9JmnjxH+tpzAR5YqQQa
 KHTWfKd89jrJRpRGUK76HRUsESRNTpxUEOwhGLM/PER9ozfAj8zyQZvoT48FCxcVeOqV
 r/xEm4PCtvBVGTUxDKYpRZftQ2xqik+BHaqVdFjUsqDPFwmzX/FnoAsENOt5KO4t43OV
 YC+H8dgbA/BnUkZOLzTa+eKs1ReLGQMLc3NiYxH81EGX3QORnhV6pN2SjHDxOke2fkzG
 LSgLEbAL2ipPuj5AFQflIu6kKLbaJzo4ykzGk+2vlI9tIb4xO2jHVM4n7amHsl/7tx0A
 7zkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=DBxu8oBCazvdB2SbjQpjzcq6y/5GSsJwjR9oyLAsvp0=;
 b=6IhY70y+RO0XBuorxUA4ywAan/fFeoNHyB5dXBJxjnrmAu6FYbdD44egrrTJDBHn5F
 +YtPR7Bp6xvAj/Kq2447hwUXQBzRhwlcMisXFjwmK031Tg82KCC/jGG2p7evPnrHwhh5
 Q7JSBBC1NL70U72kidgcj6GLLm766y1LEEp2IpGo0a5QdkxOdPN0y5I/l1BQI0gM9JYO
 RLNwn9K9TLpXYI9/5zAlMZLHlg7F4Gswt5MN0EdvObcmdXXe2SECsDdruRJmYjtn6o7w
 81lJinVJkUFfH80jSWAmcH/0Yph8UNVlTMs/KwEytxPd2IsM2VZkyKoARHpY1GKYkP5l
 GtCw==
X-Gm-Message-State: ACrzQf3fX2P2HRA3VxyaEUcWA51zHmZbOC9nAO7bn2JORoh+GPfDwWvZ
 j3Pf8ujdsOoPYerAOlPNXi66MzWzyQpvRvuUPVIkyg==
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr2222292ejb.609.1663844985713; Thu, 22
 Sep 2022 04:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220816094957.31700-1-zhukeqian1@huawei.com>
 <20220824170433.7ba675ca@redhat.com>
 <CAFEAcA8jdjkZc24FqXBbw+LBJZ5HiCygqY3Y0S2TtmRzdx1P-A@mail.gmail.com>
 <20220921152218.7b55dc76@redhat.com>
In-Reply-To: <20220921152218.7b55dc76@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 12:09:34 +0100
Message-ID: <CAFEAcA_jgrcrhJjxuBRUR0w2Z6-4kaPJHD=3oqUGWePnhSX5GQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/acpi: Add ospm_status hook implementation for
 acpi-ged
To: Igor Mammedov <imammedo@redhat.com>
Cc: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 qemu-trivial@nongnu.org, Eric Auger <eric.auger@redhat.com>, 
 Peter Xu <peterx@redhat.com>, wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KfDZ0VugkuVp

On Wed, 21 Sept 2022 at 14:22, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Tue, 20 Sep 2022 14:15:36 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Wed, 24 Aug 2022 at 16:04, Igor Mammedov <imammedo@redhat.com> wrote:
> > >
> > > On Tue, 16 Aug 2022 17:49:57 +0800
> > > Keqian Zhu <zhukeqian1@huawei.com> wrote:
> > >
> > > > Setup an ARM virtual machine of machine virt and execute qmp "query-acpi-ospm-status"
> > > > causes segmentation fault with following dumpstack:
> > > >  #1  0x0000aaaaab64235c in qmp_query_acpi_ospm_status (errp=errp@entry=0xfffffffff030) at ../monitor/qmp-cmds.c:312
> > > >  #2  0x0000aaaaabfc4e20 in qmp_marshal_query_acpi_ospm_status (args=<optimized out>, ret=0xffffea4ffe90, errp=0xffffea4ffe88) at qapi/qapi-commands-acpi.c:63
> > > >  #3  0x0000aaaaabff8ba0 in do_qmp_dispatch_bh (opaque=0xffffea4ffe98) at ../qapi/qmp-dispatch.c:128
> > > >  #4  0x0000aaaaac02e594 in aio_bh_call (bh=0xffffe0004d80) at ../util/async.c:150
> > > >  #5  aio_bh_poll (ctx=ctx@entry=0xaaaaad0f6040) at ../util/async.c:178
> > > >  #6  0x0000aaaaac00bd40 in aio_dispatch (ctx=ctx@entry=0xaaaaad0f6040) at ../util/aio-posix.c:421
> > > >  #7  0x0000aaaaac02e010 in aio_ctx_dispatch (source=0xaaaaad0f6040, callback=<optimized out>, user_data=<optimized out>) at ../util/async.c:320
> > > >  #8  0x0000fffff76f6884 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
> > > >  #9  0x0000aaaaac0452d4 in glib_pollfds_poll () at ../util/main-loop.c:297
> > > >  #10 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:320
> > > >  #11 main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:596
> > > >  #12 0x0000aaaaab5c9e50 in qemu_main_loop () at ../softmmu/runstate.c:734
> > > >  #13 0x0000aaaaab185370 in qemu_main (argc=argc@entry=47, argv=argv@entry=0xfffffffff518, envp=envp@entry=0x0) at ../softmmu/main.c:38
> > > >  #14 0x0000aaaaab16f99c in main (argc=47, argv=0xfffffffff518) at ../softmmu/main.c:47
> > > >
> > > > Fixes: ebb62075021a ("hw/acpi: Add ACPI Generic Event Device Support")
> > > > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > >
> > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> >
> > I notice this doesn't seem to have gone in yet -- whose tree is it
> > going to go via?
>
> I'd guess ARM tree (due to almost sole user virt-arm).
> (there are toy users like microvm and new loongarch)

OK; applied to target-arm.next, thanks.

-- PMM
