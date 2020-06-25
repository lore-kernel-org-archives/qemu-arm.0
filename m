Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1456496lfm;
        Thu, 25 Jun 2020 09:23:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrGvivE0R06uNdQV/aJMCuVXzcSzYnX0TI16dtqVBvIE8W3VandDBbUHv7/LQh49b81ld2
X-Received: by 2002:a25:aad0:: with SMTP id t74mr53588269ybi.265.1593102206207;
        Thu, 25 Jun 2020 09:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593102206; cv=none;
        d=google.com; s=arc-20160816;
        b=ggHzpqv/qXdIEM8ubY/2G7wCJSCxrk2/DaNnCHeXtaULuqqViJP8oBxJ4zWSoolCIE
         f8IbnP9JEdSDE2lt0mU1eCoTI1aop5SU02Acig4wWQqtnZzj37YHRSadY/5sslu4vReD
         Fzm3i3DVtXc4LIXE596pvohiLY2e81fo+mdhyso/E68EOX5Hf2NEk3nLsxFJz+guIfMj
         iVOQhA69xnASBjjj/ez6gx3XxrULpBNZ6AlqFxPCu5wyNmBYZu2/gdmNtDw0IdaCNfjN
         2YI4vYq6aewh985U+Lxxdeo61Qo5EvKrkMJ5DDLTSxz7HPY+wZmRFGuZbh4wKLxcKsuC
         pQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DN3lh1Nr5zE2u96hqaFCeUHGFa9MMJvRTP2Dbvmd3MI=;
        b=Yrb0W9jIeBvwDaBxBhMEm7qmz8kALkO3OC4ruM/IFoRDNnZostrqWZWmqNY9HNVqC8
         ywqJeYvALzQ5xB3TNvW6qHuMpxgEaUkgky2LdSBsyJqXBHzn3d/+T8oAM0szb0m4ITbr
         MYNRpHj4R22Ew49AeVhIMLpPO2lxXA6ArWi7kFdE5Mwamq9aZfjDAW0bDRw8U1Ktm6PW
         QNY/w4wjrWiGrIVk3EHCpiQ5MvAFKr2fswWhH2abOJVDyeY8EHCXeW74yHNJXXi9ek2u
         uQoJ3vPCkpvdkrxnh+VqIIl2b57Aiq2rrB6P+ISZjPeRJviqleMRChI9eRAXqCbKZoPk
         FF2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cavXmDQc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i204si21297759ybc.254.2020.06.25.09.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 09:23:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cavXmDQc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joUer-0006Pv-IJ
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 12:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joUei-0006NE-NT
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:23:16 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joUef-00017D-Lz
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:23:16 -0400
Received: by mail-ot1-x342.google.com with SMTP id k4so2638514otr.7
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 09:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DN3lh1Nr5zE2u96hqaFCeUHGFa9MMJvRTP2Dbvmd3MI=;
 b=cavXmDQc1A8O/67PSIcZcG9pz2tskwPMxHhWknV95OFRMoU7xgbtza+behLZlLje3X
 E85SVtPKEjwvzplZiX6hiLyj+upZrxnjoKD1y34Vi4EW/PGg8LKyEnotgkEBTukBwL/8
 EYdZ7uC2uqBGxquOnWGVxRHNLnZOmnFiAQK/76z1P5m8156orOEHnA/I3ZJRvJ7/Qp2+
 YOJbDvKRl/f8HAtwBD+d/xpUmpzvlEyEMkfi6sKB8BqCkF9z0EpZtpbyefX55qcF23jk
 XSWOeGTFhgW5sVzyh5R4Wcy5/h14CB3NambROOgDjmb4rFDiiTduYegaewvTsSAkL4OP
 0+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DN3lh1Nr5zE2u96hqaFCeUHGFa9MMJvRTP2Dbvmd3MI=;
 b=Hnh7eZMk7J7xcLOXEfhRIR+rGg2vHs+O2rEUokD6tMadvLMrS71eomY/hm1BGOf4Vn
 ASo6ykMis3HefgcWJkOeEnRja/ptdiEV6OhWblcHlGX3IxrR1twUewnIkBqAIJEyHjCz
 tR/BtuctTo3ObMOTFba3AuIDiC6uL5jkjvkEPzkHO8rDgCrCbRJatvSvBQj155sToFsf
 fVrQvnO8/OJ8Rxbyiyoe78NtULSjp9RfN/t453eI92zgcTLg8kvioxyZm70lVrkiHx/K
 L+YHYeUxs9/y3rnFwH7q/keHP0xztzQ2RclKFW1PDs3njygw1au8mRtMkdBpr/M/vIoJ
 rvUA==
X-Gm-Message-State: AOAM531hWz9iae0hBy/y1tb74L0EZpmwtKLtxMtFa0x4A2JE2vh8EFkY
 wXlDToaHymuGLyl/bEllJtR6tIv+WqKEoHr75BCkxQ==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr26272838otn.221.1593102192270; 
 Thu, 25 Jun 2020 09:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-3-richard.henderson@linaro.org>
In-Reply-To: <20200605041733.415188-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 17:23:01 +0100
Message-ID: <CAFEAcA-Pd0EAQJOUQgB1nO1G1V5W-8yynffVVuO0vdSgNxhuag@mail.gmail.com>
Subject: Re: [PATCH v2 02/17] linux-user: Introduce PAGE_ANON
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BrPSeFeKAG7L

On Fri, 5 Jun 2020 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Record whether the backing page is anonymous, or if it has file
> backing.  This will allow us to get close to the Linux AArch64
> ABI for MTE, which allows tag memory only on ram-backed VMAs.
>
> The real ABI allows tag memory on files, when those files are
> on ram-backed filesystems, such as tmpfs.  We will not be able
> to implement that in QEMU linux-user.
>
> Thankfully, anonymous memory for malloc arenas is the primary
> consumer of this feature, so this restricted version should
> still be of use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
