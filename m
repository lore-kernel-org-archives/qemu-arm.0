Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3419745ejb;
        Tue, 21 Feb 2023 08:31:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9AD3A9iLggxFwGHZ3x4p+VwQpgALq/20vwrlS61c2ioEF5rrG3A7z/Gf/0niAY1TO+IgWe
X-Received: by 2002:ac8:7d10:0:b0:3ba:101e:88c6 with SMTP id g16-20020ac87d10000000b003ba101e88c6mr8022153qtb.48.1676997068610;
        Tue, 21 Feb 2023 08:31:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676997068; cv=none;
        d=google.com; s=arc-20160816;
        b=l1EQHLyDGHHuTLi/5nU/TMic2DO9mDFue21aGTG9dWVDsVLznsoJE23ao7LBAgxGdz
         d+QMf+04ttacOrP9Eg9yyI8Dcr+/GZmO3M4LZKSQywrBfY0zVk40QPTeeW1t+ExoNHym
         nXD5s+k683DK55N0vwVL93jNQtAvmGObQaoCRFf69x88qlGbDVO6T0DowOV/O6NxPlQQ
         u8miLFZQCzMd9ZIl68EU3/7C7JGzAkq2a3Kqm8gABgdxqPrMmBnrCJVJ+7QFyf1VxgRK
         WaxEjV0RmptmzfB3GyeFpHv3wgsjBqFoF164tkevGcJZ8PXJlly2oCc4Mbynn3HgYAZf
         IADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ou+zKNcsD0BAScBtOLJsd4lCFKkGnhO/yPO5wXiD6YI=;
        b=Ytvoj3rYsvsZbHajDzfpk2A3yDhMCmdYk+v8LhlFSwF0htASI1osqSDbnqaopwQq6F
         ltGHedTJ3YMyt4wZXHEWYffMpcippVE1t4O435/ASgN5nA3AcUQZWNIhl8PbUr4O3x6D
         8jE3vG6FQ31T3rkjNdHvJPdO2R/mRqvcnC9M1Memv+gCNR4cNAhH707yR4E/p+wJAQTS
         WsCpjEvhSI911VtroBaytm1I+D/+ioPToSsHTc/2d8Mc5kJKIgumlIyL3BaP50zlwF5Y
         Gg1cD1ae5c7iyibksdPQ314nKc7rkeKiclUKBOeu5ed25Zz8KFx446ucPwoxssSXyazY
         QaTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EgqF/vJ2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020a05622a138b00b003bb91e22b76si12735381qtk.413.2023.02.21.08.31.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 08:31:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EgqF/vJ2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUVXX-0001y6-CK; Tue, 21 Feb 2023 11:30:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVXS-0001vJ-QP
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:30:46 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVXQ-0004MB-JX
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:30:45 -0500
Received: by mail-pj1-x102d.google.com with SMTP id pt11so6235577pjb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 08:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ou+zKNcsD0BAScBtOLJsd4lCFKkGnhO/yPO5wXiD6YI=;
 b=EgqF/vJ2mCxMeieiQS09UgaDC4LxILaJwTTXHaU2ixm6V288JKFWPclCPpNhCAfV3Z
 PHUkxzZsBU3zrwuYm5DkBvIjBce1mlO0Imv5xTx5byDFwlGboSCEwRmo7CdXbxyOBXl3
 bol4p0d43fYh/gdMzvvYP6SvJeuTqcNVu7HjXCc75e0Xb3HyNw+hgWCQANdQHO6jRhQB
 GWDf+iIDIdrGLdFWyq2qeqX+LGOlMffwOTh6bL9qloHOGaOU7z1kWH6vbX+Qh3f4z031
 zAsXx5g/aUXlCN711pUhTy3IINoCdrEWFwT0Ndmbw2qnePTTkbk4lODfUgA85EWcl7hN
 rwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ou+zKNcsD0BAScBtOLJsd4lCFKkGnhO/yPO5wXiD6YI=;
 b=fKVrko3QGI+lUse80LOAohKQJRNkZGlV8ovxlcpJuxTRnbgwDrZ2j9sjqWf0+z/WcN
 Rv8B9pCIyFX30tzpuR+X8IUF0exMxsSFwE0BGlEhGxNRvqU4AGGJP25eQgdWa7Ddd4+Q
 GARsRWmIWKuh+aR1fknrrcC8ybeh51S3mttvk3ris688igg1iO6OJALKJZtJaTdk6yVe
 2/qq6/7X7+ndM6T93gM3a/PiyZZAtqKIYui0cFriXPY7czSRFF+Xu0K2kXVLsl1SQLIq
 1WUzGatvOKmQ5zydyTLQwpogqaSgVv0FxQhuDmtCNzOvFxQZ9XVc9fNUYTLPtgoJQMLX
 vAiw==
X-Gm-Message-State: AO0yUKVDIg+/2ox3zkh6rHLnrSWHKamXKUcIx7/lPh9TNadQAvFToR2+
 5mayirIyx8UWo6DNZMVgxSdMU16nST7kFVLiBoE0nA==
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1882654pjb.92.1676997043004; Tue, 21
 Feb 2023 08:30:43 -0800 (PST)
MIME-Version: 1.0
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-2-gshan@redhat.com>
In-Reply-To: <20230213003925.40158-2-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 16:30:31 +0000
Message-ID: <CAFEAcA9OvObRT731oaF7kOo8z32nH+egXfDcOpw1nHormHsp9A@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] linux-headers: Update for dirty ring
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com, 
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org, 
 zhenyzha@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: 7yB4KnIpzVUo

On Mon, 13 Feb 2023 at 00:39, Gavin Shan <gshan@redhat.com> wrote:
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  linux-headers/asm-arm64/kvm.h | 1 +
>  linux-headers/linux/kvm.h     | 2 ++
>  2 files changed, 3 insertions(+)

For this to be a non-RFC patch, this needs to be a proper
sync of the headers against an upstream kernel tree.
(By-hand tweaks are fine for purposes of working on
and getting patchsets reviewed.)

thanks
-- PMM
