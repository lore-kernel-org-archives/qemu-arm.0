Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp284754lfd;
        Wed, 27 Jan 2021 13:54:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIJsCkZPDVrbijwZgwMuNaSzC0R6puuSYjFl/26v0cbEraxYWFQbtzKGYW86PIexiJDvmt
X-Received: by 2002:a25:7183:: with SMTP id m125mr13084454ybc.151.1611784486048;
        Wed, 27 Jan 2021 13:54:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611784486; cv=none;
        d=google.com; s=arc-20160816;
        b=G4+VAF28KyOKowhECwOMpQBMky9oOUnbSlfz6qtYzkq4Pch3rE3Jv/D2u2VE3lD2+I
         2P3+cWtxgq2HHQS/MU+aNsuwxJ3aOOlD7yd0UsBSslSfmNrCGPtn6jsWtORDb168dBZ3
         c1GC7OhAXBPYb+DCyp0dqXXEpW1oM/oQhJgvOhHrPn6jyoShv6n1ouNmu+J1APuQKXAC
         NUb7OShdR9Q5yzAsvqQy+J4GXKO+uetjIDxK5FMLc/p3MaTciFpHtI6YjfrAx1+gSaVX
         hDQSLCsRuw2sDxGG76ixKSlhcnNnd1MdYo+vdl/0GOVCSfZhKrrejdVedLeoGgqjGDrC
         O/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=On9OY9uCLuCBNzOxWP54fsp2GjDNAkYk/TSaplVUQNM=;
        b=NSMQf6ATK6lNNgoUaLEkxePTz82YXLhy7MqUcuxXcAguXaKZ9sC7Fh01zAoPT3I6EG
         gl8f6844ZbamtGifgElLx3p9zFt5Ok6Ek3pOTME+8nE0lkhx50qraErqoOJKxI3p6/Kp
         05BRG4v0Sal+rTa3quUyRPzX9+RfcLEzmWfUecwfjmXIZt7ApUjDrDEzKKQBveJlfN9/
         GdrG8p2NUPA+FuE1C9LIFjMr9IQYSss/YWPMI4rU8rl9XnZP6nXhBgVFwpE9piMFDmi+
         ro7SE5NSj/5TdASbKcIogSSBV+IW4lY852jNCq7QBd8fTcpK4PzwPtLdYf7ar2lhpBqb
         Rktg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jWa7QoHa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c131si3455882yba.383.2021.01.27.13.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jan 2021 13:54:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jWa7QoHa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4slx-00029A-D4
	for alex.bennee@linaro.org; Wed, 27 Jan 2021 16:54:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4slQ-00026e-2S; Wed, 27 Jan 2021 16:54:12 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4slO-0004OV-Ew; Wed, 27 Jan 2021 16:54:11 -0500
Received: by mail-wm1-x32d.google.com with SMTP id y187so2909960wmd.3;
 Wed, 27 Jan 2021 13:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=On9OY9uCLuCBNzOxWP54fsp2GjDNAkYk/TSaplVUQNM=;
 b=jWa7QoHa5yGk/gNnns4Ckx5YgfVsR3JMwWbtzoR3WC92wO3FDdQ1Z4qznHcO3wGEWm
 rHuU8C6Hmthe7hX6l3tcml+kyCE7GniMA+dCrU2JxnBBiy6lXVTbZr8iQ5TrlUJFMGvS
 0DilJl0cfzSUYe/fx3SYOf94SomnIWO73evv0NJWvqL1QTXYTB3GIMtyWxdyzWOv+Inb
 xIEEqh+HQBiLj2HTX8HWF8sV/DRZTV10kpRBPQsKX70GoiDc2gfSkDyAcvGGdydDdFhO
 92m1Pm+wfxAaXFJ5hD8rowF7ildPwg6E6JdKcyFmQTb7SLrmKpto30366JNZ8sq9L5qR
 bkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=On9OY9uCLuCBNzOxWP54fsp2GjDNAkYk/TSaplVUQNM=;
 b=izybi0XAoKPyetNwTxKKAPgMVBj0RLLwZKByvSP7YyrgKW/B9+SfOYIFgHQ4oytJey
 MBuE/sMcWgXiJBo8Az0/MY+lukiOPA2rA8HyoZlJi3TSh2GNa4gCGkO81PrxVJpRNYy6
 weDU4facUOS+UoaEvlLxRWO6KCvweMpXwRSvHzP8mqojC1x4NmnohMHbHi2d15UhZbMc
 zkgdA5PNZDhr0TVNOpEhipELSDssqw30QLQ0/Fg8AvLisn49R/oVXDYO6oH+VEgDHHMp
 VcLEVbiKohRArGTo13toKliedU7GiCrENVFcY0mv7gMQODgYCWx67E3zpr5YQsT7hPcq
 tFAQ==
X-Gm-Message-State: AOAM532BJh5kz6D8VFr/DfiYvNcVwme9VvhD64Vdw5Ku4f/I6CO8Ayda
 S2p2jyZDg1TtFRuYVQIKztk=
X-Received: by 2002:a1c:df04:: with SMTP id w4mr5685493wmg.66.1611784448710;
 Wed, 27 Jan 2021 13:54:08 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z4sm4482159wrw.38.2021.01.27.13.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 13:54:07 -0800 (PST)
Subject: Re: [PATCH 04/25] tests: Add a simple test of the CMSDK APB watchdog
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <df467f73-ba69-dd1e-6c79-830fe209e8ee@amsat.org>
Date: Wed, 27 Jan 2021 22:54:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 89ia820JeHtl

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Add a simple test of the CMSDK watchdog, since we're about to do some
> refactoring of how it is clocked.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/cmsdk-apb-watchdog-test.c | 80 +++++++++++++++++++++++++++
>  MAINTAINERS                           |  1 +
>  tests/qtest/meson.build               |  1 +
>  3 files changed, 82 insertions(+)
>  create mode 100644 tests/qtest/cmsdk-apb-watchdog-test.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
