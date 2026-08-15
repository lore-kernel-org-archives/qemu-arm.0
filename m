Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5617AC5AD5A
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 15:08:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvFzx-0003PG-Nw; Sat, 15 Aug 2026 11:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvFzv-0003Ok-Tw
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 11:08:36 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvFzu-0003NO-6V
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 11:08:35 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-81dfdbd86d1so18552197b3.1
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 08:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786806513; cv=none;
 d=google.com; s=arc-20260327;
 b=M7KcxrChvpDuZQgw9MT5eTukmXZbVN/J03iui6oV2c1lBbobCPa/cXukyFYYt/+x7K
 nbja21YJGW2Zvuo0u6r9mztvUds/GwDYjqpjjddQpcxGk3bh4H3UeQI2l5n9r139AxH3
 wtPAWj8rYFBc1FFhblNWhO/TI6wF1z+S3nTFz+gxu6iB9OhuH5dgO+LYG47vCOO6SqUN
 9mYU3C255CZoEPpsuU5sk2GdDqbp7wGS1+WzF/j+WxNMisq8PtSmeJe13P0rvWvx2Z5t
 LIxUchj5+y+nkSqb2lj2JRAb/ZgwchyPd1CqOJ5S/uyGYplZbP7mHmz7dEUG4Gv5CqLR
 gkQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+zMVMJQSl0cbPJej/Ayy7qOsUldZf4RWw5DuYAFtpZo=;
 fh=5JoV6Ktxxdhg8AP3qQxIks+K3xmrnhjbjXteaYPRN+8=;
 b=A7f4mvCcny9UZ2i+YcU8rJy2+DikOST5wmsG3zE7redVOF+J4FiRhqQEhyWLu1PuFA
 Z2ZNKrQy+14a3uIVapWQ0GICrw0BDPOc39EQxfab/CkrDUeLjx+zNuwibLYDDMZWcQL9
 iyke3CT5esVyJ+Xrk0hflK3TOmeCPLXaq3BZRgnCK7thk2lr7WjRUCrg9V95hwFofHKr
 uzLBbn98WIX/wu7VOPl0y3/urbosghd5ciZE1K++sUymXHgp7WNiLmhzN90fwhExSHw6
 HKGAY6/fhY0lL6dGZvW+tx33fUIzki3UVtD5Td5WhIL04jjtdR5iOMoRilEcfEljdQuD
 eATg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786806513; x=1787411313; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+zMVMJQSl0cbPJej/Ayy7qOsUldZf4RWw5DuYAFtpZo=;
 b=uP5AHW+t4BnSKYEYEL8YjfiHvaGfU/bYk0DTni1+MaJr8hWG57VAD3JC9ycxDZaLzM
 ZpEGDx+umaBQQ1jzR/NyeR5a47uNw+bCsJdfV351wjJasUxBDMIaiaLZ4j9fX5OI0uaL
 PV14C6QDrZijJkfYFqfGBa6T3vbdcWwaBUI31ZkzZZsYqaTtnvm/Ki2LgKXrzA8bxVnR
 FigCj7itdWS1/vF5kSLAGfSkZXm7uxA1MfkBQ0jFzTtcJ9xJt+uiJZiZbtJKlBQzYnD6
 BmJOOwdahh+eeve4V0c8TykkjdrI8fWVgJ/uf63oJHaMBxO/QDwEriIuDOwCMlP0m+jQ
 kqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786806513; x=1787411313;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+zMVMJQSl0cbPJej/Ayy7qOsUldZf4RWw5DuYAFtpZo=;
 b=BhWNki095dJM5GhPVFlv8RjtvgycPp4XGKAMy8hQbop0/JgLP0PCEfFq6Y85JAZJ0M
 +oZV1xdc12zmkyVA1bKRf+SMOJne9Xumn+FUlK3/8oT8sLSCGTHGYyng+iLxh9YtPuZQ
 eZOM/cyK7jgk4Sn3Gxws5lLqqCRTnDMu+4zT9ifph5HAzFG3ttZrAZeJiBo10IuwdYWt
 XXlPXx6PLZBcH1ird2z7OzfW9S+AtAszYjflpRcOKd8a4ShfNj7pdhztLdIwT3wM0YpX
 6bcQhuBBPBl/j0hGVQ9XRJXurVBkZRJm8xXFNE1DE5bYi+ZiicCn3Ax1upHvf95fqGBJ
 pTRw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpxv81lFb4Kkba+f4/g2WudWh909L5PFiLmzRzj05q6ramDLYm0iFbdAk50UKXP9o5x35oTL6LVBg==@nongnu.org
X-Gm-Message-State: AOJu0Yxh7x8hZg5oC98WDLrUKzBY5114AMvkyv1X7fSnAay0iLxyymfP
 1kmZhGX7T/KpYU5P+IjLgGU5OreM/4AUhY19bR5DVDXsRpMr9fgCj7tDHwiPrduVXjaQLvA5/Lm
 19pW9LYC+sjICquY1xAraDmE4DH35qNdnREBriSOqhQ==
X-Gm-Gg: AR+sD12J6jdZLy3QdJRTV6eT2kBoM9+Z/+QUeRiOnslQv2AlXJv0MHVWOhuy9gO101f
 K6+0k0fh76/4ejke3fw/EJEeUph0sj+YpYJaR8tTfXyP4Bh4Q+CwJc+RZs6VmJPvDRWz04DQJlp
 iYAVXvnJl4luna2Tu3yWcx0BDvMwsEEwSZYCunqJWtmovboi5Q6nmGww7NX3PsPlSauXkvQnhoe
 6MJwzkleOlByhi1p9JYuAS14DabSgqFpqzrSXw6OSCg7zJr0pYB+/EWXme/P2eS7k8zAncddMnc
 DVPH0LMb4PX9mnMQj2i7M6fsj89omxI8sK7zZXANz5Bne/w0/vjikZmyl6HIIMLsbd6/GQtn560
 qesU0U0jC4NUgqFkAXmeMTm27sPHi
X-Received: by 2002:a05:690c:6011:b0:81c:b865:2231 with SMTP id
 00721157ae682-837147034a0mr47795037b3.33.1786806513045; Sat, 15 Aug 2026
 08:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260814080507.23196-1-philmd@oss.qualcomm.com>
In-Reply-To: <20260814080507.23196-1-philmd@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 15 Aug 2026 16:08:21 +0100
X-Gm-Features: AcwNN1WMPQeuRss8g5pFgMUg0gWMBI4d9Q7vM1fdFl5e6hqNv0RvcbzzdEqHB2o
Message-ID: <CAFEAcA9mO7R7ujwiv3CXOKqcVwtU3KoJ-i=EkawaGLUYUmvhqA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Restrict arm_do_plugin_vcpu_discon_cb() to TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Fri, 14 Aug 2026 at 09:05, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> So far TCG plugins can only be used when TCG is available.
> Move the arm_do_plugin_vcpu_discon_cb() call within the
> 'if tcg_enabled' block and wrap the definition with #ifdef'ry.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Applied to target-arm.next, thanks.

Does this fix any user-facing issue, or is it just something
we need to sort out for hybrid acceleration ?

-- PMM

