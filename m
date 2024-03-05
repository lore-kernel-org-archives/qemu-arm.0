Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp180356ejc;
        Tue, 5 Mar 2024 02:08:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUBR6nddhlJrbBVguF8Zdlr5LxIQyy3zesaFzPQu1Xr1KPOJRsWAvbMhhiXAlDn7XaOAul+YUbvXinDsopAAzopwHlfLHUq
X-Google-Smtp-Source: AGHT+IGc7LnmuOOjadf1wiQ2FWGloWeFUn437W2cf/471KOTSa7Br2kCC3wOMBTSIBCbLdvVCr6+
X-Received: by 2002:ac8:5a44:0:b0:42e:df0d:2cec with SMTP id o4-20020ac85a44000000b0042edf0d2cecmr1562177qta.39.1709633315991;
        Tue, 05 Mar 2024 02:08:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709633315; cv=none;
        d=google.com; s=arc-20160816;
        b=b7qGxXOMRK8PERXRIu5iSYJ3Xv1GV8xqmxPxnlkVAeynbhcvAPuH1Q3V1E6YAKiGdi
         hZGFZ6kHMqlMm0WZV+angudn4TofmhubgBFuhoWu0jtPvz32G2Ko8xER55ZOTpm783/t
         u8SRE+Ntu4nRsnwSJGg9e3FdGOhlHxtZFqSyTbKk1KnmAi2GKPPLrpvNJ5F2iWnx+BWK
         8lo/z7RMl1CLxpVFbgS5W4G1ju8b1aVwXsq0AKGqSpSDC/ExHFFlFSweBs/P9J3bqdXn
         yYgxy4apC6U8Alt4WmGa8frWPj3//ChqmBR+5LmiAUNif18lJ+boGwoJ2MTeWervlUDn
         WgFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=vBFJjak2kPJbPumj6Klm0aRcNBGL6fk+t48daLXgxc4=;
        fh=Q/13Ooz/vdGZveFQckDr/WDLCgU6knKLVUiDjV8Os60=;
        b=nfURiQ5mgtPrRhUyYzqKwPTAUbmgQkS7wvWlvua7VE18UEqY7lOX9pwmB/pj2l1gfY
         QX2ufsA8uxmRPuH6KfT+nYtu46ixJMrBI91GFuVIvhBTUHohd+0qsq20K1AVgI1giTRK
         O1ZqdFRzZnzT7hq/GrJ2cQeWdHln0AtRqihb915JEMYg8xAfKdxOOirRC3Ce9523LHBL
         wvshVzMNhvl7bIfwN9zcKqxpM3KbsY9bD2yus2W+6csvIiaYKuJg7mRncxVD7VTt+Ubu
         k1PZ6J0fsrxVblJzrDADR604o99MxdhuDtv6eHmA3PiCQNsmWQcKifWVZJ1+BS7D5Mip
         dhZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gFwIf56s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020ac85d86000000b0042f02ff0f62si656542qtx.352.2024.03.05.02.08.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 02:08:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gFwIf56s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhRic-000457-3b; Tue, 05 Mar 2024 05:08:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rhRia-00044l-E1
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 05:08:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rhRiY-0007pE-Ey
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 05:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709633293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vBFJjak2kPJbPumj6Klm0aRcNBGL6fk+t48daLXgxc4=;
 b=gFwIf56saiyo4gLO+NAOnbD5lhHspBUoUdKrSK1bBTypC00D1g4wwzUg4lL+QcFD4QmTGb
 JD8OUk33+we5g60iyj7PSi0w+/Ti/3NLlTs5kDXDOq2vORT1kA6zpxb6EeaA/7c5M9vq6B
 aTwasZqxGaG/PmFuf6qp+geK1rP+kCE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-YS3AmjtiO7amib0KFA9KtA-1; Tue, 05 Mar 2024 05:08:12 -0500
X-MC-Unique: YS3AmjtiO7amib0KFA9KtA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40e53200380so35930435e9.3
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 02:08:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709633291; x=1710238091;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vBFJjak2kPJbPumj6Klm0aRcNBGL6fk+t48daLXgxc4=;
 b=uTZhqnqjckC1ZRz4EyHL+XRIPp9MLlJlEcNOXB3HGI9vBehkqHv4uadODAXsXJ2BTa
 SwK5A8pqhMlBe01PqQX3j/0i6j9xcl814iUGVkAsPRBSAsjHupgSH9sLiVemJHnPDGzP
 R0X7Cme3se+uHgMBl1TiIl02NU4guuQOQFYqYBB5KGidkHgIP3I1jX82b+k4zqd2Sl3L
 /GlMBEx2VvtRFFkPqSdY2jR0aEgVPgClERad5X0AqB1XU2A1Bx6nobvNhDVq3mI0FX+n
 ADjVXSeXN6+sVvMU7sOE6Aym7cQAlIG37wPLydniVIQ67TgDwURBfdFrnqf29OXS0p1t
 1jPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtGUX4Cd/LXD1ktD0SuDN1E81bUeWIGHL4lbrwJKdnFrt/kBOMCc1N64xmlA3QJUXyNd+qaCQXElTZtLLPmJPmBsGu
X-Gm-Message-State: AOJu0YzaUjEPhBiCvlclNfqQMMSVNTObtgZO+2IYLM1Bj1lnj+E19yQJ
 Wfhe2SN8HsUxrL+ViItQrlhuKnRTb4bz8iEvTorDZ47ECKTyIbIuRRAIx7on/H3U8LcIqBBY7JY
 RtG69C6xrISFt7S/yvxJnmOLWX+D+1tzgUA+DCtS6FCXPt32sww==
X-Received: by 2002:a05:600c:444c:b0:412:efe5:7fcb with SMTP id
 v12-20020a05600c444c00b00412efe57fcbmr156614wmn.39.1709633290938; 
 Tue, 05 Mar 2024 02:08:10 -0800 (PST)
X-Received: by 2002:a05:600c:444c:b0:412:efe5:7fcb with SMTP id
 v12-20020a05600c444c00b00412efe57fcbmr156596wmn.39.1709633290565; 
 Tue, 05 Mar 2024 02:08:10 -0800 (PST)
Received: from redhat.com ([2.52.130.198]) by smtp.gmail.com with ESMTPSA id
 be10-20020a05600c1e8a00b00412ea14ff91sm2578048wmb.21.2024.03.05.02.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 02:08:10 -0800 (PST)
Date: Tue, 5 Mar 2024 05:08:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 anisinha@redhat.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Subject: Re: [PATCH 00/19] Workaround Windows failing to find 64bit SMBIOS
 entry point with SeaBIOS
Message-ID: <20240305050735-mutt-send-email-mst@kernel.org>
References: <20240227154749.1818189-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240227154749.1818189-1-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.571,
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
X-TUID: leJUiIWoDsWN

On Tue, Feb 27, 2024 at 04:47:30PM +0100, Igor Mammedov wrote:
> Windows (10) bootloader when running on top of SeaBIOS, fails to find            
> SMBIOSv3 entry point. Tracing it shows that it looks for v2 anchor markers       
> only and not v3. Tricking it into believing that entry point is found            
> lets Windows successfully locate and parse SMBIOSv3 tables. Whether it           
> will be fixed on Windows side is not clear so here goes a workaround.            
>                                                                                  
> Idea is to try build v2 tables if QEMU configuration permits,                    
> and fallback to v3 tables otherwise. That will mask Windows issue                
> form majority of users.                                                          
> However if VM configuration can't be described (typically large VMs)             
> by v2 tables, QEMU will use SMBIOSv3 and Windows will hit the issue              
> again. In this case complain to Microsoft and/or use UEFI instead of             
> SeaBIOS (requires reinstall).                                                    

Igor so you want to repost a version with a couple of patches squashed?


> Default compat setting of smbios-entry-point-type after series                   
> for pc/q35 machines:                                                             
>   * 9.0-newer: 'auto'                                                            
>   * 8.1-8.2: '64'                                                                
>   * 8.0-older: '32'                                                              
>                                                                                  
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/2008                        
> CC: peter.maydell@linaro.org                                                     
> CC: pbonzini@redhat.com                                                          
> CC: mst@redhat.com                                                               
> CC: gaosong@loongson.cn                                                          
> CC: alistair.francis@wdc.com                                                     
> CC: palmer@dabbelt.com                                                           
> CC: bin.meng@windriver.com                                                       
> CC: liwei1518@gmail.com                                                          
> CC: dbarboza@ventanamicro.com                                                    
> CC: zhiwei_liu@linux.alibaba.com                                                 
> CC: imammedo@redhat.com                                                          
> CC: anisinha@redhat.com                                                          
> CC: philmd@linaro.org                                                            
> CC: wangyanan55@huawei.com                                                       
> CC: eblake@redhat.com                                                            
> CC: armbru@redhat.com                                                            
> CC: qemu-arm@nongnu.org                                                          
> CC: qemu-riscv@nongnu.org                                                        
> CC: f.ebner@proxmox.com                                                          
>                           
> Igor Mammedov (19):
>   tests: smbios: make it possible to write SMBIOS only test
>   tests: smbios: add test for -smbios type=11 option
>   tests: smbios: add test for legacy mode CLI options
>   smbios: cleanup smbios_get_tables() from legacy handling
>   smbios: get rid of smbios_smp_sockets global
>   smbios: get rid of smbios_legacy global
>   smbios: avoid mangling user provided tables
>   smbios: don't check type4 structures in legacy mode
>   smbios: build legacy mode code only for 'pc' machine
>   smbios: handle errors consistently
>   smbios: clear smbios_tables pointer after freeing
>   get rid of global smbios_ep_type
>   smbios: extend smbios-entry-point-type with 'auto' value
>   smbios: in case of entry point is 'auto' try to build v2 tables 1st
>   smbios: error out when building type 4 table is not possible
>   smbios: clear smbios_type4_count before building tables
>   tests: acpi/smbios: whitelist expected blobs
>   pc/q35: set SMBIOS entry point type to 'auto' by default
>   tests: acpi: update expected SSDT.dimmpxm blob
> 
>  hw/i386/fw_cfg.h                     |   3 +-
>  include/hw/firmware/smbios.h         |  29 +-
>  hw/arm/virt.c                        |   6 +-
>  hw/i386/Kconfig                      |   1 +
>  hw/i386/fw_cfg.c                     |  14 +-
>  hw/i386/pc.c                         |   4 +-
>  hw/i386/pc_piix.c                    |   4 +
>  hw/i386/pc_q35.c                     |   3 +
>  hw/loongarch/virt.c                  |   7 +-
>  hw/riscv/virt.c                      |   6 +-
>  hw/smbios/Kconfig                    |   2 +
>  hw/smbios/meson.build                |   4 +
>  hw/smbios/smbios.c                   | 481 +++++++++++----------------
>  hw/smbios/smbios_legacy.c            | 185 +++++++++++
>  hw/smbios/smbios_legacy_stub.c       |  16 +
>  qapi/machine.json                    |   5 +-
>  tests/data/acpi/q35/SSDT.dimmpxm     | Bin 1815 -> 1815 bytes
>  tests/data/smbios/type11_blob        | Bin 0 -> 11 bytes
>  tests/data/smbios/type11_blob.legacy | Bin 0 -> 10 bytes
>  tests/qtest/bios-tables-test.c       |  81 ++++-
>  20 files changed, 535 insertions(+), 316 deletions(-)
>  create mode 100644 hw/smbios/smbios_legacy.c
>  create mode 100644 hw/smbios/smbios_legacy_stub.c
>  create mode 100644 tests/data/smbios/type11_blob
>  create mode 100644 tests/data/smbios/type11_blob.legacy
> 
> -- 
> 2.39.3

