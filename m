Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp377655eja;
        Thu, 29 Feb 2024 05:18:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU1hIIWiiG/4Et6IbPBgqzfjKBjlU3a+bB0WoOSxutkMoe8Zs7NgQIoIHr/VoB3BoKawppzyFkIRlXw47QzpGkUbB98f+Gh
X-Google-Smtp-Source: AGHT+IFU17/BQKK91TbheEXKqy3CaRYyPiFF7dAnA28lHBtiNSjyaSqRtSMhLkalOpqB/nY4Sa+q
X-Received: by 2002:a05:6830:1e84:b0:6e4:bb48:39f4 with SMTP id n4-20020a0568301e8400b006e4bb4839f4mr1757774otr.35.1709212723365;
        Thu, 29 Feb 2024 05:18:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709212723; cv=none;
        d=google.com; s=arc-20160816;
        b=NI+8Ozw4DAHuWvVqd5mSVotNo0ZXHGGeB+NRXWUrKxTudcEr7n+0MOHsiBJbjR/ggJ
         uMIeKpM6CwV5VbzBpM28k17HbTJKE8Pi6eClikmCXfA1WfCDGCKbOx21Vs8asf0ukc+Z
         nKFAqrt04FV+1N6OGJkr0NJWXdCpcm48sn/fhZo44/6wU4+WVAaPFpgrQop3Jb28HT9e
         zZfF1Gb5sIXfJz/7JXc0VkyGGSq7UpSSjK4BN2kD0+nNLQGpDjSOGslP4WwgQZs0UiAN
         mLAcbDAFy9Pcb+y/sjC+otnFBNfO4VGInwqt7NmbVVhCKM9i9dmJPDhTNcBOWzkysg6d
         9eHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=W/p0SGHab+/uj5Jk7EuQ+3ol/tTRwXMI/9GFLcR/R6I=;
        fh=Q5KDUqtjRy3+sC6114y2UzscfZIjjg6ZLQnstKDnu3E=;
        b=ztgtu2Naki3YR1L1d16dGRjVDWIXE2/fmhgjNl4eLhefp5rJhLJKeZ8J7fsbzcP5oA
         lnjPFHn9L5H1oNdB6/3uGTPYdUNiKO0QDZSYuuuXkHpkwDxd6bwLGrKmZy/h7/hyqwNc
         3Iz2oNvxnpHAQILWIZPDxX92nN3eGtH7MnDxNkkX4bUO6Fkrea6xEWx6JEtDxFC5IymN
         AjBJ5tsbvm+lJdGc3YazeSDOipz+lQ7UPZythj5+/tXDezy/VJ9NKLIHrUmL9+NJRjvd
         pNIcbzpn8R3p+7ovZRL+dUon+EKU26H0xMRd34cvXV6LRfjZMysLWPBUPkuOMs5kXCw9
         sRcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020a05622a028900b0042eb8a53fffsi1467605qtw.488.2024.02.29.05.18.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 05:18:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rfgIq-0004tu-Kd; Thu, 29 Feb 2024 08:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1rfgIj-0004sI-On; Thu, 29 Feb 2024 08:18:17 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1rfgIh-0003hS-PD; Thu, 29 Feb 2024 08:18:17 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 6D5A147F90;
 Thu, 29 Feb 2024 14:18:12 +0100 (CET)
Message-ID: <60950146-7b79-465d-9e33-3c485cc00504@proxmox.com>
Date: Thu, 29 Feb 2024 14:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] Workaround Windows failing to find 64bit SMBIOS
 entry point with SeaBIOS
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, anisinha@redhat.com, philmd@linaro.org,
 wangyanan55@huawei.com, eblake@redhat.com, armbru@redhat.com,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20240227154749.1818189-1-imammedo@redhat.com>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <20240227154749.1818189-1-imammedo@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ooMVaclOZ8y8

Am 27.02.24 um 16:47 schrieb Igor Mammedov:
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
>                                                                                  
> Default compat setting of smbios-entry-point-type after series                   
> for pc/q35 machines:                                                             
>   * 9.0-newer: 'auto'                                                            
>   * 8.1-8.2: '64'                                                                
>   * 8.0-older: '32'                                                              
>                                                                                  
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/2008                        

Thank you! I'm happy to confirm that this series works around the issue :)

Best Regards,
Fiona

