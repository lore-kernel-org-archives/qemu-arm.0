Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp836356lfq;
        Tue, 8 Sep 2020 11:27:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7XA4nm+QFn4FJfXCWztjQKoJcUa4SHCZGsWLMbcgDWp1N4pR+/+T+Z+irozOOSli9xFU7
X-Received: by 2002:a5b:508:: with SMTP id o8mr267264ybp.43.1599589663926;
        Tue, 08 Sep 2020 11:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599589663; cv=none;
        d=google.com; s=arc-20160816;
        b=eHk34l7YbRJ3HoVvYtGJuW4TNBGsniLqWalKHewrYaS6gN7DXi+pIrD8ewWbMpmwh3
         NaJI604XJFue8ig7gWroFNscNaiSPwS4kB8ep8Ecbk7fCvM0WvAND/AzNkfVY8KO8MSr
         a/tKV+BhGv1htmzrbjdfa1hNLdDx0tpveExAfMAyb94N+EBHak5Rnf59X8o/rpaaINUL
         pDhTxBGIBuP1Ts1d29dD6lqzg55/mIwRVEOpgFaOA4TPNyqBlme/TDprhz2YkHY8Y0PG
         LqMFRGncCNOWqyRWqNRMtLipOCuhKlYJ0vB0H8C3yfyYrIFeZF70P3jU+XOOkjsUFhiA
         fm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=WRvVLQJhsHvqw3G4z8XPOKNBU+EPByxW5Sy45vFTuaI=;
        b=EYSR20XUGQxhMdz3xRCuVTdqBUCKH+Na1qEzkdLE2ppfqihmUYLIR2iibeE3a19ID3
         tlZLgDfxKqYKvSQU3OtJFG2BJbuKwSud+RdJpgBzok8urZ+7IRHA+YYqEUshnnYVmmpk
         MwTLwPhJcbhZPCLss8D1h8QJq69wRgyG/N5e2BSe/s7PSz0lnhSV3DPUgBPPOnrB9ACP
         4ItIyX4hwwYNfTT5+mn7KR/vpYHcKWnAAFG2xf6VTLh1pud0T3ozA89Qtj3eWDu7/CSb
         eJlz5lsF7PYd8BnLsrlpB/5E9EhdKR1MM6tHL7iBhcAnwEY8AHiGHhgUr9UPpMRLtMIP
         t+Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vx98RWtn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si112620ybn.128.2020.09.08.11.27.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 11:27:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vx98RWtn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFiLH-00017p-B8
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 14:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFiLA-00017Z-Ej
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 14:27:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFiL8-0008Ol-G7
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 14:27:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599589653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WRvVLQJhsHvqw3G4z8XPOKNBU+EPByxW5Sy45vFTuaI=;
 b=Vx98RWtnBT7jkBzmFO8Wv0w0JoPbA6DwgbE0eizMfD9jwvt+S+RBPH9r6Ag1SDDLDY3tbD
 cPgK1/k4QBKWbCNwT/cGcwq6ZSNJ4QZiEOCdR/XL+FY5r6+xySpUqooteXUH1lPHs4kach
 C0+TvgtX4/KUHyxbGdmIgaHOLXasqsY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-fdge9-zrNEGYqvh3r-C4_Q-1; Tue, 08 Sep 2020 14:27:18 -0400
X-MC-Unique: fdge9-zrNEGYqvh3r-C4_Q-1
Received: by mail-wm1-f70.google.com with SMTP id m25so80968wmi.0
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 11:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WRvVLQJhsHvqw3G4z8XPOKNBU+EPByxW5Sy45vFTuaI=;
 b=rNamnLFeQxfaHXFOw2EsQUzJINZLpOR6arcOcB53I7xU8tCsvkfJpuT0GQAaaeCHbj
 vLvlRAiLwNO+FsyRezsrmillqgxrFLSaTHdL4zq1UVHcmYV01wxdzrnMEHxQ9qeU4PEL
 U1DkWBkxL8jKBCdgxOFAZhmNv0TzmuC6ifWaTztrj9HSfsHRwAngGZWXy8VfwXPIt+vi
 yk2Dp0Hpv/s9FLqm5MqkFbzbH76PbCvxUgxGpdl6NVL4+u0HrOW5zawEWtJ++Oo62YSS
 vVFYST12nVOWoI8NmOTp4mdf4y5E7GXzu+BOFIXZaJgyKV6nS1Nqpi4y+ie3rLRgiEcs
 CKfg==
X-Gm-Message-State: AOAM530lsgWj0R9YKy+eaIiwEiGuuS2J6P9Hmc/aLrgyZiuLgwR9Oi0t
 Q1rRwlJILddTXJ1JyyHHDngbl8KOfsZyiQWSMns2LCMlNEXUr2NdwsUU9BduQ4PJpxj4+gaO9jW
 UCEzgfDodC32C
X-Received: by 2002:a1c:6487:: with SMTP id y129mr436357wmb.90.1599589636495; 
 Tue, 08 Sep 2020 11:27:16 -0700 (PDT)
X-Received: by 2002:a1c:6487:: with SMTP id y129mr436344wmb.90.1599589636275; 
 Tue, 08 Sep 2020 11:27:16 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id t202sm334698wmt.14.2020.09.08.11.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 11:27:15 -0700 (PDT)
Subject: Re: [PATCH 3/5] qemu-options: document SMBIOS type 11 settings
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200908165438.1008942-1-berrange@redhat.com>
 <20200908165438.1008942-4-berrange@redhat.com>
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
Message-ID: <dfe8532c-abfc-57f6-d760-be2e3ce15b0e@redhat.com>
Date: Tue, 8 Sep 2020 20:27:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908165438.1008942-4-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.626, NUMERIC_HTTP_ADDR=1.242, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e9dg9hGqSO5K

On 9/8/20 6:54 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  qemu-options.hx | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index b0f020594e..0cd231b164 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2296,6 +2296,8 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>      "-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
>      "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
>      "                specify SMBIOS type 4 fields\n"
> +    "-smbios type=11[,value=str][,path=filename]\n"
> +    "                specify SMBIOS type 11 fields\n"
>      "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
>      "               [,asset=str][,part=str][,speed=%d]\n"
>      "                specify SMBIOS type 17 fields\n",
> @@ -2319,6 +2321,45 @@ SRST
>  ``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str]``
>      Specify SMBIOS type 4 fields
>  
> +``-smbios type=11[,value=str][,path=filename]``
> +    Specify SMBIOS type 11 fields inline
> +
> +    This argument can be repeated multiple times, and values are added in the order they are parsed.
> +    Applications intending to use OEM strings data are encouraged to use their application name as
> +    a prefix for the value string. This facilitates passing information for multiple applications
> +    concurrently.
> +
> +    The ``value=str`` syntax provides the string data inline, while the ``path=filename`` syntax
> +    loads data from a file on disk. Note that the file is not permitted to contain any NUL bytes.
> +
> +    Both the ``value`` and ``path`` options can be repeated multiple times and will be added to
> +    the SMBIOS table in the order in which they appear.
> +
> +    Note that on the x86 architecture, the total size of all SMBIOS tables is limited to 65535
> +    bytes. Thus the OEM strings data is not suitable for passing large amounts of data into the
> +    guest. Instead it should be used as a indicator to inform the guest where to locate the real
> +    data set, for example, by specifying the serial ID of a block device.
> +
> +    An example passing three strings is
> +
> +    .. parsed-literal::
> +
> +        -smbios type=11,value=cloud-init:ds=nocloud-net;s=http://10.10.0.1:8000/,\\
> +                        value=anaconda:method=http://dl.fedoraproject.org/pub/fedora/linux/releases/25/x86_64/os,\\
> +                        path=/some/file/with/oemstringsdata.txt
> +
> +    In the guest OS this is visible with the ``dmidecode`` command
> +
> +     .. parsed-literal::
> +
> +         $ dmidecode -t 11
> +         Handle 0x0E00, DMI type 11, 5 bytes
> +         OEM Strings
> +              String 1: cloud-init:ds=nocloud-net;s=http://10.10.0.1:8000/
> +              String 2: anaconda:method=http://dl.fedoraproject.org/pub/fedora/linux/releases/25/x86_64/os
> +              String 3: myapp:some extra data
> +
> +
>  ``-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str][,asset=str][,part=str][,speed=%d]``
>      Specify SMBIOS type 17 fields
>  ERST
> 

