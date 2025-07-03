Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp497377dyc;
        Thu, 3 Jul 2025 05:23:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiOcgy6uj4p5fP9QkGeczhv0/F8dPXa/FYKif6D7bQZ+ZuRUCyL/bJseaL6vrV8Mo7fR0VAv8hz+Z8cg==@linaro.org
X-Google-Smtp-Source: AGHT+IFdzo+JQqLnf1m48ATI3wgGWF/Tsl7j8+3GEJS24JExNz+n+q4dYViAm9iLFCYrsiMYesYq
X-Received: by 2002:a05:620a:1a10:b0:7d4:5fc5:809d with SMTP id af79cd13be357-7d5c4797ad6mr908951685a.37.1751545414007;
        Thu, 03 Jul 2025 05:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751545413; cv=none;
        d=google.com; s=arc-20240605;
        b=EubQabsg5q5iBA5F20GB6kuHNiFSiQgpZcW+h0wT6arARZqcJf+YgeIjH2xl3BC+fz
         hOAbc6p06lDrGX/g3JhlvKtaN47ThG979J32EHWiZ/mkxpPVdQ1dwIWFobSlfGOw0zkM
         jx/W2h5QjrhFYymmkCluX0LtlpG6WDVzxGqpOPYlATHgJmxxFIZh6Z+2yGO+U0HDsmji
         nLwT3v0ZPTzX+1ERsvYbcjlUMS0gpilou6bKkNXMEzwasNpiuxoUx4NM6anVLAdoss9i
         zqkx6OMnAJuM8VXG/UxMLOpHFeUYykdABfu6ARmpxjExQK9W6s/mTTFmVpo/bGmr8+/p
         LFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tBgsgIeawqL0c81jNvHXOOlPF0rya4pW0p9Ob7Foz/o=;
        fh=c36CrdXHJrUD1M4uqi5zp912UhzmKzxtkitg+NPfuS8=;
        b=ZM57t1nCMoftRfdsY1L6E4KDATzpUWM51jDk8IlSvI8Z9HGxcNOFrZmrbQ7iTRBNst
         q3xljlPHO1lx+lyic0umjArv7B45qB2m4WiHnTRQ2gkkm6Ra7JuLv/97Q7AwxDGPVBYG
         g2T+uro9Tw0/lpmn2r/3fKD/VkrriDM4O7bAYBd5qzEQXaUA0lFmhDNpXWorqmon5n0A
         3jH2vUuuFf2QiNfvs0DCPNaXDGDQGAadNksJGHnaQEieo0I8e4+jCYzqkbK09Js0pFtm
         D0k0unzEmnsIX3LL1AamnsfCBTJtZBT/dJ2yfSvHnY5ApjH7tDdx7Va5biqEAA7rqoJc
         xSvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MnuRV25N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5c7d2d899si368638485a.502.2025.07.03.05.23.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:23:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MnuRV25N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXIyL-0005bs-GQ; Thu, 03 Jul 2025 08:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXIyH-0005YO-OD
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:23:22 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXIyE-00046H-Vz
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:23:20 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-714078015edso59825157b3.2
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751545396; x=1752150196; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tBgsgIeawqL0c81jNvHXOOlPF0rya4pW0p9Ob7Foz/o=;
 b=MnuRV25NObniWLgy7IQwJpWQ7p2q1Zk0qDC03ePStEh58whm49c8y+YAyiflHH7EMr
 InNQI5g1TDQgPNLEja0oOLWoKbqpCk3KBXlIE5cj6rD4c0vBb9H3cjE95g1eVsaUMznD
 jqLBsXLqZAF4H1WPdi+1R9QtsZjgOnRCe1HbCU/T3BoeGmFAdZP67hQndTjE5kIqrbKM
 hBX50SkX2jEhWGZayc7dqCwOMUWHEdNm6e4YZ5gEtGl3Pbm53+Z7S+W8l9BCIxlMUXUV
 lnCD+vb9I4lxL4xpgT2ZL/LIf90bPR28RY75OPePFg3qKoRGTB1AJMHIKhMwrEJVO7V9
 wfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751545396; x=1752150196;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tBgsgIeawqL0c81jNvHXOOlPF0rya4pW0p9Ob7Foz/o=;
 b=Rp5onyX70u7KDD+ZLIYPEl6jNZ5mSpr+/raiGf4AU1rnZMJB/KOjkMJM9vkYSKCq0d
 qhSjvWW0oRe09c1mVlYXZ9YJF5hSxLg/yuIIHMyVIwypTthmLrVvvT6y3cFnCm90Kx6w
 VIg1bjdP7u/2ryMxBBGXY3J4Tw6c6Am8oZqeuy0hSV65wSXvRdH7dRSeZrdTqIobea57
 63nCKogwUW/fo9Yu2w08Q/WnV9hcIitQROLNrz6oqUsLs052DaHDhflEP7TNHeTQ9ujd
 a8++Hm4ZXKMn6F1ckg1FJErjeCroUef75s9pd0EZ5DmqxULmyxylDQnVMxiB8buKT8TH
 d8xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSMQnzMXm9doNN5r3FPRWMP9lVhXmMbUIjw56xrfjw1Ct9/EGr/7qDRHyChh/X65Ynbnr+x1adjw==@nongnu.org
X-Gm-Message-State: AOJu0Yxt32JO9syFcHq1WaoxNB8UpQxTnwgnpLVjkn4TVDhZjO6d9IVp
 peOuknxWwQY+fNTxgWFajfNGwIatpD1AWtUktH+mcsj3gV7qAbVtoiq9Kapo5uUDxeiSXL5OD+e
 fsYuOUs1LiCJieqxkZesRqi+eVcPHt5N9JdjpWs3bKEYRqCb9MK1W
X-Gm-Gg: ASbGncuvXmGxEDWBVh087Y7ftLlIrOumpn+lb42Kro45MbedD+W3ssnLdhcZVSE9xKo
 xB1ezQrfMziZdSXcvOVGkrS3U+VBYHSbMuH9nfRmZw7eBCFEG/hNtcNLI6+iBioOwAVMZCWpYre
 YsuGiPSV0diZIaka6D+rGFzlOiYW4wWUP/W6YxIZbzbiKi
X-Received: by 2002:a05:690c:3386:b0:710:e6b0:1688 with SMTP id
 00721157ae682-7164d2c773dmr92527667b3.14.1751545395915; Thu, 03 Jul 2025
 05:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-74-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-74-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:23:04 +0100
X-Gm-Features: Ac12FXzv6GIncvGRC8JU7oNCkG8Xfi8bhT9yeJqWpl3dIFaITH28rkiKow-bP8g
Message-ID: <CAFEAcA_9V6csuaiaxxsyWK2GEX1=u03Nx-75h6Ko-Z8mqDirHQ@mail.gmail.com>
Subject: Re: [PATCH v3 73/97] target/arm: Implement ANDQV, ORQV,
 EORQV for SVE2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
X-TUID: XJ5nH5YLl4BF

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
