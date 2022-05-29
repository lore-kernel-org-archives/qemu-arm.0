Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp2126491lfh;
        Sun, 29 May 2022 03:53:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaU6/6oKqsF+aJQXhjQ5F2m/ISAPASB49DiEYtzc3j1M1RrNiqCHfqpOUHQRdrlz+J3+pX
X-Received: by 2002:ac8:5d8a:0:b0:2f3:dcaa:f1c7 with SMTP id d10-20020ac85d8a000000b002f3dcaaf1c7mr39894851qtx.529.1653821586923;
        Sun, 29 May 2022 03:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653821586; cv=none;
        d=google.com; s=arc-20160816;
        b=tHO+mis2dSFpxWkmWZMRrdahgmzm7a7F5O+TPnHVmdk5XbLqVQ2i/dzB6mLPGNO1Ns
         WxaZiBK+tUP7ymFPQ9nSLaI7obasV+MQovq96ac/VPHi8em4B3piY4u76inpuOZSwH3i
         Q9Bj57Tle9AjafKMrtYXdkXimQEABQABnlNPMbaI9vdbByarHgjiMLmSIEu9PVKcsHWx
         AA/Z7uHF4eTLUveoork6cnV87xGsP9riv/1NfyxrbIM/H6E65BkcZ1pHiZlmf8fHEIob
         Y6WQXFXfyufjYyuzKjz+D0irTZNfI90Zo2qH+o7o0slO/tmNfeSICUrQxgmhVmkACcKr
         Yw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Y+1AHTkeQaZXytjOrhFIQxWbhAdltRP0NRbkOPctln4=;
        b=DUtuvlteZtYXBYjAXdlbKPOUybI5WB+oMw8X9u76+nkPYsLFWWURqvuQuEL0nFlwP4
         z7mUHjXtW/Bcx5Q6NMLVzjSzgj8SxRFFNyx9TIMrrgizo/LQ786wQ9WGKDHo/YN6lHdY
         CbyxtHwGujslqgSKwQAh68n884ExWtxrG/RQalUG05JxePnvGMFPfv0YF2C9+T48pv3L
         0Ln//k3Pmdy2q8k68V0oZw3vrttBOaMaHmW6QaWkoBCOAEE5YHSfhV//vUjWqcBUWXJT
         zQTRViYZXg/KcRQEpCNvE5q6vpQVYgPF3WvHmXXiaZC4N58ctP+olPpk4lWHRllhL2A6
         n8Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ApqGPHnG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2-20020ac87c42000000b00300f278f07dsi1765201qtv.46.2022.05.29.03.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 May 2022 03:53:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ApqGPHnG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nvGXi-0006mN-Df
	for alex.bennee@linaro.org; Sun, 29 May 2022 06:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvGX2-0006l4-4h
 for qemu-arm@nongnu.org; Sun, 29 May 2022 06:52:24 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:44578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvGX0-0001ud-F1
 for qemu-arm@nongnu.org; Sun, 29 May 2022 06:52:23 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id a64so4562762ybg.11
 for <qemu-arm@nongnu.org>; Sun, 29 May 2022 03:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y+1AHTkeQaZXytjOrhFIQxWbhAdltRP0NRbkOPctln4=;
 b=ApqGPHnGEIlr2AiJBiF/BDvRJt+5B8Z8hAWwxu2FAE3vcifZ7UYMY9hlwiafKD2dVf
 fh51mRfJEWnlOlmsNYNFUZjEuaUUn692MU+ENWMdk51vD0AgBpalBJWlg/0SOEBKy0dE
 UoI5XlPBq35xxduM7l9lmmRB6EwufjYpr+aCzSvO3tn/q9jDsoIL9Q6Rq6aQzVa12T3s
 EiDdHHVfgJJ0gtd1Rx+Rsphy/3as16FXlvCL3K9q81pmWc//xSmxzF71QDq/zgUNLVhx
 BrzcXK5FsZO6Y+7MH+adpTUrTDVf7QPucCJoT+rZDu/axRrKnGZTx9TRitnKJEUCcICr
 ZBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y+1AHTkeQaZXytjOrhFIQxWbhAdltRP0NRbkOPctln4=;
 b=mE8QMETy35Pwzd/WTQhv6sPyJTlIQBQJ985sAT3QQ4U4c9tZsKmJKDanPtoRdGLdYA
 b4YYwjJ1OFbN9BGIOl9LesT0VZjY4Iw1sgJ1xW68x4wwhR94SwrmN/X3P1H3w4hQHc/n
 NMLORe+hajjFo8q3YjaKPLWZXPLwrgk8S+Pyvfq57tV7dgWw/5O3794CnnZzUFyntzck
 2VpJBoerjIiJL6tquHQG/Zw9sHKX6hAW3rulaTDLMfXwyK5sh5hmrNiSwLz+i7RgcQ4x
 IMmOcCccu4pvXlNoI68Xf58l28KOsyGC1/SlTxqEF9qqggtdHXsmMI71aWS+3EndD7Tq
 cBtA==
X-Gm-Message-State: AOAM531wQ19bDwk0s6sl3rb3NQqY8BCJpkDTbsz1oV50fAxeR2S+WwqF
 YUsWbtreGJDBJNwcV7g+9V1aSQGR9tLfTutPKs0DJw==
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr5156415ybr.193.1653821541056; 
 Sun, 29 May 2022 03:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220529082709.89190-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220529082709.89190-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 29 May 2022 11:52:10 +0100
Message-ID: <CAFEAcA8PeWCTqXs2iNzEg=EqRVXQR9WWo1rapTtwtFogEpSG3g@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Include target/arm/cpregs.h
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HvNmZoL+MEOm

On Sun, 29 May 2022 at 09:27, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> hvf was missed when cpregs.h was split out.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Thanks; there's already a patch on the list for this:
https://patchew.org/QEMU/20220525161926.34233-1-philmd@fungible.com/

-- PMM
