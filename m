Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp394876ejb;
        Thu, 5 Jan 2023 07:34:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtuE1bUBEnDJK+ChGxbiWwDa1cYeTzHC7ozJz+9DtY5mzBE0EsE3/ffFH7yCrir8Hmp6JIt
X-Received: by 2002:ac8:7248:0:b0:3a8:43:3bb1 with SMTP id l8-20020ac87248000000b003a800433bb1mr74674768qtp.30.1672932858157;
        Thu, 05 Jan 2023 07:34:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672932858; cv=none;
        d=google.com; s=arc-20160816;
        b=HDuLh0K+Z1GgnG6eglGZmR8PgJNUaEp3T5McEtSBSZEtyiwE6vbsQgpettEr+QnH6e
         5Jh1tfgMsTyrXyI6a2gkUHhzYxR7c9S3Ea3MY9gnIXI0tTMCEW6vLgYnk9fk+qKYYsMK
         2uTV90utd75dGISWYHx3i54FSVWuSqBLXD0WkSqmKlsqP6G8KzFkCI7LwSg9mifigPVB
         X822ZXOGCrOQmpLq9ybbOoz2eW+Z748mA9q88o9/RW8dRSF6nvzTbWITF7igVoZMUiJO
         lhlCovv4eQJv6VLcgwr15Pw2BJcJxDJf83x2ErOFBor3qFS0UVCVpgnaEcMufI+RUwbW
         szeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vOfm6dIMpXZoHwwmPSX8+AwHDYvmaG+W3cMGo0+TrYw=;
        b=ToY8fZLJaj73Y41f/PtgovhnO+mZh71mrxsCuCpdflc4c0Y16V61j0DPxCy7Xy7YZJ
         Raqb8BDCzDPioD4+nwh2ctVifdzaFadOxYf/J1f/uyvSVhyv+ahpSAgPc9rMPKSdrETq
         wSWUmjUH4wJYQiAxcVUq1dxXDgqr2Xyoc/kilrMzkgZ8SdJNxLGZyWW18orwKa3llt4l
         fc1zRyhyPdRVGugeVtZNbWj7Muxb8fTPokRDY4Sh0GE8gYcxCI5sy0grfuKMQ2uWBvus
         FochHrv91kATqfm8fNoBPpOyIpBmOEGItPtVqkXr/6luixAgh6kVs1gv3X9gMUQtyWnM
         IQzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fA8e04dL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020ac8124c000000b003a7feb16bfasi18939085qtj.174.2023.01.05.07.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 07:34:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fA8e04dL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDSFx-0007jU-MK; Thu, 05 Jan 2023 10:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDSFw-0007ik-2x
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 10:34:12 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDSFu-0004qn-HM
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 10:34:11 -0500
Received: by mail-pf1-x432.google.com with SMTP id w203so8942381pfc.12
 for <qemu-arm@nongnu.org>; Thu, 05 Jan 2023 07:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vOfm6dIMpXZoHwwmPSX8+AwHDYvmaG+W3cMGo0+TrYw=;
 b=fA8e04dL73uduTe1MMKOxUZpiBWxfR/K8Z/QDYeXlROz69C9mO52mCjHYHqNRpWKuY
 1NND10wwe28r62wqCuyrZPjWMOweISlwYTuoqGYuFRwU7fHCY6TjMd7Uuqi041g36SEv
 /NNi4jcg7gCUv4bFs7BJNtDIXl73Ux1GMcOccUnF6iqQq7y+fFVsvKHI1/D3aCNa3Ch4
 YDW29VSIpxklh+xEz/Pb5tnG32CLhclfSYmEUx4c5+UkHOVFsKJRO9JETkf6zRXvPAz4
 IUbL/lbEpQKebRN3mRB0SRUALi8CnROTAUTpf9xMaA+t49Nv5lVfb6ks/L3C0cRRH8oW
 6/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vOfm6dIMpXZoHwwmPSX8+AwHDYvmaG+W3cMGo0+TrYw=;
 b=c7Q9RqbWdNrJVFBlIEkSktpB24zTp39Pi5CIq7FnOFwdJATSOzBB6xUnX8Ib/ElC6G
 ARKWNiDmES5+DoBaLp7R17gD8+Hn5CwLWgV+kabic8nNkd2V+IQF2nxcmgJGIGtU9f99
 8B/l7cM3sNe8489s9g4e8gIkDoKyVHZT6CXH4ZQV0RaJvq7o7XwhKN+PJSmMC1AnTjUV
 nYIFTQB9iwH0MT1YNiEPzOgFwKDgXIdiCH7/Bg2MHGBPn8ZL/43lKhGrr0jo8OQpwhHP
 Yb5cBVrAVsQ4VGnMooTexPs/chSr7CPIOaOr2HuDbAJGFNzwM3e7WXQbW17bIG/zoCg/
 byzA==
X-Gm-Message-State: AFqh2krVWb7+IIXiiqRozCwum1Np2SlutE9kgIp7+6ALkFOH7sCwgswG
 FmKP5VfRC2oq7QeJyH50b6SuhDABrKpTBKeKOpcV1w==
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr3277920pgh.105.1672932848586; Thu, 05
 Jan 2023 07:34:08 -0800 (PST)
MIME-Version: 1.0
References: <20221221183202.3788132-1-slongfield@google.com>
In-Reply-To: <20221221183202.3788132-1-slongfield@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 15:33:57 +0000
Message-ID: <CAFEAcA-zv_ny28MJGf4s9T1+3PwK8WRurVgiQnA+8UWbkRawkQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net: Fix read of uninitialized memory in imx_fec.
To: Stephen Longfield <slongfield@google.com>
Cc: clg@kaod.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 venture@google.com, wuhaotsh@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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
X-TUID: 2wi3SAkFgNXB

On Wed, 21 Dec 2022 at 18:32, Stephen Longfield <slongfield@google.com> wrote:
>
> Size is used at lines 1088/1188 for the loop, which reads the last 4
> bytes from the crc_ptr so it does need to get increased, however it
> shouldn't be increased before the buffer is passed to CRC computation,
> or the crc32 function will access uninitialized memory.
>
> This was pointed out to me by clg@kaod.org during the code review of
> a similar patch to hw/net/ftgmac100.c
>
> Change-Id: Ib0464303b191af1e28abeb2f5105eb25aadb5e9b
> Signed-off-by: Stephen Longfield <slongfield@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>

Applied to target-arm.next, thanks.

(Looking at other ethernet device models we do indeed want to crc
just the packet, not "packet plus 4 0 bytes" or something.)

-- PMM
