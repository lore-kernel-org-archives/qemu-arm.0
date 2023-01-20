Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1289750ejc;
        Fri, 20 Jan 2023 10:25:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvJ0ODnoTm+01w6XknzxMlQMyEzE9aq5xP+aXrn6PGpvR5bLOaqVpNR4/vhR1jZhy7siaYr
X-Received: by 2002:a05:6214:3244:b0:534:f193:b701 with SMTP id mt4-20020a056214324400b00534f193b701mr23927469qvb.34.1674239144904;
        Fri, 20 Jan 2023 10:25:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674239144; cv=none;
        d=google.com; s=arc-20160816;
        b=t0nC/oaJnQmwVybARYckHfAyQfCgoFqLauzi6Usl8yHMkdiMi0JcpKmxNGt47EJCYv
         vHzdEt4XHZTRWZXNBRRro97r6u4ixBjmE0aZM15+z2+vl0nE5yzGsxvyqyb3JMd75B1J
         mPaJ1ENIsMRtHduCZkfDf4eaxvuBz9hS0t2Yqz2dluvo+hOoLwOIrqEUBDntJ/4finI2
         oicxTCvNXsMlzcEHCHFQU4zY0uiHbvNGTej6ln9p/V4zcqjEltMLPV2DVoala65/R5Ct
         qxYNpAEh5y+gJsSGnI6sTSKZQ7gJjvymJVn2FBhe85TreJwtLWSVD+EF1fUZRCbsrO9f
         jYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WyWqsP1PP62axTV6sytK9h3y9zFetXhIMy0WL5GaZS8=;
        b=Z811/0jmMFHCOBNCyOjIk4SQmtW3KMdCCviqDVWVK+M6GtWdWASQ1hVXfH0yZZlD+3
         8q6mtq3T8ggPNYq7agAbhNa1RanRvUzHiLB7qJo56py08sVKy45jb8f/PGJjTI/q6Itw
         3j7s8C1Zn3FPJJrjAwZH9VEu3paqXkjRKrTz+oakRZrQdnK7x6z72tKcI2wwHhifTwzb
         CWipQ38R6Yw/erj/w8dwbhKQT4MBuLLGS0IwBavhgTlAnSu4TRhwUqq0XITXrXmFydze
         2GqnGdfTdpq9oMEdAdB3E7TxH5gcutguB5gZKkw7vZlbxRKob0NTigouloJs2Mzqro73
         9rMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KTZqRvZs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n207-20020a3740d8000000b007064303248fsi10437887qka.245.2023.01.20.10.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 10:25:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KTZqRvZs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIw4n-0005NA-5Q; Fri, 20 Jan 2023 13:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw4k-0005MV-Mm
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 13:25:18 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw4i-0000ga-84
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 13:25:18 -0500
Received: by mail-pf1-x42a.google.com with SMTP id 207so4605624pfv.5
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 10:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WyWqsP1PP62axTV6sytK9h3y9zFetXhIMy0WL5GaZS8=;
 b=KTZqRvZsaAbtfwZbn8L5zuoAYjLIDCS+x+BU/TV2TaV5QlOw4bbdRkE/H4K+31t2qD
 J1SwWmrqjIpfPDqhxvdCOfDL+t2BfzYtrS7Wn9JLk5cIBSfDZewbI17b9clJ09bVstRb
 Y942e8yOsb9FH3lYHG+8+/Cuza332eJxfSSCFIkv9C5QrDFRCS0Pb7/EsmRVRog8Oy1R
 s4kNn0l/ikDVyGI2G+JTgB5nbnnUEhaiBhvNR9/6uSUG9AqehXAVjc5aGGjSBHljr8wX
 2qN4VgfK9dgtXyPVYzTMyYCcDYt5utY1wn6O93GEIWT1iQ3cth0weOMJdYY8RPerZ0MG
 tHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WyWqsP1PP62axTV6sytK9h3y9zFetXhIMy0WL5GaZS8=;
 b=4i8E18ogWMp3gXVbf21G9YLeh8CAi9OpBK9tq9s4jAIHqCxH0mGR4OJOYTYzPvLX97
 cDI3kyGKLwTP1lPNccti7pE+zXTI+jXddZNqrkd+RnoZGOzW7mwp8iR2i3gIgVNJ5wMM
 vDDCxVTK5EIfWNX2z54kva5X8i3BE9ZAzmpioAOnT0ujOGPLqb/2YZ5dgB9Ot7f3/5+i
 EuEqTWaMyfWBil7CLBmlAjwDMSBesHDzTSfbJBXMpBe4KmnZAaRHhbDMapxWmrgeos1O
 vZToR7cGvcsU7SuSdGmN/5P7jl4pXQzFu+7L6COPOGuRzZfnCRoXdq9YYTEc/l6Gls9Z
 hsnA==
X-Gm-Message-State: AFqh2kp7ZI6aoOqmcsFVz3ZiOdlF8UTem2dQ4AFnxFogY6LHJ/A5diPs
 aBo319ZtgHX3su4Qz/LPYrpp/973BFnSJtfid1+2LLixoYbM+w==
X-Received: by 2002:a63:eb42:0:b0:4c7:be1a:4e50 with SMTP id
 b2-20020a63eb42000000b004c7be1a4e50mr1338773pgk.59.1674239114953; Fri, 20 Jan
 2023 10:25:14 -0800 (PST)
MIME-Version: 1.0
References: <20230120155929.32384-1-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230120155929.32384-1-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 18:25:03 +0000
Message-ID: <CAFEAcA8G4Pxe+PQZufZxd_0iJvNvXfB_PO8gh_=w6CxSTBHn2g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] various aarch64 fixes for running Hyper-V on TCG
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m7TYRFz78eOw

On Fri, 20 Jan 2023 at 15:59, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> Small series of changes to aarch64 emulation to better support running
> Hyper-V as a TCG guest wtih EL3 firmware.



Applied to target-arm.next, thanks.

-- PMM
