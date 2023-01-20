Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1288591ejc;
        Fri, 20 Jan 2023 10:23:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvxZARnfOL0iib2HDXsEb/NK/1d64OY0NJjxY7kz8T6OwpKB1u/hiiquDjkwtArS27UbGc3
X-Received: by 2002:a67:ce9a:0:b0:3d4:713:58f8 with SMTP id c26-20020a67ce9a000000b003d4071358f8mr9952660vse.12.1674239031998;
        Fri, 20 Jan 2023 10:23:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674239031; cv=none;
        d=google.com; s=arc-20160816;
        b=zd2aG2inhCWhzm5Ows/H4fglMH9MqTFAy8Te/9UrBQAskwLfxJ5hntnBgR1qoZ5FRr
         6Ad4Sen4KKfGw+A4HTzR78m4xUP55LS2SE+eqDqDAumtcOMoWDENMIVEzw+fxSrfBcPB
         mypffgZrNnTGcntcTda6+9vX4EuTiyyawy6qny1uzvpovaUqpL4DOQY3IwoEcWEzXDQY
         axq7b0+e0AV+WErTpXkYzAnVMuJEBdf76ZAWJVHxZZMqKrt+IMVpHhNoC41a/VGOJk8b
         IOOVVnrCiS0AywJMaQAjs2HR8E6Wf7Ga9xLhvEMC2PRSkSbUyG0AZIbHEZT3hK9ePn/8
         4bIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8Xve2DpNuJzB5MZhk2rmkr0AbxyM9O49g9VOgWGryps=;
        b=QD/JtAScgIe1swzT5EFcWWnIHca4aNsCX3m/mA7JRgDwZyX+7TQrzV1TFXS9Jci/5S
         S2A5vvn3HGx5xFTMN3atnAP+IsFS331QceuMpghNYUjqQjALG3ixZGuyGMNzq2uV/OCr
         YS2LZp3pJiuF7ZH8HiUzTX8GGX/nWC8C/x6Ud9KWPSvxrlIaNWUjXZKEXTCNrH8EW4RU
         v3OBafWjiGHlaq7mpW1UEo/kjYru8bYLgDvlGyMoAv371IuXrDFLvO9pqYoXEiI6xkY1
         oICb9OyMPZ6HvDfHYi8fPUVqUO9xp1B/wEQZVYUNEHFjbXxD0oFlEPJ6QyaKXS86QZKV
         3fcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q3F6kUYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020a05620a13ec00b007066e12f4b6si8480346qkl.193.2023.01.20.10.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 10:23:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q3F6kUYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIw2r-0002c9-3K; Fri, 20 Jan 2023 13:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw2p-0002bV-L7
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 13:23:19 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw2o-0000J8-1t
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 13:23:19 -0500
Received: by mail-pf1-x436.google.com with SMTP id x4so4618752pfj.1
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 10:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8Xve2DpNuJzB5MZhk2rmkr0AbxyM9O49g9VOgWGryps=;
 b=q3F6kUYtR+cbPPq3svvKtB+bSGdjaGAeOaSPFYQsusrBBywx+ejh1b0Sqta7nQGSyq
 ughKtZXXdWhUgJqSUFQqhLkhayadDcHi4l1QZXach6a6bsgALplKjW6xSBYCYC0/98tg
 gqzJn7ms/8C/NjCrYrB88yJpbNnMTPbOamOSeBkKC8uDp9BChhraToFPYLGKeFM3jic0
 wS9N+vs57uK8F9Ahf3liz/INWI3RKvejh8nNKCAJK7p25YpWtUn8lobTD21iMVc8nKKJ
 8Sijl1pW3DAiz5WJZT3GPnrAUUT24ftUyWzgIJVc7LXYcIdymJuDGIgi7EeI5KplQ7GY
 XZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Xve2DpNuJzB5MZhk2rmkr0AbxyM9O49g9VOgWGryps=;
 b=uQuHyo5q/S5oS3TPCNP8H9fqQgeR8yZZ3hVhCcTtNQfmix0tD9i4MPkuyBSO9ojauy
 +0XiI9ZFJiOE1/JvqWLBq+mi5KrmwXSofrjelD6yMx4FeecWqBkPTIRmbRpk35dhMlRv
 cIeN2XtSEYS0Oqp+zi532kF9fMuH9brcGI6w75r4PuYoJvuLKCQlHBD8Mh2tw/8p/qhw
 5zpIIpRjeCNLPKmhrh3uLcZ1AEaK6wilS3bJy4te66jKv3KAEyMiLTuSlBdFhOVArWpB
 yDuMVTZYBKy0RdcbQYnbEgc74SIQZzKjLmYfqnfRA89btKp+HoTd7sgRm/mbu3Zif+OO
 3v7g==
X-Gm-Message-State: AFqh2kqIqVrN6smqevwScF8tyESD1nHOTXPlJIvTQyXuJ9zL3ztjwm/4
 sMY5JH+zqo7I+LGq6kzJpkqE0JdfcYVGyGR4Rfa74A==
X-Received: by 2002:a62:61c4:0:b0:58b:e9af:948b with SMTP id
 v187-20020a6261c4000000b0058be9af948bmr1678065pfb.26.1674238996583; Fri, 20
 Jan 2023 10:23:16 -0800 (PST)
MIME-Version: 1.0
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-2-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230120155447.31702-2-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 18:23:05 +0000
Message-ID: <CAFEAcA-nXTerPhPPYWAiwMQK651xFOcttiPrbPp3Xgsiq668Dw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/char/pl011: refactor FIFO depth handling code
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: vMFSfWGTWN8q

On Fri, 20 Jan 2023 at 15:54, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> PL011 can be in either of 2 modes depending guest config: FIFO and
> single register. The last mode could be viewed as a 1-element-deep FIFO.
>
> Current code open-codes a bunch of depth-dependent logic. Refactor FIFO
> depth handling code to isolate calculating current FIFO depth.
>
> One functional (albeit guest-invisible) side-effect of this change is
> that previously we would always increment s->read_pos in UARTDR read
> handler even if FIFO was disabled, now we are limiting read_pos to not
> exceed FIFO depth (read_pos itself is reset to 0 if user disables FIFO).
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
