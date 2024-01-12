Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2539835ejs;
        Fri, 12 Jan 2024 10:12:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEV0WCUZETZcIYUa/XXdNIYY4d24AjVRmnT1ZJkenjMYqsxCxVHi5xj02wkCeX8kwiM2/CM
X-Received: by 2002:ad4:596f:0:b0:67f:91f6:21a1 with SMTP id eq15-20020ad4596f000000b0067f91f621a1mr1304683qvb.21.1705083178790;
        Fri, 12 Jan 2024 10:12:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705083178; cv=none;
        d=google.com; s=arc-20160816;
        b=flD0ZJfxKp83vmP1MAnDw81idnZMhqaCw5CquMAkf4xG91FGTSbs3IQK8O+ZdLYTW4
         nEcnN+krcdEuKlarH5WR88iVKHOlVUdABqrlPEP7+BGe5xY013LVAYPokiETKe8u908I
         ONWWLdyE1PpquGXP540uCtHtfl8FXuj4klrtgxxzjm35PmGVcCAf7cGG6YTyPWo+4YBr
         8D3cK4nSESGXOVr3Pd3MS1bINFcl5M4ng5s7LSx1eR5wAqN7uNElj9PBkjmiZK851LDl
         nKReOIno7zw2xcIL5V5+GlOVAK/uXIyQqOuwtyXdlfhrgsku6Tb886Tur9ZExvjvozgE
         Jolg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kjXzb5KjXQz3d5/KnlN/FIkfPU5DXViM22ChPoPwNLo=;
        fh=8qoJ/LA5u5PqOAGhggMC+Ffl2UReUBROb2StwgmKFWE=;
        b=BzWqUWKDBi/ijayo8eLAGA/AyRAnhJHn724Z/rRA9Zo8jQonNcQwTE87Xqfv6h+f+v
         6Sun4Knyt5sI989CffVk0UKpR8KKfTNXPr92oQHl/AGDUe3+ZRhqbu0W0EcNoqY2Nvfd
         uv7PO4azRQvLg9Dv1oyVTi/G07mVgB0J9Xecp+ZfVkNR9w6bhrljgqMaV7ltwdqzqYrB
         kvR3z+nUf8yxVmbi5rPBowEOTWs60V7pJFAzLfOEDxOxqxpg6K0NRVC9R7vm123rz8K5
         IhZ2X/flaKbWxkyuE90PkeY64Tc3A2zTajN74pepSc8FhJjda0lsGqtx+8JU8O+r64Au
         ff5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZrH+wtzF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5-20020a0ccc05000000b0067f6e471793si3298748qvk.553.2024.01.12.10.12.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jan 2024 10:12:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZrH+wtzF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rOM1K-0007mr-4M; Fri, 12 Jan 2024 13:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOM1H-0007i1-UJ
 for qemu-arm@nongnu.org; Fri, 12 Jan 2024 13:12:39 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOM1F-0001Bw-Ih
 for qemu-arm@nongnu.org; Fri, 12 Jan 2024 13:12:39 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5587af6ae5cso2532323a12.3
 for <qemu-arm@nongnu.org>; Fri, 12 Jan 2024 10:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705083156; x=1705687956; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kjXzb5KjXQz3d5/KnlN/FIkfPU5DXViM22ChPoPwNLo=;
 b=ZrH+wtzFUwzbnbQESfXGvth+Yj18Yf6QVgVFIjpcm4cEBuDqxNmtsloQjr+dlk7VHT
 2w6rj4WnrN0K2IsF7a1/Ruo2eNIl/8f8EbwVADJJjUazxzPmQZ6LbhG+K/O7n71VSffL
 Z4ML2FbbZGR3wjj5DATOSFgEdchgwKDOE8+1N22bdV0Qz/yUUaW2VqSuorZReNrr642z
 7A+wFPYJrc8KzRQkpRd4y3adz/9KQIDrRqD8aF+JMlt6+ZdJP156Oh/7Ulz8kvWYDU0A
 un1EZ7k8s+Gagilt3Zvn/ERLnS2RRuwHOuaTOtSIJKBECwTKpFXF0tKdkCjzC4P8Bfk/
 IBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705083156; x=1705687956;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kjXzb5KjXQz3d5/KnlN/FIkfPU5DXViM22ChPoPwNLo=;
 b=P12R+3dXzlAQzUpsVjE6mG7WMV9Rj0jmgaEYhglOXMI2FIuRppFfc7GfOXwUagwNVZ
 GravK0DgO+DJ2yr95S7t+h2FMnjBI6vk/ZUWL0SQMG2v9yTaL8J0eM10X4zSLu5Aoldy
 cSYbF2y/Y3DEYjLO3FgH3cnNPG/LqSAsFNM0nRbYczhfQ1BbW5tpNXQeyoF01Vsb9Upc
 HTMeQfRiLFr9nHYEz9qDz7/IxlSnmKncRdJkSxuFY4grT1SeON3Nkuu+G7g2nhbD01n1
 RjdfJloiYC72AgSMBqrve2wmUxoOJ7faM75EFS75l1zuDTK0r3ifjSUQQuOTvlTA73Qe
 MWGg==
X-Gm-Message-State: AOJu0Yyjr9ydJMozPlESCG1epR46aFu+u+odeAc34eJTKk1BhBad+kJk
 FLyxzi8A78rTVA+aJv6d2917PWlXxJzVSZUEM8DobSc9kAP2kw==
X-Received: by 2002:aa7:db57:0:b0:558:e3ad:8acb with SMTP id
 n23-20020aa7db57000000b00558e3ad8acbmr433584edt.80.1705083155930; Fri, 12 Jan
 2024 10:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20240111051054.83304-1-gshan@redhat.com>
In-Reply-To: <20240111051054.83304-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jan 2024 18:12:25 +0000
Message-ID: <CAFEAcA93t6oXv3E9Qa13jvz+pMZHGCQR7hQuaWbT62MJLZGMvA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Consolidate valid CPU types
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org, 
 richard.henderson@linaro.org, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: XITiq4//8UXg

On Thu, 11 Jan 2024 at 05:11, Gavin Shan <gshan@redhat.com> wrote:
>
> It's found that some of the CPU type names in the array of valid
> CPU types are invalid because their corresponding classes aren't
> registered, as reported by Peter Maydell.
>
> [gshan@gshan build]$ ./qemu-system-arm -machine virt -cpu cortex-a9
> qemu-system-arm: Invalid CPU model: cortex-a9
> The valid models are: cortex-a7, cortex-a15, (null), (null), (null),
> (null), (null), (null), (null), (null), (null), (null), (null), max
>
> Fix it by consolidating the array of valid CPU types. After it's
> applied, we have the following output when TCG is enabled.
>
> [gshan@gshan build]$ ./qemu-system-arm -machine virt -cpu cortex-a9
> qemu-system-arm: Invalid CPU model: cortex-a9
> The valid models are: cortex-a7, cortex-a15, max
>
> [gshan@gshan build]$ ./qemu-system-aarch64 -machine virt -cpu cortex-a9
> qemu-system-aarch64: Invalid CPU model: cortex-a9
> The valid models are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,
> cortex-a72, cortex-a76, cortex-a710, a64fx, neoverse-n1, neoverse-v1,
> neoverse-n2, cortex-a53, cortex-a57, max
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: fa8c617791 ("hw/arm/virt: Check CPU type in machine_run_board_init()")
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---



Applied to target-arm.next, thanks.

-- PMM
