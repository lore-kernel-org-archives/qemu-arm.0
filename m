Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80078CD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:31:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3Un-0000La-2P; Thu, 21 May 2026 09:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wQ3UX-0000GP-T2
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:31:15 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wQ3UU-0004Vy-Pv
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:31:12 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-44a044cb827so4532563f8f.0
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779370257; x=1779975057; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wdkQiUdN75GBYYbmH+MsPbC1r9ZIosLYoDKDB9VqTIY=;
 b=k6EMAmR1CjMpODSCoGpuuaVMIl9+dttkXeNp5ipnky0Hb/EoRhq+uwyzd/tuvqt2Li
 evX9cCaPTf2fpc+cHPPBVXmZB74wGumR5LrSWLUtWun7Z8UtFJ7MsMx1MHyVqlDJ5Aui
 0z1QKIqoFRcLx4ZE5MxJZh9zbjigF6oPkipDj5Bhz8ZV0aT3igiVZo9VARq/GtIEWVKU
 9yf9yFXp8jlyppK/p8SyehAaPUtaiQWmP/KezlW1VFzZlP/JQ/rSGewgJL6D1Ecdx1Oe
 A+KH/bCmJZr8FFxR6L2cyEjimkz0RZCywHHJzLf3qlov8WwjFqAEcX8TbTki7YsNRE9j
 6H8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779370257; x=1779975057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wdkQiUdN75GBYYbmH+MsPbC1r9ZIosLYoDKDB9VqTIY=;
 b=PIPyJ8Hx9bswInOuEgD9QjphSKfS0wPCCJ+OQA6XqXI9z+KTbgqtpKNYpUtCR7NXj3
 AhHfz9xhSVyzOpW9whNQFGJog7+yhKjOZjfvFLajYvnI2dKqn6fjj70MyxZ3JSXvtG8G
 XMQ5lHY0Y45Ps5OTKmYCYZECA1IFpzBRwi1F7P1g9Efd2gOrrMnw3R1Im9IiFGrOV2cl
 X4ip0v+f4re/NnYpf4i/iG7Wxx4nWJFd2k6DsVDYoYfrjsON7RHsKrmRsdNIzwayNFJM
 900UoYnS3Ng8hkPNv1npoEXQtb2wTbeNQ1rx34NfwgIrBn/M4VlVFuo6hBU5keTqPV2E
 YR+w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9N697zJ8v1KVcwYkRDaBHW8FY4Nj6QLRtMXRESvuwhFMUE9/E22NpYBfKc8ndxenjIws4LBzJvTw==@nongnu.org
X-Gm-Message-State: AOJu0YwN2sdhbyWBenyRfjxusl2bQAMhwU5LkvulkY8OOhDNHyxvtb/+
 XHh6VGLlvaLewtBEqqLY44+3ph7EPWFv1EtT7Vb+ondvTg9RSOaMITcXE9ojC846GIY=
X-Gm-Gg: Acq92OEiLlfKZe4Evf3WF+cW1LxlYVN61dTYnGRyD9SU6hen1xzzp6+pBZJloVrWAGo
 1ngV46B5E/mzANPvUassuRPQJA34SLM9qquTjFCr4vDfHYQxYbmYsFOu6xQ9RLg9K4l4CdeEeJW
 /Pslv3cRHwV8r7OEO5sH73kZYHKVSUd4ZS0cw09CRCUdpUg6LqkZD0rBP6K20wMaMA3p606X/U/
 ITGJvaqnAFhVT2wbdoQ8QM+OF2fFz3pHJmsNLlXRSzY8MCvjB8ihd755FqGU7U/eQSNskDrqK7E
 je6DbzPKyvjKFls5ioVxGw1aCO2Ms041pCCoKvdoeDnsbsBuBO27kmIT/w2vjeRmlXDG+6h4/Aq
 i45vOLeg1+HkZBjCcFOzIsMm3Um+ZGuvtAXxstpHLxuGf/ooA4uEobTY38M30xCVQxxot4Uf2Yf
 p9RXmIu8YaVYZAN6Fl2Ce7LTTX4ihjlEBgli+RWeCxGEeAKOYDh+PxYV6lAP+KCJXN7g==
X-Received: by 2002:a05:6000:428a:b0:449:af52:614d with SMTP id
 ffacd0b85a97d-45ea38e929amr4311680f8f.11.1779370256692; 
 Thu, 21 May 2026 06:30:56 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa936333sm2900474f8f.27.2026.05.21.06.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 06:30:54 -0700 (PDT)
Message-ID: <fcb8a411-ec20-427c-bafe-45e4d01532af@linaro.org>
Date: Thu, 21 May 2026 15:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hw/nvram: add load_image_to_fw_cfg_file()
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20260521112806.504961-1-kraxel@redhat.com>
 <20260521112806.504961-2-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260521112806.504961-2-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 21/5/26 13:28, Gerd Hoffmann wrote:
> Function is simliar to load_image_to_fw_cfg() but loads the
> image into a named fw_cfg file instead of fixed keys.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   hw/nvram/fw_cfg.c         | 22 ++++++++++++++++++++++
>   include/hw/nvram/fw_cfg.h | 15 +++++++++++++++
>   2 files changed, 37 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

