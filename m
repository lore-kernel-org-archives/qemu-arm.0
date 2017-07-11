Received: by 10.25.44.15 with SMTP id s15csp5036645lfs;
        Tue, 11 Jul 2017 09:06:33 -0700 (PDT)
X-Received: by 10.13.242.66 with SMTP id b63mr91602ywf.320.1499789193559;
        Tue, 11 Jul 2017 09:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499789193; cv=none;
        d=google.com; s=arc-20160816;
        b=alhMiaVCi8wc5oKPKqgo16L4/vzciDJlB2SJlv/TSCy+qQK6/fscx98E0yeW0P8c8j
         3nPPeI01+cEi/TiVdlYxqLyTWF2A72yWjVPpUa2u/s6Xn8zsGpkUsTAO+Imt20rcSDRZ
         He88Gsu4+dy6mHk6tJ8ClrXSCb7v83BKXg8kv8G5UA+EkrvzbTFd9vkt3k70OosjwTlJ
         wk6Kuf4R+BzxTcVr3ZkZzU8+hyXUsE2GGCYEVdxNqgNdaUFYQPspfhYbhpvOzRclz/Hg
         GVrXOrTpWw1DtWzt0xOX1J0+TmjACxFrWRSb4++mOYJMnYzo8yQRLXZRGz26w64kZXnv
         0ViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=VYSw/G/jKO1DBk5rjlAbTVi8wLahAazBgEuQb561VgE=;
        b=mpmL+UtZ0ipQS0xUcJm2wRTf3dHJ8CjzN+1fEV8bzyyi2PosO/yPrM++Q0JXhL7kys
         dZKtY3PTPZ6wZjTQNGjoyWy2wC1xwLhHR4+yvjMPtNgn666wxThHWzcEKEalFsk44xwf
         i9oze7pHQclEIA8zjBNh7Ia0sy+NBPNshJMTXsdCF3GKKAtik4i+C+LEBFNCMxZAkGZ6
         EpN4CvFheNjPnZ0uiJ6sClxsfjIZFLmUpWe2FY/Adg3IraCezB4jEIdCJ+60DpSx3QJ4
         hPrMG8X+u5jZYcKrjVEbU2ey2f8SSSKeBOFw8p71WFf5aLEwYnZg887X007LKhhZqIwc
         F1bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=CdQlR/2t;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com. [2607:f8b0:400d:c09::243])
        by mx.google.com with ESMTPS id i133si11858ywg.176.2017.07.11.09.06.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 09:06:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) client-ip=2607:f8b0:400d:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=CdQlR/2t;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qk0-x243.google.com with SMTP id q66so1152018qki.1;
        Tue, 11 Jul 2017 09:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VYSw/G/jKO1DBk5rjlAbTVi8wLahAazBgEuQb561VgE=;
        b=CdQlR/2t3il18OeMQns5dTxch6idNILjAvbDo7j13nv0x2+8OVGyR7g+o9WsQHbBcc
         BGruIdjxp1GFchpSEE4LEbOLRcux+znIKwACVFZ4jpXrrdGRD5T9+yY9L9DXOPvY82yR
         no7oC7jkePdPCp5HLXFEnIore6kEQulv6L3ZUrCOj/o8MvL0i+Tq1+OmOmNDYE3w5omn
         UP0Z8/lLRhkVbQ51jXjI4/s6KUcIw2pAFhXjIYEsiSJyRgwNBfCejgStOI4UWnudn+7B
         cufBymrHGbm7OZk6qsdtuRyD3TNFtusyzvXM1lwOz/zTFn49SRg/QIAUCkudrzBwhIKm
         3Ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VYSw/G/jKO1DBk5rjlAbTVi8wLahAazBgEuQb561VgE=;
        b=fH6Y7GBoE/YN5qM/IOCR9MlhJluHkRY625od96plehdALGMq2Z0oSbcSwz9ADEGSSE
         oduuq4HtwYfrJ1DnsUKoyNu4Y3FN77ZdROohfMdl1cE0V32/BiIPWvEc1YsrnW97nRwZ
         +YUkj1HBU+7B/4x9wqThbxQHy5J1oOUIHbDKMNpmp3cCULgHg1K+W/J76HiwWk7V0S3V
         cKG4+KYLlbYbNXGjZsZJZ1BJYaK7ZpaMApi9E13SgTpxOoGAmo/lhjJEtXmqWt48wSzX
         Mb7VLKLJY74VrfI2xYSmMxEePR5Gg/GMHTer++tpgihAvcEQB5F9Bw6qHHpAuGFIPm/n
         /LVA==
X-Gm-Message-State: AIVw113YPnddDmsd/Yqz2NfLH2h0ZmJJG9wLVTawIYaFFevZphmUfk4v
	je3X6hiOoIS/Jg==
X-Received: by 10.200.49.18 with SMTP id g18mr930825qtb.118.1499789193121;
        Tue, 11 Jul 2017 09:06:33 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([138.117.48.223])
        by smtp.gmail.com with ESMTPSA id n11sm272876qtf.45.2017.07.11.09.06.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 09:06:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [RFC PATCH 1/3] configure: disable Xen PCI Passthrough on !x86
 archs
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, xen-arm@lists.xen.org,
 Anoob Soman <anoob.soman@citrix.com>, Juergen Gross <jgross@suse.com>,
 Anthony Xu <anthony.xu@intel.com>, Paul Durrant <paul.durrant@citrix.com>
References: <20170711025703.24194-1-f4bug@amsat.org>
 <20170711025703.24194-2-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <446cc0e3-dd49-e088-85f1-0caf1d42fbf8@amsat.org>
Date: Tue, 11 Jul 2017 13:06:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170711025703.24194-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ersveAgfcAVs

It seems our minds crossed at the same time since Alex/Pablo fixed it 
and got merged in master as b5ed2e11ef39 "build: disable Xen on ARM" so 
this patch is no more necessary.

Alex/Pablo, any thought on patch 2 regarding xen-mapcache.h?

Phil.

On 07/10/2017 11:57 PM, Philippe Mathieu-Daudé wrote:
> linking on Linux debian/stretch/arm64 with libxen-4.8:
> 
>      hw/xen/xen_pt.o: In function `xen_pt_pci_read_config':
>      qemu/hw/xen/xen_pt.c:206: undefined reference to `xen_shutdown_fatal_error'
>      hw/xen/xen_pt.o: In function `xen_igd_passthrough_isa_bridge_create':
>      qemu/hw/xen/xen_pt.c:698: undefined reference to `igd_passthrough_isa_bridge_create'
>      hw/xen/xen_pt.o: In function `xen_pt_pci_write_config':
>      qemu/hw/xen/xen_pt.c:355: undefined reference to `xen_shutdown_fatal_error'
>      hw/xen/xen_pt_config_init.o: In function `xen_pt_status_reg_init':
>      qemu/hw/xen/xen_pt_config_init.c:281: undefined reference to `xen_shutdown_fatal_error'
>      qemu/hw/xen/xen_pt_config_init.c:275: undefined reference to `xen_shutdown_fatal_error'
>      hw/xen/xen_pt_graphics.o: In function `get_vgabios':
>      qemu/hw/xen/xen_pt_graphics.c:135: undefined reference to `pci_assign_dev_load_option_rom'
>      collect2: error: ld returned 1 exit status
>      Makefile:197: recipe for target 'qemu-system-aarch64' failed
>      make[1]: *** [qemu-system-aarch64] Error 1
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   configure | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 806658c98b..e4b173405a 100755
> --- a/configure
> +++ b/configure
> @@ -2344,8 +2344,15 @@ EOF
>   fi
>   
>   if test "$xen_pci_passthrough" != "no"; then
> -  if test "$xen" = "yes" && test "$linux" = "yes"; then
> -    xen_pci_passthrough=yes
> +  if test "$xen" = "yes"; then
> +    case "$cpu" in
> +    i386|x32|x86_64)
> +        if test "$linux" = "yes"; then
> +            xen_pci_passthrough=yes
> +        fi ;;
> +    *)  echo "Disabling Xen PCI Passthrough (not implemented on $cpu)"
> +        xen_pci_passthrough=no ;;
> +    esac
>     else
>       if test "$xen_pci_passthrough" = "yes"; then
>         error_exit "User requested feature Xen PCI Passthrough" \
> 
