Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp623674lfr;
        Fri, 16 Apr 2021 11:21:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhgfITqggWwudqKOlkLkKGtAAes540IrLCsJf8yf+MMike8Ka91og9Ohvrqc7wVeTl1cF7
X-Received: by 2002:a05:6e02:20c1:: with SMTP id 1mr7632502ilq.71.1618597317316;
        Fri, 16 Apr 2021 11:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618597317; cv=none;
        d=google.com; s=arc-20160816;
        b=LkQZ081eTRw/miTivI0A/fgTwn438E2KFB+3AabIZ2aYA8FDC7RAju79FSzuS4rRWM
         hcCV0UcTlznqR9OiVNraq2Xh0LgQILPvWNFkwAHMCkipZ/zFkifAfPhk1sQEAgmr+bAj
         tzeEi02GilQqZcNjJEybl0OU7ctUtzY806QyaAILL5CpbMeIce767BRP1ro2eYph6xqD
         zlR36KewajQL3lC6o6XSlvqBkN06jpAOSV/XZ6PJiBPQeUrZLPvUBg8wPJAu+7aJAgEq
         ODs5Kjuh8VLfoqzi/1J2lFnTtqRFxRqIMAevUyFKoHd+ZYdbSGiUJ29f54/9VRj9m8Hb
         nWrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kbjAAgh/O7uS0t6LIBClWt5kutACPgzKUh1V9S6VQUo=;
        b=n7GMuIPClwUjA1lPmzsH0olGcCRYx9KbK7q+abOQfW4puaUuhl/hLZeOqVMA5tKmCJ
         c/Al+bjeh4xZUHYXI90/EQiPBnX5zN2tEcKUKaOTHveZfPM5rxHrqppNkieiLadWsg99
         rw2QCMK7D53wx9vzU/7V5nYQTEWx0/ROVLN+UsmbR+xJxFMBrlOX/3Rv06g4c9ijozTL
         OBPxzp2q6gvi3HpVO6G+4DPi3oFVfqFixtDNpre1cAO7Je55ulr0kBxP4UmyJ3MxLsLX
         FPmKap2CGzf5k0CoYoi6zy9cnVMZwCOR/WnypdWzJdDrzSaJHLhymrfVOxOmVo3jsqLV
         W2IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S6NOCMBb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si6507301iog.76.2021.04.16.11.21.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 11:21:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S6NOCMBb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXT6K-00065l-Mb
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 14:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXT5g-0005eG-PH
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 14:21:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXT5d-0005qU-Lb
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 14:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618597271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbjAAgh/O7uS0t6LIBClWt5kutACPgzKUh1V9S6VQUo=;
 b=S6NOCMBb+dUofCVonTaTp2HZs/p3mK59voA9kRMlhIn19/8/+6lA3fHNF/T9X1UQ025/Lt
 DhGs5Qd3xNcAZw4YZc+nkDyVfyitspD9Uq7FzaImyS/eD1YTzuEQ6PWVLzCuoM5M6pgu2u
 8xfGtTwRMpbTOo0kIuDQs5ddGLdTBZA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-NDZUuJlXMfedrTd7VxqTpg-1; Fri, 16 Apr 2021 14:21:10 -0400
X-MC-Unique: NDZUuJlXMfedrTd7VxqTpg-1
Received: by mail-wr1-f70.google.com with SMTP id
 65-20020adf94c70000b0290106f90d4e1bso559732wrr.0
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 11:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kbjAAgh/O7uS0t6LIBClWt5kutACPgzKUh1V9S6VQUo=;
 b=JHoe0+uPnn36ZpoUv5nOFjARzpifykOLVbGXqmK6qq3py9mWVGELJR9n7Uj2zDyziX
 tpj+Lg5ijouY2un/aN40iDOtXU4wCm065zwWHAutCC4svya7ctKWq/vT+IMpMyVVZyZ3
 dAITmopv4ziRqXglFG7gT5uhfsOE+L1HN30mjtYl8XkZBYJyYG1qNiu1WsYhUSFzQAZx
 yTHjzGPa1EkkRzfXfIpN1j8a2clZxIOcsPvx0cbCw0NOjTRpG1SmF9aNczsWfb3BoU5Z
 j8FdJULkKQEsvtpTmOJYbbzr77KszsqUCPA6tnvqkJ73i1mLCMhg88xGPTIwmdeFqI4q
 8MdA==
X-Gm-Message-State: AOAM533XCza2P3k0UYSmrzSzs5qZsnuxGUkRXoNm6f7IQruNfdkCFqNL
 mSOt8ct2niburhJfsxr6CiPzNTg+P7sp+3LmhnbO9laZK/icyh9THOnK18beC40dl8Y7GFMTVo0
 KWR3wVkOLSMIA
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr498272wrq.95.1618597268882;
 Fri, 16 Apr 2021 11:21:08 -0700 (PDT)
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr498254wrq.95.1618597268728;
 Fri, 16 Apr 2021 11:21:08 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d133sm10124703wmf.9.2021.04.16.11.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 11:21:08 -0700 (PDT)
Subject: Re: [PATCH v4 01/12] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM
 TCG CPUs section
To: qemu-devel@nongnu.org
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-2-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2151d1c6-95f0-e982-1126-4e9cbbd4d7a3@redhat.com>
Date: Fri, 16 Apr 2021 20:21:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415163304.4120052-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pU/6V904N1p1

On 4/15/21 6:32 PM, Philippe Mathieu-Daudé wrote:
> We want the ARM maintainers and the qemu-arm@ list to be
> notified when this file is modified. Add an entry to the
> 'ARM TCG CPUs' section in the MAINTAINERS file.
> 

Forgot to include:
Acked-by: Andrew Jones <drjones@redhat.com>

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36055f14c59..d5df4ba7891 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -156,6 +156,7 @@ S: Maintained
>  F: target/arm/
>  F: tests/tcg/arm/
>  F: tests/tcg/aarch64/
> +F: tests/qtest/arm-cpu-features.c
>  F: hw/arm/
>  F: hw/cpu/a*mpcore.c
>  F: include/hw/cpu/a*mpcore.h
> 

