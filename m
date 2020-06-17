Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp599446lfm;
        Wed, 17 Jun 2020 06:12:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz4O6Warhe8SNC73Z0FdM85BTjGvXh8lB/vk2pYGY5G9SQPn0MF/wrKZHLZCbr1J5GEJtv
X-Received: by 2002:a25:b90e:: with SMTP id x14mr13287870ybj.8.1592399528514;
        Wed, 17 Jun 2020 06:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592399528; cv=none;
        d=google.com; s=arc-20160816;
        b=YDZw0DuhJkqdGHoSbf2h0qVZWNu3CR9/UcSG0wWTss1PFzII3ZlyG18kvvvgkiGBmK
         ivI2FRJ6SvS9kCBSu4KjtzDg2PI/wZYrUFgM06cQ86/GdkHSvtZBq4d7Mmw+/c8douIj
         9QuZtE2ce1OeWOKLy/t/9Sssz5GUJ01gAOAEBytF5EiRscybfDifNFrxK6EgsTBebxUu
         UmT4enjO3iglepttapGbEfSNjuNnL/I2EqTzSbYwkpK0WS9PRgweHhhowkQ8Gir/tvXk
         mBb9/kz/3xxbrOwmxbJxoCIhdB3tsMG+Dy334gCmG/9EozAogVbM91U/q20GzrGMSD5w
         1y9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:references:to:from:subject:dkim-signature;
        bh=uqmCCLJeMjjG7S3iLkzD6qlomobzA/viDo+A+sQNAhI=;
        b=QR9J1gdsboZkUvukBUgej9EFeObxxUqt+Bpid/qNmG1do0lQ2ldi/98+NLYtKTvNV9
         lXNgD15JLY3S6fuVILj1KlRgqw8kqZYAz/6JbDCFUFALVZshwRTEIccrBKrxV9KnMVrT
         7aOfX6FXcktinb76mR3jhYfB/x5Il4t4IYd69OpWp+WK140/5+FzGoA5gM1U09J5MgBA
         SZFLl12FcGYWJTffGmwKMNGZmEzkpBKZ5HwpJueOABvoa3uRkw1oDPTObl7LihGClFOT
         Jb9ffVGVYH0AZHzCSpMlUpgxP9f3P8CpGRCujoig9uXtKN72OtWDEOtdn58haN1LQHQR
         ippA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HcBTPkyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si20189558ybl.25.2020.06.17.06.12.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 06:12:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HcBTPkyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlXrL-0003uS-Ty
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 09:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jlXrE-0003u9-AO
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 09:12:00 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40116
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jlXrC-00012p-B6
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 09:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592399517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uqmCCLJeMjjG7S3iLkzD6qlomobzA/viDo+A+sQNAhI=;
 b=HcBTPkyqSot9nlIyQ8/8ryLHsOQQU+Aj20dn4dRHOVZ/M44umgFJz8E/d2Tu6t+SUEF0VD
 86QOe1XzDhMVJ384H2AnZ6lQSpsFXUo5LhT0xWht4VjbxKy2lzvEp2sfV5ZgiXtW+cch0r
 8ZnnUGQMB2w8qM74AvSwPHO7BTreNTs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-gsy8SM7tPPOXidLRh-WTDw-1; Wed, 17 Jun 2020 09:11:53 -0400
X-MC-Unique: gsy8SM7tPPOXidLRh-WTDw-1
Received: by mail-ed1-f71.google.com with SMTP id x24so830029edl.20
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 06:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=uqmCCLJeMjjG7S3iLkzD6qlomobzA/viDo+A+sQNAhI=;
 b=j8YUDfgWGz6m5pOHdDsunxYmooGkl/C0WcDf0yYchrLqd+425yE235d1uOv1mxT+f/
 HKv3ZUk0/LhbtujZZjb00VKOWfWjFijH3r7XK1K6UQruINf2zqcB0hYGrMjyAa8rwZkL
 wppWlGqI9/+7BlIu5Ls1J5Tij2nBe6eFRU/xVoTqqexUVdRsAXjHPodVBgrGnCi3nFXK
 va2w1zvRD2gvEKPJmAs22u1fBPjAS/tJQmxFuHk129BWUWgc7fsijJ+t+M9sL+n1ok2X
 k+9hcTt/DP/ydbeyVGtI0UpFB0bF8UlKrefba9bYUhd4rsFk4EOVZxWJmqcqAYutHqvZ
 2LcQ==
X-Gm-Message-State: AOAM533Z9aL2fO85D7xugx04q8bemOprsdDl6OSFKJRGhlpVR9M5bRu9
 TDy8nFuUSyBhhEEzjR6UIR+fPEY3vUfS5WpGX1pKN1fmnCS5ZeYPflVUzYIuVihpbgvlyhHNYZy
 VIEokvLwXP00O
X-Received: by 2002:a17:906:6a4b:: with SMTP id
 n11mr7130060ejs.198.1592399512534; 
 Wed, 17 Jun 2020 06:11:52 -0700 (PDT)
X-Received: by 2002:a17:906:6a4b:: with SMTP id
 n11mr7130044ejs.198.1592399512312; 
 Wed, 17 Jun 2020 06:11:52 -0700 (PDT)
Received: from [192.168.1.38] (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id i9sm13301844ejv.44.2020.06.17.06.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2020 06:11:51 -0700 (PDT)
Subject: Re: Core dump happened when starting a VM on arm64 server
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Andrew Jones <drjones@redhat.com>, Haibo Xu <haibo.xu@linaro.org>
References: <CAJc+Z1Eb815hroFPY+9Ai_9hh=+eje+X2ENtGj9XA+_F0XUPqg@mail.gmail.com>
 <20200611091419.e2rfcurztmlajlwr@kamzik.brq.redhat.com>
 <a6740274-1bd7-460c-7011-244cdf2fc945@redhat.com>
 <e47664d7-a13e-7f60-975d-97f085036067@redhat.com>
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
Message-ID: <c1dee39b-39e1-0b56-eba6-8890f59a66f5@redhat.com>
Date: Wed, 17 Jun 2020 15:11:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e47664d7-a13e-7f60-975d-97f085036067@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 02:02:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: 7Ta9aWpLBZiX

On 6/17/20 12:32 PM, Philippe Mathieu-Daudé wrote:
> On 6/17/20 10:23 AM, Philippe Mathieu-Daudé wrote:
>> On 6/11/20 11:14 AM, Andrew Jones wrote:
>>> On Thu, Jun 11, 2020 at 04:46:45PM +0800, Haibo Xu wrote:
>>>> Hi,
>>>>
>>>> I met a qemu core dump issue when starting a VM with cpu feature
>>>> "pmu=on" on an arm server.
>>>> The commands to start the machine is:
>>>>
>>>>   ./qemu-system-aarch64 \
>>>>            -cpu host,pmu=on -M virt,accel=kvm,gic-version=3 -nographic
>>>> -m 2048M \
>>>>            -kernel ./Image \
>>>>            -initrd /boot/initrd.img-5.6.0-rc2+ \
>>>>            -append "root=/dev/vda rw console=ttyAMA0" -nodefaults -serial stdio\
>>>>            -drive if=none,file=./xenial.rootfs.ext4,id=hd0,format=raw \
>>>>            -device virtio-blk-device,drive=hd0
>>>>
>>>>
>>>> And here is the stack dump:
>>>>
>>>>  Core was generated by `./qemu-system-aarch64 -cpu host,pmu=on -M
>>>> virt,accel=kvm,gic-version=3 -nograph'.
>>>>  Program terminated with signal SIGSEGV, Segmentation fault.
>>>>  #0  kvm_ioctl (s=0x0, type=type@entry=44547) at
>>>
>>> s=0x0 means cpu->kvm_state is NULL
>>>
>>>> The root cause is in the arm_get_pmu() operation which was introduced
>>>> in ae502508f83.
>>>
>>> Actually the root cause is d70c996df23f ("target/arm/kvm: Use
>>> CPUState::kvm_state in kvm_arm_pmu_supported()"). ae502508f83 used
>>> the machine kvm_state, not the cpu kvm_state, and that allows pmu=on
>>> to work. d70c996df23f changed that saying that "KVMState is already
>>> accessible via CPUState::kvm_state, use it.", but I'm not sure why,
>>> since kvm_init_vcpu() doesn't run until the vcpu thread is created.
>>>
>>> Philippe?
>>
>> Sorry for some reason I missed this email. I'll look at this today.
> 
> Quick reproducer:
> 
> $ qemu-system-aarch64 -cpu host,pmu=on -M virt,accel=kvm,gic-version=3
> Segmentation fault (core dumped)

Fix sent:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg713249.html

