Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp697546lfm;
        Tue, 18 May 2021 12:11:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwApP/uDh2H8ow/Bwt/QIkZ+7ZPFcTNDGpWnWBNliVW3MX7S0mbynMBxVAJUEzG7aizpz61
X-Received: by 2002:a02:380d:: with SMTP id b13mr7271629jaa.77.1621365110372;
        Tue, 18 May 2021 12:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621365110; cv=none;
        d=google.com; s=arc-20160816;
        b=sa8XOkUmFAA8P2VtkAIQpNE9+u4MWvdb+ym+kxhNx0H8mMaAuKLyA9k9Afwgs11c4D
         Iw59oCfjdvWzxwM6MFgPw7iNKtRlbLUFlnDN8GWK/w/Kpj7Zw3oaku+IGGOKAq5V0md+
         84OBLVF1uIWdyj2UZmRKrV3MW95bLhlhefWDISEGjzV/cmB3AUxGJTedqg00YtrNb8Ws
         2bFqjyfusRc68+wWsM+2rrjgUbge/31UeKYPZODxTXyn6zDYl4kQ84OIxlaCcHl5ySCp
         AOBeBHnTV8lVNzF609JhtQKTsbxpnjwExOhaweZ5/L/iA4s3w2zCPhI+SEtPuM3YKbtU
         Ih0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fwByx8C8msqjMmho85FgN1xrYCdmXBYqdKwFSOKVW6A=;
        b=GjEDnXQ0vLBPi6p4cA4UU2y+IsSJ2F0aBCLZcNB1nv/dqHhPuSXvHh1NM0nEgppB5Z
         WT5oD3FU9GaVvZqm/JmM9YodftVCcgwoM/3f/mTcLoplxTcDFUQ6BgPprC6cLCep7eiY
         WcyQNhzotUHJ++Dar5A/ejPGU/ylW0VBNFKvI37UCE/qNOH0ge9hflgUpNfHV8gFpTwl
         nQ7zMAC3PznLkC43SKUxkZxtwBghHhs+GrjbdxWB0a8sYU/yTc2+ilFMaj32TJsVboYG
         PjsidkQFbfdZrJGeCPYPuU0FfcX7BVlLJNwawup2+EMB78gGm040lQYQcCIH5eaDLnUx
         d+WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SCVWoxNC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18si3371690ilg.96.2021.05.18.12.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 12:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SCVWoxNC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj589-0007WB-Ny
	for alex.bennee@linaro.org; Tue, 18 May 2021 15:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj56Q-0005dN-64
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:10:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj56I-0001cI-0B
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621364991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fwByx8C8msqjMmho85FgN1xrYCdmXBYqdKwFSOKVW6A=;
 b=SCVWoxNC28TmlkLFbeyG2dgaoqsTfw8s3uo1WaLyaPmMvHZ7LVHy8BdrS45tR3aSDmWyk5
 +Ec7OicHadiXvARy9z/owRpa/bmFrpAe1jOb8yA5q22E3yhExDxNTwLO23GZhPJVDCDt6Y
 ULpmL1gaDJtXEO7tqV5m/34nhcm9r50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-fORRYkyDO5W6X8AcSdhgLg-1; Tue, 18 May 2021 15:09:49 -0400
X-MC-Unique: fORRYkyDO5W6X8AcSdhgLg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA183180FD61;
 Tue, 18 May 2021 19:09:47 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59E34687E0;
 Tue, 18 May 2021 19:09:45 +0000 (UTC)
Subject: Re: [PATCH v2 02/12] hw/ide/Kconfig: Add missing dependency PCI ->
 IDE_QDEV
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-3-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <baab8de6-032c-5351-694f-3f4a8fb016ec@redhat.com>
Date: Tue, 18 May 2021 15:09:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210515173716.358295-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 "open list:IDE" <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VU8sAFuSO9i7

On 5/15/21 1:37 PM, Philippe Mathieu-Daudé wrote:
> The pci_ide_create_devs() function is declared i hw/ide/qdev.c:
> 
>   $ git grep ide_create_drive
>   hw/ide/pci.c:491:            ide_create_drive(d->bus + bus[i], unit[i], hd_table[i]);
>   hw/ide/qdev.c:127:IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive)
>   include/hw/ide/internal.h:653:IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive);
> 
> Fix the correct symbol dependency to avoid build failure when
> deselecting some machines:
> 
>    /usr/bin/ld: libcommon.fa.p/hw_ide_pci.c.o: in function `pci_ide_create_devs':
>    hw/ide/pci.c:491: undefined reference to `ide_create_drive'
> 
> Fixes: 8f01b41e109 ("ide: express dependencies with Kconfig")
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: John Snow <jsnow@redhat.com>

> ---
>   hw/ide/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
> index 8e2c8934549..dd85fa3619f 100644
> --- a/hw/ide/Kconfig
> +++ b/hw/ide/Kconfig
> @@ -8,7 +8,7 @@ config IDE_QDEV
>   config IDE_PCI
>       bool
>       depends on PCI
> -    select IDE_CORE
> +    select IDE_QDEV
>   
>   config IDE_ISA
>       bool
> 

