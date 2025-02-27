Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp180734njb;
        Thu, 27 Feb 2025 04:23:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX47FoVjilExMo0R7dRBQXC0FMg3RKCdWarKpAAeiW9Ra7MDTsTirP7n+hqTi2TESEU0rgxwQb/VInwYw==@linaro.org
X-Google-Smtp-Source: AGHT+IHzEweTDfzqnv3Wdn9WvFBlAnM1A/x/B43f6avCt0WUXhCnRjc/espymgfiaut4d5n68gST
X-Received: by 2002:a5d:64a3:0:b0:38d:b12f:60d1 with SMTP id ffacd0b85a97d-390e188cfa9mr2646147f8f.26.1740659006258;
        Thu, 27 Feb 2025 04:23:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740659006; cv=none;
        d=google.com; s=arc-20240605;
        b=Sa5buY5DalmIT1dIZIL/UOOyZtrmxe6f80bjSBDcnToZ7pU3aULOMR/Ng9srQiMJOM
         BSkys/s8TNFPsnX+Z9xDaoQJUFqvAmjQVqaD8kKFrpANPwqefhj2R5S6BS+YiNLRft1O
         ADVSX4Ajb9ExI9/Lgs3DjA5RYyRz+2LJiaohhkUifruL4XEngAAZb1BjPZ0J4oDL+hKy
         zSv3l9GzPbu9e2FI1Mj2EK9PNquctvp3dEvyQWpbJpZScMD5jSPvEoz7/F00kxdgEyKn
         8Hok9ZQXRWNfT7ftG3a3fnoYnK7TW9PIsKsxWM8aAwgnpKOdaNU1gbHi/m5Voese9wHu
         Uo9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=z0drJSCTbWN/ba75bqW+aniDK5NCt33vV1jPzY6YlkA=;
        fh=3OELb8BUJHTtqq9Q9tSe6qoWPcP8tWjlt515fWC8+r8=;
        b=Ppca6pjgKovT8SeQQr5Z+m7H90VsWXRWINk2Y9kGBTeaOKWksn9xO6p+ToQlh9fbJ6
         ktMw6X/V/ozBnjqDpVmBJiL24VV10bIrmcWp0lxkQHdnjXntcIx83AiD+6ems+8bLAKR
         vTvrQodPsP627Fqa8H55jGtmf3ch4H2ZvfDKWlbgQaDGT4TwlcUpqDorvLztaKqMvHw7
         7a0376iIJVI4BPIMEdvxnfj7skLD79iLuEJFoVSqA8ozyuth98BOuu/0Iat9c8qwhV9a
         6NbyKy50qOKr+fM7/de2DX84AlwMeU2Bo3guTn4KRodRytk2hh924X3RVoHxZ1HkYcAq
         oXVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fVqr6TAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-390e484018esi977513f8f.720.2025.02.27.04.23.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 04:23:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fVqr6TAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tncur-0005ld-3N; Thu, 27 Feb 2025 07:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tncup-0005eG-1q
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 07:22:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tncum-0005yW-Rk
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 07:22:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740658975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0drJSCTbWN/ba75bqW+aniDK5NCt33vV1jPzY6YlkA=;
 b=fVqr6TAMh33r9T2A8PPbq+ztUGAdgxCeUYY2fIO8CHD9mpRrjr8yOf1nnQzigiC359ebun
 7FU0McOs+j0FM3jlWwQGvuu/xlFzZJ44t9NUpkCuCMpTNVuDurVM4cegsFE6Jkf2lfwMie
 UO2L/JlVyYcdCnGCjwl/HYR46WoUQ14=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-H2thsa8HPlWJRU0oHreiZw-1; Thu, 27 Feb 2025 07:22:52 -0500
X-MC-Unique: H2thsa8HPlWJRU0oHreiZw-1
X-Mimecast-MFC-AGG-ID: H2thsa8HPlWJRU0oHreiZw_1740658971
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4399c32efb4so8506485e9.1
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 04:22:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740658971; x=1741263771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z0drJSCTbWN/ba75bqW+aniDK5NCt33vV1jPzY6YlkA=;
 b=lWTXxmUQZcYiXkkR0JUTeNXX5lK+VKlXlWRJfV92Hn0XSTYZaZYYbXgCLhplXCgbJ+
 88xEtmv0pVVbOhnh7Hx8II+lSwU3G72seAMSSwghfFsQmef+sfcQ8+9rfh9x8EZ03K0o
 EfW+a3qPhonRUSsJYwlenEOrLEfz+2ntOzVnFGkfO3h2ojJ9IZZ00fpzAabWd7hFPYxs
 HAeJdg2nqpeClQjX6oaVk9Hf+mvxCwYUBF3wLZa3DfuNYureYmkBMBFiW2Rp+V/c+KOA
 mjBpgCyQWhp8QIVD4bX4k1BFoOI9c9pdSivJnMcmZDd+M1VzbPbMcfimkQzUd6z7RjF7
 ISQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIfxVS6JCvVx4yahm5qhnovoby001S+okkZYDIkp4kEio1pZA+o8tkRLbTsWlRKerxjEcyW5rTBg==@nongnu.org
X-Gm-Message-State: AOJu0Yz0JO3kdu+e8q10Wto2El18LNMU6IAdR3VpUYanUdWTkDKSNoGS
 8z67d1dFam1QstY26Y2+EUASw/KwH5xS+4dfZqOA6v6FOxicgOaIQ+6yHlM9GV3dH0N5bplL3nU
 Y+pYsM/cebhAsVL/+tnMzP+h6KCOpgb+BFvM14nYQbrAloIoUyQ==
X-Gm-Gg: ASbGncvtnxq22qsico0PR9/MEhTT4//qQuq9ccZ9WinA09Q6W57prAR0fGySbiIIV4t
 Zj3vPzYGkJPutHkVc8aRmh8egddv7fKSSEXpNP0nNSVszOjNePXytCLhmOKhDjP4Zq/wxnP4TnK
 5HE7JWksytXIXISKceMsBypDligUQKXz9kYb57ulFoMTQ8k2vnH63fvZ2Hp0wZJtr4vv78ODoYM
 2JnQ0Gega562lzMjqNLUNiuZljDy4WRtS2FtVl2/DanZlg1hiGoPtRs5pXlmve0Xos2oI3+6xYZ
 VCCX0IZ0rJTqSsoCOhQXdef8YQZZFMzEMHxDBB3WQ7xK3QyrD7oBgC0Gcx/p0ZY=
X-Received: by 2002:a05:600c:1c23:b0:439:892c:dfd0 with SMTP id
 5b1f17b1804b1-43b04dc361amr26051815e9.14.1740658970839; 
 Thu, 27 Feb 2025 04:22:50 -0800 (PST)
X-Received: by 2002:a05:600c:1c23:b0:439:892c:dfd0 with SMTP id
 5b1f17b1804b1-43b04dc361amr26051585e9.14.1740658970475; 
 Thu, 27 Feb 2025 04:22:50 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b736f839asm21290255e9.2.2025.02.27.04.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 04:22:49 -0800 (PST)
Date: Thu, 27 Feb 2025 13:22:48 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/14] acpi/ghes: prepare to change the way HEST
 offsets are calculated
Message-ID: <20250227132248.17c6754b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250227124538.7a2191e0@foz.lan>
References: <cover.1740148260.git.mchehab+huawei@kernel.org>
 <9eeaabf88e7ddc4884633702b7bc419075975bc8.1740148260.git.mchehab+huawei@kernel.org>
 <20250226153714.20c57efe@imammedo.users.ipa.redhat.com>
 <20250227124538.7a2191e0@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xEBM5lq0nEe_ScjtmgqSiUAqR21nxZgRih6ZsTZKNs4_1740658971
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: yh2k9ykT/M9c

On Thu, 27 Feb 2025 12:45:38 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Wed, 26 Feb 2025 15:37:14 +0100
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Fri, 21 Feb 2025 15:35:10 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> 
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 3ac8f8e17861..8ab8d11b6536 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -946,9 +946,18 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > >      build_dbg2(tables_blob, tables->linker, vms);
> > >  
> > >      if (vms->ras) {
> > > -        acpi_add_table(table_offsets, tables_blob);
> > > -        acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
> > > -                        vms->oem_id, vms->oem_table_id);
> > > +        AcpiGedState *acpi_ged_state;
> > > +        AcpiGhesState *ags;
> > > +
> > > +        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,    
> >                             ^^^ will explode if object_resolve_path_type() returns NULL  
> > > +                                                       NULL));    
> > 
> > it's also expensive load-wise.
> > You have access to vms with ged pointer here, use that
> > (search for 'acpi_ged_state = ACPI_GED' example)  
> 
> Ok, but the state binding on ghes were designed to use ACPI_GED. I moved
> the code that it is using ACPI_GED() to the beginning of v5 series,
> just after the HEST table test addition.
> 
> With that, ACPI_GED() is now used only on two places inside ghes:
> 
> - at virt_acpi_build(), during VM initialization;

ACPI_GED() is not expensive, what I'm referring to is
  object_resolve_path_type()

given it's a new code and virt_acpi_build() has direct access
to ged pointer, there is no excuse to use object_resolve_path_type().

all you have to do here is:

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e6328af5d2..040d875d4e 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -949,8 +949,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         AcpiGedState *acpi_ged_state;
         AcpiGhesState *ags;
 
-        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
-                                                       NULL));
+        acpi_ged_state = ACPI_GED(vms->acpi_dev);
         ags = &acpi_ged_state->ghes_state;
         if (ags) {
             acpi_add_table(table_offsets, tables_blob);


> - at acpi_ghes_get_state().

this one is different, it doesn't have access to ged so it
has to look up for it.

> 
> If you want to replace it by some other solution, IMO we should do
> it on some separate series, as this is not related to neither error
> injection nor with offset calculation to get read ack address. 
> 
> > > +        if (acpi_ged_state) {    
> > 
> >                 hence, this check is not really needed,
> >                 we have to have GED at this point or abort
> > 
> >                 earlier code that instantiates GED should take care of
> >                 cleanly exiting if it failed to create GED so we would never get
> >                 to missing GED here  
> 
> I dropped this check on v5.
> 
> Thanks,
> Mauro
> 

