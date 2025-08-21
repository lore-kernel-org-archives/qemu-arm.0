Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEC1CA0EF8
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 13:56:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up5mF-0008O5-Jo; Thu, 21 Aug 2025 09:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1up5m8-0008LF-0o
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 09:56:21 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1up5m2-0002Fv-65
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 09:56:16 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e95026b33eeso1097690276.1
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755784572; x=1756389372; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AqbrWKlyHwZo9tnRayIg/JGIFw10esaUog/82RQcPVc=;
 b=VpgQIwdqXFaPYzDrcgra+iTPiMmlEg7eBH/bEpiylVQQPbhBxOL9XlLkbapU9oCIf3
 iPlr62plq/dyUAIjsDhS+CZW41W8OGRNAnsslQk1je8UrHVgmMJOe3XYz2vlTAIY9I4S
 JMqcH8xZyYzC3ET3tptGNYoF1vxJvrnMDC0XMW+NhASQwDisQCR1oAq/j0zh/M+/ycJ5
 N34EB4XeRKqmYId+UXqvDiXxtHEN8Si70IhFbrca8Z6X7Bp5mvI0U3A4wUPSWY9/nSdm
 C7n1dYa02+qdfrbrty+P+LXg5Sl8bAFhHoVjH4OH2j2DP/+ouMWvnU0Q82zolUwaaZVI
 WbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755784572; x=1756389372;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AqbrWKlyHwZo9tnRayIg/JGIFw10esaUog/82RQcPVc=;
 b=UeaGEm4T/aHvRQJ1Sr5L6VcVmPJTImz9Y3uXxhxwhkoAUoaywcMZHE2fiylAuB1NVu
 6qBIehWvpWQWxW6kkc+mbsujZM5GH2Y3Beca5xBE9PR6ZrTjJtrNiujP++b9zH4ROkqP
 4bQAD+LXPDxaQcDz3g1cerr9IIf/Grr2Jfe59LsIyKK/C8amjJC+wyhO5tYWyQZPnLDG
 SKwNIyt9/QlyS4L5K0IbQWNv3r3LRZ7qGAlp3wf0lMcspxUoAFNKtBJprbOBx1Ttzr9i
 ZibdUes18GStSwkonKLQDPit815ZthHZ2st9oWuhbZ+yOirJ/Ju4Ccxfy551h6HFt6pL
 CSJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa4rhT18soMKSsqIKoUsZ2pA03DZ8uWa5w2xI3Bh/qAK3DSMukaM5WdqUSEfI0dH7s2917sL4t4w==@nongnu.org
X-Gm-Message-State: AOJu0YxlkVKGxxmENEIzbOHp3b6n4diwILy0TtwmX3/WdTQ2A88bPDGS
 jwxbWTJOMYGK75c+S+wgW5JDKRBVz4KJyowlxq3f+AZ0NszDinP1S+4+O2uJX185otKDjNF8fI+
 tHIrNrJCIazuNfPpO43PIvGzSjDghk5k7AsAAsZYp8A==
X-Gm-Gg: ASbGncsLuqwUmVQ1IUwt0LOjGTvhWWkYPmA9rb6XwQtg6Cnol2RLAPhXlhkKRZ2W2Ar
 77iI9e+YbIu5JgBBRPP34W2+E7E1YtFZ7ycd+8H3vMstGxZmmtZ3Hf2HML+u5RszH+HDHmrxj2e
 q8NFoNPQN20tMUMtUTdikJL14RSf1y+LVLVknjYQr0npmrwzWWUPMtE5UxqgyjUvUACEdNe49LX
 XlrVKzZjVP8vTNU8l8=
X-Google-Smtp-Source: AGHT+IEtAOAtl1+0aztrHJbrJeZC1R5FrDgFHXyRBw1xIg4UOBulMf5H7G919UefF13v/X5P8fNyV0qrbhFx6fGczvc=
X-Received: by 2002:a05:6902:1081:b0:e95:188:2922 with SMTP id
 3f1490d57ef6-e950de22774mr2349441276.23.1755784572140; Thu, 21 Aug 2025
 06:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250716095432.81923-1-luc.michel@amd.com>
 <20250716095432.81923-14-luc.michel@amd.com>
 <CAFEAcA-x_CYWPM2TeGSTLjCj==3JY_uyvfFmR=nLi4pRLw-P2Q@mail.gmail.com>
 <aKMrBdNhtqHVHRYw@XFR-LUMICHEL-L2.amd.com>
 <CAFEAcA8eop95ojfZw3YbDrWfrv1fZ5QYSmwx_oDThxMCiMMeDg@mail.gmail.com>
 <aKV21WpfZ8u054zc@XFR-LUMICHEL-L2.amd.com>
In-Reply-To: <aKV21WpfZ8u054zc@XFR-LUMICHEL-L2.amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Aug 2025 14:55:59 +0100
X-Gm-Features: Ac12FXyls2zE9rht63-MvtBIbZZrohweZuamNqZ1UzqD5qGI7JAujRScTp5ifHw
Message-ID: <CAFEAcA-HoghnZLWZLX7zBD=-_mztTQoZLReQRgS5TRE91eRbxg@mail.gmail.com>
Subject: Re: [PATCH 13/48] hw/arm/xlnx-versal: VersalMap: add support for
 OR'ed IRQs
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

On Wed, 20 Aug 2025 at 08:19, Luc Michel <luc.michel@amd.com> wrote:
> > It would be helpful if you could run "make check" under
> > the clang leak sanitizer with your patches added, to see
> > if it complains about anything. (Unfortunately it will
> > definitely complain about at least some pre-existing
> > leaks, I suspect.)
> Yes I did that before sending my series and fixed all my leaks. As you
> say there are some existing ones, mainly in the register API (IIRC it
> does create an object that is not correctly parented).

Yeah, register_init_block() seems to be broken in two ways:
 (1) it calls object_initialize() rather than
     object_initialize_child(), so the objects won't
     be automatically unreffed; but it doesn't manually
     unref them in register_finalize_block() either
 (2) the TYPE_REGISTER objects are a subclass of TYPE_DEVICE,
     but the code never calls realize on them. This means that
     if you fix point (1) then you trip the assert in
     qdev_assert_realized_properly_cb() which checks that
     every TYPE_DEVICE in the QOM tree was realized...

-- PMM

