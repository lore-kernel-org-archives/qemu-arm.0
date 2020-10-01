Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp294133lfq;
        Thu, 1 Oct 2020 00:39:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDiXEZ+OtvRY1C+EtNfZaIdFUPzThP3SP+xksgKWwsd9UrRr9upUlZMgtmrOLAAokQVdX1
X-Received: by 2002:aa7:dc16:: with SMTP id b22mr6740429edu.252.1601537949042;
        Thu, 01 Oct 2020 00:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601537949; cv=none;
        d=google.com; s=arc-20160816;
        b=s1utFH3r6WBXG7Lp9CPiUYj3TX34nEV0QRXNU4MFHeWpq1Izv3KYkBVfsmkXgvdurF
         s9+gIIZ+z0jgI5XpV2HEEZ5k2AVx6g9wytMvwC3jJNEvpceUWxeY8rKiGnhHP+WS6gA0
         8XNbL53p60eIc7FpbPnXcu7fkL431Ol/wyCY9SpguEO7jKIAUzmqHN5zjXB11SOAbI2L
         oMJyh+FE7D+bl1BcQCqXvNBJwP2B+ZWyGUrvqaARnuNr4hyLbETexjPZqA+ABvLXa6SE
         76VZ3pgwRi2ph9miK3fk0/nH9cK/GW0N2RURNZkD5KVzhDug1rZXha2TkHpukE/DhEGC
         iWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=QIWTzCXKkMg/CKhfRHWpTjVDVAjxRLdwdegBES+XJQ8=;
        b=C1dC8vNkgWU4FRRPW49EpKdrQvcIvcESwTdVLxXIYF/DMiKTprcTOU0z9kS7YfyryG
         r2kEInEzCrNPX1maga6pF/HrR1bK7ZlK8sfNCBmhzVbLkvBbZ+UBg+oj4TLTEeajCvLW
         mlTrdk5fC6HASfwK83sj5S1gAqaLiCLu70SzyUcJDnQt+hXlbwvpS0gk+DcdlINDou0I
         i5/q0mZAvm+mqZV0VkUodutopzSaYXppKOcluweuGWsnLm/D0t3w24bEaojwE7avUcSy
         jNA25OmtydIlNc2HHkun0Sh3Nf62sxxLJ4vvN2G2W9eDKTCCjnKFIvwdJbSB0zYsldDi
         kWGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=glws4Js1;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id yj16si3325100ejb.751.2020.10.01.00.39.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Oct 2020 00:39:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=glws4Js1;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601537948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QIWTzCXKkMg/CKhfRHWpTjVDVAjxRLdwdegBES+XJQ8=;
	b=glws4Js18WlmGR57CBw2VZ/R8QVtbeAJ7jujXOwDrFsSYT0aBa44Q/5JFguueYVk9EjE2y
	y4/mAAHmFVQP8JiGoGQPJ7IfZpxNG2bsF95/XBHPRFP7VhXmikKUIIRHXA8o6+qPw38Z8u
	BZoid/PATxJ107CwndtCTUKGa0gBe+U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-ubz-ci21N6GH_1NjcAwqGQ-1; Thu, 01 Oct 2020 03:39:03 -0400
X-MC-Unique: ubz-ci21N6GH_1NjcAwqGQ-1
Received: by mail-wm1-f70.google.com with SMTP id f2so5981wml.6
        for <alex.bennee@linaro.org>; Thu, 01 Oct 2020 00:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QIWTzCXKkMg/CKhfRHWpTjVDVAjxRLdwdegBES+XJQ8=;
        b=Uc3QgxV3bYhoj/81KzK0rwKRUTMIziogejcTedSyfc+fC32VclttiNr0o+EbyBHspb
         365J1dTuI+RhaatnHK7iqGYU/mKIy5eQV8klZeCX0+95LHoV6fyUezo27TDV0lrUqD2K
         ojTBRDFizUe83ZJ92h+qypjleFi66oZwQAKAT7BV6sgKXWR2I08JkbpQif887Z7GlBui
         qhaSz27EvaQqDX8+zps2PpaKZdg89jW6LjCzdXJE+goH7UM/OsVIO8isYsW1EGPGSnSs
         zRfECnFouvAaTFH0EK/TFJk2i01pcSP33btJtDBdjpSoGEnxqqFJRva14fPyWpIiRTDu
         dzwA==
X-Gm-Message-State: AOAM532cUioL5NzR1XjsLx02+WCmS/pH4hFYYGkSQEGBe1L5aRlSEKuA
	6rOkz9eUHiIZ/eIA8k/kZwx1r4tcPqC1G+FW8/4xannJWHWGDk608m6X2yWcioshQ7gBOFMjH8v
	60bTICZ0G6wSwPR7A
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr6713959wmf.37.1601537942343;
        Thu, 01 Oct 2020 00:39:02 -0700 (PDT)
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr6713941wmf.37.1601537942116;
        Thu, 01 Oct 2020 00:39:02 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:aecc:db56:dd3f:503b? ([2001:b07:6468:f312:aecc:db56:dd3f:503b])
        by smtp.gmail.com with ESMTPSA id n66sm7270051wmb.35.2020.10.01.00.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 00:39:01 -0700 (PDT)
Subject: Re: [PATCH v3 17/19] hw/arm: Automatically select the 'virt' machine
 on KVM
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm-devel <kvm@vger.kernel.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-18-philmd@redhat.com>
 <CAFEAcA-Rt__Du0TqqVFov4mNoBvC9hTt7t7e-3G45Eck4z94tQ@mail.gmail.com>
 <CAFEAcA-u53dVdv8EJdeeOWxw+SfPJueTq7M6g0vBF5XM2Go4zw@mail.gmail.com>
 <c7d07e18-57dd-7b55-f3dc-283c9d13e4b5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8253ddd7-3149-17d9-1174-6474c4bde605@redhat.com>
Date: Thu, 1 Oct 2020 09:38:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <c7d07e18-57dd-7b55-f3dc-283c9d13e4b5@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 9jv+3lu7uU8s

On 29/09/20 22:36, Philippe Mathieu-Daudé wrote:
> Yes, the problem if I don't restrict to KVM, when
> using the Xen accelerator odd things occur
> (using configure --enable-xen --disable-tcg --disable-kvm):
> 
> Compiling C object libqemu-i386-softmmu.fa.p/hw_cpu_a15mpcore.c.o
> hw/cpu/a15mpcore.c:28:10: fatal error: kvm_arm.h: No such file or directory
> 
> See
> https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions#Use_of_qemu-system-i386_on_ARM

I don't understand.  Is Xen adding CONFIG_ARM_VIRT=y to
default-configs/i386-softmmu.mak??

(By the way, there are duplicate Kconfig symbols between target/arm and
hw/cpu, they could/should be removed from target/arm).

Paolo
