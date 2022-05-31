Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3419389lfh;
        Tue, 31 May 2022 05:33:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFhZjhGhnqgL1YUyKyJ28BGSleHJAA2mwIgSFwTygj7fsPkr1xjAS/SJ9X/miIZ2d1UQ83
X-Received: by 2002:ac8:5804:0:b0:2ff:3c7d:2bec with SMTP id g4-20020ac85804000000b002ff3c7d2becmr12989054qtg.331.1654000383581;
        Tue, 31 May 2022 05:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654000383; cv=none;
        d=google.com; s=arc-20160816;
        b=MBbAeDtQs7cV5MrTudZfMpmj1tik5XKwJixqR71zQNEnYQqrlI5xRw258I55CPphdL
         xGxyieKUtAq/VrcVBr+BaJfQSiKeQLbEcFyci4Raufz/f697WHLUEctmBg1VKsK0o3s3
         A4FIF9M1kRfyRMmR5y5nXgrY0bm8T6TEunHnj2wllFGEQG6oKYqxwyE62VKbgqI2NK1V
         BdCVsFwDp7pbGOp/TcQOEDPly0lJ3wWDPgj8NTU8je2+IqFTrr2vKB9ZJSihcPSzx/R3
         V3KnRLZzGKg3GTnebzxZcjziZVslUS+tfhTBCqToqsrOYwCtiEfC7lPywmnn6yTcENyE
         eIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DbEotShQH759sIS1+Kugk7+T12Ig+cPtcxO+jsNSK4s=;
        b=u72yBS08FwBMHfQsEZncSDOKNcUeizxqQX57vAyQG45lT6nmIwaQqKh+t4j2Xc7ynJ
         tx83BCjSYKkXmvfifyPIBl1JtRFi8wSmZzEcmjok1KIt9R0K8nXYEhraBdPz0mIiztbj
         MsnvN+FeFs/P2vN1yH36/x0hfwvUx21QP7+ZsNDwVc8cmt1ZZ/4BhQ6KK6YWCyEeUChd
         YX+i54zA84Q0de7iH+ZHWF5G4NfdzGqd0m1fQ/AaRpTG2cE16mGCZNeMqY3rxkAu+Z0P
         m4X/krGSRE/eb/ngB6iMiWxOtaGEg1koFlUwFSq8IQQjqbp3XFcOz8M3JX/bZDjUTsPU
         kq0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jQA1NyC3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11-20020a05620a414b00b006a573fda3c1si10557531qko.679.2022.05.31.05.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:33:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jQA1NyC3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw13V-0001kp-5v
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0vX-0005CV-8g
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:24:48 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:39591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0vV-0005Pj-O5
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:24:46 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2f83983782fso137291167b3.6
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DbEotShQH759sIS1+Kugk7+T12Ig+cPtcxO+jsNSK4s=;
 b=jQA1NyC3WxsGeQoZKU9iVJOr1XM0INrbouxueVaj5edvZ4l7MkYFn6moBiIceV151v
 dREzV1TuYdqMYTYCamL9XQN2z/mJLfAvwcsLVOTu8MDqvSTWpjP7EmtzAICGj9c7u/fy
 gWbLJ1WgVXjrPXfF4NAi8i/61hK18nZOuTh/tXGdRtQvzYR7JNByTEuje3uveqWRTccl
 f/PKf+I6lygHcsHMTcDNsYE94Fq7GgvrN0FUA/6GhMR1Z89ElnrDtHf1fIu6/24uOiSn
 +Q97yLvYyX6WEP23P5ZdIW9+XndqJk9yNyKgTShHsveKOMhpk2AA7VuJuOqTPDMy4rhB
 PUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DbEotShQH759sIS1+Kugk7+T12Ig+cPtcxO+jsNSK4s=;
 b=SxyUQgkoCdFcWl5r9Gahap2W/kZQHTkvHH1Y0s2bYR/IIQa5aklD1Us/f96mLdDB2V
 I5KaHmqQpr2kjv69j6ELnSSrtGfE5AZbuPKtF9tsniSVQiK/TiVnf0Bsv1Ygj4umhr4l
 +OZ0U6iEDDZC48OLr6aU/jBzqkBFe4hkJnDCyHcoPq6JD62FC/NQFtlREIQ/OaKPNe4J
 vHE++RJX+0OzjLr1bkKvsK1Np/+djtgiSssCufxIWYeoB0WsC1dqa6uQHD9u+twm2svd
 1rRDaO/mIw0gGqyQ7hKYKEjpyY+c9XYUNpwn19CB+fjvOklB6iu1mBbW7jwP/D+ISc1Y
 r/Ew==
X-Gm-Message-State: AOAM533u3bpTIbuNBGC1KNKyhIML8Xnva9lGssWwkWanVLNLsxBxE5DT
 bfB1iVbkWmvHlglvuf6hPswpPx3bhXOFwvdM/V7cJQ==
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr19738323ywd.469.1653999884827; Tue, 31
 May 2022 05:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-9-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:24:34 +0100
Message-ID: <CAFEAcA9qKJQO1sPwC3n9gYvNjuQST0X0wmQGHqmhassdOcY-5g@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] target/arm: Add el_is_in_host
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zXZfjlFbFoKd

On Fri, 27 May 2022 at 19:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This (newish) ARM pseudocode function is easier to work with
> than open-coded tests for HCR_E2H etc.  Use of the function
> will be staged into the code base in parts.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
