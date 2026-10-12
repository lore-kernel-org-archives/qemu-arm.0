Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551AACA9ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 10:27:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGDFw-0007Kj-Kr; Mon, 12 Oct 2026 06:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGDFl-0007JV-VD
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 06:27:36 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGDFj-00057Q-4l
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 06:27:32 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8b0703011c2so11472877b3.2
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 03:27:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791800846; cv=none;
 d=google.com; s=arc-20260327;
 b=nCOaMMh5U4wqLUfPHJ5KSHKxgdIL6VnoXVJjS0dg8hkKzgynre1xEombd61BlGhhVb
 Zm1z4Lq0WtWmMHPltC+augpHDf8VhUIaMi1UgpQiWn4B3/huo8j+TlAF2MJI0YIABWsA
 M2EK6wUdgtreMWtRmX9S4laktGVpDG34jqLyML1edWIolk+OCLhxsMwl0U6hqbBzyBrz
 I3tsNXbUuggWPVCtuC8uyBS7U3dky8xbdmsyr1tsKggO/xOOLN3F8lz+Y2qSHAXXEZf3
 z2WQMGnUK5mbij5dUdRvcfkCCsIdKKw/XdlgFSO4ZrMuWqXkqSRhOngT8bapKDPsyLtE
 eajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=aW1fhbUGu6OqgjQI+qSffpqhlyHcxg/42Q5aUE4TzTA=;
 fh=RNet27Pdo9pvr5xPtoSFgNdj0c/evwxN747sdNsEZ9c=;
 b=TrBi8Kw6okIPRMIvbnzbtG+0C+3JEmI08saGRPCaHfHzXgpHUJjIf87WKzpRFQgtPp
 hfEOav4dNB/eW26R2l+1RULf/R7HhqDHNjpcAoDHkvaJ7V1kykkaBPFi6uw9rkkZrNN7
 a2qlVht9hPoDWpUYqzK70sudetpgthsIE9TH0ZanzfWsN14V90Ww0DjUIPz4pfNZCfjx
 XFimjA5lRcUb054s+D01mCO91TO1yn2Igy+aoK2Av4kq/6BEljmZhMiJ0LVAIuvEtt6a
 jx/LeUHmDDx3NiEao7KvplqcigZKnqDrq1dUo6hbV666MTY5DtCyIdU+Nsh07O6F+5qk
 jhDA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791800846; x=1792405646; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=aW1fhbUGu6OqgjQI+qSffpqhlyHcxg/42Q5aUE4TzTA=;
 b=N19mDcPKvhYgbKTJMBWmfZzvOnh+rwioUop7zZkT8mCKlDxFkF/9d9IktUSriT6pLC
 KQmEcn8sZtX3wsF8nqcScenexxGUVYBKnyLIYkAsRn0vHrcOeoqdjr3knohAzA+yu4n3
 LOxXj8Nz1ffooj9BOVmUo27eLVwWIYlUm/mwTb+sPQhymvZSJvQWhGZERZqjsQbdh1ga
 nLXpjxN3o8tDj0+xPRAPhuvcdHd1Bjqc5bJj0yvoBiS1IsjCUImjWzUaSibidsg5aJFN
 aBIYzjPqxNIwF+99cQsNYWEgpHZm/kjwH8eIDkNRNyTscnBec/CMZ/yilovDGvUs2S2b
 5mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791800846; x=1792405646;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=aW1fhbUGu6OqgjQI+qSffpqhlyHcxg/42Q5aUE4TzTA=;
 b=RBDUkixJFxhEzYmPevxcnWQIyX4+fhLkBge2chx5FxuNjVe+lroEAcKQAhFW8tVe2h
 FJgp4mRF16qprQ/ZtMnPgoZtndz3QksXmJ4vYBctvW5pSM646fZ0KLDDPrC5TmCUn0Mv
 TUeFKGODkKDigNQBxq5nEX8LdOrApCA0c+ea+kjQF5hNbiE5Skj24r2yGZC37yMX9O3p
 KgQvS/RuHooiBoP7UGNvzj6t1CqLKocVBljQGf+GX3qgoCHUsiXpwWrnQrWl+i2WvFwp
 +rhFykZXI3rjcaoYvUyoDkdVRVq4BdP246Wv7uRF4F1bPNYVSr7v/5s2mt2V8V2YkuAC
 GENA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz+ka0uB3zjBsp7OkpazYa/S0dw7RW/N1ZBzwZSPuosnPCrw7KioSOVpNhcXjg8PcF1AM0VPln34g==@nongnu.org
X-Gm-Message-State: AFq9FYKD4u6d2mu7aMYfUB/r+irytR45TpT0sbsl2m6zGb+FouAptz6/
 UxUhr3HL6MwFcngmzv6qcrsPrTBgaFh1i0aveE7usiTxThRf/TQVKk+pib6pM7BHhQ1TZHiEpuf
 +3FOqbax/KDarpzX9e8aJn+DWwaD7L4mLQi16n0Rs2g==
X-Gm-Gg: AYBFou2R7P4gvi7FWc3YtSxHqNFuqgipsFWpRq89TjI2b4lg55t00MpwMZPi9nJkUZ6
 zsdBSwGVSA8hl6/3jfPRcKj5Y8nrhHrci9IgpYDq9XxAdvFDUcQBHupOPpYLAYfkYlTIuYColId
 vkbRjrNZH27yma+jRIeNIYXoo4peiQovwnkuPgccITgQ0ptfNtd/1Qmo1+UU3bGoQQTyWvbI6/1
 3fvPcVwDbTi3VYQtZ1fXtnc/TwEduux6azPhaREJx2dZcZvVVUn6TSxwb85e96REXrdXwqpiuBT
 73+Cx8J04MprVvpOcbuzIp4QVHoGkSnJBqpNpRG4l7rCmAP33yhzHZhWkA0Om6U3ZnC1erZ0b2L
 hIhMBU0sLvsjAVWTyL5o1fW1HmSXrpc+VnGDAzvHtbpUzITCPIg==
X-Received: by 2002:a05:690c:6182:b0:8a9:a921:13c7 with SMTP id
 00721157ae682-8b07ee5880cmr30824607b3.44.1791800846408; Mon, 12 Oct 2026
 03:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <C38CE953-7A98-42C7-AE35-443BED94674D@archimede-energia.com>
In-Reply-To: <C38CE953-7A98-42C7-AE35-443BED94674D@archimede-energia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Oct 2026 11:27:14 +0100
X-Gm-Features: AclHuK8qEJqKaQPW0mxOYfZgMRkvdQZ65BCP00AZQHP82bo0Kh9kMzPMwOuJeu4
Message-ID: <CAFEAcA8d-jepdKubizqZKXPafY1jbLdbB8YjxcZ9MR38f_zp7A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] STM32F405 timer and RCC fixes
To: Manuele Conti <manuele.conti@archimede-energia.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "farosas@suse.de" <farosas@suse.de>, 
 "lvivier@redhat.com" <lvivier@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Wed, 7 Oct 2026 at 20:38, Manuele Conti
<manuele.conti@archimede-energia.com> wrote:
>
> Hi Peter,
>
> Here is the complete v2 series, resent as fresh emails with both patches
> inline.
>

Thanks. I've applied this to target-arm.next.

Something seems to have gone wrong with the threading on this series:
the individual patches should be followups to the cover letter.
This was OK in the first version of this series, but not for this v2.
I picked the patches up manually, but the threading being wrong
breaks the automated tooling, so you might want to look into that
for next time. git format-patch produces a cover letter and patch
emails that have the right headers to thread together.

thanks
-- PMM

