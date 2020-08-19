Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp550544lfy;
        Wed, 19 Aug 2020 08:27:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdBiJm+hZzVpgAPszCrDrfQTH8PTwrtTASauSGwoMVAiTTc2v4ZFqfZVtsfzCHPwK2eaCB
X-Received: by 2002:a25:5856:: with SMTP id m83mr34549673ybb.325.1597850874318;
        Wed, 19 Aug 2020 08:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597850874; cv=none;
        d=google.com; s=arc-20160816;
        b=pwat5xOwTu0i5kXNShswfHRJ++f+5Ag695fImGVvqBDd8Ni09mAfxNDLjBWtmk1hIN
         aHy+GEVTnIUBV3UfAkWcwyY0Cy8o9jpbYiO8vV99OLGMxgbUBP4fiW68DxFp5vfAU1ll
         ibANGlLUTfO0Aw8dvyrWp46UxviTQZaVlQlJEV+reqS0czTvaEUSqPKFjCT1t5dEuPjx
         CYoRAkhKu5sQ4+zyJ1PnShTvFmJM9LegnTPxlm3GaEvzXMv7fwjHhFb0tJru3J2vHnug
         JSxSdQ1+4hPlF4LfRkLY6Jxlx0dnwfzs53cOCaRwK5K4G+X/+ew+pOADzzaxGfSHWVix
         pljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=F9GK7ZmZtHRJs5v+cqBEq7hL863rx3yBY2CvvPbti1g=;
        b=0kRwXpeKbTbl2Mz6/wkEkNpMBL0+coQKiMFHoC3WrhGA5Q0m2ZiNktoXR7aLNo5gAT
         cmkNn5f+qic2hZzMP6KM8xgLcALcmVK5PphFc3515sI1WBZ/QmuQwjxUxi/2ieupOPHq
         jIpDpLFll054VADNpM3cy9ZXShwRCr412Tqc7zzEAhmS9pIH7nQ8rydWCo1pRmXfb04E
         lMXFJVGdCmqQAZcHcYKm8XtMOJ8oA3haQ9j+swE0QNUC6wCdWoAUnbB//Dnjw2iA95hd
         t5/V675aL3D7+3VQzB0DiA7uk9zoH+EjdB0893sGoXrS36jH9aGgzMgxo5ugYTSCexe8
         Ot/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FXcgA36m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c187si26364325yba.355.2020.08.19.08.27.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 08:27:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FXcgA36m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8Q0G-0004aO-V7
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 11:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k8Pzr-0004Ow-23
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 11:27:27 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32791
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k8Pzn-0000xO-Uu
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 11:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597850843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F9GK7ZmZtHRJs5v+cqBEq7hL863rx3yBY2CvvPbti1g=;
 b=FXcgA36mkzlxhh80pwtQ6aMdv3Y8JeYzfhJPSZFaAOCYSij4EwP+ErlaL0gswUSh6gR9zL
 GS6a6ycY/ljKkj8r6Ds1nZ7n3w0NHXBFHgZb5qa9ONjv9tIRjZlA0tpaMYgBaLbzPRhiAj
 uKo7mDql+9GssY0lP0PKgOLTDmo1kyc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-c5Oln1X9MLay7RWsG63eWw-1; Wed, 19 Aug 2020 11:27:20 -0400
X-MC-Unique: c5Oln1X9MLay7RWsG63eWw-1
Received: by mail-wm1-f69.google.com with SMTP id d22so1061075wmd.2
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2020 08:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=F9GK7ZmZtHRJs5v+cqBEq7hL863rx3yBY2CvvPbti1g=;
 b=JTy7oYdjKow75RvoYPYZhUSznKKznAvynzv8MZtN2xoNAP7BhY8Rsu/dZpRTzka+Sq
 +sLDM2uHHVi0x9bZNjM0hK5UcwQNJlti5hTBn9wvjtRQJF53ePP1siz+2tAAKJ+FJ6EI
 19Zx8UZA+Ym6cwkTw4OOJhn/1KzO0xtfBWRmTiXUjrC9jtXSUxRoqAxycnTT6T6KY6pX
 VhCpSoBC1ulIGleJVD7Q4+HWYi/NayvMI397DV/xZeI6XepqYT8bKqnDWQZ7zwM9CWn3
 TjMC+4gH2vEgOJk/esd9TUgQNUP1MIUZVsqJBtqJB6ho47Fl+Z875copOIXHykGkShJK
 Knuw==
X-Gm-Message-State: AOAM53134rpbtYHAeDQSW7tFJgC7dnVjnAfuh3UpW6E/g3vv2Ty6QPfH
 D4JxQ6DspRQhKoSg/sQaLtV/lEULkYTgmvVmXd9qFjxXngLUAIAGxk9JKpZsDqrti+j85HaMpdH
 RZmE5Dwl2fqs3
X-Received: by 2002:a5d:4b0c:: with SMTP id v12mr4586395wrq.199.1597850839640; 
 Wed, 19 Aug 2020 08:27:19 -0700 (PDT)
X-Received: by 2002:a5d:4b0c:: with SMTP id v12mr4586362wrq.199.1597850839389; 
 Wed, 19 Aug 2020 08:27:19 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id w1sm5787064wmc.18.2020.08.19.08.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 08:27:17 -0700 (PDT)
Subject: Re: [PATCH v6 2/7] hw: add 5.2 machine types and 5.1 compat options
To: Laszlo Ersek <lersek@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20200818143348.310613-1-stefanha@redhat.com>
 <20200818143348.310613-3-stefanha@redhat.com>
 <20200818171132.551e2c72.cohuck@redhat.com>
 <20200819141259.GD366841@stefanha-x1.localdomain>
 <96e4819a-1570-9b38-90eb-0c7bac2016e7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
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
Message-ID: <b0456491-9093-722e-ea91-3fcf2ab441f0@redhat.com>
Date: Wed, 19 Aug 2020 17:27:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <96e4819a-1570-9b38-90eb-0c7bac2016e7@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 01:46:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Max Reitz <mreitz@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WWls1fBrQT2E

On 8/19/20 4:38 PM, Laszlo Ersek wrote:
> On 08/19/20 16:12, Stefan Hajnoczi wrote:
>> On Tue, Aug 18, 2020 at 05:11:32PM +0200, Cornelia Huck wrote:
>>> On Tue, 18 Aug 2020 15:33:43 +0100
>>> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>>
>>>> arm, i386, ppc, and s390x have versioned machine types and associated
>>>> compatibility options. Introduce new ones now that QEMU 5.1 has been
>>>> released.
>>>>
>>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>> ---
>>>>  include/hw/boards.h        |  3 +++
>>>>  include/hw/i386/pc.h       |  3 +++
>>>>  hw/arm/virt.c              |  9 ++++++++-
>>>>  hw/core/machine.c          |  4 ++++
>>>>  hw/i386/pc.c               |  4 ++++
>>>>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>>>>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>>>>  hw/ppc/spapr.c             | 15 +++++++++++++--
>>>>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>>>>  9 files changed, 73 insertions(+), 6 deletions(-)
>>>
>>> https://lore.kernel.org/qemu-devel/20200728094645.272149-1-cohuck@redhat.com/
>>> is already out there :)
>>
>> You're too quick! :)
>>
>> Next time I'll write a script and monitor qemu.git for the release tag
>> so I can be first!!!!!!111
> 
> You're joking, but a template patch or some other automatism that opens
> the next development tree *BY* introducing new machine types would be
> nothing to frown at.
> 
> Another option would be for Peter to delay opening up the next
> development tree until he could immediately merge a patch with the new
> machine types (posted by whoever, near the end of the HFF or something).

Or this can be the "Open the tree for development" first patch :)

> 
> Thanks
> Laszlo
> 
> 

