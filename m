Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1524548lfj;
        Tue, 3 May 2022 09:19:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfFC7vUJpO3Sa1a+EvEcotqLVMxP0no5bIeKN4hkIWyLKfpeBGrbosqKT1hJTp0pl9e/yg
X-Received: by 2002:ac8:7dd2:0:b0:2f3:9bb1:ae44 with SMTP id c18-20020ac87dd2000000b002f39bb1ae44mr14746663qte.103.1651594793772;
        Tue, 03 May 2022 09:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651594793; cv=none;
        d=google.com; s=arc-20160816;
        b=BiwUXhiApMYN3w1SPUVmZG/21jFtCxwArIgibS8ctYU92qdyxk/h0wwpps0r2vHcky
         9ijJ7P9cuQBXbx6Js7nV4eF2WxKbT0ePZ5zqW30mZj/P1tYopvrBUAAK3KhRXTq68Y0k
         NM6IP58fuGuyyR00333JtAM8893K+m8kzV8AsdAgtV04TG4Qp+UZTeSX0vgwKLgty2uE
         UI2zGOSD9wIW2lq+8hURPnGjuh+gWo2NDUZzhBthvUpMlzo+dBR8xRArysim95NahZeA
         mUMpaj6SiMNTFakxqGQdBxhTGcA/luOp7n8Jsbsw+JyKDwUJOf8wg2yTA2yi/aHekasA
         c9pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IPD9dbw61T2wlLQpQCxHtoXCtlev3liUI24xtuAWnYw=;
        b=CL5oZumSk75jsvyqj6nJBcN5isB4WlkzjfNWoCjyPOZ60qjDc8sLvkORkfvksXY0dk
         ouVh1072QfVMoXz11HtXZHwcPtZOIZojAEAeX9hT/4wVe4JojkG90g5PLfbAnqJVMrss
         82ltwdjw7LImaO+k06LeEM0n+06T7s9GcqEJ2JeX/iKESCZM37/0qTZxEt0EZbBmuHLe
         jeaAUhYK0/UCMzCtUmVx/qhl12Gij/7FEuGMALbH3Nj1StSeAsGiRZxCy0Y8gY6tcCdM
         bp7TkJV1qZEZBbIdsvPJdH1BIlvt+0qYxuhoh2podShtWvolG4++7A6LukZ3AFSuXFAs
         xVXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZKtK3G7/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a0562141d2100b004464942f209si9370995qvd.499.2022.05.03.09.19.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:19:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZKtK3G7/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlvFh-0000qX-9C
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlv4E-00037H-A5
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:08:08 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:33663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlv4C-0003O7-S8
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:08:01 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id j2so31971021ybu.0
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IPD9dbw61T2wlLQpQCxHtoXCtlev3liUI24xtuAWnYw=;
 b=ZKtK3G7/emLGmqb3yHmvhPwbYMbRuXK+rRBScg8s7Sd652RG46FZsJ85/ZVT2S/QIG
 JiNEG9sjVxyzAmo4OuwIyTZRhdTn8R/qha3/AT1Cw6bpJaOFqpMNsvrn7o6wv6t6bGIu
 39Yf/dy/LAoJGyNbgFbQjs7QiOtI+N7MVRzCH3VePYVwxtqRQ0pVnj2QSP8BsU28IZfP
 hkzNrmBsYC/ci3H6Y/K62leSn+0NEHjQOeVAYYqsn4SeVWoLwfCgLeWDIPDLv3K9CSUt
 rhHJjekHNdqi7Y2cZSAn4zBB2ug5Gjm+f7XpoxImcGwn9JAcHDY8s1ufj/wbAsGdGbel
 tohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IPD9dbw61T2wlLQpQCxHtoXCtlev3liUI24xtuAWnYw=;
 b=RQ9zQ3urBULOk3Fxm2IgP3zODXGO2KUM6TV/iDlZqwgacxBbJ0KkEFn8BW3iVnnbZj
 2fj73GP250f1DtzEPrV8MUmIMkAW5neh8LC7Dpn5u6pnNRl2XR8nPZQ5s3ew/tpvnc2W
 hWep8M4ohLNzB8CwQ+WALlJDJibao9/a2qTJACvsxTg/HyNO9R0/jamJ0P1f6y9lb3WA
 WoFaGiK4mdXmpObc7TW/ngudxy6LrYZgFLfCrGIVOhP58PTlcukswuk3vVqg9F8UPPaC
 JgCZmCHiu2rz9x2B0pyvU5N/Ne7Hsq6REL/qG+Du8sU/xZgg9EAxmYNqZ3LNkDpUukV0
 mZVQ==
X-Gm-Message-State: AOAM530uG7ZhIEFdxDSjPpN26ic4Cgy4O6e0RaTB6LKYb6lH4RT9n3P+
 AogcElZKVDHXIsSYvZy9r+nT/6iKK89jbdC1443qpH2lApc=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr13556589ybg.140.1651594079798; Tue, 03
 May 2022 09:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-13-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:07:48 +0100
Message-ID: <CAFEAcA9+orqoQn=gMu9H=TJoGysC4Jds83qq7OPhTRDOTJvzMQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/45] target/arm: Merge allocation of the cpreg and
 its name
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
X-TUID: 1AGRzCaPc1mF

On Sun, 1 May 2022 at 07:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Simplify freeing cp_regs hash table entries by using a single
> allocation for the entire value.
>
> This fixes a theoretical bug if we were to ever free the entire
> hash table, because we've been installing string literal constants
> into the cpreg structure in define_arm_vh_e2h_redirects_aliases.
> However, at present we only free entries created for AArch32
> wildcard cpregs which get overwritten by more specific cpregs,
> so this bug is never exposed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
