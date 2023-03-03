Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1343880ejc;
        Fri, 3 Mar 2023 09:31:27 -0800 (PST)
X-Google-Smtp-Source: AK7set/+RWvrTiSVGpKFWIDJgtWtuzSOPBzJs4rWm9QYCYHdOKyaPUxiZcbG/9xx4VVL0qggGeZ6
X-Received: by 2002:a7b:cbd5:0:b0:3df:f7f1:4faf with SMTP id n21-20020a7bcbd5000000b003dff7f14fafmr2183633wmi.34.1677864687222;
        Fri, 03 Mar 2023 09:31:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677864687; cv=none;
        d=google.com; s=arc-20160816;
        b=Fy9NCqEQbxiM+hWE4qVErHA4qg7XT6eFVnMc3zIZdsHQd2oAUwUvtTwCwxdJ3+Gt0O
         wmskfaJQ2ibX5H3CoxlPawASNWfEuR9lloplxwE2hi5X1iHz8WPlr+tMRwW11rAq6jgC
         DZzMA3w/Aq0tCmqeXWdIV+8AaJ5Me9GphMcvaM95P8OJo8ejLbpABmRbDycbESZuHu2K
         rCgUTwg//t+xb/H6U08drUbipso9Ab3qyDdyTDCXlUhaIRKmvQdl8A2hPSnuoeYezgkv
         0N1RWSOxRHIExYkk4srx1/J4eq4PDedxglYg5fHYV7As7UFeh+GzlKa1X3pG8XAXOlIa
         EW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8LO3H0xihPu/J7zCAeMi7XJn5vVG/43m/HalvuEQr3o=;
        b=cIpdRxMHTCWJKFt2CLGIpZwPkoeFj4SP6kHDHJlTWJx8TOuh/B61Og3N3wQqt3MuGL
         IOCttOxNh9Q0OzwhJro0I4ID1tbZutYGvdEP55k2vD9uhuufrbbN30VVADPGyb+5Am/h
         n2tY+2mRnj9mrG8F+ahfhlKw2R1+DGFqhrVCqMoBVmJoNs1shY4bLzk8ztccg2TOSz5v
         LkyD02KvTFi9NGzyJFWQUsJV5luU/bmQNXXTmbnzf7IA2k1JZQ1SZZx/lLiUJ9s7XedU
         ThVFGA5+6SOcpw5RdaHaHbQmPhJ6YBS9t0jJS+i34CswSOndSV5QI2pdBtYyBoiBYnV/
         WlJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EjgxcE/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay37-20020a05600c1e2500b003e1f0df6e2esi2099458wmb.17.2023.03.03.09.31.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 09:31:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EjgxcE/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY9FK-0001UQ-UK; Fri, 03 Mar 2023 12:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9FI-0001Qj-U0
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:31:04 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9FG-0007iY-LD
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:31:04 -0500
Received: by mail-pf1-x429.google.com with SMTP id n5so2029227pfv.11
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 09:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864661;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8LO3H0xihPu/J7zCAeMi7XJn5vVG/43m/HalvuEQr3o=;
 b=EjgxcE/0dBUUdbaQphTA0Lbw8siPMn7ulYY1y/o4HEz/PKmm6ZZdrZwg8LAPRk1PSS
 tgGJGdXB4Iy94L/E8OgpVZgOYe9WYWXZefbRdaEajHBcASfLcmyCQoxfZHvewgcoYR6n
 xvV5XTX9l8QwxxZtqpqwZ8BTG4uMXc6fJxxrhKQTKSLZt0KCjbpgnuC6CoOhRiDGv91d
 uJvAX31FD9TkrWGKi8lVX/t240OYhFlBOlHmIGnVeh5IGYcGUnRCwtU+EVLQpqkeeoie
 WMU3aBh6En8dOKJQw+NlBkSnf/FAYGSQZSWs20advLcM9eiZBSoHxbhVqW0na5OaxolA
 yHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864661;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LO3H0xihPu/J7zCAeMi7XJn5vVG/43m/HalvuEQr3o=;
 b=tf0uz29wYzLZyoWT4wuHVHeoSp5C2JDlTQ0Ab8D0Jin3hgPDDN96hz9lFovBWCiaY9
 5tTZD4YfyV0rwKtLxDjxzl9Ll3q9X1RWGmcfqCrPInPOg7AMDFBcxEysCVrK0dvyKXR3
 XD9h45Y6o8ZkZylp/23kwPBs03ETEfhbLJp8ZyS9YhiJS4pRdrbt2UQsM/InrpCF2Ct5
 PxCtrpl1yX6larU36c5SEBLCIt93zswsFuxZjqXBkUMq7rWzp1Xq1L2y7t+iALivfPl6
 mdhbI/YKhyTnijkPAggSfg2t4u4l+xEaEk7ID02o4J13or1Na7s3QZJVVwI0+2zk245K
 ewZw==
X-Gm-Message-State: AO0yUKUJ8GnfC0dFaLf9KkSFWBlVUcC1wv363bOFOQHe1LmY6GoBWCpx
 BZcLWR5I89/JNp8YNesy/uzdEe6n8mlMe6ehk8d/Ww==
X-Received: by 2002:a63:291e:0:b0:503:77ce:a1ab with SMTP id
 bt30-20020a63291e000000b0050377cea1abmr746185pgb.9.1677864661031; Fri, 03 Mar
 2023 09:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-7-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:30:49 +0000
Message-ID: <CAFEAcA8JB219zg9gFkBd_FQN3jm0pto1LJ+eFun1Su1-WYw4ng@mail.gmail.com>
Subject: Re: [PATCH v2 06/76] target/arm: Drop tcg_temp_free from translator.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
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
X-TUID: M788h9SttNkv

On Mon, 27 Feb 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
