Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1831329njc;
        Mon, 22 Jul 2024 03:51:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmKJefsKuRzb2crNsnv+lRGJolb62FKIWUxSxiJg6Ukjzw8+PnfRjWAGoTbqoKcmPkf5pNoMb84qgkqQWtIJAO8Z/lBtKc
X-Google-Smtp-Source: AGHT+IHzwSA7pyv+q9uhyYBIBxhkGCuEoHG7mP7Kmtboh1p4QZY75mSIlVkKcZrrCXkWSl3ubJ3i
X-Received: by 2002:ad4:5945:0:b0:6b7:97d1:9a94 with SMTP id 6a1803df08f44-6b961144bffmr99981416d6.36.1721645467347;
        Mon, 22 Jul 2024 03:51:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721645467; cv=none;
        d=google.com; s=arc-20160816;
        b=g5bUwurydP308Slphv702TWr4QL8miHJ/pBG8jJt2QCCnc/mLFNJQ8ksYIe550WjPa
         qCicMlYpMRgGVpqy8OoiHFtXMu059SItT0Mzd2CsAmrAYZWu6RM5xd5L036Y8rZRgY6l
         yE1c5DVKxNV2BBV29A8jmaJvetaGEqVXejDxUEXLjw/cP0uG0x/ZJfQTIqUShYM1h1LQ
         vN0VUvifhCId7wDA+e0NfPcJZlFgrnsD463NmBQgWuDBh5ogqCe4oWbggIByPYkLEnV3
         m6tTdfgClbPD/UU4MheXOqNvPIWYjkM4EYm6t7P6MdvFX9gno7hwc45EzrRp4XUgaSdR
         1zSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PN2oRhooOrosFKFvJdWTgpacvxKpiFQ+3KpU2AqSwOE=;
        fh=VvKWkqDTBMQoe5Hn16Bo8900MWF+zakdvfTIMxPCE+E=;
        b=msE7ASV58iaoHr6FDGswlJxhpW5fepros3EiWciUz3/p3TBgHMzXkUfUjPWe390q41
         2KOI0hpQefZVVcZIGSuJY5mdtNz9pyrgVIzCru03iXNGum8xj7Lfaj+6ojvle0svAFq5
         zGOoijD1EzKt9d2Cph59FCJIzjIX9vxN/EQFwvleAuLa/WZaY2BisJwNmKMm/XjCvj7T
         3fL4FqJTsvz/dUgY6WdKif/32RYYsnuC4dAWzHmww/oD/mjklOUL3i0YMhJRyGLb4Eq7
         vqg4KXvPnxFiaP6yBmnrfAUVgC+9+O4fT7NFI4XTZ7wcK+d4B1Ka3VKae0ONah5hX3IN
         Fa5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dpITkosu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac9993c5si73025536d6.309.2024.07.22.03.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 03:51:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dpITkosu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVqd3-0003JK-Sm; Mon, 22 Jul 2024 06:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sVqd2-0003C5-GS
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 06:50:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sVqd0-0008FU-Lj
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 06:50:52 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3684407b2deso2072977f8f.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 03:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721645449; x=1722250249; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PN2oRhooOrosFKFvJdWTgpacvxKpiFQ+3KpU2AqSwOE=;
 b=dpITkosuVELoawqyT4vIlrfP/Mso+k3I95zU79IM7NQrvtBYSvDGg9Qc0lwTU7ICSU
 Pf7aGbn3KVL54GpA8MkZEQHkSzprdlLFpW29N001jQd78wEqR07M57z6QUBKpTFyFbyT
 4WkUOSPExz+Qn3LRZ9mQ4MoMC7Erw6Gc6B8VnRo/0B6pJt0cdxvEMwg/6T2PQXd6/5/e
 dNSN3wSdj9xerLop+YQlSOd+8sXwXFiVXk232L2F8KIKAIxIohitc6sKOm7rAkhfM9p/
 QJw7Hs/Q4KUV+5bZblZfRK/Fb3xHbW1ss9FDa9Zncoq/Lsv5tOadSIY65oOYtgLW2AfN
 +L1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721645449; x=1722250249;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PN2oRhooOrosFKFvJdWTgpacvxKpiFQ+3KpU2AqSwOE=;
 b=Pb8WKRlKBVuC2UGQQlaiqeRB0stP2JcZjqGQApwqQsO0nD4v9VSLdZKgz+GkFlrROs
 0TpPGbP4TsHgrDG3jp84BORUmxoOmz6RXadQomQI2jsv05gpPpvjnGoNlR/Gf+RCyHuL
 +6DApoKsbUvukLR81vWfkuGQP1lRPeOW76y8xw5gRv92q4zp39Z8fh9QcJq5iTnNKLhx
 ouSufnAwF2/PQjvItW2aOmLV2GhWEHMvI8U7nZMO+SFgKxuED3t7wrAv8ULLkDOuwN38
 qYRApMsITXVEHWFJRGucin5NY/Th/5b97kLZjf/k4YpLw4E2iLLmdXLWXU5LhmI9k5WM
 WbEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4/Hl+OzgC1lej+dGcXbhRerifiWf/NoW6YB6baqAW4YeLVst3hZTixVo66yeaE/0oIr4CyDeoprcvF8JYwAxTP1x9
X-Gm-Message-State: AOJu0Yx3yMtPZo3UQQXf3ySv4Gw+MhwI84bdH9Bzeo6cFGLAauwmOUNi
 k4Qsmt+6NxytJ3SwDO9TQynmfRlmwxKm90UkljQllecvaR4lG88oC7RHrjNmA3k=
X-Received: by 2002:a5d:5f43:0:b0:367:4383:d9b4 with SMTP id
 ffacd0b85a97d-369bb2ab66emr6002809f8f.56.1721645448831; 
 Mon, 22 Jul 2024 03:50:48 -0700 (PDT)
Received: from [192.168.69.100] (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr.
 [176.184.20.254]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ecbd5sm8146209f8f.100.2024.07.22.03.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 03:50:48 -0700 (PDT)
Message-ID: <0a3ab138-955a-4af5-8643-479075fd21e1@linaro.org>
Date: Mon, 22 Jul 2024 12:50:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/smmuv3: Assert input to oas2bits() is valid
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 eric.auger@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org
References: <20240722103531.2377348-1-smostafa@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240722103531.2377348-1-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: PZxJPrstG2gs

On 22/7/24 12:35, Mostafa Saleh wrote:
> Coverity has spotted a possible problem with the OAS handling
> (CID 1558464), where the error return of oas2bits() -1 is not
> checked, which can cause an overflow in oas value.
> 
> oas2bits() is only called with valid inputs, harden the function
> to assert that.
> 
> Reported-By: Peter Maydell <peter.maydell@linaro.org>
> Link: https://lore.kernel.org/qemu-devel/CAFEAcA-H=n-3mHC+eL6YjfL1m+x+b+Fk3mkgZbN74WNxifFVow@mail.gmail.com/
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>   hw/arm/smmuv3-internal.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

