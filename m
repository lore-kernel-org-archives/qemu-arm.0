Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4863401lft;
        Wed, 6 Jul 2022 09:55:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v+KpsIFi3I0Yj58/fRTSSc+10tIAE1C0QdYIXCHaGxgNF4/IoBUge+UC6BnTRjJt2wvQJ5
X-Received: by 2002:a05:622a:1704:b0:319:7bd9:dbaf with SMTP id h4-20020a05622a170400b003197bd9dbafmr33968972qtk.659.1657126558978;
        Wed, 06 Jul 2022 09:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657126558; cv=none;
        d=google.com; s=arc-20160816;
        b=qYAXgYqc4B9D2m7E30hP27KSEljRRdFoG6vncT1uRXWHEYOfSfApLvvQxaNsIpX7Y4
         bU+njL2iz6ouMXPv8o/fs9c6PjbIr514TYU4EV2nEydciDNeQRWyHtEmAbO9t86N18eR
         M3VVM59qAFUOpAiMjA7vja93S/6WkYtKwSWl8DJOWZmC5n2KM+e0RFRmyfObNvLbJq3i
         iq9SYxhEKgl6f735J3VfHPO8BM8FlPHyY0h31r4Rphib9SI3VydSjxocdWvzU0DfjhMw
         h2dxozXaE/Wiq3MAJx0owqIjcbKFZ+1MGKHSvPNUFRxA7UDUz7yi8uACTUjUkHwImjT8
         dAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nzRDbeusJSH/uRWYgDMC+U2qMkhIfsVFGfIMpfQktsg=;
        b=zjM1E5Yw7ILFrxXJT+lueIfZgDH5WtO8cg8iBbd8AVyTtZ7Axkr4FnF3btTeR4dYMF
         lZ+NFCMn3RpvqZeeO7Kj4tcF64dnw8hMb+wJgJdrcYcI8OWZN1tqe+mw5DyvNLz5jub3
         wyw8/Iwd5ym1qgjAebEJ9C5bD+Qt4/jrUdlQzkdwAS2akPnvNsbHKFEPPFWe/DEVxpHO
         LsqEsuiFPk27WlOtkW2rJRSnFQPxhFIKX99Y9fGutibgFdcIeUKZJmBOBn7/3gSTvHap
         YDqaeSSFsosDsEYiPjNSfKFnUDMYjCxf1k/se8PbC/GigkK8d/Nwj1ZfvVkVQ5Ixm9gu
         1WWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J1EsXaHg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ge8-20020a05621427c800b0047316256f17si1616196qvb.97.2022.07.06.09.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 09:55:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J1EsXaHg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o98Ji-0007hQ-Fu
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 12:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98JG-0007fn-QW
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 12:55:31 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:33307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98JF-0004gb-6f
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 12:55:30 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id 76so12699733ybd.0
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 09:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nzRDbeusJSH/uRWYgDMC+U2qMkhIfsVFGfIMpfQktsg=;
 b=J1EsXaHgN62DMefF5NakbeqqvDvm64xVlEydny9klEjgFVTrbk70xeQS9SaE+hqqbA
 WBAyWqJNYzK7TD/AxYrMOuIuyBVb+01pJZL+wn1sEHtDC5ohuTOBQl1xNJmpNZ6VZyWb
 TBs2IWnvqo/xsmfKHJTtwwxsmQTmiwdQv2Xp1x64lX6Zye1JjSdSA10a2fXvgvAg/MDP
 KpUI/au7Lcwtc3u7QkHjRgmGn9K7LY2fnpJhPKeLAuLBHA2LVuS8X+j5q/nMKzPAcCxH
 GvBUmNuBtLPRNr3uO27PndDEESTIGouW1fcpl9gC9wlxCAeL3VH73mVuzuEzrFxZ3sSS
 VZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nzRDbeusJSH/uRWYgDMC+U2qMkhIfsVFGfIMpfQktsg=;
 b=f1duozPeTH9T+ZUNDLMazDr5i90W6BGDi05Qo2OB4H95z15DgzYbynLfYsnEJTLWns
 DiNxB9qmrZ9wmmRYDBT7lcx/xPV29SVRBz8Q+xYEPXpcKsRxe8voZc/CQaOncV+5XsXU
 ev3IhhtwQiTNG1TpTGO0NYduP0mY+0RdB+QsIndIhpaeYA3kruR67kgEwNXkRd4eL9WQ
 78OEzpkkw9A5nzWS7yq7gRoAfh7wnjZbXNWyfUVIofpKFE11pQBoDRTYzApxB801TZlm
 aW0p64PyyarGUmD0GSvCCFdY1tf6UNLbiPzc33A2a/z7q53kaIeMYX1RXgz83iP26Yz/
 /NMg==
X-Gm-Message-State: AJIora95q65TCrfFIDkhRK0LptF/jYKz0T/Y34n6YmmI38z83eoUIFEq
 QPD9h6qWyrSo/sU2Uh/0LnY/lWF1dgIlVNm/Q954jA==
X-Received: by 2002:a25:500e:0:b0:66e:4c27:6223 with SMTP id
 e14-20020a25500e000000b0066e4c276223mr18152101ybb.85.1657126528183; Wed, 06
 Jul 2022 09:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-36-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jul 2022 17:54:50 +0100
Message-ID: <CAFEAcA9CGLJZvC+WA8dZqjAiQTeYRYmL=M_o8qszYFRdUo5bKA@mail.gmail.com>
Subject: Re: [PATCH v5 35/45] linux-user/aarch64: Add SM bit to SVE signal
 context
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
X-TUID: 9dqz0IXS/lE8

On Wed, 6 Jul 2022 at 10:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Make sure to zero the currently reserved fields.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
