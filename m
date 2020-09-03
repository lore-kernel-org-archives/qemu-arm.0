Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp899634lfc;
        Thu, 3 Sep 2020 14:43:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhuYok643lh5uEfiaDLn8dY/D5S6zThu47r7H+GaNYJUzKO8k1o8cjQTCmJnXmmAWViNk5
X-Received: by 2002:a25:c2c5:: with SMTP id s188mr5816601ybf.245.1599169438112;
        Thu, 03 Sep 2020 14:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599169438; cv=none;
        d=google.com; s=arc-20160816;
        b=vSTIJKmMjHcFUFs92XD5Vxdk2/UY2FhrVW5Ny0tP9hnSA8icUR31sHO1ffBIQZE4rC
         2x3wcSs0pjlzMatvaPjz3c59S5uoi4dS1eaiG0vgY+LmUeWmRFhd6OsUgxQjuZeL0Dzk
         Tkw0d/FM3vSfdX/7eo4va5bil2UvRVoZNj3hK0YMO0+n6wSS8W2O3CtdnltwuRnGEtRs
         w/vi2G9PZNescVX/bk09xllrHYeURIJ02teFI4IDYzj35GdKXvKDyOy2/vDFqQF0Rqpa
         jcVbDzQM9FIH2vnttO83HXVNTteschDaQA5hvCd6u9PVlGJd3clLVWBEoUmTOv61LU36
         e0rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=K1Eu5FAmo3br8/kZmQpMztZdSEQefBmXBNkP0m2C1VU=;
        b=VIVFmzCt9g6LzkbfUMPbqOqMBPMOCB8MKDnuxU2jqXLloi7o4VulEuKKPhsZFyl8em
         WylwE5Ny/P/6pnJEboPOp1KyrD7cNa/XYgDgISxDx9pTV9S46Y30t/nT9S/wb6xFNl5m
         uYWQYeMcdSK6WKfZ629UILQ7bRWE9nLHPj0ucylwW8RU+iHl0+EE8EtW3cJ7mxCLf2sf
         cDArJl6/PrZifT+ycfNggcsWWYn0dSB/SL2LUtqXyELimw/955czkZpZxLgALdb6SR8G
         eS1q1uWNVr3P075C5a3VFDzqESzGB/MZFP3lO9zqOjHmOopjbpNZuQJF8tEHgvkJJODI
         8ItA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="bzAu/Ctu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si4236613ybp.494.2020.09.03.14.43.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 14:43:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="bzAu/Ctu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDx1R-0004hR-FY
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 17:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDx1B-0004NU-Tz
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 17:43:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDx19-0004kw-Ii
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 17:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599169418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1Eu5FAmo3br8/kZmQpMztZdSEQefBmXBNkP0m2C1VU=;
 b=bzAu/Ctuw/hx8F9l7rkSFNrZe5r4HhnGopk5F1/kH5n1gKMh5C0Y0uIRYdd1pbZa+T/HX9
 rZg9aScff01JYWfa28ZtpSM2Uq/VW9uQYfULUPRhngXqfn+Khl2eVIbHK34FH/0QpqYjEs
 oRMR9DZ6bGn2qVcJzyUP/62fHsheUc8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-HFSGlKQ7Oou1e5VOeXRzHw-1; Thu, 03 Sep 2020 17:43:36 -0400
X-MC-Unique: HFSGlKQ7Oou1e5VOeXRzHw-1
Received: by mail-ej1-f69.google.com with SMTP id li24so870491ejb.6
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 14:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K1Eu5FAmo3br8/kZmQpMztZdSEQefBmXBNkP0m2C1VU=;
 b=KRto760bnfvzDfR3VOh2XHq3GDY2j70sJ+OzSXMCCMI+NEz4aG9aBoxAlb9jjtA0yB
 ytFr5HPyqSz9pD8nFt1u4AWQalcZRwxbYkTB2u1GZ23qDtylqIovkaFDfsZF8B5rHgAk
 peY+MTc/kcN/b6KNYU+aJ7MIU1qEecTKtW0zUojm1764fPxlZbWXB9ge7MLKVqXWP1/A
 folRjcJqn0vlt/TnkVdsWBTKaKmPHV0+drJnzvRunieVWm8ovCuPjVSnK39o1bL4dOe8
 Rjr+uIwFGBEHPk4pS4Fg6FXMWlyLC5WNPpcOsMqGYtsYBYciK0k0KmsDyiIRVTzptrR3
 jROg==
X-Gm-Message-State: AOAM533OJ6BZuvIncHw/T4EgyewEJp1Ym46XuP2MFoZZi3R/epCI2WG2
 SZFI50s27K+cbY+ZIkzy0qIm6PkqN8XUA+g5KzcwZsZqTjdJl7+/TDaPuFxMCNU6UxrN58MrQWS
 Uz1IVVRg4orkw
X-Received: by 2002:a17:906:2f02:: with SMTP id
 v2mr4042642eji.465.1599169415601; 
 Thu, 03 Sep 2020 14:43:35 -0700 (PDT)
X-Received: by 2002:a17:906:2f02:: with SMTP id
 v2mr4042589eji.465.1599169415293; 
 Thu, 03 Sep 2020 14:43:35 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id z23sm4166518eja.29.2020.09.03.14.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 14:43:34 -0700 (PDT)
Subject: Re: [RFC PATCH 11/12] hw/pci: Only allow PCI slave devices to write
 to direct memory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200903110831.353476-1-philmd@redhat.com>
 <20200903110831.353476-12-philmd@redhat.com>
 <7e4fd726-07e9-dc09-d66b-5692dd51820f@redhat.com>
 <245445c1-970f-124a-9ebc-489d3ae42d5d@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dc67c282-1ea8-9750-70d6-aeb8fd99f846@redhat.com>
Date: Thu, 3 Sep 2020 23:43:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <245445c1-970f-124a-9ebc-489d3ae42d5d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:47:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.403, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, "Emilio G . Cota" <cota@braap.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Laszlo Ersek <lersek@redhat.com>,
 Robert Foley <robert.foley@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Tony Nguyen <tony.nguyen@bt.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>, Klaus Jensen <k.jensen@samsung.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mx3pFZU36Sr/

On 03/09/20 15:18, Philippe Mathieu-Daudé wrote:
> As of this patch, all the non-PCI, but I plan to add a similar
> check for USB on top of this series.

Do you mean for memory-mapped USB host controllers?

>> I'm worried that there are cases of MMIO reads that would be broken.
>> They are certainly niche these days, but they should still work; the
>> most "famous" one is perhaps the old BASIC
>>
>>    DEF SEG=&HB800
>>    BLOAD "picture.pic", 0
> 
> This looks like ISA stuff. I don't think ISA does such checks
> (and didn't plan to add them there) but I'd need to verify.

It works on bare metal even with a modern video card.

> Do you have an acceptance test?

Nope. :(

Paolo

