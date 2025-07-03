Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp431032dyc;
        Thu, 3 Jul 2025 03:15:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8nMKiz5Yjj+vuMita1IDKzt2KTT8aqDt6HTl33C+qbfenQoaAtnL8rr6SSj2KIAAVZUoCYDuf8o0HuA==@linaro.org
X-Google-Smtp-Source: AGHT+IF7+H1so7gG9ncyMRpEdPSvs/ZdLSAhXi/GfyE2lmIruvWlNKIPJShnN6C27/dKt5UGnnpV
X-Received: by 2002:a0c:f092:0:10b0:702:c042:82a2 with SMTP id 6a1803df08f44-702c04283a3mr13816166d6.4.1751537708365;
        Thu, 03 Jul 2025 03:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751537708; cv=none;
        d=google.com; s=arc-20240605;
        b=SOnZSSD0Gv1XT8jd3537X23CZXtJ0PCcosn4E5MY3zL5T8bD2y5nM/olduaHR+supM
         ZwVnBoByQHhOYUSdXZ+j1aENB35TnN+tP+h9NHRZDDpF02eMym9l2JYvaI7uPzyIua/x
         wcKZ+wcJs5KN3QSVJjVe7Uutzr4hcs7rbtUgbw2EahW/UtN0/lqWaQRL0353jXAqMJ31
         2dOXf/iV/arNVPyTogSKXIhU4SI3VC0RXRXE726ehZi/8+tkiJJks8mXyxNu8M13n/I4
         xwAYQMWfGdX8LcgGMj0cLfft62TY8lOWiIZbFIcebPk1f4WJd3cXbWwOGcjIzy0e5PDf
         h7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GVPrrhJgvJ1GHo2JFSyjI9uU+Hr0MsYTK0epYU+8Uic=;
        fh=pBqWHnjk312DAkuH8lNSWs04JNkXJqKVKxEryWLTY7M=;
        b=cIq6/rm391PrZ98pdhwqOu42aTtNq8pXXVkwQvgzs+mTkOvbQ8lzTUT4BvclLOqBYC
         IsyAxpgLKbuwOb99K7VnMTX8+HSYWpIY8gv5Y5vdNQXb4QCD94SZDGtso1urJ7hmfETn
         nSJxLa3Uu0puG1L6pn3TpjWuDdtMVfta/MpdiH9c804hpGVRlNqR9+hbFbdSKpH6nCyT
         n4h8AeLX02voLjlb/gxf9CtM77BtWKJ2Xj8B664k7HLcaiuDu0SWt6pR27wLX41s4Ugm
         yj8xjL83yofYjFsjxZ2B24BSDl5ozeyEBMgEYDDL6AkcDU22SFR5zRC3CelmydDHcwqW
         iAOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hMJtNujP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77354ee2si175903966d6.160.2025.07.03.03.15.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:15:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hMJtNujP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXGxy-0002M9-QT; Thu, 03 Jul 2025 06:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGxw-0002L7-Pc
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:14:52 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGxu-0001J6-3O
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:14:52 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-70e4043c5b7so53270647b3.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 03:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751537689; x=1752142489; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GVPrrhJgvJ1GHo2JFSyjI9uU+Hr0MsYTK0epYU+8Uic=;
 b=hMJtNujPYxD70mg2mPEaLCo19anfrNiB5nCd1bBMa1IYtH7JflYWo6hc+CJwVsNkeO
 fJn2bKknAgZ7eSCYqMHLMF+9GqkqdF/aTQ7UDwJ3TvKk9NvoYwrX2K42t2Ym51XebNd7
 F5wPDfiErtknLGOTootxmD4DDrtGHVfIYsh8HxWlDlmOqaO9lE4jf8MZYs1Poo9oAd+a
 B7Y54Tu9sVevETL9rEsrtr3jymK+FZ+0XTqJyupIoLKpmNqaBX0mrpoyXRD/pmfFUPWl
 C/v1v4Nv05lyNtzH8XHygv3H0ODBb3czcF2GnUCXk7BrTJNh3CUFdJbFJ3hb39MJhKX5
 MnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751537689; x=1752142489;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GVPrrhJgvJ1GHo2JFSyjI9uU+Hr0MsYTK0epYU+8Uic=;
 b=hgVD23WVOurJ41HqSh8IKUVrYd2i50hVEnQA2MY7OyzDAcCCHYsCDIW+yeZyxPWqev
 Aq5pwT8HnhjvXMR3b/XHdr9b4xYrCmL0+lVtNjTPZQjn2dwKbAzPKXTMeciX8ik7ewKC
 s3xHKHLbNmZ/r6oyrR6GdqfkIe09nGxDZi/54V1ngxzCJtzbafxLU08OccO2Z8d2VVr5
 0mMpcmcw3rWUqamBpWFhr8ojRtffiMzYGR7kMgtVqBqdRB0k+lBjSbiihMAsxhDSZYR4
 ZBP6TlM5JQKNOfBuTkL6AB28xMq/KaUjCxxJSU+C/jvuFgnxp5pC1S77W2P3rWtVgE8T
 0y1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpSlWVE4SHOP//qjHNYlAWf44S8vO1JRfg88Y16NaOg8v8H/URBHVckw8/VJ0VPXQxH5MoUj24Gg==@nongnu.org
X-Gm-Message-State: AOJu0YzEJrV40woqDbBj62VSkxWZyW91Vh+QHgGuRiY7pAX5eOmUT4h/
 DkgshZOmxjc8Hsn8pK/zV/wi6MFGiSFyr/igjy+loWZR+6Jl/VardPIdRyiB5/eNQ1cR+xm+6WN
 xxhVQc0gNst/V8+lXraw5dcIyd10ymi3NB28dO7Cb+A==
X-Gm-Gg: ASbGncsRTcCkHpQzlrZihCD94st71/qsQSbYkKcX8C6TKFzLPgDpX8fJl+uKClaS4R2
 3iA9iJAsbIObfCPcg7rJI+bMFHpolZbkx34ZfIxOibPLNWDUFpawGnJJ1QAJaeqLGo0HhCUOwSM
 ZFblh5e2cHZmWUoPDKbZnXVRGrRrnzoxZWV1kRHTrnYkZs
X-Received: by 2002:a05:690c:fcc:b0:709:197d:5d3c with SMTP id
 00721157ae682-7164d2c7e12mr92979817b3.11.1751537688835; Thu, 03 Jul 2025
 03:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-46-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:14:37 +0100
X-Gm-Features: Ac12FXwF78y1FKI4ROuI6EsEh39wGtB2lrL1F1Ueju0OHtiDlMj3HFfk8iOW_CY
Message-ID: <CAFEAcA8xWkjJwgqi0SJfttGOkJCMn32Ef6vu8CbizuzHMJWG5A@mail.gmail.com>
Subject: Re: [PATCH v3 45/97] target/arm: Implement SME2 SCVTF, UCVTF
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
X-TUID: p68rAP0VTrLV

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
