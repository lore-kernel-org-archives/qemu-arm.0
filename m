Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1903627lfa;
        Fri, 16 Oct 2020 14:42:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTUqoDNWEpKFGoe4n308dZtme+QUKvVL8hFnODvnuMNZ/54cfXiX1r2kQ21XxqYtMw5jNM
X-Received: by 2002:a25:bac7:: with SMTP id a7mr7695698ybk.286.1602884533174;
        Fri, 16 Oct 2020 14:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602884533; cv=none;
        d=google.com; s=arc-20160816;
        b=fEz+1/43yH4bmhAWNg1VBN0GcM5DpQMUX3AkE/2j1SiN8js5xVDr+dKKLHkuuUcd/S
         cnj0gC2IhhjjNcinCRHVi7PX6nks6bIGyWshKuanZ/6jjE9UhT/IsCYSZ6jYFL3vatsP
         kAfUpcJvD58+K62YDOLLegSOjQOT6SruJyGD4Yl2gx470RJhW+UFUM6kT7GDOApE98JH
         8nX09oOF/mkVvsmI9PYDtHPzG1WkH5NcVpRNnPmR0Fiblu3/8s08B1hzKmdP/Zrs0bS/
         gToNczxYszliWxJDLpNdIjYsXFBSk+iI+x6cE8AsyqMDnlfFsH/liB7wemOPfAvUITom
         xDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YCjcoHVYUkf4IvCRj3QowSd+8EwEZCgHUEg+0SnmO9k=;
        b=KujhUy0iAglNmBY2mzfGr7VIyYoV4sJDHpT8qr1ebMvwFTqhDkpCja56l9SazLj1k0
         LiFT+ljvePgAVHbkQqGgl06991FPAS8pPC54Pha82g4w6EkzfLVE2Yp4GTNDbvXIebzk
         kfT2muAwUVIVLK3kRvI40RifcB4niSv+xldzgsc+E/uabZ/DcYWnxAUDoxAqtSHunGfM
         NLwX5YwYqpjv3Xr6TSmzK5lRtcDjAqdiEEWiGOG01V/b5YJK7C5hDkTY1XJ2qjtRhm9x
         CfJdXHb9x+rCNRexlIH9MnJQCkudWzQQuNs0jgJ8HgWNTeCYa8aOzAPP15UdvtBBYpSl
         Y6Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XQ+1J66v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7si3762679ybp.213.2020.10.16.14.42.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Oct 2020 14:42:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XQ+1J66v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kTXUK-0003RH-I7
	for alex.bennee@linaro.org; Fri, 16 Oct 2020 17:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kTXT0-00038Y-5k
 for qemu-arm@nongnu.org; Fri, 16 Oct 2020 17:40:50 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:37476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kTXSx-0000BQ-3B
 for qemu-arm@nongnu.org; Fri, 16 Oct 2020 17:40:49 -0400
Received: by mail-ed1-x544.google.com with SMTP id o18so4016227edq.4
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2020 14:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YCjcoHVYUkf4IvCRj3QowSd+8EwEZCgHUEg+0SnmO9k=;
 b=XQ+1J66vo7DkE5MgBz74FIsMPBG+eUIi7ciO/xh3t1d3NReBIub6PcAJ8/T8xc2csT
 vh2UdkvgvaKzQnO5N1d5PQgVSpDQDYfK6ar0jEEFtbpKgURuOPsJzP0ggF1y3T/YLUFY
 rmS3RwUzJtdULVuJvaKNpxaBySLXds0w+PY3cz3ILFRaedD+eXrnTeuJ8AnhbCfRCitu
 /GlW34S0RxnTZO+sHLbKCZ5dGBHN77ObUvZccenA55lEyvDk+/BqmH2GSVvj8GyJcV/L
 uzLJhfjzS8Ke+8kVqpRgFw/i/tADya0GGOygS2/2iQshB1fhtfrMa1FSFSGkmtzxUSDl
 4F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YCjcoHVYUkf4IvCRj3QowSd+8EwEZCgHUEg+0SnmO9k=;
 b=bL2IQbSsRFrX4az/Pq4seCE0GS/YyXatgecKomcij+UANwMZ8UaCI+QtWOL85aLiog
 z390kBSr+TrZ1+bENbDVy50yHfuDeonSJ4VW779y/96sysr2cLmAfGPOhtpkZ4zqQZzy
 EEMHqtG1wlfUtFxhhfO+uX4CyKnrALyBNiKB2ATbiEyCisy/WKRn/Rc/NY6EYpzxvEZQ
 krdoJfInoObeQ/QtHneLBfmyY/++QJMwzSTZTm/i545cQ8nNKdLr2wTf7qLFpgqGxORu
 Autb9jxAmQagOL/USAv7TTpHDkQIYOe7zhR8CdUoUowRetjDW7VF9W1639tvXiM/1/1D
 1Cxg==
X-Gm-Message-State: AOAM530dn5DhgOkIU2buPFZm1yDRnfFCHktvkuAXl8+YkbVcuwH01SDb
 mSOeGKSe0C/OKGw73oi2S8n1QQZGVs088ScnEN0Cgw==
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr6578110edf.52.1602884443639; 
 Fri, 16 Oct 2020 14:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201016210754.818257-1-richard.henderson@linaro.org>
 <20201016210754.818257-2-richard.henderson@linaro.org>
In-Reply-To: <20201016210754.818257-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2020 22:40:32 +0100
Message-ID: <CAFEAcA9AWL3oC000ws8gikr=teGNs=kz6x382K8kS68JWkdATw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] accel/tcg: Add tlb_flush_page_bits_by_mmuidx*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: epDEoAw/GDWp

On Fri, 16 Oct 2020 at 22:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On ARM, the Top Byte Ignore feature means that only 56 bits of
> the address are significant in the virtual address.  We are
> required to give the entire 64-bit address to FAR_ELx on fault,
> which means that we do not "clean" the top byte early in TCG.
>
> This new interface allows us to flush all 256 possible aliases
> for a given page, currently missed by tlb_flush_page*.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
