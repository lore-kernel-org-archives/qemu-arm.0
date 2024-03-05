Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp190930ejc;
        Tue, 5 Mar 2024 02:33:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXn8cZLd3W/RPwb9RH/uySMMq6hXefWzIWQoROb/ODDMrKWwIMSLyB2CsOEryl63AT6HLVe/yOlaFz/s3X/ULc152Z5OPqw
X-Google-Smtp-Source: AGHT+IEeka8x/jc2m9MoyquOnQ2rMKW4Nu9obyiYX8hDsfLot4krYSnca9ZfI34euH8hFPsk70o8
X-Received: by 2002:a05:6358:789:b0:17b:5cf2:fe5b with SMTP id n9-20020a056358078900b0017b5cf2fe5bmr1663821rwj.4.1709634790758;
        Tue, 05 Mar 2024 02:33:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709634790; cv=none;
        d=google.com; s=arc-20160816;
        b=VQgUTZJ5Kli46bKVaskQZcHAM/ZSG+QeWeQiZCmeptwrHsYL0zx0k9wsSXi40Z/d/r
         h8I1VgUZbvXeL3HgJ/d2PG57gTZ79lkxHRuL8u/w9HZ93xjfeyGZo4wMCNd3RHSW+fGz
         90BoHfiLxq1cA10YQsMr3jQ5CxXZYIFCn2XhaWYbc/1uVb3dcGllBGtgMJsQZeVl4MP4
         HGmyTQhX+M7XNN8eeNhC8OypDiaNQV8RKbUi95zEo1uJwVc0FcZeb62JTWi2ZdWytSrW
         4LX9Ad0pGnBbog+Q2wkSJv+LgY/lFqLWZvS+Wmjv5S9Oh7aNLwqdTQA0UIKsKzw+olH5
         dq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=2vDMOG858kwohsjaFQnfhqCCejlVxFcw1ADU0gyslJk=;
        fh=pwgdIVV2TB7TWmsjfI7GAPIA1X7/gAf84pUPVR/7pHI=;
        b=YCm061liLlhwGVxMJ8o0UPfbByJdvR6dHHklz0jiBUutUFkOgAAU+4b0FlcGltdTVQ
         aYn4tGNhJ3CQNF/PG9n/DK/IEF1duQawhuNGdruLyzSWxtmBCajv0HejheF7qdy4aTG5
         SmvH0bWixGXStmR9bO0zVO67pFavWTaTH+9lXSB1Ovfa3YWZt/bRlVnsS3Zo0jCPEYRb
         z05gUO1Gh998VrK3xDqslQnmlbz9JyErnJiAjRNGJY9xEiaY5aKvVeR8hyj90VXKWY8S
         8KD2z2MbDpbEJxHAeZw/cyRBo/yywLS0TrO0aOQxMZEk0m/s4NccLQBLX1UHVNhiHKWw
         zGPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KH2f1Il1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qm1-20020a056214568100b0068f761b112esi11940361qvb.357.2024.03.05.02.33.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 02:33:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KH2f1Il1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhS6K-0002KX-TK; Tue, 05 Mar 2024 05:32:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhS6J-0002K7-96
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 05:32:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhS6F-0003PT-VE
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 05:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709634763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2vDMOG858kwohsjaFQnfhqCCejlVxFcw1ADU0gyslJk=;
 b=KH2f1Il1M4dnCB41i63GnirffEIuP/zIEyrIPPOTegWSRLIafG8Dw3TLiexHr6sxAHXDt6
 F6syXPH3daVHT9zaX6qov1tICZRvZLXmdEHIedyqJM4HoJap6O5yIEtrpc6QocyY4Oq8Gl
 l4qEA368liqaTj424DH++S6tlcnGizM=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-5_BTwF_0MjKgN8GISAXu8Q-1; Tue, 05 Mar 2024 05:32:42 -0500
X-MC-Unique: 5_BTwF_0MjKgN8GISAXu8Q-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-6e5323e15f2so5559803b3a.3
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 02:32:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709634760; x=1710239560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2vDMOG858kwohsjaFQnfhqCCejlVxFcw1ADU0gyslJk=;
 b=N5phG/MOdzr7JGjALkf0ajf/j9MaRcrkAOk7QFHBVQrnC7nUB2MDmgMbYmeBMEnFNC
 ZhT58GUyUK5j7xZM+kZ9D405hkkPvHZB2Q357nyUgMHIBDgmlw/u0nf8mpCMhAxD/kB2
 scmeSjNan2Mkh0kIMbroTg/eTj2xv+eKguVHxGNtERS9F1X6xPxaYZy6qpq956OrlBgE
 WW1ClqsDH0spOrFHgLAjWPiaL6PmFp5ynoBtzfTLrSUE5UNW5cGOF6Rc/Bpy4gt0xNJw
 nTK3JdXGcjYXi3O2LhT4FA/bveRk3idbOfzoZKBzJ6G5MuqZTcSGfR31UrttyNG3ifso
 Najg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN0rCzcsrsopHmRQQtydfjGbAlKNODDDwcF7d/Afv7lXjGU9l5AfmfWEQcjy64Sw2Azw9dQUtrffniaxf6cJ5qvUys
X-Gm-Message-State: AOJu0YwQ17ohy+ZlYSVxh2btiQzSqYov2MZ0Kiwe52O3/8SRILv6pe9j
 kWFgE/BZwckvsUm2y5eNv8qr/jTLb3bhkq4iORMoLpZRy5UYvzTg9tvuX/P4REUC1eO4ug0+IrK
 96rtz2ysRWv+iU9JgZ+qk1bSoyy4LGOzIeoFJCuGvdMc7qZl/EroteiX1Fw==
X-Received: by 2002:a05:6a00:2288:b0:6e5:fb97:ed35 with SMTP id
 f8-20020a056a00228800b006e5fb97ed35mr8011348pfe.18.1709634759892; 
 Tue, 05 Mar 2024 02:32:39 -0800 (PST)
X-Received: by 2002:a05:6a00:2288:b0:6e5:fb97:ed35 with SMTP id
 f8-20020a056a00228800b006e5fb97ed35mr8011331pfe.18.1709634759542; 
 Tue, 05 Mar 2024 02:32:39 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 le6-20020a056a004fc600b006e6150a5392sm3748585pfb.155.2024.03.05.02.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 02:32:38 -0800 (PST)
Date: Tue, 5 Mar 2024 11:32:32 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, anisinha@redhat.com, philmd@linaro.org,
 wangyanan55@huawei.com, eblake@redhat.com, armbru@redhat.com,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, f.ebner@proxmox.com
Subject: Re: [PATCH 00/19] Workaround Windows failing to find 64bit SMBIOS
 entry point with SeaBIOS
Message-ID: <20240305113232.791c116e@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240305050735-mutt-send-email-mst@kernel.org>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240305050735-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.571,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TnuEi3IUN2c9

On Tue, 5 Mar 2024 05:08:05 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Feb 27, 2024 at 04:47:30PM +0100, Igor Mammedov wrote:
> > Windows (10) bootloader when running on top of SeaBIOS, fails to find            
> > SMBIOSv3 entry point. Tracing it shows that it looks for v2 anchor markers       
> > only and not v3. Tricking it into believing that entry point is found            
> > lets Windows successfully locate and parse SMBIOSv3 tables. Whether it           
> > will be fixed on Windows side is not clear so here goes a workaround.            
> >                                                                                  
> > Idea is to try build v2 tables if QEMU configuration permits,                    
> > and fallback to v3 tables otherwise. That will mask Windows issue                
> > form majority of users.                                                          
> > However if VM configuration can't be described (typically large VMs)             
> > by v2 tables, QEMU will use SMBIOSv3 and Windows will hit the issue              
> > again. In this case complain to Microsoft and/or use UEFI instead of             
> > SeaBIOS (requires reinstall).                                                      
> 
> Igor so you want to repost a version with a couple of patches squashed?

requested changes where in several patches
(style and making series easier to review),

I'll repost series with those changes today. 
 

> > Default compat setting of smbios-entry-point-type after series                   
> > for pc/q35 machines:                                                             
> >   * 9.0-newer: 'auto'                                                            
> >   * 8.1-8.2: '64'                                                                
> >   * 8.0-older: '32'                                                              
> >                                                                                  
> > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/2008                        
> > CC: peter.maydell@linaro.org                                                     
> > CC: pbonzini@redhat.com                                                          
> > CC: mst@redhat.com                                                               
> > CC: gaosong@loongson.cn                                                          
> > CC: alistair.francis@wdc.com                                                     
> > CC: palmer@dabbelt.com                                                           
> > CC: bin.meng@windriver.com                                                       
> > CC: liwei1518@gmail.com                                                          
> > CC: dbarboza@ventanamicro.com                                                    
> > CC: zhiwei_liu@linux.alibaba.com                                                 
> > CC: imammedo@redhat.com                                                          
> > CC: anisinha@redhat.com                                                          
> > CC: philmd@linaro.org                                                            
> > CC: wangyanan55@huawei.com                                                       
> > CC: eblake@redhat.com                                                            
> > CC: armbru@redhat.com                                                            
> > CC: qemu-arm@nongnu.org                                                          
> > CC: qemu-riscv@nongnu.org                                                        
> > CC: f.ebner@proxmox.com                                                          
> >                           
> > Igor Mammedov (19):
> >   tests: smbios: make it possible to write SMBIOS only test
> >   tests: smbios: add test for -smbios type=11 option
> >   tests: smbios: add test for legacy mode CLI options
> >   smbios: cleanup smbios_get_tables() from legacy handling
> >   smbios: get rid of smbios_smp_sockets global
> >   smbios: get rid of smbios_legacy global
> >   smbios: avoid mangling user provided tables
> >   smbios: don't check type4 structures in legacy mode
> >   smbios: build legacy mode code only for 'pc' machine
> >   smbios: handle errors consistently
> >   smbios: clear smbios_tables pointer after freeing
> >   get rid of global smbios_ep_type
> >   smbios: extend smbios-entry-point-type with 'auto' value
> >   smbios: in case of entry point is 'auto' try to build v2 tables 1st
> >   smbios: error out when building type 4 table is not possible
> >   smbios: clear smbios_type4_count before building tables
> >   tests: acpi/smbios: whitelist expected blobs
> >   pc/q35: set SMBIOS entry point type to 'auto' by default
> >   tests: acpi: update expected SSDT.dimmpxm blob
> > 
> >  hw/i386/fw_cfg.h                     |   3 +-
> >  include/hw/firmware/smbios.h         |  29 +-
> >  hw/arm/virt.c                        |   6 +-
> >  hw/i386/Kconfig                      |   1 +
> >  hw/i386/fw_cfg.c                     |  14 +-
> >  hw/i386/pc.c                         |   4 +-
> >  hw/i386/pc_piix.c                    |   4 +
> >  hw/i386/pc_q35.c                     |   3 +
> >  hw/loongarch/virt.c                  |   7 +-
> >  hw/riscv/virt.c                      |   6 +-
> >  hw/smbios/Kconfig                    |   2 +
> >  hw/smbios/meson.build                |   4 +
> >  hw/smbios/smbios.c                   | 481 +++++++++++----------------
> >  hw/smbios/smbios_legacy.c            | 185 +++++++++++
> >  hw/smbios/smbios_legacy_stub.c       |  16 +
> >  qapi/machine.json                    |   5 +-
> >  tests/data/acpi/q35/SSDT.dimmpxm     | Bin 1815 -> 1815 bytes
> >  tests/data/smbios/type11_blob        | Bin 0 -> 11 bytes
> >  tests/data/smbios/type11_blob.legacy | Bin 0 -> 10 bytes
> >  tests/qtest/bios-tables-test.c       |  81 ++++-
> >  20 files changed, 535 insertions(+), 316 deletions(-)
> >  create mode 100644 hw/smbios/smbios_legacy.c
> >  create mode 100644 hw/smbios/smbios_legacy_stub.c
> >  create mode 100644 tests/data/smbios/type11_blob
> >  create mode 100644 tests/data/smbios/type11_blob.legacy
> > 
> > -- 
> > 2.39.3  
> 

