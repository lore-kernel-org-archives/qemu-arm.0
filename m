Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp3129634lfv;
        Tue, 2 Nov 2021 01:51:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2FKS0X9HymUhs9vjxre/a4gttg+fjgdRcJ3/cc02or3oRWVle6uctZbkLUHCQwtW2gfbD
X-Received: by 2002:a54:4e8f:: with SMTP id c15mr3722571oiy.113.1635843113904;
        Tue, 02 Nov 2021 01:51:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635843113; cv=none;
        d=google.com; s=arc-20160816;
        b=ZIJFzh140N1XNaeanv+RzNsEBd0j5wM3bfcwVv6qgOMcCCSXz29XJnGZr22Oky2Xxl
         s/Hpf4Q3xJGA63q0x6mqKcmY1zNHqljqu37zSouzx3458wHKEYNyRhAvD1tOAc76H/H2
         yDskvZXavwk3EwnfkGKDoxPMbbQr3gugIV3AmeJPKgN+t/G0o3CaMB9efvy0ICVj1Sjg
         68NEnZ08ZA9rGjkqE/C/JgBoysfBDcUr7PnMh97sswIrbTB+RMOIeXFCySBjC4zLRMw9
         jG/kyWJiYF0tzAARiIkozi2gGVhdr1ppEPZSGnIY38FspoUP2BEmhfbf/QUXEcNpIHHi
         GTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=afah4Ab44XJ6B4B4iF3m/NWFaAdep8PKu87Jt5uo7eI=;
        b=B0Jk+pBhz0Dg0EtXUESHFk9lGE0miE4q6+G/00lDJv/fOizfSAe46+5slk8KmZvifO
         5z33jz0Be5qkENo9bkKG//n9SICsalzEp9oyu3ZYWMMVFWmhXxYrkPdNeYoqG89KE/6g
         lVax13zuic5d0LBZkGuikEQczM2l6c0mKcIAhTyfidCZUotxfSuQkYXYjLkdnDso7dPW
         UWfIyhDgXpKEGj1PwZq3dEgExHfw5HpWIOhBEXELRiA2/jPHpgV5XTGaQv99P5xZOeMJ
         Jf6tNdzbwHJW3GXX8i8zAmgxZtLToTbQD2tbLBdLcs3HYMk23lXlhO+Cg83bxlyMUa4z
         JF8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U6oGEwtt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12si1176694otu.44.2021.11.02.01.51.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 01:51:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U6oGEwtt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhpWL-00048O-6V
	for alex.bennee@linaro.org; Tue, 02 Nov 2021 04:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhpWA-00047M-MK
 for qemu-arm@nongnu.org; Tue, 02 Nov 2021 04:51:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhpW8-0000KQ-Bz
 for qemu-arm@nongnu.org; Tue, 02 Nov 2021 04:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635843099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afah4Ab44XJ6B4B4iF3m/NWFaAdep8PKu87Jt5uo7eI=;
 b=U6oGEwttcHxSpEGOKh+kPYo2Vdp+yDbYK0C/cOhwy7fNyqs912pIt/ep13AQT6cAvOhGrP
 VCidEwZ5aXOMINjKxJ71umJJhFVaLV0meVrBzAjwfi/tcchYR/cog9mWJJarDJTJb25HAr
 EjEHLLwqnS1anFQx4SLsPKpPRTBMFC8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-cMNfRBw2NsWaS2teu5trEA-1; Tue, 02 Nov 2021 04:51:38 -0400
X-MC-Unique: cMNfRBw2NsWaS2teu5trEA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso581588wms.1
 for <qemu-arm@nongnu.org>; Tue, 02 Nov 2021 01:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=afah4Ab44XJ6B4B4iF3m/NWFaAdep8PKu87Jt5uo7eI=;
 b=i+clsxyu6tLMqbz0s+OusItYHfnHmKCgYsA0bdNqFywXXX4H6LZ8tIe8QHgBFP5nmL
 1J3aLLYPZnqmzcSoBhK7VXSG9psx75+p6eRIz3pNxNaV8eIrB6Ah0AxJgSn4gS6ECIka
 7mrCG8SdsL7w2fzjnFlZUUh2BAYZxSIBi2D/436Z8IGthCDDWayOny9oH3OaNH/p/Ycm
 ZhZGf4WuaxrFBNfAADLXgOVdqrYvArc/d7SnlEkFxOBF1mWgedCN4B++4Mlc5jNiW6Gu
 E5/WK+DlumkKiHDzN/zFBLpmH6Np/A/82vQOtSEjaGkYHhr9H2ZCJ6L3O7GrSkUXffz0
 FYww==
X-Gm-Message-State: AOAM530nU5gpkB9lL3kNdAZYUKuAoN/RUBABmNsZcT4I9Xah3vt7vPrA
 Nq6lKxhBU1OTak0SHhGVD0nppzLx8+GX6QBoUUAM5kbPOmezI8QyoxJz+TiKgwU9/K/uD2L2TBq
 g3eV8519YXX9F
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr5387042wmc.9.1635843097368;
 Tue, 02 Nov 2021 01:51:37 -0700 (PDT)
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr5387017wmc.9.1635843097185;
 Tue, 02 Nov 2021 01:51:37 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x1sm1750961wmc.22.2021.11.02.01.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 01:51:36 -0700 (PDT)
Message-ID: <a2618cf2-a2a6-53f6-a7f0-8bb3a72d32e9@redhat.com>
Date: Tue, 2 Nov 2021 09:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 3/3] hw/i386: expose a "smbios-entry-point-type" PC
 machine property
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20211026151100.1691925-1-ehabkost@redhat.com>
 <20211026151100.1691925-4-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211026151100.1691925-4-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NKxfd3MvX80d

On 10/26/21 17:11, Eduardo Habkost wrote:
> The i440fx and Q35 machine types are both hardcoded to use the
> legacy SMBIOS 2.1 (32-bit) entry point. This is a sensible
> conservative choice because SeaBIOS only supports SMBIOS 2.1
> 
> EDK2, however, can also support SMBIOS 3.0 (64-bit) entry points,
> and QEMU already uses this on the ARM virt machine type.
> 
> This adds a property to allow the choice of SMBIOS entry point
> versions For example to opt in to 64-bit SMBIOS entry point:
> 
>    $QEMU -machine q35,smbios-entry-point-type=64

It would be nice to have a test for this...

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Based on a patch submitted by Daniel Berrangé.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> This is patch was previously submitted at:
> https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@redhat.com
> 
> Changes from v2:
> * Rename "smbios-ep" to "smbios-entry-point-type"
> 
> Changes from v1:
> * Include qapi-visit-smbios.h instead of qapi-visit-machine.h
> * Commit message fix: s/smbios_ep/smbios-ep/
> ---
>  include/hw/i386/pc.h |  4 ++++
>  hw/i386/pc.c         | 26 ++++++++++++++++++++++++++
>  hw/i386/pc_piix.c    |  2 +-
>  hw/i386/pc_q35.c     |  2 +-
>  4 files changed, 32 insertions(+), 2 deletions(-)

