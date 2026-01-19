Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EED3D29C4F
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Jan 2026 17:22:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhsxE-000492-6A; Mon, 19 Jan 2026 12:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhsxB-00048L-2Y
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 12:22:13 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhsx8-0007At-9e
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 12:22:12 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42fb03c3cf2so3109034f8f.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jan 2026 09:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768843328; x=1769448128; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q/wgF+H9GfM+z8bC8gU+mH2o00CJyhPHg4kxrg6q5FE=;
 b=X564E1My25C4crAsUD/eKnTU+Jqzo3sDCYXPsBC/bMsVDIMBVVtC/g7iLjd9XJfq6J
 UtG6tn/a5e0j2Lm41eEt7c7oMGN8fHbTODebCQenGYyiQ2MxfWWhg8KQyGAt7ZlUoBZw
 rmObHue84A7l9wpT21oXks4/WhVPnaF6nRbud+oau+zFis7O7P0cf+EcTaRjLexMFceo
 pm0nVf/B7A7Ur4B8gKa7R3zBrqpQnjkq6kvzX4asOwBMGztaHWegtBsQo7XoIpD5zx8R
 Lyi5a20ayt8f0D7pWI2ZVyaU3RTAUTevLmLfQgrwYMr5lbb3j2C4WwKhDUEsDs8NwZVY
 Es+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768843328; x=1769448128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q/wgF+H9GfM+z8bC8gU+mH2o00CJyhPHg4kxrg6q5FE=;
 b=gFeGzgIIbnXi58fe51pORaqIE23bm8JUZxKmoXIF7YW9m7YWnAjnJPLnmRcNcu+wFo
 D0Na/u9CTArXvwHC7ZEB1kBKdjSETHIg8hnBE1MCfJ1YJJEttMj6A46fclDjK4Zh/CRG
 XCj/t0fPJ1aRsGBf0lfAP0kF3/rDyXkelImHYhB4NMxqJK/MSH2dpwXbAikqzNsZAjvb
 IfrjKAFEJC7SQ7fPPamKMSFSwuCCQxP1Gj3t/1zWW8weaWEaGAP6uq82w3WLlr5QY5a1
 6uF2QZkEum6eqEROLe4efeJD4vW0Hg0zDI9TGoZQOkl949iw3IZGP72NZUo/IYB5Fe2Z
 YMMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/CnH748cc6qnU5VA5OmE3Oai96WdBxiQEDhu5KrTLlpCENcBbs1acl4pH/my2BL9wjoSaSZztiA==@nongnu.org
X-Gm-Message-State: AOJu0Yw3o4U9nGd/NUPQin1B8ir4vDlqAU7dUfXMMk8YwUja4H22wriF
 bHCjF0DnhYnEkJ86zK69arQBAd4CK5dfOuPHVM7xzyLYeO6kLqzrBIz7hKVZzmyLjD8=
X-Gm-Gg: AZuq6aICjwpDrB/z1yNYtD/Rk0s+Lrv2ab1w/LgW2UAa+K2Rt5SEQSlOAz2ax0eYxWT
 a4V4fbIOuAauP21MM/EgmOSGcuDADlujFzzXgVWiV2gVdfe1FuQdjsMlhGfSQqDJcdEQ3QL7z3Q
 2NTG8T9OfUk8btVdkN+8onh/CSnkziNdLpQBcP6tR/aElIy4w5laTC90oMO6VR3THtI2MhK9vBW
 9G7M+RfOGJuafZn1XNqoQkzuQcoY6ppE2F5fumPM1GMETkOgqvEBQwpO340ScHsgw0d7HWn6OPJ
 RxD4j0mkCnkQnl5eNiSru1OjSEL/rPq/1PUxFxZlR5Pp+Dc/V6y6RNHwv1Y9wI45qx/SXkIZwG/
 mTISpxgXlYavLzP2Z1e7ur3JRVB03J/SbLcPXusW1YrQi02CAo3OSTV4uxJieni3MX750NVAAil
 ExiC6+aO7G2kA9gogQdh+W6MnnG7esUz9Z7QpSYQqGStjLDCDazopLJw==
X-Received: by 2002:a05:6000:22c4:b0:431:9f1:e4c7 with SMTP id
 ffacd0b85a97d-4356a02c777mr14382497f8f.21.1768843328398; 
 Mon, 19 Jan 2026 09:22:08 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996dad0sm24251241f8f.27.2026.01.19.09.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 09:22:07 -0800 (PST)
Message-ID: <ad975568-9ff4-420f-9b98-725d0c3e7c64@linaro.org>
Date: Mon, 19 Jan 2026 18:22:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v9 2/8] hw/arm/smmuv3-common: Define STE/CD fields via
 registerfields
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20260119161112.3841386-1-tangtao1634@phytium.com.cn>
 <20260119161112.3841386-3-tangtao1634@phytium.com.cn>
 <fa73ef10-4a1e-486d-9d80-550c91eef11f@linaro.org>
 <0e71fdee-3569-4f83-afc8-46e0cbe565d0@phytium.com.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <0e71fdee-3569-4f83-afc8-46e0cbe565d0@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 19/1/26 17:51, Tao Tang wrote:
> Hi Philippe,
> 
> On 2026/1/20 00:38, Philippe Mathieu-Daudé wrote:
>> On 19/1/26 17:11, Tao Tang wrote:
>>> Switch STE/CD bitfield definitions and accessors to the
>>> 'registerfields.h' REG/FIELD API.
>>>
>>> FOLLOW-UP: Fix CTXPTR_HI/S2TTB_HI/TTB0_HI/TTB1_HI high bits width
>>> (should be 24 bits, not 16).
>>
>> Right, but ...
>>
>>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>   include/hw/arm/smmuv3-common.h | 169 +++++++++++++++++++++++----------
>>>   1 file changed, 120 insertions(+), 49 deletions(-)
>>
>>
>>> -#define STE_VALID(x) extract32((x)->word[0], 0, 1)
>>> +REG32(STE_0, 0)
>>> +    FIELD(STE_0, VALID, 0, 1)
>>> +    FIELD(STE_0, CONFIG, 1, 3)
>>> +    FIELD(STE_0, S1FMT, 4, 2)
>>> +    FIELD(STE_0, CTXPTR_LO, 6, 26)
>>> +REG32(STE_1, 4)
>>> +    FIELD(STE_1, CTXPTR_HI, 0, 16)
>>
>> ... not followed up?
> 
> 
> Sorry, there's a typo here. What I was thinking at the time was that I 
> would submit a separate patch follow this series.

I squashed:

--  >8 --
diff --git a/include/hw/arm/smmuv3-common.h b/include/hw/arm/smmuv3-common.h
index 6b48b5414dd..db30331441a 100644
--- a/include/hw/arm/smmuv3-common.h
+++ b/include/hw/arm/smmuv3-common.h
@@ -43,7 +43,7 @@ REG32(STE_0, 0)
      FIELD(STE_0, S1FMT, 4, 2)
      FIELD(STE_0, CTXPTR_LO, 6, 26)
  REG32(STE_1, 4)
-    FIELD(STE_1, CTXPTR_HI, 0, 16)
+    FIELD(STE_1, CTXPTR_HI, 0, 24)
      FIELD(STE_1, S1CDMAX, 27, 5)
  REG32(STE_2, 8)
      FIELD(STE_2, S1STALLD, 27, 1)
(1/2) Stage this hunk [y,n,q,a,d,k,K,j,J,g,/,e,p,P,?]? y
@@ -66,7 +66,7 @@ REG32(STE_5, 20)
  REG32(STE_6, 24)
      FIELD(STE_6, S2TTB_LO, 4, 28)
  REG32(STE_7, 28)
-    FIELD(STE_7, S2TTB_HI, 0, 16)
+    FIELD(STE_7, S2TTB_HI, 0, 24)

---

Is that OK with you? Do TTB0_HI/TTB1_HI need update too?

> 
> Do you need me to resend this series?

Hopefully no :)

Regards,

Phil.

