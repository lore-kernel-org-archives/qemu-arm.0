Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4795345lfg;
        Tue, 16 Mar 2021 10:58:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb4OlXdpvi8H3Dj/9jz1PvZV1bXQCjxqN7geKaNjcNEfdYo4ZPRMmfalB+onWqC9tyX3MG
X-Received: by 2002:a05:620a:c0e:: with SMTP id l14mr222667qki.91.1615917500704;
        Tue, 16 Mar 2021 10:58:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615917500; cv=none;
        d=google.com; s=arc-20160816;
        b=Itwo131Otp4zt8L8I1PTLav66hwbMdZz0TpsqaFQh2a8ZnqRtm3hGBbCuIBVGuXcky
         dUFBE5QZCXY/0ln0yxXBqSAvVII8lfn1DzxCx/djLEzjGi+STLjEuvqqsaT3p/AT1W62
         M9JSNJx+87qrgmPqD5kXzEcmALLdRBZFAsvlFuhYdbo71dNTaLMqQNAvgewNt6Inlzf+
         OedMg6Vj6xdtPKxZgUFVLzhsMbb3IpZW0C6GgjIXR1uG95F/3DvKXOHUYi/pBnirxI6q
         ytW0LMX72CxKdKtsgefPsH/dYHET6dRBuisrkKr2m7DBN1sarL1bDoywamcx2YuiiJR3
         3vpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=d2vD2ARTUqUD/Uv5D4wVIDwsmqrOYGd+Kg9YVVV5G6g=;
        b=bwMd+Fc/XSfSj9xeOHKv9HFhZ8MRilzvfHA0iuzhOz0im2KGauSKYWjR7cbeQy/h/U
         vqyhdiGZsWiuqvDYOhMtn5n+XfLQD7Oc3saNp6oz+WjDCh2u8BMPMN4csg20kLrGfMXJ
         B6f96MIh+1oNthauQYoE9UCOp2ngipd+NoaTwqXnWRjuU0AgkejwUpD1x6wJ/OtNcLKh
         besaBnx7lQQOofX2IrjuxkJ54A4sMuSXY7Zck7VAQ4MnU7gjnsCmCm92z3sh9RHVwBzy
         fVILwDuhhW3kyIwcFiBAD6IVJ0dkOIvswWrlm2ZFkHn/EhDswZXWLAt5QtXe6owh3Okv
         rbGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KQV3DjKq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15si10769681qtw.326.2021.03.16.10.58.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 10:58:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KQV3DjKq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMDxT-0005jk-R7
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 13:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMDZo-0000c1-2d
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:33:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMDZJ-0005BV-QX
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615916001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d2vD2ARTUqUD/Uv5D4wVIDwsmqrOYGd+Kg9YVVV5G6g=;
 b=KQV3DjKqsS3oNbW0c77s+W1ci80vqd0pgLKsfmuO9V8HFFYdG6YdsBca7XGR2gKk8Zdepr
 2EiFG/++i8yg2MnEcOklryKyuu+mAD/W9NOKF5wBsVvxQonixB77YrZeGmtyy80rRXwcY8
 HdUXuYbb+T5/q/3fiYVF73NwvTN5n0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-48HAWTFMN3CTfPtTFznDGA-1; Tue, 16 Mar 2021 13:33:17 -0400
X-MC-Unique: 48HAWTFMN3CTfPtTFznDGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AB07802B7A;
 Tue, 16 Mar 2021 17:33:16 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 412675D747;
 Tue, 16 Mar 2021 17:33:12 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] tests/qtest: Do not restrict bios-tables-test to
 Aarch64 hosts anymore
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210316172449.3148634-1-philmd@redhat.com>
 <20210316172449.3148634-5-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7b705a91-60b9-a335-1a59-87e5fc689add@redhat.com>
Date: Tue, 16 Mar 2021 12:33:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316172449.3148634-5-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i4ps5uBSHB8/

On 3/16/21 12:24 PM, Philippe Mathieu-Daudé wrote:
> Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
> 32-bit Arm hosts") we can remove the comment / check added in
> commit ab6b6a77774 and directly run the bios-tables-test.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/meson.build | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 66ee9fbf450..82e92d33f82 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -173,14 +173,13 @@
>     'boot-serial-test',
>     'hexloader-test']
>  
> -# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
>  qtests_aarch64 = \
> -  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
>    ['arm-cpu-features',
>     'numa-test',
>     'boot-serial-test',
> +   'bios-tables-test',
>     'xlnx-can-test',
>     'migration-test']
>  
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

