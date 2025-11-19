Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E4ACF258E
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Nov 2025 07:50:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLcxL-0007f8-Nj; Wed, 19 Nov 2025 02:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vLcx8-0007ci-SR
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 02:50:12 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vLcx3-00034z-Qz
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 02:50:09 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-477770019e4so66821155e9.3
 for <qemu-arm@nongnu.org>; Tue, 18 Nov 2025 23:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763538601; x=1764143401; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FJ+QmTMK/yL4WwUPLL+36Dcb1t/YVv83d7fJPKTkS3s=;
 b=j7lU/PCL+WfDEg2mF9yWAFEIkRhE36E8KK8U0roWfKr5lvYlsydmggJZevxsHEx912
 H7lilk8SQhGI+eR6e8u6JjBlUj/9US3olPURHhDzjpL26yazttpkm7klImjXeAR/xKuu
 ak9FLScH1daqLb1eamlS1MT2iLFIhSmNNPyJKj36wwmUjgEjYmGI/PVhDggSrdakdemK
 ck4N0JBpzAk1HdFmdgYLE1oXolZhAV64Kw2k+oHF4OZFkXA8gx2GEQK3JIxQ57/8/O0E
 p9aEKq9b0/phoIyECuAxncI8vlv4KteuwqiHJ1SvLyv8223JUkCZeWfZNmZjU6xTBYGv
 irZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763538601; x=1764143401;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FJ+QmTMK/yL4WwUPLL+36Dcb1t/YVv83d7fJPKTkS3s=;
 b=bqdflXZwALqExh/VJxaSGB8rdkAR9RkpppSyG+AzXoIls+2HRMJ6yz4aTwFbvEADOe
 TEjn7CuxNJ9DD8shG1ENgHzr6ZLpITdIbcmHIiVRC/iq0vHhFXhdtHYwwHRv4wlbFEqk
 z341jtL3haQOPewXronTjTSUb2IPYBeNlEJWqxibjLLBZxZBAFEfhHCVIIgbTNlXd0od
 TJZCZcR6Nafn9PDcNJ0m7MD4T5tidq23G5o7kBzuNs3HtXu3uAuI9mZUmFRyrars/oUG
 qf3r0sC7x5P5SXg0UAn2RbWOtgF18XWwnk8Su+Si1JYoMexuQIdIb9BVoTuC2l3rV9L1
 +U5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJpxDl4p3kc7H87XyjjAqneToQi541DhXyMpsMsCa89a/2cDX5NIGJ+huIkjd9zqomyVu6RchjaA==@nongnu.org
X-Gm-Message-State: AOJu0YwZwItxCAZNvT76f0H9B4WBPZ5klJP3BgGZdrljkSrlpFf8yIbI
 DLtcJp9JxviD5PhtLAQpU3GGqN6mCT9syDZniCCIhP1ToQlZwI409kkkOGiGpUTXUHo=
X-Gm-Gg: ASbGnctojjLrt746njF2DXbKbew7zY5ULNG71ed1MyYjwydOOikNobonIoty749ojJB
 vGr2DXzoIt0qv0WH+Q7oV/bwWa12VH6fWeFcMyJjqO9fzdyHIP+p6GoIj5bBQ1h1Hwy4Uhr3X8u
 uHcuDPVmncYcRB+eyVohKey0O7Yvp0NuGVaNpy8NMuT1SoDuOT3AFuLjJ6PKXrxsCQIjDmiPt2/
 2ku7KqxZwt1AWH5UN+AgBlFPMENwNGLY3TkH14ExS6XMbFu0gCSlAC/bEip+2V2L3moKNbJ6QVM
 Nq+r5sgCde7Eiwg1S1ET0melOqoKNmtX1AHffc7tXbvxXAkThOSQskCaWkOmFJcbpYpwSdztuOF
 wjIzZdpihM/k7NThNm1AigtUj/HewDHIH5WX/Q9q1aVIC176KPSnYsATC0LYuAfjLD4dP7EdEMp
 IZe8tMnGiKPvWB7EpFX+4p4T6it+KAjtU4AhOTpDXn9fNfH2AG3EPGFoecoq8uOBSbqzPk6zadK
 yNn/g==
X-Google-Smtp-Source: AGHT+IHlHYPZYZ/A8dlSBOApFfINloS/UkSxz/qceUhwqiN5F3xbDyOGt7NibTP7G79oxS8BR10B0A==
X-Received: by 2002:a05:600c:3b12:b0:46e:761b:e7ff with SMTP id
 5b1f17b1804b1-4778fe89ed9mr150826425e9.28.1763538601238; 
 Tue, 18 Nov 2025 23:50:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ed5:b1f0:90e8:1fdb:2cba:9db1?
 ([2a01:e0a:ed5:b1f0:90e8:1fdb:2cba:9db1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b1022a32sm39203225e9.8.2025.11.18.23.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 23:50:00 -0800 (PST)
Message-ID: <0820f522-1174-4a92-8f4f-168511d959ae@linaro.org>
Date: Wed, 19 Nov 2025 08:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 09/10] tests/tcg: added test for MTE canonical and
 NAT
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org
References: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
 <20251116-feat-mte4-v2-9-9a7122b7fa76@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251116-feat-mte4-v2-9-9a7122b7fa76@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 11/17/25 02:40, Gabriel Brookman wrote:
> +    p0 = (int *) (((long) p0) | (1ll << 56));

mixing long and ll is sketchy.

Best to use uintptr_t anyway.


r~

