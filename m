Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7262779njd;
        Tue, 8 Apr 2025 11:58:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkhjS4JZVXgXwZymVEWirx32+HCuTt7p55/JsxTAsBRRWYPNZ2+SGQl6RCBOrkAjog3kMh6Cqln529Lw==@linaro.org
X-Google-Smtp-Source: AGHT+IE4Vk/2W56CNOe72qKwAGMM5SnPRdD9C5MGnZbzs79EI6Agr2CZcYnpR55m3jgaRG1AsK1B
X-Received: by 2002:a05:622a:191f:b0:477:5c21:2e1e with SMTP id d75a77b69052e-4795f2b65f8mr1199861cf.5.1744138731058;
        Tue, 08 Apr 2025 11:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744138731; cv=none;
        d=google.com; s=arc-20240605;
        b=EzACYjL4NUNZO9dlPQXd0QZn1uynl4EEdyVIv5wq1HGy1ohoaBdVr4iRV0id0sVhTa
         6KCC06vy+obUGKiAKEpYSO5lNP6GqPvkRTjjhY7JiQvt4k2vYM2oX472I1uKdIg2Mr03
         Azkrx9yQeU5RTA9xlNSWX0fxu714/rVHy7rkZSZtuSwDQeXEEA0LSATIIHQbEsYCAgLr
         oZ3s2KuOavQkujOwFijko2f8wNz7f99H7kIjEDAQ7oV/GI+/klgMCBJzfIs6VbOkR+l1
         r4idKjf4M9dgHVlGSF1P31UEnm+txreIdvGF1AYw0Xto6RKuhLDLxM3CZyIWwWYSkTJQ
         4TaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=A43eN9gEJpLwzInwk73xEE63oH6QJlEJodemacKh4UY=;
        fh=OWcoHSm8hBeiCrqoUYhY50c3VXAuJ1U/kD35YCj00Hs=;
        b=Qa3sT5sOc8qwOLweT8YS4+THu6LGsQLlvY0J7E+K2rFrY8qLpdhr0+6lVgLIFs60Lo
         O9LOBwXv1xSbmwkAQ2GW8R5wviW0aZ4hOw7yrqU82Q5rn6eXF1rqtAawmYYZftA+SBI1
         uz7bUabaB1y2cnfR0YJXd9uUYRk4JIqEgweaGa4RzBVtaZJ1mKPuz6xT35LXVtS1HGrV
         AALj/Jk65GnzojCnhYJd6BHlWDlEH8/8IqZZYDvkPwWwuThE5IjpNTMGGBHTS7+sBc9q
         n6YIeb90YXhEp6GXPwuJAnfkKhshhv1WQTsKnbSBe6J4Uf5zNA3Drkzw1MATjgmSzt0H
         nA1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jg2ch7Fn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4791b176860si115208391cf.323.2025.04.08.11.58.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Apr 2025 11:58:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jg2ch7Fn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u2E8z-0002Lo-B3; Tue, 08 Apr 2025 14:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u2E8w-0002DT-V1
 for qemu-devel@nongnu.org; Tue, 08 Apr 2025 14:57:55 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u2E8q-0004Ng-Ot
 for qemu-devel@nongnu.org; Tue, 08 Apr 2025 14:57:54 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so4246848f8f.1
 for <qemu-devel@nongnu.org>; Tue, 08 Apr 2025 11:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744138666; x=1744743466; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A43eN9gEJpLwzInwk73xEE63oH6QJlEJodemacKh4UY=;
 b=Jg2ch7FnkImBETgagmeKF+XJD0QhOk3l+EAWyVIJdViZOXPtRQjpJH6Oycm/O2UcYX
 l5FEkldbK0J6mQBfQjcjjuO9yQITOqiqTNZFbYJ446vleiYjBiCRIauixPHK5QziIsMk
 3CPunG0B0ROBB5wCsnrfXJ0Fcl9szDsN6p42TK2VZ23X/a4M19mBYT8YIH/jwnOavmgA
 B6I06RFiVPjdBeSzF4kMbcAry2Db574k3tgRzM5nzhbesqLZu/8Y1PzX6swl/YcNgJeE
 Gy19TCUEKJ4v14cluYHWwL0w5+iPyOqY4dKtTWliKCf3oEH9UEfvbfgFRBdpqf56hDQN
 uP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744138666; x=1744743466;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A43eN9gEJpLwzInwk73xEE63oH6QJlEJodemacKh4UY=;
 b=XOhm26K4MZICVmqrUDRIOCkfzVNRvtz3e1EjgDca794tnW8pVXxGi7QNivq8pBihLn
 VmMlCxcLxdBi0dvs/kp/2uLhzSGlgMA1yp84tc/li7ycgPtLoWo48YcVyXXyHviaKrAe
 6gpP2ZIMZBoinffsjLCjzmOCY4SIC3hHEr2JLWvZcckTC1RqvtVwSp33ak2HqG17yDFC
 0rSVvQPQUxgkYKXvWKpAOCShlLmCtmX6mdn2Lmqu2fowRGvRNQKDuSamtK7Pj7e1lwUy
 HgaJhzEcZ0hcUXkA33HL6RCm7GQSm93G3WUYQ/LIlYp9hHgeGTVPIW+TiMszBg57eEe9
 JaZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1b5xJlXHnvXBiclbW/l4hXaPfsHUi70HcyVbxpsdN8/KHkEki2YNhJyMTXTtjw/BSSwqmRVgbSeZ6@nongnu.org
X-Gm-Message-State: AOJu0YzN2y5RCxHvoaAQBD0z90x9ZXaOb4xh5SfdcTwTLBysYImHEG5G
 CpiHvi3rvbNT55LUGCzeThIxdsZFZJl8phU37iLGCWEr7N4jhC23uCesQnp2YnU=
X-Gm-Gg: ASbGncvLgUvoDAjZ5cz2FEtlj7ZmVldYlOoFbO6MGWKU0WQNbSmd1tMg5WPKaBIv/ut
 +urxAKAeQobHKtBtT8eTv5vgpstzYnfAtYNAMptuKTdSKhsVnhnZjE7rshfLfB6ElVZrLTLOPbU
 ikAlAyZk07fuLfyu7GjwiliLyPLdA6SLJBn/ck6cQT9k3X2cp4Q/6/SBNzWsw94m2pVeDzFzRzD
 f6cnEqo9b6WUdMKnHUx/kwsdGmcDbTmr0THTS/yyDhBIdNBfPf3TysA3fNmK2149d2UIsOKdTHu
 usCAWe44kNLdOTUkdvpr8AH4/yU3pd3l0JXGnqKKEJW0lOQb/K4qJjj6mIF1BU5nc2OjF8Lgp5G
 0fwJSjJZvq8Cy
X-Received: by 2002:a5d:5f85:0:b0:38f:503a:d93f with SMTP id
 ffacd0b85a97d-39d87cd33edmr293462f8f.40.1744138666435; 
 Tue, 08 Apr 2025 11:57:46 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30226f1fsm15847037f8f.95.2025.04.08.11.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 11:57:45 -0700 (PDT)
Message-ID: <49539ce7-d36e-42f1-9ff2-771c893e5ce3@linaro.org>
Date: Tue, 8 Apr 2025 20:57:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 0/3] More imx8mp-evk improvements
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20250405214900.7114-1-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250405214900.7114-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6G3tJs7rjk0a

On 5/4/25 23:48, Bernhard Beschow wrote:

> Guenter Roeck (2):
>    hw/arm/imx8mp-evk: Remove unimplemented cpu-idle-states properties
>      from devicetree
>    hw/arm/imx8mp-evk: Remove unimplemented nxp,imx8mp-fspi node from
>      devicetree

Patches 2 & 3 queued, thanks!
