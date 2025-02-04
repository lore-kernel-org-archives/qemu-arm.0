Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp401945njb;
        Tue, 4 Feb 2025 10:19:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWrqo/Ildgf7M0AgPMi+Ry1FpvqhfPt/6eI83/nOACUy4psQqZ2AVX/pn2BrFTBCTL3sTaiN9HylmVMBg==@linaro.org
X-Google-Smtp-Source: AGHT+IHaBYtHZZVkTGhqkcXFDyinRHKAR8HBxGnLSLUVkV3Hpi85fELhn8rKNpB0caSeYHo8VunL
X-Received: by 2002:ac8:5994:0:b0:466:89f8:305e with SMTP id d75a77b69052e-46fd0b9233dmr345110891cf.38.1738693186192;
        Tue, 04 Feb 2025 10:19:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738693186; cv=none;
        d=google.com; s=arc-20240605;
        b=ApmrfRBFdpBfNmPxjK0vgmwFD52gpN+TajiGhiNpuA5I9XZq0POdc+nVb9rdnsqeoN
         093ZP4b9faLm3f51zyXsvHPZB2OsCHFbVzGxPlRLLLzeCFAxjjqwV8bBHQzkmKdwu1t3
         +HEGfSdWMSAgowsS3+oV4GeJX6ypd8R5jmnRBzvZeTXd4AYnXflSCpn9l99moUz2Iqoq
         6K9Glzq/qtCsXIJDQbArlFvTfmrCwQscOb3olC9ZXtuZFt45wqhUmNzz8jJvIR+jQUaf
         UwiEpzIPMQPlijIXXPYq99sbCX7V8YyUSCXAwLwrqMUcq0l3pz+X4xqOe7QOxn+MA0sq
         zUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=ajTcK5MikIywAO/1+psjGECkRXXHT6VX/KoGkSgWjp0=;
        fh=TlQu6ksT160rjZ42t3Tg71Fnv/x0Ry++jN4GpK7uJiA=;
        b=WwE6A0ilJRyW68PixoCrNJymDc+hNSVFbB1FTUGhhzqhts1Wxo7Mfj0/Jvvpp41Onk
         V7Mwvnw2Xyo4oOc1ZMogHS4ZFog/BrFVuyxy5IWWNqdvsW9mOzS9ct2CH4j+NhXxpSFp
         t98Uy487NhiRSAH8FpjBZF8UmAOgjU+0d1xqd6Qj1hOzS8R/pIdoPGa6bpT6rXDI/Xrk
         Pa0EbpPD5ClOdLbPuaM/Qggvss3Y1LVju6hz3FKWKH6WYfIGHEpFvONxBypoveepD4xZ
         vw13vW4NkbhzPPeOkJ22Iff3/IMV1Fqy9sf32BFuMDzk9DKQ1quC0QSMCdZKUfcyopXE
         ULGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M6IU51vq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016b7db1fsi33486641cf.302.2025.02.04.10.19.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:19:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M6IU51vq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfNWB-0000yT-UT; Tue, 04 Feb 2025 13:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfNW6-0000uO-6G
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:19:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfNW4-0000I7-Kj
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738693159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ajTcK5MikIywAO/1+psjGECkRXXHT6VX/KoGkSgWjp0=;
 b=M6IU51vqIB7UqiO4bvxAs/n9Te7lq5No7NOeYEn5EDE657maHtt9SsZ76618QBasqaQLhN
 J4ZUX8wKfxmbiQ0oSERQIHQNl39b71AGFxFZK3Y34oeUCpQMDitKW5I0EtV/AyNRKg93YA
 nvIZGEfz7TH3UERrY2q9K/SFyJIi1I0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-0VztjVCQM0GJbWpSQI3VGQ-1; Tue, 04 Feb 2025 13:19:15 -0500
X-MC-Unique: 0VztjVCQM0GJbWpSQI3VGQ-1
X-Mimecast-MFC-AGG-ID: 0VztjVCQM0GJbWpSQI3VGQ
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38dafe1699cso704913f8f.3
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 10:19:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738693154; x=1739297954;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ajTcK5MikIywAO/1+psjGECkRXXHT6VX/KoGkSgWjp0=;
 b=cQwR144bxF0h6v2U2xfgzhg1e+heZIfdkL461cVPQZrPsE18g12e3Vi3KXgcEt3ujF
 ySBvbpsdbIZ0jyQJSpRPpWi6FOFiRDkfRYEKTP1GMESikDfolfbEBaNz0eVQi3UaCfVH
 h8J5GT6PDG5g0/0ilya0sn/5EH4MoYpwapQc2IN+zbSbwUE3thgPyfq1hRjhR4K2uAEZ
 MyEBYFjaVWMxomBr1NfgzEt8EBMZW3O6izZz5znOEQjEApUAwqR0DVHJqT+IIgbc5jP2
 Ry0l49qA9ev6WBH033/XztMMy6S3tXXFlSEv4JRCQsqCx1lll23EXQBl6dpi4GPoUoCd
 0r4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuhxBiwrO2tHElivnG0JJo5gkq2LC5RwfLdhROTwnLdNsNgPRsRKHbPv6VdYEj3a4uFDoNPIRm/A==@nongnu.org
X-Gm-Message-State: AOJu0YyOtPLfLqB29FJ6/5NaHKGl795huFOds6eFg/2o8K++P/i7FmwV
 SH3n1iIjDWiHllsqft+Qv0ooorPBPHmtIEB5dseuSnDf8SPsPn5vG365FsbPmPYoq5tmttvrpSz
 +ZIIqR+go1J2z2N3ZZIceJzgNnahbqMNJNQll5Gr27AUXLYOzFw==
X-Gm-Gg: ASbGncswPvrFLOABUbUn9vwNOR6uZkk5ENHA5vDl3nRkSJj6uxHsM698SrjcJK7tOLs
 iWxbWxGz4rQWsIQW1CV1VdwkkYq+e4UzAjEMtTIoIixWsY2TwGQPIdpU7WhELCkuugeAH9yhuTb
 nWfeIlBmbAoHkhWweZcGdw8fMGiRl/gs0ckV9fUts7cUcYdWRJW9rywuFEEv3vHbW/CqPgWBXI0
 FeofFxw4NmvBZRWQGKoaj88gWWQKQSGlf4R/+FEhTByWiXHgGr5Pqkm/EpRBGWc7xDaiE3hopAR
 W/ehQoJm7VNtzPqpzi5BrheJYsaLfQeX6Vc8
X-Received: by 2002:a5d:64aa:0:b0:38d:a883:b95b with SMTP id
 ffacd0b85a97d-38da883bad6mr3888550f8f.28.1738693152863; 
 Tue, 04 Feb 2025 10:19:12 -0800 (PST)
X-Received: by 2002:a5d:64aa:0:b0:38d:a883:b95b with SMTP id
 ffacd0b85a97d-38da883bad6mr3888438f8f.28.1738693151054; 
 Tue, 04 Feb 2025 10:19:11 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e49ff278sm956474966b.119.2025.02.04.10.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 10:19:10 -0800 (PST)
Message-ID: <31346ebc-aa7d-45f2-b840-6dc3450983c6@redhat.com>
Date: Tue, 4 Feb 2025 19:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] hw/boards: Rename no_sdcard -> auto_create_sdcard
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250204180746.58357-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xVTunwwfIsYd5XG11qkZfusMr9hH4tSmGyljfYib0SY_1738693154
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 1tr8HqOal5u+

On 04/02/2025 19.07, Philippe Mathieu-Daudé wrote:
> Invert the 'no_sdcard' logic, renaming it as the more explicit
> "auto_create_sdcard". Machines are supposed to create a SD Card
> drive when this flag is set. In many cases it doesn't make much
> sense (as boards don't expose SD Card host controller), but this
> is patch only aims to expose that nonsense; so no logical change
> intended (mechanical patch using gsed).
> 
> Most of the changes are:
> 
>    -    mc->no_sdcard = ON_OFF_AUTO_OFF;
>    +    mc->auto_create_sdcard = true;
> 
> Except in
>   . hw/core/null-machine.c
>   . hw/arm/xilinx_zynq.c
>   . hw/s390x/s390-virtio-ccw.c
> where the disabled option is manually removed (since default):
...
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index dc80181ea43..2d626a96b9b 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -463,11 +463,10 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
>       mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
>       mc->init = zynq_init;
>       mc->max_cpus = ZYNQ_MAX_CPUS;
> -    mc->no_sdcard = ON_OFF_AUTO_ON;
>       mc->ignore_memory_transaction_failures = true;
>       mc->valid_cpu_types = valid_cpu_types;
>       mc->default_ram_id = "zynq.ext_ram";
> -    mc->no_sdcard = ON_OFF_AUTO_OFF;
> +    mc->auto_create_sdcard = true;

That's now wrong, too ... it should get removed (as you say in the patch 
description).

  Thomas

