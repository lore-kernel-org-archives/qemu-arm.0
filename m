Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6507894lfc;
        Tue, 16 Feb 2021 06:23:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3j97Vr+vE1U312hwRQIUrB/7hwAZHyg5+c7de+jOw6GFb0U4ZdTaxPF2XNZRp8s/0wPCv
X-Received: by 2002:a25:e54:: with SMTP id 81mr29860513ybo.404.1613485429997;
        Tue, 16 Feb 2021 06:23:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613485429; cv=none;
        d=google.com; s=arc-20160816;
        b=n48XEYhsfOZlRpnqet5SBhXnLLH5ZvkQ7y0XeAlEw2qt+5fMsgZXB6vp1wDJtzxG3V
         ZjTuQr2MKfz1GUU700N7lZ+PGbLV1BMLR7O4u39Hv25tKc3pssyo8mUDTbpQxMhmgYGF
         TxDzrX1ewxWIV08daFbdc14emc1BzEsYS1nBOb7wIm/9a9x0Dyk4uipSuq7YxVgAC6nf
         gNtpDMMRqK8tNxa7gsFY+yG3DFtEetD1kp4OAQ3RCuP0RqQEWDRv2RzUcLnIO6ABXj9b
         YdMk5+mTDnrVFRcWpOu9xzcF6eaPEjNVNUfJJdATYZ3wNlpqcoJm+nRczMMszwtkROCh
         DJ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2xXW8vZICAdcaeO7FqLvJ/bL7E0JJoDe05nJEyOiIcE=;
        b=P1uCwu+ojfpbRNq7VXpXvq+KiC9dUD3OdsZjSZpR4NaxWuSxtDac6vDvWST3I04qyE
         57n0pq8WDWQNN+o3mhYX22iyW17NEfRrKKOHkjNKthRBMGTEF35+avGJjTzEeFnGLhtv
         w0vhe11OngIh9sztmqvrBZJtXACYQ5rwKoF/IrWKH3Y3WkIHwUZegUna+muWiEiJeOzP
         qXLqtQFp9bNSJsolOPQDKyy416Mk4ilwhHneoMWNi4BXrSA85UGmbSp0+fmLgUg6SN/S
         QYQIsv8+iyv44v3dhML4ozXtUJXWV3LLCxmGHD8nP7acs5WpJwOrJ4wyyTFd9MeLUJe5
         FgTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yE5yLI7S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16si6453146ybm.296.2021.02.16.06.23.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Feb 2021 06:23:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yE5yLI7S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lC1GV-00028b-Gs
	for alex.bennee@linaro.org; Tue, 16 Feb 2021 09:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC1GN-00027u-U8
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 09:23:39 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC1GL-0001er-2A
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 09:23:39 -0500
Received: by mail-ed1-x529.google.com with SMTP id c6so12420081ede.0
 for <qemu-arm@nongnu.org>; Tue, 16 Feb 2021 06:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2xXW8vZICAdcaeO7FqLvJ/bL7E0JJoDe05nJEyOiIcE=;
 b=yE5yLI7Sj+G8qLP6IIMVZdztcYhOEpx6/TypWSlhws7Vs6LFp4OAQQ+zmuhrLHBvP4
 nvc1GoxOob5ZTZ8VQG1nI2HGxb2HJwplP4PfS9EErLFtBjeOUGXfjojJ186hsZ0/MRMR
 KXXMXUbWZDcVBJvoo/pipCVumOXN9YSLGVqRiQz+W7Wmi5ytwXA7YR2pRBvmYGCvja1L
 L+8Sj9tcY2GLAf0PZBtrLgOSoHeiIaulhLPsGiDbnda9/25/fov+e0CAc7e6kxUZnzKl
 xmoBBCTocoHFuFLFwK4KKGXG2b8RLKH87CyRqgV2+OISsOBat4ybzqY19jGKoJebGVvN
 JpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2xXW8vZICAdcaeO7FqLvJ/bL7E0JJoDe05nJEyOiIcE=;
 b=HxlisSu2Czznm3TTZQgQYySmoniKmNKUgamMawgDfloJc49+S0WdjJrTIMacqZVX/E
 hQLGqTDjsh780MyevoZ1M4v4g5NeMwWmprW8p+Oqd/zuEdamqqbEbPeXx2/MVNRsfRku
 lsCc8Q3eXpLFNjUHeC3vNJ00OITXS63EC/v0ur6asIoskVKAhn8zCo6jzY5dMlyBhW8q
 v7L1vQby0VNqOuZnaXF7M7GnZBTqQ8pF5aI7BDYAi2+abHbUn7NDauOi8X9GXfqa0ZGP
 xgScmnweqrpJU4/Cu5Fq4P/02w0rFkLd9id5iLSLgdSn2jjljUM/Y8Kra4I6QQNH/+7v
 Vt1w==
X-Gm-Message-State: AOAM532bYIR8rOJNRDTN/1c+nI/bHguuEsi9RTZDMbu4evDTCtktOZlG
 tVQy+z4VKZtkEa142PM/RyF1gQbMSY1QKiRI+TLOnw==
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr20682751edd.100.1613485415498; 
 Tue, 16 Feb 2021 06:23:35 -0800 (PST)
MIME-Version: 1.0
References: <20210211122022.1811362-1-marcin.juszkiewicz@linaro.org>
 <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 14:23:24 +0000
Message-ID: <CAFEAcA8JqjSg=spRdQUonORghEL2HP+q9ZjB=JwL1c2Laco8DA@mail.gmail.com>
Subject: Re: [PATCH 1/2] sbsa-ref: remove cortex-a53 from list of supported
 cpus
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iQ3XJRBiVlS8

On Thu, 11 Feb 2021 at 12:36, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Cortex-A53 supports 40bits of address space. sbsa-ref's memory starts
> above this limit.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Hi; could you resend your patches in the right format, please?
 * with a cover letter if it's a multi-patch series
 * with the cover letter not a reply-to or follow-up to any
   existing email
 * with each patch in the series being a follow-up to its cover letter
 * with a suitable '[PATCH v3]' in the subject if this is v3 of
   a patch(series), etc
 * with any accumulated reviewed-by, acked-by, etc tags

Otherwise it's pretty confusing to try to fish the right version
out of the mailing list; in particular the automated patch handling
tools and scripts have got confused by your patches here.

https://wiki.qemu.org/Contribute/SubmitAPatch has some notes.

thanks
-- PMM
