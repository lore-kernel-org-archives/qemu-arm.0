Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5229754lfp;
        Tue, 5 Oct 2021 12:39:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCXuLqLUnLoVtFNH6txO+sF5AX5X2Mr6CEAgJXiHM6jqBa14GHZ7XOZMx2OrPs3PlCUOc6
X-Received: by 2002:ac8:18c:: with SMTP id x12mr21407485qtf.378.1633462759253;
        Tue, 05 Oct 2021 12:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633462759; cv=none;
        d=google.com; s=arc-20160816;
        b=ejLv6bJZV6h7/af8M4W9BkHWgnRntSlEYLCW5KERBIB6jxkuxv36Izm/aj2+7xjziP
         eJ//0ctd5yDvp9e+JuU48wtZ7Q4DhQWzsc7ZCOzfyg9HRaqFg3dpR6K7oRWaduzo4DQP
         N8LxU90lWKmeXr8Vm+JDV11Ry1R2LVYouwszQV7vU6n4AiN0A8SnaTnw/pOHI+tYWvAe
         rBMjXNNNMpW/n5NZpODqiySjTmc9D6S8lV+sQSIoFqMVYclaT3qptN0vXn3JZXcAkhVn
         wEjYE4T64zlHsl9G5rlh4R9qQSJdaKCbALg32OTdeyplmkb31XEnPXUq2xRhIWgY7NXd
         bASw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=y6Q06zG60cHh6k1SzwElQstJ18anZb4XfsmLDORUjSc=;
        b=zq696WVbPMy4QcehIYK6DTkeHPbTY+L0aG+RYhMDfLHOkA/F6PHm40sNjVshSpHnrY
         p5CGWo5ojWfJXeskdWHvav2q3LJOdMNHtxeRoTpb7tg747JGxVv5DFfjs1HbfvvetA/C
         zsB5BF5/psXCf1zUrJPm9oCIICz+5mWN44eAeM7OcM/MqgwFiCj819ngH0YrVIPFtCid
         V3ds4RNkAD0816Bg1F3pMjzh/3Ktca9fAC0Qq2w7M9l9axcsYaPmTI17vDETxaXlsGB9
         Utb038vrRgebmkIvPHzpUqT7XeFqYdl92DnbO6wXJ1E67UrafyOQnB7eNsJNGOQE6f4c
         OOAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A4jlxKQj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv4si5620553qvb.40.2021.10.05.12.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 12:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A4jlxKQj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXqHW-0001Sk-Ls
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 15:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXqGg-0001Il-SM
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 15:38:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXqGa-0006Mh-5W
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 15:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633462698;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6Q06zG60cHh6k1SzwElQstJ18anZb4XfsmLDORUjSc=;
 b=A4jlxKQj9GxflrDocHFSU9pfuvZc7+aMfx1b76AblnBuyyTeDQ0D+quexgpG9CBnuBI4k/
 gDbikW9xthwEdgXa9erWKUlC+l8MRvqdiE+/ph29USMrBcTqXejdJ/COjIV6MCaML5Jcm0
 +C+rvhMeXqWK0s+I1OUnxoSZIf+TeC0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-32BwBg8KNeONQJ9GFzNaew-1; Tue, 05 Oct 2021 15:38:18 -0400
X-MC-Unique: 32BwBg8KNeONQJ9GFzNaew-1
Received: by mail-wr1-f70.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so152175wrg.10
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 12:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=y6Q06zG60cHh6k1SzwElQstJ18anZb4XfsmLDORUjSc=;
 b=R4uBeplW/dpKIZdt8rYzFqqNi2piCcn8HjziqweMmbeaEVgwObGgZl7xS18iOuV/PI
 pkP4khyuWK40c7VwkqFgYFLJXvwfsPJkq1wJTYvyhRpW1BkYNQuEuvnLp/Gd895lC2+3
 oRo0UpUUmqJau6MBa/b0Zm7XMvFkrUBcUfaQwRbVuyS+4/iXI2m86+EWoMYnR6Mc1Gcu
 s12si0gxmzNglOu4hbGsD0PLxs/J/PX05wJMDBKKElpCPZFuvL0xynXZS5Osgac2hx8k
 pHbpPRHUb06DawenXAPODIes1YWOMBG/HJN7b18DtDCqJEoV3smRV2yeCvBAc2pChqjz
 Ts9A==
X-Gm-Message-State: AOAM531rKyz4v4uLSI0l1o/HanE9azQ6Q0zGyoNmCg112bBbhjDYUKtJ
 HKtBH9oDUXkiqzOYD5ZISMCNITRzG9DarV5fK/VeBWX3sqU7qHw9TX+LB5ihODPRrshLWirdGfF
 /NPdjSk5jmHjPNmBrrIbQa4jeLA/N1Xwn7rrdxUSHhj3JDAAMNqUbgBuRIai8/NrOe+Q=
X-Received: by 2002:adf:a34b:: with SMTP id d11mr18820483wrb.107.1633462696301; 
 Tue, 05 Oct 2021 12:38:16 -0700 (PDT)
X-Received: by 2002:adf:a34b:: with SMTP id d11mr18820443wrb.107.1633462696003; 
 Tue, 05 Oct 2021 12:38:16 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id k128sm3113799wme.41.2021.10.05.12.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:38:15 -0700 (PDT)
Subject: Re: [PATCH v4 10/11] tests/acpi: add expected blob for VIOT test on
 virt machine
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, imammedo@redhat.com
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-11-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <f5293d9e-10b1-6a85-a35f-66b12680cdd2@redhat.com>
Date: Tue, 5 Oct 2021 21:38:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211001173358.863017-11-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H1516v9TifMV

Hi Jean,

On 10/1/21 7:33 PM, Jean-Philippe Brucker wrote:
> The VIOT blob contains the following:
>
> [000h 0000   4]                    Signature : "VIOT"    [Virtual I/O Translation Table]
> [004h 0004   4]                 Table Length : 00000058
> [008h 0008   1]                     Revision : 00
> [009h 0009   1]                     Checksum : 66
> [00Ah 0010   6]                       Oem ID : "BOCHS "
> [010h 0016   8]                 Oem Table ID : "BXPC    "
> [018h 0024   4]                 Oem Revision : 00000001
> [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> [020h 0032   4]        Asl Compiler Revision : 00000001
>
> [024h 0036   2]                   Node count : 0002
> [026h 0038   2]                  Node offset : 0030
> [028h 0040   8]                     Reserved : 0000000000000000
>
> [030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
> [031h 0049   1]                     Reserved : 00
> [032h 0050   2]                       Length : 0010
>
> [034h 0052   2]                  PCI Segment : 0000
> [036h 0054   2]               PCI BDF number : 0008
> [038h 0056   8]                     Reserved : 0000000000000000
>
> [040h 0064   1]                         Type : 01 [PCI Range]
> [041h 0065   1]                     Reserved : 00
> [042h 0066   2]                       Length : 0018
>
> [044h 0068   4]               Endpoint start : 00000000
> [048h 0072   2]            PCI Segment start : 0000
> [04Ah 0074   2]              PCI Segment end : 0000
> [04Ch 0076   2]                PCI BDF start : 0000
> [04Eh 0078   2]                  PCI BDF end : 00FF
> [050h 0080   2]                  Output node : 0030
> [052h 0082   6]                     Reserved : 000000000000
I noticed the spec does not clearly say the virtio-iommu-pci BDF does
not need to be excluded from the PCI range.
Shouldn't it be clarified?

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric



>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>  tests/data/acpi/virt/VIOT                   | Bin 0 -> 88 bytes
>  2 files changed, 1 deletion(-)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 29b5b1eabc..fa213e4738 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,4 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/VIOT",
>  "tests/data/acpi/q35/DSDT.viot",
>  "tests/data/acpi/q35/VIOT.viot",
> diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..921f40d88c28ba2171a4d664e119914335309e7d 100644
> GIT binary patch
> literal 88
> zcmWIZ^bd((0D?3pe`k+i1*eDrX9XZ&1PX!JAexE60Hgv8m>C3sGzXN&z`)2L0cSHX
> I{D-Rq0Q5fy0RR91
>
> literal 0
> HcmV?d00001
>

