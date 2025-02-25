Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp245880njg;
        Tue, 25 Feb 2025 06:20:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUxJD3X3n/IJC9oS+uOhQ0INLDMsoQA74WtTiAWNrdzm1Mv4uCd7Dwrg3qdOpXZvX45SjV0cNYzr1mn5g==@linaro.org
X-Google-Smtp-Source: AGHT+IE/DWcN3JSRcRScpgJvCdKNQdLizKOPrDXXElO/uQNQcm+VSgg1LtDxAS2POmEK+fP8gVGd
X-Received: by 2002:a05:622a:1a9e:b0:471:b403:59cf with SMTP id d75a77b69052e-472228b4398mr213743241cf.4.1740493228714;
        Tue, 25 Feb 2025 06:20:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740493228; cv=none;
        d=google.com; s=arc-20240605;
        b=VYvkob4GBV2RIEfXZT5RCzBi5fgQejZh7wVG/Ib104nMCVkLmdo1crSY0y5d9tHUyg
         a7F8Kb3LQTv2Ibaq7+0/tc2IsTMp/seYIgvFMCr6b49zbfR9xNV9yUWb15oGdvPj1p6r
         jmucfD7Q0st0oaDq+ob0hEnymRACVrRoHq0gzQbH/KxDiXvsvSFCP1+6JfBsifZpJquC
         O+/t063pOA3hnnRbbyLqACYSesTc/ZnUiOL3KkC8ix8r0ob4ac8SM1hbeEN9PNcW4Kmw
         7sjZGy57gNKf41Z92gbSfifWxiqS3MALjTN40Whyrd+UlpFlRhfkx/QWIP0ZIAXPlUjg
         xv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Y/5EpwWbz1TsNvc/h4VPdcsoE/3Ja0cJXiJhf1wslL0=;
        fh=aXbUKFUZFAYB9woDZkIKbb7ZyndsePXWhEVyWHS1pac=;
        b=BFWvsb8T7uq6oHC3JG7kTpMvFSa96OEuGgRg9L5sad0hZtCQMHsWitNTTXtoMczJfk
         jjD/xs3HfJfaHfD71zU1gkZ/RNpeEVeGPHqMpSVs4J9vU35nFcgse3ZADDNolUt7wrXr
         G4WdJveFKWcLGLO7r1jx+AwFM/UPaj2K/lYRQyF48sJUeFZfvOTcodIwU8bPodRTzxK1
         jcbShT15iM0/HXhTPGf7QDN82YAGRWEeffgBhdImRN0CUmuXMZ0I3shUuKWD/cjPA4RB
         lbp1bzs5flbDVgErRMrA/wZVwaEu8X515gIs6I5GWh57dF+izPoEGUySGGnnx9AKJ0Pr
         69oA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JLQ0mVc+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47377e1cb6bsi18362691cf.81.2025.02.25.06.20.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 06:20:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JLQ0mVc+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmvnG-0005sQ-Mf; Tue, 25 Feb 2025 09:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmvmp-0005oD-Rz
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 09:19:54 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmvml-00076u-Vi
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 09:19:50 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6fb73240988so36960187b3.3
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 06:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740493180; x=1741097980; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/5EpwWbz1TsNvc/h4VPdcsoE/3Ja0cJXiJhf1wslL0=;
 b=JLQ0mVc+m+fpVuBk6KX56txEV3KPefYpaY8lhfepufaTEDixODnTQSib1EOQOQogzg
 AGpSTXGijSobV5oNv33f5k0wZu6h7rRjekVe71Rh+zYDZwgpnVGjFVtg/jdXin7FRA/j
 iLCzoHGVCvPD5EwOLEy5vAtnNw8EgXjgtSCxz21949PMrRzBv4yyB8+0ITHHW/vNbmX2
 +jeRKoJt6VzthK4zeTb2nBg5ZtfXlB3YP2Iq7j7A04dBPK1GpmaJlCvYDHVdx72bHwsR
 zkAM/sRCOF1zP4phn2yYVN6kWJL+/DTsGGn4YBpRFoQE4MR3RK4gIR9cUkRC5e0csR+z
 fJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740493180; x=1741097980;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y/5EpwWbz1TsNvc/h4VPdcsoE/3Ja0cJXiJhf1wslL0=;
 b=tB+uw0QqkY8C9XxbmZHFHO6+RESyuVoIA+cSB8UqNGorfxTCGkR3u08htp0xPTBS5s
 BvAiBHxIt34d6pQjQyk6P+1XFA3RLC6ZCip8bV5M9SYt+JJK7QBMWMC72IeprCoxi3rK
 S019YPVXnfckooUbGkrHSTGS0I5Cq8tiNmupJsWaCRwDV7B6gVMoreOGXLwg5eXYTaLf
 i4614WF40Vm5UJESjJK57/erHOvXV22XE9RfGyiOW5Mv+IhI1frG6hpmhz2zxV/Ev2v7
 SuRGVpwk/8G/y6YeGbKh/NkZ8AQtfmYfrjAZBp4hsgm45kxzprVpXiMKYGCYM5rcspgk
 8bvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCbRB7T6ZWfC7AAbPxuBxY8Pk5QYR5gxvXYEUoKfAuIcln4n0nWsbfj2KCdB8o9C46/1geALTX1w==@nongnu.org
X-Gm-Message-State: AOJu0YxWbvo4/oOJ4C+bM53NSb3WBpjwrDmNxhxnQ+Fa/G5ft+ncjEsq
 1xF1ZTMl3A+Een2nMjkV4NnN7aM/kvOVPw+BTWfKyarAiNTURLDDKsHkdX5X43ReYdp25l0QXmi
 9RirX+38GiwxXYTmLJfePBQ+vwlL5cF8Mp1wzLA==
X-Gm-Gg: ASbGncvdyDWMiblr4y7iwgAAYlokXUZUjDRzbqWsjATHwFbI7AATDgAA4TtDDmGMUPX
 kXMTK3Y6FOXLYiVLQX67LuCkGAhOhCpWqr9cEDimG+f63FU0JX0dZS2zsM9UdHtvH4yLt2NwgFX
 48V8U8DZUn
X-Received: by 2002:a05:690c:67ca:b0:6fb:47d8:79ba with SMTP id
 00721157ae682-6fbcc23b1b4mr151642087b3.16.1740493179972; Tue, 25 Feb 2025
 06:19:39 -0800 (PST)
MIME-Version: 1.0
References: <20250223114708.1780-1-shentey@gmail.com>
 <20250223114708.1780-5-shentey@gmail.com>
In-Reply-To: <20250223114708.1780-5-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2025 14:19:28 +0000
X-Gm-Features: AWEUYZkiA8ylBJMOBdzMDx0ZNe4uoEr-BaRu_jet4eEXXg69S3CM_V--L4J8aog
Message-ID: <CAFEAcA_96RMUx68NTG=c0vwevD9LcCp0u7SKNnMx48yEePxYzQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] hw/arm: Add i.MX 8M Plus EVK board
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Fabiano Rosas <farosas@suse.de>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: anL1hwk0LP8a

On Sun, 23 Feb 2025 at 11:47, Bernhard Beschow <shentey@gmail.com> wrote:
>
> As a first step, implement the bare minimum: CPUs, RAM, interrupt controller,
> serial. All other devices of the A53 memory map are represented as
> TYPE_UNIMPLEMENTED_DEVICE, i.e. the whole memory map is provided. This allows
> for running Linux without it crashing due to invalid memory accesses.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
