Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4907188lfq;
        Tue, 29 Sep 2020 13:36:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxizlflHo6Ta6/eP8amLXJb5lbIliH/ltofjnNr1BKEYR3j8ptOdSkCfTZ2fNJar7Vwu93B
X-Received: by 2002:a5b:98b:: with SMTP id c11mr8177307ybq.301.1601411790655;
        Tue, 29 Sep 2020 13:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601411790; cv=none;
        d=google.com; s=arc-20160816;
        b=po7Wbm3iB+pJbPNyJhrMR/hD98bBgyDCEfm3uC5kQC5IJPpdOPH3cyXMh2ky4ZI1JB
         yRY8gb0y4GdReWcELpOnUWmpoD0qjIq4xnU/944CiyD4Q9rBdwY5kK/yhuUPfZ1Ww+ch
         FHrlZoAyjiM2QXWp6rtJZ1fsDYWhiicIm0PcuVScROTKzsRUn+xFwsXXw2uQy8EF8AdO
         f4aLw2B8D4ff1MtXl4p0OKCY+og+oLGRUxFY3iKvwxHNgA8N51ZQ9k9SpbHJgkv8OFGY
         rTOZJXgnxgVsMjqpV0boYxM1kqP+Czbu0GpBAbGxoRQmWfSQxr1danJ94pTrUAG+psVG
         wl/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=NqSFfD7QAdpdGCC9Tkrleh4jcF2IKguhqbiW3VFzvOs=;
        b=rmHMvWmF7leyG7pkC9AtuSvdIULVjcpOqVKNUfPmH9A3IKmlDWJcZlzMBdU6YzGfBu
         VL5OwoIgZq7IO/NrLe+drzYDT2i49EFKUsLNnmp0NIFersmNVjGfvHIuKA4VGCvvNiYP
         T6nuJr7tai/tjMUWlSgpvxUo6+78PiXbvcY2YRPDzV7T3/MaKP+JieUmSqNXJTwiROUe
         BQKqDM7QuO/YkmFSRKt8PZtCXwYh+4LNkrp15QFSKkDuR1uLLYrKEth8/S+aJQS8krTw
         Ip0vklYGtuarKh9uaprpuift0X5r+VTdFEWqsYbBZOp0qvI4erX/FW/oFVbJi+q98aYx
         oi3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FxqtGQu8;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id w194si5034681ybe.343.2020.09.29.13.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 13:36:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FxqtGQu8;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601411790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NqSFfD7QAdpdGCC9Tkrleh4jcF2IKguhqbiW3VFzvOs=;
	b=FxqtGQu8BJZXeqvZ4t51vIwaJqcB72DyM6aYRLOBE/UgEWVHuX9y4VhCHn7L9RVrzC9K+C
	MwM0Z8cRD7OOFDEZva+XEztNnYfhmOwyi4lrhdGLUigvFY5FwcO4x/GUgWq8TRg18N64df
	2S6nRoq/WT8lI8KaAnb8Q1V6WousYoo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-yQcqGsV4PgaC45z1zMveCQ-1; Tue, 29 Sep 2020 16:36:26 -0400
X-MC-Unique: yQcqGsV4PgaC45z1zMveCQ-1
Received: by mail-wr1-f70.google.com with SMTP id a2so2221380wrp.8
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 13:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NqSFfD7QAdpdGCC9Tkrleh4jcF2IKguhqbiW3VFzvOs=;
        b=gK8EXu86W3RVZiFKMnWXMM77DJSMPblioOMdIjwILbE6Hes8bIRNmqafN11Q0nQwwC
         zFvg6iaYUdwAVwvfn4bUYPlmAayObrnemunuXv+aZJcGDRaukR5okaaF+d1qmwfm/eQP
         1MWA+nvICo4LxPxIJQitcgo/Jb3BZlPNYqa6vKm+0/eyF35qSOa+jO7tAzV0QkjdVa80
         8TpK4nuY3mABBOH9XCDVDKjVlt8YY7exnDD/yGmpK/zHC/5oRPn4SeUAUPwRR4oPzdWb
         Tj5pzuZG62D1qPevBmPYw4QZ757yVZ21bgqbKubl7hF39xZW1CkB9LC3r5f6E2EqKIKK
         7SjA==
X-Gm-Message-State: AOAM531pKEb+osdvWZAQf77g283orsUf4upNwyLtBm3lCECDikMB6MRu
	rbxap276y93C9kU8oMTWPBN3YCCYbhM+od4vktk0GsVdp2TsCwYPoH0Ys2sbPVkWwgIKmYxx8ga
	hs8p/MEK19fdOFlMM
X-Received: by 2002:a7b:cd8b:: with SMTP id y11mr6493716wmj.172.1601411784975;
        Tue, 29 Sep 2020 13:36:24 -0700 (PDT)
X-Received: by 2002:a7b:cd8b:: with SMTP id y11mr6493703wmj.172.1601411784776;
        Tue, 29 Sep 2020 13:36:24 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id n21sm6788855wmi.21.2020.09.29.13.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 13:36:24 -0700 (PDT)
Subject: Re: [PATCH v3 17/19] hw/arm: Automatically select the 'virt' machine
 on KVM
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm-devel <kvm@vger.kernel.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-18-philmd@redhat.com>
 <CAFEAcA-Rt__Du0TqqVFov4mNoBvC9hTt7t7e-3G45Eck4z94tQ@mail.gmail.com>
 <CAFEAcA-u53dVdv8EJdeeOWxw+SfPJueTq7M6g0vBF5XM2Go4zw@mail.gmail.com>
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
Message-ID: <c7d07e18-57dd-7b55-f3dc-283c9d13e4b5@redhat.com>
Date: Tue, 29 Sep 2020 22:36:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-u53dVdv8EJdeeOWxw+SfPJueTq7M6g0vBF5XM2Go4zw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: iMre/PxWfvAD

On 9/29/20 10:11 PM, Peter Maydell wrote:
> On Tue, 29 Sep 2020 at 21:06, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Mon, 16 Mar 2020 at 16:08, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>
>>> When building a KVM-only QEMU, the 'virt' machine is a good
>>> default :)
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  hw/arm/Kconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>> index d0903d8544..8e801cd15f 100644
>>> --- a/hw/arm/Kconfig
>>> +++ b/hw/arm/Kconfig
>>> @@ -1,5 +1,6 @@
>>>  config ARM_VIRT
>>>      bool
>>> +    default y if KVM
>>>      imply PCI_DEVICES
>>>      imply TEST_DEVICES
>>>      imply VFIO_AMD_XGBE
>>
>> What does this actually do ? Why should the choice of
>> accelerator affect what boards we pull in by default?
> 
> Put another way, our current default is "build everything",
> so "default y if ..." on a board is a no-op...

Yes, the problem if I don't restrict to KVM, when
using the Xen accelerator odd things occur
(using configure --enable-xen --disable-tcg --disable-kvm):

Compiling C object libqemu-i386-softmmu.fa.p/hw_cpu_a15mpcore.c.o
hw/cpu/a15mpcore.c:28:10: fatal error: kvm_arm.h: No such file or directory

See
https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions#Use_of_qemu-system-i386_on_ARM

We can't have the 'virt' machine automatically selected if
Xen is the only accelerator...

I'm looking for a simple way to avoid modifying the Xen code.

> 
> -- PMM
> 
