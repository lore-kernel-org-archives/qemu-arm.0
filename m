Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp715840ejc;
        Thu, 12 Oct 2023 03:56:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdN0Dr0MxSpi/+egWZ0vp0PwWletpKWXb7vfHyFCSei0UKfb8ukouREA/EM6+g9oQFYprn
X-Received: by 2002:ac8:5946:0:b0:412:1fd7:dfa1 with SMTP id 6-20020ac85946000000b004121fd7dfa1mr28458324qtz.8.1697108171870;
        Thu, 12 Oct 2023 03:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697108171; cv=none;
        d=google.com; s=arc-20160816;
        b=0ABmreR7p4KhiGdiNdUTdmNKJnfNG6cX2l8+2GdOAgT43Lf2CP3QtpFj4frIMMowTz
         wQgvzqSXkx4N9N6FNgtiY+5/5lTkDZuDq6jKpVFl5GrVOf62mcLO/fqDC/JZr2ICIus/
         iYDqm1RuDL7k9bKjhIjdJwwmym/5yi2nZ5wsJdvyftn8SDqprK00i78RLiXrjrFXHGOR
         ZjnuSeuzKswgI344w7vF7b1N8aUfxvN0qKSzeKneNLEzCBvpT1L68lxRBqoNqXFI8UWG
         j5+EPUrkUfUF9Fhy9LAYtujmiB92jJ94jaMYMbNsnZ0X7V9EG4nN/qw8jQoXxAKm1LCO
         M3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=y4JVXY+rszzjibCG+bLuHKE9WCYUyjCUNiHVydRQHSw=;
        fh=9Fbu3c4RwbYdzyuL443UmSIjpS4yEA4xfIgGU6z2u3I=;
        b=xeWca6VEgt0gupF9YaHSKEQfP83fIbQvfzOxf7RePAd9V8jCY1ZSB1IQMcsK6Aekzc
         VR4ZU3QvJQkyrkALenj7ZD3XxhsZmv2r+/oaMbG2wvS3SfRhrW6JQQnTSORm14u9N6Y5
         w+mzGfFwA5cpeuXR1nByEZQVcS3C9DeN1dn/gGzP4V75K5JQPgctdsEncrbqt8z7PRPS
         41HS9ajihPjFNR+lX1GoaqOkvZY9uGsBlumNPIHh4bDak6VjgAIUxTXA0dCzZfBYvSGB
         /9l1vbegID5j9b9ykS0xWBUf+LfAt6/jxrbraxUXVi1xh3VJGv4oTH6dKt2LRiUJ42qD
         +7MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zahgp1gT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020ac85841000000b00419894fe568si11171002qth.343.2023.10.12.03.56.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 03:56:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zahgp1gT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqtMC-0004UT-O3; Thu, 12 Oct 2023 06:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qqtM9-0004Su-52
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 06:55:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qqtM7-0006Hb-N6
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 06:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697108150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=y4JVXY+rszzjibCG+bLuHKE9WCYUyjCUNiHVydRQHSw=;
 b=Zahgp1gTTNv7e9C6Fzppn5aLlWyKmkx3gE5jvAydN2ai9HAOGkYvrjTs8JaSpDHBEYlUEw
 jcGC5tFDu81fpFkvW7Popx2OKLylZ33BPf4IWQt6DYtAkf+jCpDZzXSRQRPgoPZiyGnG4Z
 82IdQSyJR2icp+QyGVKqLEEsVOrzsM8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-nqbUqAABN02mAhRNp06k0w-1; Thu, 12 Oct 2023 06:55:49 -0400
X-MC-Unique: nqbUqAABN02mAhRNp06k0w-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-41957273209so8061741cf.3
 for <qemu-arm@nongnu.org>; Thu, 12 Oct 2023 03:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697108148; x=1697712948;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y4JVXY+rszzjibCG+bLuHKE9WCYUyjCUNiHVydRQHSw=;
 b=b3tIl4dC6XX6nl5oKgwxCLvVsbsq+mRDhYeau8CD71cXVRnecOkNc55fT/RUgCHIlz
 SPm/jOsRCs7alAGzVmyxt4JZYC3divoBNjJQdfU4GLm+QOTxylAUM3nOmE65YAhrXMoy
 ZTJISsjLRvTeMCj/+xsnW4BeSOnosIyBUbJ4Xi9lJ+voH2b+WpvUZf9xbE5sQNXItz++
 +3o/6L3DIj0ZiRrVJJN/paaBKbEH3DrxZgPM8j6RQnaYdwOMQaaf58GUFP3RxIGy0FpB
 9NAIyCYWQ9T4m1bnvynG/brt4qcbT4bOQrqWB11hV4fmi56ZJYWbnrV0FeaGnKlb6nPP
 EzUw==
X-Gm-Message-State: AOJu0YzscjTU8HRwqxOH3i4yOQiDNrx6cNmPc5ngiWYJ5IEzysy7y91W
 tUqTLeIHzgZAlP2dWLTdH7qC2jQU/9G/6X0hRFOJTuNKJwFcBT58VYcwJo33CEd5aLcMluNOVxH
 rIt604jkBJUqT
X-Received: by 2002:ac8:5b4b:0:b0:419:529e:dcee with SMTP id
 n11-20020ac85b4b000000b00419529edceemr29135522qtw.50.1697108148479; 
 Thu, 12 Oct 2023 03:55:48 -0700 (PDT)
X-Received: by 2002:ac8:5b4b:0:b0:419:529e:dcee with SMTP id
 n11-20020ac85b4b000000b00419529edceemr29135506qtw.50.1697108148222; 
 Thu, 12 Oct 2023 03:55:48 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-176.web.vodafone.de.
 [109.43.176.176]) by smtp.gmail.com with ESMTPSA id
 h4-20020ac85044000000b004180fb5c6adsm6069315qtm.25.2023.10.12.03.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 03:55:47 -0700 (PDT)
Message-ID: <1f6a6f32-80aa-4a7f-9e33-72d1ca9984dd@redhat.com>
Date: Thu, 12 Oct 2023 12:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: Move raspberrypi-fw-defs.h to the include/hw/arm/
 folder
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20231012073458.860187-1-thuth@redhat.com>
 <788f54e1-3f2f-f24d-63cf-172efc605823@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <788f54e1-3f2f-f24d-63cf-172efc605823@linaro.org>
X-Mimecast-Spam-Score: 0
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: KFWUEyj4d252

On 12/10/2023 10.22, Philippe Mathieu-Daudé wrote:
> On 12/10/23 09:34, Thomas Huth wrote:
>> The file is obviously related to the raspberrypi machine, so
>> it should reside in hw/arm/ instead of hw/misc/.
> 
> Not quite. These are the VideoCore DSP definitions. Firmware
> running on SoC including a VC can use this syscall-like interface.
> 
> FWIW there are a pair of QEMU VC implementations on GitHub.
> 
> Anyhow, preferably rewording the description,

So could you suggest a different wording instead? It's still "related to the 
raspberypi machine", isn't it?

> Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>

  Thanks,
   Thomas


