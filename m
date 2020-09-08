Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp843884lfq;
        Tue, 8 Sep 2020 11:38:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyipjTXoirtf9y30lmGKmJ0bw8sSevwLGN+bQq/4Y0B7S882Y3RGtLZ1t0ToDqAO5EWxUSW
X-Received: by 2002:a25:b18c:: with SMTP id h12mr270526ybj.315.1599590286353;
        Tue, 08 Sep 2020 11:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599590286; cv=none;
        d=google.com; s=arc-20160816;
        b=Lan2Oic2v2fsGn/vVcS2o0rOOP5CwVIu8CJHfcX74hPwttsol4U0Np/6hfAzuTWOi9
         IPbDOnrE6qHqsTFkBn5Ij+ehN2qxvwADx1Kv5o+SQWXmAfoVGXAUNXWy22alhksfczo+
         AA7IgWwXXP3M3oZJnyAStq9Em6QEc85QAO7e+dtl0URHMtwiuPfrlAh6cXBAchJDbKXy
         pzz9cXZJkteHEYan/6n0G8P+LyCzq4yZjbC2sQK0q9fT6LcuK9Hv6i6hB8scLdsbp/7Z
         k1kqfrexbshwTg7PPE/NkyUMFGz549OYVICZEUGoWXFLRpbxp1nKzhFVrNb/UMANN0GK
         txqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=F5LPtTvck+hhShia0cEhfXeezceDnfaVixrNxAVQRhg=;
        b=od5lm9r5r503tHeS3uQ3kmzO3kk0QOvkAcnhLDWvdTm1MEDGDvDbHPCdIu85ZFxOK9
         814sLhq08C9/SW5eAtspz/++HJgUGFOIR/XBN+hS47wabXqOoWBbMZEV+QW399TS5Qn7
         Eykz6SGCeN8z5aMfYEty9iVcZceLL1OWjNCltaBiGuUD+1Evb+FYjmqjPY/uXhLibWsb
         vmtXaAn8A+6IbosEvj4Nbph6RIAvhNKgixFVIrSAbFUkQ7nZy2HaZDqZAQhubXc5DKZj
         eTUskl+LXlXNCTB3ySRFTCTuIvnqmXoGT2iW7SqmItHgkx0+hpTOhdIAScqd2He/j3Nz
         rraA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XMmWgq0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si232230ybo.66.2020.09.08.11.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 11:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XMmWgq0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFiVJ-0005vd-PI
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 14:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFiVC-0005vA-Ro
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 14:37:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47035
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFiVA-00017s-HE
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 14:37:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599590275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F5LPtTvck+hhShia0cEhfXeezceDnfaVixrNxAVQRhg=;
 b=XMmWgq0tcAqM9tOdyOX7KK+lr9kGj+opcO8Qw3j5li/v83rnXJnI5ITxE647tuAxXyIESW
 lfkF+EwIw5a3677praXb57lRLS6we8O0W6NXo2SEK6VZ3nz+2Q2Mp8CVCuTiUWN1wd48oL
 4YSWQ4wPJ/e43HhLNDnGAYjoSDdeYVU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-QJ0SgcAqPKmamrWbGeZqYA-1; Tue, 08 Sep 2020 14:37:53 -0400
X-MC-Unique: QJ0SgcAqPKmamrWbGeZqYA-1
Received: by mail-wr1-f71.google.com with SMTP id a12so7282607wrg.13
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 11:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=F5LPtTvck+hhShia0cEhfXeezceDnfaVixrNxAVQRhg=;
 b=t7MHsR9YEJbVtSGiuxnZOWqIgGuc2aIB6o40MsYwwIfLRzzc59yDirsEYJ4zNcIN5F
 t5se5MAMoWBmh+uMEvcgPwoQX19gN/x3YNCYbAhV2e9nReJIod3vIBBWNBU5oYYmEPJD
 tgowhGKCQi7y/ZEYQq8kloBiI6aCk/a5mPR96LhX0KtjM/4y9QhGwUTFAk3Ibz6FFtCp
 CMS7l4MywJrfi7/eyQQt0sO2/anjEsc8A2u/p7jA4gPkw/vw6hqDvtH2BJPsYT08jeq7
 3gIbPqdwZhsW8qtP+jih6xxJhCFQ/ezuWVcoBMfAB0nl9Y4IQHiA8+2aTPPgY3OAgqln
 p3Bg==
X-Gm-Message-State: AOAM533RdzfHZ/aUlXsrPEjVVIH0ZbbyWG54SdCZD9YaIx//ioNydSMT
 tic5rXuSQKoaWNO97hl1PvYR9lNY85iOEHWOo/e5qqpAbVyeE09EFcKmTpj2QizE//kvaiIKAHF
 sN9+uczcp8WLy
X-Received: by 2002:adf:f890:: with SMTP id u16mr914862wrp.183.1599590272781; 
 Tue, 08 Sep 2020 11:37:52 -0700 (PDT)
X-Received: by 2002:adf:f890:: with SMTP id u16mr914838wrp.183.1599590272502; 
 Tue, 08 Sep 2020 11:37:52 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id g8sm332349wmd.12.2020.09.08.11.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 11:37:51 -0700 (PDT)
Subject: Re: [PATCH 4/5] hw/smbios: use qapi for SMBIOS entry point type enum
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200908165438.1008942-1-berrange@redhat.com>
 <20200908165438.1008942-5-berrange@redhat.com>
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
Message-ID: <7807ab6f-d76d-7859-6b39-bcd068bfecd7@redhat.com>
Date: Tue, 8 Sep 2020 20:37:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908165438.1008942-5-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 12:55:20
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
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VW+e1Hplj/h3

On 9/8/20 6:54 PM, Daniel P. Berrangé wrote:
> This refactoring prepares for exposing the SMBIOS entry point type as a
> machine property on x86.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/arm/virt.c                |  2 +-
>  hw/i386/pc_piix.c            |  2 +-
>  hw/i386/pc_q35.c             |  2 +-
>  hw/smbios/smbios.c           |  9 +++++----
>  include/hw/firmware/smbios.h |  9 ++-------
>  qapi/machine.json            | 12 ++++++++++++
>  6 files changed, 22 insertions(+), 14 deletions(-)
> 
[...]

> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> index 02a0ced0a0..cb1299ad7a 100644
> --- a/include/hw/firmware/smbios.h
> +++ b/include/hw/firmware/smbios.h
> @@ -1,6 +1,8 @@
>  #ifndef QEMU_SMBIOS_H
>  #define QEMU_SMBIOS_H
>  
> +#include "qapi/qapi-types-machine.h"

Actually to reduce the churn pulled in ...

> +
>  /*
>   * SMBIOS Support
>   *
> @@ -23,13 +25,6 @@ struct smbios_phys_mem_area {
>      uint64_t length;
>  };
>  
> -/*
> - * SMBIOS spec defined tables
> - */
> -typedef enum SmbiosEntryPointType {
> -    SMBIOS_ENTRY_POINT_21,
> -    SMBIOS_ENTRY_POINT_30,
> -} SmbiosEntryPointType;
>  
>  /* SMBIOS Entry Point
>   * There are two types of entry points defined in the SMBIOS specification
> diff --git a/qapi/machine.json b/qapi/machine.json
> index abc6fd0477..a58cf2694f 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -937,3 +937,15 @@
>    'data': 'NumaOptions',
>    'allow-preconfig': true
>  }
> +
> +##
> +# @SmbiosEntryPointType:
> +#
> +# @2_1: SMBIOS version 2.1
> +#
> +# @3_0: SMBIOS version 3.0
> +#
> +# Since: 5.2
> +##
> +{ 'enum': 'SmbiosEntryPointType',
> +  'data': [ '2_1', '3_0' ] }
> 

... this could be a good opportunity to add a new
qapi/firmware-smbios.json (or firmware.json?) and eventually
update docs/interop/firmware.json.

