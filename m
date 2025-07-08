Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B13EC83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 21:26:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFAj-00040u-N1; Tue, 08 Jul 2025 16:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDgX-0006bb-B3
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:09:09 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDgP-00058Z-J0
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:08:53 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-74931666cbcso3896639b3a.0
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752001726; x=1752606526; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NpokmzBZf9Ndynik64SY0VCrm5Id9j2SDPXgY+3AKfI=;
 b=QGLzfZGFXzN6/6fnOicU2XamtBb/gTy/VyTjeK8ij5XVDkZI+XXrjVY/idyZjV5zTk
 issHi+g5gOEjIuPZlC+yphYoCQUUs5RkaziLV1ZJZJy2LjFRZod4s28nVAomImWLM0aL
 mMWj7rwME3QkuQylPaieNmtvK4RFeqhmaoNjo7KKd5n2FfYNlJxrDIWf4io+Z3iRkrvC
 3vFflE6bgE4EF8VwbkJ7aQa8lpktnjCqeM/lT9ocr9SCHSVrGly1k+VVZLW3mfy7UgX1
 Vk5cZY3AFyFja605lH6qngFfeMiDzLQeUPVKZ8aOAEiiFedsmEr4dOIIKf03Hw2AcnwM
 1DQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752001726; x=1752606526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NpokmzBZf9Ndynik64SY0VCrm5Id9j2SDPXgY+3AKfI=;
 b=OSZ28kBBL03dM2tORupwpdHC062YXyiW2Pv61uypUwi9QSxY9Q4V+wuSraBAPCePhi
 pUv/IcBfr5Tf52hwnbs9ZwnYeWqrg1J2WVxhUxJRifEB9++6m3I99lwkluC8H6OG140z
 77joS7dkddPX9n4DYLCgyNYWFsN6loTAoariOxwDZYSJnrn22fnFjp+Iue4Hf+sRMqB3
 URRCmHKVHJFbvxH5oT/2Kgn6voRC3OAP3RFaWm2VPlwdH2wU7CszGFgDXRbnyDwaDbVx
 tpn+n5E9IOIMD9FFNfOsr7GTN8eSmm67NW8JOjyKq74soFjmbWs24JAkAPl5UofRrk1v
 PYDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmCNKyATp9MuB9tA4HVlwoXEte+BRk0vBznYbh2pUc3SZw+ZAWc9fJJKOPTkm8cDYIrMycZ5cPTw==@nongnu.org
X-Gm-Message-State: AOJu0YysI7xXdoEfM7+Oj7kT3znASH145C0avQjhCHTxjr7alRGPEpf/
 zCVw1fdh/obgvgr0t6+aN6Dg2UYo1MVQ2et2IH6jmcEaAiDUxjNq3k1vzTd2+TGB6qzpZrloH6H
 sLX86
X-Gm-Gg: ASbGnctg4p1AiQ1vjbiOQynMRhiaPVwE3Gv5iIauogFg2lapk3t+V/zxur30Vx+xkyQ
 0fkmXo1kpPpEuXNBpF/LxZX79IqrndE8ebqsaTmVjcMB26TdTdgtvtZkqekAsNWHzd8qH7chAiV
 usvZWTk/6vAC2AEZ7xmW0Jb3KE+PSG+EScKjcdSsqx9JViAs3VXiaqJm4cv6NAgMY2FUjb0EHEm
 UhgTQ2471Oa5KZiOfSJ3yGgHvjJlbGiRgzgfGi594Fn9ltEyLZUHEhU+wv7EaRtPHkzFJdeOd2g
 Tb26qtAl3WUA1T6L1kSatEmZ7Iwk8QagYsXg1ftmkGn6JZ8sNNfI+ovQliWSYQkDE+sweGFbgCM
 =
X-Google-Smtp-Source: AGHT+IFD/tw8S92eqLq6aXF3gXU+MXGEhzjZU7LiY85OvpsrbqvoO6pCAQlmjdzy+5IRmNr/dwAXUw==
X-Received: by 2002:a17:902:d2c5:b0:236:6f43:7051 with SMTP id
 d9443c01a7336-23dd98356a4mr4888025ad.23.1751996046753; 
 Tue, 08 Jul 2025 10:34:06 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8455eb3bsm125752875ad.115.2025.07.08.10.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:34:06 -0700 (PDT)
Message-ID: <c51f3075-5511-4a97-9eb9-7605d224c237@linaro.org>
Date: Tue, 8 Jul 2025 10:34:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 6/8] gdbstub/helpers: Replace
 TARGET_BIG_ENDIAN -> target_big_endian()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-7-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/8/25 10:19 AM, Philippe Mathieu-Daudé wrote:
> Check endianness at runtime to remove the target-specific
> TARGET_BIG_ENDIAN definition.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/gdbstub/helpers.h | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


