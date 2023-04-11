Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp553389ejc;
        Tue, 11 Apr 2023 07:42:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZufKsgeqYMXAtVKYe73Lc+G6OdvNb7MgW9tlNYp3lZXz5YPrDbsNY7+k0C9UF+l3anMT1A
X-Received: by 2002:a17:90b:507:b0:246:88c7:4374 with SMTP id r7-20020a17090b050700b0024688c74374mr12049056pjz.34.1681224140605;
        Tue, 11 Apr 2023 07:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681224140; cv=none;
        d=google.com; s=arc-20160816;
        b=fWLKUGpvXDrsP8mVGg7r+0x6VdO62InDShSQ8QJqlPD3aNz5bzXjwct0o3CBP8o0EQ
         fbeq1GItqKfcMmgK9fS6FUW2tUIsCYbmKDQXUrhqUQieTlvEA2QGuZGlf08tpfnBNJRo
         CchvjxEWyI19yNUQCgV9QZy0j3DIb19AmdcgDvcc+jWYIGWdJXwhLYtVFNylMrR8YtLX
         PXVpG/54PymYq8adFvel0fgfbcH1w6g3DVjW0JsDZZOvK3q+zyiS2rFKDhE8Nxqfz7GO
         y//PVTStM5Q1DJ7jy2BFxojOM8rqZqAPO6dJfHyAUqUcwVla/p31VtFi/XvklhkRWdRi
         fNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=9tYSZk5Fru65LRrfi4OzRnhB9ZIK2giLFVk4/qJWImA=;
        b=JyGqTooykclJ7lQdpBZRHWN++RTnpsPG4XPbDK0jCHaCWmzOaAAM3xISqK1iZRtA5z
         WP+11bbsQbsEvc96VJ97F1MgMTqDqd0ZIUpes5HHFn9U0bBJr1sHn9GfeVMjtSfO9Yf1
         DX2Hb+KGG5h+584/BDyzFbqmIm/3EAia9lxU5YY7F5jOgm4X1OmFpCBAVzHcVVLqWxtT
         mhfPba4LuDdfcRWnmeGKDopiJlpmUL1MD/MU41i0p3kotcedBw7FZPQoud/Q7GnQYWXV
         O34hmJDfxy0DVbV0KVcQRjHMf29nqi/2eeUvH68uCxToZlOw8XJNPCchPFnajFRES3bN
         t6sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T+jx+WTw;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id r202-20020a632bd3000000b005144b3c3e50si14148227pgr.68.2023.04.11.07.42.20;
        Tue, 11 Apr 2023 07:42:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T+jx+WTw;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjDKOmT (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Tue, 11 Apr 2023 10:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbjDKOmS (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 11 Apr 2023 10:42:18 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B67FF172A
        for <kvm@vger.kernel.org>; Tue, 11 Apr 2023 07:42:15 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-94a34e3526fso201740266b.3
        for <kvm@vger.kernel.org>; Tue, 11 Apr 2023 07:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681224134; x=1683816134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9tYSZk5Fru65LRrfi4OzRnhB9ZIK2giLFVk4/qJWImA=;
        b=T+jx+WTwC0g+vBbHREBhA2xOIiJV86ufATNu650Y6l6b+rx8vtHkJhw9CJ9EdUG4pQ
         THGoVlE2mDqkCZYBLvqz161+oQxMjSkESZqVYdUUtL8CuRYyeCTWSHttTQ30kh4mFmn6
         qZSEJJ3mkWemH9xpYviiTHSt9+D6tlKSPycapUL4+yCg/I5ty9kqy/xK/+XQYWitj9NV
         +HV3t/WmxHNUpsRLJzUpP5LQj7ylkbGHBqmW+sFiySUz670gZmz0cJWzHzC9f14+nc7E
         m+ekZxDD70P7kx2Cut7MDxCpo/ijrsDfG6qZuDIHzgpZnqbO2G8Lmqbdzm3khHma5kQI
         bCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681224134; x=1683816134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tYSZk5Fru65LRrfi4OzRnhB9ZIK2giLFVk4/qJWImA=;
        b=uEAEHNr2cTevXwFxXslw18Q6JxSfxi4qkOK9cC2cfuVTNHL3PLhrBD9WPnvaNhzD1a
         l5ra36KwSl7hJKC20qLNbpPJyArtCpRLpSm6f0xIl1NI81m7OrE6v3H1VGNQEjZYVCUz
         RrtobjqUJACMfRVM+cq4LPzhtj4wlG+XVxpSzdM6PSeLhrXbmXNvtg/brwRr+hbqScxz
         V2IhUZLovo2t+COUJ3I2k8aCXN6N5ID1HKT9R7I1s0yklba1FggLTSLaW50lwMRJnxsI
         3OCcv5YDgBCBxnPTcF4XnyoGL6XBYBeTwUVWmGeAMWcCvCYVdzFOKWZFMoqAkKjqDos/
         n9KQ==
X-Gm-Message-State: AAQBX9fbKhwKVlPp3O9KFSKvsZ/r74o3187xUSrbld3+9bQah5wRODp/
        ZY7Py745r66fyne0MJXb5wn8Mcu2SsnWmNEsDK0FkA==
X-Received: by 2002:a50:9fe1:0:b0:504:87d8:ac39 with SMTP id
 c88-20020a509fe1000000b0050487d8ac39mr1365390edf.6.1681224134171; Tue, 11 Apr
 2023 07:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230405070244.23464-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230405070244.23464-1-akihiko.odaki@daynix.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 11 Apr 2023 15:42:03 +0100
Message-ID: <CAFEAcA_Ge0HX28qs+08h+k4GBWhNd6367grCdXgPupB46O+aHA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Check if debug is already initialized
To:     Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Nm1+Xt7q992S

On Wed, 5 Apr 2023 at 08:02, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> When virtualizing SMP system, kvm_arm_init_debug() will be called
> multiple times. Check if the debug feature is already initialized when the
> function is called; otherwise it will overwrite pointers to memory
> allocated with the previous call and leak it.
>
> Fixes: e4482ab7e3 ("target-arm: kvm - add support for HW assisted debug")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  target/arm/kvm64.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)

I think I agree with Philippe that the better fix is to call
kvm_arm_init_debug() from kvm_arch_init() -- if we avoid
calling this for each vcpu then we don't have to carefully arrange
to ignore all but the first call. We never actually care about
the CPUState we're passed in, so we could instead pass in the
KVMState directly, which kvm_arch_init() has.

thanks
-- PMM
