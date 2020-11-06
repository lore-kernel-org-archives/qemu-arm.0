Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1479329lfb;
        Fri, 6 Nov 2020 09:10:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzleoSnKU6HgGd0NhtkpKtVfcbziqyMcLLdgivab+d+XzYgpzVh0a/xGCPZDs7pwSPfleXb
X-Received: by 2002:a05:6214:87:: with SMTP id n7mr2556799qvr.16.1604682615604;
        Fri, 06 Nov 2020 09:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604682615; cv=none;
        d=google.com; s=arc-20160816;
        b=r0vn5ZOIOKd5C71VpZPBqb28mHwjyzXXE4nb6Oygv0CrNrVtcqWM2aEQzTdnR2RPpV
         5d3oQpsePqpZd26lcnM/jvyyUuSt6m3wIGtnbkMNreO4Wi3T03f9CF7QDxrfNMtwiojI
         V3Xxc3a236VfG82RGQ2doa4wNsxUVil3DadcEn0w9SH6nYhvndP0kQ8RIYtkeNZkvi3m
         c1GLGm9203ksq+rYpdIsGAAimyOAvoq4mFdu7IDlrGKVyjmXk/IgRTcUlhXpAuIK52PT
         YK18W0ZxLPR82DYYkuuJx1H/f1xZIuBs1Qrc8CQQ9olRFSIsPInkFtGVVaiJ6f0SQ6/9
         X6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:date:message-id:from
         :references:to:subject:dkim-signature;
        bh=pCc2OHwduMCbNswptc9B/atjIkhqIhKb8LFY7rv/A8Q=;
        b=qRzei8P26De6Fv43nhY+YjYKJwTKuT2wRom9AjvfyaLHBPKyk8SUBE/JVm9ZGlEXHv
         FvN88Oo6TG58a+3XYCQk+SXawMNgFITXOUDvp7vfACmttqoI+CQxlaTgkPgf9CW6W7Mj
         ctjrcR1rzqvQ6JpUm7iAcwdWo+dp7JXD9FSPiN2KAi7qoBiG0dj+hmmESh/3xiMbUr4Q
         NALKONV93tMc8OLIRL7px03O7LB75YPeTxV5jS/RsFGguG6RgY8AKe3tEceAmCZr590D
         2ubkAQt+wF0QHMNoo+2nmLqlglfRb5bqlFUJCYF9DWHfPbRQYqrSrAW7W8GDZqQ5eRFf
         Zlfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iMtzWjoI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18si714964qtp.110.2020.11.06.09.10.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Nov 2020 09:10:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iMtzWjoI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kb5Ff-0007kJ-12
	for alex.bennee@linaro.org; Fri, 06 Nov 2020 12:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kb5FV-0007iQ-AY
 for qemu-arm@nongnu.org; Fri, 06 Nov 2020 12:10:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kb5FT-00031d-1M
 for qemu-arm@nongnu.org; Fri, 06 Nov 2020 12:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604682601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCc2OHwduMCbNswptc9B/atjIkhqIhKb8LFY7rv/A8Q=;
 b=iMtzWjoIlVSlgJO84jwjDMNrBBS++NSeAt8KBsOqehHTfp2WAKHKniumV9JU6TuZs5yOD3
 7uYyoZw5wgrt99b9EAlD6DENXXK2o3BpCRFiJgfSe6EB7icgZHT++mh4qIWPTEM62Boupp
 2C62lGJL7VVNZod1vIwYeW+zqI7WjeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-t5aAyBMzOzqdm32kVbB9uQ-1; Fri, 06 Nov 2020 12:09:58 -0500
X-MC-Unique: t5aAyBMzOzqdm32kVbB9uQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15795101962D;
 Fri,  6 Nov 2020 17:09:57 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-95.ams2.redhat.com
 [10.36.115.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D39C06EF75;
 Fri,  6 Nov 2020 17:09:54 +0000 (UTC)
Subject: Re: Question on UEFI ACPI tables setup and probing on arm64
To: Ying Fang <fangying1@huawei.com>, Igor Mammedov <imammedo@redhat.com>
References: <ee3b7fdf-f6ba-cafc-5b44-42b0bcda01c5@huawei.com>
 <20201103133913.1fee3337@redhat.com>
 <a79383a6-92d4-5b10-d143-414543caab70@redhat.com>
 <5310d14d-8dbe-ba97-fdf1-4f3f10f91f3a@huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <813efc59-2ce4-e2be-894f-e48ca66ce603@redhat.com>
Date: Fri, 6 Nov 2020 18:09:53 +0100
MIME-Version: 1.0
In-Reply-To: <5310d14d-8dbe-ba97-fdf1-4f3f10f91f3a@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 06:30:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Drew Jones <drjones@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "wangzhigang17@huawei.com" <wangzhigang17@huawei.com>,
 "Ard Biesheuvel \(ARM address\)" <ard.biesheuvel@arm.com>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rg2+CVTC5Cui

On 11/05/20 05:30, Ying Fang wrote:

> I see it in Qemu the *loader_start* is fixed at 1 GiB on the
> physical address space which points to the DRAM base. In ArmVirtQemu.dsc
> PcdDeviceTreeInitialBaseAddress is set 0x40000000 with correspondence.
> 
> Here I also see the discussion about DRAM base for ArmVirtQemu.
> https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03127.html
> 
> I am still not sure how UEFI knows that it is running on a ArmVirtQemu
> machine type.

It doesn't know. It remains a convention.

This part is not auto-detected; the constants in QEMU and edk2 are
independently open-coded, their values were synchronized by human effort
initially.

The user or the management layer have to make sure they boot a UEFI
firmware binary on the machine type that is compatible with the machine
type.

There is some meta-data to help with that:

> Does UEFI derive it from the fdt *compatible* property ?

Please see the schema "docs/interop/firmware.json" in the QEMU tree; in
particular the @FirmwareTarget element.

For an actual example: QEMU bundles some edk2 firmware binaries (purely
as a convenience, not for production), and those are accompanied by
matching descriptor files. See
"pc-bios/descriptors/60-edk2-aarch64.json". (It is a template that's
fixed up during QEMU installation, but that's tangential here.)

    "targets": [
        {
            "architecture": "aarch64",
            "machines": [
                "virt-*"
            ]
        }
    ],

Thanks
Laszlo

