Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2CAD3EE72
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Jan 2026 15:25:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viwYG-0001eX-1t; Thu, 22 Jan 2026 10:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1viwYE-0001dO-FU
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 10:24:50 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1viwYC-0007cJ-Se
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 10:24:50 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48049955f7fso7510805e9.0
 for <qemu-arm@nongnu.org>; Thu, 22 Jan 2026 07:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769095487; x=1769700287; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d9NZQMaKjw/9PZ8DPzJVFbLPhmGM1hoSma/eUU87F38=;
 b=HwjV+o5D6nivz3F6xdEPQw3AZU8pl1RQTMDga3jqXUx6/x4XBVn7B7O2y4+1tek6BB
 GGlnAAx44uC9QuuhJ7buSzCBBICQ9J/GAFCo5cJn1o6CQVwN2QCdbqLIFsGudrIIor1A
 tenKBTcSOHZiHCcAyktwf5Q2OB/KWxQjR6eFpc/300jhXDAArbTaGLlR1uryC8CicjY0
 kCRb+OzIzhd2IzoTENoCMTRU6szizHCv7+MbvD4s30AVYvyX7ESNzr/qCsd7rPx2+tE6
 TRHH4jR/EWV1PRbKDybF8+ncNjgik9mtPDlwbtAomkRKlQF1Z7hIKCrlxx+4NAKk04h8
 zUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769095487; x=1769700287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d9NZQMaKjw/9PZ8DPzJVFbLPhmGM1hoSma/eUU87F38=;
 b=TpjqZq2DsT6nt6d5czSexfVgCypjATVpLMIBJKpo7j7LAw16RhtpobplC99r8vaApn
 xkl2Aj42Mzc77b1AAalIL4Hy+Suf/XIQcIGt1EomNcJtKdA33JQjMYvnOlXxzGhA1+4I
 tu79nDU2A5gA63yISLWsfrMPa31Ti/bgYQTqsP4P+iPoSIqmwFZYyMVsEvNH4cEH/0gO
 VL3pHGvJCGBG/amZeGMfIseHbsd0iRbocRI+YTAYPSFRtPy00xYcwgsdai1DVssWDO2E
 Ag7MTzs/EMxvBeLptW2/R3Ok+yYbJEjhPUCOz+mL+clbdaUqiWniXRBGME4CJkm78/7E
 FJvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXqO90tR/VyTOstRlUzw8ev89vnIGeUK5YJk/f7fkMLuJaDDByRIb9XZyAReiznPfJ0435XfBJ3g==@nongnu.org
X-Gm-Message-State: AOJu0Ywkkj1Yv5qekXZsl80b3kC4dUEAihN6UcL7PcgdZKsflKZ76Sk4
 WG36neGaluicxK1pWlJEtaq342yOWij6jS8W4F7N4Zn8eFfzSwZBhi6tXhuelL8iIUQ=
X-Gm-Gg: AZuq6aL/cWIxZ1/Xzc1Qyd3lpPRjxaKP4ZYh/9TmnmJ1OBZc3CmY+qo7p833ehrhw1/
 C0C9vuP31H3xs/msZ6qeOcWtGCGSzhL/fyMp6ZCTIXkVS+miIBiaT8tLSYuwojW6NyVaZe6XhKV
 eFu9UmIfdJQFg8cwnT+eLY+wym5SZPbVOiwfzD44+g1QHpWxhm7weCY+toVnNGLCEHQKEKOc6HC
 vvGQ9JnamcxlZvOnJH45nAyKAhGIR4Upt9xGhMnQxIxkiDZqMQWbpxeGndVr+IJSfQZ0x4LBunZ
 R7cXwaueDUziftc2rJO+qux6AcBo2gyChMJfCG7wR9BUus9Eh3ZjrjBF6H5Mjsn7rqEoxH/VzHl
 mkPLaRpFnbWETZ4h8udMQLqpAUVDttAvm/NPEIIevUF+XQo19FSIMsmtq9VNrfU0aksQjlIDbKe
 c7EQq08QBGe0tMBtMA3QAES3/U7U21oiNbfxr8yrgK1sHD+/r30XC7Tg==
X-Received: by 2002:a05:600c:19cd:b0:479:3a89:121d with SMTP id
 5b1f17b1804b1-4801e359031mr315662795e9.36.1769095486935; 
 Thu, 22 Jan 2026 07:24:46 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48042c1011esm56382575e9.6.2026.01.22.07.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 07:24:46 -0800 (PST)
Message-ID: <a1fdb977-b43a-40a4-9371-6b36ed7bc848@linaro.org>
Date: Thu, 22 Jan 2026 16:24:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] hw/arm/virt: Clean up MSI controller selection
 logic
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260120180339.1416328-1-peter.maydell@linaro.org>
 <20260120180339.1416328-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260120180339.1416328-2-peter.maydell@linaro.org>
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 20/1/26 19:03, Peter Maydell wrote:
> The virt board might have multiple different ways to handle MSI
> interrupts: via an ITS, via the GICv2M device, or not at all.  The
> logic to select which of these we use is confusing because it is
> controlled by a mix of versioned-board compatibility flags, board
> option flags, and open-coded logic inside the create_gic() and
> create_its() functions.
> 
> Currently we set VirtMachineState::msi_controller as the very last
> part of this, inside create_its() or create_gicv2m().  This field is
> then used only in the hotplug pre-plug callback function.
> 
> As a first step in making this clearer to understand, move the logic
> into a single finalize_msi_controller() function, which sets
> VirtMachineState::msi_controller.  The actual machine creation code
> can then look only at that field.  (This is a parallel to what we do
> with the GIC, where finalize_gic_version() sets the
> VirtMachineState::gic_version field.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/virt.c | 38 +++++++++++++++++++++++++++-----------
>   1 file changed, 27 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

