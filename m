Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp566071lfk;
        Thu, 21 Apr 2022 11:49:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMBo5lxpnmIj10FLoFJL41fqLChQn94ml3GILkOjhj55Y3fQRkFWC4GBdk+b0NJ9HxT22U
X-Received: by 2002:a25:5182:0:b0:63d:ad61:e97a with SMTP id f124-20020a255182000000b0063dad61e97amr1125222ybb.454.1650566952998;
        Thu, 21 Apr 2022 11:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650566952; cv=none;
        d=google.com; s=arc-20160816;
        b=Gg8TgFM8/WuEKgbCXSrWUvhwvfcVW3XdT6GGzGt4lW/brNPfpy9/ZCsatjA1kwBzMx
         Ea9TUfy89bVdjXmhJCI03SlelW2P01Cw9pl6ZKpHGuhMRfkcKb6iv//REI/S61zPD+FG
         rvbHb3vXTcdUxCv5aEvYsS25ZlT2Hn4RFHW1mMh0jLMTp51dCHBWeZAPApZ6SRq/bd6N
         q+tNxGlTGDYbkkk2STckYxU84z85d4YeaqMz9eJRGrB4Nt+XawIU3E7QLiK7hBOjSbmC
         ommwWuUdjVZHFsY/G78bsIN65jYKmvBveRlyobuqEZBOTT5YhTiXT0o9FhOZIWGHTKm/
         k0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HgBEukXG6xyc1fESvAsIqWBoomCczufsfPYxF1CPcQk=;
        b=K2eaW06q27pZB/O9wePC2w3N/ERlYSuELnSx7HBUwNLCMmKpRbqrn6jh9x8xUfHfR4
         tKEqQXuaQJ4XKY2LbtzkYui70/aqaW5s9eNhk7HX4dtvaIT7rV4xmGSle2vxSdJroJtE
         WgQzSBRBxg2iz3K11HCaNYqiaGvvkCL9HgahBYO3cqhVbt9Q6pELJ/0ZF3T3+In7IJlb
         saGDlcwz1iZvSO+Hc8xMZRxwRz5Z29r4Xr7l96ozmmprst2ObyYAzkhnPBhy1v8R9IeJ
         zcK06OTsAta9y5yG4Xc+U3X9UKvjuP/wIvsHv5Zi9J02ZE0mvbzgqgDrO7ymMLPrgufT
         7QKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CIq9JhQy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f79-20020a253852000000b00645758b9929si2235753yba.663.2022.04.21.11.49.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 11:49:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CIq9JhQy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhbrc-0007A1-B5
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 14:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhbpp-0003WF-A1
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 14:47:21 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:38672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhbpn-0006tB-J0
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 14:47:20 -0400
Received: by mail-yb1-xb36.google.com with SMTP id v10so1556986ybe.5
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HgBEukXG6xyc1fESvAsIqWBoomCczufsfPYxF1CPcQk=;
 b=CIq9JhQyiM3rvvv7Fp35r65bu9IjRCWbMqGXmgP6lnl2mBJfpX0oGfDSlxPwyzh8q9
 8+AhH2d46rq+NzT1RRlsfyPFWoQnL9R4aIKyNdMnVnDgC+ysfdcI+hGH8C3Xj7Ozd/Hx
 Nd+hwQMn0FX93zi7BmL3V082KigQhk+U39lrYAPQ97EI6a8u8y4ObHiFFIUwuCICTAHS
 iQN72uju6n1aXVHdZxwjzAkCz9P/PxYamyIkhJoxa4U3fHm06kBaU5tW2/ok0mbLgeNG
 w7sbrcbt/T1B2oqbEK9jyJOse1MTjgOLxoUUY+gPfFbZRxjRDH9Zgh5TeAcZxdfd0wqb
 3Arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HgBEukXG6xyc1fESvAsIqWBoomCczufsfPYxF1CPcQk=;
 b=A83AtZYAheoAghVYIbBC4IN/ITgqDrHalIbOmDIaO0kUd+2NWy35ODLVuLS8nZ1UqX
 sT68wFz6LRSn4VhMFkezCjPSFDun71xqZ/6TK57x6PFbfsUvf4YbA2++bhnTiwimT8gv
 qKr1RxZ0akiPtmaleM79sr8DLo5lOGJD8X32WCNlocX99FNqDlLJgScKKhibCKyFe/xE
 Mx3wnGYSJWP6T3KRmKUwu9GgvrRctwxz/DF6rCNUmeUibxzJ8yXIFotHfR9BtNaSPexD
 SnMjRgl//MOCJk2HipkoOZ3IOpWttFq8PgJztrd0bR8O3TXWS0YZHb6sPVkGo0vggWvR
 zXTQ==
X-Gm-Message-State: AOAM531DtJ5VnvzN5D6YZPiMe9fHA/v4igJZ24fO4kbrCA9JSTHAgDQC
 O0RfKoSlF2X0F4i7+jWL2S3yTUe8+obEmro1ZNS1dw==
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr1135865ybg.140.1650566838491; Thu, 21
 Apr 2022 11:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-13-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 19:47:07 +0100
Message-ID: <CAFEAcA_WTPB-=rgELDx4fzim-RQgpd_M90D5-4eKs4ynUSXOXg@mail.gmail.com>
Subject: Re: [PATCH v3 12/60] target/arm: Split out gen_rebuild_hflags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5DyZz1c6eWnC

On Sun, 17 Apr 2022 at 18:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For aa32, the function has a parameter to use the new el.
> For aa64, that never happens.
> Use tcg_constant_i32 while we're at it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
