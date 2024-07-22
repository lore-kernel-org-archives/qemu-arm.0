Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1748054njc;
        Mon, 22 Jul 2024 00:11:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9tBTMjl2UZ6spDP1pBSVbMfpnxpUjYkpR73IRW3JTu8J/DaVzIr50T4wBDz3sASuI99xcBLsNwJVWw/IzQk2zBSubMYgw
X-Google-Smtp-Source: AGHT+IEwniihVoVk1ltv6HJqV02TLrRk8ozMRj00aoCp8DNqnRgNRWHaCey7Exd1MB4TnGBySWpp
X-Received: by 2002:a05:622a:1ba5:b0:444:e8e2:29a8 with SMTP id d75a77b69052e-44f96a3a649mr174534001cf.7.1721632304683;
        Mon, 22 Jul 2024 00:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721632304; cv=none;
        d=google.com; s=arc-20160816;
        b=vqzKAsUxt0YyCKYvw5iKKzcYqPO4tIP2g81/4uYIsZrjHv+LWoKmJaFgh8pbvbMiYO
         VrzeA7GH9uv2wrV9v+MgBr4OAK7mJ3vJildlCPV//0KPsu0eZAm+IlSLIOniB3yE5Plt
         IVcA9Y03VYSOOE2JQpo0gn5jiJyxjglA0ZT1M9TEnKBOPyPu+B5m3P+KcoPwEadxm1Q+
         xAQyCm64DUCHrY4Hr+o2iYets9fM4Dvirq/Wju56VHfXkcs8Bpnv9KzYNQgqreuobtAA
         VEHzIBnA0plhPryVMVW2xeJco34iF6ExpZ6rbM3CHAuwoVre2ksFg2kTvIXCf+FO3kuT
         CwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4pM0o6kt3X/A+rKgMU2W1MvQ1iLLhV1KY19HqwZ2AMA=;
        fh=YcSja8lqfNQgfRbzWgxLJjhtkEXHxmggld71uCJYR9U=;
        b=krI65zgQ5iXZfvivBy7mUF3/ZsJM1izEzmi22ZysJi59feQGfPRot1YYXK6FaexXFg
         uzl3uAR1eHpDdIDATGAhQ8pV0UwXXjPaYgKnfdaEhvwXbrrAfmsKPrFfVNV9Xo+t/rD4
         bf77qmH0nU9ytIERNoInpo8GVmxKDV5c7VMskbNBAV4fChX/Mbap6ogTvtO+2j/fYhac
         hJNBnNRE00MzcZ8Z/zjabIQb8lo8rXbghVYm8BSUM4OI2iqfds4bFfNatYLQTahpuwG2
         4Mhk8/5VkGliw/m5LghCkOYOGa2PTjNmAw+09JrDHyWYGeMg67Y8YZf7KGLANzFFKy47
         N38g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kS0HjX7A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cf2098csi73237221cf.807.2024.07.22.00.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 00:11:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kS0HjX7A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sVnCq-0000YQ-Fy; Mon, 22 Jul 2024 03:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sVnCa-0008Bi-3p
 for qemu-devel@nongnu.org; Mon, 22 Jul 2024 03:11:23 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sVnCY-0008GG-7v
 for qemu-devel@nongnu.org; Mon, 22 Jul 2024 03:11:19 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-367ab76d5e1so1269032f8f.3
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2024 00:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721632275; x=1722237075; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4pM0o6kt3X/A+rKgMU2W1MvQ1iLLhV1KY19HqwZ2AMA=;
 b=kS0HjX7A4RPe+sq/WeebVxhUR6G9bPImZ7sgFj5lEtDYvchY3EQJhBTgxN7Q/iQLyn
 XOUjCFGF/iSPrY5fjZYGmfFjNTdSd7vldxzpLtUa9Bq8quw0XqAeITbE6f6G8MDp2PAi
 8TLyfPSPb+VI8n1t0S2QREwLBhuSzeaNRqtzucjJYbMzy8SUvvEOr+MsgpQBSxXmwg9P
 u/kJoFqqlsRcCepVJaggke8+o/UGaPnzD21b74JQTS83xwfdMrLezEPidt2U3d4Zg+aX
 6xOzAhGI8roBfrD4/oCGpkvRu5nuuN9tWDHRI20RfrdQ0evDbXSyyfZS6k/qoc+WcdrV
 3dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721632275; x=1722237075;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4pM0o6kt3X/A+rKgMU2W1MvQ1iLLhV1KY19HqwZ2AMA=;
 b=cQHMDlz1MLLqdmNaCMIQHwKw78OHcVaZTN0yPXk+nSTSHHCFeBgs+qXFwkPKwbZeD1
 IXYGvNHRzzQqdzuay0ULEmcWYqgxTTLsENOGpOZUePBmTjihkce0fPe3e44H908ViQ02
 kePR37TaVn4id/vT91TrU4lezja4GqgFC+gYtyl1Mh/UsG0RS6ZreuIshaxiyqbNQYAy
 Kf8cOR7lC927NPT7JWrR6IYOxxjajH/AT5fBk6pLu7frYlNP++yk+je7uRMGwcXRbQyq
 QcolHc8eNRUAeXxLp5zY9+WeqL8RhrZf1PYa/xmuzwRN2q3y8tLAauyPpHYN1NlZYncL
 s28g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWugMtFfNpmqkIT1zsle0tSxnAKGutiaoRtHDnIyTi6m4hzEGgs+Vuen1uVoeg0OGVGaRok1OrjelrirH7V1D9oSAIH04U=
X-Gm-Message-State: AOJu0Yzo4W9m9A4rramcZWzYFcyoWmRgqmBiGo2ZgdAtTGXBl+Q5MrcO
 Ghh+oE6XHmjcV2UdLNdjCJKV11GXfZ3rdppNxqh7dH0fuZpyGpmMrLwimoWs0Jk=
X-Received: by 2002:a5d:4a06:0:b0:368:5e34:4b4b with SMTP id
 ffacd0b85a97d-369bbbb3025mr3481664f8f.6.1721632275088; 
 Mon, 22 Jul 2024 00:11:15 -0700 (PDT)
Received: from [192.168.69.100] (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr.
 [176.184.20.254]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368786949f5sm7671393f8f.57.2024.07.22.00.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 00:11:14 -0700 (PDT)
Message-ID: <2e942fe2-88c7-495d-b3af-00963e7e2b61@linaro.org>
Date: Mon, 22 Jul 2024 09:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] aspeed_smc: make range overlap check more readable
To: Yao Xingtao <yaoxt.fnst@fujitsu.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org
References: <20240722040742.11513-1-yaoxt.fnst@fujitsu.com>
 <20240722040742.11513-7-yaoxt.fnst@fujitsu.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240722040742.11513-7-yaoxt.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: UHSEeFOMu04L

On 22/7/24 06:07, Yao Xingtao via wrote:
> use ranges_overlap() instead of open-coding the overlap check to improve
> the readability of the code.
> 
> Signed-off-by: Yao Xingtao <yaoxt.fnst@fujitsu.com>
> ---
>   hw/ssi/aspeed_smc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
