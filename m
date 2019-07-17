Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp990657wrv;
        Wed, 17 Jul 2019 08:05:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxgaA3PguW1T81/e7ylXqMrrSBIAsLHWqsP9vi5/PQxeQVB70fzDr5fyPoz5AjBt1kEbYPq
X-Received: by 2002:a17:906:6802:: with SMTP id k2mr7464679ejr.174.1563375906764;
        Wed, 17 Jul 2019 08:05:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563375906; cv=none;
        d=google.com; s=arc-20160816;
        b=H7UMcCLY3W53BEGj9/2rYSVtik6KjzGRcwHgMAcONDC8PkL0Vunbm5MIdDZzq0YF/D
         frbF6GZGGhYszB/aqMODwHfSS2uOV/02m73Hd9omo45HqGRfGb8eqvuSuK56vZ2V6Jnb
         36AXLdJd8YHnrjs1OjgNZI5kWB/XV6ZgK/3UUfVVHIY58CUKL09TlDcO1C+J4ltk9hwX
         hfzhQDQ9Y1l1LZmwauUT+2nN6sLhfFUIJmgHPmurENvBs6aF7aLWIWrnSW4DnDCggZ5y
         ywYoZVsFG99UXVe9pM18b6SZxhXPLF+MFIarOYNd9puMCPuj5/KvRORK09Y5hKhY8Bqf
         Eyaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=VwrimCKZzMkOjKNaXoxJLyzC8mk1qj7TpfAu8V+pbD8=;
        b=sSC6dbp2+dTZMquYmLngCWdHCvfWbpCA8MHLsp9SzEFJvxx+5Xf+WD8AGoiK8aKSPQ
         FPc2dAZHKANsL/yTZF8T8A1zf+2Z2yoV7zUoqx5URw4DnRWXtzBCvwRjR2dk8sTFpXac
         2/WK2fsA+TVgnuRwypMg8vs04p2nZsMBwqVMt5az4Ih6kNBwBqhFPg8rEyb/V9RphVbX
         sEHr3QPefGrAYCG6oiDsJgN5DKiCvTPApXqQOO2BX03OmXzVSZG/saaqGiWoseez9a3D
         B6MeQTfR1NjSuTwMStgfduKsCBKeueDZUIfYCS+K8CO/Y1O1qCSka7d3fIQ9OaZtFgMc
         /p4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si15564127edc.31.2019.07.17.08.05.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2019 08:05:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnlUP-0006Kt-KE
	for alex.bennee@linaro.org; Wed, 17 Jul 2019 11:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52892)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hnlUL-0006Et-LO
 for qemu-arm@nongnu.org; Wed, 17 Jul 2019 11:05:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hnlUI-0006Tv-Nl
 for qemu-arm@nongnu.org; Wed, 17 Jul 2019 11:05:00 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34458)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hnlUI-0006Sg-GZ
 for qemu-arm@nongnu.org; Wed, 17 Jul 2019 11:04:58 -0400
Received: by mail-wr1-f65.google.com with SMTP id 31so25254926wrm.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jul 2019 08:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VwrimCKZzMkOjKNaXoxJLyzC8mk1qj7TpfAu8V+pbD8=;
 b=OAMRWjhJkhthWzOyNyvSTejWySuCri6x0YF0Lq7cgYv98OZlZUtmgE4ZiHaXn5atN7
 jvBYfxwzUXTMGqPFpowzP72Su7lkeBWdY0mtoJDH+92sIC8LShP72Av6Y5H0YEQALjnt
 v8/YbTzxiNS9aQCJUiMCGmEGr7D1+w04hBhnJ8L6R8VxR5Y4diKKZasU1M+K4BOOezgD
 eYoev9WW8DjYZwpucSxMFakeq5fVdQ8WpSPB9iHZ0g844+js+9RdTt1/fqx/C5QWiQl5
 EvFItWxuq36k5XyJtrKFInckpjDeQSQFEsUcK+c4r4ewNTUTEwTXOYjMC2f7FBQofSr9
 yAbQ==
X-Gm-Message-State: APjAAAXJZcq+meKdjw7x5Ht7bw/45Ldk7yhyvjns1giUvWxVMBISjDtU
 C7NwoSoynqhVC0iPFKCYxJg6ug==
X-Received: by 2002:adf:f883:: with SMTP id u3mr43259593wrp.0.1563375896647;
 Wed, 17 Jul 2019 08:04:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e427:3beb:1110:dda2?
 ([2001:b07:6468:f312:e427:3beb:1110:dda2])
 by smtp.gmail.com with ESMTPSA id b5sm20503921wru.69.2019.07.17.08.04.54
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 08:04:56 -0700 (PDT)
To: Collin Walling <walling@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
 <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
 <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
 <20190715125653.6e65d575.cohuck@redhat.com>
 <c1c68faf-0424-6c7c-e39f-42159457c3ee@redhat.com>
 <20190715130955.4a117388.cohuck@redhat.com>
 <13fce62f-234c-1b13-595f-5910c066bc4f@redhat.com>
 <6c39a198-e951-c0bd-1ddc-5d227afe72ff@redhat.com>
 <87a7dfth4i.fsf@dusky.pond.sub.org>
 <20190715181206.3cb1db93.cohuck@redhat.com>
 <799aa0f5-8850-5caa-5103-e1cf3cdb018f@redhat.com>
 <87h87m2knh.fsf@dusky.pond.sub.org>
 <beb5fe93-991d-ba2b-d2c1-51e01b912dbe@redhat.com>
 <50befb09-d381-4362-9cd1-6fb11c96a719@linux.ibm.com>
 <633cc3f7-eb20-1bfe-03d2-e481be188eb1@redhat.com>
 <87f07cd0-ebbc-3569-9070-5700e47d4af8@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <a88a7f65-60c2-22a8-5523-faedabc06b44@redhat.com>
Date: Wed, 17 Jul 2019 17:04:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87f07cd0-ebbc-3569-9070-5700e47d4af8@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [qemu-s390x] [RFC PATCH 1/3]
 hw/Kconfig: PCI bus implies PCI_DEVICES
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kG6G3ohECDXs

On 17/07/19 16:54, Collin Walling wrote:
> PCI host plugging will check for the MSI-X capability on the
> PCI device. If the MSI-X cap is missing, we fail device plugging.
> We do not check for MSI. Only MSI-X.
> 
> Specifically, the capability is represented by PCI_CAP_ID_MSIX
> in pci_regs.h

The code in Linux says that single MSIs are supported too:

       if (type == PCI_CAP_ID_MSI && nvec > 1)
               return 1;

Paolo
