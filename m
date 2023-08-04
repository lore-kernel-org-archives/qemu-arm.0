Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1909144ejb;
        Fri, 4 Aug 2023 10:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERImTUDddgBz9R69hERLRpNU+MumfArrQ7bkufNk2Ic1h1WPR8JfR59NvqjGVj8PjGqfwy
X-Received: by 2002:a17:906:3298:b0:99c:53f:1dc7 with SMTP id 24-20020a170906329800b0099c053f1dc7mr1932173ejw.54.1691170258503;
        Fri, 04 Aug 2023 10:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691170258; cv=none;
        d=google.com; s=arc-20160816;
        b=unUTjS8mfXX+iVy0PWEXVyPBF+X5QLVERxIdz4GbkxTMepS44+txuBDFhAp6csMpqH
         XfrBikaojFDX8T2bmAmaiZS3YvGMSEV0FXD0v3GJQZZi2X6EFmTXrIHSm+GQPSQJp1Hm
         I3akPSyJf5UvfP0OhEm0Rfq7fJMG0LowHsGMAqeXxBYyNZTGE52ZmZvcfDiMHkH6J8Ln
         vzv2jWXsrgwyHuPDdXhX6CkNumCMizHpGhRPaIYKa5FxdovWviiP2oHcCrVK/X+bLuQ0
         TS8xpED0xec7L+1f+X0CyGcI7xY5kAs2krfp47KIFTpPfRDtDIv+6ZUHwzsG/i94uCZS
         wWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=bOuiU5ZW9zz11e1BN38bNRgIGGHRKtNMy6IPjUjXKW0=;
        fh=XsubhDhda3Jy2jwSl6ul4B/gOYNpncuz9O4UsSnbTZg=;
        b=DSGzo/jxPlyHzHdk0afrT6smi4IAzMvHvsw8C3RfeoTOupIOOAG3e/LZ7mNPVNfbuf
         r2UerF/bS0khT5Nx+v2tCEUeVw3NMbuDMhQE+z0Pi/uM9T8wA7XIVbx1XizxMBe4kpEX
         kfJzMCiO+owI7InN9hZRQEFxK7sNlatOCqieUgTOtdqASTWBNUG+OGnEF+Tae7D0IiC8
         E9EOeeTzIIHNl4Q8jh3/muSXk7DfNatbpWnuivw0xtIIdKcuQK+dyRNSFqQ/AzK8sc5X
         SnvY+awvNCHQBMM/gZqis3N/PHNjN6SE0QXHrdlp0YIZ+X+txN+5x1KzDbCA5XBy0QFx
         yyAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PqvfCAUq;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id o25-20020a1709064f9900b00997d315d050si943418eju.84.2023.08.04.10.30.58;
        Fri, 04 Aug 2023 10:30:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PqvfCAUq;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbjHDRa5 (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Fri, 4 Aug 2023 13:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbjHDRaz (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 4 Aug 2023 13:30:55 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81AA23C25
        for <kvm@vger.kernel.org>; Fri,  4 Aug 2023 10:30:54 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5227e5d9d96so3003044a12.2
        for <kvm@vger.kernel.org>; Fri, 04 Aug 2023 10:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691170253; x=1691775053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bOuiU5ZW9zz11e1BN38bNRgIGGHRKtNMy6IPjUjXKW0=;
        b=PqvfCAUqZ/yw+E8zVoC9Gk9O+qIOI1NY/1YUg20y7OJ4nfTcXt6ycNgcLHla4XleNK
         6m0SrN+hOPreYYRKwR8MHNwrDJonxAmD3JscZ38NCZTsf2FC6uw/K+eFPu5WgEngnXb2
         LaUsnpwLtMoBWUSibkX727TWrarzFFhp8KzKEsIa7XJyRM3O4oLyL1bReyz+FWnVPKed
         IJzF/idyPvgmDiTKQMXWdUHWhE4IdGBj2c3K2iUYO+FppmxZdmVOcl47kulmVYyOgxfx
         /ZPg0GP/Jmw02bMcs8BwUTuQvFSMgCBwyW6euHvpDmhDcLJn22MFeNrhVFEk6VE3o0WX
         P29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691170253; x=1691775053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bOuiU5ZW9zz11e1BN38bNRgIGGHRKtNMy6IPjUjXKW0=;
        b=JIoshftu+AqKFEdpykGoKJi9M2y917zuf3Uv15SCH+X6YlAwaafBA5iwAlwAqfC9OV
         Br0edg9RFSw0mL8eEBA8h8BOC9UVhhNSNSEy03h6sRdtW0en9aaBOfN5QBifpTzzkNEc
         J+8siQUz1kueE0W0AW1cMRD6fFUQw6gRwVX1qXKh/B6l8A8wZ/AL4wQifcM7h9UP6TNA
         9JFKrtI/yQPP7yAPlsFaHTs0QaA+J6PXqwAG7/FU79ACedio3jl1vrPF+dCBcvW9E1cN
         eBohq9HzdaxERnFsVbi/6AEHhys9/tbeKehGSmdS0WSvH9YgUN4kEzWzDU0+ZF/Zs56a
         9jAQ==
X-Gm-Message-State: AOJu0Yxdl9ycLCqpBzHzg0gHUa7bmqWB5QxpsV0r9NrY3eiAbLfRposn
        ByC5KNQJC4bM1rzkNlNJMotwBIs7fq7KZYj8yyPTSUphsiEki07z
X-Received: by 2002:aa7:c1d1:0:b0:522:38f9:4d5b with SMTP id
 d17-20020aa7c1d1000000b0052238f94d5bmr1982492edp.18.1691170252565; Fri, 04
 Aug 2023 10:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230727073134.134102-1-akihiko.odaki@daynix.com> <20230727073134.134102-6-akihiko.odaki@daynix.com>
In-Reply-To: <20230727073134.134102-6-akihiko.odaki@daynix.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 4 Aug 2023 18:30:41 +0100
Message-ID: <CAFEAcA845sHzqVN_cZyvR69uhbfhTqsvWcdM4y9qFTv_pBmtnw@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] accel/kvm: Free as when an error occurred
To:     Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 2vQJSc4FEhQk

On Thu, 27 Jul 2023 at 08:31, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> An error may occur after s->as is allocated, for example while
> determining KVM type.

That's about the one example you don't want to cite, because
it makes it sound like this is only a problem because
of a bug in the previous patch. In fact we already have
lots of 'goto err' paths after the allocation of s->as,
such as the one when kvm_ioctl(KVM_CREATE_VM) fails.

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  accel/kvm/kvm-all.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 94a62efa3c..4591669d78 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2765,6 +2765,7 @@ err:
>      if (s->fd != -1) {
>          close(s->fd);
>      }
> +    g_free(s->as);
>      g_free(s->memory_listener.slots);
>
>      return ret;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
