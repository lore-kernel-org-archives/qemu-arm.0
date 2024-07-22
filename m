Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1875591njc;
        Mon, 22 Jul 2024 05:16:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXw85tpgaCUZ4cMcOyQgeRdx7TgnILbJB9tr5M3zWDEszrH8aSd1Q8/V5Le3yLIybfwsp6sOZRgzkL2fZqGa3w4oNT+3M2b
X-Google-Smtp-Source: AGHT+IGty50H7IGjCbRy1AC049ZQn3gdzrZVxJ9iInXIsNXHQMEXKYAQwgPE/5qjvVUPQvcASjve
X-Received: by 2002:a05:6214:27c8:b0:6b2:b557:c551 with SMTP id 6a1803df08f44-6b961182da4mr98214866d6.27.1721650590180;
        Mon, 22 Jul 2024 05:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721650590; cv=none;
        d=google.com; s=arc-20160816;
        b=ReWcZ4ALGb54dvv3vHuAOp3WTO532u/rbO6cWCGUM99Ax8Jfyj9Od4n4wlwYdWqVci
         nP4iMFL6PTq1SLuOqibLDVTkpaeEKFNF21XTJmJEi/2isH42M2uSwwncWPWU8WMWV+0J
         IHn4UHrhg2YPl57sDN93DmFQbeP8KLBvJMAJrrJgiTqE2jAiOMhqA5ikYpGT+0hwZVGj
         1sqjnpdre4qWPUASF6j7eEjJqAskZp9ppqeeT8xRSuZzInEAl+7uqk3pW0JXkcDH+W9c
         9s0jqAdAZ5KJm4O6HIAhUV6dkxqTDPkNfG3+YttxHOZuVn212nrI+8lpDO0Lowa0CcgH
         tXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TqlB7XkmOv2gcWdklQRtGqt6OgLVM+VAhGIbvGdK15Q=;
        fh=K16Y8hj+Gue7QRMyQPJDFiiSIS+5q6sWweOkwbYLcB4=;
        b=0/yFpFVxkB95zyxxnDT2774J9e42MVxqsRKiEwiuTFRPx4RRJVvabGofdlIN3BqEX8
         LdHxDBTYIcZ/xq/7D89hYjhRNX8972G+SXRx/An5D56gtAqovjVhe/HITcBf4NjZRSCJ
         8X5x2uFOaQejzeTsNj/+Vi07UGoF11l1Z1N9VEf1+tQOSz2jxYVzMHt2wNB/uSz37ZS3
         T7mkdYc1EoDKQdq+Df8HAeKYN/JN8aVcYJelee1bby1LCuFtVRUxRWyiF+d1+WRn74Xq
         Mm/LDW3OH2aNyley/ezMi1PH1VSEM+FM4hv6MekGtaNoVCWcyjpnnzMWWz8wnX4Xxub/
         hd+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gDaQ5k8t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7acb2464dsi76967546d6.589.2024.07.22.05.16.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 05:16:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gDaQ5k8t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVrxj-0001sQ-M8; Mon, 22 Jul 2024 08:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVrxM-0000Rz-MA
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 08:15:59 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVrxJ-0001eV-9F
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 08:15:55 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52f01ec08d6so1474920e87.2
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 05:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721650551; x=1722255351; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TqlB7XkmOv2gcWdklQRtGqt6OgLVM+VAhGIbvGdK15Q=;
 b=gDaQ5k8tXaQmYOi5OpGPtxsdDIDrIrw04v0HvwNKQT1mrtTIUA9y4m+3OwPlOprTvI
 hY7bnLWZFgVqSqEsw21X1ByZkbEN7fZeEnixHniyO2MesQX2GeOlqBczfdpub8SshQNQ
 3L6hJskUx8Gc2yYKUiJ0fQQw/FtWsPKwK3vaCXdPsY6It+GhiYycFizJARgWVrzBku9R
 8395U8WOSYktGa7oJcC+Y3C/kvCsbw7WmnoBT8qbmRjCe6wbqDa+DPENmJnh6y2dySkq
 SibAdgjwrCQvZPx5o1o1nlxyHOD746lVl+lGT5FYW3fOrGbNKtL4s9sCveZq7jpNdCuf
 Iu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721650551; x=1722255351;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TqlB7XkmOv2gcWdklQRtGqt6OgLVM+VAhGIbvGdK15Q=;
 b=JKeFbgCRtdUrrBTzoTsRo/MleWY/gBtO0I6WzXrXYc6bSXmboRvyQZy373mP24jie4
 uklTCgr+G+8MjWQ/muSjN2flAvSszf6fJazcAu+XkFMo8CRXPEbNcI7/XtHh01jn17aX
 S/WPqilQG4X4BcYhiwBT7+Y85X52NewmrwJXkzJlltHYE3TxclGYR8DOWDCqq7yM3OFs
 oFtXsUyVNEYQGNmkjDVPyGBxsPQBdOHlKfAruwRtinP9W04Hrwt2j8ao9jhtOZ0Wx+WC
 NvP8o30n4pRj/osq9CTs31Fv7ttH5KPOteSufQ7t1jnv6ktFq05Firqs13FT8mM67nv1
 Ybtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn1he8QaL3+ftgW5CzXv8qHOhvDUaI7RiUdQbkA3qPUMLxJ8PLRq2hxNzKvS69MIFqaWTZQRyNA/+TSI2UfE4sPCj1
X-Gm-Message-State: AOJu0YwIAk+FLmno1WxpblrIWkVl1je6IL/MLxsecIHwS4XVkwX1dr+4
 dAuTttEQls8Pr4RhXTGtNrwfld9Yj+Tvo0lN1I5rOmk/wM835rOx7HX8nksyeAMwrBwpkjzXS6o
 ad8w70WUCINawIY5QKYMrGjY0o5Ga9xdqiUGKhw==
X-Received: by 2002:a05:651c:549:b0:2ef:32fb:6c4c with SMTP id
 38308e7fff4ca-2ef32fb6e8amr14789411fa.45.1721650550970; Mon, 22 Jul 2024
 05:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
 <20240719010707.1319675-12-richard.henderson@linaro.org>
In-Reply-To: <20240719010707.1319675-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jul 2024 13:15:40 +0100
Message-ID: <CAFEAcA895VodF0Ejfuy5aA44cL7UvmoaWU0WiGrngk7gyU5mHQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] target/s390x: Use set/clear_helper_retaddr in
 mem_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12b.google.com
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
X-TUID: xUyCuQ7qWIDi

On Fri, 19 Jul 2024 at 02:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Avoid a race condition with munmap in another thread.
> For access_memset and access_memmove, manage the value
> within the helper.  For uses of access_{get,set}_byte,
> manage the value across the for loops.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/mem_helper.c | 43 ++++++++++++++++++++++++++++++-----
>  1 file changed, 37 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
