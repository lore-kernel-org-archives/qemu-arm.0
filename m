Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A14CFD313
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 12:28:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNVTw-0005YN-LP; Mon, 24 Nov 2025 07:15:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNVR8-0003bW-MI
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:12:55 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNVR6-0001rJ-VQ
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:12:54 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47790b080e4so22147595e9.3
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 04:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763986371; x=1764591171; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NlIk9BE33Kkt2TKZXPHF084E/NdbJl5VPKb5AxzgEYc=;
 b=kX8VuMRXl4xa0UB781FO3TAUp3A5/70rCU5XBSoC6wYsYzODNrJLtE9QkcCSzrz3wU
 jkiaysrtAacMxYye91c7tnPE9u2INdJnSEaKDYw5LV9dEWquH+NvAIRrdA2aUQjNaf1w
 /+Fp+ucsNjXAc9RLRqjPcNZKYaUBywDSNs66JFOqz8atsV3OwKi0WFBxnQgaAr0ciS/p
 dy79zvZurTM46mrAi2drmeLfqC315wgUDU09Kby9MBH+p98DX6wz8jZWZbfeMMvvPjmH
 iti/sOZum12+Uk34bLmU5iCY000opFnnHiO+msM3ghE+GXYeDPT4kRU+mh1AQ3fN8VRu
 Cdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763986371; x=1764591171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NlIk9BE33Kkt2TKZXPHF084E/NdbJl5VPKb5AxzgEYc=;
 b=F8lFwqSfFe+4zof7t8YFgmkB40DLIHwY+YO1oeCNyel44NZi+6hdoqmItLQo+0XmJV
 zeQwAWaBd5LfYwRfxhUo/OBiZFAQZVelQA7yiU+bcI7+llF5KqeIaN4ErjsgzgnaWa6a
 vlhAcN3Qs4aEC7AmaW3WhxJHRvrcNU/m/wsB4vu74A4mpiPp1f01h6VesFh/txdfPT/3
 HHKjJmzLBUANzdTmzUWkRpaLUk8Dk0HQRoFZi6RpJn3MAyO27XJUujQt/3iwg9MBZ/Qt
 xgC648ceOJAAPootu0+qTFgFPRBNGO+bJCPOlWFNwo4AqUH+jv23JlANNg45WOlbc47Q
 juWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV5lqZQ+wvfrWBVluUk08/+nGKuC1eLxz25Wj/W8BbUwNo/kywyCtIGI8UvXEUq37J64x+pamjSQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw4PAHEZqvFAKGY6oSEbJY98unbEsOHtbV5KvSM2gmoieX/5Ufc
 6/wIir6191rXJWw54tx/q1uTh/cNUA9R5IZ/A+IqhwOjJZLaKowvTM6lYiOs6E/acy8FFmfzS5m
 ejL0O97fBjw==
X-Gm-Gg: ASbGncsx+S9+HikNG57gvXpSgT6f1Mb4kgVdYPX6Ore0LVGw2F8/RpM16KkpaovBasl
 nTKgQOrhfOw9w4tKeARsLPvJmu+usRmVOcYpYMgMWy6qPskX+hVJVGO4P79ZYcpb9IznHasI9qN
 Ntq3fDhMKEF0lDMfXpsQQ2mKPk56/8XPdAdmdj3T4F2z5GyEwvRNmVGnnyg3ERO1z9actSDkf4e
 MY7AaEx9VHHEGgt3V+1HvthB3pRF0rKol3KsMDrIwa3AhfMv+LEHhLgSk86Hu+CzG/TuWT74d3K
 v/A2ho5pPbGJ9dNB5pxB76YxDE49otW7liuPyVz/DwCKW0VPqhvSnNRSQCjs9x4M+5L8+kUGmcL
 LYiFb2caXeRgpTCJnGB7BfmQ384I34jp3kbHYXQPz+PeuBvNLyqkLbT+bgcf/PrweZLak4Eh593
 kLqsaYg79bG7RtutrhVIcHGq86FXGkns6k8HbXDM2VQJJEZIokfD1fMQ==
X-Google-Smtp-Source: AGHT+IG/TKxfaoEnc6o3AgvU2TZC2jPkCsTas7UwPRS1x8kABo65y4rg2jH5tqDHwpzU+kSTrcCzJA==
X-Received: by 2002:a05:600c:1914:b0:471:114e:5894 with SMTP id
 5b1f17b1804b1-477c112587fmr88505895e9.25.1763986370859; 
 Mon, 24 Nov 2025 04:12:50 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf1df3d5sm193047345e9.2.2025.11.24.04.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:12:50 -0800 (PST)
Message-ID: <93cab7af-5d16-45c6-beff-dc88bebfa39e@linaro.org>
Date: Mon, 24 Nov 2025 13:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] Use g_autofree in unpack_efi_zboot_image()
Content-Language: en-US
To: Daan De Meyer <daan.j.demeyer@gmail.com>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20251011081553.4065883-1-daan.j.demeyer@gmail.com>
 <20251011081553.4065883-3-daan.j.demeyer@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251011081553.4065883-3-daan.j.demeyer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 11/10/25 10:15, Daan De Meyer wrote:
> Signed-off-by: Daan De Meyer <daan.j.demeyer@gmail.com>
> ---
>   hw/core/loader.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


