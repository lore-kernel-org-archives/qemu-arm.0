Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85244C54FD2
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Jul 2026 09:24:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpN0S-0000vH-OC; Thu, 30 Jul 2026 05:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpN0R-0000uT-2Y
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 05:24:47 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpN0P-0003hr-HY
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 05:24:46 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-6680ae2031fso1771679d50.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 02:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785403484; cv=none;
 d=google.com; s=arc-20260327;
 b=bH+8M6QzI0pPy2yW9e3MKtLaZ5nVSCPAT40rVJWYZBQy9Vpfe/7N6Yreb+vmRp9hKO
 l5LF3Ly9ofk2uhSEaxT9eKVXJ9I65c10FCeDYRTtchZ9Y0+bm2O2raVSt0/deH2H9MWI
 5nuW95ba2q/QHgXhyJkqIlqxCoNTRmKVQZLXZgJfz+jqnQJpyLajlkywKloQx6JGIlE/
 Y30zhzmA/Lx5IB8D8+9tZFNz/sksb8slbJy2zgW6aGjvprvVx8FiNfg9/0I2Sdav4Lha
 YaHrbGpbVy60WcwuFHRQaCVb+vFA2/RWsAp8zYseq7uxVSvMEWyZ3OetFV0NjZEaA15c
 Oncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6DRPUvtZTmyt9EyX1NZslCd061ZF3H56Y2s2i0RY+cE=;
 fh=vVreSTLlX+2kDzrDA5DrA1vUBgUTraTwDh9SaEk7KVo=;
 b=ZGJjCrMviHHeQMFeLHpu6frWcbxJiJoFlmUftZhK9mEh3q/46nZxmwcDETYTOmrd5a
 vbg465Ko/oFPyTCPY/wfzvn6mKDZGFrqNPZodN+CDpuQ3X4SpVu0qIcpoUESJWe77oNA
 AFCZt7gJZjhctKr62y5GxCVqpk9Ikj0Gd97sa+UTkvQpl3dy/jnxoi3ZWE2LzraMsPlw
 wsxMcEZZdAGlUpivugGK/x+XvyRwhMXFt0KZIPuZXKqkBMm5JjeYcFUnZaCif/bKL2Pv
 fA2WQnceW++llMtalpE0IA5dMJS+jbV952D6jU2ISBrsLyNURpxKjOY0w/dEkobjkxIG
 BL+g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785403484; x=1786008284; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=6DRPUvtZTmyt9EyX1NZslCd061ZF3H56Y2s2i0RY+cE=;
 b=PvwboktIVJIJnEp8NGbOfyvGHi3zykoumVJaU1ADVi0k82U3Zn17BhAJR2hF7VLUgs
 bm27nA+yJrFLdVx6HbgXDwGRqSCInqBZk4GpZh2Buz+o6KgjbhFj1vxlzu5/CcsYa9Ha
 t8zrZQwPjodWxNzvmUOr68CsBl3N8NzIsIV/LvCPlvEQNBJueLGCLJAOXW9q7K8t97Ih
 DD8EKUckMrsQ+toKFixcKN8sF2MZJ6YXoveMic4KwsYwFf/mxr1kdrsfoU+31QnpYaCY
 x+E8TP5OUCqw4YFQwPoLIRFkoPAtnRc2NG1SFvJxTF1fSAigPbPwxm+1hWVrf4gJuJ7P
 f2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785403484; x=1786008284;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6DRPUvtZTmyt9EyX1NZslCd061ZF3H56Y2s2i0RY+cE=;
 b=SEbHaMDuij93esEX+3F47q85BctxMZr7zfKVvtBiKRgNkPzJAV842X07aXqQ9ttbt/
 9+DM5FW44pAKs7zjGc9TSHuJ2cdM4CMlCCglwEOTUKdV7C/VsM2l4N/Ij3ep9Qnr+62/
 frhHg/g6nixP5IUqOHtB25Hhzu68r5p6OvRDjOZhYvwPVkWPhi6NjAdC+DUZ6+71QV/J
 MldVWDI11UQnlnudaHFSPC2bwP7XvkQ5gdPcJ4mpsPJfZSh1BKVA8eIkrHA8nbMSFLSO
 6imbsvJwzuASb6BctcMebUZn0YT0/9TdolZZYHmHK/d0hdSuXBxJyO0qeekPVDdJUEH+
 4qFQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqhnUrQQHoiWTyjuTVkEZ4tvWGFyTyRbAJDLmYTWVedVrnuI6mgSRNODvNAsOrJr4/BnRmXfowJ1w==@nongnu.org
X-Gm-Message-State: AOJu0YxUGsgAQ6vgIr91E0e9rze9kI11r7pX/mFGsUzNvcHdca2jjaSG
 7SK7oPHharRwl1EZbnbSA97ApWeWLOd4l2RMi4KY7x0BoqZfyvX8itVxhxvXR4mI7pitrrKhTnX
 ED72Z8BlUxcwzzO+j8Mgd48XJh72xbx8yalyo3Yheig==
X-Gm-Gg: AR+sD13mEsy8RCWbPetO04Dwgpk64j9DQn4Mk9PKTka17FLQv9N11HAaBOV5hSPdE3w
 0HXx24goUZyvebw36OY6jorNY+Gj0ugYxKuZI93H5S7UB7w0b1uK0fQ4KKVimQfWpELg01rwlB+
 q2K5l8Ac5ilvKYEAMZ2/e08Y7PiIWwjYCDVHTFwO4Y8e1QS5i+l90Q2QLU445W3kUlMHZZZuuAv
 CPmWxWIBetMm+I27BQicX9UrG9MwGnU6/Y1AEkn6RdhdsLOW5xtZGDk64bB/EAxvqh2uu0bxaLI
 Na0fjS344g/Amm1ZHEmptLcc07KB0y2ovDubxiS9GWJ+bwNKhb7SJn9GKmoVZ4E7XFsZF7BDFmB
 qgn75J2gFs7jQKPTpQWiMXP9lWrRHtb1d4pCzd7U=
X-Received: by 2002:a05:690e:23d8:b0:668:9e51:5239 with SMTP id
 956f58d0204a3-6692f635433mr875554d50.44.1785403483884; Thu, 30 Jul 2026
 02:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260728031731.286666-1-gshan@redhat.com>
 <20260728031731.286666-3-gshan@redhat.com>
 <20260729182316-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260729182316-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2026 10:24:32 +0100
X-Gm-Features: AUfX_mxT43uM4P_x5i7ErKMK1RbVsZJEwZ-hb_VUMJvYXOLsfxF40TT3khzneWg
Message-ID: <CAFEAcA8nxsXNPuqOoc4DGnHbCKQ-pBJib4JhXnYkzMg79GMfAA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] system/memory: Use qemu_ram_move() for directly
 accessible regions
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 peterx@redhat.com, philmd@oss.qualcomm.com, richard.henderson@linaro.org, 
 alex@shazbot.org, berrange@redhat.com, philmd@mailo.com, david@kernel.org, 
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, 
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Wed, 29 Jul 2026 at 23:35, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Jul 28, 2026 at 01:17:30PM +1000, Gavin Shan wrote:
> > +void qemu_ram_move(void *dst, const void *src, size_t n)
> > +{
> > +    uintptr_t test, len;
> > +
> > +    if (src == dst || n == 0) {
> > +        return;
> > +    }
> > +
> > +    /*
> > +     * Maximal length of aligned access that are determined by @src,
> > +     * @dst and @n
> > +     */
> > +    test = (uintptr_t)src | (uintptr_t)dst | n;
> > +    len = test & -test;
> > +
> > +    /* Overlapping buffers, unaligned or oversized access */
> > +    if (n > 8 || len != n) {
> > +        memmove(dst, src, n);
> > +        return;
> > +    }
>
>
> This part I don't get exactly. It's fine on most arches I think.
> x86, power...
>
> But here is aarch64 for example:
> https://codebrowser.dev/glibc/glibc/sysdeps/aarch64/memcpy.S.html
>
> it says
>    It uses unaligned accesses and branchless sequences to keep the code small,
>    simple and improve performance.
>
> so if the point is to get rid of unaligned accesses to BARs, are you sure
> it achieves this?

The idea is rather just to ignore the unaligned-access-to-not-RAM
case as "only a theoretical issue" and default it to memmove().
If anybody reports an actual problem we can think about it then :-)

-- PMM

