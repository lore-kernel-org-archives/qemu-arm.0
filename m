Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2555653lfq;
        Mon, 14 Dec 2020 05:37:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9xYYBceY379AC0lTabUiB1m3fVut1bDB7BTwmcp/US0T10rnrOhBM4vAA6pwNgJAG0NYl
X-Received: by 2002:a25:9981:: with SMTP id p1mr11682943ybo.241.1607953054382;
        Mon, 14 Dec 2020 05:37:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607953054; cv=none;
        d=google.com; s=arc-20160816;
        b=IeklVSv+G/E+BLTEBhMNfdgbv5k1SpfyDB/0EzrcaCF1DpndrVc6k0l55otyqV51li
         /Hg74FU4n12MWlY8DL+7udG469L9b3+9XqQcqWPJ/qDrp4AGgXdE89NiOsnppj9AHMjI
         GYvB411JSB/5dVDcimF/kvslwRp+2DcA40cSrYiTdIwlzFkXGKNR+sKtat+JfnyPeg8E
         2H92I9ftjb6Eg72pW5iyQl1I4c+yhfBsnGfG/wkRr/HobSUeIxhLPoFGXXrTvEu06p3U
         V9mnwIeqDu8AkUdqz1GtkSoHZh7/1MC6pJV+gj5z4gueTnNW2nuEfezawF37fez2oqAV
         E2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dBf1ZDRhXZJ54k3ajCkvQSEqznc4nCmDAJyCxLgwLsI=;
        b=RKhH45vpMHY+XjPnSxBaSGljmCEG2zcxp9pSdEvZ6PJFrvQS+hYRFU0QNheNEGgzw/
         6xb/aPSFHRgFePqbE4RxF+JgdwUPo7pO4m//0oNMuIYPkyeGprE4I3S3+7C71AibgCC3
         gQR5+6YwSpE8Whg+nWT634XfpVkAcVVBydF5aGmEO0QTUI4GjROMtaBIV88a/e6SE4Vy
         /aSKNfv3Lv0thwx58wrj5nzL4YLfIRsdI5JAqszGAOs+KvQ2AHUfmKTJMtO1I8+TcH45
         0++tzFEc59WNpUfHC4pMCQixFL775Wn1MS15FbdjMTBY/Yt0L7SLPmf/KdvoZlURxBWf
         9oxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MYS+AH9z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w188si17855496ybw.15.2020.12.14.05.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 05:37:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MYS+AH9z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1koo2f-0006GC-PF
	for alex.bennee@linaro.org; Mon, 14 Dec 2020 08:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koo2F-0006Fc-Vo
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 08:37:08 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:34733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koo2D-0000XW-Qv
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 08:37:07 -0500
Received: by mail-ej1-x642.google.com with SMTP id g20so22535858ejb.1
 for <qemu-arm@nongnu.org>; Mon, 14 Dec 2020 05:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dBf1ZDRhXZJ54k3ajCkvQSEqznc4nCmDAJyCxLgwLsI=;
 b=MYS+AH9zU6xxDaZrIR3KHepI6x10VxdO7bzR7wwAzh+XLNxGBRjW5yJePuiGkHdqek
 JVUyp43gKoNJn8pQX8pWtJFYTj7N8X/sbxrP+bRIMgc/QLlJ1NOjz5CznZf8WxDRQvr8
 2x0WTIHwF/ojngymrfl41mZj4jqeA2gWvA8HR3piikTTs6sln22fb9qcpI/tA5WJNk08
 VyspyM9tDV9LGqSzQVgid5fFlvVpttL0P+y5sI5qky9NtrotXqieSHapiS78bQXlkmid
 C8v2/L5ACdyk8nvohMHPC4BaINvGUll96n5AkAnBVREVA03FaVnJ0kYjdg7k5DXeAM8F
 /2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dBf1ZDRhXZJ54k3ajCkvQSEqznc4nCmDAJyCxLgwLsI=;
 b=QupFqtqB+9EJcbEihvoh4KAlKN/yu/F2MpugPFG2aUT4K8gU+O0amVc+pSI7Al8KHj
 CcadfC9a52f55uLkwAGdYyKKoyCbnEYI2MbMJjq0PpCvaLCqMu9Ymee2hBM96US0rVsj
 EfpnUyU0OQ/ecEhiuUe8zzFifQ0QKxIgru4EX9lA8tGrjbQX2XNSfUTpgJxbghZhKZuO
 Su0jUQ6oKx7CyOQmfNQ8089jX8fvVJBamo+Pbek0DRV/JrVzrtQ3csx4nBwAJGPVC0DH
 Ma7PbS2qwxTDN+JX25Ya000lzaP6jTKes6mBkmmOrU9hlGpp6YydNPl/ApXz3h4BndU5
 UyJw==
X-Gm-Message-State: AOAM532k8JRWWiRDVvq8nMR8cYeuDr3YkOXYYHmxxKHJhd8fz+RJqoGe
 vLrXf4QGm0IRB5cQsRV8Y9UpdSJKj7alk+HEgxBbnw==
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr22644909ejr.482.1607953022744; 
 Mon, 14 Dec 2020 05:37:02 -0800 (PST)
MIME-Version: 1.0
References: <20201214123553.2515-1-leif@nuviainc.com>
In-Reply-To: <20201214123553.2515-1-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 13:36:51 +0000
Message-ID: <CAFEAcA-X-JV9TXgnuoqw0ZDH8W9ZyiHAEiBW=epsYyb3fJ7FkA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: iZKkFqeD48s4

On Mon, 14 Dec 2020 at 12:36, Leif Lindholm <leif@nuviainc.com> wrote:
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
> v1->v2:
> - Correct CCSIDR_EL1 field sizes.

Hi -- could you resend the whole series for a v2, please?
The tools (and people) that handle patches get a bit confused
by partial series.

thanks
-- PMM
