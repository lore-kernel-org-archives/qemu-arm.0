Received: by 2002:ad4:4a74:0:0:0:0:0 with SMTP id cn20csp21761qvb;
        Wed, 13 Jan 2021 05:37:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEAaIr5kpl++IhiHhLY3AH6+T04hWiNpkgCnwN5LJKsWsZ0P/zJ63j3/wSriuzG0rJP23A
X-Received: by 2002:a25:9204:: with SMTP id b4mr3366956ybo.98.1610545078766;
        Wed, 13 Jan 2021 05:37:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610545078; cv=none;
        d=google.com; s=arc-20160816;
        b=zM0hxjCo8nJ7MOhlMaS5h54fYa3cfShZDto9dYxFJsA0/SvSKujAdp6qJf93D2qk4U
         ZSQdkBfyr8Ti+8NuFnVUcDBwOCXmChnaetf2WAwiy7sWkTaVQ/rBjI1N8eVFvq3ikD0Z
         J6gPoNj1yLVKijegnkiUj4nOB5wlEgmyLI1iQrzSlpUq2h79rNaTc6WyH3tN0PeMQAig
         Av3ZFePQf9IWsOtQX6eztGukW2vyPDCxGl+T9Qcv9GEH84na7JmQ7Afmg73m7TTDEOzv
         YSHdhBlmKAl0yNexbrW1qLxvUAQZwoRHpFqmo0DnhY8hi9T2FHYlQLzUAFL7BlVyOjCd
         1yrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=a8XwYsiGGHOPSJH7Yz5Tw5P2tfkHFb/+AReSQR2pzIQ=;
        b=bNSOw6tYcuJp5iTdZIW0NrwB3a0YkBktq8Ic87mk695eiuS2ycFF7xuUi/lS7Pfg/S
         e0sJ6PCKuju8S/embIaYLY8yZWFYpPsjEf9qCghNvBbHWzQ8InsiNmsWlk7+b7RWNWg7
         8SS2YpiPu9DXYYDR1lPY2eGwpI+eP4QuERUY5rCtgXHpn7uH32xeUVJrkh35cf+K3eRC
         PJY0Hk7LGucu0XqK8xSy9QM7mQOu4ZkCv9GKoZ31CNplne8OJ7B1w3GUKyfgRDR/vj4V
         bgonXnTKb4co4u914x775C/7eDToEffqpu1FR0DosdZNvsoA6/82YG61yntms58o4jAy
         Rj3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UTW6EzCX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x199si2445269ybg.160.2021.01.13.05.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 05:37:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UTW6EzCX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzgLW-0006Sa-7Z
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 08:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgKp-0005vL-08
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 08:37:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgKj-0007w1-1w
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 08:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610545021;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8XwYsiGGHOPSJH7Yz5Tw5P2tfkHFb/+AReSQR2pzIQ=;
 b=UTW6EzCX3XwjovdzDIIzfmokDhOnOT+xXGV6dOKrwBupBPR2bGC0WO58hMsaRIcVEraRac
 YvRKjkDD/CSpC8+ivwUEbXNvxzywNj5N2fl3ePVPlXy4dAK4FXx1ZE7kZRxJiCG8pjJ7cR
 TloX4bopRILlK573NHjBmKcLR0P6iQw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-jOPAZhPMN-iSDFWxdXxcrA-1; Wed, 13 Jan 2021 08:35:32 -0500
X-MC-Unique: jOPAZhPMN-iSDFWxdXxcrA-1
Received: by mail-wr1-f69.google.com with SMTP id v7so973880wra.3
 for <qemu-arm@nongnu.org>; Wed, 13 Jan 2021 05:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a8XwYsiGGHOPSJH7Yz5Tw5P2tfkHFb/+AReSQR2pzIQ=;
 b=GZL6AYrQkTkO9TCZqE5rSq4Gen/xwMN8BHPUnw9ognudzCGp5z9sq7ix0CwhW2vXnn
 qkZ6beJ34sdZ0Zuz3hGBQhZqYF68YNMg2fyxzBperHlRT264GMB7ixc1hvVBIHMRI5vd
 lnle8GrKtUfGkahq0js6lUnk8UG/6Hljjbv0k7pZS1NNEjVoQs50o4UXKxqq/crox9kd
 lGy9Oy14r7u9RkZ/8YltFcOXwVsyEPeVH3rfCjLnhM0jc8y6I74YbB9qSvMkhA6GnJpX
 cq3PJ1MBrgAY3OMbgYITqPAMx3TW9/ftivIpfFe0XJscrztBvoifbm/78qWmoa8sZR58
 73oA==
X-Gm-Message-State: AOAM533Z5DuXK5dvLmi7rI59R+z2Qgpl6KmHvNU5WbVNHu7xLW23+onK
 uwAmpjxn/Gb0L8hqf1AVJMOXEM7r2lDsBnKx9GiBd3lWIbOv7JuzdE21teGpJ4tmEaTfpGYOnmU
 X4BE/PtZLln4R
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr2646570wrx.34.1610544931705; 
 Wed, 13 Jan 2021 05:35:31 -0800 (PST)
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr2646554wrx.34.1610544931506; 
 Wed, 13 Jan 2021 05:35:31 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id b14sm3242414wrx.77.2021.01.13.05.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:35:30 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v6 01/11] hw/ssi: imx_spi: Use a macro for number of
 chip selects supported
In-Reply-To: <20210112183529.2011863-2-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 12 Jan 2021 19:35:19
 +0100")
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <20210112183529.2011863-2-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 13 Jan 2021 14:35:29 +0100
Message-ID: <87v9c1gdsu.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ma4/WifMqnQ+

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> From: Bin Meng <bin.meng@windriver.com>
>
> Avoid using a magic number (4) everywhere for the number of chip
> selects supported.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20210112145526.31095-2-bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

A fast search don't show what resets cs_lines, but that is independent
of this patch.

