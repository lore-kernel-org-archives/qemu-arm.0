Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2403518lfv;
        Mon, 1 Nov 2021 11:41:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwHTCDFG/rL3dkGLqjFHu5SUmtfUtF50v8m3+b7P/RroLwXaWTccks+la5uE6dY5ShXIvL
X-Received: by 2002:a05:6830:10d2:: with SMTP id z18mr12566556oto.61.1635792102636;
        Mon, 01 Nov 2021 11:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635792102; cv=none;
        d=google.com; s=arc-20160816;
        b=N4arSsKpCXnVMznFxIZF7bnHNBkmOlhBJtk3C2HGxFbUykdDYG0TWSEfqe9X7Cbc6A
         r2rgcaq7YNVqHixrMQA7SzcbquzH6eEA6dcZsngXej064ivVr36NXWsebjrk22ufWfiD
         6D3BxEN8R+qi0Zu9HSglqKDhBSavifs3fgvrb5haq9qiVg4pp2F9MAPqMmSl+ks6Glna
         lt5UlDhZJPoFu81Kx1TXIlx50bp6dE/h44ab4CaEc+mZCAn65afEEMnJ6FoduXry3tvp
         lZdIcFgn0G9kxxu2OsXYRs3Dpr3o5jRjSmdLi/YQmWyiqAGi0SFEvO+6/gzHbLLhvSD7
         WJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FpqrVMnRaGIkQcaIVW1lMhgLocr72K8h0lyU/MtbS50=;
        b=wg6S2lCv2NiSiyMkgFoLJGPSnNhQZVF/JkhlOy3bnGGzMQPndza1vmmAmJAL55QfB+
         kIge74NgThcNb1NsTj4LQERvUPJhCj9I6pueQ+H+Yu+aEPDlPqzc378c4u9VAobnut20
         cVdKIWrGQDYgqHiNV1wJ+x5P8pNuDVhUL2uPg5Mzg67TH/0vaqyEEZE+8x1YWNVAepgl
         oPCLNIuffc+J/xjlowGegzXYd+rIYN2+l4Vt2mx+j2T8vLqdlq9CM7xd7WayUDcEcCJs
         fKuAxaGZ02UX7U3uRIz04cEpq4ql3QIXOgNHHbGyj4ssbWMoTrlqdIWMBb6pPvUZULId
         mIng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NDU8F3gw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si8349374ott.157.2021.11.01.11.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 11:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NDU8F3gw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhcFa-00040E-07
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 14:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbDf-0000Ap-8K
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:35:39 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbDZ-00030j-OY
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:35:37 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso8475701wmc.2
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 10:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FpqrVMnRaGIkQcaIVW1lMhgLocr72K8h0lyU/MtbS50=;
 b=NDU8F3gwxuiPraiv7NQOdaM+aaPpPi2lYo5QnIGHFJeuSJNFrzi4A2isXsizUYZCbc
 KeCxon4qHLvGoDx764RQPL3DVT8heVUt844zUNIO2kd0sLlEisTMUW/6UrPLrU7RJcvm
 d77jR1z3gEknXjRwh7P6112fyLieqaGE6giTioCJgch5c3up12z57WAuFZme0hmzqMWB
 in6OdlFFKy7Z+aYankcYW7prjklPLmJKJZFeA7cBgLP6A8n5XGSAuhRcr36KiTH8sq8c
 01o/6Us4gI8USZlmozXRw70ZPc5Q/LSneUg9rDlT7+ddrsr3i3vR2PIB+1qeuYK/AXD2
 GbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FpqrVMnRaGIkQcaIVW1lMhgLocr72K8h0lyU/MtbS50=;
 b=LTqqUKTZbGfeqK/k4yazMIDZdcti89SUnC2assq+N96lZ6qzt799WtVqNc093/DECi
 d6bXV3glod9KtD0+KLf1Mr5mcfHCBjIvbc2PMhsCvAhJWo/auXG++SUm9iKVXmBAIMD9
 9yEso+SekQjie8Xt4HtS+dtcEVG0+1HJkNKyS2brvMTDjADZO6Gt6Ycryyzmw5M2XhM4
 a3Ej/I6O3uTYE5SMKSgXBxC5Vv51TmuSR62jdsw9kxCaR0y6EeQUwWtG0PwY3t7khpqj
 dE1hOoRJ5Md9jrqyClatphlodKwK+hvRsM+mtbLZxBxikfDF8E7/1AOsKY+9hmLLBVcz
 juGw==
X-Gm-Message-State: AOAM531PwXQByrr8b9DJg0j+Po9pAOjhdB1bnWQiFCc22rohYeoBGBr9
 rtj6RaxP2jDXzimUUzyam5qs4fN7otFoz1L3ctZpmw==
X-Received: by 2002:a7b:c389:: with SMTP id s9mr303206wmj.133.1635788132250;
 Mon, 01 Nov 2021 10:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-2-wuhaotsh@google.com>
In-Reply-To: <20211021183956.920822-2-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:35:21 +0000
Message-ID: <CAFEAcA-junQQFRkge=7mRtKev5gpDgYeCuas_ooZAJZbo4QWgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Titus Rwantare <titusr@google.com>, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2rX8P3eYnSDB

On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> The ACK bit in NPCM7XX SMBus module should be cleared each time it
> sends out a NACK signal. This patch fixes the bug that it fails to
> do so.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
