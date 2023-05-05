Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp401056ejq;
        Fri, 5 May 2023 06:04:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4io+x99tNCHRg0+Eq5UEqd+o9x9tI5FDgm1XwtrAyMZ147Ulf9rVfOga5xDX6PoKYwlUTN
X-Received: by 2002:a05:622a:c3:b0:3e7:e69f:4762 with SMTP id p3-20020a05622a00c300b003e7e69f4762mr2214311qtw.20.1683291873851;
        Fri, 05 May 2023 06:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683291873; cv=none;
        d=google.com; s=arc-20160816;
        b=dhgvu389NFhqdxU/F8lEGri9P68dnP6N2DmKIiHzS3qv5JiB3wSCc3DAGjyZBdfjn9
         Kj5lTnIcFofmO4/HnboUHPy1s6mvkVkcUEImOqa9SzzgrBeiEZxKrjl/GiXaSDsZIEl7
         1sKQDqQ1/GXVNv6rB3EqqleYIuouxje8hK3qaP0fzg+VCALdNMJe2iMG+uV7HU6aWIMs
         0qbTKm1/3mFxy8W9R7q9OIaYTdlKPK5FzV/qWw+R5PNPib+/rFKY4c3XrCULHFs2r5ch
         7Yh2R5S+KZDVcSqnyvSCDFlA1Ig8FnHgDBgRrmsAM/uEIOTsxAB3UpbYLYBunyhn7Lce
         TaNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QK0UNd1kfN5wk9V/fPAD3tDqlCsRltY13R7aPYZ4X2Y=;
        b=Jx4OWFr8kBKwGNyjPvA0SmPWkH3TogUjgOGJ/zdkL8iZQkHnOW7JXUmd6Dv1KeRHr/
         jK4l5f4bPFGjibv/jJnOw3kI7XQBnlKe/bJUczD/mebrqdcnq2/g69d/i24gCh8AyX0X
         8m8LJtGps3SQ8LemwqIYE+Y2be/d+ka8F6D9xdbP05CtIYXOy+aAm5Q3c1WYR9DkJlo1
         3Gfy/tnSUZvUuCkQ+x1lhrHK8g92tDawAk7ICfop5Ky7WAh9a3a6tdZHG6sab11tbf4j
         MKKev8HufoZSMs2WSgVz5xcuCpTK3oIMzSyasahyvU3U6Sifj4Nys5pamm/F8oiKKV3Q
         8ILg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cl2m6Az2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020a05622a058e00b003e3898d5632si540952qtb.272.2023.05.05.06.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:04:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cl2m6Az2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puv6I-0008EF-P4; Fri, 05 May 2023 09:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puv6G-0008DR-ML
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:03:52 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puv6E-0000V4-Tu
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:03:52 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bd875398dso2652138a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 06:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683291829; x=1685883829;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QK0UNd1kfN5wk9V/fPAD3tDqlCsRltY13R7aPYZ4X2Y=;
 b=Cl2m6Az2KltcHV1XfvlnGq/ZHdEpc2EZkBm0svA8i4altuHb5WPMKZhhqoLafDs2x6
 umOhT6Zke6O69Dt/5N96UHNuqo80xvKTZrf3oQOkGgRGCOa19VUNk6Hct0vZKSSNfdr3
 39uFyf/xDKCjk1vnsuM6RwyPa+2oWloo+E/1lINEm9Ic9pl+FVnCyoCi4ER8shPe7BCQ
 44bukearPI7enxmlDQ9LuCJb+vxrDre30LtPsE5WVprZJPw9ujgDGlThKX+napPMtxVy
 GggMLwirfdmHvplqcfmVl2hzJHGdfnH5paLl0nklt7EwaGUrBNjnR43yF3bBrho5Xsef
 4YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683291829; x=1685883829;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QK0UNd1kfN5wk9V/fPAD3tDqlCsRltY13R7aPYZ4X2Y=;
 b=DM6eIJT8qAFbfJEOcdK/Af7+a7gNmKdPdcw+sNunTbdjIyZvg8nUBMVLrpCTOui33K
 gDbqB6xNeCuqucEQlYzrx3pgSzqj67GeW8fmuu23yJgFnQJ8pwfheeKhH1+DxQ8T4UdV
 DBXJwX+UhMWx65PT8xlLwadISQ567n2ZPG5+LqGpBewRxZZZVNBR6GuqOP0t8WhlJ4dv
 s2ES45u+kyv1w8j3PXEeptbPmSGYa1G/iNeORP0KEOSNctLE2CJhA8LO0XQRtswaZLgH
 50EL15B4SLD7tyk3hDNi7blAWg9GcgvI6VVR9UndIMd+u5a9yhpNs6wI2ZdzY2JNL9Vq
 /JUA==
X-Gm-Message-State: AC+VfDzRYJYUf/5P8nRg8J/G+Z5V1JvFXlwzbGlxVr1pJ8xNtMgh4GVF
 oG+PyethbDw/t+sYsM0mPfU8hi/2FvWUI9sVALiXvg==
X-Received: by 2002:a50:fb92:0:b0:50b:d270:6b6f with SMTP id
 e18-20020a50fb92000000b0050bd2706b6fmr1527638edq.4.1683291829189; Fri, 05 May
 2023 06:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-43-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:03:38 +0100
Message-ID: <CAFEAcA9Auu565OavkHTxYyhtLviTPE_XU34ien7z0sb-r0ZQ7w@mail.gmail.com>
Subject: Re: [PATCH v4 42/57] tcg: Introduce atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: e6umyWabzA8H

On Wed, 3 May 2023 at 08:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Examine MemOp for atomicity and alignment, adjusting alignment
> as required to implement atomicity on the host.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
