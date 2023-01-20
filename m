Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1288739ejc;
        Fri, 20 Jan 2023 10:24:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsx6T4e3f/5gZvN/GvpPKBbUec7LxFoPY41vHjr89UaSHCVXITsEUUxzYD4V3L/Kc5FJxyL
X-Received: by 2002:a05:6214:3113:b0:534:97bb:af73 with SMTP id ks19-20020a056214311300b0053497bbaf73mr22936273qvb.4.1674239046124;
        Fri, 20 Jan 2023 10:24:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674239046; cv=none;
        d=google.com; s=arc-20160816;
        b=yt92wIu4g7J4hdfVJOMi2TY4zu60Bl+vYVnbx1mwFMyqJ/J6FLM1De/X/e6ORjIQEf
         AGm/FYSj5hM954gY45zhKdu0+Gr8F1bBiXeyi14ag0+K63iqU1l5uznqPHbzG5vKze+y
         0JOTnMY7BQeMNpZsPW4g4CsqHHXgXN1eWp2lJ2Ru0ORAAkz1Wl+/c3ybqz9iZjwh5l3x
         K7W9EFRySYBtzMonCJbKnDCv8ITXn463/FfktwA2mRLQ/lfO4lSZiDe5yoOZQ/0bktau
         u5nW9GTkde1oJcqH0lxtAOI1TjyxxgOj4tC74F5vfa7LP63lJpe3FvNpK3/5pEnIdzhP
         5LSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nfzD+17/Up7Ma5lDsT8nChWEegSPN3XuavFOi5YkAzo=;
        b=QOgFkbi9aKbKMdS+vWH/l0/RMfsrAL2iS5NLKebtnq2xZbm0v2iyBHjD8S/b91XloT
         VWuQT0Y2yX64Ufvng/FjjPWWpH1EGDuomfFG/JqZIAp4hwNpA+L8+ig38Wl5spBf7a7D
         qYtvoHs57wFXI1J32CYJCeKfPtoYdewuoMMg3cCOxQimLipZNGgc7hhtrEDveGdN3XOo
         h8DFdaYyj/lecGnt4IHI+5p6y+u2T+JFS8ZlCH2KatJxZhd/KU/MmFPUE/ornPMQ9/dR
         oCZ4mINgKuJuI8Q8x5K3Men65MGx/vvB23MNB4UXY2EZP8Ivrm5Q4P/g32ZngnT9+ahZ
         p+/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NCr54sDa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc26-20020a056214411a00b004f7797fd57esi6898821qvb.196.2023.01.20.10.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 10:24:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NCr54sDa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIw3B-0002k2-2j; Fri, 20 Jan 2023 13:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw39-0002jJ-TD
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 13:23:39 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw38-0000Lu-4o
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 13:23:39 -0500
Received: by mail-pj1-x102f.google.com with SMTP id o13so6409340pjg.2
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 10:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nfzD+17/Up7Ma5lDsT8nChWEegSPN3XuavFOi5YkAzo=;
 b=NCr54sDa+rgNiB11oiZdXE+LvayuYrvNvXCNastpWtjEeXvwagSG5nrZseyo7F87hG
 AzFhHVsoQ+S6iBc2MgVxAIjbztsNAFhToJbJAU9fS1AUxpAwUNNVjp8/vDzeOy/qfPRS
 JyRFyKpnCCH7AnbopO3mRqULICMzc7elZbNvoBWo8mpWX8VYaSLSArm8L/+0ZYQI67in
 WArmYN3QAuWioA2Lj0kYo1kVuKjRJn4o4Kq6kjjxZU4XkMI9iFhkxEW+QHSMXavQw0Zz
 mv66ffxNKspIQdWJg67Uio5+cIT9aAZ2zr4W1NWEyB7u0UbrcQWHxhGgRm/kjbfbKVfj
 Lyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nfzD+17/Up7Ma5lDsT8nChWEegSPN3XuavFOi5YkAzo=;
 b=qHu8k5yI9pXBOR45gEKIYOrMOqFxLhP09wcKPvHOpqen7zHOS0FBBEl2vdv4FJ2EF8
 TonJDymlDb8zSU5YY0kD41YAqvPBXJBKkLarNBQAVh3RMt9BC9HlwWe3uRXz0rHcM+eD
 qh7KovByobfqOarw9FqBbsRlfcwEgw70NtgCj6a+qKUu2NC/Im90tS9WMv84F7ADk/VL
 cUMVMpd7LO3Ls2pvueMxp3N5YciOOwC6L13bY8jX58V1UzOWKMD/2+SUGwDvuJj7IXGp
 lJvthWFK8e9tdEQ43kHoqjKHBwJ1Dl1wDtgjwunLOFqWZRAX7Ni6SbJ1plIDksXpt7lH
 Ajhw==
X-Gm-Message-State: AFqh2ko/7opybDxycvvRtteH9VL6y403t42UqNBAOb3uCM5EomoUUu0I
 BhM0dnbKKn/r7naJCLzqT/6uKr8Jb5AifOOsYHDm2Q==
X-Received: by 2002:a17:90a:53e4:b0:22b:b025:38ed with SMTP id
 y91-20020a17090a53e400b0022bb02538edmr347673pjh.19.1674239016768; Fri, 20 Jan
 2023 10:23:36 -0800 (PST)
MIME-Version: 1.0
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-4-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230120155447.31702-4-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 18:23:25 +0000
Message-ID: <CAFEAcA8JK=5P2zouaEZ=zhnwTFUwSospFoa7X+SW6=tnkKAdJg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/char/pl011: implement a reset method
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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
X-TUID: EKA0TqOBDKZ9

On Fri, 20 Jan 2023 at 15:54, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> PL011 currently lacks a reset method. Implement it.
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  hw/char/pl011.c | 26 +++++++++++++++++++++-----

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
