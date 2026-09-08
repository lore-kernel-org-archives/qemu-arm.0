Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E47C79F99
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 13:10:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3vaz-00077R-D6; Tue, 08 Sep 2026 09:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3vay-00077A-4J
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 09:10:40 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3vaw-00005y-H8
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 09:10:39 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-861145fc841so36976787b3.3
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2026 06:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788873037; cv=none;
 d=google.com; s=arc-20260327;
 b=GIwiotJGISngWiPFLtf5VgJ3jtBF1NtZ7rdQoM7Uc4GRAqtkLJk8SGlTyjzBzXbjBT
 u1gntTE50NNegc0+MJyIsG7ceerwI3Guq8c62FMsT2aZ0E2y+QEV3tS+nAd2tey2Uw+k
 RnAv7rgvaDajKMQBZDHQ+JliVgfh4zG5XsQdtKZy3WMeXq/p7lzgpG3HQ8zujT5UmuhJ
 RoeMLZanVKmLOQfk0Ii98WTU1I9uwhd7EyAokb1EGYVDhkdSMkkaNjekfizrKGyx6hOt
 hTYW+xsbEnqTmm2Q0Ue0NVFm535NM7QQL08NnF7tfgPoxI08yxq8D3L20SN5sryerxwn
 AACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jzq7JG1nyZnFATiQ44B2hcRJMT2iriPWKyEcqp4jvw4=;
 fh=W1iir6WSmiIBpd8jfiYSbC/AM4D8El5Cc7VZ2eUTk7w=;
 b=pn7g72FaycCO5xwVYi72A1WomduhwHn/D6QE0VPvpZ4DV+N3qIKfo1yqdyR09+Vdxw
 8X3W82BOy5qxpRSpf9WgEfwc/PzyMwQZJMEXDSdZaF1SDpyJnF5x70raorYFknr6e2IP
 7Ivpay4iU8SAudiHAu04NsvIyhFvYTIGCQZP3IhIGeiG5nMCuyX6b3sFwjJQYHxGDaeP
 7hFYC5ng0oR5Ag+qHDMbau6Mhp2jP7n/+Aasolxuxw68TnNFtGqbVc69e2XdxRaoQQbP
 h6ygFf4enVXQOnn9X10lei1kSbOMnkAlufWUUL9z9/ZCAmN+ePAXIYd3BtM4JW7Pyy0d
 FEpw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788873037; x=1789477837; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=jzq7JG1nyZnFATiQ44B2hcRJMT2iriPWKyEcqp4jvw4=;
 b=ZFW7Z4rDGRjTbxTFHoZVHfy83RZljzNplRjxZ3lYyG9bVRIZYUDdK6/0wjSjy1y6Xp
 vjo1uzKP6i7AT8pBIQkNJJYnJy7Yu9KBgaaW9GX5hh0l124v5wWZT0PBL2OyFl49mhXS
 zt6zp8a1kdVK/mz7v5UCgO4lmcYbdla2iL+zXUaNSrkvnMP4ZY86GtIHGh+x58cfbi59
 lgeD5LvICYKPfFuGhIaiIFxd1LViaNJb23AYa3bVAdHmFZK+vBD7FBWKwsfTA7wklN2J
 8z+Tmtqj7O9fVAv4AceHvWV4KsHeARN6nltqgrrO2AIeGQR3etbEs7hv1uPUjI+5thji
 9q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788873037; x=1789477837;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=jzq7JG1nyZnFATiQ44B2hcRJMT2iriPWKyEcqp4jvw4=;
 b=BuRVVN+zM66U0Z72KoS6iTM0UySZ5e4S1o7J/FjM2ybP40APTIIljgwNX6z2B7aAl8
 F4zh2K2A/3PNw7P/5D+aifFuMa1AiObdtyLIje4CNEHDIqzsfzwGjXfqyX/ez7Sbyj32
 rdfBKXNU/9UfeVPnStsUKMF/2xVCTfgDk5aVuIFmCZO1pFYn4H7u8iEzC+o/GiCgtmGJ
 98aHzzZP3+dNNLfCPiG3m7p39YY80hCVNfQIKPAYjhT4a5zJkqJeEkHI1ZB14hDS+NjM
 iObS7HTWjCqerdWtVC4Q6tk28I41x8ingm91Am4MTIco9hodWN/ouiIrjpaeO0fAY7uu
 2hSA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwenzMHIsr2MCfBD0AsW7xeBlvMYqYOg6NjdKJ4mNRJEols2YNxsXZSzeiicYo84l7Ow6s1VVkCYA==@nongnu.org
X-Gm-Message-State: AFuF++mXvmkxpxit5XFFzZRaMuHlML2/HUe4vgbaGdGisnU1v375+H89
 kKcUDWRcx3hM4ZGajGQFliF9P8PFfhux5c7xm9TXpNrbdwlVrAolhAZVqJn6DdyiG+GcRth7bKJ
 H57AFQ0kYJs/Z0T4GI7x5qdgMWgf4owb1Geyw++MJKw==
X-Gm-Gg: AYBFou3Svd6HpPk2dDey4pRjFwjhSD/6GxZzcBepo64eeib/Yxm9n4vcQMrt6B6VFx7
 rGbPJeiZfjs3MMYppdItGurQI12oS/wtSw+EO5pxHgz1+ffeHITHynAuAOxp6XF5bnNB82l5f+p
 Amiy504a8oNODP6uSBXuwm9jat1RWpKj5eXP6XAzh5LsHsX7JikAoKocjrYiSddvND2tS/w8Ky7
 ts8f/triEETXMA+CetfR22736P2wCGfNIOTCON3R+gaGVaMJILnWaeEz0DFqMFPc5Aw0+8EHR7X
 oqomBq0h4kDDJEbUhafj2QpU/4Eqckg/v2V85DjJr2mIZKbQiF9LcY8T2yq9lH8VSgg6L75aUbO
 zvrq9P8owS9ZUCko+rZJT9f24jjyo
X-Received: by 2002:a05:690c:89:b0:872:2d6c:9397 with SMTP id
 00721157ae682-8722d6c9c6amr103395627b3.18.1788873037004; Tue, 08 Sep 2026
 06:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260829-allwinner-gpio-v2-0-f0ebcb07302e@gmail.com>
 <20260829-allwinner-gpio-v2-2-f0ebcb07302e@gmail.com>
In-Reply-To: <20260829-allwinner-gpio-v2-2-f0ebcb07302e@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2026 14:10:25 +0100
X-Gm-Features: AcwNN1X5goXjpAWtx2LMNz0RMITNrR0m01e5mPYu2CcG7eVpxMLZMhZbY9rWzQQ
Message-ID: <CAFEAcA_xakujJSnsq=+PhLeWZPKVE=egfDa5xJwKMe9Jp8YyNA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/arm: Add GPIO to Allwinner A10 model
To: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Jack wang <163wangjack@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Sat, 29 Aug 2026 at 13:56, Strahinja Jankovic
<strahinja.p.jankovic@gmail.com> wrote:
>
> The Allwinner A10 GPIO is added to the Allwinner A10
> description, so it is available when Cubieboard is emulated.
>
> Update the documentation for Cubieboard to indicate GPIO availability.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>  docs/system/arm/cubieboard.rst | 1 +
>  hw/arm/Kconfig                 | 1 +
>  hw/arm/allwinner-a10.c         | 8 ++++++++
>  include/hw/arm/allwinner-a10.h | 2 ++
>  4 files changed, 12 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

