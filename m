Received: by 2002:a0c:eda5:0:0:0:0:0 with SMTP id h5csp5118482qvr;
        Tue, 3 Nov 2020 04:40:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyELd1BroV0EJvrVRgx8Sl4TDgAGkceJUcgysp4EFgY05gKiNoVF5BpyBbxpMc0rGTX32/i
X-Received: by 2002:ac8:36bc:: with SMTP id a57mr15555297qtc.193.1604407210973;
        Tue, 03 Nov 2020 04:40:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604407210; cv=none;
        d=google.com; s=arc-20160816;
        b=IRnnAvWZ5wvOvG5fXqIqDlT2AheqDczc2l+em1Ly59/16Y+joc9RCRF9g+TZ9jR65N
         qMoZEJ5wm6qUJ7VY1s8yk3nLDFwc2iqjxf//nfM85QkNibUu18UDyCbsWe9wtgWQWl9x
         ll1O1QRWAEtFcISC82ZjbASYh8pxS+sAXXrzd5bxcpgYFFa4neCEVU6lL7RUPgrvKS3i
         MgttXwtlOHT0r6QBPDx91HucjBny0MlUrix1C4cNNWVX5i11nNgfxhvVgoZs8pxdxGOy
         F2qMynYBSlh16iVZY2lXpaVCeGYgpZxml7g57j2HkyZNJmweHKObuthE8czgnpN/Kueh
         kz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=UI6Y4+XlJlwrHvxocB3ncP7ba8NPybAEToiaJnoIIyI=;
        b=Wbcwmx7SUWT3KmCDF1Y1SN7Qvu1QszKbQ98JW5Ojsyf5fvFp7eQGarFNMSO196wQUg
         /ywJDIPMloQgO1cqfV5V7iu6WinhNP3gLib9D9ZJ5sSWoPVyJovAF3IomUKQJqnl8Ia0
         3n/l9svYq0eL+eVaVHKmEwIPN49L5pB5KlzURb3gwRcnSIGHtwSS7CYIFF+HCEtlltZp
         ZpAuEgIHe89MswW9eeQWg+S8RukC4HA3aRF19dCZlGnF3P931VGbDxY+69LuqQQqudqW
         FEyEO1PFSekZaI7yWRgbj/LTbN+8wePfkoHN03l65Bi7fljhkptyJ9lz3jnE6foFFvEw
         aQqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ts3Ix3o3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4si10704850qke.280.2020.11.03.04.40.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 04:40:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ts3Ix3o3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZvbe-0005bt-El
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 07:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kZvb3-0005af-Kd
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 07:39:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kZvb0-0006OM-NO
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 07:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604407165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UI6Y4+XlJlwrHvxocB3ncP7ba8NPybAEToiaJnoIIyI=;
 b=Ts3Ix3o3h8sV7RTCxennQ5YDR6aviviUMswXgDMyrv+5rs8PKBwbNzYbDkim8aXRi0iZCY
 aNvqkQTIy0QrE4saQAGGxZKp4zAQDKTguLfydcADuFVE3o/d9k8MCOQXuI8MDKQkKLcz/y
 kDd9K938EfEl7UJmrzCsLk/lpYJElCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-z2r4LVopP_-IEtFB6vhpUA-1; Tue, 03 Nov 2020 07:39:21 -0500
X-MC-Unique: z2r4LVopP_-IEtFB6vhpUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4245180364D;
 Tue,  3 Nov 2020 12:39:20 +0000 (UTC)
Received: from localhost (unknown [10.40.208.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F47F1002D49;
 Tue,  3 Nov 2020 12:39:16 +0000 (UTC)
Date: Tue, 3 Nov 2020 13:39:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: Question on UEFI ACPI tables setup and probing on arm64
Message-ID: <20201103133913.1fee3337@redhat.com>
In-Reply-To: <ee3b7fdf-f6ba-cafc-5b44-42b0bcda01c5@huawei.com>
References: <ee3b7fdf-f6ba-cafc-5b44-42b0bcda01c5@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, lersek@redhat.com,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "wangzhigang17@huawei.com" <wangzhigang17@huawei.com>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MIPZMfTqXVoW

On Fri, 30 Oct 2020 10:50:01 +0800
Ying Fang <fangying1@huawei.com> wrote:

> Hi,
> 
> I have a question on UEFI/ACPI tables setup and probing on arm64 platform.

CCing Laszlo,
who might know how it's implemented.
 
> Currently on arm64 platform guest can be booted with both fdt and ACPI
> supported. If ACPI is enabled, [1] says the only defined method for
> passing ACPI tables to the kernel is via the UEFI system configuration
> table. So AFAIK, ACPI Should be dependent on UEFI.
> 
> What's more [2] says UEFI kernel support on the ARM architectures
> is only available through a *stub*. The stub populates the FDT /chosen
> node with some UEFI parameters describing the UEFI location info.
> 
> So i dump /sys/firmware/fdt from the guest, it does have something like:
> 
> /dts-v1/;
> 
> / {
> 	#size-cells = <0x02>;
> 	#address-cells = <0x02>;
> 
> 	chosen {
> 		linux,uefi-mmap-desc-ver = <0x01>;
> 		linux,uefi-mmap-desc-size = <0x30>;
> 		linux,uefi-mmap-size = <0x810>;
> 		linux,uefi-mmap-start = <0x04 0x3c0ce018>;
> 		linux,uefi-system-table = <0x04 0x3f8b0018>;
> 		bootargs = "BOOT_IMAGE=/vmlinuz-4.19.90-2003.4.0.0036.oe1.aarch64 
> root=/dev/mapper/openeuler-root ro rd.lvm.lv=openeuler/root 
> rd.lvm.lv=openeuler/swap video=VGA-1:640x480-32@60me 
> smmu.bypassdev=0x1000:0x17 smmu.bypassdev=0x1000:0x15 
> crashkernel=1024M,high video=efifb:off video=VGA-1:640x480-32@60me";
> 		linux,initrd-end = <0x04 0x3a85a5da>;
> 		linux,initrd-start = <0x04 0x392f2000>;
> 	};
> };
> 
> But the question is that I did not see any code adding the uefi
> in fdt chosen node in *arm_load_dtb* or anywhere else.
> Qemu only maps the OVMF binary file into a pflash device.
> So I'm really confused on how UEFI information is provided to
> guest by qemu. Does anybody know of the details about it ?
> 
> [1] https://www.kernel.org/doc/html/latest/arm64/arm-acpi.html
> [2] https://www.kernel.org/doc/Documentation/arm/uefi.rst
> 
> Thanks.
> Ying
> 

