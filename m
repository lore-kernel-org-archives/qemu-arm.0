Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp595070ocs;
        Tue, 27 Sep 2022 07:14:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4c+knyjHDPGcdGcKYsHbBsR8FNdtkUiGwJIEbhAa0m2qYZOdgRvx4+D7fgovCUh4QbBrP4
X-Received: by 2002:a05:620a:1a0c:b0:6cb:e0a3:f889 with SMTP id bk12-20020a05620a1a0c00b006cbe0a3f889mr17659533qkb.538.1664288099261;
        Tue, 27 Sep 2022 07:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664288099; cv=none;
        d=google.com; s=arc-20160816;
        b=kFGOh77nKGWbjo4ocVwcrGKoZAam5KxK+VrxsZqulFJe2BpgRXG9Y/8iDTo8SJ3Lr6
         NQGEwLJcJT1J9Z3pjmCjZJyUL0JNI7iNNYfdVH24L45ZFGhcezpsuThxJuLXXimvTGGb
         kkC8ymhm5NKJMJjlriikTTI2OoaYn4vJoODKiCGzHpeDRLNvY14HGXFtMqIDfzlo08u4
         V1lujKx9lNM3nHnFUtpGU1mkXRKC9bBCw58hEyNFm4/hud4gmsSUatSIjiR4pA66sjdT
         aGs+UQRcfDwrH8udG7qVmaN5yINHPgswnYM964YQ/tbfk/NACLr49uZypwQTU2nciCQ9
         J8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6ch0jVZlnqry2hPnT/PWAtD5RRCFBYK9ePwmLiCa+Rk=;
        b=Hx+TLfzrEy2elw0ZOHNKH9U4XXgkhDG6f8sPQhFmczNWwVQHV+WUehiIelkoXlVGKg
         9dToOsY6Y127Xs9XIt9C1jUInHI+bZy4trJrJdPaka2NtA1ZZkI9A81tBjJX+0i+NH98
         5DuXrxTq7hL9TnmBYqPW1YBgkixyLmn4cfrk13r51qCGVNnvHNqLVUF81u86YvFybEO0
         I54M198f+mMD/zfALA4Z+2on7HnwaHHLLu0zaCyj1aTgzGxH/0W0y0+r4bzYww0cgRzh
         zmASFaD/06SOf1Cff2WWwiLj6b7nm6Jh+F5+tn+jtB8KcKnOQnwpQpCFRA6oXPFN0pL9
         kK8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KwNLYCJJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk16-20020a056214509000b00496c357b5efsi967818qvb.326.2022.09.27.07.14.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 07:14:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KwNLYCJJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odBMQ-00042W-RH
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 10:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odA0a-0001lv-BC
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 08:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odA0X-0007E7-NO
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 08:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664282897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ch0jVZlnqry2hPnT/PWAtD5RRCFBYK9ePwmLiCa+Rk=;
 b=KwNLYCJJ/q7efX72DaXqtLwppZZWM1jMusfSLN4vMyZbjvfWhwydW/xc4vKKuMMJ/5XpSd
 mAf+8xfqFtI1I+kkgVmhhg2W9JIB0k2O0qhSrd62Hi0MN0GrV0dXtPy7VtOy4K2RqONP3y
 wkxGZMfTaLAXHCF7UQmbHzZhnO5m4lk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-3rBL3_5UPbCOfU_4DFeMXQ-1; Tue, 27 Sep 2022 08:48:13 -0400
X-MC-Unique: 3rBL3_5UPbCOfU_4DFeMXQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 qb16-20020a1709077e9000b007827e5f3e2dso3778431ejc.3
 for <qemu-arm@nongnu.org>; Tue, 27 Sep 2022 05:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6ch0jVZlnqry2hPnT/PWAtD5RRCFBYK9ePwmLiCa+Rk=;
 b=fYoeBQ4OS+zXHVLYhYjpEeYTT5Zfg9JICQwDLSJqJ/EcAaWFsbuUpO7ayYahiF7xSV
 NJsX4do+5mGHyFtvLBEv4X+L7cSbpfPpd5UcyfUs9YA2ADstPkpUMN5V6p4B8UBQWAPT
 ggLiJTepJf7MoH7ZhCSQALOfmiW/Gh1UdvZicexFDq5vyKnr+mInqvkkJOACmxQWCvMm
 rfDnzwHcJmn7zX6EYtwpG1slhQq7z1IeN1shdR+YajhsILHK338gV7E4t/xLPQQ6+ov5
 Q/TSZlc0tyFIbuO5r9QEqrjPYm4BuoTCeU9gCO8BnYrqSk0joIEG9NrmBxJpuxWQtA04
 lU2w==
X-Gm-Message-State: ACrzQf0X3beBFkqK69gQ+X9lDbDv0xNEL0zmS9//lIW0mgzEmS+wSvy2
 7AvQU1r6byv1592ya0BSTwc5VhMalUGn/xmDpweMaoHRNT75UqVRwO8plFLsF8lqOiSD7aOxHCs
 OQhADgJ/vdYip
X-Received: by 2002:aa7:c158:0:b0:457:1fb3:fd63 with SMTP id
 r24-20020aa7c158000000b004571fb3fd63mr14416378edp.263.1664282892248; 
 Tue, 27 Sep 2022 05:48:12 -0700 (PDT)
X-Received: by 2002:aa7:c158:0:b0:457:1fb3:fd63 with SMTP id
 r24-20020aa7c158000000b004571fb3fd63mr14416363edp.263.1664282892079; 
 Tue, 27 Sep 2022 05:48:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 la5-20020a170907780500b00781dbdb292asm749956ejc.155.2022.09.27.05.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 05:48:11 -0700 (PDT)
Message-ID: <06ff4ad0-a37a-f0e5-c3bf-9ec8f05c6368@redhat.com>
Date: Tue, 27 Sep 2022 14:48:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/8] hw/arm/virt: Use "msi-map" devicetree property for
 PCI
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-4-jean-philippe@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20220927100347.176606-4-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QHClgismDHJ/

Hi Jean,

On 9/27/22 12:03, Jean-Philippe Brucker wrote:
> The "msi-parent" property can be used on the PCI node when MSIs do not
> contain sideband data (device IDs) [1]. In QEMU, MSI transactions
> contain the requester ID, so the PCI node should use the "msi-map"
> property instead of "msi-parent". In our case the property describes an
> identity map between requester ID and sideband data.
> 
> This fixes a warning when passing the DTB generated by QEMU to dtc,
> following a recent change to the GICv3 node:
> 
>   Warning (msi_parent_property): /pcie@10000000:msi-parent: property size (4) too small for cell size 1
> 
> [1] linux/Documentation/devicetree/bindings/pci/pci-msi.txt
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Effectively matches example 1 in [1]

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  hw/arm/virt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ed6f1ac41e..8605f5058a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1489,8 +1489,8 @@ static void create_pcie(VirtMachineState *vms)
>      qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
>  
>      if (vms->msi_phandle) {
> -        qemu_fdt_setprop_cells(ms->fdt, nodename, "msi-parent",
> -                               vms->msi_phandle);
> +        qemu_fdt_setprop_cells(ms->fdt, nodename, "msi-map",
> +                               0, vms->msi_phandle, 0, 0x10000);
>      }
>  
>      qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",

