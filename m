Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1331666lfb;
        Mon, 6 Jun 2022 05:31:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoCSMR0SFg9Dr1elFSzMFD7YV/gL8BAWDRLhSaTLSF6DAdDTNp+9wEYLCit9TSpl2J1apM
X-Received: by 2002:a37:2fc4:0:b0:6a6:494e:475d with SMTP id v187-20020a372fc4000000b006a6494e475dmr15851872qkh.102.1654518706238;
        Mon, 06 Jun 2022 05:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654518706; cv=none;
        d=google.com; s=arc-20160816;
        b=kfDGb8XuKNtY/pd5htwdRztx4+B15pHrVHJj47vlgE/OZe5nar/WCCROp88koFKw9j
         XABZPcOWGzfuYfQyZEMTEDlHfRzLDv+blhSvbFN1oqIItZeCjOovzseViLa7yRPHGd9H
         HWVejr6jstygrLlLf/Vbe0kJaSWpSELRIEiz6BW75J3kOcHbj+50getFXaiCwGV2Ezqe
         L+usK6njrG+ouYJ8kNxvHaeOjoLNxcCDGwnsS6eCo9xF1Ka4Z0WG4JOCeNecYw2m3+CX
         FFfTGYSrRhsApcQO0qSUZiInJnpwaPBP6AHHXG22ZuwJxZTen/TScRFgDBVNkfm9cIkW
         8xUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8hxY11/Y7gSvkl31h8yDMrStNIat2UHHBCpD8E1ZmAk=;
        b=n7AeHALpcIiaHMsATaBK0ctrw/WxZH/QBwMLM96asK3MjDT5BhTxkXb48ASbybLemp
         qJdy/ehHNw7/bthagdI89kJ/IG910DmnUzltdPUp9JGKwJFILCtejpY+Fk9Wx3rHCzTT
         CJ9wGDOfHnw+73O7QVBEFu3YawUaOB2lia6NhJEL81AquCa+OnI/+1ldI72NqMB30Smx
         aMQx2UYSpvGGXd/2AN7xRYIX0N1GvB6qFILb3RsAvicADnvH9P2fS6Hu42e2QeJVIPaP
         2/MOwgcFQeRcvUK+h5Jfads4mjYrTiGmcxyJSRFc43EtiiBS2Zu+P4hSVFrSEifPwBkp
         r9gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ilZQxD/T";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020ac85f54000000b002f942175605si7861930qta.438.2022.06.06.05.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 05:31:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ilZQxD/T";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyBtZ-0008LQ-OO
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 08:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBpX-0006GR-Jg
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:27:38 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:38464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBpU-0001Qo-SW
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:27:35 -0400
Received: by mail-yb1-xb34.google.com with SMTP id v22so25399611ybd.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 05:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8hxY11/Y7gSvkl31h8yDMrStNIat2UHHBCpD8E1ZmAk=;
 b=ilZQxD/ToaGxoE5dvjusORIqOw/5cqR9t7aIfJR0pdyiba6et/45kPyHhP0xVEpmYL
 +d7Jgc8TVOFIlWqyM5p1H0N2wFgC6jCjcooBYIrWMdwTMzqD5i6tTbq/fpOcTr3//wsb
 f/owH8zb1Ney8SguKFOdgEfswC76jdMaSZmY8yEf/uu4TZ0c/EQIVphcg29xkxgMU3dI
 GkLOhfSG6U5dPDQ6FVv/CrqFCwQBkmKUZ5AjmmOihfp8ryZX4SIlqXwJapCROH2PW6Dn
 H/7hrOYrhnhBR+39eCipdrZbMCxi2kKr1uZmz5UzaAVW6+v4iCMCoXRO7xWKZQSkvxA+
 +OxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8hxY11/Y7gSvkl31h8yDMrStNIat2UHHBCpD8E1ZmAk=;
 b=JwNu3XNyJdR8WlpAlamhEeDjyvBRBIiV59RD6MGgR6V4iH+T2Tx/0CywXQ+lBcXeyB
 fA/i//l9qjjqwrEflheh/k/eZOBGZmVIsC9hMgW8uZhXcQM3fkN/vfPwBPvqRMosue+5
 YcwMFAZpT9WccxEuXW7sFDEXv/hBHBDtfBY7JMXYS0tdYi4+GdqdPmcsX2TDdZ4dar4l
 oTi6h9qWHScx5CXEtmAIAjLN++3PeLWqf4h+n4E5c3Q4MjS4lIyQyL9RBN8HbE7tIlgV
 jIWwg56FiqU6SwkDictiqlZRkDnCcZ5m4djYPSEUEzohp89sSWOIM3iFrvwuXjTNNd60
 qi/w==
X-Gm-Message-State: AOAM531ulUqHg+KefHyewrWClVo14qJkVmM/r6VC6fZbmGoP2uEOYL+W
 8rQPidjRnciv/Bq0qJxfy1tOMLVcsfpNEOWvHQ1qBBUanNo=
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr9753438ybt.288.1654518451345; Mon, 06
 Jun 2022 05:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-9-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 13:27:21 +0100
Message-ID: <CAFEAcA-X-mmLK20Z+BcHU_rkDjinROAVsvv5_xxD7DKKneDh6w@mail.gmail.com>
Subject: Re: [PATCH 08/71] target/arm: Hoist arm_is_el2_enabled check in
 sve_exception_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 38HB4oTjd2p0

On Thu, 2 Jun 2022 at 22:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This check is buried within arm_hcr_el2_eff(), but since we
> have to have the explicit check for CPTR_EL2.TZ, we might as
> well just check it once at the beginning of the block.
>
> Once this is done, we can test HCR_EL2.{E2H,TGE} directly,
> rather than going through arm_hcr_el2_eff().
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
