Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp410910ejq;
        Fri, 5 May 2023 06:16:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4hdgcIF6AD1aJRUQVzW40KJKP6j3e2J2szP2c3HxnMjgW1EJ6oIgdSXdyW1UQ4ZBq1BFDY
X-Received: by 2002:a05:6214:4107:b0:5ea:2575:dccb with SMTP id kc7-20020a056214410700b005ea2575dccbmr2082428qvb.46.1683292617797;
        Fri, 05 May 2023 06:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683292617; cv=none;
        d=google.com; s=arc-20160816;
        b=wQ0uacLL51vJUDGC8rOywJJSqQ0Dbe7NtuV1V4IxCa1zyfH3b+EhqsWPh05C5XwppB
         4Tm8R/ybhCGWenvNfXU2G5t6YYV/PPX6jz/oiK/DtuMTwdpFMDM5r4oGks1/g2hXyahB
         q0ZvxFckAzyt2/Fla4gvb3qljVo23DZdeh3CbbqMTZt8ZtKFBGJAl139WEb1SX5uyl1y
         ov7sAetxAnTyNXRSkXlSYoZ6O580LSnvrrMn3i605DM+NJ4PMDWFppyHo2bRJogZvInP
         k3VBCzZDvhNMnWYHHYA3sNusbYLw1U+jirFuSYs0yyEi7C8CxAK4wSjYkpG7UY2XqbYm
         lBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1vFp9YexGQv6Hthy7qpqHyudwVk2TkB8SlsWsijBqf8=;
        b=dplVSCd08+mtWExKGsRStrOv4v3IH6HY8m705b5EY1OFdss05xn1aNOHMhIKTAB9qd
         ZLM1cNYoObe4HThjZayCWKjgkJsvRoNRE4n3L0O6oEFTMb6PibLCBnnodWGxHWsLdbqW
         D7ibqJJAm22LdcAOTivvlJnW+CWvj4FUNdEmeVPBnqHT9hIhR9Sjy0agQLQYves3sV+n
         SwzTbZiOlue7btbVXkjVSElognr/MXJNW2C7NmGUnb7XocgXXc8Pn3v8Ti6wtcEISzLQ
         nk7+kRzcOBdOX6zsQkOj8VSdz+72r3dd/kDc7zBBxXDAF1t1lrmwVLS15k8rbKtGqpru
         MrBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jceiXtC5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a0562140e4900b005eabbd46f0csi591160qvc.489.2023.05.05.06.16.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:16:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jceiXtC5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvIn-0006QQ-KD; Fri, 05 May 2023 09:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvIi-0006HC-B5
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:16:44 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvIf-0005lF-PV
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:16:43 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bc570b4a3so3403557a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 06:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292600; x=1685884600;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1vFp9YexGQv6Hthy7qpqHyudwVk2TkB8SlsWsijBqf8=;
 b=jceiXtC5uwpydNJDbKvI5FG4jH2GcSbc3SERS71I0VHqvnqazh3vhcpxMryShCVDk8
 0hFiwdy8oYPNfi8GTKFjEuvnU3l+MJMpUE/V+0eQJlHDZUzVjJJ5llJnU8whfDfkMU4p
 aVXn7aa525pmbf606qwYZHSyiSmHmPCnAduvr1RJcrJ/SOJM1bJVCLkO2IjXK18sGaEs
 LKZuXcgacfwq/Q85GMYBTVbBgjMXgsI6yNnv46xKeRKequif3Cck7pOP7H6F9YfEKpn/
 lYogIfpUWnNt08t3tZEfw3I8bZmIav1O8ik6i+zFnBFGqMnRq9jEybDS6BQUqx5M/Fha
 gUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292600; x=1685884600;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1vFp9YexGQv6Hthy7qpqHyudwVk2TkB8SlsWsijBqf8=;
 b=VoFarBe6PSeOaf/jX03EMc7sgLWwQxjyJ7bNMWp5FHGbgdup8bH4OBD6I7JyrLkoCl
 dFcyqyn3bGFXJ5806tCgaHC4xa5dDbAKx+bkzXwWwbEJyIzcT9ZXFbnuychRPg1ULxOG
 PRwW3VtLKvK4ReGWDEj90rGmGzBQ1D7YNwRq91LaH21vVR2n0CR+E5nfeuIPir5ESSJP
 nLdFZDavHe5vxgXsiBSGFsN8iMeNEf3t9PVtmV1K+iDXE63Y+zIBfrbJpiQ4ltRmuA6O
 ezCStp2a8JQdkxbTKalej4d35c3pE4YjTzi4C0wdOvk18c74oq3ocibpB6GsWJr52ZJA
 h5Xg==
X-Gm-Message-State: AC+VfDw3mJVdhUJoTmNw8F0g3SscC5gw7ctWrYJtBuoDRA7aCSiNqkhd
 sy2Jd1L7kWnBX2vqLOYAGdla0/UkPURh5MxmUCXTHw==
X-Received: by 2002:a50:ed99:0:b0:50b:d30c:c595 with SMTP id
 h25-20020a50ed99000000b0050bd30cc595mr1415260edr.7.1683292600161; Fri, 05 May
 2023 06:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-47-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:16:29 +0100
Message-ID: <CAFEAcA_29qccyY+K1esRjy7Y8o2YOSaJsHzcnvZoxr=K32w2QA@mail.gmail.com>
Subject: Re: [PATCH v4 46/57] tcg/loongarch64: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m6xwUtqx/jYC

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
