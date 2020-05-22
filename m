Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2663551lfb;
        Fri, 22 May 2020 08:11:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDImJ6swJ79FR0yWkZPJtXIN0Uo9mCidL0KxUViJoXAZrq1FD3ZLJOVRGHAFDY2tSpSgnP
X-Received: by 2002:a50:9f88:: with SMTP id c8mr3318248edf.20.1590160313687;
        Fri, 22 May 2020 08:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590160313; cv=none;
        d=google.com; s=arc-20160816;
        b=QPEzsSFNib4puuItr2GarILyuRttdxifhvO+EGR5uI+xSX/pxbatjWMuK0gIRGzgUC
         7SaLnM08fiZDmRfal76+8cumZ7B6JNDdsWSWCYtv5JzKirt9gQR5908P56UnmlqUnzui
         fUfqAdsVnWEQtLNZXe/W2Y+Ahky1g1YctoJpzDPazlERjcaIiGx8kzVHj8nio+YtAqPB
         slHmAh1dTv8Vo6gtutayapsy5Ker1KAvBkIyDxXpYu98LMteoouPdpxJ8X3sIrpTHwMi
         1cZZ9736hzSlE383fpIjTk2sFXF/PupZJ1/YoGHVVhGLMI0POY4dguZEua/NqcmxS8+J
         X0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=DLKf/Nb8XQKXuRpwhy1Ic949V2/xhEZGsSVSdMGGkZo=;
        b=ELD2NbngxzuQgdWKYiixu11+f9aGLtL0hlP7Wn49eoGJFJd/oofXffZYXIGUq95Xs7
         i5KdI/LG8ErBZfhZeS8cJjlT4JRNlCpVJRPpOv1aIG//ShPYfsG+VObTJMfkyVArFnJs
         x5hKuL/bsVxY6RTy6psz/g7x+GxtvFdZnkE1aW4xAz/zlq4wPVN4WyYVU5a4wc8CrUv/
         E5YjKI3Ei6aRLCMYKVo3sVVWeF+WosrjxnmzT7kzS7sYSDylLrZkLCncwunKGRKnE0T0
         0cFiSfI+EbU8swzl0kkJHc1tup6T3OhtEuU6g5bUIS2FoZHhEarKImnBaNfBSPaYT9xD
         m/IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Io5PYxpI;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id dn10si6329325ejc.89.2020.05.22.08.11.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 May 2020 08:11:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Io5PYxpI;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590160312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DLKf/Nb8XQKXuRpwhy1Ic949V2/xhEZGsSVSdMGGkZo=;
	b=Io5PYxpIPb0tG4HlANW1qmfIKj5qE/CP8fcfw5pIpzpcZX8mEQe1CyimGqCXd2QdUBo2pq
	xrFZfLqULhrLEr0ALnmE+Sogq+3wsSZ2EMvPAYr2YFWGF/Rx9X186+me6P+dAIeBeg9gq+
	WRYQPAJaHJlTBbW+mU6avgSLzg1O03A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-1uHiLxi3Mi6KQcD4Mh7ktw-1; Fri, 22 May 2020 11:11:41 -0400
X-MC-Unique: 1uHiLxi3Mi6KQcD4Mh7ktw-1
Received: by mail-wr1-f70.google.com with SMTP id h12so4507502wrr.19
        for <alex.bennee@linaro.org>; Fri, 22 May 2020 08:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DLKf/Nb8XQKXuRpwhy1Ic949V2/xhEZGsSVSdMGGkZo=;
        b=q/ZkSIZHXjmT7cjUpLiF/ImlP1UPPmPneqBnvs6929wV8w9YC+j+0nsGLMUl93V9rZ
         p7lEvb5Jhq7tc6ldpH/inTdN1t/yBHPoKkmt57bCrNiojze51jeTg7wvcSPreZriziqw
         Dk3z6FIHTBM00u+yrdF1KT5Tg/lu5gsxBZC3jdo8BYYZVdpQ7MFdP4X3uJRcU+Li2srA
         xZsCoGrnXukzW4VJypRNvP5GJUKJRm/JPvcrm8wSAUBCx6kpGZ0B54+4CU8mlYn2wQJs
         5i4d+e1mCq56H3fUiTazuhwPwdUVRZ7RsxIL6Fga732LoXosSZY9PYgIzoRBQ81+3oCr
         K/vQ==
X-Gm-Message-State: AOAM532KC3+xJohJRG08fxJAGm3ut+nc5QoM0t6+/o1GomtevK17jwLG
	oNV6pHLGl3kntX1pZlKPyatGIpsRy8NkZY0DSCx6QZzGjLfFP4RQYupyK0Ja8QaHdTFc9x5N8T/
	MHxWHCkVK8OYuEj+D
X-Received: by 2002:a05:6000:1244:: with SMTP id j4mr3924127wrx.189.1590160300132;
        Fri, 22 May 2020 08:11:40 -0700 (PDT)
X-Received: by 2002:a05:6000:1244:: with SMTP id j4mr3924113wrx.189.1590160299902;
        Fri, 22 May 2020 08:11:39 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id r3sm9455854wmh.48.2020.05.22.08.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 08:11:39 -0700 (PDT)
Subject: Re: [PATCH v3 11/11] hw/semihosting: Make the feature depend of TCG,
 and allow to disable it
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
References: <20200521195911.19685-1-philmd@redhat.com>
 <20200521195911.19685-12-philmd@redhat.com>
 <36db7554-dcc0-6b8c-e7b7-628c105d8fc7@linaro.org>
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
Message-ID: <d7635637-2b34-fd4b-ee90-945c4c9fc9f3@redhat.com>
Date: Fri, 22 May 2020 17:11:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <36db7554-dcc0-6b8c-e7b7-628c105d8fc7@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: uz44p3l/72pa

On 5/22/20 6:26 AM, Richard Henderson wrote:
> On 5/21/20 12:59 PM, Philippe Mathieu-Daudé wrote:
>> +++ b/hw/semihosting/Kconfig
>> @@ -1,3 +1,5 @@
>>  
>> +# default is 'n'
>>  config SEMIHOSTING
>> -       bool
>> +    bool
>> +    depends on TCG
>> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
>> new file mode 100644
>> index 0000000000..035592dd86
>> --- /dev/null
>> +++ b/target/arm/Kconfig
>> @@ -0,0 +1,2 @@
>> +config SEMIHOSTING
>> +    default y if TCG
> 
> Did you answer my question about replicating the TCG test?  If you did, I
> missed it...

Shortly before posting this series:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg705992.html

There is indeed something wrong with this patch, but I'm not seeing it.

- semihosting only makes sense with TCG accelerator

This is the "depends on TCG"

- some targets (if built with TCG enabled) require semihosting

This would be a per-target "select SEMIHOSTING if TCG"

Another problem is some targets only require semihosting in system-mode;
and this approach select it for both system/user modes.

Paolo... help!
