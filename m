Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp655694njm;
        Wed, 5 Mar 2025 00:35:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2W45/bhwXsKEjJMRjW+MIRg7DvltInDg6aBSDLe6cHXlBBiBtCq5i5njQ/aIh+nZGCZ+P
X-Received: by 2002:a05:620a:86cd:b0:7c3:d078:133a with SMTP id af79cd13be357-7c3d8eb15f7mr322160385a.35.1741163724467;
        Wed, 05 Mar 2025 00:35:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741163724; cv=none;
        d=google.com; s=arc-20240605;
        b=QiMd6LEJ9ss/qdD46V0B2UL+aAlST6syg+34c3XDh2fcMrLZCjgalTvDuzFMUqU38u
         je1NHBruBDtUGnz6mXEJSESHb2QYpAHsXZNZ5yD8ikWrDvPWRLkPXaf0GiYhDUYQX6yv
         Dc2Vm47AXtseggVFRgtYwpPu64wYmVzaX9fbiM1vENfo6byke6sIvoWAf1iR+1sAwRTJ
         loSGof3AjBQwQU7QYEvScbER6vLSk2l0C6A4TBsVB9XsqALHJHS9fpnFE5NON2/VCKmx
         x22s+pn7v6Xgi0LuCyCB3928FNcSLBtdtRcsTkCTrFd6jxFWcHP3c0VvcqfcAGcRzClZ
         vSeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=hU0oOmmwAA442bl+5P32RFA7VCSBSPXuoM+kOtm4egQ=;
        fh=HIOtrNxQ0hnz3EHw+tiAsJYkdfi4QK9y44Hwm43nND0=;
        b=gBZB4x1Gsh4YUwa3AqyvrNjvN4w1ktjGo7XN5nAszZb/T8X9kmS2NCReI9FH2cTUi8
         SAtp37p34/ra3Hk1heW5+LsnZ5zW5kLAMBSurlARYtMvhlrI81w28q7pm122NfYphiBA
         wg/66eLLqJxXQITK3BntY5SzO8Zfoa9qYaFiz2n2i5B7DbZ5yz40I5u6igGA6CyyaKeX
         R3Es/gfaauUMo+b+2Juhkd42Y+MPcKJoHV1WYbSerkDZSjjjGkiutpQbE+U9ehAwlRIk
         7E7j+eEqze8rdSiGfVC2EOnMxLQQ1TaeHt6NMX9hXCHzIMT8d3zW8ecZn+Xol7NyCRc7
         rrdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gfe8rp7A;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c3bca04ae0si560450685a.569.2025.03.05.00.35.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:35:24 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gfe8rp7A;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741163724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hU0oOmmwAA442bl+5P32RFA7VCSBSPXuoM+kOtm4egQ=;
	b=gfe8rp7A9y4pQ32+OURbh/+sVba+W/eazDrF0ZTMyQKiAcRzIyqOiR47dOxYS0VeCHY0h6
	AK4u0w2VE1xObkhjSJM8ELISEP/Q0xfZ3v7pgGnHcWgHbzVajr0ajwJpo684X+O/DfOKpG
	+JpmCKvYAmruRPXmkPR5tH/IXG9Yud0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-rtS3-HXFPx2-Y9fOleLnGQ-1; Wed, 05 Mar 2025 03:35:13 -0500
X-MC-Unique: rtS3-HXFPx2-Y9fOleLnGQ-1
X-Mimecast-MFC-AGG-ID: rtS3-HXFPx2-Y9fOleLnGQ_1741163712
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-390ddb832e6so3147859f8f.1
        for <alex.bennee@linaro.org>; Wed, 05 Mar 2025 00:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741163712; x=1741768512;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU0oOmmwAA442bl+5P32RFA7VCSBSPXuoM+kOtm4egQ=;
        b=I6JaLFzutfk6f4ezwAogZae5AKQtXHikJZIBIbqmIpp7C39zJfgjjZO/fv8m4phZvZ
         PS1E9bNZAfRfDL+PyIW2gPPe2wfQe2K94JHa0lZMx4rdh4i1UBTzwe1JAzbUaWkNnzvc
         BN1ofeidLSBy7oCJoKJm9D2RfT0Ea+5/0l52e3GuV6MsNCQUwPWItzNUyBaeCkr+soAd
         ynjCIFOr/rTNunuO5/euWO0FdYq848Y3xjZeBpA/JNGM/TEy7XPwTxNYL3v5//0Orucu
         mM70XiV9bcObV7FegT/OCzCwF2pn7fA+EQ/B6/BEu2szTUaHfwcqC4kjl9IHqBqXTJWX
         EqKA==
X-Gm-Message-State: AOJu0YwO+MdnnYJZFVyWfILmdIRdA3Dhr6AM4rtptrcDQukq1J9AbMb5
	Um7p3k0k5rw6ChSd0XZPPErUkc1/QHNxQcvTba3vwG9pcp+XKYIbfEHgt2geRWaCQgfiWzZGNIa
	WDvSWp2oh8VZmqP9HXVUkloqxR9e4OZmFXbY48iCqpAqdL7TOyyGg1KuhVRC+irbpmDd65451GJ
	pRumm0dpeNFvlunafaQHMsiID7bJ2P7Fbkww==
X-Gm-Gg: ASbGncvkpruLi/uR+xELfJtVpgPwyuGq0y0IUF5GqeZ4n0+vME5YTwU3XgFEtQMpZ4r
	r/HdtU61IhjuJZksBVTEpMRqTdkjlHfJF4FR9IQlt2bDOjTAPAAyWEmK1zvbAvV8m7CxwUeur7c
	7mF1L4eZ1I0EBJIFSo+xgPuudkD0eTySVS2A6967jDFxNgorp2up6FLnI90UkDRGQibGM3G1PHv
	oQWLy6QyMXwtsJtkUqVHJVSfwQ1CidLwErdlItJVOi4WY0LSzdYbpIuphsG5eRSHTZ9b4ExItaX
	CSYRGNzByCf9APmU8wHR0K15Yz+3L2bTnL4i+hgMVg/lvMY=
X-Received: by 2002:a05:6000:18a7:b0:38d:e190:b713 with SMTP id ffacd0b85a97d-3911f7a8846mr1702677f8f.37.1741163711775;
        Wed, 05 Mar 2025 00:35:11 -0800 (PST)
X-Received: by 2002:a05:6000:18a7:b0:38d:e190:b713 with SMTP id ffacd0b85a97d-3911f7a8846mr1702623f8f.37.1741163711346;
        Wed, 05 Mar 2025 00:35:11 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de. [109.42.51.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47960b6sm20686267f8f.17.2025.03.05.00.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:35:10 -0800 (PST)
Message-ID: <20f719a9-a26d-4cb7-aa59-aab6cb20fe77@redhat.com>
Date: Wed, 5 Mar 2025 09:35:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/32] tests/functional: update the aarch64_virg_gpu
 images
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, qemu-arm@nongnu.org, Alexandre Iooss
 <erdnaxe@crans.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
 <20250304222439.2035603-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250304222439.2035603-8-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bjltb_-NbwGhuFqmyW_I2RUqu9IWuravrGZ5xDeyahA_1741163712
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GWfr64hDDB+x

On 04/03/2025 23.24, Alex Bennée wrote:
> Update to the most recent aarch64_virt_gpu image. The principle
> differences are:
> 
>    - target a v8.0 baseline CPU
>    - latest vkmark (2025.1)
>    - actually uses the rootfs (previously was initrd)
>    - rootfs includes more testing tools for interactive use
> 
> See README.md in https://fileserver.linaro.org/s/ce5jXBFinPxtEdx for
> details about the image creation and the buildroot config.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/test_aarch64_virt_gpu.py | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
> index 3fdb31f034..e417ca9beb 100755
> --- a/tests/functional/test_aarch64_virt_gpu.py
> +++ b/tests/functional/test_aarch64_virt_gpu.py
> @@ -25,14 +25,14 @@ class Aarch64VirtGPUMachine(LinuxKernelTest):
>       ASSET_VIRT_GPU_KERNEL = Asset(
>           'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
>           'download?path=%2F&files='
> -        'Image',
> -        '89e5099d26166204cc5ca4bb6d1a11b92c217e1f82ec67e3ba363d09157462f6')
> +        'Image.6.12.16.aarch64',
> +        '7888c51c55d37e86bbbdeb5acea9f08c34e6b0f03c1f5b2463285f6a6f6eec8b')
>   
>       ASSET_VIRT_GPU_ROOTFS = Asset(
>           'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
>           'download?path=%2F&files='
> -        'rootfs.ext4.zstd',
> -        '792da7573f5dc2913ddb7c638151d4a6b2d028a4cb2afb38add513c1924bdad4')
> +        'rootfs.aarch64.ext2.zstd',

I'm a little bit surprised to see "ext2" instead of "ext4" here, did they 
really downgrade the filesystem?

Anyway,
Reviewed-by: Thomas Huth <thuth@redhat.com>

