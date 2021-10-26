Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp1549725lfn;
        Tue, 26 Oct 2021 08:21:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7NXEE+d0JWqnHSYQd60MFhZQ1MYGp+XtzyuSEvvDhi2S8XCekn8PGei2fdwODOFHe3eOY
X-Received: by 2002:a1f:7c4b:: with SMTP id x72mr11635531vkc.3.1635261673756;
        Tue, 26 Oct 2021 08:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635261673; cv=none;
        d=google.com; s=arc-20160816;
        b=ToDxdfoBB7RtGbuhQ58lliUVcnwmKPUh3znZhiaTxlzrl4nGZjgYJpzhot9SAPRPuN
         ORXG0AZa2i8+Ca9pJDKM7SLJ35LGTAGQtNOSm2sAtiLFzUkcAL2FKiCDiOMd2TxEim9c
         Mk2iwdLu2hcHrdUyT+H3agjtypdTHX5JW/99SuNrhn3aouYjY0c2VKsbGVBWMr6ntWGB
         7VnP3eECYTe5VsdE620J9G0ohGZiHHO0Na0e+8VJFrjvYONvOauDJ9TNKd7c+6QwqY9G
         ZaBegkDF039esP1GAXgM/BRcJwD9MCSzNvjrHjyjA/HFqLtjYaOy35Wm0pE6QvAHpTLf
         yQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=V/T4sM39EPDWhLh7FV6n0mdxypeW5kyL6rY0c+a8oZs=;
        b=D01QuZKumo2KM7pf19WwRPbQ+9DDx7hETscUJso0XLAnmINDa+nuJ71v4qt5wlrGL4
         crQLn+km1j1cQiyNY8g4gFMb8MU/O2rMDlwNeXGNe0HqfT8LzI5Ocnc96jCk3hMBq+PB
         7Us9h8a+MjsudFFeSs64/pIRaxkRxJF2Y/gBuMIVQlkf7QYflxJVVv9u66hYWNxnd+HN
         lP5PJWYrs32EFv2lEH/HoHRtFokjAQ3xqZe8QF6AoycyM3zXw3gxkzPpxLL1rjHCQJhC
         ST1sw08Jo6m3fwBhLfg5MMBinVvE3Yag3LvdZitlpSxwo7Y4i8ekRr1MT7fGyfZSXBbB
         Z4Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HOKziOBh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si233133uam.125.2021.10.26.08.21.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Oct 2021 08:21:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HOKziOBh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mfOGB-0006Rm-KN
	for alex.bennee@linaro.org; Tue, 26 Oct 2021 11:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfO9a-00067e-Ar
 for qemu-arm@nongnu.org; Tue, 26 Oct 2021 11:14:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfO9Y-0003Yx-JZ
 for qemu-arm@nongnu.org; Tue, 26 Oct 2021 11:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635261256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/T4sM39EPDWhLh7FV6n0mdxypeW5kyL6rY0c+a8oZs=;
 b=HOKziOBhUuU5msMBHwygx1ltpAiCPePnMgn9GX6tb9Y8++N59T3A+aRlJTYaiCEwW7p+Ct
 /Z04EvPBY8z1MAu+Z77KKdFWov/e5Gp48QFJhiJywOnn0bRcIbsXhPa5w1z0jx3Ik4VieS
 dyLI/SOpJS3u+cqo+dHNTAwcF8fvrdg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-oyqBtYHAP6SaDU4vKTe__Q-1; Tue, 26 Oct 2021 11:14:14 -0400
X-MC-Unique: oyqBtYHAP6SaDU4vKTe__Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 c128-20020a1c9a86000000b0032cbafd99a2so1075325wme.1
 for <qemu-arm@nongnu.org>; Tue, 26 Oct 2021 08:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V/T4sM39EPDWhLh7FV6n0mdxypeW5kyL6rY0c+a8oZs=;
 b=oR+q2LyfGHj2EhGR2Y8n6Lo8t17Z7NA5SnVJk3wU+g1B1dx5jdBm8+kMzGn/a5SVS9
 HJ5iSjFvGDadPG6+973yRtDrw1JEvEogwxxOQcmSqp394NLIhpdd2gNAwYziLVGocgHh
 aQmeIUfn0V0bU2oAcBxBxC97m2rZ7WQhrta3pMiQdqK2TD3MFzUPHbAhXr/EtkBG2sF+
 FYQsdYaNrPRQS65+C9iB9v9Gh7MhN/Apecjn2J5+a+UP1H5VHIHsHXjB29CwSrKn7MPf
 MCr6CuNW10pLQEzNEy1pTkIrJ6I8KnWJYOhCiAukhAwBa6ENUdtfVag7OWSko0TNhf8U
 GFiQ==
X-Gm-Message-State: AOAM5331dNl1rT1Lkq8pFfLXJNMaSN9Am5WPpgPOULNbT5HkpDFVC0AS
 RLCoA3YTyx9WefiW/gtODYLSwwnDYY8UUyBs3wjA09yVxTuHKtFABRNTI5GFa5j8+sZEyv1Iszu
 RVVLPFhXytlpy
X-Received: by 2002:a5d:59a3:: with SMTP id p3mr32817062wrr.146.1635261252286; 
 Tue, 26 Oct 2021 08:14:12 -0700 (PDT)
X-Received: by 2002:a5d:59a3:: with SMTP id p3mr32816837wrr.146.1635261250307; 
 Tue, 26 Oct 2021 08:14:10 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o194sm985304wme.40.2021.10.26.08.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 08:14:09 -0700 (PDT)
Message-ID: <6fc89222-c836-a52b-2d67-fd8a8b175e58@redhat.com>
Date: Tue, 26 Oct 2021 17:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/3] hw/smbios: Use qapi for SmbiosEntryPointType
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20211026151100.1691925-1-ehabkost@redhat.com>
 <20211026151100.1691925-3-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211026151100.1691925-3-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: kmY08jIcjQUS

On 10/26/21 17:10, Eduardo Habkost wrote:
> This prepares for exposing the SMBIOS entry point type as a
> machine property on x86.
> 
> Based on a patch from Daniel P. Berrangé.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> First version of this code was submitted at:
> https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@redhat.com
> 
> Changes from v2:
> * Rename "2_0"/"3_1" to "32"/"64", to
>   make the names more QAPI-friendly (as underscores and dots are
>   not allowed by QAPI)
> * Move definition from smbios.json back to machine.json
>   (no need for a separate file just for one enum)
> 
> Changes from v1:
> * Patch was split in two
> * Moved definition to smbios.json
> ---
>  include/hw/firmware/smbios.h | 10 ++--------
>  qapi/machine.json            | 12 ++++++++++++
>  2 files changed, 14 insertions(+), 8 deletions(-)

> +##
> +# @SmbiosEntryPointType:
> +#
> +# @32: SMBIOS version 2.1 (32-bit) Entry Point
> +#
> +# @64: SMBIOS version 3.0 (64-bit) Entry Point
> +#
> +# Since: 6.1

6.2, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +##
> +{ 'enum': 'SmbiosEntryPointType',
> +  'data': [ '32', '64' ] }
> 

