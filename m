Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873E8C83F17
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 16:53:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZuW8-0002sZ-H9; Thu, 10 Jul 2025 12:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZu9b-0002vg-Ad
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:29:54 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZu9Y-0003pP-7w
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:29:47 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-237311f5a54so11130445ad.2
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 09:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752164977; x=1752769777; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wtGwUc5A7pk1NnKmmvyZgHPr3BcQayREo9qXinaIQMo=;
 b=zW61qQTeRJE2WeM0+RPHQnGvoIC4BGiUdLrU7FRfkW2etauP6FKidBpbeHHJZjDd/8
 4toqhdOMTz86JDLqFyCuRJy3PC2LllCv7R6YEvGniLIo3oS5nsTdbq6s+4QqVBjI2aBD
 Vx4RFnsf0NTdZGzcoL9tomQcZc+SXPzpkpIP2kbugCXsU9tuAWTElS8SdRinpA5LJkTw
 rrmqALr44puM/wmFMgCq8OYLhhZoOO0gqlWixYgeXIERkFOEFnzNigHT2sQbIGd4KoED
 2cVbFxNx0G1V2dTT7g+p1fcrMujzZ+mHGcpkUWA4F2Iwh8VHFdihU2sGm27vc3Vde82F
 MnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164977; x=1752769777;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wtGwUc5A7pk1NnKmmvyZgHPr3BcQayREo9qXinaIQMo=;
 b=CvmksPbUBRmLISMWFxxBWLzrNOyuUCl06B8sHlgGb/T1rX/g+iOLQqZZwtvDiajbYV
 T86rO5+Vy+zCvzGIHfBqT345X+urpS95a7PUv00uczaiX4mxo0+ysgI49GMwIEUu4UOL
 Awo8KZRtBqB+m2lOptRIEvgA2oirzi+YcUvipBTK0kqdg9p5wHxdf6PT8sjH0i0AJ3vi
 e3kYKljTsz/F4VUH/SWAPti6JayW3CuJFbBxR6Teq3hkOT6FeTGadQszohe1WxOhQ2P+
 sFNjhLylCk/V+tdptJ1WoDKu8fpEJExMnLQ2OUfu98KHZVV/naagQMjbUbuD/weZTRF+
 Z32w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1gAaD+sRo3kmnDB0D2dGVlz6d7FNfHbJaM8CPulxUwmaGcHYmgiFe1Kc+F+NbzN1gUOiM+TmAtQ==@nongnu.org
X-Gm-Message-State: AOJu0YyYR8Xakw1zl5mVrCT2FiKYkv8eJx036p8W39reXKxA+Y1sS4UD
 Fb2e5vYjEB2d9/T4mV3d7/MRFyX/PgUoGEYmfsVzqmr9T1OoXkZ9KfbBXiTAH8OlWox5SAPN8ql
 IgNSXIoI=
X-Gm-Gg: ASbGncuIRROhs97YsmRr2u6npSaEBHHsxQuAvvqb4/phV206rZtafUnJv6/B71PPq2a
 965El4t8qefx509RsaScmVuGyIFUbUOQGvXdyBuSaPWufoY/q+wcfRUzcoX/Bq2hHBNvCvkixug
 hGPc2vUPFtT5NyiDN8jzorLEBWMD/Biy2eruQjNkQX3rtf+Cy7DlslG0Gn5VcO7SuXp1KiHLL7t
 NjD6GwaRd7zkymwt7373TeWbI/YOu1JRUUXpgCws30Om64n77lC8qJQ3so7JJjkIZ9xisgGf8/g
 7Vlxo0qVlPY6kX5Xr/uCAGDIqodk8VL1aeBp/17AAhM52+Wf5OKQsxJDEadqJM65qmucELuaIkI
 c/l3uMwd15fyXN3ARlio71sHInpXt
X-Google-Smtp-Source: AGHT+IGlyK+49LiXR5cY+/eOLthxkDzQg4eugL8ehFpC1Kp5OySSuyYEP2uHLHY9lrandpH+b0x67A==
X-Received: by 2002:a17:902:da85:b0:23c:8f4c:6658 with SMTP id
 d9443c01a7336-23de48725b3mr47074415ad.25.1752164977544; 
 Thu, 10 Jul 2025 09:29:37 -0700 (PDT)
Received: from [192.168.0.102] (189-47-46-41.dsl.telesp.net.br. [189.47.46.41])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4367be3sm23559935ad.251.2025.07.10.09.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 09:29:36 -0700 (PDT)
Message-ID: <2ded21e5-8c4c-4ab9-930d-906b31e944a0@linaro.org>
Date: Thu, 10 Jul 2025 13:29:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] target/arm: Advertise FEAT_MEC in cpu max
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org
References: <20250709180326.1079826-1-gustavo.romero@linaro.org>
 <20250709180326.1079826-7-gustavo.romero@linaro.org>
 <a15724b9-a0f4-4323-b8c1-3cdf8581ee43@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <a15724b9-a0f4-4323-b8c1-3cdf8581ee43@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62d.google.com
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

Hi Richard!

On 7/9/25 17:54, Richard Henderson wrote:
> On 7/9/25 12:03, Gustavo Romero wrote:
>> At this point, no real memory encryption is supported, but most software
>> stacks that rely on FEAT_MEC to run should work properly.
> 
> s/most //?
> 
> Anyway,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks a lot for the reviews :)

I'm sending v5 addressing your comments.


Cheers
Gustavo

