Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1071344eja;
        Fri, 1 Mar 2024 05:56:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU2aPTeun90z0RRJx5NPlNO8F8dc9lMcSI0Hya3TqxW7A0RTT0eREF/jUsoy0ZwDV5R+V4z2R7SI7j34XSwgDVZuGd9Qdw+
X-Google-Smtp-Source: AGHT+IHS4vOcZU2+iJQlMXiUw9Tlbq1yuGmw+lHpQjEVK4xgo+F4B2TnLIkIw3LaR1PWglt2nS5r
X-Received: by 2002:a05:622a:10a:b0:42e:c6db:40da with SMTP id u10-20020a05622a010a00b0042ec6db40damr1776430qtw.36.1709301383738;
        Fri, 01 Mar 2024 05:56:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709301383; cv=none;
        d=google.com; s=arc-20160816;
        b=F8UpvuVK990aeW9pQkHft0YPl2DrviLZoL7oDgx8UrlFpjWaXHI/IN7owDj7AEciYD
         qWkb4Sd1gmMsDUtDkOJPprABBvstHwoNYXUm6/gabBxhIY+bVmlflRnu5SMt/obNlmQu
         G96zt1tcGUIbEbtYXPzWPoYLydyNQfseUT/TOkA7A4rPYWSOfmteFNXjgzGSAD2JD6j5
         TP6hQJ5t1SlBTi8TQyDAOzNHT48XqvJCPOrN9mtMr3XVZo2iTrzlEfH1oKdy5DG+i7+X
         6+D8p4fQ+Y/t40HHCF2gg3gZfHOT3LNzjwtlES5IawYl9t9o1ozOw61Ubu3pdJ6baCfK
         RK1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id;
        bh=MnWh+eqzWj1O97pCxztSI+KJETrqglOMPJL1IgcgtN4=;
        fh=Q5KDUqtjRy3+sC6114y2UzscfZIjjg6ZLQnstKDnu3E=;
        b=CslsgKVvj1+b+H9mzgtjQbvtIsfpV7snAvUPgRUiCnN7B9jqv45OV8BOCfdAp2vPzm
         fjGozSEgAC3+JnDr/0nOSdHWhL31bj3g1ytRZZTPLVMzh3HISCf9KvJycvl5aOVxXaYe
         Pq916O+Cp8doJLCDyg+7gclLjKrMS55FOD+rlqJNy1U1/mB3CCMLjz16DDBPdYa2aA5W
         /iJb1gZKHETKlQ/M8Vib0Hl/iSWlqc7DLQKtjBYpJyZai1xp6Xln9pu0i3i/gkLkzNQP
         L+S40Z0gi1a9RW2JzyFOTYiOPzMvF41wA6S1aN7Ff7jtVpF4TQ/DPEMrUpRsLebAoQb1
         KPMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a23-20020ac87217000000b0042c74f61410si3261326qtp.725.2024.03.01.05.56.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 05:56:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg3My-0001pM-HU; Fri, 01 Mar 2024 08:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1rg3Mw-0001os-7p; Fri, 01 Mar 2024 08:56:10 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1rg3Mr-0007S5-9o; Fri, 01 Mar 2024 08:56:09 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 346DA482A6;
 Fri,  1 Mar 2024 14:55:55 +0100 (CET)
Message-ID: <91b064fa-c006-41a4-a53e-d860c45d8675@proxmox.com>
Date: Fri, 1 Mar 2024 14:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] Workaround Windows failing to find 64bit SMBIOS
 entry point with SeaBIOS
From: Fiona Ebner <f.ebner@proxmox.com>
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, anisinha@redhat.com, philmd@linaro.org,
 wangyanan55@huawei.com, eblake@redhat.com, armbru@redhat.com,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <60950146-7b79-465d-9e33-3c485cc00504@proxmox.com>
Content-Language: en-US
In-Reply-To: <60950146-7b79-465d-9e33-3c485cc00504@proxmox.com>
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
X-TUID: 6Btwn5oayGa7

Am 29.02.24 um 14:18 schrieb Fiona Ebner:
> Am 27.02.24 um 16:47 schrieb Igor Mammedov:
>> Windows (10) bootloader when running on top of SeaBIOS, fails to find            
>> SMBIOSv3 entry point. Tracing it shows that it looks for v2 anchor markers       
>> only and not v3. Tricking it into believing that entry point is found            
>> lets Windows successfully locate and parse SMBIOSv3 tables. Whether it           
>> will be fixed on Windows side is not clear so here goes a workaround.            
>>                                                                                  
>> Idea is to try build v2 tables if QEMU configuration permits,                    
>> and fallback to v3 tables otherwise. That will mask Windows issue                
>> form majority of users.                                                          
>> However if VM configuration can't be described (typically large VMs)             
>> by v2 tables, QEMU will use SMBIOSv3 and Windows will hit the issue              
>> again. In this case complain to Microsoft and/or use UEFI instead of             
>> SeaBIOS (requires reinstall).                                                    
>>                                                                                  
>> Default compat setting of smbios-entry-point-type after series                   
>> for pc/q35 machines:                                                             
>>   * 9.0-newer: 'auto'                                                            
>>   * 8.1-8.2: '64'                                                                
>>   * 8.0-older: '32'                                                              
>>                                                                                  
>> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/2008                        
> 
> Thank you! I'm happy to confirm that this series works around the issue :)
> 

While I still didn't do any in-depth testing (don't have enough
knowledge for that anyways), I played around a bit more now, check that
nothing obvious breaks also with a Linux VM and also ran a successful
'make check'.

If that is enough, feel free to add:

Tested-by: Fiona Ebner <f.ebner@proxmox.com>

Best Regards,
Fiona

