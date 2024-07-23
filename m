Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2230270njc;
        Mon, 22 Jul 2024 18:17:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlp+wJzX8P6JrRUUN0T2ZWhRHuUIRo0w3hygRvLZAs+INwqA/7CiJZ+MP51ja06HLvCAswWuxlsp6OyVHW8ZTJlykr7pBu
X-Google-Smtp-Source: AGHT+IGJo2kh4MLBwVEJ+0jCFh9b/66H7DUfRD2qROEN8F/6iyuCZBjyQZGddT+jfn7NuBV5rL3/
X-Received: by 2002:a05:622a:296:b0:43f:edde:7a55 with SMTP id d75a77b69052e-44fa52a0a24mr101441811cf.28.1721697465952;
        Mon, 22 Jul 2024 18:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721697465; cv=none;
        d=google.com; s=arc-20160816;
        b=s5pyGda+BV9wsiq4nqUe9DZS/Yx57ipXZyA721DncBzTgEGkSBP0qCrn4IsOSLnqx5
         8g+ebJt/76o+PB/mCtkjGWqY1TEMuOqvy545I/S1GlrxbSSC2vLUoV1FIIYdauJFFGSl
         hlSrhOLFexliykJlVfOCYxm14bSSw/PXQ+6QsXC+ihJBYqnkJP/rML+zxBEmtxMxc01i
         1w2+tuyayrm8LGCjKm/JMZU3jqqF4O9DqNj5uAvVv4n/+mmeN+sARCIS5NVMnPcJq2x7
         +KgdUC8TI4038Abs0SSTw6vihQV9OQDkIsJ4+QYZXi2FbiIqC7MOX90AckqZUgS15cCE
         77Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/qTKaOqetYPf18hLuVZzsRY2daa8pNhGsB9HKubNyZY=;
        fh=cvvCK75E7Az/oaydS1m4waiKKVYEjQH3PdSkZKGBn6Y=;
        b=OUkYbC+0qEKXW63ZdxMZ+HmYDthUerNfjv3xK34J3QYsREJAfqbQUwrX+cMYED8d5g
         d28+K8OOjtubZIBAsXPpq0YwnSAwwhjJdlrC2L4lrpIHbd6wSiGUf85gaHov2S8X+kiO
         b6+UpTv1jYbwPyPK+KzUken2gFF5TdMUGjAgKxVuZSCodWDx2yoR3MYNyWOgIMfXTcIR
         YHyP/igkmCGpt1MMTO3JsWYdRKf9tMWAV35LVOWFoVWAEzvTgUue8IBAn30PjJ5FBc9R
         Gj8UZtzpOGdJ7m7UfXLuFN5drL55w/n6Uf6d93nDiDk99rwkwS1tG17d5/XXuZvip5Ys
         q+5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OogchreH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ce01a54si94663121cf.576.2024.07.22.18.17.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 18:17:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OogchreH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW49k-0000bB-Uz; Mon, 22 Jul 2024 21:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW49Q-0007eQ-G7
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 21:17:13 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW49O-0002Li-58
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 21:17:11 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1fc5296e214so37964665ad.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 18:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721697428; x=1722302228; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/qTKaOqetYPf18hLuVZzsRY2daa8pNhGsB9HKubNyZY=;
 b=OogchreHiG2i0fLHeSjxFpQRy0cnPCFpy+MNZ+6GsYTy0WL6XMsXA09lkUZNlm3vWY
 vGWin19HnfGATKGkS6k+/aD32SXNxvR/s/fjt99VQj59RPl+Pf9uOggYb0h2cGD1keog
 En9lLtn4eFWEuzMubFdcvZ8ye3nUpsM8qgtQikb2msOXMz89R47sdvJbLS6h6/KTZ9Tx
 cqeNmPAJQwK5WHkMD/wqxGamhKl8Nqjmv/hJjlnpHQUexoRZi5QFX0KQO7PUCa/GGGo2
 aqYSnVo9HI2X1FOKizokack7A32yMVVDjq/Qse40qI8m3qvCs1LF3HoHmXk7mzPISBTr
 Pxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721697428; x=1722302228;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/qTKaOqetYPf18hLuVZzsRY2daa8pNhGsB9HKubNyZY=;
 b=qNqLqGv8o+9u46ELjSwl6em/5A2/368d4sLK5LSqko9TOta2Z/zM3Sq5FNwrPTeXPx
 fwwR/G6XHdszD2rnwCgitOf1JpXpQKLk6c+e8hkK5caB6DMe7wXDBY5kdQW9u3TBF1Vd
 fWCq7FnnQq8xvvbaHvfOtRQglqDxF+TgGyxdzQ5kFrD7XvEssaXyFRuOnl4XxcG56l4i
 IT3YaHtl3Xt9uvPaCmxqjUrNVi+mWi9xDRAxM0zBzM10FUfkTj0K6rR/Ip7INl1m89Hs
 yAXaU26gJjWon+NLxM9s45nRkJzPOfiCvabyU9KZO8DWCrH6ss8hoJ0bc/gFmXo/hlKp
 AbYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuWhyfzmsvFWzw44MPSPyGoxZal6/aOGNlUJKG25/Pi+KLU/Fbrt8Ze9ghYtlkqCZ2kZoA+VpvXnpmL55hUkABlK+g
X-Gm-Message-State: AOJu0YwwYJbMuSVuKDUQYq6KQKhTrF++2+TZHtutU2QTGwddfam7M6bB
 Qby4A1cY/ed7IrNzKLy/uDRXoguMhvViXyNr1V8F05wlOL/2/3uCiH6C/qK+Od0=
X-Received: by 2002:a17:902:d48d:b0:1fd:82ac:7c2e with SMTP id
 d9443c01a7336-1fd82ac8886mr97646385ad.25.1721697428292; 
 Mon, 22 Jul 2024 18:17:08 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f25bfedsm63658935ad.48.2024.07.22.18.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 18:17:07 -0700 (PDT)
Message-ID: <0b7514dc-f9ed-4c48-be37-5a5de7b26229@linaro.org>
Date: Tue, 23 Jul 2024 11:17:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] bsd-user: Add aarch64 build to tree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-15-imp@bsdimp.com>
 <f3c9d0c0-1cfd-46c8-8524-cffbe5180d3f@linaro.org>
 <CANCZdfpPrjt8G5WWRPdMNWyb=hskk7ZCVS3HEAcway=XO=K3ng@mail.gmail.com>
 <f2f6c27e-7625-471f-b888-0f3a870bb0c4@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f2f6c27e-7625-471f-b888-0f3a870bb0c4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KGfjWGcZPdpX

On 7/23/24 08:11, Philippe Mathieu-Daudé wrote:
> On 23/7/24 00:06, Warner Losh wrote:
>>
>>
>> On Mon, Jul 22, 2024 at 3:54 PM Philippe Mathieu-Daudé <philmd@linaro.org 
>> <mailto:philmd@linaro.org>> wrote:
>>
>>     Hi Warner,
>>
>>     On 22/7/24 23:43, Warner Losh wrote:
>>      > Add the aarch64 bsd-user fragments needed to build the new
>>     aarch64 code.
>>      >
>>      > Signed-off-by: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
>>      > ---
>>      >   configs/targets/aarch64-bsd-user.mak | 3 +++
>>      >   1 file changed, 3 insertions(+)
>>      >   create mode 100644 configs/targets/aarch64-bsd-user.mak
>>
>>     Can we build aarch64 on Cirrus-CI? (not clear on
>>     https://cirrus-ci.org/guide/FreeBSD/
>>     <https://cirrus-ci.org/guide/FreeBSD/>). If so, could you add
>>     a follow-up patch to build that on our CI, patching
>>     .gitlab-ci.d/cirrus.yml?
>>
>>
>> We can build aarch64 host for bsd-user for sure. I'll see if we can do it in cirrus CI.
>> If so, I'll try to add it to cirrus.yml.
>>
>> This patch series adds aarch64 guest...
> 
> Yes, we want to use a aarch64 FreeBSD host to build your FreeBSD
> aarch64 bsd-user guest and test it. Am I wrong?
> 

This is adding guest support, so your suggestion is orthogonal.


r~
