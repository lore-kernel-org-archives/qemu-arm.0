Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2262505njb;
        Mon, 10 Feb 2025 14:49:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUSnFiQpigC/KBikGgb8r8QaEL0e3yoK4ztT8X/cGH2hgltjG5GhJlmFyyZ34vl+gr3wtki8cq411FWzQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHB0N5uDfE65HJJGi2HzcnKhnhlI483rc4ijVXIyd58MAW3p3GkXAyI3TL4yOnkcHkj84K9
X-Received: by 2002:a05:6214:1d24:b0:6d8:aeda:dd93 with SMTP id 6a1803df08f44-6e4456ffe18mr221010976d6.39.1739227741596;
        Mon, 10 Feb 2025 14:49:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739227741; cv=none;
        d=google.com; s=arc-20240605;
        b=Z+sV50n6Com2LR72CxZOYbrI2Zjlqbv0F8RTfp7Ajeh3iw8UEMeYKw+x9oE3v0JywO
         Ix3K3mmHH5BE/5GebkllK90yfhyE3OGNpN8DgnkXmdfxhUQyF/O+LLPxbVz3ixJqWYHr
         hDLpcTWL7E1KfBK2ms7jnCCBOCZeVOriFFmsrG0UDC9xnXHtAR+xDXsY6/w80KRF7UpY
         Z8vviSMQQ5gROD/1tahsz4NYY9RjT+vHO2T9AUt4bvgAYrTQO8/+X1vC6geHfhgJOPWd
         UgiKmp27eeBtDAKZ2wRKSvbCx+vcKs33D3VsKW6TKcUBroHslxiKJZU8qynEDJiI6Vsi
         LwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=cP5LifdYyCcwXnUpjlTi7Q1GyBwG1MhbcNFx3wTGDyA=;
        fh=bBHNAe3vxxT3+WRQiXUpPj+SEhEkErLNABgICusi1YY=;
        b=FZRO7N4g/74hdEkHHeoYCvIOL8WfufJ/hbbLAHgNy7Tk2HMZKjURf+xCN+8eU+Vyfu
         8Y/I0G3gJXji0ImRgKFUGESqmZ9w4iRfZRQSZUSW0kXH8ZOuKkAw+DH3umCYLjloWiKZ
         yL+cwu52/fYbFPIrtm1r9Ite7HWgo+Q0ipNWjiG5UHST8FOKS3XHkMOsnWR3VbFp/tjA
         IwyXXCA/qpc9yr/CKtBxTKsoqhtgKyzY8dEK1HoImW+/7m0X1W8IC8GISJOO86yTZhKK
         AxvsQJThTYlcOVr6hZKRLGRraDmMwnKBt8bkWCtZwX2/5zE45OYyIEvcmI63yiRc4euf
         et1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=edJtWYVn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43bb082c7si100891046d6.433.2025.02.10.14.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 14:49:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=edJtWYVn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thcZt-0008T3-7Q; Mon, 10 Feb 2025 17:48:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1thcZq-0008SS-3I; Mon, 10 Feb 2025 17:48:30 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1thcZo-0008K0-Aw; Mon, 10 Feb 2025 17:48:29 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5de7519e5a7so2177356a12.2; 
 Mon, 10 Feb 2025 14:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739227706; x=1739832506; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cP5LifdYyCcwXnUpjlTi7Q1GyBwG1MhbcNFx3wTGDyA=;
 b=edJtWYVnVwZUxkcGfeiktmbk7wVnIRT0mcfdGfYlmcCum2mH2elqBGgBPH60+M0tTD
 Evu3uHLgsDmGS7oeGua58F+7RUM2rbRYHAvu3sBroMLmOfV1Ixp+d0CwZDkPkZqzqv/o
 cTca6bWkzXKcguOXM8s8s20GxQLzqiaq13Alz9VZx/Buru2pr0imAj7uYqKVAaLls8zs
 brSnILnfVo7AFFwo/93TWkt3811S0SjwI6NDZxNrn/Sj/hGB6pmuxAkADDuk4HZGPV7o
 PE10VzLujg0RYuAFQ1gvIaNLsG9biDVpspR6Gd6idEHnisn/H0xe8kbb8WASAxhjJzho
 r3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739227706; x=1739832506;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cP5LifdYyCcwXnUpjlTi7Q1GyBwG1MhbcNFx3wTGDyA=;
 b=vYYxNbgOPT0xq/8ZGXzDnzrR2nuuDkeOoqeWdhbmKn5pKkrOwyfaSNLZl3m15jHgau
 QhgvyY9TRAt9gU41jX5iJnYdQHM9D7w6U0cODXHsDA09elzitgNJM7fmHl8p5oNZon1o
 hIe1m30jhpf2QjGurl9g9R7AA4F/jMKOTh3ZsDaRjWaHmjRnzHRWhnb1yB7XKeOjf3j/
 X7DaND8uH8+jsEDXCMbm9Nl1dS2rPO5icLLlkNxh8M/LvilKDzqCzW1snZkYLpfGIFFj
 /HjsjrnyrOLCn1BfIRUfWc8WbYdRbyWG+5O/DUI0nONS16ZmykGLRplskZEJLSmvGH9t
 aoPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3DCf6i7ehVQ8Dm/JenHZS98nDU/6QL45Kx2bN3MFx8xzQa6HyiModCcA4od4gm30D4xueVjhImQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywwy15bhTLiW3Q+Ti6eQhoKx0IYa9pIF7lOWapjrKJq+hWXAwf7
 5OfnYt22q0rDJDG+HmLbgKmzQVP7c69wyAxVhsiTEyi8hEgt6/0C
X-Gm-Gg: ASbGncsx4U86nJweHEfraywbleC+uq/MHmMgxCeivf0OytI32zp4WAk4mtgsnyPAZrW
 yJd6uRKY1qp1yUSioL6i7qh1pkCEt3n/8B0d95B+/AcORkKJPomlbce2Ty8IhtWI/Lra9V7IiYN
 tmKLbOiPt1zN4LQBvZu9xyBZE8KrabxQw2vxOJzsMKNLLEQK/LMq8Y3pE6r9DuVmJb/qnzCHnOk
 rbqAG8X2lLlbx/DUlHJPA1FcGfBYKei2tYp1WtcrDdIZZrCFegKFnHKkyrpp9HPBi0Ow2b8myeH
 zvWk8VwUvtb2QCjOag+TdJjYORQGt/Vel81zWaV2pdUSg9TFjltM8LTZ4mtrI7aN
X-Received: by 2002:a05:6402:3907:b0:5d0:b925:a8a with SMTP id
 4fb4d7f45d1cf-5de45019b56mr15890173a12.16.1739227705723; 
 Mon, 10 Feb 2025 14:48:25 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-086-138.78.54.pool.telefonica.de.
 [78.54.86.138]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de44e4bc17sm7427469a12.70.2025.02.10.14.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:48:25 -0800 (PST)
Date: Mon, 10 Feb 2025 22:48:24 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
CC: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 18/18] hw/rtc: Add Ricoh RS5C372 RTC emulation
In-Reply-To: <a8855d03-d207-4a0d-a16f-24e4436a3b66@linaro.org>
References: <20250204092112.26957-1-shentey@gmail.com>
 <20250204092112.26957-19-shentey@gmail.com>
 <CAFEAcA_gxGWivT7byZh9gYc2QHfsTqbJ8vtxPDToOxLMdMvwQg@mail.gmail.com>
 <F8650CD9-AA03-4462-A74E-7A068820F1A2@gmail.com>
 <a8855d03-d207-4a0d-a16f-24e4436a3b66@linaro.org>
Message-ID: <6E5A0BEB-F0AC-4791-8CB6-B9AF74CBF307@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: KgoFQAtMOgfi



Am 10=2E Februar 2025 14:26:00 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>On 6/2/25 22:58, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 6=2E Februar 2025 17:32:31 UTC schrieb Peter Maydell <peter=2Emaydel=
l@linaro=2Eorg>:
>>> On Tue, 4 Feb 2025 at 09:21, Bernhard Beschow <shentey@gmail=2Ecom> wr=
ote:
>>>>=20
>>>> The implementation just allows Linux to determine date and time=2E
>>>>=20
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> ---
>>>>   MAINTAINERS         |   1 +
>>>>   hw/rtc/rs5c372=2Ec    | 227 +++++++++++++++++++++++++++++++++++++++=
+++++
>>>>   hw/rtc/Kconfig      |   5 +
>>>>   hw/rtc/meson=2Ebuild  |   1 +
>>>>   hw/rtc/trace-events |   4 +
>>>>   5 files changed, 238 insertions(+)
>>>>   create mode 100644 hw/rtc/rs5c372=2Ec
>>>=20
>>> Should there be a patch after this one that adds this device
>>> to your board ?
>>=20
>> As per Kconfig the board selects I2C_DEVICES and this device is "defaul=
t y if I2C_DEVICES"=2E I've deliberately not hardcoded this device to the b=
oard to make it emulate a plain i=2EMX 8M Plus SoC (see also board document=
ation)=2E
>
>Then maybe add a test to be sure it is not bitroting?

Good idea=2E I haven't written a test in QEMU yet but I could certainly dr=
aw some inspiration from ds1338-test=2Ec=2E This may take an iteration long=
er but won't be forgotten=2E

Best regards,
Bernhard
