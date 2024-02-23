Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp725038ejf;
        Fri, 23 Feb 2024 10:01:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbX1sFFCTUp22ZBKYZ2NEmIaptF/mzvhI4lypOM8b7/Qmziek9rAAbZeF85a803EStpOrWVPqdnJhCH1Vs6JtTB1sx11xJ
X-Google-Smtp-Source: AGHT+IFdHJM26Zixieffi6W3jBpb8VINyqklijMH3ivc9uBaI7dSeLUgdDHe1KecmUA3VCvvganM
X-Received: by 2002:a05:620a:22f3:b0:787:9e72:fdb9 with SMTP id p19-20020a05620a22f300b007879e72fdb9mr541460qki.68.1708711308614;
        Fri, 23 Feb 2024 10:01:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708711308; cv=none;
        d=google.com; s=arc-20160816;
        b=BvriTvDURGBzKGhFgmiTyZhmjERJBfNiDlxLVujayVp87KWnc25eF50CNvOvlJBD4e
         v0QWDu8sg/iL96CDycS7JR2CBpMq0WUKIOsz8/sna8VcIOFHbT3sfidpyysokfc8Cl43
         N0FxrpnTFJjGg8td0HBZiAzUvmn9A1xYofMAGxPxHlf0F1febkdw4vEKIglT3cFCOgc8
         +qT0TITenstpAuYdGT9I1N42JC1x3ebt5KgJdALd7kfeeJOPo/HRRg21BLaKEQ/6+G+8
         rlYrerEeCKYqPJh3aW8Pnb+J0hfYQEKZDFRW/udUGIGvBI35yl1giOpYN0hq0SinvCvb
         7grA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Dc0dCMziFbBR5ys92M7RMKGPfrVHJeCpcr0ldbOMoew=;
        fh=/nWUipsP9lTVle34uI+a6+utL/QXw41AIeDIDM6rXMQ=;
        b=q+yWRkzYzwlRgpjPdd+yUdlzAulze77qxBMAYi+b9dYb9ntoGwK/Dub/Je65IKeySW
         8KLsPJXCYXa573EgfucRXUbCoisRpjTUn5ZZvjtUgBZbMWfhZPcTudGFWXOw2cuwHZEs
         DzXCWtFftjvdI6La5qsfbKFXwP68yDzCyqyk8F1ORneNH2coTe+DkRckFULK+shXTTzs
         SDfk+XtfZ0dUZwn/VhG8ymgTrq6a7PrVpI4sKkPyyOUukYyEbrK/5LXFyqsn9m7zfgsR
         wcB2ZVPjuUolsOlGN4sZoPzBQZkMgqDbLrUcba5xitKfVyJjMyD7/vrKbljHI8rNwi37
         i7qg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RqzkwfcO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7-20020a05620a448700b007879b91f029si4595428qkp.497.2024.02.23.10.01.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 10:01:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RqzkwfcO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdZrL-0001RH-Ua; Fri, 23 Feb 2024 13:01:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdZis-0002ig-4H
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 12:52:34 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdZip-0005mT-DZ
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 12:52:33 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41241f64c6bso8682535e9.0
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 09:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708710749; x=1709315549; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dc0dCMziFbBR5ys92M7RMKGPfrVHJeCpcr0ldbOMoew=;
 b=RqzkwfcOoFaUSjGgynYmxS0OFI/tbU05RbmelXtJ00/2YzOFA57w54DGhINX4CHDrN
 8bzdFBDHndApvfbFTcisf1UWlwIqctU94yIAFjPt6qe8mbs8c9jZkRqk81saRbZQlwld
 zidQL/W96Fr+O4GK2CbOffqInJGj+jd0X8sd/EGga0g8mxFm0s/3+aUaaXNUKicVSo8l
 +mEJy3Bso8xw1y3Qssx/7bAcZIAZkIADueVDhcu7Q/amwNUydlVKU1BqUC9ZK1PA4+z3
 E1ujH/kmfHrsUKwg/i0hZIxQNvobbgazDmgIFSXA8WayyqKOI6yFrg4sjEHrYRFEs4u8
 zbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708710749; x=1709315549;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dc0dCMziFbBR5ys92M7RMKGPfrVHJeCpcr0ldbOMoew=;
 b=EortHp3oCAFi4QggPmfNfWLSAU/CbaYKTNGkEmVei65K5Gg2iSJMn7ZKhZsSrUBVVC
 Nnl2pQat3MpHQv+1yoJp5str4rvcxMJn7I4W22009HpoZPfGyLsAQrGftdX2STix91rB
 HcBTJWyIS22h76a2ftg6jPxHqH8RtZAxaPNAbum4lctoH+CUGFuzFZZljQzkabdmSsSB
 uJXgv5RyltXc93AL1+SiMZqUHoGVZUIDbaXJcmh3tbcCt68ZKPJcpSaZ7eiK3m+3e0Ve
 FvQ0O4tQm6DpacIfKF+Dg8BHH/8QAVhYv4+TPlBRWk3FoN5meI7glmELRNv9NfK7YEZn
 2tGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq+UqgnfzKHaIYuwFhPP7NyCNXPz3D0sBsgGbzjd3NqqVKdV7ft/mIzaJMYF2bbUQO1zVeXiiKnhJbTKsnAfkSrGgs
X-Gm-Message-State: AOJu0Yypj+9nSNT4CZFaKCcb1y+i+kH87+BNfQXH/P15BbuALI55zseZ
 TikGcjVRuqdrrGW8m2d7if1pwuyp70Hj4pKfmXNgVkiCej1mzWUSdlo1dN2pRGA=
X-Received: by 2002:a05:600c:548a:b0:412:84d0:6a71 with SMTP id
 iv10-20020a05600c548a00b0041284d06a71mr382393wmb.18.1708710749234; 
 Fri, 23 Feb 2024 09:52:29 -0800 (PST)
Received: from [192.168.69.100] (xbn44-h02-176-184-35-109.dsl.sta.abo.bbox.fr.
 [176.184.35.109]) by smtp.gmail.com with ESMTPSA id
 fm23-20020a05600c0c1700b00412952d3cc6sm2858181wmb.7.2024.02.23.09.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 09:52:28 -0800 (PST)
Message-ID: <26daecfd-4216-4a70-a680-22fe69b42f9b@linaro.org>
Date: Fri, 23 Feb 2024 18:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] hw/intc: Check @errp to handle the error of
 IOAPICCommonClass.realize()
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Fan Ni <fan.ni@samsung.com>,
 Laurent Vivier <laurent@vivier.eu>, Alistair Francis
 <alistair@alistair23.me>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
References: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
 <20240223085653.1255438-8-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240223085653.1255438-8-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: D+MN/Y7ojsyU

On 23/2/24 09:56, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> IOAPICCommonClass implements its own private realize(), and this private
> realize() allows error.
> 
> Since IOAPICCommonClass.realize() returns void, to check the error,
> dereference @errp with ERRP_GUARD().
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> v2:
>   * Add the missing ERRP_GUARD(). (Markus)
>   * Move this single patch into @errp fixing series. (Micheal)
> ---
>   hw/intc/ioapic_common.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

