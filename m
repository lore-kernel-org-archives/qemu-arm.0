Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4639899ejc;
        Mon, 6 Mar 2023 05:24:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9kPfWqlf5iDfAmr6BuVU6y9sHoONVbZwCmg64PJ3LP4dzv8wsUmExZYPBRK2orLYxOvdxC
X-Received: by 2002:ac8:584d:0:b0:3b9:bdb0:7aa1 with SMTP id h13-20020ac8584d000000b003b9bdb07aa1mr18053962qth.41.1678109097809;
        Mon, 06 Mar 2023 05:24:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678109097; cv=none;
        d=google.com; s=arc-20160816;
        b=joyYt2W5FuewdjhZUvvXd04qmVT7WLdMJ+2kiQHLg9eDMnW7jkVIe9qQQ+R8LPbJUC
         XLZKRDdMJmL6nN38N/HLqEGRx6ejt/CMCYKJp/0ZITuWTQ8/wvLx2D9CXuPTu0caIkBh
         PiSZgx/oQREV5OEHYzAqMpAd5zn5rgY5dub+ynpK9h6YZdoP9ujRnd0Yfeh/rTR4HXh4
         F275/qS91QYvQRQdK0xPji4dcutBJCYbQBEE6xw0SPZLzm0QoQ+sN0tR4JhGc06XK+Il
         JvOd4rel5VHkftHW2FWD04S8xd2XTuPBmAqZxLC99bjnef2jyiGOxW4QrB0dVhY/lDa9
         sMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HxdjSh3vP3Rn3j0YRtRJiUB0QjYdnEH+iXJyTXIBTXc=;
        b=epfbLGObEC9XsgPSyPy61kIEBVisOcZ8Y9mYYSBbJ/DOi3VS2KO4fwCEfksw18Htds
         PKjsXU4R05yTuYon811fnF256oOl5AW4X+/wsk/oFJp4KynD7bly196HDxNmmDiP01G2
         k8U0USsPg3Z/AX29umPWKlxCfVhX1a9D/cNxlxhydrOXaYSPx81KTQKXGNcFoB0zJ3rK
         vbIODno7H1DYcq+/Pk3be2jSlL2e0/UR9oIkaLUegL0ZpXx01uTFAVa9egs40mA7SBzp
         1+kNU7W0tR+VRQS0T+TRlMLN6zLmOmjK5c+VG2xje1Ek1r/yTMvBQdu84Mjtbo6pRpZh
         UJHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=subXKE7g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16-20020a05622a139000b003b9a4c00d2dsi7203866qtk.30.2023.03.06.05.24.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 05:24:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=subXKE7g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZApS-0004xE-63; Mon, 06 Mar 2023 08:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZApI-0004lK-Mj
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:24:31 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZApG-00061u-Ur
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:24:28 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 132so5481115pgh.13
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678109065;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HxdjSh3vP3Rn3j0YRtRJiUB0QjYdnEH+iXJyTXIBTXc=;
 b=subXKE7givj5/HnuGLpeef3+Kryen8SfGdV++UxRtOFq02pC3HY737KSa1K0j7ppnk
 m3RdByPpD2vJxWHqmf5779Zs3N3WxWcbBKaLvLB+mpZHx/BPUHe7iNAaBSNW2G0HCRks
 Q1nukKFBbLbOL6NUCTfkOOc++TIZACexJKGbsPHvzcMfTymqoIhMAP3MqP8XywCATvKB
 70wOb3l5x0RQ5TfQc67XsPL12x6qHC1GxUBByuGV7pS8PuaQ1i0AsSCXR2jBI4JOkDRi
 8NO2Wn/9xcuWuZR2yX5RiOIsv/FBKZlstbnRWRHKI7r96YQG7PM8PyWcCgyrg0sf0bL/
 1j+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109065;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HxdjSh3vP3Rn3j0YRtRJiUB0QjYdnEH+iXJyTXIBTXc=;
 b=EVAH/XojxziJBs0hamDyV39MPpxeh3f+mloj9c/qrpqkxN+rw7kmU0PnZInE99uLn3
 eCeTXvSAJTvGrJMHmnZ9c1ldCNHdFi9A0gh2T+BU3aoKa6Ri+3c/Wxt9/y8QWELZIyk5
 j1+tlr8W2mdq+dq72RdmY+/pKohdFkMWP1HFzzujP9U7mN+lEWib0VRZUFIUhvBLLCBx
 5f4N8RPT43JWTN/KrclaxjVZp6ztk2gRCJ8tL22hWHtJj+tTLhiRveo9HPrdLMF767P8
 rM+m4hqsnfjwL8u4KAq9L+YsFQzSZnQE3P/Y5ryzMWCcuMzz0g6zGJjiK4733rP4E+Og
 iP5Q==
X-Gm-Message-State: AO0yUKW1Ht2G3AgtGKF9dkqOE9RwBB0IRZQk0Db5GbpwEF7/TNy9ifN5
 LCd2hYGrMarUMDM02/itkoJd/Ai1hN7gmQNIWmOYGA==
X-Received: by 2002:a63:5508:0:b0:502:fd71:d58c with SMTP id
 j8-20020a635508000000b00502fd71d58cmr4004600pgb.9.1678109065534; Mon, 06 Mar
 2023 05:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20230220081252.25348-1-qianfanguijin@163.com>
 <20230220081252.25348-3-qianfanguijin@163.com>
In-Reply-To: <20230220081252.25348-3-qianfanguijin@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 13:24:14 +0000
Message-ID: <CAFEAcA9pYsD547i9eGD4sS=LXTJb-dn0Q4xsODHhCHW8mWGqqA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw: arm: allwinner-h3: Fix and complete H3 i2c
 devices
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
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
X-TUID: GW5rTK+qFAxC

On Mon, 20 Feb 2023 at 08:13, <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> Allwinner h3 has 4 twi(i2c) devices named twi0, twi1, twi2 and r_twi.
> The registers are compatible with TYPE_AW_I2C_SUN6I, write 1 to clear
> control register's INT_FLAG bit.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
