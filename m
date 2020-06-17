Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp486250lfm;
        Wed, 17 Jun 2020 03:33:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxn04aV3bXgans0a3Df7WDJgZ4TWNUnJcTBin7ECWf25esy5CmDrDAeayDjbqxx+PE9v3ol
X-Received: by 2002:a25:9bc6:: with SMTP id w6mr11598151ybo.408.1592390013384;
        Wed, 17 Jun 2020 03:33:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592390013; cv=none;
        d=google.com; s=arc-20160816;
        b=p7MOz+hl2yGLJ81bi/aIIzK8syH2uRD1bPbn0N7jSrLGnu5c4/jfvrQN3N2rPXW9v8
         2exKIMp1BIocm0dRlzYlRavx2bwJhtrCDX+vtMXt1xoF5JiTu7ZEu/xxsrERfRR9pHMo
         J6dxVfCx1nUzmwaMw2luYWIsb38fzvzbcHTPqkFBReRGnCKm4nOlei2tiwXriebaRrf4
         DgYd6MkUHFhzwlYvhBnrukpbzH9d8Z/iP1oSlzvho0o/euSDXgTbvmlBfN1K96xR/eno
         RpY8b9HMBmxp5EtK0cSg0dwgNi9xlfaEC9WxDqq8e6GEOU8dThh0TEPhGIS+utrlxA4a
         2dEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:references:to:from:subject:dkim-signature;
        bh=ZkzwZ3Vuai3Jr2NsGHxdTqAQQAnH9HM/5IF6jfJpxig=;
        b=h1bao8z2wB7AeE9ftmz1gU/1bCIvWAXtmOtiR4IuLQ6DiKM7IITsPa7GY3fCltEjnP
         iOMGacuBX27FeRci15M/2ZLRQsu5AP4TkYYatQiM9/cjIERgyr4lpJ+1Ezs3Qis64dTB
         OE6VMO8r2A/3ymAqz4Xu0jp2QuhGa07uopvoDuS+UJ+hSMet1onxql050kWrwM1vkER2
         nqob9HA0od9acaVPRyM+Co2QoVzseSvtctHp4Q+x4ZFr85IQotkvf9FCDLMDWwas//07
         YHRtlo/SnvZAijm7OHRQJsybNH4BIPZqTPNT8qrwX1R49D530RFMuHGVpeYCRgUAOKsb
         c0ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SoIVjOLW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189si19283362ybn.283.2020.06.17.03.33.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 03:33:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SoIVjOLW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlVNs-0004KX-NS
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 06:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jlVMf-00038M-LJ
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 06:32:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57481
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jlVMd-0000AQ-MB
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 06:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592389934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZkzwZ3Vuai3Jr2NsGHxdTqAQQAnH9HM/5IF6jfJpxig=;
 b=SoIVjOLWAb5hldXkkNT9Dr3+W+eRORziO72oNbZ9B/eSBpCSF5ff90W9FMemdSIaw+DIdm
 l+VJqyl9y2wlJLpkl8b8HJvc/k7QD5MwphoM7EUat9EG34zK0T2SWm/Klh2qo0I2nRnboi
 M6ddXNGcuQb5QhugTT68TsejA6Vca8w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-mU-gbI5uP-6xBXMFPInHyA-1; Wed, 17 Jun 2020 06:32:13 -0400
X-MC-Unique: mU-gbI5uP-6xBXMFPInHyA-1
Received: by mail-ed1-f70.google.com with SMTP id n17so639411eda.13
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 03:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZkzwZ3Vuai3Jr2NsGHxdTqAQQAnH9HM/5IF6jfJpxig=;
 b=K1g2P1K3pI8niwZueEQ30cbz5CNlEryfrmoTAUECCbnI/PQWhIQN3tCNR6n9aKx0SP
 5jbI6OxOnCOchHjcEaKCtdFBtr03KWd4/HcGdcnmTRP8oPBgQ1HMEpl9jy2HohPfiyw8
 ByfXuV2F0H5G76nnZsIEFLdeb6LaqGEKaTUVSb9kJ4QeNXLYXzs94A4L2SDMGBB1s7/z
 3hh32xhLoIYRReFKllPKQqdFAwq7oIvOL9NsgNWUxgT8FdM7NoD2+TvsqFCTDxBUFUG6
 ZQrgdCrYlbvn/RuIiS1hl6VqQsyBXBbisS6X0OctYS3GkQOZGMTnW9y8UL7aaccduM2o
 kbyg==
X-Gm-Message-State: AOAM532CsJAUcoBZydY2FBk+FJwVY7ANsZIw7WQtRl7HHPggO+qxvEtB
 uaxH2uI/Ry9KSlqt++1xUzYe0LlqlcWuHD/Z0SecPw03IKXwtoLzXpBW+A20g5oT9X0mnFaxDZR
 6uwo9MYlINIX+
X-Received: by 2002:a17:907:2118:: with SMTP id
 qn24mr7196353ejb.252.1592389932011; 
 Wed, 17 Jun 2020 03:32:12 -0700 (PDT)
X-Received: by 2002:a17:907:2118:: with SMTP id
 qn24mr7196318ejb.252.1592389931644; 
 Wed, 17 Jun 2020 03:32:11 -0700 (PDT)
Received: from [192.168.1.37] (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id u13sm13188423ejf.60.2020.06.17.03.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2020 03:32:10 -0700 (PDT)
Subject: Re: Core dump happened when starting a VM on arm64 server
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Andrew Jones <drjones@redhat.com>, Haibo Xu <haibo.xu@linaro.org>
References: <CAJc+Z1Eb815hroFPY+9Ai_9hh=+eje+X2ENtGj9XA+_F0XUPqg@mail.gmail.com>
 <20200611091419.e2rfcurztmlajlwr@kamzik.brq.redhat.com>
 <a6740274-1bd7-460c-7011-244cdf2fc945@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <e47664d7-a13e-7f60-975d-97f085036067@redhat.com>
Date: Wed, 17 Jun 2020 12:32:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a6740274-1bd7-460c-7011-244cdf2fc945@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 01:42:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FXnoiJNQaSjN

On 6/17/20 10:23 AM, Philippe Mathieu-Daudé wrote:
> On 6/11/20 11:14 AM, Andrew Jones wrote:
>> On Thu, Jun 11, 2020 at 04:46:45PM +0800, Haibo Xu wrote:
>>> Hi,
>>>
>>> I met a qemu core dump issue when starting a VM with cpu feature
>>> "pmu=on" on an arm server.
>>> The commands to start the machine is:
>>>
>>>   ./qemu-system-aarch64 \
>>>            -cpu host,pmu=on -M virt,accel=kvm,gic-version=3 -nographic
>>> -m 2048M \
>>>            -kernel ./Image \
>>>            -initrd /boot/initrd.img-5.6.0-rc2+ \
>>>            -append "root=/dev/vda rw console=ttyAMA0" -nodefaults -serial stdio\
>>>            -drive if=none,file=./xenial.rootfs.ext4,id=hd0,format=raw \
>>>            -device virtio-blk-device,drive=hd0
>>>
>>>
>>> And here is the stack dump:
>>>
>>>  Core was generated by `./qemu-system-aarch64 -cpu host,pmu=on -M
>>> virt,accel=kvm,gic-version=3 -nograph'.
>>>  Program terminated with signal SIGSEGV, Segmentation fault.
>>>  #0  kvm_ioctl (s=0x0, type=type@entry=44547) at
>>
>> s=0x0 means cpu->kvm_state is NULL
>>
>>> The root cause is in the arm_get_pmu() operation which was introduced
>>> in ae502508f83.
>>
>> Actually the root cause is d70c996df23f ("target/arm/kvm: Use
>> CPUState::kvm_state in kvm_arm_pmu_supported()"). ae502508f83 used
>> the machine kvm_state, not the cpu kvm_state, and that allows pmu=on
>> to work. d70c996df23f changed that saying that "KVMState is already
>> accessible via CPUState::kvm_state, use it.", but I'm not sure why,
>> since kvm_init_vcpu() doesn't run until the vcpu thread is created.
>>
>> Philippe?
> 
> Sorry for some reason I missed this email. I'll look at this today.

Quick reproducer:

$ qemu-system-aarch64 -cpu host,pmu=on -M virt,accel=kvm,gic-version=3
Segmentation fault (core dumped)

Eduardo, I thought we had a 'machine' qtest testing for various
combination of properties, but I can't find it, do you remember?
Or maybe it was Thomas? Or Markus? =)

> 
>>
>> Thanks,
>> drew
>>
> 

