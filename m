Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1782185dlb;
        Thu, 20 Jun 2024 10:35:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIWzXb6gQAgPEBtfaXbS04KCr0qtzzLp7ql3J4oYgDvNM+fXpfP7dtHD49qsZ0MRp5Mhzck/H+b8VLhy/EGAD+ZLX8vmB4
X-Google-Smtp-Source: AGHT+IGQVclNcAIsStK8ofbRZXZJJn93H747dFaf/R3/r+BWk3wNisQyNv2SOJMxIwRAQpRnzA27
X-Received: by 2002:a0c:f28a:0:b0:6b0:938e:44e0 with SMTP id 6a1803df08f44-6b501ed5b23mr68893846d6.62.1718904900520;
        Thu, 20 Jun 2024 10:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718904900; cv=none;
        d=google.com; s=arc-20160816;
        b=ywntsbxoVMgpNZaoxG8NIG3+B64AZhsb1gd/BlkWNN0h69T8dzQv0vQ4RF26u67Tcy
         THQa6vCBZxk5AztzkBKljXNTMb1oO5UzI8Q3nnXC6IqRguDLNByQokZ9XGlebrpXN5ys
         le1TR4MgHtCrd5E2jWDdcCiWzYb+Ctqj5e6yKVXuJlsGv9GVYbwkfSiHwjV1v/ZcUyr8
         zR6DaO4jL4B4Hdo1xlJLgyBG5Z2N70Gp99b10RK9ALBnLvtdNELijYjyn+zkLL+umvSA
         tM8aHD2pTOc0/wxsLFZ26dYLdqrMCXVFzVXkDIF2NWAtIoKPdH0K+Ni8D2mcAGjGm5A1
         axsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:cc:from:references:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=JSOwfNu+nTkhUY1sTluCY+7F6Z5c4YIiIQfEmoTmHHg=;
        fh=o4ENYfGzzLpYMQGdTkob1fxsybfz8YYum1waCUTyBpU=;
        b=F0LMqI3eWMyCzRIvrtnTmkAjVCPqJo4aY2ximhepJQd8+6OQR+bjhYFoM0lxIsz6Lu
         LK37xJA1mqszMji9m6+n1d7Tt422fgPkAVDkydFt2ZAk0sg4URvLiBmJT88Zgqx7JsF9
         bp+afGTdC76jHSweTdqVYDke9PFqoiqD6fUgOaAnFlFj0K+/kiKKRu/BpsSh4YAuZF4w
         rc66Blf/Yi9mvLQSjwcV2WB4u6Yr6U2Mwe1DlunZM4tC2vJXc0xMcGf/BSWaqihOtzg0
         IAcJhIxtNlNLFdz9vdxGq4G9Mc34fMjX+e2RXA7wZx/v08tIGxzPkDI1pphhQV9MmOCE
         e1xQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=byCF8b82;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b500141e4fsi59574906d6.206.2024.06.20.10.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 10:35:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=byCF8b82;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKLg5-00072B-Bg; Thu, 20 Jun 2024 13:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sKLfp-0006p2-Kd
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 13:34:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sKLfi-00009z-BX
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 13:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718904845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JSOwfNu+nTkhUY1sTluCY+7F6Z5c4YIiIQfEmoTmHHg=;
 b=byCF8b82UlnPovU27x4+He6ijXjD8QAvUtIch4nh9nHo6QFLVVZ56e9zesgKKML/AM2hec
 vytq5bS3IPNIrGQqCMIGGzBelMZtEyBYJ0YlfgTYqhBRuc7Z5P3Ldu+C5P5PbU3uNQ+7Ir
 r5QzTLsudKJpwLdE+wi5iCelecVqOgo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-MxZKqSqQNFykea3aVK27KA-1; Thu, 20 Jun 2024 13:34:04 -0400
X-MC-Unique: MxZKqSqQNFykea3aVK27KA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a6f2662d050so49114866b.3
 for <qemu-arm@nongnu.org>; Thu, 20 Jun 2024 10:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718904843; x=1719509643;
 h=content-transfer-encoding:in-reply-to:autocrypt:cc:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JSOwfNu+nTkhUY1sTluCY+7F6Z5c4YIiIQfEmoTmHHg=;
 b=uGHymaRWKuRIIMWRKcuzUb13X+d+NybjMcGMVZc1t8OiOxowTlgAgGM/7DwSaAm0sk
 /k9FkK5jJdM4YzfAYYmhgLHNfvSUkt9LoClBjLKG18rVS13eLGsXf5GZXvJ/BSkl/tVR
 k/qgydB/mjuhxp5zc9qmZwe13aDylawipAznGhtGFph18v5nYoDhXWHItDfhiFRSCnQM
 hCjCn/Vx6+FouVVzJniaYGkIbyQFlF3kuum1DPRa5SgY1Q/JeuDiVm+b1b/h0RaFigkN
 VmnLMGoDW3Gcw4RmOTAmzG4UeA2eAYLaE6p/A44qUSURsTTa5nrWH/hThoqqPHi4Qf82
 7NTQ==
X-Gm-Message-State: AOJu0YyMIwTH6WZ/1XWk94a13Npmuh+PE18tlYPKeAF17FQMq8zEGkw2
 osfjOAg/5b5AcQTQKDvx4xI1zRBzBe8EmAxMfNpSMuu+dVYffOgNx5I3iW2d+OUWkEE16QiJwvL
 AVoWOZBxEXYJywLA6uEzjp03wB9tRcyBrmIBbvRjNWSc+3LGy/w==
X-Received: by 2002:a17:907:a4c5:b0:a6f:b5ff:a6fd with SMTP id
 a640c23a62f3a-a6fb5ffab3cmr377265266b.12.1718904842893; 
 Thu, 20 Jun 2024 10:34:02 -0700 (PDT)
X-Received: by 2002:a17:907:a4c5:b0:a6f:b5ff:a6fd with SMTP id
 a640c23a62f3a-a6fb5ffab3cmr377262766b.12.1718904842534; 
 Thu, 20 Jun 2024 10:34:02 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-117.web.vodafone.de.
 [109.43.178.117]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fb508211csm144940766b.19.2024.06.20.10.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 10:34:02 -0700 (PDT)
Message-ID: <6b1daa9c-6f37-4edb-86d4-782941f1bcca@redhat.com>
Date: Thu, 20 Jun 2024 19:34:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to use designware-root-port and designware-root-host devices ?
To: Arthur Tumanyan <arthurtumanyan@gmail.com>, qemu-devel@nongnu.org
References: <CADueUgQh-=vmoO9kqL589Xeuf_LOM_K2Rr-rBxwe8iArdNdzsA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CADueUgQh-=vmoO9kqL589Xeuf_LOM_K2Rr-rBxwe8iArdNdzsA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.152,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: eZROXF3JMIXd

On 20/06/2024 10.28, Arthur Tumanyan wrote:
> Hi all,
> 
> My question may sound stupid, however...

  Hi Arthur,

no worries, the question how to use which device in QEMU can be quite tricky ;-)

> Currently I'm trying to make 
> available designware-root-{port,host} devices  in linux when I run it in qemu.
> 
> I try the following way to run:
> 
> qemu-system-arm -M virt -m 2G \
>       -kernel images/Image \
>       -append "rootwait root=/dev/vda ro" \
>       -drive file=images/rootfs.ext2,format=raw,id=hd0 \
>       -device designware-root-port,id=rp0,chassis=1,slot=0,bus=pcie.0,addr=1 \
>       -device e1000,netdev=net0,mac=52:54:00:12:34:56,bus=rp0,addr=0 \
>       -netdev user,id=net0
> 
> but it seems designware device is not enabled by default: qemu-system-arm: 
> -device designware-root-port,id=rp0,chassis=1,slot=0,bus=pcie.0,addr=1: 
> 'designware-root-port' is not a valid device model name

Are you sure about the names?

$ grep -r 'designware' *
...
include/hw/pci-host/designware.h:#define TYPE_DESIGNWARE_PCIE_HOST 
"designware-pcie-host"
include/hw/pci-host/designware.h:#define TYPE_DESIGNWARE_PCIE_ROOT 
"designware-pcie-root"

> when I enable it from Kconfig/meson.build it says the device is already 
> registered and exits with abort().
> 
>  From the other hand the device is declared as non pluggable: 
> dc->user_creatable = false;

Well, that means that you cannot use those with "-device". They can only be 
instantiated via the code that creates the machine.

> Can you please help me to use designware-root-host/port devices ?

It seems like the i.MX7 SABRE machine is using this device, so instead of 
"-M virt", you could have a try with "-M mcimx7d-sabre" (and a kernel that 
supports this machine) instead.

  HTH,
   Thomas

