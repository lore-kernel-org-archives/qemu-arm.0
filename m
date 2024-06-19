Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1133656dlb;
        Wed, 19 Jun 2024 11:01:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYYLvVZ3PUWr7MSMJbNT3Gd6/iEV17W4v9b/JnSltf/JnoAMyyl/psQkv0/IhZ3y0S2mV4ZI+5lRkAW4GQ7tHFlO6f2Qav
X-Google-Smtp-Source: AGHT+IFPVvrObsMbLnuMcdkUzvr3qZZoBFSD8ctvp6RK4i/MDZdnuB2UDdrGmNXCDUXF0UOXiZ6S
X-Received: by 2002:a05:6808:150d:b0:3d2:1b3a:d073 with SMTP id 5614622812f47-3d51baed79bmr3188892b6e.57.1718820081506;
        Wed, 19 Jun 2024 11:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718820081; cv=none;
        d=google.com; s=arc-20160816;
        b=OeSDeGIde0ACQ3mxzykAPmskTTIqnpJnMNeVkGEAHfyAW2F5zmnoLUcdQ7HK5eiW1o
         K1MK6emYGG1euGHsLZH0Gid57RYZuvYn5cHiOCSlSLi9JhAsBC+gsnUxV3T00MTIAZiw
         PqCUY6I2lEnNqCGKDRFxUnKGV4D6xhwHL9qPVw2IDCPufqr1OpapGJFRrPJLhEh7xcVw
         gM1haAuEAUGfU+PxZ5Vsj0odYkUMDISj9lFfq6SthJ4cn8ePl6YYFpeCsfQUvwXxrMoo
         ZnLGAY5f1b601r/UekS+ORbkjgelVhLdX0T0W8E0nBCsqYLd773QwqWF7vJREbslwriB
         BkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=suWG7OInWA/FXp2HXBeEnprq+0zC+QBXlPUz212nYjY=;
        fh=LlW+cuGA8vzYNXmLCCcOy3wm6/1BSl8uixRqL9DBA8w=;
        b=HG44fsp9cKLh+TmHxMJMI09nWx5AAQJGRckts3VlFsccy+xs+vTBKvtMtZL2Z0qwQF
         Qej76KS+jdqabLIOogPvb4mlZLdjG6eUqPLNh+/gwk8GzK9ZdwDBa/w/gBPvJzDjiqXs
         63KUsNGKXL4uGKTS4ULBaiisSwfJ5nZ8ChprDpjIZ7ZmTcIQkSsi5pbhHbTYWKrc0pYt
         XqJzoHxV5xl8flyV8H28k+6/InKOBhYe9/VNdq1GJfVCX/HsImD/H+vAYQX53xMTpoDY
         Ja/YH5gZ+d6xp8cX/ZgBg0ouYsLCBs8Q8V/rBLS57JG+z+txNR18q9mEXVMUYrFClzq1
         hhfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=mBBLY7i7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-80f62320f09si216911241.126.2024.06.19.11.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 11:01:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=mBBLY7i7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJzcC-0007fu-7u; Wed, 19 Jun 2024 14:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sJzc6-0007f1-0L
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 14:00:55 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sJzc2-00019w-1O
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 14:00:52 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6f6a045d476so94910b3a.1
 for <qemu-arm@nongnu.org>; Wed, 19 Jun 2024 11:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718820048; x=1719424848; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=suWG7OInWA/FXp2HXBeEnprq+0zC+QBXlPUz212nYjY=;
 b=mBBLY7i7gzkODA20+zHZPxK9OhKn6LBWSen4Pv0rLlgTvlf11vG2lcVVJvYQzZDfLS
 T9QeZqKbeCbdg3NpPBve4PYEBxfFIw3M4azdXQTSEilx/ek4Rpt/4Zvw+S/30USDE6vm
 x+aVEr52DAu6PKHq3K3J6DISLGZxVuyAX+rC4BHpIOT3N1ZXdJXbKBAJXIYVMGV12Rcu
 R6A/vT1qTkYZ2pYzZch9tLzAyIskxEE2Gpl3WwYxjif+oYxIEiAWpBMO7zzdQgGxNIMJ
 uZmdYouJ9WMDlFvglQLxVNj275hfU8JfZI5h730JK5yVH18QfMm6iqHVz/ZIQr3/O9kZ
 hTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718820048; x=1719424848;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=suWG7OInWA/FXp2HXBeEnprq+0zC+QBXlPUz212nYjY=;
 b=ExcTbIPvuuYkRYz2g7e8mxFix/vkIaTViOEpbvkLmF+HyvpgzZnbh1DMYlMzyYgeQK
 nY35eb+u7DvYh1qxldfqt5COEJiY0CXVSWZAaeQWHcmS8XtiDpstJCXL9Z28ekmUg1AO
 DxqMpKTH/0jbL+AMS7U4DPR2tVxYX3wbl5+YB92mL/tfSMmbT80sPmYsilwLgO27EBg3
 ZSiGH9UAZIiXecfIe5aX26HzyTs5Mh2H3dICZQDZC2UfYeAk1JiV8OjhNVHBqJydI2GF
 fWl4XFrewygReDtMwvBlBnnle4TOgt03FLnm9F6AgAyIubqMhQeO+kUN76yl++Q50nRt
 N13Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNxpoSqScm0jLQ2qSc6rN8nQni0xH8iMoGD7MZspZuCKoGQ3J6hZw7oykJVVJXa4W7U15eXZglP45h7/UFFHdgJpZl
X-Gm-Message-State: AOJu0YzXD4tHgU0Li/hr805yIWaN+9aKyJC6iDW8L95Y10xs6LSjYWiz
 +8M7C05uJWwkxxgqRHw5agyA71IkrFtY2xELAceLzyq5Uf9IjlanrLAs9BAApBA=
X-Received: by 2002:a05:6a20:3d8b:b0:1b6:a7c5:4fbe with SMTP id
 adf61e73a8af0-1bcbb3eed25mr4064219637.14.1718820047594; 
 Wed, 19 Jun 2024 11:00:47 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc91f6a4sm11380845b3a.13.2024.06.19.11.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 11:00:47 -0700 (PDT)
Date: Wed, 19 Jun 2024 23:30:35 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
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
Message-ID: <ZnMcw2E83Voo1HBT@sunil-laptop>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-7-sunilvl@ventanamicro.com>
 <27cef750-262a-402a-97fe-c4a55700a376@linaro.org>
 <ZlSjzfSj8MwDcJk6@sunil-laptop>
 <20240619111743.58930119@imammedo.users.ipa.redhat.com>
 <20240619052043-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619052043-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x436.google.com
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
X-TUID: u6G3GVSH3mM9

On Wed, Jun 19, 2024 at 05:20:50AM -0400, Michael S. Tsirkin wrote:
> On Wed, Jun 19, 2024 at 11:17:43AM +0200, Igor Mammedov wrote:
> > On Mon, 27 May 2024 20:46:29 +0530
> > Sunil V L <sunilvl@ventanamicro.com> wrote:
> > 
> > > On Mon, May 27, 2024 at 12:12:10PM +0200, Philippe Mathieu-Daudé wrote:
> > > > Hi Sunil,
> > > > 
> > > > On 24/5/24 08:14, Sunil V L wrote:  
> > > > > Since virt is a common machine name across architectures like ARM64 and
> > > > > RISC-V, move existing ARM64 ACPI tables under aarch64 folder so that
> > > > > RISC-V tables can be added under riscv64 folder in future.
> > > > > 
> > > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > ---
> > > > >   tests/data/acpi/virt/{ => aarch64}/APIC             | Bin  
> > > > 
> > > > The usual pattern is {target}/{machine}, so instead of:
> > > > 
> > > >   microvm/
> > > >   pc/
> > > >   q35/
> > > >   virt/aarch64/
> > > >   virt/riscv64/
> > > > 
> > > > (which is odd because q35 is the x86 'virt'), I'd rather see:
> > > > 
> > > >   x86/microvm/
> > > >   x86/pc/
> > > >   x86/q35/
> > > >   aarch64/virt/
> > > >   riscv64/virt/
> > > > 
> > > > Anyhow just my 2 cents, up to the ACPI maintainers :)
> > > >   
> > > Hi Phil,
> > > 
> > > Your suggestion does make sense to me. Let me wait for feedback from
> > > ARM/ACPI maintainers.
> > 
> > I'd prefer  {target}/{machine} hierarchy like Philippe suggests
> 
> Agreed.
> 
Thanks for the confirmation!. Let me send the updated version soon.

Moving pc/q35/microvm also under new x86 would need many changes in
bios-table-test.c. So, the question is, are you ok to combine x86
changes as well in this series or prefer to it later in separate series?

Thanks,
Sunil
