Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp646963lfc;
        Thu, 3 Sep 2020 08:47:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyymvVve0FacfU21+TK9QlO+8E8j3nAUD5N4dyCcNKVvw0Vr5UHFOwo1pEZnOy9UZU9fsue
X-Received: by 2002:a25:5056:: with SMTP id e83mr3844125ybb.352.1599148030213;
        Thu, 03 Sep 2020 08:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599148030; cv=none;
        d=google.com; s=arc-20160816;
        b=BEW79s4WeHGYXhYZ5X7Ps7Nw5pL2QdcRlJ3IfpLpL7ptjKexp2grOZagYpe/oOdN/w
         5X37SKtGYiCl9O4lGgVH89KydENn+Ktb+gIYfNpc/0liURowXGF/M2SSbQnFrIeCFKWH
         DW0K0FqdpxfWpMNJacai//JcR/vtA+VZWcxY4izjsTFVZr2bntjdEEXdGljPn2CWlDrJ
         YIpsfNAtVOeRQE0zqF/Fovs71FWZ7KHxbKTGkmfblWk9sySCKaJECi5HWRIZy64Kh/2G
         sWq1ohKD2wDNaDZ+oMW8/U59Wx6kmujrAl4W6ArCJJfByFbMKPmrED/7pKh4SWe94UmE
         pJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=L1S+XaYiGMfZXAU02nc9w2sHqX0Hp81Q2rW3eK4E5PM=;
        b=xxXpYXCh7mVTDmqVDyIJg1ctqU5AvZF6s28BNYvim2khdvZrr4Gp7WmH03dPc5tXu/
         p+bKRgmja+eBAsccktcT1l8mgPf0nWS6ChKAsHibN3jcMhgNhZJTqRaxgNpm3800ZZhu
         z7gLEorYEZw963JtnPR7y8ygCcq9HF7RJSyweOsymOKevSoBqW/Hv57kMcpuD76sy/J+
         jqM7PcFl1C1p02NJ2xRCgbbxI9W4rFdTBF+UR5crKrnPeyUxYn2uP4D06tFiC4bYs8O2
         8LFgnUMjJJAmdZ5DDf09zpmozwb/8OemW2y8Quae6IV8xhuOjro7TVcVwvA2rs/iRDgZ
         7vuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g7t75x5T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si73506ybk.4.2020.09.03.08.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 08:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g7t75x5T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDrS9-0005zW-JI
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 11:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDrRn-0005yH-ML
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 11:46:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDrRl-0003xF-Hf
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 11:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599148004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L1S+XaYiGMfZXAU02nc9w2sHqX0Hp81Q2rW3eK4E5PM=;
 b=g7t75x5TR2aApCuGqt+tSPHBNTzM49CVCZKTjXTsMZ80EHmwmemZsTGOMp14x50WqpTTIq
 m21Xq/5ZB4Z/Pt1ltyEIJSuDn3nJvmjBWrAXGM7FmwV9hGHIEg5VSqVVQhXN5b07L/aMvK
 TGapNuN/z21ptV3NoLnwAK45LExG7hM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-kEyRtE4dO8qzWl6i6HibOA-1; Thu, 03 Sep 2020 11:46:43 -0400
X-MC-Unique: kEyRtE4dO8qzWl6i6HibOA-1
Received: by mail-wm1-f71.google.com with SMTP id x81so1119299wmg.8
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 08:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L1S+XaYiGMfZXAU02nc9w2sHqX0Hp81Q2rW3eK4E5PM=;
 b=A+Bc9xd6GeAiyy/z/NzwusYbp3MILFd0Hx5dpOeEDHxAZEN4Yl/XqJZV7gHdA7RCwx
 CwP44u5atvaMXQznMw+UsRVvf3/A+tHN4N/igaK8HvlRrpmQbZZsBF0o6vMBeCntqNme
 0oZv+4f2BYTqRmOgdZivRuYFK/BqipGteihFmI66kchzuSc6idopjlsPr+cY+p4Yd38d
 p/NZ7+36cL2gyWmdbDG0y/SVEHq3BCHVbIozd4c5I/CU58bKNX9O9OElnacLS/5cr3kO
 ZU2Daow6giXwMGY1daZdj7ClSGg59F4jjza7DPyrbA5ptPka8t1xWveHWY9P0iw3HFlS
 CIfA==
X-Gm-Message-State: AOAM533m0X+K9P9L4Np4olDOSzt6r5/lET2R8HdviPtmBlzLFLMGDEl8
 yZKGW8nyN/4YyVtPnmS+83aEJ05NXnCBvz3ysNQOdmAXOIVwL4tOXxzi1oZcakU3zhMFojJ9UEv
 u8bjEne+KdtyQ
X-Received: by 2002:a5d:4246:: with SMTP id s6mr2876461wrr.414.1599148002060; 
 Thu, 03 Sep 2020 08:46:42 -0700 (PDT)
X-Received: by 2002:a5d:4246:: with SMTP id s6mr2876437wrr.414.1599148001863; 
 Thu, 03 Sep 2020 08:46:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:197c:daa0:48d1:20b2?
 ([2001:b07:6468:f312:197c:daa0:48d1:20b2])
 by smtp.gmail.com with ESMTPSA id u126sm6565129wmu.9.2020.09.03.08.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 08:46:41 -0700 (PDT)
Subject: Re: [RFC PATCH 00/12] hw: Forbid DMA write accesses to MMIO regions
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200903110831.353476-1-philmd@redhat.com>
 <658fdd16-33da-af3a-6d8d-f7ea1253f061@redhat.com>
 <CAFEAcA8aOzq8UQwKiyuvJokBT9ui6JWxzf=T8=r13Vuu6+_kkQ@mail.gmail.com>
 <20200903142410.GX2954729@toto>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d030f14b-5b1d-6028-8fdd-5dbc25abdf74@redhat.com>
Date: Thu, 3 Sep 2020 17:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200903142410.GX2954729@toto>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Robert Foley <robert.foley@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Qemu-block <qemu-block@nongnu.org>, Li Qiang <liq3ea@163.com>,
 "Emilio G . Cota" <cota@braap.org>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Tony Nguyen <tony.nguyen@bt.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>, Laszlo Ersek <lersek@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RNAuf2twNwNM

On 03/09/20 16:24, Edgar E. Iglesias wrote:
>> [*] I do wonder about hardware-device-passthrough setups; I
>> don't think I would care to pass through an arbitrary device
>> to an untrusted guest...
> Hmm, I guess it would make sense to have a configurable option in KVM
> to isolate passthrough devices so they only can DMA to guest RAM...

Passthrough devices are always protected by the IOMMU, anything else
would be obviously insane^H^H^Hecure. :)

Paolo

