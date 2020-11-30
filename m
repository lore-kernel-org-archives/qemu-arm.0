Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5144698lfb;
        Mon, 30 Nov 2020 05:42:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRE+zE2rAAzVRIPD4Gri2AFFOX1WiG1lH7yJkQ6/oH9j+56p2tzua2mC4oBA7Hs78kKGCX
X-Received: by 2002:a25:ce8e:: with SMTP id x136mr32689546ybe.488.1606743757322;
        Mon, 30 Nov 2020 05:42:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606743757; cv=none;
        d=google.com; s=arc-20160816;
        b=N6kw+M3/gES392lAs63EZ+y1LW10dSmQsUPkyBsjVhtVgtBrfFLIgzV6g0/NBiwHGw
         mt7WpcSSIauIdHhFpkBs8kpXXgQoThZqVIJ/Gyi5cP47/G30YIdEdzo0KS/bnYTwNpZW
         NTHlGK1QFYZUZOzRrBwJYySU8ilCOTEqpNCcdHxngKS8swm841l1B4gfZ0rJHDhQ+xIG
         wklT+JvFZQmjY050nG5L3knwBS3SrJIBmuhPOTjHBVN5l1dOFjYjLX7K2qvS/N+seAqm
         bUu0xEO7s4i8y5ZRALP/Llf75CoMkTshEz/DXNx9yh6rPwG30kCJHxksbdi1o+QWcpRi
         NDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SkOd7hFHuRTWAD2WpxIHqC2LnGgSIlJFl00IyMuh/Pg=;
        b=H3hw/4Mxj18YxR46/jiTALfnZoEe2c8MvFaagYtl2O/dAfC4TkX4jk6zbaatfvpxne
         /ITOdXXdIDqLcGsph1UBNGWZfe2kv39hdWfRQK2xmETT1F1PywQ0BehSsp3KNYeOZxfR
         bcAIERKw/k9Mu64g+qRRsjVwzvdnF//GotSBMdF9VZpQu2tlFmYgNI5oYK8CzIlyyysa
         H4wePYxZwWJZxtbO5QCZV/qPATj489Rr1hx/zLpXVknU6yISh7pohzcbKf6ECHgzyT1M
         KA1I8bOBV5/NJtH/Z3cHKMwqijFmL6riVZq07+hunDu5EYjoCupTpK7V85o4tQ28fJEw
         R5RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AZghzpEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o67si18518662ybo.172.2020.11.30.05.42.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 05:42:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AZghzpEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjjRs-0008TY-Mn
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 08:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjjPp-0006jJ-4D
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 08:40:31 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:37099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjjPh-0000Jg-R4
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 08:40:28 -0500
Received: by mail-ed1-x543.google.com with SMTP id n24so14026079edb.4
 for <qemu-arm@nongnu.org>; Mon, 30 Nov 2020 05:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SkOd7hFHuRTWAD2WpxIHqC2LnGgSIlJFl00IyMuh/Pg=;
 b=AZghzpEC32ReTt1DzR4jJxS1/QhlP67nIGFOgfekfe3MMKNwbIM7BSiVRAkxSv1rgk
 09hGtDpO68johGBwelX/8TnMAvb7qE8OrS8Fi8+biTGB7gOOvbBJbkYfxtxOvpFwwX7D
 PALWz4yfAdFPQ/n80rLgP8M8RaxqLvCqDT5YDHicvEeozSFJJ9yQBglDutEA8BYxTuQF
 fYsKHd3s2ShYB4oRyDA3z/xG25XF2zGa5f26tV3nk7nYdCyIsI/gl/0GwmhrWHB6YQ3B
 2UsmIC2NbEqgEY8KDFq9ZbLBA2nN/5uDcbaDiBohUKrFcHjWkxCntAt7XNSJyivw02oe
 7npQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SkOd7hFHuRTWAD2WpxIHqC2LnGgSIlJFl00IyMuh/Pg=;
 b=UIh+1npVXNRr/wtKedIttuoxBJRm83d2oiZxS8VMn7s0kzrCuaLTQuLlxAL3lNy07T
 G6P4xYqok4ZBEyuOSpJvhsoXBSP2ebn37oN5XpOQPxaNn2i3JnlLqcmTlwUN61kxX2BQ
 EHPMeU1QKFESTeZ1odWcHXsngS8fgx9qGeXjH0ZItHuCjm9T1CXPDthTqmBp9BfAxkij
 V/zIqE51boTI/8fLTBaVbdZ95qlxM+XN3OZLy+2xGnbnvxBvJwqDcl4VfzVdbPC9UWaZ
 UQjnukDOjwxukxM6zW6cID49N9AzMvXnQ+AZTIYbAi/CQp2KIWehK97uYyK/BpRDhi7M
 jkfw==
X-Gm-Message-State: AOAM532lFIdvNQA/VPp5qpA1NHGIq+TmB+P4lEFRTwfXJS22l/0L2b19
 noT84tiDgmorGKPlVG95zrsZVi3lc3PzFLLebDUINA==
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr21631949edb.100.1606743620266; 
 Mon, 30 Nov 2020 05:40:20 -0800 (PST)
MIME-Version: 1.0
References: <20201126111109.112238-1-alex.chen@huawei.com>
In-Reply-To: <20201126111109.112238-1-alex.chen@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 13:40:09 +0000
Message-ID: <CAFEAcA9qt=HUiaYPE7K=7Gkn4Bv+a2msjeYJUDA+Pqhq2UnMxQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] hw/misc: Fix some bad printf format specifiers
To: Alex Chen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe DUBOIS <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z0r8zm/P43Q2

On Thu, 26 Nov 2020 at 11:23, Alex Chen <alex.chen@huawei.com> wrote:
>
> Find a lot of bad printf format specifiers in hw/misc, fix them.
>
> Alex Chen (5):
>   i.MX25: Fix bad printf format specifiers
>   i.MX31: Fix bad printf format specifiers
>   i.MX6: Fix bad printf format specifiers
>   i.MX6ul: Fix bad printf format specifiers
>   misc/omap_sdrc: Fix bad printf format specifiers



Applied to target-arm.next for 6.0, thanks.

-- PMM
