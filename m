Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp840058dlb;
        Wed, 19 Jun 2024 02:21:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCe3VAIoIW6NuE6f0uZnTRTF6w6h+OJMZN+s8AR9794Lkd6vgAkIbP+NzlAX8RnkBOxmIwBk4JaYJoaC9i0N+5xyOQFOSs
X-Google-Smtp-Source: AGHT+IGuJb2MupJSuuLN5m/pmTNWlBZVzdeTwEmdcf9bc3Jyv+lSii02/nobXGEKKimnEJyzJX5x
X-Received: by 2002:ac8:590a:0:b0:440:5f3e:5a39 with SMTP id d75a77b69052e-444a79e1baamr18798821cf.35.1718788877823;
        Wed, 19 Jun 2024 02:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718788877; cv=none;
        d=google.com; s=arc-20160816;
        b=rcncGX9PBQ0nTWxnNbvYQvXaQX3KdVq0XLFozOwoaWlKaqqSpFWJGDNW3D7EEh/dSJ
         ngx/FInGps57k/E0uGtX52SRK5+MAttf38fRXCDUxn4dWbV4UDryVn7RNsEG1k0PVKTw
         QKP+n6M3Ym9JGp/RQf7zguQGaRg8rkapABHbptdQZpqqFFe7QPQefkhYWAXZtpqwAbAQ
         6QAtZHjeDaQwE6qkwM0Ao48cmiaIBztfW1n45q557rOQ86No3cwhS6oq8Ct5GTxp/3ZL
         wyy1gH4A9K25mysv6FsTx1EK9dyzzkuWwLt8wF8IdTBhK+WnSSLvDVwI679aJ9sy1zJw
         FR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Suhj2379smWVBTU/BGDAtu/5KXCfWIK/YZcDffkBmEA=;
        fh=PtAoZTXpuPWKDrqg3O+M/xxDwhh5YjC+ZH+W9ntzJPI=;
        b=gVP2K/7bFyq3/7pQ023w2the0oI1au+13SXpAr49kic9pEvVfoMnVK3RRI7pfRFrU8
         81RHwH6E8VjZafiQUWEK/UsBdcF51zYgV4pW1EtZWcN73ZfGMdAKNj4z5Df3QxuoTvwI
         oO/vwq8EWDkg0ZgWy51RZBz87em2AwfKVD91H/sZzaDkQ712hyf3RM+QJCQH5YTJcuxY
         OZ4AwMeHpldWHnC4c/BbiZjgt1ifo3m+mw7Myl8Z32yZPSswTV0CoWTp7EZ4LGwLfn+b
         2keeqTGUS5SSewcep/v8ZatAkKSBj5y1mwrwSrMHsoJLG2ip63K4Fbqckd8dCtVaKugq
         nBCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N7Y02uT9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-442133fc9f1si149678051cf.24.2024.06.19.02.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 02:21:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N7Y02uT9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJrV6-0000S0-B4; Wed, 19 Jun 2024 05:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sJrV5-0000Qk-3N
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 05:21:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sJrV1-0004ZX-6s
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 05:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718788862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Suhj2379smWVBTU/BGDAtu/5KXCfWIK/YZcDffkBmEA=;
 b=N7Y02uT9Ims+Wl8PEanUnD8TrFd1nhzqVAgmUx240bUYBlYXzEAGO5HzMcGVoJZMnCv8q9
 DIswsLKmuezjDrnNoyqLZGkHVLAdbJWBGZdnD0GM8M7ZVSemDYnBSYLI7pW7/9Ed0++TsF
 Ce399zxPvT9xWV9cnnBi0Z4AK4qrjjI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-PJeI1-f7MC62bBW6rImIvQ-1; Wed, 19 Jun 2024 05:21:00 -0400
X-MC-Unique: PJeI1-f7MC62bBW6rImIvQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-363edbfc61dso90636f8f.1
 for <qemu-arm@nongnu.org>; Wed, 19 Jun 2024 02:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718788859; x=1719393659;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Suhj2379smWVBTU/BGDAtu/5KXCfWIK/YZcDffkBmEA=;
 b=g5/Qpk2gRw3gC12uXrrqcg6A/Cyz8esOJziDUzukM5k3pz62iJBr43GS0m06W53Nyq
 b8eZPCjFciYLhkLL9kr4l8pMyyp6nb8E9fgRaAPq2FIG0hCNAHcPDGWsE23pQm+RRi3a
 yYYQVOYTUc213cQBXP2yswmDZN3pMnJn+unu/SW63IV/P52m1ND34WzkfY2NmgjrISZm
 SPm1jBVGjZpxMJpYyd/IOH/xEQzX79cHwJU6slyFngxWNfZWit9JXhm1BqkGJfeSI3Q2
 hnmkA+OpWNBKrke0E2CPPaj4/ylJ4ojMWL5I3vFYMw4rRs63RftlsAknkQ5hPj8t8YJc
 Kklg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFrXt0yG3gdPxcrXfDakBDAPgrSvSIE7YhndkQbfNNrBFbItxnBvRdpsrRqhuB5jSCik2TztTGpJgIABEUaH6Yusx8
X-Gm-Message-State: AOJu0Yy79UKOnahWXCK0l+F8M6MrnCTKo3KnQarbsFB7cxLl2pXVc74B
 BkwcMxg/CdOuCnwdrHu3IhT3rE1+26V7MrMRMGDeRWYH1KwmCHM7BNcQbhTTOYemjxBqgCT8MMI
 shTzponwy/EeTKCmtrSG+2PFQ6s/iGn87v4RXaCi2LaZ54r2vNg==
X-Received: by 2002:adf:a415:0:b0:362:3730:8762 with SMTP id
 ffacd0b85a97d-363177a200emr1358767f8f.24.1718788859496; 
 Wed, 19 Jun 2024 02:20:59 -0700 (PDT)
X-Received: by 2002:adf:a415:0:b0:362:3730:8762 with SMTP id
 ffacd0b85a97d-363177a200emr1358723f8f.24.1718788858852; 
 Wed, 19 Jun 2024 02:20:58 -0700 (PDT)
Received: from redhat.com ([2.52.146.100]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-362f03ac73dsm2504997f8f.55.2024.06.19.02.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 02:20:58 -0700 (PDT)
Date: Wed, 19 Jun 2024 05:20:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Sunil V L <sunilvl@ventanamicro.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alistair Francis <alistair23@gmail.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 06/12] tests/data/acpi/virt: Move ACPI tables under
 aarch64
Message-ID: <20240619052043-mutt-send-email-mst@kernel.org>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-7-sunilvl@ventanamicro.com>
 <27cef750-262a-402a-97fe-c4a55700a376@linaro.org>
 <ZlSjzfSj8MwDcJk6@sunil-laptop>
 <20240619111743.58930119@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240619111743.58930119@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GeIyB+EaKAFk

On Wed, Jun 19, 2024 at 11:17:43AM +0200, Igor Mammedov wrote:
> On Mon, 27 May 2024 20:46:29 +0530
> Sunil V L <sunilvl@ventanamicro.com> wrote:
> 
> > On Mon, May 27, 2024 at 12:12:10PM +0200, Philippe Mathieu-Daudé wrote:
> > > Hi Sunil,
> > > 
> > > On 24/5/24 08:14, Sunil V L wrote:  
> > > > Since virt is a common machine name across architectures like ARM64 and
> > > > RISC-V, move existing ARM64 ACPI tables under aarch64 folder so that
> > > > RISC-V tables can be added under riscv64 folder in future.
> > > > 
> > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >   tests/data/acpi/virt/{ => aarch64}/APIC             | Bin  
> > > 
> > > The usual pattern is {target}/{machine}, so instead of:
> > > 
> > >   microvm/
> > >   pc/
> > >   q35/
> > >   virt/aarch64/
> > >   virt/riscv64/
> > > 
> > > (which is odd because q35 is the x86 'virt'), I'd rather see:
> > > 
> > >   x86/microvm/
> > >   x86/pc/
> > >   x86/q35/
> > >   aarch64/virt/
> > >   riscv64/virt/
> > > 
> > > Anyhow just my 2 cents, up to the ACPI maintainers :)
> > >   
> > Hi Phil,
> > 
> > Your suggestion does make sense to me. Let me wait for feedback from
> > ARM/ACPI maintainers.
> 
> I'd prefer  {target}/{machine} hierarchy like Philippe suggests

Agreed.

> > Thanks,
> > Sunil
> > 

