Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp400614njb;
        Tue, 4 Feb 2025 10:17:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUwthoXgXZ8yd3zsihUi9vYG2GBKLH71DHMTHBJXuLsuNKLenZguNaJCvhyHGlgyL8aE3ILehVe3005CQ==@linaro.org
X-Google-Smtp-Source: AGHT+IELs9avk77HpLNN5mpubfT6MoFEEYwJhCM0nE16x2mY3havaG0ekJcZQwtGhzqwpFdAAAZb
X-Received: by 2002:a05:622a:261b:b0:467:8630:584f with SMTP id d75a77b69052e-46fd0b918abmr408384091cf.36.1738693048738;
        Tue, 04 Feb 2025 10:17:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738693048; cv=none;
        d=google.com; s=arc-20240605;
        b=NuG91ciySgqYfvhg1P5SICwjkl0F2Itut4j+o6iguiArmXdhWKsFHn9vYDjZHTtLe0
         EjyJQNIAhRUNxsP8/m0uTJ2VWTV+A/fnI/6FPKuZUubtynJ/jYKgRJVzkyNfBW4AiKrP
         hB4DGOEUKXJJc3pTwavukMIdjktlGLTcF+cZ+0ddjBTHm7oqE7N6MQE+mMArD3TZvfkT
         xryJ/5cYuRYgaftpKO47tuIMZ/g7RlEoBaiVVcQz0YL8wCheyKazvzlaB6zMTWV5a6oN
         PwwQjM+hHPMiB7z8fCGN5RStvl1MtbCLejrarbQwALaymcTllb++ekrKeX6MxMAf7bqO
         6oag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=dxEy0E6KZF4fY89Y0kh3AOoKSXRhbtiOt8I8jlSzR5k=;
        fh=d/j7sR4Rbav4XRcOu/hv3icRSH9z52STrIqiZZqHw0E=;
        b=bWo40te2iznqdGPpgkls6cQTu+MWckLk7OZBQCeodGAldqSXmlyvYMsP36ndXlko4f
         /Qd8pTLAZzNrzSpp5g7oV/u8IbLFj/Khg8tktknEaN/74Cz/9F4qUwKBAEAtJhdTf+TP
         rFdBAO87QKavYdTTeBh5clKUrC4xrJfKssS4EJiXKnoOBMXpjlPLz2srZDy+3ny0w/KN
         wl2KjbqomsM8X08cQNFPyIz0HIlrXJDmJPXMrSms4Bk4hW40MeMXybuDAsjvgWvr87l4
         j2soXd+uKY04onSt+KG+s25O/H1aVrUSOGLC391JtOkpeqoBMF+FLJ4xfO3mDeYR4C0r
         b4iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bNFPUIJy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016bab2acsi34145851cf.416.2025.02.04.10.17.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:17:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bNFPUIJy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfNTa-0006rL-Dc; Tue, 04 Feb 2025 13:16:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfNTX-0006p1-Lf
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:16:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfNTW-0008NQ-2B
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738693000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dxEy0E6KZF4fY89Y0kh3AOoKSXRhbtiOt8I8jlSzR5k=;
 b=bNFPUIJyLj03JAacyUD7FKeO6ouwe4nk2dplY5NA1jSBOytoTqaTJjObsarCT7aR+3NVu0
 v0MyJya0rBTs17OmypnTOVAbw1mbx27B1wQdx0p6OH3Xl15tT0gNZiZIFfbkYPb61INNZf
 zaAyD2SySs4fc5uRRiQbtXLrH9HLM7k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-P0SQeSSOPWWbI_w4EDceAQ-1; Tue, 04 Feb 2025 13:16:38 -0500
X-MC-Unique: P0SQeSSOPWWbI_w4EDceAQ-1
X-Mimecast-MFC-AGG-ID: P0SQeSSOPWWbI_w4EDceAQ
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5dcd3da2aa6so437360a12.2
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 10:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692997; x=1739297797;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dxEy0E6KZF4fY89Y0kh3AOoKSXRhbtiOt8I8jlSzR5k=;
 b=YMYNwCXLjT7dM1r9cZIQU/PXvDS6wWrJ9On45AR+or+GPk48hCRR9j/IPwI1ABQ3wv
 TrCH+PeFGzsFmk8y1t82+SDLmRyE1PQ+X3XD3EWuKDjaq+tz+LhwfQEsJEsqQVlEiVwX
 idniNZdV3qbN04oSWLXAvMDJtaF/C1HUrW0SE+1tJiNw45+Al5iH0rO2IuBLy5CV9iEe
 DKqmC1mByoYsNcWpGdGjc/hRCXBSfuAt2uiX0K2VmYAdPCIHV+XODSl5xQuRL6lzYN0X
 djdDtL+/L6Wi8rp2Nss+MNquRgJQ9yNPRy5sObMORRmkolfPD/Dx7BAAh/mUFXyRydys
 4OGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRsSzbpcT/WqmOwuKzrzK/+q+9cHVqAoS6PmVM1SfDGh3mQuCm4H8QOEuE9QrmhWhkYkbB2JPg8g==@nongnu.org
X-Gm-Message-State: AOJu0Yz00EGp2vSfQKJH1f6AuTnHcs1M5eT+N3V8Rz1twlycU20Dk5+V
 D0WXghPIPyv7JzXjwL1NjVoHgafuCDyenu2b9xzzbkf/3fstFxxoSb6zjUkcHfX6t/pxF3rkH19
 H59uz/9YDpDwDVe/hPdlch1PUClfqfh6E8pUMDjc22+tQjw+BSA==
X-Gm-Gg: ASbGncveDhPpYMMBAPSWj7Z89nX+RpU0Q9mIthvIZA9AqsNzK3ccAi9VR41C29qpZKk
 hqbXwAx+Mpeg27UXH/Z2poSzvKsnrnN9q40fPqKwgKHa0EC96fPNAsK7NrmH8YErkVjjWQTbRTe
 vzNVIrSZAm6qgwmIHxDKrTp+0KGCHMSe69OaNQ1yWinz7tWxm0zd2o8krDXBVigwyKHaWVWz+Xa
 tbD4kyNj4dXICfgptyHRiMGsfJK6M/0+Qky64ANAtCPDWP5SyegI1aqlsAazgalWyR6hg74IDB9
 3xtngdTruLeMliiXzW8XuN3U1bgdmBuFgyuc
X-Received: by 2002:a05:6402:2687:b0:5dc:db28:6afc with SMTP id
 4fb4d7f45d1cf-5dcdb57fb04mr79137a12.0.1738692997523; 
 Tue, 04 Feb 2025 10:16:37 -0800 (PST)
X-Received: by 2002:a05:6402:2687:b0:5dc:db28:6afc with SMTP id
 4fb4d7f45d1cf-5dcdb57fb04mr79114a12.0.1738692997196; 
 Tue, 04 Feb 2025 10:16:37 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcda03eaecsm214335a12.49.2025.02.04.10.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 10:16:36 -0800 (PST)
Message-ID: <42950b71-264c-48e2-96d1-5ce4d0990e64@redhat.com>
Date: Tue, 4 Feb 2025 19:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] hw/boards: Explicit no_sdcard=false as
 ON_OFF_AUTO_OFF
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250204180746.58357-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LvXbisXWzmbnkUc3E10VVak69rBlE6K1W9GLmDvt0ZI_1738692997
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
X-TUID: g6F006ekRxLk

On 04/02/2025 19.07, Philippe Mathieu-Daudé wrote:
> Update MachineClass::no_sdcard default implicit AUTO
> initialization to explicit OFF. This flag is consumed
> in system/vl.c::qemu_disable_default_devices(). Use
> this place to assert we don't have anymore AUTO state.
> 
> In hw/ppc/e500.c we add the ppce500_machine_class_init()
> method to initialize once all the inherited classes.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
...
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 12418094f9d..dc80181ea43 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -467,6 +467,7 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
>       mc->ignore_memory_transaction_failures = true;
>       mc->valid_cpu_types = valid_cpu_types;
>       mc->default_ram_id = "zynq.ext_ram";
> +    mc->no_sdcard = ON_OFF_AUTO_OFF;
>       prop = object_class_property_add_str(oc, "boot-mode", NULL,
>                                            zynq_set_boot_mode);
>       object_class_property_set_description(oc, "boot-mode",

This hunk seems to be wrong since the previous patch already sets no_sdcard 
to ON here?

  Thomas

