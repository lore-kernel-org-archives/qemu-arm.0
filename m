Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1821771njb;
        Thu, 15 May 2025 05:39:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVL3v5xtIPrtKOkSwvKNFJW5X6JXSqQpbzKLSBw+u6jcTFwdDSh1nsjiL7F2yiQZhWuddG5GkO9sHBR0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFQGmMNVnHAKuXmx12HNpes9XOwCoh2+d2zGDY2t5v6Ofn9QBx6NM9s7uWHvk/obfyMEJLv
X-Received: by 2002:a05:622a:1e05:b0:48b:4d11:1780 with SMTP id d75a77b69052e-49495c659cdmr112480011cf.4.1747312775107;
        Thu, 15 May 2025 05:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747312775; cv=none;
        d=google.com; s=arc-20240605;
        b=FpAhaz4kd97sxSKA36tQUWF4LeY7a+zALnWAeUUSZaBbvn7HBMPkIGEdf7jG64G5JS
         acSCdzT+TDLWxqASKg71pLTX0y0CXv/8sQnM94WCsj45lFweAZUXZSmyG1mLZTNp7qpc
         o+FhSIBjXhSEd4yfe79pvQlT5zyw7DKHWFGKAikiDOmRFnl0P2dWExVb44E3zbiKDs3C
         atl9iMPIV6bc+2XzyfSXt6gqGjbc5AbEQJXOuDFaG5xSI6fj9rVx2l7NnTH6edLo07Ed
         cFUstTRtYRaBDP3BgtGgaIOnMrNVmTqxdWcoVGdr2w0FflSHcei4sNDiv7dxbq0b1uqA
         gucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=gkygtFPvgUmfb0WJIqlgbjR/SHhkw6Po/wcCRO/H0Uk=;
        fh=n/RwqUPqorcXsMbBO2adUamhQgAsYQ3hAsj938RuJr4=;
        b=TKYjGYVScyO3lzXuSWyJw/HmDXTpuF7C8lgogCvSI8+XbLv8MV8SYv9SJBxf5SLD6H
         Hb/In4PWRX9Ct8PEi/WUdiw7h3FY8qQAU4umkl7Dlrnw+mxU0CgmypdSTMrM1df9gEVD
         si+YZaZ9UC31z/kzw0uqC7cITIxtGbh9+f02w6F5fYf/GVOJzzFepXZe/u0xwna4N5N4
         a61drA1MwSfyf5n2WwSd4G9EFS6AnEjpPaBAisqOXCRcWsrIR1ZyCEnyYkm5PDvtan4z
         fIR1z4G7kaDi9a7KbUkJ+9BbiGKsQFEFMH4yWiiAqHUGASk3VjYl2dIKQiznNn5PdJqr
         SPBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J9N52RM2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452459e76si153476651cf.100.2025.05.15.05.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 05:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J9N52RM2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFXs5-0007Dg-UT; Thu, 15 May 2025 08:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uFXrx-0006tJ-9q
 for qemu-arm@nongnu.org; Thu, 15 May 2025 08:39:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uFXrr-00076p-Eu
 for qemu-arm@nongnu.org; Thu, 15 May 2025 08:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747312757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gkygtFPvgUmfb0WJIqlgbjR/SHhkw6Po/wcCRO/H0Uk=;
 b=J9N52RM2GHZBKdolji1n7YWaEdef1BtsLZ+iXSx7OppQJcaY7r//M2j5y77XnGVaAXzwA0
 96k83HAOO5aBX0yndsDB7jEtI4PJ3Px7Bf8GOmcvuf2KP2eZhRFb8jlgBAWKQa4PpGgb5b
 fOSWRY1jIhTG8ArvUtLYwL4L68Yz+hc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-RotRyL6MNwaxufEtmnc8kw-1; Thu, 15 May 2025 08:39:16 -0400
X-MC-Unique: RotRyL6MNwaxufEtmnc8kw-1
X-Mimecast-MFC-AGG-ID: RotRyL6MNwaxufEtmnc8kw_1747312755
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a1c86b62a8so589987f8f.3
 for <qemu-arm@nongnu.org>; Thu, 15 May 2025 05:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747312755; x=1747917555;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gkygtFPvgUmfb0WJIqlgbjR/SHhkw6Po/wcCRO/H0Uk=;
 b=UDcFTIBun+s842v/tf74PiUmy4JPsVJyJ87GZdNbO33iqZ4DM1Rf9ZWQmSICThnX7I
 9y7UYFKdaUu9UZ77rGe2mVMUJGLJODgfCGYph6tseu7lOkOYFVQO0belnRdJLZGdMRKg
 /M2qK5VAdDFdyftIf+Nu22vYerKccD1FC/H3qL/PpftARy49lzOpgWM/OWb3VyqCjh7x
 5OaXc1owKkRPHd5+Un9mIfEZ/j62B23v8GIkv9WnHOXABoV2XAtn0rzhIOHAze2EnPqx
 97M/q26GE5GILchq05feUrdGbHkt46+DjtGQj9MYnNvobA4n4bFnsp9n/PsSJnyMpj1x
 NU9Q==
X-Gm-Message-State: AOJu0YwH/Ek5demiCkMZbWIksDsqv0c6zI8/ewyJeDn2ONILJRVCCKm3
 KHVmvJTDlAWdLcfaVrtiupu3QRaUokEnehxns/krMnOr8gf1iUAFUNPHtC0ESNUEy/mBTwoZiS6
 tWqW99FxOa1IpGPVwjneXENevVmntrbU3YVRPP87jiIX/7+YSscLfq22vSOqGMEeL00yvlxOlBy
 BYFqj7K2vLVqvOhbKf1oh2nTM5AFs5QA==
X-Gm-Gg: ASbGncvLFqfGw87/XPn40Lyw9wrQ+rWWxqiDHTvoFbKrGFmUOEV6cUe77i9h+1Kkdy6
 BKHFFMYWFzZEROAZqcrCNXeWEQ2a4Lmm0Eqo3+aaF6/1rv5pzs5olDjnfOTf6BW9xNP6YC4gYY3
 Pe+X0/9y7JhHlkpRLDF9J1TWbb2J5/UpRsNjfkJK6exA6M67NGL+oaGuTb6xykS/DlNRmd9bwPQ
 Jlap7pcoVkpps7vQlNejA5brc1IeUvxmKcXcbVmgx+eVUz6OOw98tFkS1wO47lzOBeW0Qzn9fiE
 /QaBV25jMPx7Q9u0mUvCEPzGFtY5NEyQGEPfhDrognQW+HQOwQ==
X-Received: by 2002:a05:6000:1a8c:b0:3a1:6e2b:85fa with SMTP id
 ffacd0b85a97d-3a3496d015dmr6413694f8f.31.1747312754740; 
 Thu, 15 May 2025 05:39:14 -0700 (PDT)
X-Received: by 2002:a05:6000:1a8c:b0:3a1:6e2b:85fa with SMTP id
 ffacd0b85a97d-3a3496d015dmr6413666f8f.31.1747312754253; 
 Thu, 15 May 2025 05:39:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f57de0ddsm22277002f8f.7.2025.05.15.05.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 05:39:13 -0700 (PDT)
Message-ID: <81355136-fddb-4134-bc75-5f8baddcefc3@redhat.com>
Date: Thu, 15 May 2025 14:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 45/46] tests/functional/aspeed: Add test case for AST2700 A1
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>
References: <20250309135130.545764-1-clg@redhat.com>
 <20250309135130.545764-46-clg@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20250309135130.545764-46-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T0BkkYHKLBVbnk90s5g7wTYk8JCzPSU7q3eq-Lfnxn0_1747312755
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.686,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jhbx/RUNTojn

Jamin,

On 3/9/25 14:51, Cédric Le Goater wrote:
> From: Jamin Lin <jamin_lin@aspeedtech.com>
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> Link: https://lore.kernel.org/qemu-devel/20250307035945.3698802-29-jamin_lin@aspeedtech.com
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/test_aarch64_aspeed.py | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
> index 8df6a97a2852..c25c96627823 100755
> --- a/tests/functional/test_aarch64_aspeed.py
> +++ b/tests/functional/test_aarch64_aspeed.py
> @@ -31,6 +31,10 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
>               'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-a0-default-obmc.tar.gz',
>               'cfbbd1cce72f2a3b73b9080c41eecdadebb7077fba4f7806d72ac99f3e84b74a')
>   
> +    ASSET_SDK_V905_AST2700A1 = Asset(
> +            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-default-obmc.tar.gz',
> +            'c1f4496aec06743c812a6e9a1a18d032f34d62f3ddb6956e924fef62aa2046a5')
> +
>       def start_ast2700_test(self, name):
>           num_cpu = 4
>           uboot_size = os.path.getsize(self.scratch_file(name,
> @@ -95,6 +99,12 @@ def test_aarch64_ast2700_evb_sdk_v09_05(self):
>           self.archive_extract(self.ASSET_SDK_V905_AST2700)
>           self.start_ast2700_test('ast2700-a0-default')
>   
> +    def test_aarch64_ast2700a1_evb_sdk_v09_05(self):
> +        self.set_machine('ast2700a1-evb')
> +
> +        self.archive_extract(self.ASSET_SDK_V905_AST2700A1)
> +        self.start_ast2700_test('ast2700-default')
> +
>   
>   if __name__ == '__main__':
>       QemuSystemTest.main()

On a BE host, if I run an ast2700a0-evb machine :

    $ qemu-system-aarch64 -machine ast2700a0-evb  ...
    ...
    U-Boot 2023.10-v00.05.06 (Mar 26 2025 - 05:59:26 +0000)

    SOC: AST2700-A0
    Model: AST2700 EVB
    DRAM:  8 GiB (effective 0 Bytes)

QEMU hangs.

If the RAM size is defined to 8g
    
    $ qemu-system-aarch64 -machine ast2700a0-evb -m 8g  ...
    ...
    U-Boot 2023.10-v00.05.06 (Mar 26 2025 - 05:59:26 +0000)

    SOC: AST2700-A0
    Model: AST2700 EVB
    DRAM:  8 GiB
    aspeed_dp dp@12c0a000: aspeed_dp_probe(): Failed to access dp. version(0)
    Core:  125 devices, 27 uclasses, devicetree: separate

machine boots.

Whereas, with an ast2700a1-evb machine :

    $ qemu-system-aarch64 -machine ast2700a1-evb  ...
    ...
    U-Boot 2023.10-v00.05.06 (Mar 26 2025 - 05:59:26 +0000)

    SOC: AST2700-A1
    Model: AST2700 EVB
    DRAM:  1 GiB
    aspeed_dp dp@12c0a000: aspeed_dp_probe(): Failed to access dp. version(0)
    Core:  125 devices, 27 uclasses, devicetree: separate

machine boots.
    
    $ qemu-system-aarch64 -machine ast2700a1-evb -m 8g  ...
    ...
    U-Boot 2023.10-v00.05.06 (Mar 26 2025 - 05:59:26 +0000)

    SOC: AST2700-A1
    Model: AST2700 EVB
    DRAM:  8 GiB
    aspeed_dp dp@12c0a000: aspeed_dp_probe(): Failed to access dp. version(0)
    Core:  125 devices, 27 uclasses, devicetree: separate

machine boots.


I Wonder if you could analyze this issue to check if it is related
to one of our QEMU model.


Thanks,

C.

