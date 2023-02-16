Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp490676ejb;
        Thu, 16 Feb 2023 05:25:03 -0800 (PST)
X-Google-Smtp-Source: AK7set9Wvr6+10ecim1N4CjYz7zdMeQggn0wUl97moBzAD0LIWeooQmcv3rYzJe6BSZwTPhEU/Rb
X-Received: by 2002:a05:6214:20c7:b0:56f:47f:bbe3 with SMTP id 7-20020a05621420c700b0056f047fbbe3mr1272919qve.4.1676553903093;
        Thu, 16 Feb 2023 05:25:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676553903; cv=none;
        d=google.com; s=arc-20160816;
        b=1HcUktYi+ob37wFDmCyzuWjdUHZYyHbVaWde3XU7++hPnPl2REFIb3LCx84OmIM3oZ
         znviZRTIAhnSI21BVm11KJF1espoGoHBeaADkd3GEFqqzI3jSKQ8FKA+0YipsOjFhpU0
         6IIKh/ApOqLgjLTIPMvN4QXhoaRGZTWhfyfTR258rdXHcOhKZqJPyF2Dk9Q4uoSegGwp
         gQjvrUtqpF04/Mzn709AN0moVwvSyyUSU48j/YqEhLVp1PXE2gWD4sdWSaGuEVNDjiZt
         HxNVRAK/aP1AgYKkvcZswD2vOlaS68TnLADFb4Inzfyaxq26nntRLPAchYBUDgpnSefQ
         s3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VISz5i4uIp8ANgkLhq+YGuiRrpPZJPD6y+fAQIFxv2w=;
        b=ZjKaM55aXXav1mzRAEHuG9V7ZB12DM0QkwiiYrUf49TZ2tMlMwiGujh0leTAdifeej
         lKhRGP/HWldVYlxQuLVYLN3y0RpVUWZKV5Ad7pMAh1fCKJjMseepxN6XQhzVO03roahH
         +0nCd2YcNmmhcXSRDQ99dNkdtN6PtfKT7nU7aMR5z9iQu4l+0IfxQJIuMNI4YaVzCrtr
         pcswozo4TjhnAcheUo/CIJQgXKufZv90EwtWor6IjWHa0XwTmmZjlBQbnMK0gPYt5S4Z
         NkacTIvHOhD4L3WrDYiXWDX0z9iPK3NW3lDZsMdhcsD68utFXY2TtoZK7tH8SnX2tA1i
         cAJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=foTvOk8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay12-20020a05620a178c00b00738d7b43a9csi1407863qkb.401.2023.02.16.05.25.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 05:25:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=foTvOk8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSeFW-0008CW-0a; Thu, 16 Feb 2023 08:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSeFS-0008C7-Sq
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 08:24:32 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSeFR-0005jy-EY
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 08:24:30 -0500
Received: by mail-pf1-x42a.google.com with SMTP id y25so1424671pfw.11
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 05:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VISz5i4uIp8ANgkLhq+YGuiRrpPZJPD6y+fAQIFxv2w=;
 b=foTvOk8CUcJwSJ6IpqCyV+xj+iUHOw5du99thQ+XDVbNEHXQ93qQLo8o/MQddVufNW
 u9rnXkARHBLrvcarIVqySbey2jhRBZYbHX2gNyg6xnjmz3HyEbhjRknSAdOMX0tDb6nN
 2yQbwjdG3huo/IVbp2vJ8+JHSWa1PtH9d5z2QyyxVNNpOFBSWzDLaFWz8xYwQg5CCC8O
 HllWu4yvvzL1tDJCVdFmqgKY+cqKsICDjvasD81ctGAwH5re+ccGv/G19RibrimC2gT3
 A0liS4eVu57y7zRnZLdtI/aDxFBefbj1Pws+DYoCPGuWws0dFVgzApSbbEy/yWCZcq6D
 YLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VISz5i4uIp8ANgkLhq+YGuiRrpPZJPD6y+fAQIFxv2w=;
 b=xlIpnVTH+E7yYgKARhxXMbowf5d9mm3nnWdUnRoL2Wm5Y62HrzlvcNucIxGgVWLzl1
 4RLdZw+vgQyHXx3KBREcVwU+NhXxfl7aGIh/JUgBdQXL97Fnx+yPC8PdN+CcqyNzuhnO
 UteyLZQM+YEQijOAD6q9JESdz9URy252rufdbyCtuIdt+BcePazRmuXNWxZ0ftpDIg3e
 nWCvUx2qa893n61SFtx4fPK4ZfkVX0sUwE7XAa18kL3GAh3Z7mk7/XthFJtMwtgK7TBG
 dlARot02S3WwLBhbMm+CyCsPCCk/dEh+pqbvqpm+xr5NRvj16hX40bkOQfMlnly17PxR
 GnUg==
X-Gm-Message-State: AO0yUKWflW80KKCedttJh5pRMobSQsYOGx1Yab3ZsxsWeZhYT9cVzJHB
 kA5TGFOHXt4a5fiElIZB0lX4POjJMu7JqGWJiHhOIQ==
X-Received: by 2002:a65:6941:0:b0:4fb:8fc2:afdd with SMTP id
 w1-20020a656941000000b004fb8fc2afddmr262061pgq.1.1676553867678; Thu, 16 Feb
 2023 05:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20230208235433.3989937-1-wuhaotsh@google.com>
In-Reply-To: <20230208235433.3989937-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 13:24:16 +0000
Message-ID: <CAFEAcA8O=YvQ5XZZHA79F5nHExANVUcckpZb8p8g4HzywAuQbw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Nuvoton Peripheral SPI (PSPI) Module
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
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
X-TUID: qaRSWCQYiSIh

On Wed, 8 Feb 2023 at 23:54, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch set adds peripheral SPI (PSPI) modules
> to NPCM7XX SoCs. These modules can be used to
> connect any SPI peripheral devices to the SoC.
>
> This module will also be used in the next generation
> NPCM8XX SoCs which haven't been merged yet.
>
> -- Changes from v2 --
> Change max_access_size to 2 to match the datasheet.
>
> -- Changes from v1 --
> A few minor updates for npcm-pspi.c according to
> Phillipe Mathieu-Daude's review.
>



Applied to target-arm.next, thanks.

-- PMM
