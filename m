Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp835230lfq;
        Tue, 8 Sep 2020 11:26:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPn5YmayaoZgQ5LyLGWQinHduBSH09Goiw70N8Fd/EcNtEFoqGLCn8Oh+x5Z8rEt0wQeN7
X-Received: by 2002:a25:dc13:: with SMTP id y19mr203395ybe.247.1599589571653;
        Tue, 08 Sep 2020 11:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599589571; cv=none;
        d=google.com; s=arc-20160816;
        b=tgEPsg9TMYEjy7lzFlDuMZDomkm/IRQOyvJ4S8RODzkTGln1OilL9PA5YF33jPbkLa
         9sUV6K2x4061nUzRAhsGLVKNRFm5zsWhuJ2QQ5KfG7VU75Jy4DEw6c+iZTkh6jwYNikQ
         v4AQdsuC7pUaEQD3uAp5dLtoVKsxkSFSNGwU0WotL9c0OUYZFM51U77mzWUWCrIyahBy
         NJX38ODLIWt7xUT/x3SezBePgHVTF1fnKXsVFAD9lyqDm7wPYQErVLrtTLzORY+gY0Dm
         iHzS2r30FoPxzF8zcS225G0yfVYoBKOgknoWYgqP7maDiJ5M9LREY/3lK9QCSrADXwVX
         sE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=Tj/BmKPISAvMnbuFyR7SyNZVhL5yJZGjU0jQtvP117c=;
        b=jZyVjQiUKX/UZxDbw9NBjDyhJFZob/s4+r1taGhRBiAb/QPBf23er6fuHoCuNwrSvL
         yXAP/oBLVZezUY+evDhYW9j/e1mqPcoVmm7A5kQZtS7QW664EcAwqzPiHdg9yk4nttTe
         i4OtUK+R4q/YageBVTjL+Dj+71BJKqH0TU2uasf4FVVUXstYEqkQ65DuRRSMfDiDS6yj
         HNgocwp+qnYeL3aBdPGkJ4yF5Hb3I2CIrHAdMrJXiakTm75e0eBrvOj+HSOSPpDVxJ6V
         f1W5OhD+q14kW6+pAZyLHLqe24ciC3jXeffwAkhDAZKXRADUPrzIpR6T8fEKSF/HTSX/
         dIQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c01+fqv7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k83si190363ybc.275.2020.09.08.11.26.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 11:26:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c01+fqv7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFiJn-0007iM-1s
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 14:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFiJZ-0007Vq-6H
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 14:25:57 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39208
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFiJX-00089q-Dy
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 14:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599589554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Tj/BmKPISAvMnbuFyR7SyNZVhL5yJZGjU0jQtvP117c=;
 b=c01+fqv7S4Hg0vTP3JWzOV1g9YLVW5TwDWKAKNP4nfGzn7zYQQVuP4ENLYwzOAjcZz6XUI
 Lsz2Wseg31tevdctP7LJyrb/ooC6etfAU8So36m8+W2/yRt5ECfIXemNPsO8B8b3AvpLPG
 ihgX1h38LuAMZTi4dmFz4hPBcgmvoMc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-Uy6VCNRXMDuBMe6Awkp7Dw-1; Tue, 08 Sep 2020 14:25:52 -0400
X-MC-Unique: Uy6VCNRXMDuBMe6Awkp7Dw-1
Received: by mail-wm1-f72.google.com with SMTP id c186so62415wmd.9
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 11:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Tj/BmKPISAvMnbuFyR7SyNZVhL5yJZGjU0jQtvP117c=;
 b=XHVevYlmdcZt33T6BU/FHZ64bcI16+Ge65KzE5YTGVXxFAeZMrWZ/RWWAjr0qg/Wfk
 LVkzZSMFH5Dbhe3cJRNiWZjJz/0c8Koh0g5FN6PZUhOyUUNjLQg45SQussgYfzpSZyU6
 tF1yVVGT+MjylfHbg/kxFFdZSo4DGARFSbEt8IOt1haCMP5PC3bLAah7ofs0mm5ipvfS
 hC1gsTdkgsmy3pEShVfm8eQ/KXaqcOL3L2b23UbEXVxMO/V/5N/g+PQwV4CvWWjqx3da
 ib6TWvMdqOugdot75GdFWWercr888+NNGYYDn00WUq5A5b5Uw2mBfkPMimkfVwmYgjhw
 qlQA==
X-Gm-Message-State: AOAM530kJ8eaX/dCLEW0UfyxUIqhinRfXBDNwcsp7OwRU1UV3efSU6o5
 hCpDa376XhjUm/5FG93Tz91/UvNcWj97DqF3hZ+6s5b9xTP1ReIuzuThoqWWXyNdQlECLJc0+kn
 sFXav1yYU244K
X-Received: by 2002:a5d:4486:: with SMTP id j6mr891816wrq.278.1599589551564;
 Tue, 08 Sep 2020 11:25:51 -0700 (PDT)
X-Received: by 2002:a5d:4486:: with SMTP id j6mr891796wrq.278.1599589551321;
 Tue, 08 Sep 2020 11:25:51 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id h76sm322954wme.10.2020.09.08.11.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 11:25:49 -0700 (PDT)
Subject: Re: [PATCH 2/5] hw/smbios: report error if table size is too large
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200908165438.1008942-1-berrange@redhat.com>
 <20200908165438.1008942-3-berrange@redhat.com>
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
Message-ID: <c4dabf60-45e7-7465-236e-389d2291db23@redhat.com>
Date: Tue, 8 Sep 2020 20:25:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908165438.1008942-3-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 03:00:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.626, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 4tWniaEdm6CB

On 9/8/20 6:54 PM, Daniel P. Berrangé wrote:
> The SMBIOS 2.1 entry point uses a uint16 data type for reporting the
> total length of the tables. If the user passes -smbios configuration to
> QEMU that causes the table size to exceed this limit then various bad
> behaviours result, including
> 
>  - firmware hangs in an infinite loop
>  - firmware triggers a KVM crash on bad memory access
>  - firmware silently discards user's SMBIOS data replacing it with
>    a generic data set.
> 
> Limiting the size to 0xffff in QEMU avoids triggering most of these
> problems. There is a remaining bug in SeaBIOS which tries to prepend its
> own data for table 0, and does not check whether there is sufficient
> space before attempting this.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/smbios/smbios.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 8450fad285..3c87be6c91 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -365,6 +365,13 @@ static void smbios_register_config(void)
>  
>  opts_init(smbios_register_config);
>  
> +/*
> + * The SMBIOS 2.1 "structure table length" field in the
> + * entry point uses a 16-bit integer, so we're limited
> + * in total table size
> + */
> +#define SMBIOS_21_MAX_TABLES_LEN 0xffff
> +
>  static void smbios_validate_table(MachineState *ms)
>  {
>      uint32_t expect_t4_count = smbios_legacy ?
> @@ -375,6 +382,13 @@ static void smbios_validate_table(MachineState *ms)
>                       expect_t4_count, smbios_type4_count);
>          exit(1);
>      }
> +
> +    if (smbios_ep_type == SMBIOS_ENTRY_POINT_21 &&
> +        smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
> +        error_report("SMBIOS 2.1 table length %zu exceeds %d",
> +                     smbios_tables_len, SMBIOS_21_MAX_TABLES_LEN);
> +        exit(1);
> +    }
>  }
>  
>  
> 

