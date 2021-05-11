Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4133164lfg;
        Tue, 11 May 2021 09:12:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+/KCcqUNIMMXfQRVdVNcJ6A0svqJovKFX8A6fd/gX0GFsTwYog1N1Ga+RWNk1Apdawgd1
X-Received: by 2002:a5d:8e08:: with SMTP id e8mr23064314iod.47.1620749554384;
        Tue, 11 May 2021 09:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620749554; cv=none;
        d=google.com; s=arc-20160816;
        b=JeaTCbjhkIQjQNkNo/DxoIU6JpLOeRMN7E+cbiavIXKFjhxIJ1zuyVrSepSOvsDeU3
         L++pzvpRetGmJgM84BWG9FZisu0Q/DXV3Y4Gp3SL/Vprz666utp4+Z9TMiFWVaYQJ9kP
         xESe2y4HBADHl/Rzb2FDBb73Xjgex4K8vzjZp1G6hxX9qjThFeMzaCXkTaW2C2es+ne6
         jOm172KZofzlgcouGtFlAnqey6hOTaiTFRR8+OoQWAQIOSkaZKl0uiIZW6+evQwnWmJa
         eYkDb0K3Ep0znBUjL3bXit1pjhdQ+Q65noj3xtVeB6OTdDvB/KCS3rrBvmjH60FMYBgg
         dLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rBd8pWnujX/pB//lsTpgXM/L66E4SVSg7yG5FDkVxMo=;
        b=fMYbm6jEOhft837MHCzATVVhzbnR4DzdMr0BjdJJX4WJXO6EdKjeuA5e3RyAtGeMt2
         6ewCBYFSihmJZzo1Z6VLA9uIftnrlVGPt5FPiDjhOe9NFHiZ1r72amlLugwbjQThY83N
         DPxaYtJuyIopoRyNU8SsR7YwHyyLu6m+4Lzn7mJMRrufkwj2VON5FZv8pazvn6OQWSj2
         IdVw6mX1suoHPDoLkY6P9BIThT2nozGy7+xplL5GIrijLJy6T7xGHkJqQMKaadCSSkgd
         04uklSna+xCJ3gAL+vk9KSOTdrj7xBbr8aEzGWngXAm6RxtVGJTVJLmDq3r4YHnogK0+
         3zYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CQaoIRDU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7si20820057ilg.78.2021.05.11.09.12.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 09:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CQaoIRDU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgUzp-0005uf-LZ
	for alex.bennee@linaro.org; Tue, 11 May 2021 12:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUwp-0002Nj-7c
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:09:27 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:42792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUwj-0007xs-2W
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:09:27 -0400
Received: by mail-ej1-x636.google.com with SMTP id s20so25065531ejr.9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 09:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rBd8pWnujX/pB//lsTpgXM/L66E4SVSg7yG5FDkVxMo=;
 b=CQaoIRDU7/A8bM2QRPeXCtMvnB3XdtMf5TOk52eilT1CGh3svM8NAK1fK+0VCxWRoW
 EDfR30s5/Zty9iJdxgxQWHIs15tUPycR3VrG5Y6/CeXZun0zS6bCcueDZPh6eUPIu3WB
 Jm4ZlA9EZmT2jq0Ermm97BZlwNqIkREnSwVxejQ9DzLzTQozWwn1BCmtcU93KCBEj/4h
 5KAP5TGrkcGwDcon2De7xZzx74AIqhT5WvFiCiTWaY5IWxOPSyXE/ep3mjjsE0AJBNgj
 xSqkofjiFOZGO3/qQ+fgmKQQ+iM7ZrdboGsT102ZGTYnoYx5SfTb+79DomjSMZJgt3uD
 xPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rBd8pWnujX/pB//lsTpgXM/L66E4SVSg7yG5FDkVxMo=;
 b=iCZjT542/abU7fisNSw8Ao/q/adRJLYTqv/cjXKTkjma9wvf2qtxYEGizDjJJp25fu
 kGEHnvVt1MTEsMkkkJo48Hukw2Nm/SsY42GW7HKSWoI6XXNHXmbZ1BESrymPaL6gEnIu
 X7dKrEeSWvV8kQCMnyeOn+dWHAiR72arnZcyqZva7DMQuFsm0yg385Vah7A110A9RjNi
 hb472F2TMIx+I5WvcJIOVP64M5enVV+MdoHl4va/yhrmAECKxIC7CCy5DkQJUrSRtMp+
 Cjzhu2PHLDSgiOTEXcrhn2TbjtKR8jQS5IotVDGhd+LXQeyUIBD7KcfNqGnqL/5hhTIv
 arSw==
X-Gm-Message-State: AOAM533wO0ID1SDq3LZXQTJjniIi4wZd9tSaCespMKuR93REOHKjWnrh
 kQoC9u6nYyPVsyw5CEkga0smxxqPvQUxO+rTLBVwwA==
X-Received: by 2002:a17:906:254c:: with SMTP id
 j12mr2272870ejb.4.1620749359491; 
 Tue, 11 May 2021 09:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-25-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 17:08:06 +0100
Message-ID: <CAFEAcA9CsQig1xPjQ8frdJExHn=oGD_tHYYVhKY5wMYbVurs6g@mail.gmail.com>
Subject: Re: [PATCH v6 24/82] target/arm: Implement SVE2 saturating extract
 narrow
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JaXz6PDuRgdS

On Fri, 30 Apr 2021 at 21:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  24 ++++
>  target/arm/sve.decode      |  12 ++
>  target/arm/sve_helper.c    |  56 +++++++++
>  target/arm/translate-sve.c | 238 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 330 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
