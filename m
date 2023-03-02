Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp8378176ejc;
        Thu, 2 Mar 2023 08:00:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+q97hUznbycEm5tohx3Won3f1L8gtK3lkDuQDFJ5rzHDQ+I87v6l+I0vbziBM2XlCfN5O6
X-Received: by 2002:a62:6346:0:b0:5db:c07e:9e4d with SMTP id x67-20020a626346000000b005dbc07e9e4dmr9123776pfb.6.1677772844959;
        Thu, 02 Mar 2023 08:00:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677772844; cv=none;
        d=google.com; s=arc-20160816;
        b=eWHlbHxyrD2bjxEzz74zXYi2EhvmFvE+RNzgclaPRMYPnI0W1rBe96Oqp1KybMGhJ2
         rTV5kWIjtW+7HUo8f3dEkphrT7lQV3b32nGOedsSpTo3EZzCeUvPKyO1qrgRqfqJkOtL
         WCLVccSA4mnqnZmxU9sgzTF49x4t4xpTL8knTOGqoem9KVBD287Xp5UmDSL9mVaJPwGI
         6UxrzVbwYDdg92Kz6UlSCAafy4KK/q1X5m6cNLbAfKQnlSr+5We6I7W0wuohixh85eU6
         nSL5PysnV6ceQaFEt4AOb6sn4vV29+Mhwu/zRTpqCOoJ/DFkIoBO+/ofvYQwKURHkXLk
         P0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=+n7+f74EnVFCcHgcGtgX5vTUUV3I+JQc1+ADtcVp6/U=;
        b=eJy5tcwaDFkoIdburue2w7lTbi9qFjRlw0l/aL/0ePvDOVmUFMviwp7qSLzD+Q7UVx
         ai14pJxy3khymFMyx+hMTrJ3EdfpB8UMTFh2sstPYvUGgopELZ4GsCx8w7jkknnr4mxX
         kOOzXHPkgqzLUOOUxxU6NCPUvkFp2OeBbEoEm5BzB6i71Pj5TMI4WbvdFzkYq4m+nfgM
         rqEFsxR4z7dKQdKT/+46tQ2iXoYMhRL++OTYncqhaa26MJqkHkjFD37GfBmfeTwLJNYL
         ll3TBmwmjCrmM22hbTQf0hTe9r7uKmda1NSf/yj8+xS+77ZjnEuIOouukdmZLM2VENTx
         2rXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HEbbJ8jE;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id b28-20020a62a11c000000b005a8c6714ffesi15067081pff.96.2023.03.02.08.00.44;
        Thu, 02 Mar 2023 08:00:44 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HEbbJ8jE;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjCBQAn (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Thu, 2 Mar 2023 11:00:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjCBQAl (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 2 Mar 2023 11:00:41 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CED4E5CA
        for <kvm@vger.kernel.org>; Thu,  2 Mar 2023 08:00:40 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id b20so10399363pfo.6
        for <kvm@vger.kernel.org>; Thu, 02 Mar 2023 08:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677772840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+n7+f74EnVFCcHgcGtgX5vTUUV3I+JQc1+ADtcVp6/U=;
        b=HEbbJ8jEIaxHHVU/1ku69muhqUjhzqfva6ClGyoPAPPJ3bBgMu+ZAM5VjpeVj0L35i
         typM3nlHCyHHbyE73JuAAix3JMiVQE2TZpvJQpqft31CA6lRQQzf3TXWd3oXaVpwWTNu
         bDKt2FBVxVrdwGQFcmQkSTIpsjyMw++Hz3O0Jfzf7+TAyodureJkx1NKZX/E30Q5H+pB
         gOC80DAjMM6vN8TTXIXa32+YIW0a0C3cwTHJ244us5paBpVvKoAODtiu+jHpxUUcog+I
         /08myzzKe8GSsJCRU+TurrhAdbEmdIyOP3EN+KDiNnGdtbQ6HXL2g2jSW7SmWbDHmLLI
         Mbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677772840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+n7+f74EnVFCcHgcGtgX5vTUUV3I+JQc1+ADtcVp6/U=;
        b=LlPdfiP6exh6nbX6v0faKa7PUlJ3DEgw1isw0PoycmIcSDr6tjWZbAcJvcVQI4yKnq
         HJ2NoNVqABxoV92Dxb+pq4mMNRP1b4v3hQKyah80tk0A4k5TWXi65zxtdYyfYR+TYQ0E
         /MIHgaycDalRGc+NoDr1IfXFG6vU+nnOmHjuckBCLMTOVyLP4yEWppBz+4hAEdL50L7N
         jXQfMbJpkQMzFZSGjER+FFpUzTU4/kw5QWG7/XTt9kEsSSpy9LDBvUZvPb2X3/iQTuK4
         E92yGH5fD+RuP36QpTd4qACw/yJ5u2oHP4hsDbl4FX6OeVCOke8mwiKYhPhYu8+ChvNl
         NOBg==
X-Gm-Message-State: AO0yUKUhQ7lw/UY0tRBfX1XW+/8wOKlWo/NHhUEd17c0OwiVWXkbPx4g
        ZVJHAQyLPhMI6oL3JdOFd7cP5CRbpAdXOa/1wbYKSg==
X-Received: by 2002:a63:3347:0:b0:503:7cc9:3f8d with SMTP id
 z68-20020a633347000000b005037cc93f8dmr3395682pgz.9.1677772840177; Thu, 02 Mar
 2023 08:00:40 -0800 (PST)
MIME-Version: 1.0
References: <20230228150216.77912-1-cohuck@redhat.com> <20230228150216.77912-2-cohuck@redhat.com>
 <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
 <874jr4dbcr.fsf@redhat.com> <CABJz62MQH2U1QM26PcC3F1cy7t=53_mxkgViLKjcUMVmi29w+Q@mail.gmail.com>
 <87sfeoblsa.fsf@redhat.com> <CAFEAcA8z9mS55oBySDYA6PHB=qcRQRH1Aa4WJidG8B=n+6CyEQ@mail.gmail.com>
 <87cz5rmdlg.fsf@redhat.com>
In-Reply-To: <87cz5rmdlg.fsf@redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 2 Mar 2023 16:00:28 +0000
Message-ID: <CAFEAcA-Q6hzgW-B52X5XEtZsvBX64qSr9wSKizLVYu58mPdXKw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
To:     Cornelia Huck <cohuck@redhat.com>
Cc:     Andrea Bolognani <abologna@redhat.com>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Eric Auger <eauger@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Juan Quintela <quintela@redhat.com>,
        Gavin Shan <gshan@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: AdrWHTubK66Z

On Thu, 2 Mar 2023 at 14:29, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Thu, Mar 02 2023, Peter Maydell <peter.maydell@linaro.org> wrote:
> > I think having MTE in the specific case of KVM behave differently
> > to how we've done all these existing properties and how we've
> > done MTE for TCG would be confusing. The simplest thing is to just
> > follow the existing UI for TCG MTE.
> >
> > The underlying reason for this is that MTE in general is not a feature
> > only of the CPU, but also of the whole system design. It happens
> > that KVM gives us tagged RAM "for free" but that's an oddity
> > of the KVM implementation -- in real hardware there needs to
> > be system level support for tagging.
>
> Hm... the Linux kernel actually seems to consider MTE to be a cpu
> feature (at least, it lists it in the cpu features).
>
> So, is your suggestion to use the 'mte' prop of the virt machine to mean
> "enable all prereqs for MTE, i.e. allocate tag memory for TCG and enable
> MTE in the kernel for KVM"? For TCG, we'll get MTE for the max cpu
> model; for KVM, we'd get MTE for host (== max), but I'm wondering what
> should happen if we get named cpu models and the user specifies one
> where we won't have MTE (i.e. some pre-8.5 one)?

I think we can probably cross that bridge when we get to it,
but I imagine the semantics would be "cortex-foo plus MTE"
(in the same way that -cpu cortex-foo,+x,-y can add and
subtract features from a baseline).

thanks
-- PMM
