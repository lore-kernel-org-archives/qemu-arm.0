Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2418678lfc;
        Fri, 5 Jun 2020 05:53:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKtw2MVsdz/kVbISLFfbNidevg6SdyoHyFc23uX06oqtKImqeGgDw1md5wcrTe7NT7jVLT
X-Received: by 2002:a25:df09:: with SMTP id w9mr16613689ybg.67.1591361600991;
        Fri, 05 Jun 2020 05:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591361600; cv=none;
        d=google.com; s=arc-20160816;
        b=uO7iwZ54f0fIavS1kYYWkrO4enRgS2lzruNZ2bo8nZGKovUMaS/fukSQQoBB266cCQ
         8Lux5o9KHOJi7KcG0uEY9AYO4mbL0A9/qIxuy7xMla4olWKbGTvnMlV/WZXGcPyD/7nn
         j4TDcdAMYLt/wP0hIZAqr3vtTdgIkSyoKHx46xwQeAIOi+G8bihRoH3M562N02m5Ad6r
         6+pS1a/1u+yfgix8LNjklMU6Kn+507tCXAANwdzrTbjDA6cD7t1z6LZYDZPrc0gHmDgA
         t2wUqEizKGlLlVFbuwkJUc25FhoNruSXLl7caa2thQ2wqIUMtCCXPG/yi8assJSXFUrm
         APlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mzkkXgp0w+zEtvpnuZQDyX64IpaaA/GxxdlEJ4IxYAk=;
        b=gf6+7+V+3dI65FhB0fEnOkpnV5AGMMHpcKiEiFjKyReZF1JAlpWlxnUPpD1kw4u57O
         CgiR4tSNm/3l9t3w+nCBx5h/ILHOXgmJAD7NWbDWmwl501EIbJhEfFnvKw+X0a9+NJx3
         3/gfcLh7pHPv7WV5uuyQ1e8Jw3GrmizkS4Po9G8HIXRGvvLj/SyKLGM/uzE0V23COTk3
         dnEE6beYf7s3lme4THdx0SHwYVhvdJXyJ1bv1YVav9Nq07dMp3V4IGl645D+TIlGCDSR
         0JsfrJDZhQJi+1ILBtAomcwdlJ3V4XOhpKWK2UvL0Z8CFLtVgt/+B9SP1DrqUgGWuyLc
         3Wkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gJTw4agB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f85si4248568ybg.21.2020.06.05.05.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 05:53:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gJTw4agB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jhBqa-00021p-Bx
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 08:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhBqO-0001sj-TG
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 08:53:08 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:38315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhBqN-0005ho-CC
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 08:53:08 -0400
Received: by mail-ot1-x336.google.com with SMTP id o13so7492443otl.5
 for <qemu-arm@nongnu.org>; Fri, 05 Jun 2020 05:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mzkkXgp0w+zEtvpnuZQDyX64IpaaA/GxxdlEJ4IxYAk=;
 b=gJTw4agBz/WtXjXg2bTH46IGOgrNs8ru8kFG2Kyp37McdYmqyObppRDZMrRR0uua4p
 fJLctDbU3XuNw3RTldIDGYs5+NJ7+jgyGQCXbeJyA5xvhuW7mVMrcZRPO12RDyCEp1kA
 gLWoLDaY9wkldyr//BUMRkA7YaOfnYR91wFADfEMk6h/zbsEePiOPMfxs4Opyclo3xew
 7N7KGKdpVCykVcYesLcxte2mKKScoNmiTU/dAcm/TrEVH2AKhZry958yNpzEyaGLrzVj
 LxM9JQXQtXdC1PL91A0qEQavSZYefUQnKaj+Zs4bh1OgplgXoOA+ubT1iFV15hJL3UZo
 DKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mzkkXgp0w+zEtvpnuZQDyX64IpaaA/GxxdlEJ4IxYAk=;
 b=U3N3zPvYN4UNeMm7at42900S0vvrORHA4xL1p7ymabxjGO2nHOv1oufDp45ET5x5xO
 FFBUaTLCMemqDl5tfwB//J8rHisK0odKAmeOtD38ccpnawujQ6Y7rhJtnhIl3jxYf+P9
 w+2I7Fp/nbqPyXn43jo3g5y41nc1Aj26gvoGahXzfMuc51S0ePUAc3ccdXfi6vEfgQgx
 p3YM01n7O96OdCE1c1CcnvD4uMh70g4ceBgup3bsaGP0dlgCJ4l3fvFXMv+BqfmvXeKg
 /KM6ZzN5+Ang/CvZCUnAVVwxvdE+LXVvx16gfJNviGmdCa048UBU/s5rEsQ8X26Dl+tH
 ejoA==
X-Gm-Message-State: AOAM533/sQaOfcPnLTymh4un0YTa7HbQRxg4o7foIlC49LWoyBpDqEav
 DQ/qM34X1D1b7r4PFTydgKejvHiM0ZJRmKpugrtFyA==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr7701017ote.135.1591361586206; 
 Fri, 05 Jun 2020 05:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200605094750.149957-1-stefanha@redhat.com>
In-Reply-To: <20200605094750.149957-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jun 2020 13:52:55 +0100
Message-ID: <CAFEAcA8M+KxGbWeHK5n6wtwBLFtXL7dVBBBa9En0zn+O-rmNwQ@mail.gmail.com>
Subject: Re: [PULL 00/11] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x336.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xti+H1PjQGqM

On Fri, 5 Jun 2020 at 10:48, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 66234fee9c2d37bfbc523aa8d0ae5300a14cc10e:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-202=
> 00603' into staging (2020-06-04 11:38:48 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 7d2410cea154bf915fb30179ebda3b17ac36e70e:
>
>   block: Factor out bdrv_run_co() (2020-06-05 09:54:48 +0100)
>
> ----------------------------------------------------------------
> Pull request
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM
