Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp3764855lfk;
        Sun, 6 Feb 2022 02:43:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzipytWCAjFSzhgICCUOWWLusSbL2ap9fVmjQAe0TqwWrM4sDoSqBJ20fAouzJsaUz3cI/U
X-Received: by 2002:a05:622a:1a84:: with SMTP id s4mr4816380qtc.133.1644144187466;
        Sun, 06 Feb 2022 02:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644144187; cv=none;
        d=google.com; s=arc-20160816;
        b=inmqCwZ5tTPOv6i0Rk9u7I0nQAH3xQXlZs7XsLLgzUOLbMnMMegZX9X3MbihJt6njA
         vSO2Q1knSovvs/rPjdFj0d60VOel9yLa6N183px5ztuBlePp0gS29F/3BDqlm0WTe9GK
         OsMYX/mCBFJLnFtaZsWnxRE+Bpcp5ElnaTFjzq721UhjRqIAheiSsoqQpqlaR/4mD9Xj
         Ga2cvxFEUv+6akeDWAIwvwRqKnmyxg9f9QJE1KZ+oawZ+8vRjmDlg4AtgPbwNOsDec3I
         xzGY0KEF3k/BGmQ+WTzqSIpG2XLm4QLn3yej2V+LdKzks/gb+ccfoHTZRVI7k8+5oaf1
         I+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rgos2MRD1ymHAXF2H7QIlSA/AJ/SS/QL8FJwHcs9yVQ=;
        b=uCGnZmOOQT4Hm280JXlGh80lvCBVKVuT0sKQ97lPnXi4VvuiKRzLNEaWtTyzh3INhC
         v6VE3vRd6qok4WCmNQUZY1/AR/gyQZgreM+yXOEUlVL4hfpnILjJVclu8gh2OK4/Uvwn
         PyBfQOunPhw/pMVnQSn6Pvo0q99qXvB/bQOv19kSQdFO94eaeYQpyqCOv5GOi0uurec/
         KpvNWhsroiqKiDS7v5WLlywA1R1AUtROQXaCwhlLDGygCCKuRRDE8ZTQwbQmmla7nkR7
         Te8vSamtEMDCShq94QxYunlx9yukwEMgvg2tLjF1uNkm/Ab+ql0HjeO6ARgTALY2dtQJ
         2yAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mdl7yJXD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7si1848900qvh.152.2022.02.06.02.43.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Feb 2022 02:43:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mdl7yJXD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nGf0c-0000Il-Vp
	for alex.bennee@linaro.org; Sun, 06 Feb 2022 05:43:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGezk-0000Fa-F0
 for qemu-arm@nongnu.org; Sun, 06 Feb 2022 05:42:13 -0500
Received: from [2a00:1450:4864:20::435] (port=41885
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGezi-00044U-Pf
 for qemu-arm@nongnu.org; Sun, 06 Feb 2022 05:42:12 -0500
Received: by mail-wr1-x435.google.com with SMTP id k1so3242679wrd.8
 for <qemu-arm@nongnu.org>; Sun, 06 Feb 2022 02:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rgos2MRD1ymHAXF2H7QIlSA/AJ/SS/QL8FJwHcs9yVQ=;
 b=Mdl7yJXD/3MrJGImbbccQHMFMdrhc/hxXZhR+0HPnP35v45BR+DT0BannZE/bsiWID
 5myn72WoCgd5lEd0MOkOqE9hnJb+dcSlN4AY/LJBJ365Vgz8aRtJStIsnJT2PtvcgSG0
 eYP5H2HG9ylGxtlTabzMNs8b2wp523hWWp0X+lYoryjb+W9f8GFreWuM5R8qhZbOEWHe
 ZNnzblrMkrPhkgxmK4VTIqB8uskaQ93nxIGWS2HukL+MgJ1yduAy6e+mlaPIWo1r2CIv
 yAJwTqJ/dOG+y+hHubRrAZIGOAzeQcmrKe/H79O36qk/LKFEHUcd46LPfx/k1FtPaDE0
 4wMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rgos2MRD1ymHAXF2H7QIlSA/AJ/SS/QL8FJwHcs9yVQ=;
 b=2JeYGvaIQIJJyBzHJVJoBosnZ6akWGYnGcsdgepbNi4ILKFRUjRGh9PVjTS61YEDKq
 k5d+jSm/sFHlrpETNlQO4XAom1sEARLRUsH3FWTNTeqzHO93oqzeiGzdIEqopDA4TixY
 3gHNTg0pKyuY3h/3V/AC7z5iePqzzdEXqVKJVgOomjsnfQvVnf2gnFuvm67f5ecIt106
 VrO/u+HrUUVhUgaMPgNVh61c4nAgU9XWy0YEnAdtk3GbNLKXk9BW/kl81FHdQjZZ+km0
 ziqoZlj5K7+mtJJlU5XIyIyPI0a/GpuRyD1fZrWwChb5FZATuV+QfKwVLVxoOASW/fH/
 h6IQ==
X-Gm-Message-State: AOAM533Ld0Fwma4CLA2lq3fd+69RL/fjRJirkb70OkYJVRMNlS0sZSIp
 Od/BilEwSnjXogpD1HbbL6mCMBbbxGXui5Hm5/f7iw==
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr3405675wrs.295.1644144118376; 
 Sun, 06 Feb 2022 02:41:58 -0800 (PST)
MIME-Version: 1.0
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
 <20220204165506.2846058-7-peter.maydell@linaro.org>
 <06bc9314-2f23-4a0d-4ae5-8695a93778a2@linaro.org>
In-Reply-To: <06bc9314-2f23-4a0d-4ae5-8695a93778a2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 6 Feb 2022 10:41:47 +0000
Message-ID: <CAFEAcA-0-U0ugC_7O06f0PzzxzRtFWutCAKCsSDb0Ha19ZSzsg@mail.gmail.com>
Subject: Re: [PATCH 6/6] target/arm: Support PAuth extension for hvf
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Prt1l29mGL39

On Sun, 6 Feb 2022 at 00:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/5/22 03:55, Peter Maydell wrote:
> > Currently we don't allow guests under hvf to use the PAuth extension,
> > because we didn't have any special code to handle that, and therefore
> > in arm_cpu_pauth_finalize() we will sanitize the ID_AA64ISAR1 value
> > the guest sees to clear the PAuth related fields.
> >
> > Add support for this in the same way that KVM does it, by defaulting
> > to "PAuth enabled" if the host CPU has it and allowing the user to
> > disable it via '-cpu pauth=no' on the command line.
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   target/arm/cpu64.c | 14 ++++++++++----
> >   1 file changed, 10 insertions(+), 4 deletions(-)
>
> Currently not a problem in practice because M1 doesn't support PAuth, so the ID fields are
> already clear.  However, it is a confusing difference to kvm, and presumably some future
> Apple chip will enable PAuth.

No, this is an actual bug that was reported to me. The M1
does support PAuth, with an IMPDEF algorithm (and no
support for QARMA5), and we were suppressing this by
clearing the ID register fields.

thanks
-- PMM
