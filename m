Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp104021lfk;
        Mon, 7 Feb 2022 09:59:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygO/mXmsVLw31CEowOhWHjl/WCMvrgXKpq2JPWzWBn8dc2NKALZACgMN/IiVIhtAO8TFJo
X-Received: by 2002:a25:558a:: with SMTP id j132mr979086ybb.85.1644256797526;
        Mon, 07 Feb 2022 09:59:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644256797; cv=none;
        d=google.com; s=arc-20160816;
        b=bw22jcfme7vfvdvbL4mFxDvtob1AIF8WRrXv3KqQivQcZaFZx9d8+N2Uf0yjrqXEWQ
         VvFwZB1dCZkADECbckjtw3IeaEZf41BUeiCtJcsTyww5HZGeJgnhNqy9wvtXELq63aGC
         DYWsueZVH4zNfF//AxFha13jVMGURBo82GmZKmucTQWMq3WmvzA34qtAyMrtMrkJY++L
         YnWtTWVA9pcKWGFyEpggP4Ig/L6T/NncKK50TXGcI0+xDGdD5imT6PrTMB09q9i6tf4G
         1mSMIopWda6ImucjN6DXuLBkTNCUBdTxBwZG1qsLbSSoP5fdyeBiECJkKj7xEn3YGx1m
         3Ubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sU0KP4W5nwhsy8Qd0XAZbxiNLH82BEYFHnL0QzVeSXw=;
        b=EdbdKVLnJb8CqfRMR19wtc9NzpSZg4Yexp+Q6tbxSlnAVWCdP3nkO5pcj7nIy8VOa5
         lUp5pRlkxZnfsjV6aWlbWY1B0gxUr74VT/8xwMezrcU4WvXMcpABNfecqElTXjfEpj1t
         TAhYIIsMsGtYNHmYAAhaFb1sIl0A5pyVM6hLpfMdhqPMfz8bWg4mKdywsv4Gkpa8+ixE
         F+YreTF9g/PLauAd2d1qt2XYmnhj5DMxH7UyREYUgVzXTGxtrrBGPGgAsgmc7UypDBG9
         NPF3JJYxAjoM4SAnn1A0fFp/ZfrYOBexD/h3O0NpN3ey3zdqEkzDVm4+ofIp0djvMdfg
         mnSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pwcmca+X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h127si7742964ywd.132.2022.02.07.09.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 09:59:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pwcmca+X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nH8Iu-0000ks-SP
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 12:59:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH7uC-000839-Cj
 for qemu-arm@nongnu.org; Mon, 07 Feb 2022 12:34:25 -0500
Received: from [2a00:1450:4864:20::42e] (port=35532
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH7u7-0007hJ-Km
 for qemu-arm@nongnu.org; Mon, 07 Feb 2022 12:34:23 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m5so8888382wrb.2
 for <qemu-arm@nongnu.org>; Mon, 07 Feb 2022 09:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sU0KP4W5nwhsy8Qd0XAZbxiNLH82BEYFHnL0QzVeSXw=;
 b=pwcmca+XTUtr6P40X6E1x0B7Evs1a724sdynQUc1dgItDMkxhbMi315eWm5gzE4L89
 IBHWWpwyhGG1zk3kdl6wR4gvdA8jr+l9TV/H6zjFnXv79bN7qNeaAB7v+kewf1uTU6xo
 f99rO/D/g3kMMuILQvG2yaoCELJ4awGqc1SbGndbz0MS9Y4QMHSlvm4D8OoPYFf6oVzy
 ntQe0qaUo72dQsZk1AbkAtFQ1OHf+ErDooODuL08+7+6149zCEnDg2hos63ZvRDAf0uk
 Zne9sCBjoG+UDwn536B5+Fuev6n30r3XDoefvCPl9jiXC9SpSYV2W9KKcWPKepdEsFow
 Davw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sU0KP4W5nwhsy8Qd0XAZbxiNLH82BEYFHnL0QzVeSXw=;
 b=X/7xvtNYtCaTAOIl8uWQy6zTCQ0GvgAzy8hWnf3RhQdWlWUVizNn/XFCVFcKvxtcrl
 2RyS2F6Q/VuR7BELKfqSWnTkhDYKPmlzE731f4CNvC8JlYrQl+jk16j3TlfHWZXaOxc9
 5MGl6iBblqQzii3p0DuCHfarBjS/LVbtqnDHZFkzoobsinARmb/3KszE+tPzrkH/VT6D
 bgTj6jVE+BruprJBXfCPBXK93PnSHg7dOrI7dWX+D+dtjob4M3nUi3J/hH24LdsEhUcy
 Zi9/WtWdiM3g2XqQXYev2LaIVQ89UWvnCMRj+uKLHt+nSKNpFsychBKJEKnxPYlros72
 wX9A==
X-Gm-Message-State: AOAM530ME8325oHeyd1quTGan6VIIFVooOUsfIiTcvJotPaOrZXaS2hH
 bCjWo5cH9v/yt8pdvSJOikudyEnfBnPWp+GnXFuftw==
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr409099wry.319.1644255257352; 
 Mon, 07 Feb 2022 09:34:17 -0800 (PST)
MIME-Version: 1.0
References: <20220206014120.2871459-1-venture@google.com>
In-Reply-To: <20220206014120.2871459-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 17:34:06 +0000
Message-ID: <CAFEAcA_k0y3gtzpi_0JG7TM=VaAa8+mb=tLSu7UHCRYhDWajZg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/qtest: add qtests for npcm7xx sdhci
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, Shengtan Mao <stmao@google.com>,
 qemu-devel@nongnu.org, hskinnemoen@google.com, Hao Wu <wuhaotsh@google.com>,
 kfting@nuvoton.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 Chris Rauer <crauer@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XWzMziTTz9c+

On Sun, 6 Feb 2022 at 01:41, Patrick Venture <venture@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
> v2:
>  * update copyright year
>  * check result of open
>  * use g_free instead of free
>  * move declarations to the top
>  * use g_file_open_tmp

Fails to compile:

../../tests/qtest/npcm7xx_sdhci-test.c:121:32: error: use of
undeclared identifier 'NPCM7XX_REG_SIZE'
    uint64_t end_addr = addr + NPCM7XX_REG_SIZE;
                               ^


-- PMM
