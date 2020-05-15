Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp273937lfb;
        Fri, 15 May 2020 01:03:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwck93yasc4qqasciUzhFBxCavmqwQf9sXGGIwVKC6h+YnxpEAM2SRDUB9BELUfzbRr1d16
X-Received: by 2002:ac8:7249:: with SMTP id l9mr2224135qtp.224.1589529797476;
        Fri, 15 May 2020 01:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589529797; cv=none;
        d=google.com; s=arc-20160816;
        b=gDCkb3WbPb7aclKk2MvZhwqfIxk97I+Qf00KLxZvYeRTkY+x8o8oE7OoNW3HogRPM1
         62LoRpB865e4tO+GhwJKbdRA9Y72buDPlihFUSzUAOavSGexvuUuCTQGnzkvwiIRZkb8
         9iz1pzYmDTyieeL9HoQ21CacBhLGT0HaDon9JPZxhIwGsVRYxVOxklxTgq9qPaSchXMw
         t1Vn4dBElIiZ7Hqv9QSUJDZzx2LGSCxmxI9Z6p1QV5jXoY3TbplTSMo0oc8+EhYrmURl
         n5ILNSScNXBoyXZ1Qp9MAtQYP2AWKwPxA5I9Ry0sEjv3DFgRnN9N5uiKoCNdHLfQTqqC
         D+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bRAmIHT/559a7+fqaRrSQH0tGo8TwnC/223UCasPjD4=;
        b=wZtbQxDQ2fVEC8Zr9VCq3ZVmVQ17jx8BLs4yTnRSRiOzKyDPD/5BVFeVOw024ajlKe
         dLv8sLJc0b0hE1hRmD5FNH7wGNBN4e0s3JL1/x/qmKzy7q9yOuRAa0yI0uWEuei2e/0k
         xO+aSlUAgX6PtGgh/BhBFunbMzKdYJ8d0YI01wICH9X0iq+j1R0X4EldSZfZvfzwb19t
         SpWQogH1LFmYRknU/sDVcfYwQWvvurqJUsSiezfpR91qHEOYeMZHyhT/0bE6UovTYQe7
         syvNZC71oa3xm+Z2/gOFKa5UbSFR+FYCPpcqEOjqQ1jQMusZ17Z8qqd7FhsoV7waETLL
         dJbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="iyS/3CGk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k49si802751qta.6.2020.05.15.01.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 01:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="iyS/3CGk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZVJM-0007m2-SP
	for alex.bennee@linaro.org; Fri, 15 May 2020 04:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZVJF-0007kY-7J
 for qemu-arm@nongnu.org; Fri, 15 May 2020 04:03:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50212
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZVJD-0000kf-BY
 for qemu-arm@nongnu.org; Fri, 15 May 2020 04:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589529786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bRAmIHT/559a7+fqaRrSQH0tGo8TwnC/223UCasPjD4=;
 b=iyS/3CGkIBy8WCWAmDBZh399Q2tdpULnSLEDOtW52ewJjwcHcEn06KRQusqeB+8qvRX6Rm
 xD9nb1EUDQdQCSHNp8uAV7zaYceZ2C82VXBJGjAEiqSHUm2dJVFVIbKxoAmLz0O7SUKHhW
 Tm5NHfr3gzgbys/QO+jr1KajxmeQ6Ww=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-Sft4fC8eMSuzcDRXycshqA-1; Fri, 15 May 2020 04:03:04 -0400
X-MC-Unique: Sft4fC8eMSuzcDRXycshqA-1
Received: by mail-wm1-f72.google.com with SMTP id v23so619035wmj.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 01:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bRAmIHT/559a7+fqaRrSQH0tGo8TwnC/223UCasPjD4=;
 b=Tdopo+ZX2iL4bXC+WFsmyKWQuYSq6S7PiTAo2kur7SBpLHTDrUKryATacwaSYokryj
 9Mi/NLmiNtwUmKVR45p5w07NpfA1rZs34ohwthfbqXmNBqZb/VhrwiVcVfnikV9BmMWm
 l67cgdyMfrNqLm7FRT2nmGsa9EFQ1Neqw1gGMxuBGplOyxJi+Z6GcsNhSbsmxfsH/WLs
 Pdo5id6atuTcsohvYDsS4w8lNRhtqW4GUysEOQH6t7vf8vtsYK2wbDpMZNlMwkQ28eHI
 Zymlx096Gap25QEt9D9dCt09K6w1goj3stZ9664Rm5+tUeirPKn1QS3qt+2xPwwO92fW
 wVfA==
X-Gm-Message-State: AOAM533TDwiNGCwXR1WvNOc5zmeLbpuFq9y7mzg0jEbbPeAiuIcGA8Df
 Oqcl6NOx/l4FvMoGigjCOvBu9xrVdrlxTHMzF+/rJEh+F1wecIbQ1RPM+vXf2CiMxP6obnARmID
 NZfD+9oMDbyGx
X-Received: by 2002:a1c:b60b:: with SMTP id g11mr2674244wmf.49.1589529783206; 
 Fri, 15 May 2020 01:03:03 -0700 (PDT)
X-Received: by 2002:a1c:b60b:: with SMTP id g11mr2674200wmf.49.1589529782837; 
 Fri, 15 May 2020 01:03:02 -0700 (PDT)
Received: from [192.168.1.39] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id f5sm2369881wrp.70.2020.05.15.01.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 01:03:02 -0700 (PDT)
Subject: Re: [PATCH 0/5] docs/system: Document some arm board models
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
References: <20200507151819.28444-1-peter.maydell@linaro.org>
 <CAFEAcA_p1x6S10yswHgOkMd=KrxcTGh9TD47+k1LRKM0xy5x+Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <567755c6-3bb1-b16e-af26-431dec4616ba@redhat.com>
Date: Fri, 15 May 2020 10:03:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_p1x6S10yswHgOkMd=KrxcTGh9TD47+k1LRKM0xy5x+Q@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 22:56:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YgybTK1kFTov

Hi Peter,

+Markus

On 5/14/20 3:28 PM, Peter Maydell wrote:
> Ping for review?

For the series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

However I'd rather see the board documentation in the source code, and 
extract it when building. It'd be harder to miss updating the 
documentation when modifying the code.

Another way (rather than using external program to extract from source 
code) can be to add a method/field to MachineClass, and once a build is 
finished, we could run 'qemu-system-arch -M gendoc' which go thru all 
machines and display the documentation properly formatted.

> 
> thanks
> -- PMM
> 
> On Thu, 7 May 2020 at 16:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> This patchset adds (minimal) documentation of these Arm board models:
>>
>> vexpress-a15         ARM Versatile Express for Cortex-A15
>> vexpress-a9          ARM Versatile Express for Cortex-A9
>> mps2-an385           ARM MPS2 with AN385 FPGA image for Cortex-M35
>> mps2-an505           ARM MPS2 with AN505 FPGA image for Cortex-M33
>> mps2-an511           ARM MPS2 with AN511 DesignStart FPGA image for Cortex-M3
>> mps2-an521           ARM MPS2 with AN521 FPGA image for dual Cortex-M33
>> musca-a              ARM Musca-A board (dual Cortex-M33)
>> musca-b1             ARM Musca-B1 board (dual Cortex-M33)
>>
>> to the system emulator manual.
>>
>> Patches 1 and 2 are minor tidyup of the board table-of-contents
>> before we start adding new entries with patches 3-5.
>>
>> I'm aiming more for "at least note that the boards exist" than
>> "fully comprehensive" documentation here -- there are still another
>> 37 Arm board models with no documentation at all...
>>
>> thanks
>> -- PMM
>>
>> Peter Maydell (5):
>>    docs/system: Add 'Arm' to the Integrator/CP document title
>>    docs/system: Sort Arm board index into alphabetical order
>>    docs/system: Document Arm Versatile Express boards
>>    docs/system: Document the various MPS2 models
>>    docs/system: Document Musca boards
>>
>>   docs/system/arm/integratorcp.rst |  4 +--
>>   docs/system/arm/mps2.rst         | 29 +++++++++++++++
>>   docs/system/arm/musca.rst        | 31 +++++++++++++++++
>>   docs/system/arm/vexpress.rst     | 60 ++++++++++++++++++++++++++++++++
>>   docs/system/target-arm.rst       | 15 ++++----
>>   MAINTAINERS                      |  3 ++
>>   6 files changed, 134 insertions(+), 8 deletions(-)
>>   create mode 100644 docs/system/arm/mps2.rst
>>   create mode 100644 docs/system/arm/musca.rst
>>   create mode 100644 docs/system/arm/vexpress.rst
>>
>> --
>> 2.20.1
>>
> 

