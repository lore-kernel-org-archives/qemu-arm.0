Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2260718njb;
        Mon, 21 Oct 2024 03:05:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWfVfOf65sHSHucaR9w4NGZ2F9ka3RJCjKplr/Eb4Kqvaqt+VK2RYyA7WrdmwR5EPrKBvUdKzhWPQl0IA==@linaro.org
X-Google-Smtp-Source: AGHT+IERctLRiLN3/ugs69zvgxfBw0oogiqaBDXSM6tLAkg7jmG4h3tXPavEZgTgZI2WEcgCxDon
X-Received: by 2002:a05:6808:2e4c:b0:3e6:500:8033 with SMTP id 5614622812f47-3e6050080a6mr9950599b6e.36.1729505132766;
        Mon, 21 Oct 2024 03:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729505132; cv=none;
        d=google.com; s=arc-20240605;
        b=P0nIbbkBwD6yoAayYxwsRxv5FfQ7XwNF08FzJjclsFG2296/4j4hWwlPz3Ra37qcn4
         ttb3dLBTQ0yaCDvsnZoYP1oDELs5sglAr1ZzcCiCu1g12WEq3ro2ALkicqczyrFE04Gd
         kOZXVAIkIgs03tz9OCdhsdgC4gfTjmrdAP5G57p1mMS127QRj8SAlk7yjRn4tf/mvbbx
         9I7jzdPQYpmaxYOVtaLQtRtdLf8MK7urXgQb2/vhHKM3flqWZ5ynTdMNiI38F305KzI2
         wXGCxaoYbp5Db/BLMEmHZR9Rf5WAmRrbONAkl0X5fDfKBLf4e++R5f9Rsdg/c0YlLf5D
         761A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=lCQ7QD74XHEnVsryUCvmKvPJna4l4bQ79tfM/O8aW+4=;
        fh=8j4hkbS9cjzweF5wgI90O/O285pjTMyS/ah0r9aAU8U=;
        b=NdmpZdrArDKLRanM6annJhufgFoyXkMLR3Sj5bIedozGKcRWMSRCfk2UeAOQH96rC4
         wSQ0q/w/2HjEgLjRIsgodeo36d69Kv9NoEwP/4pKexQCrWbHsw8HTTEQuRF7ef9YcL4l
         XMkz7/hG/9xb8IcNT1Ky2hPo310fv9Viq+rBZlYxmvc3Y2kVFha2oGm7Oro+KUTWcPUh
         yPzl4GINmumXN+wLmHdobXAm9PF3zt+SbZRh+Sj4+KPHvDP+RD1t0nIxg5uKEHwGDDQO
         OUjQ5fG+/GfZ6KDf9DNL4phDd3lzwY30URlh7bq8kQN3Pl0lyyeJXgzLu3Gwt64FsNGn
         mhZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qx3HFe78;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3d4a5basi35636391cf.614.2024.10.21.03.05.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 03:05:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qx3HFe78;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2pHe-0003Z1-Nf; Mon, 21 Oct 2024 06:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t2pHZ-0003VT-3g
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 06:05:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t2pHT-0006Qx-7z
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 06:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729505093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lCQ7QD74XHEnVsryUCvmKvPJna4l4bQ79tfM/O8aW+4=;
 b=Qx3HFe78BFxJHfoXInuwBUjIkJ9YMvYmpD+Aj4DoKBp75rspEMPoRXFTnRvmmVbVTsuqfJ
 HA9IwP+ZIcTOHSzZsXq+qQAVEKQxOxS1teQqIMWy4jyB0vp9truqpwzBe8v/09KsPIIpY7
 lnZDoZ0pXyMX6okjjN5C4fJXxb+hG68=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-HtwpU4cfOZe227hwCPI4OA-1; Mon, 21 Oct 2024 06:04:51 -0400
X-MC-Unique: HtwpU4cfOZe227hwCPI4OA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42ac185e26cso34907675e9.3
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2024 03:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729505091; x=1730109891;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lCQ7QD74XHEnVsryUCvmKvPJna4l4bQ79tfM/O8aW+4=;
 b=Jra+NylX1F6fHDOqXK0aIJaXRQmxyqCtB/dkOw4rIJAGhF3I5C6wipTrvLHfu6amKu
 VlclKmDKjszIDAxPRk/wFNNZ91SgmfMIUkfy4Cr9/rrBdbRoIXndOuS6ZLw/898jhIZg
 jx+s3CKBGpLkkimGV9CyCxFvJmcshBQHc0eZIODQ8TvQetGPBEE9wTNt/LeDQm5MxfFT
 QX7fKPX11Y0QN0RDL40ZYPzUR9hTpuuKYDpqV1mPyIe8WzIfuEOWt4KYAdF5j+98lxR0
 tbqrzJB3xaLVH9BgyKu4Rh8waOO7FPScZDim0MK+ZE4UVsw0gBLy5QUhD1E1ci1mKDks
 dOVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjjsgDnDtmMPUIHfMc97b1uhrv3YSODSVxIiKG7uE/xEv5gGHsZ9wrnRlBz85jzz8XE5Qxqc14Nw==@nongnu.org
X-Gm-Message-State: AOJu0YxrAZbKLd48xBKftVj74GSHcjODMBgaf0Ve5rSNrBOwHlN/l6yW
 mat8b1asMYkJgAX/JCS63ru16Pc8we6ASV49TUWsNDwsme/qA1yOXrQ5e7OgtGLblIcCbpy+UBn
 YN6OaTpPUcSD5JLsLIPZnVLPE1IGpxlHOx4ekzIa2PA0fWb9vcw==
X-Received: by 2002:a05:600c:4f09:b0:42c:c28c:e477 with SMTP id
 5b1f17b1804b1-43161697686mr85623175e9.23.1729505090798; 
 Mon, 21 Oct 2024 03:04:50 -0700 (PDT)
X-Received: by 2002:a05:600c:4f09:b0:42c:c28c:e477 with SMTP id
 5b1f17b1804b1-43161697686mr85622905e9.23.1729505090395; 
 Mon, 21 Oct 2024 03:04:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:165:d60:bbdd:3c5e:7d8b:3f72?
 ([2a01:e0a:165:d60:bbdd:3c5e:7d8b:3f72])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5c2b46sm51918515e9.36.2024.10.21.03.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 03:04:49 -0700 (PDT)
Message-ID: <bd2275c0-fb89-4898-9fe1-ada795e79ef3@redhat.com>
Date: Mon, 21 Oct 2024 12:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tests/functional: Convert most Aspeed machine tests
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20241018071726.2723934-1-clg@redhat.com>
 <f1249e0b-290e-4416-a776-3f5d6ada1ece@redhat.com>
 <341dff70-d0bc-432b-8764-8cb9b1aba1eb@redhat.com>
 <ZxYjN6T2T9Dqnpz8@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <ZxYjN6T2T9Dqnpz8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.527,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.699,
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
X-TUID: grP3oMlAsvKu

On 10/21/24 11:47, Daniel P. Berrangé wrote:
> On Mon, Oct 21, 2024 at 11:31:03AM +0200, Cédric Le Goater wrote:
>> Hello Thomas,
>>
>>
>> On 10/21/24 10:53, Thomas Huth wrote:
>>> On 18/10/2024 09.17, Cédric Le Goater wrote:
>>>> This is a simple conversion of the tests with some cleanups and
>>>> adjustments to match the new test framework. Replace the zephyr image
>>>> MD5 hashes with SHA256 hashes while at it.
>>>>
>>>> The SDK tests depend on a ssh class from avocado.utils which is
>>>> difficult to replace. To be addressed separately.
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>>> ---
>>>
>>>    Hi Cédric,
>>>
>>> I'm seeing errors when I try to run "make check-functional" with this patch multiple times, e.g.:
>>>
>>>     File "/home/thuth/devel/qemu/tests/functional/test_arm_aspeed.py", line 111, in test_arm_ast2400_palmetto_openbmc_v2_9_0
>>>       image_path = self.ASSET_PALMETTO_FLASH.fetch()
>>>                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>     File "/home/thuth/devel/qemu/tests/functional/qemu_test/asset.py", line 104, in fetch
>>>       raise Exception("Asset cache is invalid and downloads disabled")
>>> Exception: Asset cache is invalid and downloads disabled
>>>
>>> Could it be that the tests alter the file in the download cache?
>>
>> yes. the flash image is updated by Linux. I don't reproduce the issue
>> on my build though. Are you using special options ?
> 
> NB, this would only happen if invoked via 'make check-functional' as
> that has the logic to run asset downloads seprately from the tests.
> If you were just directly invoking the test program you wouldn't see
> this error message, as it'll just re-download.
> 
> You would have to run the test twice too I guess, first time downloads
> and modifies the image, second time sees the modified image and
> complains.

.cache/qemu/download/3e13bbbc28e424865dc42f35ad672b10f2e82cdb11846bb28fa625b48beafd0d

is indeed updated. check-functional-arm doesn't complain (which I was using),
check-functional does complain.
  
I will add '-snapshot' to the machine options.

Thanks,

C.


