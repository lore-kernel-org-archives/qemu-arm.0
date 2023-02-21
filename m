Received: by 2002:a05:7022:221:b0:5e:6ea8:9f07 with SMTP id 33csp2743802dll;
        Tue, 21 Feb 2023 09:10:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+e70m0o2HkaIqqIerFBlWMiLuYOLl+H3e+gN0zxO1Ke9TfXe5Qpr9MPnadqT9hQQ2jPlDQ
X-Received: by 2002:a05:6214:2605:b0:56e:9c91:6cd with SMTP id gu5-20020a056214260500b0056e9c9106cdmr10268077qvb.44.1676999453055;
        Tue, 21 Feb 2023 09:10:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676999453; cv=none;
        d=google.com; s=arc-20160816;
        b=afl4008nq6hPsDJUw0zLVE3Jx30gL/s3KaMUZV26TBvk2dlpVA1miBCHs8/CIBsEY1
         wdoPqv0BnrEwlBEfRncSN3FxgXXxYwlVQFyUKZKkZxedfSmw8clXNnkfHpnTHe7HxErS
         wVRgsBdZ92dN3dMb9RU7H7VgpkCNR4EA5BtZYZvNokwXIxmVSyUhnqnA8jta5Uwr39cK
         2NcLE0lyqN2qbIFoI5LjYZWzg2QtbSqRm8TlnIiqrtzMPDahk1xMQCuyW3yOidcyWQ5p
         KKHFLq5RG0xIiA8aKsO59LOMLUfNec+OfNCEkzwJ/mFeaTpk4XzGOYpLZteeIJGp/NPJ
         wvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fC+bYCKA2RZbCFhnPCJy/+L/fBt6lLiKEAXLP3VBNnU=;
        b=BXWw3kinOGJ5x14A+laNYRjcLgE90vV38bzGDGJl3OtljoH/hc1c2u7tVRQgz4eaQM
         vH84d6+PbOBM0TmLsXI35qcI0+hCfGF2jmKjkUPAayovjZ8jIQoE52Px/K/f+UVQXJH7
         LmiePq3yJlKkvop/dEkvdLObuMEBTthcIJUZ1OHb9H8YKGSW4qbhuinXp2j8WHudWIad
         NqFHoqU4Z8kmfyb4x+itgHawkygkO7fhdhrPT6CCBoy6IsuE/7Y/Ou5ojJskc635kKDp
         4yae7fBQAur8t+su0fTr09RH+TWSkBnnY6fVYOU+B71etXWptBnQwGBDOKLeC7/UDcGz
         2Y3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VVjpcJG7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15-20020a0c8d8f000000b0053232c7565bsi11753550qvb.135.2023.02.21.09.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 09:10:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VVjpcJG7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWA6-0001rG-EN; Tue, 21 Feb 2023 12:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWA1-0001no-65
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:10:41 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUW9y-0005cq-Gn
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:10:36 -0500
Received: by mail-pl1-x631.google.com with SMTP id bh1so5775199plb.11
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 09:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fC+bYCKA2RZbCFhnPCJy/+L/fBt6lLiKEAXLP3VBNnU=;
 b=VVjpcJG7BpE8w5PFqkp2Db2hNwIaacVT1B1dDZ5gBjQC3Rx+QqOymvLdypT0zNVNrR
 gS4wBVCK/rpIIbcKP2IPZQqOPLzVU8kkKgn6aGGW+6U6QyFzUm7lLd/n/xHTqFICxiMh
 bsLGuBZuD4F6uQLNpc2a4RQeStF5DFXbXWHBIY/s4sms8bQQNoR+JDh51Ml6ZG7Llv+d
 jdxusV5t84IHNWSbgYxi0ypIhcPciATpDpw81blozn57TloQxVQtr+ajNMgkikJdRTKs
 rasF8avrdSyjBZj/5IjhB7+uEsryFZ1PX1cGpEq3cUrATjk4khKrPBFgEfPIaLsvBvn6
 j9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fC+bYCKA2RZbCFhnPCJy/+L/fBt6lLiKEAXLP3VBNnU=;
 b=d1giSxpncB8dJ6kEC+7nEzaIFRlt5JwGReKqFeO+mQw02Mr5Bb2K7yFsgd5h7EPv6l
 S/yZNRxNo9DPb6fC6Ev2M/L75QTpcHe6VXxtGreRJsWx5WdOhjRnXx15XIFIEQzwMjKR
 ENFgUCnWJbtivXoIzuTQzRyORLq6TGAJ9favz7fTAWxmxCf/iIL77OhpV7tIUCyzutXo
 M+OBsESkPQX3wm7xB7OFqxegceI4mlRFN7OPPjs2BCuJx7xIhCXubWc6M2xpxhPkeiKq
 6Md8p8jH7uTEpIk4L1gmqMB4ukf5hZ7DpPmf6rCE1kgN+iZ1S99MADnNHSaDvzXmCCxV
 v8AA==
X-Gm-Message-State: AO0yUKURamrUOiJPyYdbVAEsN/9BYul1yWlMU9X53YMYv4XJQW2x0Luy
 wQIfNQvAdw1wpUdYI+LNOZxnGa9CbIRrBJrRlfvt5Q==
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1914885pjb.92.1676999428525; Tue, 21
 Feb 2023 09:10:28 -0800 (PST)
MIME-Version: 1.0
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-12-richard.henderson@linaro.org>
In-Reply-To: <20230221021951.453601-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 17:10:17 +0000
Message-ID: <CAFEAcA9NUuYHMR2XHqJ+dwDYibxo6KzRBKwCwq9AtFYkeSsomw@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] target/arm: Implement gdbstub pauth extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Luis Machado <luis.machado@arm.com>,
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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
X-TUID: MPbMdC7gcpgN

On Tue, 21 Feb 2023 at 02:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The extension is primarily defined by the Linux kernel NT_ARM_PAC_MASK
> ptrace register set.
>
> The original gdb feature consists of two masks, data and code, which are
> used to mask out the authentication code within a pointer.  Following
> discussion with Luis Machado, add two more masks in order to support
> pointers within the high half of the address space (i.e. TTBR1 vs TTBR0).
>
> Cc: Luis Machado <luis.machado@arm.com>
> Cc: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1105
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
