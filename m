Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1410458ejc;
        Fri, 3 Mar 2023 10:49:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8nV+CXAoGh5waN3PP7nGkYcGUagNMpqPn810vfN20RYYl3qR7L/1cK47w2pOU7m8/22Bgg
X-Received: by 2002:a05:6214:529a:b0:579:5dbc:ab6e with SMTP id kj26-20020a056214529a00b005795dbcab6emr5111970qvb.3.1677869376728;
        Fri, 03 Mar 2023 10:49:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869376; cv=none;
        d=google.com; s=arc-20160816;
        b=Utr2FtEIaBQ/8WD2K7gZF+NUoUZKROaZlaUMEdeccflkaW4mAAsZYOsbbPmytseS6t
         zp345++oEPldFkjmpph6S9RYVzmwSuUXSGCu4pVuLJBqW+O2OeMb8XrNRQrlPUPV74sj
         8BxvoCyLdJtVJhGdV9TfpJumxVT+/GZWEsdV+hwRn51/9Qa0OngxhrUI3eFwTQf9r1FU
         11duAJ2D04G2wGo9mMc2ipL9ZdCvl3OYcwWFpsu6fr2YG9jK/mWgwWjv1Y3FWvW+qwRH
         1d0ra2/Fbs/pXz+ZSsrI0Hjo6KBdR4yNqVZLFsiQI2d3yuDQwXNjSYrEN5NBODSC0rg+
         lhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nvLWmEt8n5IuIq8qHZwv+q7Me70MwUbcggNL+tWa8Dc=;
        b=wtiIAgp8A/7OIA7SQi78XZSavKRRhTp7KcBjdeFIDlUFNIf5O0hcrp/5kreWlVqGIP
         2T1++D9EN6rQ5dXcfERHuZBXmZIUq6WwoXIBOnC6cLGB9Q+lDO+/9NAHXmHZFOgxhiCs
         iQzNJWX31Sn+enXHeC6pJTW+/c6S4XJbSPB4tuy/xmQd4N0gf40oV1UPxI4pnzsFP5WK
         qmE1Pd+kybL+7fxam5CqRTvz1nOu+kNT/slvzvOjTnafOfVUPY85DjfkUVyfoAlK4qqn
         Ty7B3btEucxa3btyH9J+gCuLCDiiP1PEXAqGfmEh1OnnMDVaGzAqW3EwQrzhRNGav4tZ
         0ylA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CvTRF7qY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7-20020a0cf507000000b0056ea2afce68si2031493qvm.255.2023.03.03.10.49.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:49:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CvTRF7qY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYASw-0008Cb-1P; Fri, 03 Mar 2023 13:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYASl-0008AY-Er
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:49:09 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYASi-0001sO-Ht
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:49:03 -0500
Received: by mail-pl1-x635.google.com with SMTP id h8so3679441plf.10
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869339;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nvLWmEt8n5IuIq8qHZwv+q7Me70MwUbcggNL+tWa8Dc=;
 b=CvTRF7qYi4xCkjNg9T7ngDUfGJeErs4pUFOqtUMAzM7DedElFTGCgQTtu5giFFKbkT
 Xini6ii6s4wgMW/MfYaL4+edLKJpGJS9r2Zkl+xjlcCOHPsO6BRccF97Wq3ANGMtY/jV
 Z/hv70hhwYY32ajxt+Ofmee0fLL5thCv90OREOX+cQJBrx9tjKkj9DcS8S1seuqXE4MW
 HEny49/NROj+zd30wq/EVx7Pzy4GCnYRz0G7hbLRljboN7pHYiBX4rCFcWlX4HOVPIti
 +loZ3j/KWA55UqCJLTJ20V8ZdvjPzjg4JJAkI1qaK946DDnboChbfoz3dQtQfu8y3+pq
 uOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869339;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nvLWmEt8n5IuIq8qHZwv+q7Me70MwUbcggNL+tWa8Dc=;
 b=kCyIrFEMQXJ2KyVeBU7kLfpDc8AhcLE3mlijFNpJfj9cM3wo7QS6KDDSAi8HHU6taQ
 jffEL+DGhQ0PJe6gcoTEav9a3ZjefyjxMNNQme4HFvwh03JALQLevAXZXrAk0UG8GrNP
 5nB8XpUs64CE6d1d8HQGWooYHQSVlV4clRnnjkvKCdypxsWG7vJ5FoA9vmfxccj1SQH/
 bKggt7EsLRHTftxWgrAS9qsqvFuWerX5wWt+8izsI2jqouegPEDfQSQs292d6LcQBQbc
 2OLeXwlLEEe06WM7mpqQ7JfiRlew53RNTvUO0K4zPBO+MP2AKwfhel5UXCmt8i/vrisO
 3m1g==
X-Gm-Message-State: AO0yUKX62YRFQC2QUHXyH40px1MBLfugXs3bYTDbit+U3k3P5aLNCF5O
 +zMURsI+2OycxPqn7t+DCJ6cDDrUTE3L/EaLUmQFgQ==
X-Received: by 2002:a17:90a:348d:b0:234:a62e:bc10 with SMTP id
 p13-20020a17090a348d00b00234a62ebc10mr1009221pjb.0.1677869339011; Fri, 03 Mar
 2023 10:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-24-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:48:47 +0000
Message-ID: <CAFEAcA8HR6uc8qptqfoQZDBCyLJ45rL-J5290HSQLuKFd-7-Yw@mail.gmail.com>
Subject: Re: [PATCH v2 23/76] target/cris: Drop addr from dec10_ind_move_m_pr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OsQ6Ayzm+LB6

On Mon, 27 Feb 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This variable is not used, only allocated and freed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
