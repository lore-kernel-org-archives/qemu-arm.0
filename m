Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A2AC87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 08:42:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiqkn-0006X7-IJ; Mon, 04 Aug 2025 04:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uiqjf-0005lf-Ta
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 04:40:06 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uiqjd-0001dS-HW
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 04:39:59 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so35744895e9.3
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 01:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754296796; x=1754901596; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DJGmf6TtoH0Yx7x1xGBQhkJ3Vnxk6XzJohDpKgXk1UI=;
 b=v/zLAYhWGYweXWzoqKIA9VRK8j5uf7PrUicyCdqRmWaz9Xm2vtZklNTH+7ZDgFdEAe
 ie8Q+dP/0yz8M8QVaxK9g35pToElQvdIdspbC0hvtmqnBiT7yXMXZk7eTW/plNk8cA6h
 FdHdk5YNsfBxrHLnflojDZLXjuqlMdQRWqYLEx12MS03CdFqDaZS15tz3z/F0J9Xjo2t
 8QaM7C/sn/AkF+Gg8curjjXDTSuw5F7k3N5y9CaaSqAAodu28vmOOQUvzFfL8lhYDNp9
 aTr5wYPtyTqclKHuDaqiUOoQ9cqLrLw1OkL7/eBu+6GF6vulgQS+EiUv8hEbo+g+bYSu
 B4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754296796; x=1754901596;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DJGmf6TtoH0Yx7x1xGBQhkJ3Vnxk6XzJohDpKgXk1UI=;
 b=ZLr69biQqGO/RMXZ3t4BHK/8RUVlyS1OAZv0IdulfpIA2grVEmGfDCM1MDd9sg3sKc
 uInmo+c7MFLqidVc4c5Tp07/a4d+IZ8Eugo0oahbeSKuswIDpBWRiAMvuVjPjDC260kP
 dZY5FH3EHCwEEyLkCNtwVbRgSSor+qYZtPG7JIn/ELXAunKmb5JKPu9OXXmniou26lGX
 GeW+nqXO9bC6jVWsqDbB4NhLAra5HmLeNHkqx0qolYiolfKeFBxOCbiqwrCDnjh2LGaq
 1NAUJOTp+arAIx8PaJY68TFdfAY9ONEG2SA9InxCGyLlsXrY41Pj2xnqyedb6aRg+9+6
 oGWg==
X-Gm-Message-State: AOJu0YxJyRZIpJBYfwP7pImLzKF5uT8H6igE0N6XHavFR8sMG4T59GnY
 HQahi1vAXtFee/rZXIJXAhrVFWMgFwUy4GfHlXAepHL9mpd7DEVXs8b+Bl7mevdtMfY=
X-Gm-Gg: ASbGncvlzWgA5HyVCdPnBjAMYksOJfsfG5q7T7M1CwmYDm3+0MuQ2pD3dpTSe+U6ypD
 Cx2MA7Aa1cbL6M3+e0AlRJp/nBGyTlTJ1jfqjRq6HsmJcyYI/wgqBsVFfGmMWC3VHhPjMCADXr8
 ihLf+Fm9i3zEJmGd9suSE0JTMJXjhjH1tXv16VdeS1bMWeqkHwHgQMUcMcJBbERWHVd4lMPs13h
 3Khy713aOfnZTbbEE7u9R27u7l21cuVb4jgvKZwl7iOd2jyqvCvCW6TQGtwBxmSOBP9Ab/+ji/a
 yIzGNHJkvQGcb9WrtV/7ImSTt9yHHkPBN3H2WZ+btp3RYhIT5lQUO+LTSYvS1EszFei/2UzGIhn
 qfHMasgqYSFCoaJSJ8/MhAmzJlIy9WzHa48CeBcxrMbvpLw+dcgeBXPp2ZK1sw+mfBbXzs8o=
X-Google-Smtp-Source: AGHT+IElvMu9ig6qA6OAvBUBOC09G0K8Bi76FCKZIP3WXYbJCBWC/Vg0Yz8kt2HCjBu4rgpwzo2WQA==
X-Received: by 2002:a05:6000:144f:b0:3a5:8d08:6239 with SMTP id
 ffacd0b85a97d-3b8d9474fefmr6498925f8f.21.1754296795907; 
 Mon, 04 Aug 2025 01:39:55 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0b2d2fasm4635496f8f.50.2025.08.04.01.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 01:39:55 -0700 (PDT)
Message-ID: <25998fdf-9053-4f4c-ba8a-0743f3d750e6@linaro.org>
Date: Mon, 4 Aug 2025 10:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hw/meson: enter target hw first
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250801174006.2466508-1-pierrick.bouvier@linaro.org>
 <20250801174006.2466508-2-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250801174006.2466508-2-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 1/8/25 19:40, Pierrick Bouvier wrote:
> We can reuse target source sets for "generic" devices that are related
> to a single architecture (like interrupt controllers).
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/meson.build | 45 +++++++++++++++++++++++----------------------
>   1 file changed, 23 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


