Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4063314ejv;
        Tue, 2 Apr 2024 09:17:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpNbIMnaUxMbZIM1xeJEg5p+xXT+HIPEMd8i4gQ4JiX2V97a1SkrV4bDWC1FA+K5gC0tSukvztLW3SARMukuTTv4iXdgDK
X-Google-Smtp-Source: AGHT+IFiVC0EQRJZEy3Rlxqqf5fzpBKsnnhwQDP1Ys1M9AY4GipFR/x+earchvpoQ93QGmaPGGI7
X-Received: by 2002:a0c:e648:0:b0:699:55d:73c9 with SMTP id c8-20020a0ce648000000b00699055d73c9mr6714922qvn.58.1712074661252;
        Tue, 02 Apr 2024 09:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712074661; cv=none;
        d=google.com; s=arc-20160816;
        b=oqyRIifjIbjrOBv+5hsJESQ8z5Jk5XP+gzEVG0tMwQGhEEDkM0694wOXXc5XKUhoiU
         xJyDyeqKsjG8y/B4i7nrWJLqgjO7lFAqOYaid3XrTvlngdfnifE0WA3d6y1olja22S2O
         xaPwd4ImGytImbh2MWFp8ZZ4F2wKchzvgtmRfSX1chZoZVaEjc+QVc0elthEyhy6ZzXB
         LTMMkjgldnwZRgLHAtzn2373oXYkHwd1dn5xQnPSL31+2xsWKT2x5uhpMI/iqZApjcbN
         VqqbTEYN9lr+EavX4+7e5q4rxWsnGtZvelTP8qu4l2QgecLbSBfpfCotqlnsKumZ/PNH
         ScqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mfxe2zxw0/gIC6GN0RyG6svwYpqTo4X9MoTxCaMZm18=;
        fh=z6DtUF/IcDvpGs57SsWuYwgcSIXu0XJVHSxuJ0rpowE=;
        b=jw7RTdPK4/W9ziaXWb610VIXSbFzzxJ8TE1+h1/lG5qjIDPwYW3oQ6Vt70a9UyDREr
         RfiqKMBb0IYOcvoyms09Haev6Oq2PXIq89wUAdNPkDjjckG6FNMGCHvHu9J3CxOa4zLk
         uytEbJ4SCInlRdQdsCHo7Q64JokOOu7XPWh+M72URQMD/8qcsP8TAL32+jFSX6yrPQxc
         yF14aNY27kN1xV3hlBuDublDcXMxyQBrWBudYI0RSRBEYHdkeGYqQc/TGE+BWzCITQOO
         DjBzZPA/zsQEfM7y8AI9j+gB8OeNpISwF0ihSvmufHocqpakH6WAFQ1u8A8oBTddCzts
         ePzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x9TXgode;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020a05621419cc00b00698ff233181si7693926qvc.198.2024.04.02.09.17.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 09:17:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x9TXgode;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rrgox-0004Ts-8N; Tue, 02 Apr 2024 12:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgov-0004TY-Ev
 for qemu-devel@nongnu.org; Tue, 02 Apr 2024 12:17:09 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgot-00015a-Dw
 for qemu-devel@nongnu.org; Tue, 02 Apr 2024 12:17:09 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56c0d1bddc1so6319062a12.3
 for <qemu-devel@nongnu.org>; Tue, 02 Apr 2024 09:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712074626; x=1712679426; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mfxe2zxw0/gIC6GN0RyG6svwYpqTo4X9MoTxCaMZm18=;
 b=x9TXgodeL++p0U9LrMpD1Yq99JUzE9Tc8ykeSTfl7xWTVSMzaLlgZBzz55SVkjc/pm
 CUWkzy4mnvAVCH0HhbzViqi78hQmZNKYloN1zSUer0941F3lQcLSngWRbY4i9tVw7zZq
 o6GSVyCQCkOem+HZQsYnu4VZzmZcSlKl8wkx9RTyz30sTZxXFf5dEOqLu0wOP7OcOatJ
 8ZYkPew84CkQDrLzKHDzoSY0NixMhfswdXlHTWVDw4M6FnHVI82bnckVTZr/X9Cqgj6M
 amkFpbRIcdTs06uboZx4JB/+jM5OtEpBARX7gqtSqZk3+h1jNlB1D4ESVjjH/7EIvWbW
 afxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712074626; x=1712679426;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mfxe2zxw0/gIC6GN0RyG6svwYpqTo4X9MoTxCaMZm18=;
 b=WHTPpjMrPxojpTdGpQbjHHHSH+qhafpN+Aw+N/bp6AXvmmpnujEUaKmVY52QV5LSWI
 lBBnwHzC2hN7JNLwe/UN1iFx+7L/Jtmb0Y1u7E9jIJeRmEI5J7RuZCsdCKUfQsVf2KH5
 89IgSUEkqVAMWPIoWRAEaobt94wnXlUkVcT/vV2w11q3Tn3rtQzlvTO0eGsbV0eEGmK5
 lFtj/OahYTHCMIkLOgQzoSW08kxxwRhTE6wDujhKccNoWRmHmBy/ZpmXSGkxcFEaF2R2
 ZF6eSLGsQz+Vjt7jm1JgqRdW4gVguuhfBfU9xbvEExRjEm1GgSzl+RjNYi6XkA/X7jR0
 sFwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmmEPYDRJ/EcXo5l7c7PP58dvH8ISsvZ7zv8DfnmRmdsWMpy8asJfeskleR7WteEZf1hl9FhqwDFj6OrImccByf+Oy6SQ=
X-Gm-Message-State: AOJu0YxSS6h7tB8ZklnrRmdCE5T46xODZ5zhVlCQKolbE61Oy8B6mGeG
 bmZMV9/829zv0slyV664mX+iNLgdyTjcrnd/6fwT16tKFHhTXa8WjX1fO7BERAGLJLJUxUxgLlz
 qFfckjqIJGVx3PznZEcQtPd34RiXfezMmQSZMzg==
X-Received: by 2002:a05:6402:13cc:b0:56c:5a72:176a with SMTP id
 a12-20020a05640213cc00b0056c5a72176amr12038394edx.3.1712074625918; Tue, 02
 Apr 2024 09:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
 <20240330103128.3185962-21-ruanjinjie@huawei.com>
In-Reply-To: <20240330103128.3185962-21-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2024 17:16:55 +0100
Message-ID: <CAFEAcA-KL9tj8NggU-gDPv45Hki=nLTA+W9E6p6DXH3YVx2V4A@mail.gmail.com>
Subject: Re: [PATCH v11 20/23] hw/intc/arm_gicv3: Report the NMI interrupt in
 gicv3_cpuif_update()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Eu6iyLUXtMuc

On Sat, 30 Mar 2024 at 10:33, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> In CPU Interface, if the IRQ has the non-maskable property, report NMI to
> the corresponding PE.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
