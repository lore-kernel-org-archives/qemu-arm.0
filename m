Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3172125lft;
        Mon, 4 Jul 2022 05:05:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ukHQDWbHfzstc8mnB6+L9Ls7sz8EhkbMODUUtI+ZlHl/ZK6FHrjVra/X++fevl4maT1OB0
X-Received: by 2002:a05:6000:1705:b0:21b:bcff:39d3 with SMTP id n5-20020a056000170500b0021bbcff39d3mr26598516wrc.502.1656936319631;
        Mon, 04 Jul 2022 05:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656936319; cv=none;
        d=google.com; s=arc-20160816;
        b=eIaJFnoFHxybbwM7Vw7d+Qdg9d+zgc0P4spAXnqMr37I+toMuADWwCAcIGw1/s50He
         eFJOiAsztAEcZytUFoIQkhWEkj++dWQBL0MXJNiR+tdd6Y7dilnjijdPddLanvd9cu0E
         2UZ5aPwEqSfdzHfGkkq1Scj9ltwjPyWc66vvIuVOjyRiC9LIhq5880nLPwilbqYh+oqy
         xW317WjZy40QBSxxb/PTI6xmYvggUlrQCAMi/eE6UxNPRLem+wSeyhp66FnrDH5HswIW
         5HIN684/V2lqTAItxCIefC6sD+3FUyKEQi4qNnyYw78FbTs7R6CgI4cDPm5sWWM5JDLb
         mxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Oq1l2TBd1ahUWNgNlTAYbuFudOaQWGD2u5s/xpe13h0=;
        b=TQAYe2GL2aqsEcgFRkfqxhmf8gI3m8IUQ0nf3PqnjBJH69QiLXsuS17gj84KuYGYie
         xfgpaza4T1bd9PkYDsWlMIlYLm4+zPkirzDU21jjW+p3uB95DXQcBBR6fTz/4PnfT7BT
         xg2SvvjLT3jmpeElcekukuedntYllPteUYGvtvhE+42iLOar6xOgtT4o7rvlNMExPD5f
         wkjvU+pUgzZdBcOC0D71Yzh1qIwaujvj1jVicu440e9skUj+vJM0cPpdXqw70l/5Khc4
         tMq1E6PuaeLvf6V4zSpxgwNB9zcqFcnt26QNfSW9p3mfP1kxNoMbZm8hpk//Dj86F72a
         daug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hf0dZCoE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j37-20020a05600c1c2500b003a04514c08asi16657003wms.126.2022.07.04.05.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 05:05:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hf0dZCoE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8KpI-000416-8i
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 08:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8KoU-000409-DS
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 08:04:26 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:34655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8KoS-0005Yl-V4
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 08:04:26 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31c86fe1dddso32367077b3.1
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oq1l2TBd1ahUWNgNlTAYbuFudOaQWGD2u5s/xpe13h0=;
 b=hf0dZCoEfzqLCaB+yCUYfaIznfOqogI/4TSN18usjKFienTFEtoMzROOLi4TNIDoVN
 e1yaUFcJaghhYekj2Y/1hxDQtTXHKEo5hjC4oNdd6XLD3O/lyJbFIb4y2tvgiogZqit7
 5r9dJqtasC+TQbgq1Mxw96KbGsBnMDFEDFNse5kML9SXE+UHwxTARQO6CyPBg5qpX85d
 OgLS4+pFTDEGxGszpoAJHVAP7+hcZLeM0TFqlqwM3sp3g4UBLzapWr14YXixIKTiVJbA
 FdQpZLO1J3Uk5rzqhJCUSw1I0YiwsNQpl4Zs3dl7ZY1Pgp+N9+ZItyBt7bmKW9aG3RsX
 DLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oq1l2TBd1ahUWNgNlTAYbuFudOaQWGD2u5s/xpe13h0=;
 b=ftCp2IkUPHnVOuh/NH7ik6uJVW2aYO200Me+3M6XJOfWaD6QFEntE4ZjU/SS7JwkIi
 Nz5ieuoGDdvmrYZ6T5UElECV5jJaRYhgioXXYdv7H1RtcjJAEZbYwUkg5uI05yeN7jXF
 gDOk9lGsTN8UvXpuk9ynKyN/Rgy1i503zsZxwWjGp2AI92AD7zo87LCJDGrwBxeAC+gE
 +2uX40KLuOS5i2XaHcY/IBTlbulb7XXW3Z+jDEjwNJXumOTIsGj2Zol8YMzqL8fszuWv
 x0zT7hGYC6fC8fNIcPzrd+86hevdzJNI86aZeDhK+ikEQDnQprLuXvrU960lI+m0j0oP
 82ZA==
X-Gm-Message-State: AJIora8dyrQtSn2QGzhf5XCoo8p22O4jXGbCZAO3slhZNhie1f7DKzR4
 sqBxJFJxjvpxFzXPF8nqTWzL7W/ACmdSVkC1tjekp0b1itc=
X-Received: by 2002:a0d:ca4b:0:b0:31b:7e6a:b77a with SMTP id
 m72-20020a0dca4b000000b0031b7e6ab77amr33701982ywd.347.1656936263606; Mon, 04
 Jul 2022 05:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-37-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 13:04:12 +0100
Message-ID: <CAFEAcA8V_7StzCvOhXR1a0RYk_Va-RVy1Goa0uz9wTfhHor+7Q@mail.gmail.com>
Subject: Re: [PATCH v4 36/45] linux-user/aarch64: Tidy target_restore_sigframe
 error return
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VqQ25rBQqiKL

On Tue, 28 Jun 2022 at 05:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fold the return value setting into the goto, so each
> point of failure need not do both.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/signal.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
