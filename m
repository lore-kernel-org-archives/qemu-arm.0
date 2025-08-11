Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEB8C87FD2
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 13:42:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulSmf-0003oC-KB; Mon, 11 Aug 2025 09:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulSlq-0002tn-L5
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 09:41:02 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulSlc-0006hV-Mh
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 09:41:02 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b79bdc9a7dso2661227f8f.1
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 06:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754919643; x=1755524443; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4h1chTwnHDTAUIXEVjB6kj9Zz+7XiGsWIDQ28bK5p/U=;
 b=YpEhkMfysR8JHpJWmdyd9fPbqCr5jZm35oCnB5sWAmiOdEV7tjT0j0OlCy94siFEPV
 lb7ej930aF3WJ5TXsCzQsUc572yvBubBntl6dbKpcx70zBM8Yl+MnrOsK8kLeebH3miB
 cMYlT9HzCrsUfGUVm+poJGUUVgiKW3FA/4I3mPvSNHgGf6nuSt+Gz3+RqNaeo76AmSCW
 6hbPEDqhdEvIxIE8voo7DcGbfx3qmF6Wep2WY9iVUMZF5Kfdj2LYWtjmxPsdLbtseoMv
 8kEzruHCpjINg+i8JxH/wS8BPPz1eu8Cwy4pGRmEMbwD+6p1+kFHEZc3OHcGbXBd76at
 sn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754919643; x=1755524443;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4h1chTwnHDTAUIXEVjB6kj9Zz+7XiGsWIDQ28bK5p/U=;
 b=KdXNcpmtTPY/nYWoAdNaWXCjU3Q9zSqEAc9hLYDB+3oEXaRewNUJU/20tZiUdOoTqQ
 5Sbp63x+/TwzG1/hZ2cAozzTIEufWAmFTq/5t3fS9TyH8OcfEKdA5b7bxwxKDHc036T6
 m5PEM+uQsjLk5F+lrFgQJTxspEuJVHEc6nV9O6k/ZSj+mjsybyBjvwOK4JvFDEMfOHgh
 e7z5uoGvygVxvQghz6iB/HXHC1BWbTGIXAk225cH0+k2C4H5sXi/VPFIhxVJwlY5zugk
 Z62nX9BK81131m2GXC/OiI7hx0MCkCx+//w0rorBFmTw6TcYxnlP9fZ3yhwgSlE6Mg1Q
 Q5mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7zErISDqJzKcAjRFzaBog3W91SJ+Ioz+VB42AEJgvSNN/ddbX5HQAVR+8UtJFJePRfJGQmgrtMQ==@nongnu.org
X-Gm-Message-State: AOJu0YwLnHWeVyhlFse14wIKTJwopV108Ew5LBIxQUg3/UPlp3aC0Ikm
 ZjFgCAJsIQ2t1aUqM8f9lb6pGv8vNpFOWiaI6UupsCZ+bM1IP10i0ERo3Jc3jHUQLtI=
X-Gm-Gg: ASbGncsvEfXOk/60xu8wiciBkEqFSx5e83vTploL0L4pgStygM7zSn6K7Lvtp0aCiKT
 W0N0uijznC66DJA+Rp0TRNEyh8e9XjYn9mppHZu4C4ul7LN1ewVGhpQUyFwdq254QfE4vxFp5PB
 adMtYkBGhlubTnKwc2YVX8QUoNznETiXMAgTDrAFv9XXYsfWtSTmTtSASNDv9mJfcrSVrd2j2jS
 PfJSScVC1+IaX33RWv3bddNb80hVOAriVjVHix8PURP8l6MXp3F/jl6kJw3FOcf6DJWuCb/jbif
 KC+YdLXFl9fR9BUPJk/mt+GnGsJsvCqd+vc8qtXew0EAsjKGXsXA0TVD//OlUxW5pMeiWLlHrJC
 pN9wu5QbvCe4dv/g6yso9gModpiwTfh/gbJyV/PA7A6LDnnyi7idL904lmax5mJKM46WfANc=
X-Google-Smtp-Source: AGHT+IHq38NDD3glofeFoXKCRdn9fQAvZC27NRMGV21BFb5pow4dI1ynq/1rMok+5a+DS5W7nPTOjA==
X-Received: by 2002:a05:6000:2f85:b0:3b8:f8e5:f6be with SMTP id
 ffacd0b85a97d-3b900b498c8mr9314764f8f.4.1754919643321; 
 Mon, 11 Aug 2025 06:40:43 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e009e465sm32213815f8f.43.2025.08.11.06.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 06:40:42 -0700 (PDT)
Message-ID: <066d4437-b2fc-4c9a-9842-f95d0306d0ce@linaro.org>
Date: Mon, 11 Aug 2025 15:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] hw/arm, target/arm: nested virtualisation on HVF
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Igor Mammedov <imammedo@redhat.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>
References: <20250808070137.48716-1-mohamed@unpredictable.fr>
 <20250808070137.48716-6-mohamed@unpredictable.fr>
 <7e1c5165-0395-43f5-9d53-25794cc7a4d7@linaro.org>
 <4F5DE89E-D3D5-4675-AE4F-45E2BB855252@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <4F5DE89E-D3D5-4675-AE4F-45E2BB855252@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 11/8/25 15:35, Mohamed Mediouni wrote:
> 
> 
>> On 11. Aug 2025, at 14:47, Philippe Mathieu-Daudé <philmd@linaro.org> 
>> wrote:
>>
>> I'm getting HV_UNSUPPORTED on Silicon M1, I suppose because this
>> method is not being called in this series (is there a patch missing?):
> Nested virt is only supported by macOS on Apple M3 and later

I know, but maybe this is what we need to report to users trying to
enable it, rather than aborting ;)

