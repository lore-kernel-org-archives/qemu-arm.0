Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FD7CA0EE0
	for <qemu-arm@archiver.kernel.org>; Wed, 13 Aug 2025 14:58:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umCvQ-0002Ch-BM; Wed, 13 Aug 2025 10:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umCvM-0002CL-RS
 for qemu-arm@nongnu.org; Wed, 13 Aug 2025 10:57:57 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umCvD-0001o8-GC
 for qemu-arm@nongnu.org; Wed, 13 Aug 2025 10:57:54 -0400
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e8e11af0f54so4697571276.2
 for <qemu-arm@nongnu.org>; Wed, 13 Aug 2025 07:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755097062; x=1755701862; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0wu/At/kBcWjIRC+i+xv5zTAJOsdYekZtKqMaZ3/HY=;
 b=nm4TsglQZrOLT0uq0uD+WIf3BOzIBmMvvcRiIdKB52+jjN/ruZDnF27Zb034Ht43yn
 PgRcRt2wZJ0GOze6wXBrwHGg4Et1alhKFfCyQbSQy5XPw8k7cnqhcfzrUpmhEXwnx1Sd
 QmtE8ON+JMKSEYtU27Rm1foYiiop2fwrqigPyKpW85AEqYX2vrD3BxwIwuCNPXm1N8ja
 R495bBReWZxl3W+usLah826RZyjnrHDhPRUlVm/h9GjceGYENCT/PMvOhRvOypV77PE2
 WNhsEhHeiEMpT2fUDiRvNpELnmvl6vzGyteQX3MENx7MoxQQfRZlYgxHfXy4JaFGCV9r
 TDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755097062; x=1755701862;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y0wu/At/kBcWjIRC+i+xv5zTAJOsdYekZtKqMaZ3/HY=;
 b=wTD6ZjT0FPXdeAErOf6kwX/X84RltbVmTCHbDd8feeaQaMU3N3TXw7DHUU1CN29ILB
 KGtWzZnQ8oMEc8KB9W6b4vvkhTBVEkWcueQgntev6LKAcaUEZc1wFczsBIC/8q4Xfr2O
 GtO60G6nSt1/sUbzjIloBIoNJFfjks9c+q+fzax9KqwdYf+zDRHUrjc5DJhP/uDqrMpU
 QR2HGxiwkeUHTtDB/mIXF8HrZS51zbWlN6PHOoWQc/vD9t1RojUkVVhxq0BMENWzoEta
 JAyxfwiiNwTfvvxPANAID+MLiI3/groZLFjtvbGsKRi1EU3G/Xz/IpeEutWkUIKxlixJ
 GM/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7auM25bt62AWWkJcqZvKC/XBGyhNOJWwasLmyjD+CjVydBldqEfP0CKdkH425U1RuRMyIdeAusQ==@nongnu.org
X-Gm-Message-State: AOJu0YzSycBPbsbScwBF+0uBrYElenuGkgUMSDSx9bPSDc8ilfS63N/6
 EyDiPPsZY8GzdkqLtjz8W/Xdmuarq/WQxnesZgGZ80MVkz+J76/N594dmgQp4Xwmn/gNjvuIc/C
 /cv84oikkWJqXXWfIjow9ftJwf5KH1sPYhwS7XlCXbw==
X-Gm-Gg: ASbGncttwibP5Kw74h8lOFe/azD713mBjG/FvRJhJ7wg92T8+OrJJmx/KAP8pRzyVOH
 3ihPvrxeVOkrm6VDn43vupQp09vif4Yrcng4DAql4hDNMfgsD6yNtR3K5101/1hHxHDIROhUgLq
 NNK6ziXsDHFHt8iaqZd2AHR4xMk0UPZT4E0rWggl8b9uplxQzSpE4kOsXho8FMdpYTYh8BrovDd
 ASiQYqJ
X-Google-Smtp-Source: AGHT+IHW9fA8tztfa6r4pPVge+R9CG2houI5yJ9hElNGQzLcoo72hyc9SvxfBDDPN2hJsKgewLWhRaB+f5xocADpylo=
X-Received: by 2002:a05:6902:620e:b0:e8e:1e32:c2ac with SMTP id
 3f1490d57ef6-e930bf0bccbmr3643200276.16.1755097062153; Wed, 13 Aug 2025
 07:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <1754936384-278328-1-git-send-email-steven.sistare@oracle.com>
 <ad82545e-702b-4127-a339-680d52065ae1@oracle.com>
In-Reply-To: <ad82545e-702b-4127-a339-680d52065ae1@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Aug 2025 15:57:29 +0100
X-Gm-Features: Ac12FXz7xKGvqrIw-k4a67Krpx9UiejEAEXo9VYdVlxCP41UAMMIwtR6PVGni4o
Message-ID: <CAFEAcA8sfzSSRBgJjAF0gZqkK_CGwZyJU5qmja2cjpmVhnuj6g@mail.gmail.com>
Subject: Re: [PATCH V3 1/1] hw/intc/arm_gicv3_kvm: preserve pending interrupts
 during cpr
To: Steven Sistare <steven.sistare@oracle.com>
Cc: Fabiano Rosas <farosas@suse.de>, Cedric Le Goater <clg@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Zhenzhong Duan <zhenzhong.duan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 13 Aug 2025 at 14:32, Steven Sistare <steven.sistare@oracle.com> wrote:
>
> Peter previously said "looks good" but wanted a sanity check from a
> live update maintainer, which Fabiano provided.
>
> So, which maintainer will pull this for 10.1?

It's not going into 10.1 (it has missed that boat, I'm afraid);
it's on my list to look at and apply after we release.

thanks
-- PMM

