Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp784826lfq;
        Fri, 18 Feb 2022 07:14:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXwNUYMJoVET3s9rcrcgFgNFqiIHiXMQr+KBuoKmOtuAuNti3sB7Nwr9sDd0gK2H3P3YNU
X-Received: by 2002:a81:7004:0:b0:2ca:287c:6bc6 with SMTP id l4-20020a817004000000b002ca287c6bc6mr7642862ywc.107.1645197269438;
        Fri, 18 Feb 2022 07:14:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645197269; cv=none;
        d=google.com; s=arc-20160816;
        b=FywMLA3xZwunKXek+vMZUHK7tyvfJC1fmLOKZZa4h6bvgmCcSphB3dXd/G8PX8WplK
         fmvdYrJb/+DmcSOyZKggsNFmEVCBgy652VyMD1IpUU3RvKd0502sEO3oAIon15eMf0UB
         3YnFGsiN/yO7JOwlA7AV5obXEJFluiRyKpQtD/H5GrdubdKcnFrgn9cfYqrX22zYJgaR
         Rsz/Z/PWoVRwFisu1LZxIrJqr3AGulaOQ9tdSpI6fm1MvYSLPQrP0zB6FnNHZYsUEiq9
         U+VV7Q3vlycK7K3wgOCRgE2y+cRonTpuYDC2ysSOLkvlvPHPy/BIAKIed96VcmpfE/M7
         uUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tiv5i1NYKOriDeo+BHWEvt4iO+2QK/GYaQeFEQh8hbQ=;
        b=uAsVu/EspdRg6eV2wQAxMp80raFAnJD54fhCdYcAmw4/tRvL1cZmI0PiBATcYRsy1C
         OlTLM61hGSXwB3ZcBGHYWxq9HukOPWTrcTmbBijD66Mzq6fKUxPX462d2W8e/2i0oLs+
         70HS7Bk/sHKl2fMMdZX/Z10hyQn5YmvsxxtsdgBryNp/L9JjxErwuyY7VINjCJ+4OATV
         OodCxRiXGITe1WiUqGKD1dISI6j9pgNEjJ7dNth7jHexGtB2b06D/RlyAPB5EdmdMEE2
         BPLdPXNm6aeO0wVTlVjChjemsfwL1FSbpgfdFDCtX5E2TbUB+3PHsTBYtdyijb/JIy45
         HClA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DNIta3SH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si40681630ybu.667.2022.02.18.07.14.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Feb 2022 07:14:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DNIta3SH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nL4xo-0007v7-Qb
	for alex.bennee@linaro.org; Fri, 18 Feb 2022 10:14:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL4xX-0007uV-5m
 for qemu-arm@nongnu.org; Fri, 18 Feb 2022 10:14:11 -0500
Received: from [2607:f8b0:4864:20::b33] (port=41850
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL4xV-0002WL-Bj
 for qemu-arm@nongnu.org; Fri, 18 Feb 2022 10:14:10 -0500
Received: by mail-yb1-xb33.google.com with SMTP id j12so20140274ybh.8
 for <qemu-arm@nongnu.org>; Fri, 18 Feb 2022 07:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tiv5i1NYKOriDeo+BHWEvt4iO+2QK/GYaQeFEQh8hbQ=;
 b=DNIta3SHNP4pAMDlAu2fMmZTGsk2mMlcoVO1i65aYafT7LWQQCks7cTULcBxXYFHK5
 5Nyy7JToOPdoSHu9p6y2Su0DuUunoLbzxWjHiFT2VXWSPIrIDrOR++ulo7g6sEmfaNlZ
 YY71yXYpbkdFf4x7FDKf3U0At/UFblC4l2sFAa1mxilmJJFGRm51KwLhfX5yJIjOFfyo
 u+Rw5hqd7CWe5nxBhODnod5A3DJEw41NXXsH3yP4BAhTob+q2/zKhmr3Tz5+1x3GIbVy
 002Oqo1tpCBmP1t2BIxXNG8NprYrHpSOL6NCxlcXW2xYNv10o6STQN0fJuizrwlzme96
 tOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tiv5i1NYKOriDeo+BHWEvt4iO+2QK/GYaQeFEQh8hbQ=;
 b=pCG94wnl1H8d5SAbr9B9XZ4wD4qd5Vsm9kUcc8l5n2qgiPDwl/VbCrj6DwFM9MgAhX
 gI7A3qLadVNC22c/j/QUqFyXhLJpkuOAH4/Vr/tCyK0AK9eFfLh9qXU2XcsMCL/uiB6A
 RjTpfGbLtUviNlp/PHuEW94twUiBPYE0kyK3gMouN+Rjrkynj+VEKLj4CgcLg4/jpRPn
 YDCKL6al3urpj2uU7Z0GPVL+m4UP+xU2bkEsiYLaKd1Hc4oFXzgklXprZcnPfupaGNjZ
 irBjxYW31YERJsIpsTzNgoSbvVgVkOklsXRRHLJFK/IUo2aRAgLmDFh6R4ftqzbYNyOi
 wJ8A==
X-Gm-Message-State: AOAM530kI6MNACmpAo8jXybX0kF9ZpBvjyWRR2U2Fs4E7uorvzMlpkTs
 1wPjz/ekDXUlk8IIggSzNGcqhQ79o2jXuHjOOYtYYQ==
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr7628618ybs.140.1645197242877; Fri, 18
 Feb 2022 07:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20220208233104.284425-1-venture@google.com>
In-Reply-To: <20220208233104.284425-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 15:13:51 +0000
Message-ID: <CAFEAcA8Zq-Unph4bRk3fsxAAtCnEpVmf4E9R=JgZ91gH8KXPpg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add initial mori-bmc board
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Ilkyun Choi <ikchoi@google.com>,
 Chris Rauer <crauer@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4H88ghWIrkE7

On Tue, 8 Feb 2022 at 23:31, Patrick Venture <venture@google.com> wrote:
>
> This is the BMC attached to the OpenBMC Mori board.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Ilkyun Choi <ikchoi@google.com>
> ---
>  docs/system/arm/nuvoton.rst |  1 +
>  hw/arm/npcm7xx_boards.c     | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)



Applied to target-arm.next, thanks.

-- PMM
