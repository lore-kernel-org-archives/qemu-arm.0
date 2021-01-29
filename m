Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp956720lfo;
        Fri, 29 Jan 2021 01:06:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwo6sXl2JOrBKdrG+aRLpgOQSx540qjcCUUmQsnSPSFPAofKTw1/MkumuHxP+Ac15ORCN29
X-Received: by 2002:a25:cfc8:: with SMTP id f191mr5146034ybg.114.1611911207077;
        Fri, 29 Jan 2021 01:06:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611911207; cv=none;
        d=google.com; s=arc-20160816;
        b=SfbHBIUw5Hl/FhN+LQ+B3y3t0uK3zYemJbR37ldLtYdTxUOqKmA4p8Zulay/mulwfu
         ieqv3s95IPv9K3lA/rK31wfBOiKkgQ6MvHtt419OeXZZy7DYOibbpHz3feiSl4FnsjZD
         cd2AeXuTRqiIK8vmLxw6nn30Y9km+7OQ8hyloNycNh6QK//wRn70Mfo/wocx1a1YWPHv
         tR1RcXaQ5imhs7f6r38CJGlJDzrCrLV3pO6dQZypbrm0uKUQVR1U/hPrSQB+5yQ4PLaD
         EPli33epnpg5xra7XlXUUtikgqiOljREsVYSwIBfycoi1+neXqYW9Dcr1CVlLNKFw0GP
         CgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=RtBlQT58W0uDWIb4j5BwpPSxycOBFXaS1asX9OSSYW0=;
        b=iOKyV3hRaGNg+OOG+FULGvvSoo6+Ddx+LkoFpZZO5n4jdCqK87PrINOT1HpsUHIu8v
         gcUaL71o+Yhif64SU2/LlS00eKSrI2wpbsijZrNlElU0ZmilyBEUjRPYHXR3E58zSXN5
         JybDVOEBsn9FazTNxdgLLSZwpOnIbzRK5e4YFo17dH47ESVOjPMnzpi8dWTf/frNDf6s
         1yB1zOVNFQuTyTLiD+QEaRjf+6SyRmXl3iZ7CB95CiPLKRCStjrvSl2st8oj+KjR1dJZ
         4ELZsg94Ew6AbBxUyG4vxMdTffOeymb6v0pQVJRHKdehrSnVjS3NP7v141ZWazlJONSJ
         sP6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PmIIiGy2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 23si9384763ybc.452.2021.01.29.01.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 01:06:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PmIIiGy2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Pjq-0006YU-Hg
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 04:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5Pjg-0006Wq-SC
 for qemu-arm@nongnu.org; Fri, 29 Jan 2021 04:06:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5Pjb-0008Im-KY
 for qemu-arm@nongnu.org; Fri, 29 Jan 2021 04:06:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611911190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RtBlQT58W0uDWIb4j5BwpPSxycOBFXaS1asX9OSSYW0=;
 b=PmIIiGy2xes1mUV6mG3CU35XoIkZxLWR2nbdZwmtwHVE6YNRELfUB4a++kl78S758UNJn3
 FmtXNg7zQD44teYBMusPGFRJAt/b4OBrXH3wDSiF3qDPHbZU4Z5/oQRFKXdE/T0+ekUkUE
 exkS1r7tnkjNAYGVDwxP9aN0b9YSyq0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-Cq8QPey3OvCkUp2rXva9hA-1; Fri, 29 Jan 2021 04:06:26 -0500
X-MC-Unique: Cq8QPey3OvCkUp2rXva9hA-1
Received: by mail-ej1-f70.google.com with SMTP id k3so3625071ejr.16
 for <qemu-arm@nongnu.org>; Fri, 29 Jan 2021 01:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RtBlQT58W0uDWIb4j5BwpPSxycOBFXaS1asX9OSSYW0=;
 b=mC4rrFZuEZ818/ZL8hFJ2FYvKKaqAW5xvrG4fk7g7j6VKWIj0xf7TpWlOt7ZK8sJR9
 f2Iqs/ojfHR5GRZGNCJ8UK7fr6Ws86top6IKcG+e+8A6Eh8QI1vHOBrWziqOyOMBXuiG
 HqmKBGS484M7O63tebeIK7E11Lq4rN/pseaAr1VDSJKzecPHzWQUghSYt4rTasPJFaP9
 nz1ZBncTc95rUd5E9Z/rpk+GJ7iz7KSR5HENAAYQcaJa0FU5UDKVRYTTaDL8X9MFSny8
 98Tx1Lym0z3LHq0A0Dj1yc9VjYUjAyRlw0SeBhFjd1WxmhNfBs0Mv9cIyLqZqVmBYZog
 JdRQ==
X-Gm-Message-State: AOAM531IjlEOIs7aPdKNprHvY3wTwCZ0XoRybWROO4BhbNrmipCp912I
 PWJpuE8CQAg3fxXv9j51E8gf/cuBkb00JS50ZWe+JiwRYqfOnw9d+XdfDXqASORSlvASumTCc5Q
 AN6fP9XCulv+/
X-Received: by 2002:a05:6402:424a:: with SMTP id
 g10mr3996108edb.236.1611911185225; 
 Fri, 29 Jan 2021 01:06:25 -0800 (PST)
X-Received: by 2002:a05:6402:424a:: with SMTP id
 g10mr3996087edb.236.1611911185049; 
 Fri, 29 Jan 2021 01:06:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x20sm3436607ejv.66.2021.01.29.01.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 01:06:24 -0800 (PST)
Subject: Re: [PATCH RFC 1/1] hw: Replace anti-social QOM type names
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210129081519.3848145-1-armbru@redhat.com>
 <20210129081519.3848145-2-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6d69c392-1c53-cc35-d504-0ada33ca37c5@redhat.com>
Date: Fri, 29 Jan 2021 10:06:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129081519.3848145-2-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 frederic.konrad@adacore.com, kraxel@redhat.com, jcd@tribudubois.net,
 qemu-block@nongnu.org, quintela@redhat.com, andrew.smirnov@gmail.com,
 marcel.apfelbaum@gmail.com, marcandre.lureau@redhat.com, atar4qemu@gmail.com,
 ehabkost@redhat.com, alistair@alistair23.me, dgilbert@redhat.com,
 chouteau@adacore.com, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 jsnow@redhat.com, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8DB1Re/ljDPZ

On 29/01/21 09:15, Markus Armbruster wrote:
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index 7fc547c62d..0dd158bf73 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -2547,7 +2547,7 @@ void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
>      DeviceState *dev;
>      FDCtrlSysBus *sys;
>  
> -    dev = qdev_new("SUNW,fdtwo");
> +    dev = qdev_new("SUNW-fdtwo");
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      sys = SYSBUS_FDC(dev);
>      sysbus_connect_irq(SYS_BUS_DEVICE(sys), 0, irq);


Missing:

         fdc_name = object_get_typename(OBJECT(fdc_dev));
         drive_suffix = !strcmp(fdc_name, "SUNW,fdtwo") ? "" : i ? "B" : 
"A";
         warn_report("warning: property %s.drive%s is deprecated",
                     fdc_name, drive_suffix);
         error_printf("Use -device floppy,unit=%d,drive=... instead.\n", i);

