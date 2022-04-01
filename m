Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp742997lfb;
        Fri, 1 Apr 2022 02:34:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnDFWHlhmg8djep0mgngb5QfqzhBrzijto5mF/NCzwsFkYUFW0ju5bD/VNElAHp/0uQJhv
X-Received: by 2002:a05:620a:4691:b0:67e:c740:4a57 with SMTP id bq17-20020a05620a469100b0067ec7404a57mr6047143qkb.288.1648805655347;
        Fri, 01 Apr 2022 02:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648805655; cv=none;
        d=google.com; s=arc-20160816;
        b=w2O66Q3b/Sb/uOQiJcl/J9KccrTFJifDrAadx8smbFa5yczbcKxPmhWDVJXjMIIylm
         fnVAmlzcU9P2qLJzP9ud+eJtrjmfdY08iBXd+27AQQcdojF8IoVRKcE7OyQygQJq0Oa9
         mnkJMMr58LQZVifETLq/ToJmIElmpZdlKYpRZZg+vt4uNgGNfxP0BG9sPMUiSrzayFoQ
         zORsMmEmb0mYH73biwHrtjHa+D6MrPDpJxRXlJZgvZgsyy/0K13NP7JHUsIRnDynQp9s
         FBvL7MNUa7nMfTMeT6HhZMbwVEeHTAMHX/UFMXQ/Q0T717tQy13R82Hly6x5aaAk2DlO
         C7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7cMzgF/6VY1AaUNdGw5W4kIx23KK9AypHqdt+bVocP4=;
        b=V/jMB1lnG2z3wsQC368sBu23UnGfLnQOS+EKfsVW5fGeODrvwHbjUpEAJ/vzfk2eJR
         7Ppw+iHKmzcq+LLmoZgpBEPp8o58mssq/CxY1V2FktoPqOiFW2r/82GPaxceZQ6mS+C4
         VZ6rW7WMsJbQxHy06lr/lVaYaRUK4SmHezKcMehU1QTvFq2PSBdHUMzTAy6ep/AYlxau
         tYzg97vdqHfFXbPQigUu2rcvE66l5TzXopXCMW7s4nyXqw1XjOh2pQ3f3T8OLM6RPRlg
         zR0NHEITV0uVDuuaz8wdcP4AkMP/41MzkAj8sOMc8U9WETDXcbcbj7lT2aq59t56wglN
         UM2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DEO0gCQ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ck2-20020a05621404c200b00440e46a7d77si575121qvb.533.2022.04.01.02.34.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Apr 2022 02:34:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DEO0gCQ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naDfa-0006xi-Bd
	for alex.bennee@linaro.org; Fri, 01 Apr 2022 05:34:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naDcr-0005Qf-8u
 for qemu-arm@nongnu.org; Fri, 01 Apr 2022 05:31:25 -0400
Received: from [2607:f8b0:4864:20::b31] (port=43664
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naDcp-0000Qg-My
 for qemu-arm@nongnu.org; Fri, 01 Apr 2022 05:31:24 -0400
Received: by mail-yb1-xb31.google.com with SMTP id v35so3937128ybi.10
 for <qemu-arm@nongnu.org>; Fri, 01 Apr 2022 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7cMzgF/6VY1AaUNdGw5W4kIx23KK9AypHqdt+bVocP4=;
 b=DEO0gCQ/UPBSPpz5UjekmyZuPbccY6I8klQsp8QbCz45cF7+Yt6yFSa0ekauskvXeu
 EVbqLE0SgdXiEoDFtHzOkQHSOsrHn1gXR1sbgBW2AXRyxMBzp63KOyqqUh6/XGNGtDEh
 0H7oJ74sGj162ypmt6yiYIh41pREkYoQ8GD0FN2fnz7MSHiavxZHrqp7gtz+uciDx5fN
 xaB4qwvVqq6z02wxPhOo9xlEIi6LfW/3Z7ESTqmQsdeY3rV0Xc+8TQSuDW2sy9YQFa3h
 RDdFB739gEOCpQHfby9NMeGIkhi27E0hbJ+3NNpUZ29eEOusN1wSkJG8lLwdNO78q9Al
 CT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7cMzgF/6VY1AaUNdGw5W4kIx23KK9AypHqdt+bVocP4=;
 b=bQtYJ3eybKbMaimWGBSccLPC8e62TFvqTx/nOKcRj2hxad1JwbAft5lW5RJk9N7DpY
 LxcUeJwdA0SYYOAsFtFUPsiSIa8lfi8C5xBqaUEwAd/vwCnfD0y7jxwMmshZZhXWpzxS
 JkOTV3gK4m6N0zQeB1ZFlsqgz/cXlXd3gTuGAgnvhFoxulPaSxOgmTmbaNeUu0MAM/aD
 SSGpIWMLBEMDr4PZzD7Xp+EG/W+lI2aaijAy7UXsSJ1MziBCPVZrMQedHssxiGlCbewd
 8LIOfQ4qVQT6ENsWy0sAw81D0TJtxGgKjLEVFkVn5mWlJRMD7aVc5d2MNQy5wMLpDNzl
 uLxA==
X-Gm-Message-State: AOAM53241JoYkS5e5KMQBeJOz/5tfzfycpPTTYV8VZXZBXp9GzWQmO49
 8bEOPyqDA8cRTfMRgdOam9y+AamrMWJephMhCP2SkQ==
X-Received: by 2002:a05:6902:1147:b0:634:6e83:70b4 with SMTP id
 p7-20020a056902114700b006346e8370b4mr8164777ybu.85.1648805482589; Fri, 01 Apr
 2022 02:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
 <20220324181557.203805-2-zongyuan.li@smartx.com>
In-Reply-To: <20220324181557.203805-2-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 10:31:11 +0100
Message-ID: <CAFEAcA-t5kzTRYYKqL9G0y3YkGQnFEQcs_euWhLkzND3chKUAQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:Real View" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 14p1D/DCfjaR

On Thu, 24 Mar 2022 at 18:16, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/arm/realview.c | 33 ++++++++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 9 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
