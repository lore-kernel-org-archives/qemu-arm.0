Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2596357njb;
        Mon, 3 Mar 2025 05:07:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVzzSGPFU6epgi20qpPu/hIRBNTAL495ex3/Qvy9YCqzkUe2QB6ZVlcFYocp56LzFd1aHEVzGdIWMGcSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHHR7C5aBM5KibTa91MhlFve9J17E8U51ipTLqh9bofm/VUSwuC2J67uPxmM2eHGaT3TU85
X-Received: by 2002:a67:fd15:0:b0:4c0:494a:6677 with SMTP id ada2fe7eead31-4c0494a7542mr4952236137.7.1741007225835;
        Mon, 03 Mar 2025 05:07:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741007225; cv=none;
        d=google.com; s=arc-20240605;
        b=KAtCzGEOAzLCRWJ8P6HkYBQW9bN3T7n5mF1yO9eHuHLjDH1e4HrzAGj/97VnKwDVGm
         kvabrXGZTYVvtDJU0aZzO43e3L2Yks/YfCPD8eBxSlRH9wTdOyTu/vIexsE01sUI/xyP
         NpUK39qfl6u2YTlxSp+9H+v4jWkrucmELGfBbSVQ46SzklazMfBMl3q5r40eZDPsostR
         g1ooYokNsEf9PSEjU3vmy/sAtdeXafaIYzrNsvjZfeKbuzzmlqfc0OJ3cEZJ9i4nnzNo
         VBtr/9/U27Ed3yNy9yhfT8/QwlnA4Qz3/cuU6KW8qV5i9ulj+w0Y9x8YAYyJUM/+sMNx
         7L7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=RyLZCqNSpgnRk0wvUnEiBPuTTrec3Ig7km3xSg0ZUgY=;
        fh=+ZXIxdizvVLDan7uVPBGrL20z3bNwKxRODdC/v8EVxU=;
        b=iDzK+/4ftMKRfVFQM42wlR/WBADKCJpkBFGhvOHtM7xPefJ8y6bV6vNkdWGj2Xfl07
         QTRyzjYjLzHr4XkgBi6rnOLCpJEzHMu307X0E+XaluHR5CtPk0L7AQUqXw/o922LyJlf
         y/yjT0mnMeW6InTXn0maBUHTVKWVcMY/mJYpRigyROJkfpLalOuBMf3IhS6usBvSWstL
         YzfJtovPYE5Qb4lk2QX/TPzGMYGPI1sTetIaWVottfwPKWy/YJ74LeGEzGPfyiuSzeiu
         VKT/41oWXupT+3IPs0AUHvF2kMSB5GdOEmgBnxPkb3Nnhz/aKFWtx+J+Ekpec3hAxwGk
         d2Sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JMsDlF8k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c176e51d3bsi897749137.527.2025.03.03.05.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 05:07:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JMsDlF8k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp5Ut-0008VO-3w; Mon, 03 Mar 2025 08:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp5Ug-0008SO-L3
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 08:06:03 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp5Uc-0004Sf-Gj
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 08:06:01 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-390f5556579so1428890f8f.1
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 05:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741007156; x=1741611956; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RyLZCqNSpgnRk0wvUnEiBPuTTrec3Ig7km3xSg0ZUgY=;
 b=JMsDlF8ktTJx6MKvaId6tgcZq44L4zSUR7+DZxQuaRcyUtf/SP6+dKu/BRkp5ufZho
 sHnmgJT4kNsrzpwXL9Xs7QndkV5ApDqiKZh6HRvpPeK5Ejc9W4Tse9PkaokdslxdJO+R
 jXVpcHpVzfNKu2pJeGmtrkd7kS0SgsP8sMWRBmpDCXyRgKKPBdsijt5ZI+bWMS3GU791
 hVf7hP/9iFPGBpaGei3GBUdmGoGgWRWPrXBj0UGmoz2tqM14BwoDIQeRUt5p0x3O/gJN
 8GSEUjXymGpLL90pRLzCi42So5+f8gtMFT4r0E69yJPc6ZQ21DwBjATRmH3gNB476zqa
 FBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741007156; x=1741611956;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RyLZCqNSpgnRk0wvUnEiBPuTTrec3Ig7km3xSg0ZUgY=;
 b=G+eJKLeVPd7vFVDXDRexGIWo8W9o5cntnV/7u7CKIitaSkbr3KQ8jrjbkY7k52+Wht
 inrMAcdMZEIr5d2DH4u1WR+JaVOKS1uIUb2tFCC4MdN5XfJ5NKJc8wRykkqpKjXGxXPn
 SfmtdP0ZGo6R/IrA+z88CXcS3cnsPY5K5NRiR+ciivvKGoaebu5jXItqVvozQEtV3oTB
 DaxyIezzhH0pT4bQP9Y3qfz9XF7unUdjgXf+sGTlbb07YjM4y647BS5HoxHY9F65eijr
 MobByVub1KublFyDeSxWrdslCR2//p0Ga7Fdm0dN/uTxfnISsnpY7in2wB3dNHMIQ0bx
 LCUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhFLxAtlwfOIcOJp77rUxU9LWlEbETSrHF9m8TL0eszDS4ORs+RB9RIWGvwdr9Vk/8Y77jFSCtBg==@nongnu.org
X-Gm-Message-State: AOJu0Yzm+q2wHsugf03GYB3ua1GV1ki7REpL2RSlODgAd0oAtUHmE2l9
 JcOqnIxfft0zFYCrJcPb33/bxIVq0YInDkPPEjXdePNV7Chs6uinA2W5o+XoYNWCbdrpd/8wSfy
 ROxb0zA==
X-Gm-Gg: ASbGncuDNeC4DbBSAYxdBqdy9o4GfoUQp1hhrMISNyTX8xglhqmMyTElJR7e0qUjrbX
 DGt0sizvToZmoH3lI1k4cYP9u4agjEFawOZ/Z8/GtDSU5o12sKskkFaMbC8CAydMDxjL5qPqtBX
 RjSwt7W2CRgS9BvSuHIV0j5sDIVwAUMP0lzhJzZ6GuN8ua+tzaNIMCnb6/McKe13VPCRLeqmQkm
 A04DkrDI1Hu8LjIwSDiHMiaJ3SDEvtclPW45DQZQ/eCVQq9nK8GCQnFQLVj8RUXzIJ2LUQoZukk
 VynU2A5dCM2pU7FWNFw02ZQCMmBp9O1UCLQgmmHK7BiLMuGGKSe71yETsrm/Rar76qDhhpPvfS1
 IF4xr3Zt+O9Ss
X-Received: by 2002:a05:6000:2b04:b0:390:df7f:c20a with SMTP id
 ffacd0b85a97d-390ec9c19a2mr8384507f8f.33.1741007155871; 
 Mon, 03 Mar 2025 05:05:55 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e484489esm14771600f8f.68.2025.03.03.05.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 05:05:55 -0800 (PST)
Message-ID: <46c17165-35c7-4e21-968a-40968c4d50d5@linaro.org>
Date: Mon, 3 Mar 2025 14:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] hw/arm: Remove printf() calls
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250227170117.1726895-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250227170117.1726895-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: 9keJEUshf2qQ

On 27/2/25 18:01, Peter Maydell wrote:

> Peter Maydell (5):
>    hw/arm/omap1: Convert raw printfs to qemu_log_mask()
>    hw/arm/omap1: Drop ALMDEBUG ifdeffed out code
>    hw/arm/omap1: Convert information printfs to tracepoints
>    hw/arm/omap_sx1.c: Remove ifdeffed out debug printf
>    hw/arm/versatilepb: Convert printfs to LOG_GUEST_ERROR

Thanks, series queued to hw-misc (with the suggested trace event
name changes in patch 3).

Regards,

Phil.

