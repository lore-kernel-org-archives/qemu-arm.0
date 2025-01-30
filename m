Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp62493njb;
        Thu, 30 Jan 2025 14:15:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVZUkemSuw/0/Onw4++9zzbB0LsF/VMU8r1Jas9rNoAepZ1DRc+5lBMPFJi97XF5K6VcqkGdbuiBlVl8w==@linaro.org
X-Google-Smtp-Source: AGHT+IGf35BDCuQPRQudsVMePQCQNwhzZOJTN+irL4PW83+69CPCopxSA8xmsMboGZtvic7Ep7F7
X-Received: by 2002:a05:622a:12:b0:467:737f:d5ac with SMTP id d75a77b69052e-46fd0ab34d6mr120161451cf.25.1738275306222;
        Thu, 30 Jan 2025 14:15:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738275306; cv=none;
        d=google.com; s=arc-20240605;
        b=D75hFoIOKaNXqFqdRvO0ltM0AR/yuvdBZecJyQbM8BSYY5zlLv9OthGZllpUHQDS8h
         F25F05PhRF+gu6wD8zzkr7I0gVfWVvFJGPd8dMjRLSe3gnYTgCdnDog0eewph/TOvK4L
         ERSjQu0dUjMBEp4LG5Mf6pKrUYIr48O+gEDVgXazjgyV/4hcIv/0SS2UAxWPN591NvZG
         +bt+Krs+nGkMO0yDDEdfP3HHwE8jlFL+O2Gt3AnQm29I6mZHvAw4B+/0V/wdaDKgPbxn
         ojdp/TFJE4SGFS9Kci+CkDNrALI+Z7rK5IcKlTQh3aJPtWUkUoK2Yd17m0eklc1cXT3N
         qmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IDD3MNBRR1KtHGsacC9fczzE8ey0NDAPAxx1U/dP8Pc=;
        fh=dY12/XDxEAjqRmCbgP2Is5eM5t3fnlvXwAHTPVoxDPA=;
        b=FddKj3FQ7s8Owevsk5owSFuJOC8/mcP+uFBTA3Z/QrO4tgzvHUZymKYB7hmKMxuKBn
         rfdRZLl0U2POyEfve7ulm4jgpm9A+AySs8e8D+krFv3RuPdWaLjJX0udH+D6Qen5c/91
         313IXsm25TbvygFrtd1gWnfbRM3K+5c6SkSnEyGahcllD792nQRFLoSA+SqMi5YVKBcc
         2a0lmdPW/sAohJpx/84CpSs8/AvwVbs76PxIocd/UFf4Ja7wKNEAx0oj7ivlpm359T1U
         Fzwn4OxlhmGP9O2x4A/3F2kxhtV0ifjnxoE2EzL8r7nim0M6e6MBaKp+1rKsvfwqqE7y
         uYNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tQK5gKN+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1e4be7si27386571cf.588.2025.01.30.14.15.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 14:15:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tQK5gKN+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdcoG-0003Af-Ct; Thu, 30 Jan 2025 17:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcoA-000368-Pj
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:14:46 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdco8-0007I1-ME
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:14:46 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso9771025e9.1
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 14:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738275282; x=1738880082; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IDD3MNBRR1KtHGsacC9fczzE8ey0NDAPAxx1U/dP8Pc=;
 b=tQK5gKN+GrHf97LD3V8m5tqj7QWIi+kq7fxjm5pDwljBlU+qOfk2fSr7XJz/0OfYVx
 wjx9cpzg8S8JcPWxj8su31MMRD2D0/1k7clidTMK5SKGm69z1xRwYeuw2lh1srbLuahx
 66ip7r0jYmLfXzOTW8Kr+So1Ud0ER6Q0k5LoIy+k5jGWsyrQNeS/5U3ZGqZxLSsDhINy
 nmCO7ipzAhgsVKiGWPclZHhgPzd3+eLOj0Rjt/h4NSNeuvaROkX3S3n18RnWaGESuaSy
 Swpp2uH9Af5kpfhoVJ9ZNbw1JaZntlnpbUdxASVtJqkyJSmso09qWT3r47+ugNp5+hqz
 BFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738275282; x=1738880082;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IDD3MNBRR1KtHGsacC9fczzE8ey0NDAPAxx1U/dP8Pc=;
 b=O/NwL7Q/BzFI4LPjFJOq8Iq6sgUlD8fzmNnRlmfQMuzKWgp6pTU/vYnfTlipUjCCEm
 iciTdx+LnlvXU2esN7kiwcFxkmxmHPKkSxzidAIpXPuf5eqLbRWwZAgx2L+J/7iDQITh
 oVm9AG09UcqEJkrOsw5wE6aTrhHL6+pjzulUWdly2E0NrO1I+sugFxsPtt5yLxEda3Ar
 NLwu7fbw19Ag7eziczOxHLN3gXodCAHzEcWKijdLSLVFOsNJHk/JuQU1GV8s97FCcYN/
 272MtvZjBhQSS4JYo199hvhEpoufVCB/B+W9Z0HdArCOzqHXc4nGSMlTyRCERuPYXznk
 1m2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLwkWdrzXnPxYIbM/T4pZwI5+U/OOp47l2ekQaVHXiL5JPC3gHsgWQAGQmkcF5CjP/DPa1HDKHbA==@nongnu.org
X-Gm-Message-State: AOJu0YwVPSeUMQei8ZU30m1JrZXjXKcj1iDNkROb2NuJoAc8V3/Uap4t
 h3o7+OkT+ASbrO4TUKiyCCuaNt7xRnjIhDkUNJeHQtxa3buA32KB6qw7zeBVpRs=
X-Gm-Gg: ASbGnct0AsNZmyCfiW+I+SrLRe26mWyj4seqzKj6DUjVFlHifnpf7lmzekBwPdGxl+A
 a+8HxQo2tyoSvs8+sM1nFwFrYRMCidHAaDHqyykNOO7V3hSCdCDiDg3IJ5/iNFS5GCCE/v+sF8n
 jmlXVHD7RLOj3ODOUpX5FqoXhVm+eTyvnGV6ExWqgd81rCnMvFzLu8IficZxcOdChyE8mIjxXs5
 OnhXtr4/tlOTEfy4OW5P0v6N7kEmuubfT+s8lynuq5Ebm2wAbd9irRtk0pnGws8P7N1UhHR3TOU
 po7syq5QsmDah3+9jM97K8pdQPjxfZPb5kRbJU0Vyv3tstjnRWhY7gVvFgo=
X-Received: by 2002:a05:600c:500d:b0:434:9e1d:7626 with SMTP id
 5b1f17b1804b1-438dc40f16bmr70073595e9.25.1738275281961; 
 Thu, 30 Jan 2025 14:14:41 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc26d05sm71319865e9.12.2025.01.30.14.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 14:14:41 -0800 (PST)
Message-ID: <3a8d576b-e49b-4013-8cd0-eeb415e3726e@linaro.org>
Date: Thu, 30 Jan 2025 23:14:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] hw/sd/omap_mmc: Untabify
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
 <20250128104519.3981448-9-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250128104519.3981448-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: KNks7ZcePwPl

On 28/1/25 11:45, Peter Maydell wrote:
> This is a very old source file, and still has some lingering
> hard-coded tabs; untabify it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I don't propose to try to bring the whole file up to modern
> coding style, but hard-coded tabs are a particular wart.
> ---
>   hw/sd/omap_mmc.c | 124 +++++++++++++++++++++++------------------------
>   1 file changed, 62 insertions(+), 62 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

