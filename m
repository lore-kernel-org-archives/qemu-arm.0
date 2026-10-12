Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0338CCA9ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 09:52:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGCho-0006uR-1d; Mon, 12 Oct 2026 05:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGChg-0006sv-06
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 05:52:21 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGChe-0000GR-H6
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 05:52:19 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8ab432273c5so12041387b3.3
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 02:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791798736; cv=none;
 d=google.com; s=arc-20260327;
 b=BBiKDFzGMaqSZu5y+q++ZRVVZjVV072uXQlm7b7/0fF+b+R3inDluDfj0W6YnR46Ae
 Cfv9dYDP5LUhPBPzd7r9Iw8H1YFDhydLcVIVmzk9wGORyhOp6NUxubiUM/b/9i4MGP/2
 dwtqq36T4dG3vUv7rNmg1T3uST1N2aIbmgcJovciJjMZViWzOFkMYfuJ7d+nCvHE6zuD
 WzNoU+oaSM3IStE/H6rTe6xvU5QQXf2Za8P6hCsePt3jVsfErD9nu5elLgLbQpjn/T0l
 Tej2VZMRgmZDpgkx0hXbNG5owWIw50n4d0tDbaVtVVJ2yijiXz2iAwdPwIwwUuQROl1L
 xC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+umfz3SlzoeSCqX3h1F92tiHRLs6umtF0IR1GJmbNcg=;
 fh=GHSnxNi+DFv26uZCyKdsh+BtgDUc2ncaQVAwCL88R3c=;
 b=IcZgdUxbwAkyJHxgw7H5WCu06BPCoIDgL/UA4rJPGV1fVfmZ838Rb2HLwMooeFJuog
 JfRVk7LxgAJdy5Mg96giBKy10u/R/YSyLFAkYRcd3WHCivuNFoAfdHBcMlLqpGZcEa3B
 c0btq/18k+oaL2mcjMOtykqPflQdjzQfn5t4aGcIy04CMGEPGdKfq7PiI3AYmUdkR1dy
 Lieo9eEcJ9ds5LzxO97v+Tf+uVeB/GSFD87ANy+BVHsCDRXxuyg/dqu4/PZrggEyuvAR
 h67cPLlx24zxz1xU0wjCrGLyYvKX/ASNlf2Py+2WzbZ46oWq+cj20ZZSmHkc3dtNQKtB
 HJGA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791798736; x=1792403536; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=+umfz3SlzoeSCqX3h1F92tiHRLs6umtF0IR1GJmbNcg=;
 b=nlOjGBLh+rH1FFgCV2//dLNmzJyJy7o+SFfyefGZUcd0lft7gtb4BmIa2DTONu5puR
 IloLHMWUV0NmuO6u0V/HeKnzaTTrDjpYXZ3xCE+/Vt+Xdp3qeey9SeN5z17fYmpcwFBN
 TIS0zR0oIBpKTvZUIHBmqlLyKCSh5Y/ojuaOvJCSJ8E6wkRY4jGkNuxAG5zGO0L3SliL
 mQFRiNM6+qiWNfgXe+pXpE+i1xPJnumEBeLNAw963+xrZ/C5+MbCKVG+r17apBxWhfPP
 3eMPD6XSWw3P5fyyh7nK1WfqYGSjthFCT0NHR5QZ9TSxZapuBRudbMkRgRixch857wjb
 WOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791798736; x=1792403536;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=+umfz3SlzoeSCqX3h1F92tiHRLs6umtF0IR1GJmbNcg=;
 b=cJhXJUndQ79c0vUZMGcQlvRJTnavmYoPP1vh+0OT8pRqTJlrjIvt7qfr5x2scgL3MH
 foiaHdjlx2NAQtT2KHDp9D407GPczzXUo9H8DZj9t0HDFJTqz18C0C35u46SDhNRhhiF
 KjRLO1yF1uq/vtYNLfZHci0jq+ilt8X+JnTH+bDOrDsbDmj9dpbK1mH2YYH7PN7s9gCX
 FJsIeJp7q1fQ7SqSNEO11SUTbEfEQ8NQGrKqMhK4VYQ4H/IdaMoOTBW1z3NcWfYeQ6ya
 7HQYi+pXgZJux0V2z5nKhWGGCC2Te9GcWoPA4oG9DIAq3hTLTV2aXYwQX4NmqWKplAfR
 hFRQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzC7EzbrhFLCXELUbUCk7tjFFweyvP7Z0WkqZsPGqThiW/hQw4q515KBjE6P9MOuY+QRFEY8N2x3Q==@nongnu.org
X-Gm-Message-State: AFq9FYKQsdCI/uAh+9FIyyQ0/W+y6Q6ih/5FlkYMUdDKqMJGLCj1Vxfb
 l33s5vFVi1b2xA3oMt0eZXJkBvNOP5NCF1PYUxAxnje1IxnzlyXwF027KsxG5hh9WVoXdHZa8OA
 XYdIxSRYEWv5141uq1I1ddYY94kOKFuHbMsL4mUJsDg==
X-Gm-Gg: AYBFou33f5jMdr5BA6LelSJuOwEsEBXDxAuizxF0chgk0vI1PtGrubyzeL3zJCaPYzK
 rghjehqzh4AGBgGEkbSi/1K7JQX9+9iF5bUFUDN7VLTxyIdIate5XHMOQxBbZy94oPvTvIGSe8Z
 l7nZf2r6R1xuH7/9mnYqSE/KzpkhbsqLaF5/HLnUGBZoo/RLjv2Oaue/f3xsvfOoHvXG3xBUkQL
 4v5vFQHgRnYev7vNxR9quViyFxFN6dTDrhjHvK+AgnEItUzYY8LgjmxSecXFNijwwO8K09cWfK4
 O0nJSvuMAzgTcXxB3RYvHH0RTQXx2liPhENgmEGgh/i4ShE1t4BSu25EB32402A1UhPjk9rr2zW
 pbeCJvawk4ACdhPRnYpm8f7or4scWHvGlHGmEim+P
X-Received: by 2002:a05:690e:43c1:b0:674:1f9a:9e88 with SMTP id
 956f58d0204a3-67936acb407mr1939692d50.90.1791798736281; Mon, 12 Oct 2026
 02:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20261009121545.241772-1-gromero@redhat.com>
In-Reply-To: <20261009121545.241772-1-gromero@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Oct 2026 10:52:05 +0100
X-Gm-Features: AclHuK9RLXsSqv7VU1vONq2feiFPvBZ-rtgPd-WOxV9mzRxIL9uTZScCcXCFVeo
Message-ID: <CAFEAcA93it=-W+aSf=n=TcaX12DnVbkbjJRbPkiue4oChvAArw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Use TAG_GRANULE when creating tag memory
To: Gustavo Romero <gromero@redhat.com>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 9 Oct 2026 at 13:16, Gustavo Romero <gromero@redhat.com> wrote:
>
> Use TAG_GRANULE definition when creating the memory region where the
> FEAT_MTE tags are stored.
>
> Signed-off-by: Gustavo Romero <gromero@redhat.com>
> ---
>  hw/arm/virt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

