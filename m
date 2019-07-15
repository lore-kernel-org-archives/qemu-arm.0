Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4478175wrv;
        Mon, 15 Jul 2019 11:22:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkMczXfLaUSd139qQcrZZCidZrBlRn+xdQzyvSZawPDQPQubIq7WEkDvWGS9X7g/GopA0e
X-Received: by 2002:a05:6402:2cb:: with SMTP id b11mr24457493edx.281.1563214969819;
        Mon, 15 Jul 2019 11:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563214969; cv=none;
        d=google.com; s=arc-20160816;
        b=X/dniggRbgksVeP/nC/1O2NU+qPshsM+7zmjldXf47Vn6zID0VTWtqH5w7YcuWRZTq
         IgRLUA17dKFJL0tgRE2+AJbYLr4tFGMoy3WUHAY0V/u5shSexO+ZC9y4vzEYt/v6VrEQ
         TWk59rEhUiupI4o5krL9btgmi9l3U0TR2fIYCih7zJvb9dUC+XJcj5BNxlWMuUJD1IFf
         SwRyKB27Ml3NIOIPPDZr0nF5sO3BaK1u4Ff1OZzrY7IlzvEg1Rrep6Zu3AcAaQ5cID2v
         JHciROADl00PJP64kv8Es5LDk6gFfXYW+ijRh6tpNPj1Eg3imAoIhAwkUIOnhrGceBjN
         krxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=jh1EjcI3mccPq9EguW1nzi7NdEBTHvB+4+XINCI1nAQ=;
        b=G3SJ/NO0C0fyS/wDRjgfJ9L940jUVhs7OiZo6epRXVGVP5VDYQzqNfNvdgwhh/AGsY
         82pihxoETBVJew7ViLqsjHf51ONntxHF/VpTIo4q+fhEnclZwXsT4jo4QmmOh8ieU2DB
         gXjXkjQOxCdhC6PdXVlQUuVi0IyIXTe/VMLicTiMxtT0ogqUYC1Qr/qFUWi3lFPts4Nk
         vePfbtNHOICI3eZakmau5D1G38g2/TpJS+kfEHas9jX0unEsEvVWapR9SIn3mhz/fVL2
         ujqZkw+3GspXkkia7cZRE/eYnHgxePUmQHfYPwFctyYGlS1Si2kPJ/DeYsORcy9R5lTq
         wzzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si10499412edy.420.2019.07.15.11.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2019 11:22:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hn5ce-0004X6-PB
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 14:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57714)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hn5cc-0004UA-3k
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 14:22:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hn5cb-0005iy-4K
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 14:22:46 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46988)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hn5ca-0005i7-TD
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 14:22:45 -0400
Received: by mail-wr1-f67.google.com with SMTP id z1so18111562wru.13
 for <qemu-arm@nongnu.org>; Mon, 15 Jul 2019 11:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jh1EjcI3mccPq9EguW1nzi7NdEBTHvB+4+XINCI1nAQ=;
 b=mOJZ00j8u2LvDGN6rhcYRdZLEzZ8LtphpidM/zUjvR/sGhAVTvq/B7FMd+b+TUWTYn
 /kdnTIdjiUo5YfzIJow8lQ/V8SZ1+mOhvPmzmHFis13D5ao9VW0wbU85AQFRZdkmE1EM
 f/L7FY1JHwG9LtsaXrc2t3cPasZ9blxk49HVaRFhJDD2rKY0esW9LLicOhEmttyp6DqX
 qLPw/5hkgVBKIqB+AdWwmArwu9gqlks3c0+Fs4ElqhP+FriEUdS7/EbCLs6JA+3YaYCO
 VDWwd8z3ZuHL4trPOhtTPVCmt9X6cpZAw3tqIxRCFinlHaBwHbP1PSADojxfLBsYcRJs
 rS8w==
X-Gm-Message-State: APjAAAXnnlfU3G2uwvof4yLjBnIqlLM6/FhiNMNR69beSrPAPXCUcUqd
 xpebH1wKKzFNfpO3PcX+Mju5bQ==
X-Received: by 2002:adf:e444:: with SMTP id t4mr28841642wrm.262.1563214963421; 
 Mon, 15 Jul 2019 11:22:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:b159:8d52:3041:ae0d?
 ([2001:b07:6468:f312:b159:8d52:3041:ae0d])
 by smtp.gmail.com with ESMTPSA id c11sm30438514wrq.45.2019.07.15.11.22.41
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 11:22:42 -0700 (PDT)
To: Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>
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
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <799aa0f5-8850-5caa-5103-e1cf3cdb018f@redhat.com>
Date: Mon, 15 Jul 2019 20:22:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715181206.3cb1db93.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Collin Walling <walling@linux.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HGEbnwP4dmra

On 15/07/19 18:12, Cornelia Huck wrote:
>> Is it INTx vs. MSI vs. MSI-X?
> 
> I think for s390x we need (INTx || MSI) vs MSI-X...

I think MSI vs MSI-X is just how it's configured, not the actual
behavior, so it should be irrelevant.

Paolo
