Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1810072lfm;
        Thu, 18 Jun 2020 09:37:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHmzo/0Mo2Op79J09PnzmGLNIGX6zj+sIaL1CTScZYqgeICBHfw55Pydk2EfGy79T0+kbm
X-Received: by 2002:a25:ce84:: with SMTP id x126mr7637482ybe.15.1592498246253;
        Thu, 18 Jun 2020 09:37:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592498246; cv=none;
        d=google.com; s=arc-20160816;
        b=AFAZRSrRQoG2+8UhUzBbyBHvxdrVgknVjxqP22Nl1v0njKyN3RmO3g2ed+seIdgZYV
         FsaT4J8wHPItV6ItmoG5B0v2v7rg7REOoojOpTfuQ1NyAUvasbUUhozp1la0MkMo6Nuk
         abBxUbUnRnhnJKPkriGNms9DzUnEf50Ap+EMWOSEQ+jHhCabFYGiXqTaWQepm7gtsg/u
         sO/Lh0bfn+etP0OjZniPQz756L9zseZSQt1ssuHHP6LEEM2o44VKpt4CNe7PLzCZAcUs
         59ZkUEiFEijSJv9Y2851Ij2XlVOSXLOzgFVWmlkUosxSL5WjJHyp4i0f99854R9C47kW
         yBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g8N3m6jCJdYzMzXYIR5BFYcKxw/bNy07mahMLObkWTI=;
        b=u1X99QVD49m0UVFc2M56f+VdCJ0atsyQfZjmfsjR8geqtbmwPn/fqEAEE5FxFMKs1F
         9H5GPx8R04lMVw/GNmVYBGx42yrnJg5LZk7gkaADmP/qhVvXojDaMMcHDJBZT799ncSp
         Oxigcw4jJpDwMDBSNDd5f8l+zOyQDELkNt/DzmgbmlMYzcz46vWlFJvFWDWKoxZX9qmz
         S2q9qyXhTKU83TdUQfUDl4NNZcw3p7fpMcJSEtfvXg88y4EW5ssUi2tPGV0GkZynFINa
         q7GJzsrRzAmFDoY2VPPyqniG9LG7QsVCxNtAxqlZD3QSO+TaP9h1fxu5lB57rPb7s6/L
         hJqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sP0NE6PM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si2929533ybb.279.2020.06.18.09.37.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 09:37:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sP0NE6PM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlxXZ-0003i1-LW
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 12:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxWo-0003En-4Q
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 12:36:38 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxWl-0003JD-At
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 12:36:37 -0400
Received: by mail-oi1-x244.google.com with SMTP id t25so5634307oij.7
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 09:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g8N3m6jCJdYzMzXYIR5BFYcKxw/bNy07mahMLObkWTI=;
 b=sP0NE6PMrZ/jCplAZ65v0JIXPSFT7fUB8z8cUk8GJI8ntfFo61UCRXMP16w2HfUCJk
 nmIJrCYWIeJgcV83FP2v8Al1emZ+2ogm05fJSGJB5yy+RVbkErNRaLf9GMeMNV3fYM37
 rXkH/JiETdlRCvPZIPE8N9/s+ojzP2oWoIk7gj6j72gN3NHWwVxaJX/QsulyAeaYlpWF
 m4O6iyoeDkUq8PphgThvR/RUAwz+s+x7+qSFxxMTt2B7E4JAGG9HSLqcHEZbH3amp6EE
 AUFsD8iTrNsM0ieHO9rpRoUIXqCueNAPYxw3hV8K3SyFgAKrhl/4hxpQG+LCtECDKIGg
 pYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g8N3m6jCJdYzMzXYIR5BFYcKxw/bNy07mahMLObkWTI=;
 b=eTubghoRUuyihrhAz8OA7Usfv3SrQAzvKzV1KL2U+gMdYa+zwiEJYdyqUNvLFtjEPF
 4o2yKM8tvhbxSoKnGgIvVCVQ4VjddlLI5ylGmXc+8eHO8Pjth9nsLrDDRngoHyDiq2wt
 8ZDhNl6uReeWDX3S9pMOVFLJuJK+BH0i5J1yvDr9W55f5rZ9MGYpU0QBkxUrEGjcOwfo
 kD6sKQ683yuloXj4xVjFCVAgWlFxw5DiXJ6+7kSaAquIW332tOi6XkUrcfJXmWYmabdI
 jLSi3RKKr4LlesTdwXqtpfwCJkcIYFG+irKzWWid9regazsmAS0PIJsaysq6TwK4DXH1
 q6NQ==
X-Gm-Message-State: AOAM532VUBeEpd6w4iT6obR8313Tes+tAYiyGmzrhXbKin5IoL9JbGal
 Fvy0HBKvuSX2LHOH5Bw5ZpIiO71E/ubQ2wuy9xiQUQ==
X-Received: by 2002:aca:5152:: with SMTP id f79mr3579963oib.146.1592498194081; 
 Thu, 18 Jun 2020 09:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-25-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 17:36:23 +0100
Message-ID: <CAFEAcA9J_sQaDnST+y9vSZZ=renXBChNtzuhaNjsQF1H_4Q1QQ@mail.gmail.com>
Subject: Re: [PATCH v7 24/42] target/arm: Add gen_mte_checkN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ztCmw9GCvBZ

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replace existing uses of check_data_tbi in translate-a64.c that
> perform multiple logical memory access.  Leave the helper blank
> for now to reduce the patch size.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
