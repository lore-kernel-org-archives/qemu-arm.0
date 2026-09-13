Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BADC88E56
	for <qemu-arm@archiver.kernel.org>; Sun, 13 Sep 2026 03:31:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x5avq-0005pX-7Q; Sat, 12 Sep 2026 23:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5avo-0005oP-PN
 for qemu-arm@nongnu.org; Sat, 12 Sep 2026 23:31:04 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5avm-0006yE-38
 for qemu-arm@nongnu.org; Sat, 12 Sep 2026 23:31:04 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-3964e480f76so3050251a91.1
 for <qemu-arm@nongnu.org>; Sat, 12 Sep 2026 20:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789270258; x=1789875058; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0o5SYxek6plPn4fkQF86P9+LXv8vVx7gjk7fIvFwFVw=;
 b=i3qiYa/4+NvRFISyYjDbsHgxVhcG5Z+q9Cz8wOumnH9wrDxhp/MXP57h/FW9Bz1gyc
 CFezscL3c/gfG1yas5GzXqeXxCxbGr7LgbJSU5ixLaHxGaAHKEX43OEdtW4qarsUjrhY
 J9o/CqVo60bvGTED8x/lAM7np1oXzxpdQ6WKayTZS4CAbyT/KSDfDSqXbw2AqicNd1wH
 xKpUnBBSY7Rn7YhJ4joShJWATrsKFQW0hXCmNte7ECDE25p5lIgJfsAAgfAJGgnVc+7q
 2VkwZ03nrZW/2jIqAM50acoc9rc9SupHYx2XwkdFXYzCyqmSPfI2kTcFwAiZXhkptOcI
 znMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789270258; x=1789875058;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0o5SYxek6plPn4fkQF86P9+LXv8vVx7gjk7fIvFwFVw=;
 b=bp90bsPllJPGlnPDDu4o8/8AphkcJEPI3Bswmqe445RfITCW/CgmKbZEs60WCOAu6q
 GSk59jU8ZA4COkkFbCI44Ym/ZaJX2eScCIuoeQkh/AQIle7rrbgOLWRsv34Or8Zc+a1J
 2uv1t/uTnU3416CTGRZp4uzOJWMRgfJ7po/4h3aRzeiKlwYn5UGwLCShoJWCgPnkGn85
 gLjtOSH5WhvqqiutdSbIKcpIMNoPetWidhOPlbeWKrOvWlAxfkPv86f7PH9R5kokNUhA
 mZw/p11FrevBj+AFp4SGjb7V7tY3/FPhUmFtx8c4h3IrnuJZUott6/iIRdyEP7k+eFTK
 CZJQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBynrPXL4tV+847NxjBjY9ncIqB6zvFO7UowTBEae1zX1eLrpkAnZHuE4ge6rcf34iJPwtaxVuhKpg==@nongnu.org
X-Gm-Message-State: AFuF++m4dVO1JOBh/miLr+ZEoT2nnTnOBZY6QA72h6EZyq68RBefe7nc
 8U26BNeIJSjWWGN4vpCsq/sTv8EHTWei+CAvAY1P1A7R6tC1g8v6vCxTFIDqYEpYiSg=
X-Gm-Gg: AYBFou19iJPCSO0O6H7RycyHGTJMZAW9KqDAn69k9FqO943l9yJVLDKvcDQhAMoWiFv
 SZWkQLlO381qTPm8ZmQth1UCtfMgZaX9QLWqw9x0KIci1dIEymonCI8rFnSIlF1l2L4irenzjLJ
 cczp0qIMKOZTOHw6fiHHh3S2UulLrpPPUhE8GDzIgcpzfiZLZhef8FXPRmNj1G/+yKecYD+TCJU
 EvNciJBr9LM+/n32ko6JddWpE4B+JO0GBa1N7Hb3onMEicv6zXRSYrH3eBUV+/9F0tCAVwH2vg/
 l7WgXdmcvRx87IBIqjKEJp1ci65Efy+Xex0upg8ntiFExPtp06CAIYx71sYeW004GSS28Xn/Npo
 RAw20QjgHk+efPUEhkbhZ9r6h/AojgRrNfEuJn5JASIkLNOkt4LLVDnv/g2mEU2qvyZtQ8NTY/Q
 6sbz+LIzbk44cHSwuQgRQ0RCmlMwlFByBPSjveVoIn0Tb48pyxeZut/tm8bd/ANAJMdP+PTKDuz
 TmSkKk0yTij9no8XIff16M4Rjwy2ohQmEkdM02mE9//KR+M+Plnd2jIJVicIY+NcC+VZnQ5
X-Received: by 2002:a17:90b:4b81:b0:38e:49c0:75a7 with SMTP id
 98e67ed59e1d1-39d9bc6a1b8mr18907582a91.8.1789270258047; 
 Sat, 12 Sep 2026 20:30:58 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:bf2d:a6f5:e308:cd27?
 ([2603:800c:7900:ed00:bf2d:a6f5:e308:cd27])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14365b8f1f7sm14786661c88.11.2026.09.12.20.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 20:30:57 -0700 (PDT)
Message-ID: <9cd6b3d3-4f67-43b1-879e-7ec5b5edd7fe@linaro.org>
Date: Sat, 12 Sep 2026 17:30:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] accel/tcg: Document do_interrupt() callback
 contract
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-6-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-6-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 9/2/26 05:20, Philippe Mathieu-Daudé wrote:
> Expand docstring to clarify the handler is called with BQL held.
> Add assertion that this callback is mandatory and never NULL, since
> all targets must implement interrupt handling.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   include/accel/tcg/cpu-ops.h | 11 ++++++++++-
>   accel/tcg/cpu-exec.c        |  1 +
>   2 files changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

