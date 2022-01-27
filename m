Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4317248lfk;
        Thu, 27 Jan 2022 11:18:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzq8oWWSy/nFeqfQNgzzjXiZdgbtWFVwWnnBXW4JRyB7LPJvNtQa6b6zL6YhiWG5K1c9IEM
X-Received: by 2002:a05:6e02:1e08:: with SMTP id g8mr3623716ila.278.1643311115897;
        Thu, 27 Jan 2022 11:18:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643311115; cv=none;
        d=google.com; s=arc-20160816;
        b=hA5KCUK0r0aHq9xzX+GiB5tvQ76802BvPVmxf4acDQ8xvoPV0Sbd8X9WWFns1pumAG
         ak3H+2CTBM5VBf6bZCVVclD4EOuRba1JshdIAXb/c5/il7EyJjCLUjZg7iA4+l9mbSp7
         nh5wfahB3WN+Gb3+LtAwJUHXzgANjuLm6uuq7m/T39JKc4qLLpD3Q5RmzjVaZTR9FR3H
         MV821O5iUE1tiL9QNDluxBt95Sxa2lSvYvTAFRrS4UfVLahlLDLtEn7kttuCI2+TT1hx
         sKNwGu5Yw/BPUsU81gNGTDYxT5680V5WYtfBb1cmrsayVt4zHXe3nZM6THo0agPD500Q
         yU8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9roIYjWvKNu6PLReU93w+dbnd7dQrlzsqensesQLNkc=;
        b=ICC3zg81Bs4W+RuN+U0SXDXCKIfxNKZ7oCNjhkbWwC7ObtHea9DVI1YEsbYqzzjfiw
         +sMop8YMsqTgezx3d4gR07FCoql1YMJgmsBQeTnRoD8zF/rrXl5ZGAPVeBrNNdmPwGNr
         TgtnkIxrrlmAPo+0EfuzS3onoVel112dkxoR4Nw/DdOLqmIdvUDXB5woSUAXJPDIb6+k
         ZBEYOquArte9kcfXTXkXiFbrVypIBpMbb1LuQ029vvHS40zwFENsGabA10cD18AiWSqh
         IEhksBDJoCehinPMkFYvwCKPhzl1pSnkbPR3YjoCDvw4M9fv+AMogD1m/0756T0xUY0Z
         2aEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cHHQgwlz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si2772395ilv.114.2022.01.27.11.18.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 11:18:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cHHQgwlz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDAHz-00064q-90
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 14:18:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDA2W-0007C8-Sn
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:02:37 -0500
Received: from [2a00:1450:4864:20::42a] (port=41824
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDA2S-0005GV-TC
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:02:35 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h21so6478439wrb.8
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 11:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9roIYjWvKNu6PLReU93w+dbnd7dQrlzsqensesQLNkc=;
 b=cHHQgwlzD6rmy8BcBKAMxZPPNcpm/87Kpr5evGqVC87+aqaYc98ESVZ44ItLTeYBA8
 IBcinVSK/3hXYE9zr1b7lw4dKW0PnrgD2dpYdupEu7t+GDZ7vNd1Y51SyQcuLjS9B567
 KEUUkECHcZkNJmA8Hdis5v/elUwzqV7SIkUisCks/KOtlINGDMcs9KAbOWEqsU4kPEhs
 3/JNJhmNghgMn5uv18P3W+LT0QNYSdoArSEcIrvCjVuYW36ay7Qdw7e8B29oa53mCaB1
 gNCXKDjTZLAgehY2/lPis020evxnns/uSrUV8840yWYxRsPNp66MeQDVdFEdTXOuzxKe
 IyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9roIYjWvKNu6PLReU93w+dbnd7dQrlzsqensesQLNkc=;
 b=NG9a589afCtkN3xpnIp6NJrF+5eDFFRTOc8A9o3Ebv8C1Lh0DJKfu7XJKRdQs5e6k7
 NPkVFthv5+O/yJZNxlZYwLzr5M5iT1uGDIYHwIM6H3AgNwKXUkMFd/2jer5xU0VGmdJl
 9OiJ6QBVMSydffARb2xAK/rm7tstt2F5yk4SXE6vaLEKlNzvDU2+NjSqxYjDaUrB/3ty
 yMk1b+urx9O8dmESyxCXI8MbUHzoQJLBEqj5FMR7MUQ/Q9wW5TRXKggH66dPSmSHwRWf
 Xq8DvX0o4SHdjTpGEgHmC35ym87GuCvsjafL0wJ/KDUcfbmMU9tmkH6Zrn39wcXdo+la
 g/GQ==
X-Gm-Message-State: AOAM531raHvPvL8RjDpwbYdQ8WcdBddecOS7lsjR6ovfUr3MtSQAyyMm
 yV5KPfyl9ctmr0gZ/dz5lhTTA16lLwZtjQ7xp03zmA==
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr4347582wrz.2.1643310148761; 
 Thu, 27 Jan 2022 11:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20220112002515.3991540-1-titusr@google.com>
 <20220112002515.3991540-2-titusr@google.com>
In-Reply-To: <20220112002515.3991540-2-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 19:02:17 +0000
Message-ID: <CAFEAcA_kup2t2BKkE+EnSG1sMA6ttP0HhaQJOTzCr2tEYLLFHw@mail.gmail.com>
Subject: Re: [PATCH 2/3] tests/qtest: add tests for MAX31790 fan controller
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IzlQnmaO8hyT

On Wed, 12 Jan 2022 at 00:25, Titus Rwantare <titusr@google.com> wrote:
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>  tests/qtest/max31790_fan_ctrl-test.c | 171 +++++++++++++++++++++++++++
>  tests/qtest/meson.build              |   1 +
>  2 files changed, 172 insertions(+)
>  create mode 100644 tests/qtest/max31790_fan_ctrl-test.c

Tests look OK to me, so
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Is it worth adding a test of the address auto-increment logic,
given that the 'increases modulo 8' behaviour is not completely
trivial ?

thanks
-- PMM
