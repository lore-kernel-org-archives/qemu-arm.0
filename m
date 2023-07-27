Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1398235ejb;
        Thu, 27 Jul 2023 09:05:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHLbc/46yge+CJYHcvZDLRVXs32zpTacX+mns6j82Vrd5ElqFNJfUu4nUEofGq42N3iJmjR
X-Received: by 2002:a17:90a:a393:b0:262:e598:6046 with SMTP id x19-20020a17090aa39300b00262e5986046mr5388024pjp.28.1690473951307;
        Thu, 27 Jul 2023 09:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690473951; cv=none;
        d=google.com; s=arc-20160816;
        b=ZALZurXoMMSxw2waSrHYB7keQD5tcf6ieyLXGxH31fGAw7rXxWNAcrf7PrDbDPzjHe
         z+HNapUCutX8CEYI1lTDaShYguRG2KsfWG/3vX69y7XOxgX1qEvLpJhVMNMiw1KexqoS
         g6SxsJwzo9x9yd7uVWx+X7s2s2jM/0bZTzbgjqHu4qRDQeTu/aJhjFo/7hBaeGlatU8l
         UmeThe0D856f9nIAFxQGEL9W3qO5P2iwHBf/fCOPBqI9nqKP3F1nuBCHN6nUKwhumD59
         ltA2tm2Y1YNfrfONbGOcmyFjG2JcD5vCv2oaRtzOEMIN8y1cQ8txa2H6jYiMo9Y1z4ig
         FBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=4s3yjcZ2vRVHgzK6hn2+1/dhgBJOv42KtkzRrKRA6Jc=;
        fh=S/Q60tZUkO5gCGP6lro87ssNscMNSvD9vGdsJZ6js8c=;
        b=bJjDBUacgza0T2ojuVc8FUN8seHuPaYj/hhGhmUT908jAWhF+vF4YUAVxy8dO5fiiA
         xqmDaXXC7JOa8+JWSiIO1vg4WxlFrVdzZsZjCmqB8D0kePAaSwnWgIt3kn7juTULPZqu
         dWuldqsEI3H3Lp3ffneJUpuysFENw1quuyxsd0FjWeQnvyKSKTViiOLGFLWDF7wxYHed
         BmqIoJOw3HPC9HlQFm3Dln5luZhQP5vWgbmTbe981JNBsWgiR6mmcTS1SWy0+5OBHTxI
         /hswApt7yWZ1yZKjA1BnzWCWwBX0wuMDuDyv8UipCIZNc+6e7G4Tb4C+QRp4doSd/0px
         NOyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g+qwjQkr;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id d3-20020a17090a7bc300b0026395ce41e2si1563539pjl.37.2023.07.27.09.05.51;
        Thu, 27 Jul 2023 09:05:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g+qwjQkr;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbjG0QFu (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Thu, 27 Jul 2023 12:05:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjG0QFt (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 27 Jul 2023 12:05:49 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931C3BC
        for <kvm@vger.kernel.org>; Thu, 27 Jul 2023 09:05:47 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-307d58b3efbso1146650f8f.0
        for <kvm@vger.kernel.org>; Thu, 27 Jul 2023 09:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690473946; x=1691078746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4s3yjcZ2vRVHgzK6hn2+1/dhgBJOv42KtkzRrKRA6Jc=;
        b=g+qwjQkrRd6H8GH/yQtkVAeVg9zSeDcs1KDcsDXx1k+M9SsY6eoHLRfUeNfnNqqH6Y
         +LRGL9pQpZHkWagkFe6umI8b877GJKXD7Enf0zK+Poe51XHBuaL+sFsQDXTOvvVSBJNP
         4CQtVN7jO8huxd0k8NTXaC9X04HJk0NKMOC3So+kekUX/p3s7C6j02S4k9/J5F18pDl+
         vIjvPd15mYD6BTDNV9YfUVbCUL4sYjNA8gwMw/IE7c/ebyuXtyD3JU7B1e9wmoMJZ+Jq
         s5fsBRasNPgBLCJTJBXP1ZFWmfbTvOi2sBBhFsHbqOA3MAusmroyhrh2SBEw+2BVpqw+
         pSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690473946; x=1691078746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4s3yjcZ2vRVHgzK6hn2+1/dhgBJOv42KtkzRrKRA6Jc=;
        b=IWrDIDCMZscG2HIxbJ4sZbj+Ibnk462cIXDRp+UCqm00j6aWCpjwAjqNfTxS6CFr7H
         /4fFPJm5SiepnDlmvMFr3UwpzyHKIjM0xy7CsZ6OKGPKMC/hxIv6oKrQ6hwjADdwM/SA
         eAHvEmHirFP9O8luIMj4e28BWcrdvfJq7IeFq1G7xqQbfbg6T5O47nrTbQ1jm0lCvx5q
         M4kQZcdeNTUZahJBWmNZ25ZmySY1Li2iWMYS7tQJ3f+UEb33F14qFeVQTDFHZf5lkHfD
         i2EDILwUHRwdyB6ANxt8kGq05l9uEfZFkwuj15YPzf/uiUQjakquj8Ly2jAQSfPvKlFp
         2GBA==
X-Gm-Message-State: ABy/qLaTcPlJ1B4ZpB3sqcNxmz/tQUooq03gdw+eU+Blr+voir2JcWQA
        UZzQCul1s2NXT8tG3iL0rMWMDsv29oQKJm8iyK+jqQ==
X-Received: by 2002:a5d:420b:0:b0:314:3ad6:2327 with SMTP id
 n11-20020a5d420b000000b003143ad62327mr2259572wrq.12.1690473946033; Thu, 27
 Jul 2023 09:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230725150002.621-1-shameerali.kolothum.thodi@huawei.com> <CAFEAcA_3+=m8nt6_eJMiEpxyGcSAXJRC5LWMVvU3f9CHAxKzCw@mail.gmail.com>
In-Reply-To: <CAFEAcA_3+=m8nt6_eJMiEpxyGcSAXJRC5LWMVvU3f9CHAxKzCw@mail.gmail.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 27 Jul 2023 17:05:34 +0100
Message-ID: <CAFEAcA8euHStuwCHVwWC=4=gE91gFrcz4o4sYQDy1X_RW5yv9g@mail.gmail.com>
Subject: Re: [RFC PATCH] arm/kvm: Enable support for KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE
To:     Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, ricarkol@google.com,
        kvm@vger.kernel.org, jonathan.cameron@huawei.com,
        linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: bvzRIDWVhkZp

On Thu, 27 Jul 2023 at 16:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 25 Jul 2023 at 16:01, Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com> wrote:
> > +static bool kvm_arm_eager_split_size_valid(uint64_t req_size, uint32_t sizes)
> > +{
> > +    int i;
> > +
> > +    for (i = 0; i < sizeof(uint32_t) * BITS_PER_BYTE; i++) {
> > +        if (!(sizes & (1 << i))) {
> > +            continue;
> > +        }
> > +
> > +        if (req_size == (1 << i)) {
> > +            return true;
> > +        }
> > +    }
>
> We know req_size is a power of 2 here, so if you also explicitly
> rule out 0 then you can do
>      return sizes & (1 << ctz64(req_size));

Er, that's also over-complicated. Just
   return sizes & req_size;

should do (and catches the 0 case correctly again).

-- PMM
