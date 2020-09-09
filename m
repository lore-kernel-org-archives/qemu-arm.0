Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp174492lfq;
        Tue, 8 Sep 2020 23:55:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDrClpZ/PuJ02MEuQ3q8BjdrD4sYY5nJP9peTXwAoDNsiSEKoSVy/v7VQFrCd74pVhFOaT
X-Received: by 2002:a25:ce14:: with SMTP id x20mr4040932ybe.267.1599634528464;
        Tue, 08 Sep 2020 23:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599634528; cv=none;
        d=google.com; s=arc-20160816;
        b=MdiEwumo84XzumHZokgWQBpXlm99qF7Se/UfM49gVTYzVQ9sFKu2Pfj+BgK0XEDUey
         6q8cuonA2wUJZ5D4+QUqK66ZnrdhrnRwKoY9sSMDi1du8fT8bOyxLKBQSfSbNmKZ+lOs
         s6Ub4TnM/vkhp5CRMcT5GD3JYYMOwwLL9Q5Vcj1wBHb/aSH7ejZDMcuf/qAU+4FFZXjg
         GcUOIW4VzKFjdbou+8c8I/GOfzNZQOn0uzm5DzN10mdSNGF4KDSGb0LuSawR+Wu1Vb37
         hfwGKMGBXulrlMzgJLqxVJHj2aG0rBKyEkKVJPbaOvDK/v6IqUbSrZnGjl+1NTVNBOts
         0ftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFGhA0w7SMAP5sLeLxoQqm/ujyfkWRQ8BwGBhsq83+g=;
        b=lawrJJo5sdZ8w+pFM2R2p+yMvvtezTsCQrYLHK6ulenir/QC4pxeNmROb4Qw/g76jK
         yuHk0D0JyyMMkqrrhe/3wkDJX0HAd/81x9xaCXeJpysBMPjmPegR7Yg7bgtfH2lZbGnT
         bvjl5uuAIfdVbgBE6MKPqWy4s2OmvCKLWY6vCw4ECsAGRlhyGiorvYPYOs/BMi07DDhT
         lECbDDa6Gk20DQXQzhkg87R+GEBrRNeuEZuM3HygCG1jKfur/om/Hlqbqq3gq5EGRJid
         2P9VY9bLW7h4yRILyC+tKS4/e0FWjXgc+30YeNzOurdlvRAlh0TT8kCwDXPLOYctAnGL
         UXJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="OFtW4d/O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si2062157ybl.463.2020.09.08.23.55.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 23:55:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="OFtW4d/O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFu0t-0005S3-JR
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 02:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFu0X-0005RP-Hw
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 02:55:05 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:45186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFu0V-0001sB-VN
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 02:55:05 -0400
Received: by mail-io1-xd43.google.com with SMTP id u126so1989683iod.12
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 23:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MFGhA0w7SMAP5sLeLxoQqm/ujyfkWRQ8BwGBhsq83+g=;
 b=OFtW4d/OI2P2jy/4ZMpoz2BUtDO/AfyYaxjNlBvOdZAtB9bDCUkKCR8XFywmevL7F0
 o3RYQEPsX5tIpx99PKCVYlCInF1QML/vGNbkjayp8h3/X2116flX/Dk6RmNJa/N4LEcK
 bZXA4MhJC9ozYPlsXaupB7Fj2g4o0Lacy4ynvxBXi5r038pHISFX3UUY/6EmtpkW0On8
 LzlbgOFu+aROpb1Ro8dnDK8UK9dudm1eoRYQHXG73d+ZMkSZbk2p4NwP2Pe+FJycbRVF
 aj06JrZ8CZq4gzFp0AI433oYY/DikAM/t7Vfz7vvtlHvuziU+rzlNzJZK5mKyoUEDW/K
 jEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MFGhA0w7SMAP5sLeLxoQqm/ujyfkWRQ8BwGBhsq83+g=;
 b=sy7kyy2wx3TyZMV9dSvVFrtBgm76eRKRhiXi+Knjbkcrj1aCZzbnhFrnFI2Rfs1abX
 GP5tqWvLrgZUfHRtxhbEurXQjCLGJSvnlCTYMsj1XcA+uu33Eqjp/lTFpO/hH+9Iv3hL
 IQc00mynDbqEVYs/pjELV3EySl0o+r/yBPzWV2A/jDCyTAawOKUQ68Q2znGotdM4gUpK
 iS3WzXKznVEHUMc5+5qLft0+3RWsBUI7g7Bv7asO/Yh4Jf+kGR/u0yTVCms+iXsug2oh
 CcnbD7UFiQHbUVO66tCSYn3Xm2hQOodpOZCekJOuAblykt0jTaL7A4orqp3mQhPqtP4I
 pTsw==
X-Gm-Message-State: AOAM530r2OR8mNxy3ANekKTj/ExFSjQnjK8K8kYYFABOL0QAOMMV6P65
 uMlYdy1as+qWU/9Qn8YWMj/RF7Fz14tE6rADlZiv
X-Received: by 2002:a05:6638:224e:: with SMTP id
 m14mr2738501jas.101.1599634502710; 
 Tue, 08 Sep 2020 23:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <04a3f2e202d9e84cefa431101eaf4c7e0cbd1a0d.1599549462.git.haibo.xu@linaro.org>
 <20200908110317.efr2bwgkityzepbg@kamzik.brq.redhat.com>
In-Reply-To: <20200908110317.efr2bwgkityzepbg@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Wed, 9 Sep 2020 14:54:51 +0800
Message-ID: <CAJc+Z1EcJAFCCbzofEGc+ViLBZTUb6Chc_iJ0bd=jMfo3P9MXA@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] hw/arm/virt: Move post cpu realize check into
 its own function
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /YzGUgVswnsP

On Tue, 8 Sep 2020 at 19:03, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Sep 08, 2020 at 08:13:25AM +0000, Haibo Xu wrote:
> > From: Andrew Jones <drjones@redhat.com>
> >
> > We'll add more to this new function in coming patches so we also
> > state the gic must be created and call it below create_gic().
> >
> > No functional change intended.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
>
> This is the wrong version of this patch. You should use v2, for which
> Peter has given his r-b
>
> Thanks,
> drew
>

Will fix it in v3.

Thanks,
Haibo
