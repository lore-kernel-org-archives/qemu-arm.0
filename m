Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE99FCA6012
	for <qemu-arm@archiver.kernel.org>; Fri,  9 Oct 2026 08:14:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xF5k8-0007iz-A9; Fri, 09 Oct 2026 04:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xF5jh-0007gb-ND
 for qemu-arm@nongnu.org; Fri, 09 Oct 2026 04:13:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xF5jf-00047Y-2o
 for qemu-arm@nongnu.org; Fri, 09 Oct 2026 04:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791533625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=41gQb0etbYvNz0VPnWEcsAX1WcPaermMt2xzNHfKl4A=;
 b=EpeEZhyszI2jwODF28IdrgVScmZToSgCzX0tl/B9L7shiieFujnIkWdmL8WXDJTcDoe/EY
 CveC15H+0XhlRRUBVsn/Dbg8KFcVwP0oNJiB22zIyJRLfsLl1baw21TvFYtFqb9cHMEJAd
 o2IdVlnXfW2+mOQALJd0uxtrfNiEv3s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-uabKIpE_P4Wjuj4vQbfRug-1; Fri, 9 Oct 2026 08:13:44 +0000
X-MC-Unique: uabKIpE_P4Wjuj4vQbfRug-1
X-Mimecast-MFC-AGG-ID: uabKIpE_P4Wjuj4vQbfRug_1791533623
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4a020cf06c3so35517655e9.3
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2026 01:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791533623; x=1792138423;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=41gQb0etbYvNz0VPnWEcsAX1WcPaermMt2xzNHfKl4A=;
 b=RIwev4RmYHGMdIqVSH55oLLw7n/p3htqVpkHXSCJ4KJYtYxAuLvcwKAhA4E29ac2EN
 YV+TI8ldcMGpHdn1WBMzSM/2ZO+iQPSTeHnOmtLvt4L6zxgMgxTQWu+u3FGumc7qbY9u
 5sXc9H0pl68Ggg/e+OPnrFJVALQGvg+qKy/YBd3Hcg2WJnhbgkBKjvJyZZvCW0+1iBBT
 /qyl2sr/vVsA3N7KIkPOewCd59Om6EF8690O+xpI62JBvXeNRx2pIlPSc0y+Qu1lvQ8B
 apG48VaRlHYuo8cHnysjjU3/h0deg8VYtB/4DwFL69v2U1vN5AfPfXzw9fz8y0R6Obyb
 eZOg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxm+EuEqLbIagNcftWQVLsJxM+KTpIDW20F9Pz4zvYDAhwqsllOhbE1EaGSSgZ3y5m9gBvP2elY2Q==@nongnu.org
X-Gm-Message-State: AFuF++loMlFRykX0RsjXbue+t4eZPEg/FQ3fzuGAtamG+/485+SYobd9
 tXBqtGIP1mgWZ/mfHPuUCzTqIZtBh4o8WXUCs19sbqCFGwZ0EyYaOGSFDPkozW2+GY4z9W+jDj3
 4URlP7z/bfBRJ6SjGdchREN8XhANeTmUgH2AIw+9LMTuJGKPArQxAeA==
X-Gm-Gg: AYBFou1ahTsqUHjp5cRU0F2/xtICbY8lvct9k3jFJpy8Iqr9MpZ9tBCrLfjZRu9iNXR
 +3v5C2q7U2gJwlv4NPSXhDzCYLSyT64yUXskAHUgWJ7V3Bk8V36Ax0vn8r2KccS0neDAgiFYCZY
 r0nL6H19fTSf4X/d8Jj+QQ6Nfso4Uuz5P2cJ90rhInhRevaTnt7jtuA4dRJfOEuqIN1WOErbASc
 1UNnJ15cPkTDbJn9m7CleTCDZGZ7B7KfTXf81PRP1cp4eGxMLodJMsXnUweMD0eC9mMfBKU/+ta
 UT/LTGN4JYSgMdRhbFVbqCBra+vjIQQrEYttEaK91R7sg3rsNCp/thuv4w==
X-Received: by 2002:a05:600c:810a:b0:4a0:2391:6533 with SMTP id
 5b1f17b1804b1-4a18e4a954bmr15620485e9.21.1791533623287; 
 Fri, 09 Oct 2026 01:13:43 -0700 (PDT)
X-Received: by 2002:a05:600c:810a:b0:4a0:2391:6533 with SMTP id
 5b1f17b1804b1-4a18e4a954bmr15619905e9.21.1791533622596; 
 Fri, 09 Oct 2026 01:13:42 -0700 (PDT)
Received: from x1 ([151.67.89.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18dd7a3e2sm35001475e9.0.2026.10.09.01.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 01:13:42 -0700 (PDT)
Date: Fri, 9 Oct 2026 10:13:39 +0200
From: Gustavo Romero <gromero@redhat.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Will Deacon <will@kernel.org>, Itaru Kitayama <itaru.kitayama@linux.dev>
Subject: Re: [PATCH v2 3/3] tests/tcg/aarch64: Add a test for the 52-bit TTBR
 base address layout
Message-ID: <v3hmpi7kjifsrwxbznkqy2zrbi2i2hizrnia4bozu26f5my2xd@it654s63rz2t>
References: <20261007080019.350315-1-fuad.tabba@linux.dev>
 <20261007080019.350315-4-fuad.tabba@linux.dev>
 <4ajscli4c4ef7agtizxzdiopjseck5qwa6s4n4mmwwjdrqlnby@xit5l76dxm2w>
 <CA+EHjTxsC8K1Bw6fAMs6APaqVDpup8192dCeJs+vfeh2fN+6Aw@mail.gmail.com>
 <3dqmrslvb3zrr3ndzmcmy2tv5vqovntordzdjqkp2vn2deklua@qkcedhe4owgv>
 <CA+EHjTwnpaFRFEzT8N34=t6JzKn+x=a6GUqa1U6vH2e+vW6C8g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+EHjTwnpaFRFEzT8N34=t6JzKn+x=a6GUqa1U6vH2e+vW6C8g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gzJMp-_jPPIlb8GKZE5haZZsHmtyu55EQSE4-EWCjN0_1791533623
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gromero@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Faud,

On Thu, Oct 08, 2026 at 07:01:41PM +0100, Fuad Tabba wrote:
> Hi Gustavo,
> 
> On Thu, 08 Oct 2026 17:40:27 +0100, Gustavo Romero <gromero@redhat.com> wrote:
> [...]
> > RAM_BASE is precisely defined as 1 << 30 because the way we link the tests based
> > on the memory layout defined in tests/tcg/aarch64/system/kernel.ld, right?
> 
> Yes. The tables are static, so they're linked a few MB above RAM_BASE,
> inside the blocks both stages map at RAM_BASE (and stage 2 again at
> HIGH_IPA | RAM_BASE).
> 
> > That's the bit that also confused me, like, how Stage 2 entries:
> >
> > s2_l2[RAM_BASE >> 29] = RAM_BASE | S2_BLOCK;
> > s2_l2_high[RAM_BASE >> 29] = RAM_BASE | S2_BLOCK
> >
> > are taking us back to s1_l0. How s1_l0 ends up related to RAM_BASE :)
> >
> > Hence, I think it's worth mentioning that relationship also in this text. How
> > about something like:
> >
> > "RAM_BASE is chosen to match the memory layout defined in kernel.ld. As a
> > result, s1_l0 resides at an offset from RAM_BASE after linking."
> >
> > Wdyt?
> 
> Agree. The stage 1 and VTCR.DS stage 2 mappings depend on it too, so
> I've put it on the RAM_BASE define for v3 rather than in that comment:
> 
>         /*
>          * kernel.ld links the test at 1GB, so the tables below lie within the
>          * blocks mapped at RAM_BASE.
>          */
>         #define RAM_BASE    0x40000000UL

Excellent. Thank you.


Cheers,
Gustavo


