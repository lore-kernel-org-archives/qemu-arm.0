Received: by 2002:a05:7022:43a6:b0:92:a90b:6588 with SMTP id bo38csp1346709dlb;
        Thu, 9 Jan 2025 03:58:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWOynbucc4vb4kYK/1FzL4XqnXFDdKhyC8+Dh4b9QOg/CLTXuRIZ5pHSzI+7kzBmP2dhLrIosuSLWnsSw==@linaro.org
X-Google-Smtp-Source: AGHT+IEt0Y8za2ar0B2Yfqi+se4PsH6cEIGT9vMsxalgMJOyymhYuMHbAuxYse+8LWx7MPmrNI4H
X-Received: by 2002:a05:620a:c50:b0:7b9:a387:3cd8 with SMTP id af79cd13be357-7bcd97bc29emr885173985a.42.1736423907914;
        Thu, 09 Jan 2025 03:58:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736423907; cv=none;
        d=google.com; s=arc-20240605;
        b=aXtB4ywchba3bjfsynFu0MOr06QkrYJ2JqpHGm7e0YJJbVqPDgEeyIjBwuaM2SRlqA
         rSbZSZXH1jw4bLbtmbvFPViNGRAYYZVJ5ZDEfozZnhNDRauyh9srBiVBruV4jyLWayet
         vRPji3DkRv59hjy3uUXkQPUEDzBmmLBvuY2ThsHr8qTz+olbaWOQrpjJk/akwwS8Abh/
         6Chpn53IElm/JKRRv7HgLubtGU+cckxJtykKx1wTnv4bTyK6prs2kgR5wBBEc8YLKhQt
         JTDAERmac1Tj3YqY2dKdklXuWFzx4bjuYjjc3RuRlvxiM5ne2B0vBpriWEw1wcuovuUt
         Q4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vkn8meHqj9uHYU4FyrKSESvarrmpdT2op10jKNSIb7A=;
        fh=yMFOl3kPAflPimIWY6eL6NiDeuCdAWhjDY6WEUkRZLY=;
        b=Mho7v0YW/El13HgRhEjbnqJzF89N6Y1WY9p8ySm2tIkCqMgwxJEbPb5BcFfZLcLs2t
         obNZ2T9ivUSFphR6ymlUDuxwIqqPfbjYOnhOs311Mm53+xiOFOBPQ452NafBdyTEHTVz
         BUjwuUBgXxpYPhaPfx4hkrbRvJj+RpRrf8FjBxG+ewZHnMO09ULA7gDjc9PGqlLU2SED
         YBpVdpcfvBpeze8ndx/pIgJqvEaWEuxzVTMLTXNuoikapn0ilyXRwRtUib5Ep2PLmooR
         VhgOFFdgxSdLF68okrKeBl4cWoEQGvFheFivbMiIDuyIAqNoW9zbZhCo8+S+d4wfVFQS
         fYQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HItu42Sn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce32376e2si140804185a.146.2025.01.09.03.58.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2025 03:58:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HItu42Sn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVrBC-0002VS-0B; Thu, 09 Jan 2025 06:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVrB4-0002IK-B2
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 06:58:18 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVrB1-0002iW-Rs
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 06:58:18 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso8619545e9.2
 for <qemu-arm@nongnu.org>; Thu, 09 Jan 2025 03:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736423890; x=1737028690; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vkn8meHqj9uHYU4FyrKSESvarrmpdT2op10jKNSIb7A=;
 b=HItu42Snj4XHcW1YpdOXxw/ycyuqenacDXm5XiKeJvK45RLDlEdqivpSszoQttfchU
 ctlJVS+et0tccTMKiDcxwOBYnT1N07LXM/1vtPqy1jmJ9XgeHGLs/ain+O5tiqc7GgO1
 Gm62AcNPTPQ/1rln3XE8EymTNTX2w2QrJ8kVyd+d60wgnl46cO3gf5Ho7xdWFpDs22wa
 etlRmUlF2ozlkpCPjpdrnvVH7K2SzQJJBSbhCbZ1uh9sfzIHK0vmcrxCXmqaeLt9K9J4
 0U6eit3egPZU8MciUABbQm4diACIYtknIxkGp+IkHYZtn26ioYeZw2LrxDEtDV4hKWAp
 kWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736423890; x=1737028690;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vkn8meHqj9uHYU4FyrKSESvarrmpdT2op10jKNSIb7A=;
 b=A+TJBXG9AS87hVDjcFBgjubMCRHYcLCGrFMGI7T58nHBqu4TzMwRc8GWJ917XVKJtz
 LzkXsoeBBBUZ9xIDvTgaKr0ok4ew/jbcatA0KoeC1S3sbdfbBvYEL8utlAmBjc0MzFiX
 su00GOSsN5/qfg7EpFVRdSU4oX8R0wyAIp4ZFoXXH3afBjD7NJzCCTXY01cZ2ZMcaUZl
 iSELXek4OtFIxFZ6eX08gUiHU0EoEdxaQpRwWWemzna7p6cgWbusBRMa5SMcL/eotd1v
 6NoASbKPIey45EltpoggIctnrbRDq4khMNNDoWDtht3XlITVKRkjCoDvOl12WHdGXicI
 9HVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5DUbgdBn0umkAVFmUXrkt+NjmQtnuiS40eFChgm+Z7zqimxleRtEXit2yg8InEkAX6f46qx27LQ==@nongnu.org
X-Gm-Message-State: AOJu0YzsicH4tBpW2eG7rF+nRQLReK8J12SGhl0S94cEa5hdPoa7N1E+
 s0LSYty61p3eS0elRNgImolulATQHCIssXGz6AwGN4jF/DAM7LbUpPSnIHl9o3M=
X-Gm-Gg: ASbGncub0PMD0F83TFCDaYBOQFHzmDe1US9FkqZm08TEdzxNVEa2EfZ72QCgXBEAWMg
 j2AvJn6PdGlTmAb15C9bRgTpOZbXTHHb0FvbcreDPpfygwwee+9d/7HMQurOWQtvtxGhakcnJrO
 oeUMrFn46+Q4G+LdiLV41wPElMdfaWz3uSvvDGuG2RS9NSZz7a01N4QbltIqMzWC8YFj+nf/4uk
 6glcHOczXTEHHbCrmMJJBKfbOLrTH2VRmZBt6vaJ+n6GGaNg1hTNURtZ24ISwCP4+/8fzMI8LoB
 2E0FlWL6PPigyLcg0T+/ABPT
X-Received: by 2002:a05:600c:6c0b:b0:434:ff25:199f with SMTP id
 5b1f17b1804b1-436e2707f07mr51274265e9.26.1736423890528; 
 Thu, 09 Jan 2025 03:58:10 -0800 (PST)
Received: from [192.168.69.102] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37d447sm1625751f8f.4.2025.01.09.03.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 03:58:10 -0800 (PST)
Message-ID: <6c9107c9-e901-43e6-b737-a4152542846b@linaro.org>
Date: Thu, 9 Jan 2025 12:58:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] tests/qtest/libqos: Reuse TYPE_IMX_I2C define
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Guenter Roeck <linux@roeck-us.net>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250108092538.11474-1-shentey@gmail.com>
 <20250108092538.11474-12-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250108092538.11474-12-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: Ya834MhuLInb

On 8/1/25 10:25, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   tests/qtest/libqos/arm-imx25-pdk-machine.c | 5 +++--
>   tests/qtest/libqos/i2c-imx.c               | 4 ++--
>   2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
