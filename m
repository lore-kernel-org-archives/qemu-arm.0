Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1047543ejb;
        Thu, 7 Mar 2024 02:22:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXWCE3EEK+XPIDqHMMmEPleBcguYn/I6D6kLBl3Co4c/D7k4I1+h61peRGdobVX+e7BF6sVbhMLA9Cs9gdhMtjtuy0CiBPR
X-Google-Smtp-Source: AGHT+IEd9nOllqlERLJi6elZZRT0xbQ4TLLHF5Ia41fIyTLkkimQ/jK5YAuOFH/JG7dqJz+xadCW
X-Received: by 2002:a05:622a:48f:b0:42e:be5c:93b3 with SMTP id p15-20020a05622a048f00b0042ebe5c93b3mr9077256qtx.56.1709806957738;
        Thu, 07 Mar 2024 02:22:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709806957; cv=none;
        d=google.com; s=arc-20160816;
        b=yp2YEqfO/Mu2bRjHrcHv7Da73VbtASLaSOQW0KRrSbBbeJsU5EALV8BFFw0DJrF3L+
         KPkRfDDdfZUoNM4bKn+Ru2dOVjL2SCsgwQEwqMRhw23f/dRu1/f8B53bqNmR41QOkLYE
         AkREo9cHU5QYnrUujwHT9O55xIt2h15QJsZUGRJ+PT1qGjWqYwO9s05k9JxxAghN4dwo
         k7/XUEjK9vjHdERs50aVc+lc9xHqKTmWGK5p2AOX4ZZe0awQFeBWXzPFrLSbUJew4/L3
         wxeYyJB/pAJfNT4MY1YQwOqjqYWGOETTdq4ST0vYd2A7Gl6m5cs+BbVy5y7aGYNMZi0N
         o4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ufP5Es4sPtuAnhqjx+zsVTbp4J0z//3jgbKXkTq58Ic=;
        fh=SORuPAZ7Adz2O2wWGV41ajcTntKIXaTZH75Z1YS95ts=;
        b=m965FE+oxUXl7rfyVVw9zCAOZfbNtMiyOaaUa4TaxAobxA5TSIGt6CAkPnXUMtFE0L
         lxgfCcUQgcr4DrBcd8Xj7qaQ/6xobieYS4jifDo7po5K8SD327JA+wxgmDbgZWGNYBR2
         VlVfsmyKWVReF4NLmlisdj4NyaKQVDWGvQqdfLfUkr7mmH7R6yVrEuZ5Efx2vLUkmk8W
         f3ltR/t56iaIfdNEXByutWQpnjLsLKZON4lsnazMJLENzW0WgRgZfRf4cA3XMs2FWyne
         pziP8kXpSxOuoOO1v2nnTVN1hG8FUkb10KZlAc3C+4+BfQ1yPd1CPcsAgtyut3Uwf5EM
         XRug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UJWg1UNY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11-20020a05622a164b00b0042f18eaa2d0si1457549qtj.778.2024.03.07.02.22.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2024 02:22:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UJWg1UNY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1riAt2-0005wY-HA; Thu, 07 Mar 2024 05:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1riAst-0005dr-IC
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 05:21:57 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1riAsr-0007FO-F0
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 05:21:55 -0500
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so9006351fa.1
 for <qemu-arm@nongnu.org>; Thu, 07 Mar 2024 02:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709806911; x=1710411711; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ufP5Es4sPtuAnhqjx+zsVTbp4J0z//3jgbKXkTq58Ic=;
 b=UJWg1UNYnw/lZwotnkTv58uI+rGCBF6BfBMi4QyBQ4lRxEsgCEIUn0Ctc3/gC0KMyM
 pEiEZf4qr9IaxwRSnrP7H+Nxoc7HoMNhTYcVulLjHbKfDCVxOVv+53xne+qtpzRC7x6B
 +R76J+H+tHdT8vEyJLy0p0+VV6S7Q4+0WiuZtoOk/+VeR7Ouz5IY30CgmkbVHY+sdA/W
 c2FpECp58y7aI6S6Hp470DKtodK040aj/jzaVCnGEwTCAyyu1uV0xDD3BM9Vc6fkqK/O
 YMk+SP/uBYNtfIZh9zUsMVqT+iUNZA4+xjMVGKWCLeaQKIr3IyHvhooqCCaPocepyQbJ
 c6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709806911; x=1710411711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ufP5Es4sPtuAnhqjx+zsVTbp4J0z//3jgbKXkTq58Ic=;
 b=DHNDKSusEOnZta5dgfKkJTUpXKwLzdTVLyTrUEP5TEGuSu52xnA2GOd1e2jHmYToDI
 425arncOACRsNQNl+8TNwmuG/Dx7AObIh1iV98QiTh1b+2mbSZCQeLQXI5UT1U+UUTHU
 uAHjPHNuUWdk/UKG9hTK1MKLrgFp+dh0Mko1F4gPuPYhILs6wCM6F7G2j7zaN5KDZ4eo
 SCs7veo7d3Wak7B53hzC0iG5kqo5vp3C6bdzGx80BM5zSVHsfPf/3Yc+dIA8sbzkz6jX
 7sLFyAT+Cn7s36id+6U97gSo0Rc9lQZXJZ+OBODQNqUPxrnMT3KbDGJQbTJqTyLDe0zg
 V3/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXI5yzvDeEBj3eCbCWo5F7dxfGTaHbmA5V5VuQ68y0W5W0AIlo94t3pABum+y7za8NbXDQqZ64n0dz0qb+lIu1sY4L
X-Gm-Message-State: AOJu0YxoyhD5rEDIH/P0Fe8xlwNeeyITPfXhC8xEpgRsShrf5kKBls2d
 bk3XQA1+1on7VnYHzJJlt0whbXSvULUW/wZgHLrBjhYqr9gBj70M4JqPu4OwLoQ=
X-Received: by 2002:a2e:2e09:0:b0:2d2:45e0:f154 with SMTP id
 u9-20020a2e2e09000000b002d245e0f154mr1112162lju.26.1709806911517; 
 Thu, 07 Mar 2024 02:21:51 -0800 (PST)
Received: from [192.168.69.100] (vau06-h02-176-184-43-100.dsl.sta.abo.bbox.fr.
 [176.184.43.100]) by smtp.gmail.com with ESMTPSA id
 az7-20020adfe187000000b0033e433cb471sm4104471wrb.79.2024.03.07.02.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 02:21:51 -0800 (PST)
Message-ID: <d0ae5297-08ff-4f91-9ddb-0ae7acdc8748@linaro.org>
Date: Thu, 7 Mar 2024 11:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/9] qemu-options.hx: Document the virtio-iommu-pci
 granule option
Content-Language: en-US
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
References: <20240306203348.65776-1-eric.auger@redhat.com>
 <20240306203348.65776-5-eric.auger@redhat.com>
 <fcaf95d2-bb09-4c55-a333-21a93a707ad2@linaro.org>
 <07478583-ce74-4de3-8983-010c6617e4a8@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <07478583-ce74-4de3-8983-010c6617e4a8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8W6+yee1K7BD

On 7/3/24 08:32, Eric Auger wrote:
> Hi Philippe,
> 
> On 3/6/24 21:44, Philippe Mathieu-Daudé wrote:
>> On 6/3/24 21:32, Eric Auger wrote:
>>> We are missing an entry for the virtio-iommu-pci device. Add the
>>> information on which machine it is currently supported and document
>>> the new granule option.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>    qemu-options.hx | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 9a47385c15..757df3eac0 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -1172,6 +1172,14 @@ SRST
>>>        Please also refer to the wiki page for general scenarios of VT-d
>>>        emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
>>>    +``-device virtio-iommu-pci[,option=...]``
>>> +    This is only supported by ``-machine q35`` and ``-machine virt``.
>>
>> Don't we need to precise x86 and arm here?
> Well I got inspired of intel_iommu doc. I think this is sufficiently
> precise, no?

Apparently not:

$ git grep -w '"virt"' hw
hw/arm/virt.c:96:            mc->alias = "virt"; \
hw/m68k/virt.c:314:    .name       = MACHINE_TYPE_NAME("virt"),
hw/openrisc/virt.c:37:#define TYPE_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
hw/riscv/virt.c:1754:    .name       = MACHINE_TYPE_NAME("virt"),
hw/xtensa/virt.c:127:DEFINE_MACHINE("virt", xtensa_virt_machine_init)
