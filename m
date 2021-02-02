Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp174714lfo;
        Tue, 2 Feb 2021 06:43:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxzECr+36KSl5CigZXDVLfT00tN4OC1D2eliP5VNeXk+RBCOhoMcQBgYFH6n1KB/4zkI4t
X-Received: by 2002:a25:3184:: with SMTP id x126mr32093939ybx.9.1612276992201;
        Tue, 02 Feb 2021 06:43:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612276992; cv=none;
        d=google.com; s=arc-20160816;
        b=lHgRe8NL/lYWgqMOxwByHeKtUweQvHX55Wx3mrvR5sp7d3yjU/sZQXIAzGq+yHuAN2
         /FB5Du2+7VTv4AuQgDqojcH0tpI3/zVBRKZDg2lxXSu38jwSqI0bXLeFZ8/oAOmUVg+k
         UJSuGkVoSGvq2kJLjuKK93wUsF8E7uOL8GJtOTMUH9pXLI4QxAvZDpdUjpaXawpxgFel
         /tNuTQchTbGjNgoYOnn70iqqCXKt3kZC2leX83SflMc9VCsgjzMGDSQDWH2VYvVstqow
         Sk0d37IdTVVPt3xoWYYoVA45rkAzB4fJBVtK5Ucj3sA5tHrIZ2bImlLIdsc8uSShyLj5
         yTJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5Gk2o1CzVX6IK3vpvcfcamLozBF6pYpC0k3t7ydwP4=;
        b=gEgTPLuI9ETYI92rsiaRcpk1OZ49wYU8obnBZRdq4iSW6AMVjo+Hrpm/aCa9ZiUKM0
         jYkjCxKEbxxrVhprU4XDBi18LJf5Fo4avQ5jP1oweqLoKl+C8x83dSxYQL9UOJ86uQW6
         6bVzO9L5Z6eNwrYDRDZKVI6gZ8GtFGhBgoZGVDcB2it87uvBWQY9BUnNEwHSkg4r6UWk
         XbaAqUJlVlZ4srmUux32RWPwjhe9gadj9ckfIPibxIbbUtD/58IfPrsUdXettqGYqob/
         VHuNCez6S3/MaD4Lrbw9KB/4tdJHIy15CRGR7honQBnKBLRG9lPh1V37u93q/eE0RRw7
         ZUcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vrrG6P1x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4si8197035ybs.345.2021.02.02.06.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 06:43:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vrrG6P1x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6wta-0002xi-J7
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 09:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wjM-0006ow-87
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 09:32:37 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wjK-0005T3-23
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 09:32:35 -0500
Received: by mail-ed1-x52a.google.com with SMTP id z22so23135753edb.9
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 06:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s5Gk2o1CzVX6IK3vpvcfcamLozBF6pYpC0k3t7ydwP4=;
 b=vrrG6P1xbngi6z0wks9rVFc9OvagCOaGeZJEZnSh9OcgdtI39fO/EcjPRt6bFOEBup
 IjS9C7SmIFJuDaUxgvhfL46BGz7hoVT5R6RFssU+cLZPoFci8zMG9jGf6l+b7/BSIZ53
 5NPffWeH/MUlsSzBXEgffecjiYJQAQxLnq/1u1pYL9sr8vD5IsEWHLwNM6z3OC86FwQx
 qYg/vKbdHVLl9JalPvBViElrPPpOOfViLoboY/VWJEvNdCAoI8k75TSDLTBm9wGHZdBO
 NupHsuhJkGS9V5Opk42GVc0zHzZky7dU8jqrKwp4dE3k1b2+aoJOvq1ZPuzpnzKJ/qW1
 dACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s5Gk2o1CzVX6IK3vpvcfcamLozBF6pYpC0k3t7ydwP4=;
 b=VUvfq76Rkarv4vSLkZiKBPqyRVioroh12hcWeCTCkk2Ogv98nMYoSINzGwpcmD1QSe
 D0J9DTRHQT54asvMkHsJNEd3pFwBNqwtx7I54tpRpsKGyw0OQQpLW5Al2uTvX11rzvp/
 vVv8TzRcAI1i2EEFw8wkYkYBwbLVqXCNBONBG8QqdDJRoOtaVL4o29lUJFBdtIWWODZM
 ePd4iAOTht4qvNJpCxCbtsqTKd+qP4igeFW3Wf9KHpvi6NewsyzXuuqF2sFo7fVitYRC
 Yy6ghvSsxOYs9R1vRuWNRcIzu0a7lV28MwNq0gsQAPWGHsfAjKKmNRzPchS5IhkgxkNb
 20Pw==
X-Gm-Message-State: AOAM533laCxXuNrXrzFUoy+fWPuT9dcV2mNxSZlwlIESYB/Q3gvp9oUz
 ezbFUlQhuCQV1upUplAZAOoaPBke1R5ZBrcWuB/fDw==
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr23807761edv.36.1612276352447; 
 Tue, 02 Feb 2021 06:32:32 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-5-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:32:21 +0000
Message-ID: <CAFEAcA-nYeEi=L0jxPw7=kguT9RJGPZ+1oCZ3ZeFK-c-973vGQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/23] exec: Use uintptr_t in cpu_ldst.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: riWzQmq9itS3

On Thu, 28 Jan 2021 at 22:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is more descriptive than 'unsigned long'.
> No functional change, since these match on all linux+bsd hosts.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
