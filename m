Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1353358njb;
        Wed, 19 Feb 2025 05:41:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsGcKg6Q81UkJSVaOLXT+c6xhEpA6seMIgINSngGq5SQ5TmvhreR/7INGslk2marN9/O2syzkNFckb+A==@linaro.org
X-Google-Smtp-Source: AGHT+IHsK8x685QUe6EEH7NlO1+m0j9oKxpdrrSFClnM++I7FRaKUkd+Ye60wyXYpFFKIwr7rz4+
X-Received: by 2002:a05:620a:298a:b0:7c0:7ea3:ca72 with SMTP id af79cd13be357-7c08a9db67emr2206148385a.30.1739972491708;
        Wed, 19 Feb 2025 05:41:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739972491; cv=none;
        d=google.com; s=arc-20240605;
        b=IWR++bKHOi+fnGYmQ6DAepJpYIXHB6hIq9Vovyt94rNGnDAWTLg8vfaiBag81oOEwj
         IDVg3UGeAqeijq9JEHZhwNnTHdReMqqmz10u6u53YEHXdZ9r+qj8j/Cv5N43+sYQ1p83
         siApeqpLte90+8wmzRkTpS7H3vyuWudfnJ7lCuOfF0TmuL9xFZKzIdOCzyIB34UD+wMc
         kUX/MZ18/+8j/1/yzYkAqKfG4cjZtKHE/HttPIFZKVh2j5VSKHQU2rL9FXsK1+4ghmEc
         DBiBkCxOLdHJkd5gWgL/JHvx3OGH+4hylS7mdGuts3eVfbjTdxW/jAK4WUkg9jZxbRP/
         HuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zHZeQfwCuwfvf8VjEKurcKIlj5FB9BlW3sG5BywGtj8=;
        fh=89gugcNy+gKU6qlqAA3AOqIhbRfYdDz9mcGfgs8cgx4=;
        b=U92T3UH9YkoUlV2MW9EHEXn67Ip0x2xGS0Gi+EddYF1jCk7k9n29M8znHtEeezEXCG
         vxTG9MnhIxHS9A61HmysCvvrFzCCdYFMPiOiI+0y3ayRmwpsWg88ineKb8/xB82lyK49
         so3tXF2t+wpd5Ik8YE/Fj9D7ALWsQfhbNbWDFPtYR9Da+2CIZSFM87kRBKPGY2IT3BXI
         NPx/3b8NWGXTVqwkSXevVMZBBouD7sxNhqNoZZH1Be3e+IBk5Kz2vm5Hegxs6stlGnhj
         FVlMoKvgwPMfeX4gZ5XL+X7/HFS8TPPI3KUPqaJbO9NY0gTNfJ3hWBplBu0g6NkUgSQU
         NTFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vjgFFKi1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c09a025a2asi632142685a.306.2025.02.19.05.41.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 05:41:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vjgFFKi1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkkK8-0004eb-QJ; Wed, 19 Feb 2025 08:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tkkK6-0004ds-Lu
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 08:41:10 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tkkK3-0003xA-6L
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 08:41:09 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43995b907cfso11935115e9.3
 for <qemu-arm@nongnu.org>; Wed, 19 Feb 2025 05:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739972465; x=1740577265; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zHZeQfwCuwfvf8VjEKurcKIlj5FB9BlW3sG5BywGtj8=;
 b=vjgFFKi1WOyDTw+UbmKO9Ok3/c1xZYRatQJTrNfDv0PuD1qbzhI/an/Q5EDIkZCeF9
 i3uwZYkO7y7U3tBnLnnM9Ci9kMNZ6iHLR7VF16j9ygt0INeEWVSHKg3AzYyr8JQtMPVw
 5zj2Y55I8Ly2/EoeIEKBWQIrUJOVgIf2OM1XLAocv3lR7Mz5SVh3L++OA9dlM2ADgPSm
 doiUyeSNVqh784u0VbqOr3B1Ohzn5fjVChPp2862Lhn7c+5rdfaxZVIoZfT+hjBhJ+BQ
 C5ZehPOEZ7KQttIngUkvZivKGBhamoHfanEZrZyn8sWE2YvC3X08Ye1FqZOkuCRQEddd
 6QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739972465; x=1740577265;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zHZeQfwCuwfvf8VjEKurcKIlj5FB9BlW3sG5BywGtj8=;
 b=ZqMb872qMmoo/ohchJEXpuBV2+bbKDOkCOHY0Y4dcqCuU/JTHxDlF76+jNPfMksNCq
 F6DMBL/MugzNehbPgJoZa7oWc6xW/xvuVu41zxAWI7/+uFKZQF5qFZ0ouqoIC6THcqHs
 t2KU3bSKDpl64g+rludj6NX0Dm/I7Rv0B+uL4z4uKxZlPXJjRJOSBXxEytprUHQD0WwF
 HbHXFWTw6ZWTb5toXLU+wCd2oBHZJdb6550fdi/ZVw14F2rcnH/lng5WfeIT6QpLiTHF
 DTPIcWpq9i3/zSsr92owhY24GNb6VDQKpOy5qzY4prOJxmBlkRpFuZCv20tiDb+iuYQD
 fZ2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW07J/lThBkhg8tRbwUq8Rxnyvt8IKxzWXEoP2UaZ1PUuvA7Fj4PTCeGRv/RMxtF+DK7F3CEKF6uA==@nongnu.org
X-Gm-Message-State: AOJu0YzDRBSIO+zfwOeylzPlNqoXt7IFCdvJJtA/TJyUSP3c39lBDraW
 mb7u0RO5fzVM2RhOgUNPJcShN6YsEVNOZ52r0cO8wwpPJsKfRs502WNdiTfbYzk=
X-Gm-Gg: ASbGnct7xGc+P2oK0VYg6f3VpXnVdrF63+tPe09Lwbktx0uaWCg2AHCy8RLlDW2RBb+
 2u8bLvPjkD7pQRsJvFdn25S9XztXLE6axrAe26LoAd+xmlEaLvjQpX/PTVHPG+wy0A4YXJTONDh
 Nnue6K33aQReK2qA35807u4ybgXBHMeKGFBqpTmHlJxQXqb7RrcpN3GOaUTgJB5laxm0CQaGA51
 UtGgkstJuYwXG0yBS9DPisPLFI3C9Ih3eFN4xB363xtYXitHQwAYPjS4jc4OjHcQK5Naz0s6pVu
 zTWLOHxhOd6rrCBfVTLMvaoEEYZJWULblbZykODdRPvV89oDCl4tL4dJH7o=
X-Received: by 2002:a05:600c:3ca3:b0:434:eb73:b0c0 with SMTP id
 5b1f17b1804b1-4396e6d4b6bmr185234105e9.5.1739972464987; 
 Wed, 19 Feb 2025 05:41:04 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7979sm17647983f8f.83.2025.02.19.05.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 05:41:04 -0800 (PST)
Message-ID: <b31b7131-7e19-4c51-bf89-a5876e655fa4@linaro.org>
Date: Wed, 19 Feb 2025 14:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] meson: Display summary of Darwin libraries detected
To: Paolo Bonzini <pbonzini@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>
Cc: qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
References: <20250212112958.38023-1-philmd@linaro.org>
 <c33817a1-74d4-47b0-93d3-000cfd6200be@redhat.com>
 <CAAibmn2Ohd_-k5LGqo5m1xzLrrs2UYxCT6U_XEKsJYScfCpx6g@mail.gmail.com>
 <CABgObfaq2m42tBUAmskSXm-fR6zKDtApAsR4rYYqg8dnMq+Bog@mail.gmail.com>
 <CAAibmn3MvZtng=4vAGx6yNfMkM+u_HRbT0CAA6WhdbTtLDE5xQ@mail.gmail.com>
 <CABgObfZzLs+yByD=736PFw8ZtH-OcJkxZiScaTWktdrY1+5e5g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CABgObfZzLs+yByD=736PFw8ZtH-OcJkxZiScaTWktdrY1+5e5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: uM89frOV1av2

On 19/2/25 11:38, Paolo Bonzini wrote:
> On Wed, Feb 19, 2025 at 11:36 AM Phil Dennis-Jordan <phil@philjordan.eu> wrote:
>>> ... which boards should enable MAC_PVG_MMIO? Is it only VIRT, or something
>>> else?
>>
>> I doubt anyone will be able to use it productively with virt, but I am regularly surprised by people's creativity.
> 
> Ah okay, so for now it's effectively dead code.

Correct (still tested before merging). I have Phil's vmapple series
queued but it fails the '--disable-hvf' build config so I had to drop
it before sending the PR. I kept the PVG device to save Phil from
respining again and again the same patches, hoping for a quick fix
to merge the rest, waiting for an update on whether Phil's suggestion
to fix the GIC dependency was OK or not, but no update so far, see:

https://lore.kernel.org/qemu-devel/CAAibmn0puNwDvHcU8xYi1EJ=dnAEhasoTKCk0kmF4DiQfR7dHQ@mail.gmail.com/

and my proposal:

https://lore.kernel.org/qemu-devel/20241227202435.48055-1-philmd@linaro.org/

And now I see Phil's reply which I missed ...:
https://lore.kernel.org/qemu-devel/CAAibmn1g6+btdRX99ZUvbaBm7hP_AnAGNfDHz4Wgi3fPn=waOw@mail.gmail.com/

> 
>> The intended target machine is vmapple, which is the only known way
>> to run aarch64 macOS guests. [...]
>> I'll try to rebase that series and re-post it in the next few days
> 
> Thanks, I'll keep an eye on that.
> 
> Paolo
> 

