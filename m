Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1203943ejb;
        Thu, 27 Jul 2023 04:11:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH+8jxx2Oa9KaiEbk+uCteVp/lOIhG4G/LXagGIOdEjit1dwW4smYAPgpCmsJz0W4xSBXZq
X-Received: by 2002:a05:620a:4106:b0:767:6cd5:ec8b with SMTP id j6-20020a05620a410600b007676cd5ec8bmr2243356qko.27.1690456277944;
        Thu, 27 Jul 2023 04:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690456277; cv=none;
        d=google.com; s=arc-20160816;
        b=upTM2Mz8ug301AX0MNOuaNlV/cZBYdVDa88mhvZS7jEvCUJn03LEC98f6Q2O4sIs3T
         D6xpeOpNQNXLgsL/8XfjQ4xPNawpwkENb6GA8KqRwXZYczqIvOj7F+Iry/id1DRhMpQa
         fBFafR+qmQBwRWWZG6tqYV5JMS4QZJxssZyM63j8nLFlOIuLGVKCJ6PCdOWefxcPc5cS
         qJ7dQnsxYofcqRBSGE+a9y/OEJ7TxQ0wkne3Q5iCSrjWi9QQuWDs3HpSihVX0GLPvlbq
         51U8gpqKY7eAK4w/xNm2Lik9CTAEn30zlXC/9Rz48j2q35uEmEesUoMZBRd/2zDCOQR2
         IPWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=DcfOYcIc882/B76FusQE50IHX9X4DDFGkGqpqV/TZok=;
        fh=DkG+ttxLHkcAg3VOj5E08kJzyGu+8iD4VY1SDaQScCw=;
        b=MTMJXZj9DcAaxZoiQ4LVrN6Yj/eyui+qEYPJgkRvlUcwEDISLoWIAno0okqRLEaPOO
         Wu2nYXZh68/mAmP1f5cJIXMvyjK62SkU3rz5KbOniHwNfBjbxATuaJ+esTvtNmW28cwP
         sPmczM/Wh+pDcNymo1zXRIRoduGQ23vRmbuJv4IUH8L8AjNJbN06zRn7amN21sudPDRh
         Kys2GmGlIEgU9Lgl2CBr6M/3vGfJ5CPekLbLxSSmLOgXkXg5hDTgs/nIT7pJxwXGQnZy
         y7XUXLZkFhSCH81RSdl5CETJx7OqNTbulHsn9dgqNnolzXJuF4t+9Kdfkp59c6QvFwmm
         zcSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=QwB3qy3U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3-20020a05620a084300b007681384d675si557106qku.665.2023.07.27.04.11.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jul 2023 04:11:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=QwB3qy3U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOyiU-0000N3-DX; Thu, 27 Jul 2023 06:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qOyiS-0000LV-U8
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 06:59:32 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qOyiQ-00071K-M2
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 06:59:32 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1b9c368f4b5so13341545ad.0
 for <qemu-arm@nongnu.org>; Thu, 27 Jul 2023 03:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690455569; x=1691060369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DcfOYcIc882/B76FusQE50IHX9X4DDFGkGqpqV/TZok=;
 b=QwB3qy3U0NHNI3QIHaJPAA8H2NiLQUPKeaIx4hlFPKgX5a2yqc58shB7yPXnXzof3K
 +vl4q62ldZfmPBTJ/u6zd2wOsBh6WkzfAVK353tqE92k4ALUayspbJhkOjtqDmNIVcZ9
 t7adiECDX/G5i9VW3kpgYVceUr8XE0H8tLQyISboMOlClp06+pcFtlEPT73nTzXv5BiQ
 ShIe0ukvkccBcA3dqn/W5D/32/powg55f3Iqxkjy7W19oqgh5PFD4JLkEL119ymyE9KT
 fQDDKckzSU0fnK6GwUQY3sb0vE6gpLVqnGftJZ/WKef1YqNWZnLiPs1McBlTvtWrVvbh
 Pudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690455569; x=1691060369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DcfOYcIc882/B76FusQE50IHX9X4DDFGkGqpqV/TZok=;
 b=UKqkX8gTSHr+N/Ts3rAP7MwuA4ZMOyL7DoAJzSZjKxCp1NAA7sg1N0+gB7rtaHN1+P
 Tpn/JWghDZL40BX9O5XIAmnLaWhbozGxWUQG31Bn1vcYzhewXmuPPkVeRpQUt8N+cWs0
 5RLL/XLEKqPBL8G7sS31Bl9cEmabSgpP8Q8r+XjQIuKZOy463b2OpAWXv8KNVyOL0f6B
 Bm7FmKyGkByjbRzlYs3453vP0RruqxS/9sxJENp2TwLc3aHC2hAqkE4/qak/J1nkzIpb
 pir3wvvpduWyXbDH5JSbTHPYrdfBlxUx5aE4ssK7doGg6HoWrgM96GYy+1cAtIkQfQ2f
 2qwQ==
X-Gm-Message-State: ABy/qLa+UwNR1nKh6RAGU7DrY5BoHH88hnMP/fr7wtGsR/acLOQOEeJf
 IY14d9nbgOoGLIY36yeccQ5aAA==
X-Received: by 2002:a17:903:1c7:b0:1b8:a6be:ea82 with SMTP id
 e7-20020a17090301c700b001b8a6beea82mr2773600plh.26.1690455568905; 
 Thu, 27 Jul 2023 03:59:28 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.25]) by smtp.gmail.com with ESMTPSA id
 t28-20020a63b25c000000b00563dfd98982sm1219015pgo.42.2023.07.27.03.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 03:59:28 -0700 (PDT)
Date: Thu, 27 Jul 2023 16:29:19 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 04/10] hw/riscv: virt: Add PCIe HIGHMEM in memmap
Message-ID: <ZMJOB7qZGqzbvACZ@sunil-laptop>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-5-sunilvl@ventanamicro.com>
 <20230724173254.3423a204@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724173254.3423a204@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KfqT59Uu6Q08

On Mon, Jul 24, 2023 at 05:32:54PM +0200, Igor Mammedov wrote:
> On Wed, 12 Jul 2023 22:09:37 +0530
> Sunil V L <sunilvl@ventanamicro.com> wrote:
> 
> > PCIe High MMIO base is actually dynamic and fixed at
> > run time based on the RAM configured. Currently, this is
> > not part of the memmap and kept in separate static variable
> > in virt.c. However, ACPI code also needs this information
> > to populate DSDT. So, once the base is discovered, merge
> > this into the final memmap which can be used to create
> > ACPI tables later.
> 
> can ACPI code fetch virt_high_pcie_memmap at runtime from
> host bridge (like we do in pc/q35)?
> 
Hi Igor,

Looking at the current design of virt machines (arm/loongarch/riscv),
getting this directly from the memmap looks simpler. ARM ACPI also uses
the memmap to get the pcie_high space. It appears to me we need some
more infrastructure code if ACPI needs to fetch from host bridge. I am
not sure why that would be beneficial.

Thanks,
Sunil
