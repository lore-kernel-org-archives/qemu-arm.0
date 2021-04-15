Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp494341lfr;
        Thu, 15 Apr 2021 05:50:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZIMzERdjoHDDBxCkUBe9B/aNCoctnMC8nBEni4wD6OMGyl3/0qfsN33NNZPiZLaOLbw+H
X-Received: by 2002:a9f:262c:: with SMTP id 41mr1628725uag.4.1618491030222;
        Thu, 15 Apr 2021 05:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618491030; cv=none;
        d=google.com; s=arc-20160816;
        b=HweSSt2vKG/W1RDeh4NW1QNJa646ZDGcdT9dbVrxRfSgLycjBw8c8jiUJUwXC5Djo5
         bEfwhzrfcrYDSIt31rPCtPzrlTnDA0E1Z/N+z5Qe1GN3zt9Q79m3VsNA+4HVUv75NdlL
         mNT4rA9xfyW9pDaGHlzX7WzSNRBujq9tcUFaZbr5qU4QoAM+jMHOqzweMhPatEQlNJxV
         KZ6b4Yb78yzKgEP0IRutNm5/OYh6tmLVMLURtQf2Ald/3e4J/xgjVNliBZETWMlduMmt
         +lnOnw9FqbBcNWtgZfigDbCKEf+3jtj1fC6v69Z7vvEAEcewlpXZQsquDa7lSE8L3WFW
         jG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qB2XOU8KMbuTGMu04OWSLncll7I/PkIw5fsKwWPgarQ=;
        b=GH2XhAJ6B5yRVWqEG3I7nnu2GeStUSnuZptfiDpVUI282i8msjYMfN4hbze1vZz8+i
         WciGy6DzaFrhWD8vDPiqf0hIMY2DqIJvGRwiKwqh/bdprnQoti+wWftB0C3z5PE9MbqA
         lmrGEt2nOBo6ZjFG+pusKtJIoBgn32OcuvQ6rrHQ9yCLveieoVIfBjV/aakO+F02vHkP
         +QEshsLffrTVNDWyTDnGBeEXVxAUomKZJjaLK8otp0FbbcmiWi3bYydLWXnfOv33o8iA
         ow28kW33UonI0yeDLc0YTAF+PBnmEjbmOSOJcJoSpaefG9zfFykALbDjHREgfqNsM/IM
         LcrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hjxApdYZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x26si800546vsj.228.2021.04.15.05.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 05:50:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hjxApdYZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX1S1-00065h-G7
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 08:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1Ri-00065S-Pe
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 08:50:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1Rf-0001mp-BL
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 08:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618491005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qB2XOU8KMbuTGMu04OWSLncll7I/PkIw5fsKwWPgarQ=;
 b=hjxApdYZ1JBEww1X0LnIOYZrjM2I2vE1cCnV37207qkUQxKgFEy6WSNaoTn13pEdDhgAE/
 QRi1ya9UI5VOnHz5yk2ZhWk0zlieidGGZq+T9hp1KTfCRZ5PrRdwpWjgXIjJvJf0P8u5Lx
 P/HmlxOzrAjlSfhmWUKqeIHwOktvcZA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-5kwRvcXxOkC6H0RtrPz68g-1; Thu, 15 Apr 2021 08:50:04 -0400
X-MC-Unique: 5kwRvcXxOkC6H0RtrPz68g-1
Received: by mail-wm1-f71.google.com with SMTP id
 o18-20020a1ca5120000b02901333a56d46eso17384wme.8
 for <qemu-arm@nongnu.org>; Thu, 15 Apr 2021 05:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qB2XOU8KMbuTGMu04OWSLncll7I/PkIw5fsKwWPgarQ=;
 b=h+yy0DrCzXReB8pZ7+WS6IRzGZVXitQQ+zo8U8riChsDVqWW0Hnf6y9eJqmJ1BlYV0
 KwoB94lqGd2/ljeAvOztHNqRilUznIVpdF6a2DBZpLJCQtnDLNgbKHVGnOpzENWRa9XD
 IEQ5AAH04zq2BHRmzhO+GP2+v1LnV2IE06WZ8pceE+Uta2OitwGROFnPuZ/AF/I2/H9O
 GlqtbKxq5ZYNrljUoT9EHuBKSt4Zl1/9te6pMjDTbujnKvbYa9ya0O6hFcJ/jldII8kQ
 z2a5YQHrV4/WTvVNO3O6lqTGh+y5CYbbuelzESYmyHGNZhAVGewMFfBtsJQo8Vj6PRTB
 Ir9w==
X-Gm-Message-State: AOAM530Ca7iugJNDa2Djs2Nm97lkztqpI6saHJFkz7Twx3yVBGgzmRXo
 X1O2TBy90dqnnEBMWyLUDe+Z/rxlJsNjPrbdaPUkY1habUZVuq+PgFMiWfx3KHbCLF6X1vhvBxG
 qp3GKYJhY/WVh
X-Received: by 2002:a1c:1f8e:: with SMTP id f136mr3040008wmf.17.1618491003211; 
 Thu, 15 Apr 2021 05:50:03 -0700 (PDT)
X-Received: by 2002:a1c:1f8e:: with SMTP id f136mr3039982wmf.17.1618491003041; 
 Thu, 15 Apr 2021 05:50:03 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id k7sm2959507wrw.64.2021.04.15.05.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 05:50:02 -0700 (PDT)
Subject: Re: [PATCH v3 0/6] qtests: Check accelerator available at runtime via
 QMP 'query-accels'
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20210415122633.4054644-1-philmd@redhat.com>
 <7be73164-ab1f-f4c7-f80c-3305a71761a9@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ed318c8b-b051-755d-35dc-5d64816f2be6@redhat.com>
Date: Thu, 15 Apr 2021 14:50:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7be73164-ab1f-f4c7-f80c-3305a71761a9@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: czy1zhwaPp5n

On 4/15/21 2:30 PM, Claudio Fontana wrote:
> Hi Philippe,
> 
> does the tests/qtest/arm-cpu-features.c kvm_enabled() function need to be replaced by the use of this new command?
> 
> Maybe something to add to the series?
> 
> The use of "kvm_enabled()" in this function is particularly confused, because it matches the sysemu/kvm.h function name with completely different meaning.

Great idea, thanks!

> 
> Ciao,
> 
> CLaudio

