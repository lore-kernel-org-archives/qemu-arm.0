Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4655DCD98CF
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 15:13:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ8zh-0007o8-Rb; Mon, 15 Jun 2026 11:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ8zg-0007n9-3J
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 11:12:56 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ8zd-0003pv-5N
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 11:12:55 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-6626cd98209so3499349d50.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 08:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781536372; cv=none;
 d=google.com; s=arc-20240605;
 b=LdbbXu4IqUJCfkpifjaKq9pcpMj2JAye5x+MM2AqEyHJlLcOqLOqjH/XOV3iRNBMKi
 Bck0yfzSwgPLTcndi+UO2G5U+/a3xRfjsqZRk6GoNco22gEl4WFhAvsNiLuCTVIvGoKP
 rww7ffb/ZICK0OxsC8FQWz5DXljp+/xjWmiZaiADfqDvxcPbUG2o1Brn8m8hVUhYtPiU
 qE1zi6TH344He3TINzpnC5y3tZB4sLjEeojZL8C0qDTuie//vnT6jdihUijLZ3tv17XR
 HDqNOx3FcUAwb0SP1mZ5iZ42w1+lOC7TYE6mmLFfJlvuFsXWxAqXV0Q6WOfLH28/zE/Q
 GLyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UMXWJ2+3cc1wAiWWyN1hPgsu3EPzkzH6hh+ksPb3bwQ=;
 fh=y39BOy2ErTWwg6QpA4YHypnngcKBbY8qVk4/yPbgKBE=;
 b=fZuZNqe85xJqOBt188jxz0GeTGvMmzsWUn2fBFQ4AhYo+mR0eGPnK8XlWYFyXZW2rM
 Cfgbt729UkI4Gcz/lZRS5Vn4yJxMUz44RRRDBHunfXL26GuMgzqKfj1u5fH9aWcT6yPS
 /GEPnBH5UTdwJ7uT6cdZIiJ5VkBqWShH0VXwEbIJxuGVretlAQDoeaD7I3G3xd8EwqZu
 FlhVng/TKmSm2aI6HNRgIPxBUJZT/S4CVQKSn/sYYMUORHxOWbonqhjuFN1hjbaoOYvR
 rf7nCbIJzOmXWWxGg7pJXQAJUHv08auVo70csfJhySZ28RDUn8hSVMFWj9guCd6Fi02e
 YGFA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781536372; x=1782141172; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UMXWJ2+3cc1wAiWWyN1hPgsu3EPzkzH6hh+ksPb3bwQ=;
 b=LxLqj4uNEzcNfUEUhicoIKTmERcNQR8JS2vtVdg9DZoP1S+EYdeypXW609jfZrbSGP
 4VYKPnjnLjuVtDga+yAy13M8cov9+juEnlSSabUDxeiMdNfCWxJ6Rnstq8sKiyECrxEg
 PBixvt4AtJLYrfWMwhARyzj52FLKUNLUlXwYqCLk1BVaf1Zjqv7AxiTFzU9AfrPPQ6Z2
 yin1hQhixWB+wenII/JW0KNpC9xxGyLbZZBKCQ9nf/9jaQQcy36PvTOHHPkjB09W80ul
 B6dx8oqaJsly9WilS14snRCU+H1FdSSiCzOgsLbupzLR65Xfj3MmT3NC7JDdQvrK5Ywx
 KF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781536372; x=1782141172;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UMXWJ2+3cc1wAiWWyN1hPgsu3EPzkzH6hh+ksPb3bwQ=;
 b=Qw4nsHd0OGk/EuRI9DVRUaTfEhVZ+JsoFouZYaQta/9V6kryh0A6/V7gjms1ejP/+V
 0iJAnWkSX/e8QnUn7gLetBVhxcOr3xc8U9gdwyeipqiWvCde9339ZSMCuKyMSgVnAE9f
 Z7usZo6VtLJVyoqD6uvFPOc+TAIUvFsow26f+WwMsxliJdifkjCX1RYrHZrKItsVaW50
 MWm0Rvzcvd8qo9iLhCjezvsfhNaVXOiWVIL0dXelT6bwNLb2yJV4DDH+SHZBw/EjNRaZ
 IFhduXKMmAKSwcF0b/RQGt2cokyYwDGjW2ASFsCdR4lzo6cJeTGgZMJXY7u6EjiY4iht
 vLHw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9l9xddYNbylE9wYqUOhUBIhAHwFKiVG2aoQGb9gyB9GUTJJWK/DuNtjEwPEjItuwzDGchF78ajGg==@nongnu.org
X-Gm-Message-State: AOJu0YxLPRg6Em5VNAxxSnyg0NEuUBL3rf9rRsacRClVMjf/KsM9uICp
 ELTXZbGqC+ediYvbrC8Zlstw56Wlfmh6E+k/21GvhaGnlztQV5aib8gdRyuRgsC/1j09gjY1X2D
 G5LeJ4K4SBe+Pc1QND2h5opZ/9PI4Jd2ys9mSP3+lSA==
X-Gm-Gg: Acq92OEvaIWVrMktkpdy6br4io9M1naxfD6HSCRK4KrhE5R7fb4wM+XR2aXLFhb3s5w
 b3GQSuGDGMk/jiGVPWKv3x4mLe8p9W/VRuf6XfB2BUbiOedYpAZMxJz47BojqMSgxIaxSBW3NdC
 jYFSTK8vA2pVQ3ecQFuj/lU4GViy6sjZVLIMLi14leNR50C03ewAh7VU52tYDRFqZJEZjxNQ4l8
 QXT4mf07P14NRauie30qpP569ah3ST/t4nFcn3RgzkZvlA6lC5RF2Q4e18hYLLhdv8DduaZjPTj
 O6WqpLpVeGQaRKqcVGBuyNNn4pdTqEdjW1rIDFEXeqGPuKAhFUmp4ebA6862heoaIN4=
X-Received: by 2002:a05:690e:168a:b0:660:31bd:3c5d with SMTP id
 956f58d0204a3-66278127b80mr12762789d50.29.1781536371644; Mon, 15 Jun 2026
 08:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
 <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
 <20260615105556-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260615105556-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2026 16:12:40 +0100
X-Gm-Features: AVVi8CeG4_zk7zZB_1rlayRwtBBOUzxEDrTg-LgMb3yOrLiHP91Gzr_RzPZ2iGs
Message-ID: <CAFEAcA9Gi43qNZoZcGtq8ioffGwOc_XuhoFAjGx7-bt4U8qfxw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 peterx@redhat.com, alex@shazbot.org, richard.henderson@linaro.org, 
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com, 
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com, 
 jugraham@redhat.com, liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, 
 shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Mon, 15 Jun 2026 at 15:56, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Jun 15, 2026 at 11:57:09AM +0100, Peter Maydell wrote:
> > On Mon, 15 Jun 2026 at 11:03, Gavin Shan <gshan@redhat.com> wrote:
> > >
> > > All ram device regions were turned to be indirectly accessible by commit
> > > 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> > > to guest hang on attempt to build 'cuda-samples' as reported by Julia. The
> > > guest is started by the following command lines, with GH100 GPU card passed
> > > from the host.
> >
> > > diff --git a/include/system/memory.h b/include/system/memory.h
> > > index 1417132f6d..5878727d09 100644
> > > --- a/include/system/memory.h
> > > +++ b/include/system/memory.h
> > > @@ -2897,6 +2897,8 @@ void address_space_register_map_client(AddressSpace *as, QEMUBH *bh);
> > >  void address_space_unregister_map_client(AddressSpace *as, QEMUBH *bh);
> > >
> > >  /* Internal functions, part of the implementation of address_space_read.  */
> > > +void qemu_ram_copy(void *dest, const void *src, size_t n);
> > > +void qemu_ram_move(void *dest, const void *src, size_t n);
> >
> > New function prototypes in include headers need documentation comments.
> >
> > In particular for these, it's really important that we clearly say
> > what semantics we are attempting to provide with them, so that
> > (a) when we're reviewing or later updating the implementation we
> > know what we are trying to provide
> > (b) when we're looking at the callsites we know what the function
> > is guaranteeing to us and what it is not, and thus whether it's
> > OK to use it or we need something els.
> >
> > > +#if defined(__i386__) || defined(__x86_64__)
> > > +#define HOST_UNALIGNED_MMIO_OK 1
> > > +#else
> > > +#define HOST_UNALIGNED_MMIO_OK 0
> > > +#endif
> >
> > We need to do something better than this. We can't
> > just say "oh, we trust that on x86 this works": it is
> > neither actually true that the compiler guarantees it
>
> sorry guarantee what?

Well, that's part of my point about "we need a doc comment":
what exactly are we trying to guarantee ? But whatever it is,
"hardcoded ifdef that privileges x86" is definitely the wrong
answer.

-- PMM

