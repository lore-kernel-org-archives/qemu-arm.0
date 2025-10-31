Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BDFCCF9F8
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Oct 2025 14:04:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEpjd-0002gs-5A; Fri, 31 Oct 2025 10:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEpjY-0002gg-IL
 for qemu-arm@nongnu.org; Fri, 31 Oct 2025 10:04:05 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEpjQ-00042P-EE
 for qemu-arm@nongnu.org; Fri, 31 Oct 2025 10:04:03 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso28804065e9.3
 for <qemu-arm@nongnu.org>; Fri, 31 Oct 2025 07:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761919432; x=1762524232; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rZHbRfXJ7JvJdmXH6R62+5+8A8/vuHckHBmQG5mKo3A=;
 b=X5I1E3DPq0h0WmaXOqSW1JvQ0jYie+E66Gky78298fOkeojYUIkA1IJGG3AwqecsJs
 rHn3EKipOdSOt4AugKrAEalTEXqJCx+X9LWouLQ2uTy9qXXv0jtC/gUVl+b38D1xkkFl
 Hb+6GSYLpJ+OgYOO3snY90zlazAWZLFr5txrpdQBOMVPDxzc/+lsGh6r2GUb9Cyziyvm
 hwDs3xaQclHFRiyGgsIB80+F3Gv2RhNxbbOpYnR2lu9a4Z0QIe0PeRy4Tw0prPKviKUQ
 LsX0LH1hVjr16QyWZ6Gj4W/byQE3GhSszAgvdw+8+GgkQZ2LKGM06rn2k0kzuFA0BCZq
 FRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761919432; x=1762524232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rZHbRfXJ7JvJdmXH6R62+5+8A8/vuHckHBmQG5mKo3A=;
 b=bDe1WCJoDNjaM2muZll61ejFDtYt0Sa9w/9D7UJz2L5osy7gEzqpKa942cDjgkk1iG
 NY0rJJkXPnk5vj35H45Q2M4ybv9XFWnLC1Vl+kKt9pq4Z4DPjUBZBKHtLjTJT2ROI/xw
 eJDOVKFukWhQ+uNrpwAks2p/3bhq/l7WjbilLqFODTBYYJXbMRRUMEgGsqGe+pxsSKdS
 2sN3gmy5MbLzOMDXFyMTRRvlMyryfzwW8kcdifM9qG1fjn1Ar0qgTFuhNdWqnFJH44eY
 15Dsxs2zW1e6I2QKq62G/hw1JLf+JnK6P1M12US0s0URvEr9Vp3oPGo5vxSuH8a9PD2b
 RaeQ==
X-Gm-Message-State: AOJu0Yy5H7OQs9Ct8+8+wWIKyypSDKAwIoMw6karT5UmOfHcexQMGxev
 8+SJZWwUxL0woAMSEUC3QVpWpwTe0Cs8I3FlJbhz6/6HZf3VWAW+MDbwkqUFDaCxHtk=
X-Gm-Gg: ASbGncvaac7djIssqMvNWdzgdxGTwD34WlAzoeGsUu6u6Sen3bVhhbU89SJhWf+Qfyf
 WdvWhOrVrlCJyfGvhTne37VRUcEZwpT+tmsbBTBdxrP6l+zQHgmiFWp2toRKCNnXMl5a4piGUua
 rKirE7MI4jboQhFd84MApEAFD3vFVIF5zw8zDeWsXma2IXSgdKvuXxYupHedD2VuPZKU6+eR0le
 F2gYc2vMVbVGDOwIcj2CyI7EeYlNhoqOoKxsn+1BI7Mr+v2G5Soy1baOLattw/+HlyTPipGNHrZ
 KRKhB2WQyPAQRGQe1+tON5BvW6XhoIMlVzBOzp6qC6YAbs05tq7OTBjB6tl0OvsPODhYie4LaRL
 ZcwwMByvUyjkQqMUSrk7K6TGcomdxiC2TkVNmZQ8LzapxKgIVIO/QOgLkCFugdx+He+XZibc/l2
 PRKaQs841vZYsA7/Yg/1Zkxnezf98oguAvdZamjqIp8RcK9qOt48rCiG3ZxDXbUAJPNIaVTS2s3
 /rC
X-Google-Smtp-Source: AGHT+IEGait/270Xwdmbz9TRFwGcPaQUqO7sU6aoLNu3OZqMuYXdWPPrLJgmSRR91/kjqwsC7FQaGA==
X-Received: by 2002:a05:600c:8b43:b0:477:1af2:f40a with SMTP id
 5b1f17b1804b1-4773b1d39e0mr6207755e9.17.1761919432161; 
 Fri, 31 Oct 2025 07:03:52 -0700 (PDT)
Received: from [192.168.1.17] (adijon-656-1-155-31.w90-33.abo.wanadoo.fr.
 [90.33.190.31]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c1142c3csm3748530f8f.16.2025.10.31.07.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 07:03:51 -0700 (PDT)
Message-ID: <c1e09752-49a3-419e-8849-6dab8507dda4@linaro.org>
Date: Fri, 31 Oct 2025 15:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hw/arm/imx8mp-evk: Fix guest time in KVM mode
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20251029142311.2986-1-shentey@gmail.com>
 <20251029142311.2986-3-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251029142311.2986-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 29/10/25 15:23, Bernhard Beschow wrote:
> The imx8mp DTB hardcodes the clock frequency of the system counter to 8MHz.
> In KVM mode, the host CPU is used whose system counter runs at a different
> frequency, resulting in the guest clock running slower or faster. Fix this
> by not hardcoding the clock frequency which makes the Linux driver read
> the real clock frequency from the register.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/imx8mp-evk.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


