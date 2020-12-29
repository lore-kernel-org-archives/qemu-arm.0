Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp11162296lfq;
        Tue, 29 Dec 2020 07:11:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVy1pWTFeAQpzSq1Yh4KymgtXtMj6vz0Vt9/d3UD3Yfkr4ajlfCMT9V1+aD5D7EGAe8ncv
X-Received: by 2002:a25:4153:: with SMTP id o80mr69650984yba.198.1609254686083;
        Tue, 29 Dec 2020 07:11:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609254686; cv=none;
        d=google.com; s=arc-20160816;
        b=Ek/fErs8MFY79mH6I0Qxy1n4u43pHJCdEtcWR/+nTAI9kdmQcXX0L8x5qPlwEn+pWF
         kLx8BBVqKlnpjg3oLRIZLbejvwKGUrvyoDKPUtZaDf0hH9Uvdy7DTQ6i+rVJWoL8WO5P
         z555A62FbHvMkqXlDxzdCGWZeRLjEqkz+Au7eFZFl8DAVN7kSFlVo/einePBXI5nPoob
         du+K7MTwcQoh+lXxucUon2KcGKhOAH2Ua/kQZy8OAlqVmQBkrIMcrCamRzQNyzbexkJM
         igI1pEVkPF4P2tH8ney3rLe/se8owv3b69ZkqnljLqYTO7dicPgmE7oGhIIPk1YbBQjt
         aSSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7SwhaOIlTkv9QP8a3UFA8Swo1TVOqoGRsxP6/lSEPEE=;
        b=jm4Pwypc/4t6NvsEBzLnTRUJr79cfHXch43Je+Js2N1FpsTZZ2/Nm89ABuOHreA5VZ
         W9t8huOTplg8ftxwC6MbnPzpmWDwtKNoUzCQtfg+i0rmuunSPHlYnwGLkcFW3oLGFznt
         MIKz0ppNbFqNRQ8hNKoGPS23awvD9F4eFaB3fQdHq5t0vmtbJUt3QR0PCO2BP90YfONv
         LNH9eXkEhpByAZSPzySWKeqybErbDqvZV2bAVC4RDTmUr9Bojq3hwrtEL2rBsnkDbzGJ
         hY3fHU2yNwfd9RtVDn+J59i95DGSZVfznCtnOl5481vxZiAxM0L6oRYAKoJ6HS3ZTqDY
         m7IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HstNvGUq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si35194206ybk.458.2020.12.29.07.11.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Dec 2020 07:11:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HstNvGUq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kuGej-0001m6-DQ
	for alex.bennee@linaro.org; Tue, 29 Dec 2020 10:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kuGeI-0001kT-GB
 for qemu-arm@nongnu.org; Tue, 29 Dec 2020 10:10:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kuGeF-0003h1-T0
 for qemu-arm@nongnu.org; Tue, 29 Dec 2020 10:10:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609254652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SwhaOIlTkv9QP8a3UFA8Swo1TVOqoGRsxP6/lSEPEE=;
 b=HstNvGUqs22V3rOBsJYGaiIauKOY5Zf1Ez8i/su2Ns5fbpo6NV+Eq9NDYXrB8UDu0wGzX8
 wIYF/9X2ENYtXeU2ILSfv6enzfkuw9gmEF8dS/GpQSLMVc3DQLR3oI5yZ6JiJv39fqQjF1
 XoIXgx1aMF1RrY1OD+q/LO1JzsfGskw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-u4dbXzCDN1eKDyzXsSyvIg-1; Tue, 29 Dec 2020 10:10:50 -0500
X-MC-Unique: u4dbXzCDN1eKDyzXsSyvIg-1
Received: by mail-wm1-f70.google.com with SMTP id f187so1359047wme.3
 for <qemu-arm@nongnu.org>; Tue, 29 Dec 2020 07:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7SwhaOIlTkv9QP8a3UFA8Swo1TVOqoGRsxP6/lSEPEE=;
 b=POI8xz+7Xxz1SMojz49BgvZLpha0Z+s1Xwp+MKIwkSLrHWSme4S+u+AUFkkxaKFt3m
 SAEfF+A9gwQUG1IhQUV4KNaiAI7YneuAfu9r0u0tIErbNwpqxaitsbpOewZVj6HH0Y0L
 fO2p5A3u33IZo5LrR3Cj4jJja7+BWaatl9ha8JkvMD1VON0NJ1vKIcoeKJNmkXgcDzus
 dwdbvAD8jGI2/tazbdGEXhxzSfQ1BanInFElrUvKW222Jrs2RyIa6/2dTjOOBAAV5Wpx
 a9zRmmhPfk6O/+luXHt6srh4ZEhdfVO6NzN8HzI7Yjft6IvfgUvhTWWd5ocoh/gU8Iah
 69sw==
X-Gm-Message-State: AOAM533aMoVz7JLmPg7AyF89Sd3DPAqeEV0tsk/WgF1XocAYNhyURaLu
 ceW+xZz3s4I1HEWKI0WRcG1yNcmiKQ5qosUM9q8aXf6wNdS4v1z+34lHJuNEyUN032X+qG1INzX
 +dEsGwpIvp5tq
X-Received: by 2002:a1c:3987:: with SMTP id g129mr3813595wma.86.1609254649404; 
 Tue, 29 Dec 2020 07:10:49 -0800 (PST)
X-Received: by 2002:a1c:3987:: with SMTP id g129mr3813569wma.86.1609254649090; 
 Tue, 29 Dec 2020 07:10:49 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id b12sm5224778wmj.2.2020.12.29.07.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Dec 2020 07:10:48 -0800 (PST)
Subject: Re: [PATCH v2 0/3] pc: Support configuration of SMBIOS entry point
 type
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20201214205029.2991222-1-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <328375f8-772f-c2b7-38d9-8b8dfe0e33b1@redhat.com>
Date: Tue, 29 Dec 2020 16:10:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214205029.2991222-1-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.07, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S1KFSv7IbSYg

On 12/14/20 9:50 PM, Eduardo Habkost wrote:
> This includes code previously submitted[1] by Daniel P. Berrangé
> to add a "smbios-ep" machine property on PC.
> 
> SMBIOS 3.0 is necessary to support more than ~720 VCPUs, as a
> large number of VCPUs can easily hit the table size limit of
> SMBIOS 2.1 entry points.
> 
> [1] https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@redhat.com
>     https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@redhat.com
> 
> Daniel P. Berrangé (1):
>   hw/i386: expose a "smbios-ep" PC machine property
> 
> Eduardo Habkost (2):
>   smbios: Rename SMBIOS_ENTRY_POINT_* enums
>   hw/smbios: Use qapi for SmbiosEntryPointType
> 
>  qapi/qapi-schema.json        |  1 +
>  qapi/smbios.json             | 11 +++++++++++
>  include/hw/firmware/smbios.h | 10 ++--------
>  include/hw/i386/pc.h         |  3 +++
>  hw/arm/virt.c                |  2 +-
>  hw/i386/pc.c                 | 26 ++++++++++++++++++++++++++
>  hw/i386/pc_piix.c            |  2 +-
>  hw/i386/pc_q35.c             |  2 +-
>  hw/smbios/smbios.c           |  8 ++++----
>  qapi/meson.build             |  1 +
>  10 files changed, 51 insertions(+), 15 deletions(-)
>  create mode 100644 qapi/smbios.json

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

