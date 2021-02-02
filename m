Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp188637lfo;
        Tue, 2 Feb 2021 07:01:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjSxrgeJzcWx4wOvt4n6EK8rVolji0usmNKT4gSOxLnCY3K2F1i+Em8XcRKF0cjN09SdtD
X-Received: by 2002:a25:e6c9:: with SMTP id d192mr15804099ybh.211.1612278090003;
        Tue, 02 Feb 2021 07:01:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612278090; cv=none;
        d=google.com; s=arc-20160816;
        b=FDRSQjeBb7dY82AmHJDZg8UMlw28fK57KIw3hHyGWJ6I44KBdYygm07voYniW+LW+o
         WaSV6ZwrUiu/9drM7ixiyVOIKLxyDAjFVTLbLE6rwXlAE1+Lthii5BYZwcx98hfqP0jU
         uYMg0yinjw+N/rreWdtMjkN4jo4uRy20tSVoFwEgnno5eePqBecyJfKRrZsTHgZUWoHF
         aIR/z7qGBSy0T9yA8zlzqB3IK+mK/u/ox2sakQYkpQSr//9zjldEir73QsVZ8CVv6Y1c
         yqIa4HgttAsWl3LxYmCyRiAfg3UJ4KUiefK5LrMBoMuVKzQeZ8uqWGGa+jXikD3f40Ab
         S24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0pv5QnAKJ7XddWqALTzJtRTuy28KtKQfahjFIlSP5rM=;
        b=TKe7pzkhNjy693G5CO44n8HesWXOCT/u0HzKpTIu7CjWwFkl9VOwYZZeQOqKvbbgTv
         eckt6tmBvN0D/6dzKcLie9aa8OzvIeuD36DmBWmQMuo1bGQHf5vgropDhXgRyu93Rzu+
         K96n3tDn2/XjAridTSDDI4HLc3NuKIWNviY1nHiaGWJdYk1JT7W6gbvaGBYwzc1BSdrp
         Dn8bkLiz1EjWXIfiqbV4wFDJnmMQ6PpPJ2KW9ZCmaOfBh78r1Ds+a120hC+qDEWZ1N+I
         MPbBlQbbo4Ci2y2q58Mxn/c6RqYa6o7pw6RjsuRFS4suFr5gTD1AZh1FYzB3O9RibDCA
         I5JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MV7kY4u+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si22203452ybp.477.2021.02.02.07.01.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 07:01:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MV7kY4u+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6xBJ-00088F-Be
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 10:01:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wuK-0004Ud-CQ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:43:57 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wuG-0001tX-HS
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:43:56 -0500
Received: by mail-ej1-x62d.google.com with SMTP id i8so13888746ejc.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0pv5QnAKJ7XddWqALTzJtRTuy28KtKQfahjFIlSP5rM=;
 b=MV7kY4u+fl3v3FGHUIZMlfOBYoQiJsbc3xq12TExbCb4R0M4FLiJpDbTMixWPnOHYr
 fBGfwVDgbpPD5GbvMwfcNIBVw0cnI9yHdB/gDUJuvfW+c5VHjQZH6RYuTLtFwn7cGo5B
 ubhufP3tHQC/5IqTyAyvK3oNnSRUMTeaK4BWAjvwyz//7Kbpn36f9oIkIGGfZ2L6wIhL
 0eDbm1evl3/y0hYyoPTP2TldYujAJ6VbfB8KiVskmJUC3sYU5BKqdEGn2kBgzQK3D74b
 rmNBwg4Qi8pVW/OJW9XtyYLhhSrShz/am0MFICmkEnfHZH2xrDT8ARsliK12L6JR6KTM
 wsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0pv5QnAKJ7XddWqALTzJtRTuy28KtKQfahjFIlSP5rM=;
 b=Od60Hk2l4MpKXLKeccLFExndAupSH7HoG+fbLlPs2G1O/ZzSEYrtcMr/BysE0w/ssI
 YZO2KWXYxedmrsVGvjEZ+MyNJyhurA28FcHra6yI/s52pOf5eIVuAwb0cKXFHcJPOuhq
 3aQcOEgP3ESBusSfl8U1sc2n+VicFUYw3IZyM/GkpSjkji7hcz+T0ED9wsLezYFnskwU
 2rC71EDUU3BVoN1i6dGsCemTL8M4I1iH5OJJbe0iE+jaYUa5zeBLKS2PuJdD5KCfir5C
 TDpGmcl2DhiBBXbVFj4qvBNoaHha6KPTQ8m2yWOf51quISuiYLf0nCPBt1AGtogkjcnc
 V77Q==
X-Gm-Message-State: AOAM5327KkThG9TkpSut0N9zc3DpIwWc6wxxq+Y1vE2u904jeUXGpa81
 efOJYeQngBYTLIjMjtBx+dCPpRj+6EvXd6sSUvjyBiI3X90=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr2138049ejh.85.1612277031031; 
 Tue, 02 Feb 2021 06:43:51 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-16-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:43:40 +0000
Message-ID: <CAFEAcA8ZpTG67vgja6_GrcefLd98spg+3i8WVgxzHOJWTduKpw@mail.gmail.com>
Subject: Re: [PATCH v4 15/23] linux-user/aarch64: Implement PR_MTE_TCF and
 PR_MTE_TAG
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: foA/tVy7LaAN

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These prctl fields are required for the function of MTE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_syscall.h |  9 ++++++
>  linux-user/syscall.c                | 43 +++++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
