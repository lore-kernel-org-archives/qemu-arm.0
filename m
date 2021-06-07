Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3512665lfa;
        Mon, 7 Jun 2021 06:48:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn51kocOE8jyJ1noxrft4AG3BG0rszKuG5QLEvflR6V1/n8NT6cv9cMdBVE2qwrYwGbwun
X-Received: by 2002:a05:6402:2792:: with SMTP id b18mr6943782ede.191.1623073731556;
        Mon, 07 Jun 2021 06:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623073731; cv=none;
        d=google.com; s=arc-20160816;
        b=OAx7aw6AytJ0X2GwajDMVYVwWIsSpZl7o++/zKm6rXou3YtVVs9TAHV01ewIUUDg4d
         9MUvppRy74mkY0/NHOovDwGdqp/rriDnhiTjtaGdNXwz4iT6jEUo2meKtN2oj0p5WXcm
         YiPHnF9r5928sZXenELo9egSIbEzZJc7DR6Q/ZEIRC2klUlD018/ReH2szyjwTmNm6cz
         bN8ei/MLnTOlvGrDlxCKqyeR/D5U5XcPvwixSu3GH2/mvQYBLqINw5AUWBECURd3V7Bj
         X0yfqRQsY5CkL7XYD/Av21F2utSAnPcMIVyTHFqMdJBOOqx6NnetnAmNckBv6StJtCbb
         74YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=hIysnCtiHC2pVLiYlZTJxXOIkTU4pDX2O/mPtI6CF3w=;
        b=Yv5b0ap/LQX+qf5yzSZcfr71S/mZgZNLc1bUpJdCtM14SXIXQS5oWrgANUuLl8xBzX
         hnl0EMNZOCuv37Wq0Eb5DprU6DexLoEPh7IX55sdkPkYf7fglzxdGFlUmS3/8BBEfcx2
         0UBPJhGRsIUvMF0NSTKsuoCGnityHjXDltUhd4A2dmJSW9sY6B9IN5GwrwWIeU217mRp
         5iQ33OcEJbyRSVrb7GIOfcw6HxEREiFxyvA5EkHHZTN2RN4Ll44+5apAVHA4hNUn5agd
         ExincldAMPWr1YDyshSMX9HyCcFXPtNQXse+xjedFXCLIjKt/Y9INLVse446fD5W9sHg
         rc/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VOfJ+CGP;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s14si12492585ejm.98.2021.06.07.06.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:48:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VOfJ+CGP;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623073730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIysnCtiHC2pVLiYlZTJxXOIkTU4pDX2O/mPtI6CF3w=;
	b=VOfJ+CGPP+vKtxi3mSpcS/7mhDDf1jfWBbKt5AWZFHcPI6DSiH+KxdsgPteGMMG27PA+BM
	BbESCRZs7wRjxRpAK/sw7wMPFsy6MrHHBQhh9oQYHrwTV7KUTXdCLl1RYYt9oDv4eYwey5
	zpMS93h16Lvx5IqJMk2XiWvbkd1k534=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-_JprI_kaOLSgAijFaaSmJg-1; Mon, 07 Jun 2021 09:48:46 -0400
X-MC-Unique: _JprI_kaOLSgAijFaaSmJg-1
Received: by mail-wm1-f71.google.com with SMTP id o14-20020a1c4d0e0000b029019a2085ba40so2359073wmh.1
        for <alex.bennee@linaro.org>; Mon, 07 Jun 2021 06:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hIysnCtiHC2pVLiYlZTJxXOIkTU4pDX2O/mPtI6CF3w=;
        b=Qe6+3RFRz+qJpmfKpMclxomDSD2ijjHkLLdg2W3BPaOFI1LepaOPxaGrNZEppNyCRg
         e4N1R7Es/VBPbn47hYSSDn5fOMSlDlemDh7UFHq5kR0Ii7QZpGuE48EVy4U74zho+gek
         upI1J+jYJxt3wndB9x+kTeIDZguA/BtFNZzWhz0j+010ngbbxBU+mjBBYmFmLE/sBiuM
         UHGp7AbHgycHu5KM7D11yUpTHA8xocb2DKBogtk/eV6g+hjnJu+yDrUSO7rFPg1DI8Dg
         2C8gGMI9L3lB8YtRqMXQ6LkCvQ2x6k2UGjTI/IpYn+sYZQ2f+sWBz2zKdRc1y65Vsh2n
         cRxw==
X-Gm-Message-State: AOAM533AiupELxKLQvZIH1mKFlgxvCvRYdyRKKTls0Ee6YvD67FTa2nt
	4h6WchzZrzxHronz3mjm4jdJ20kuMpHPeDRPCZ3RfiQmd2kb6QWm5cwyjtS3eRlUe4tkfzw8Ur9
	mDKP1n5mX4PhVc7H6
X-Received: by 2002:a05:600c:198d:: with SMTP id t13mr16749242wmq.56.1623073724818;
        Mon, 07 Jun 2021 06:48:44 -0700 (PDT)
X-Received: by 2002:a05:600c:198d:: with SMTP id t13mr16749227wmq.56.1623073724687;
        Mon, 07 Jun 2021 06:48:44 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de. [217.87.87.121])
        by smtp.gmail.com with ESMTPSA id a4sm14775020wme.45.2021.06.07.06.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:48:44 -0700 (PDT)
Subject: Re: [PATCH v16 12/99] qtest: Do not restrict bios-tables-test to
 Aarch64 hosts anymore
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-13-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <63e38f3c-8c26-4acb-7576-7b954946c821@redhat.com>
Date: Mon, 7 Jun 2021 15:48:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-13-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: y4F8mWJwdahR

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
> 32-bit Arm hosts") we can remove the comment / check added in
> commit ab6b6a77774 and directly run the bios-tables-test.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-13-philmd@redhat.com>
> ---
>   tests/qtest/meson.build | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c3a223a83d..2c7415d616 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -176,14 +176,13 @@ qtests_arm = \
>      'boot-serial-test',
>      'hexloader-test']
>   
> -# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
>   qtests_aarch64 = \
> -  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
>     ['arm-cpu-features',
>      'numa-test',
>      'boot-serial-test',
> +   'bios-tables-test',
>      'xlnx-can-test',
>      'migration-test']
>   
> 

Acked-by: Thomas Huth <thuth@redhat.com>
