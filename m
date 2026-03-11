Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAF41125854
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 17:06:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0N0R-0006eR-By; Wed, 11 Mar 2026 13:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0N0I-0006PD-Ct
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 13:05:51 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0N0A-0001hO-8R
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 13:05:44 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-64ae2ce2fe1so105247d50.1
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 10:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773248736; cv=none;
 d=google.com; s=arc-20240605;
 b=aq/ZLavU4GAF2pCiu043UXQGuYRxSPu01O6K+aOVlrziVKiDbZt2p7EGTUY1DaCHlw
 c3/81vwVUmlAv78k7YheC8u/+aMIMFSbysyLUqvUbaXOAq4SlAQujL3VM1dARIjKPxk9
 bej31OCPTa9/pSTyDsdnZgFhODdWVnHQ9tAM5DGQK9F/e9AIqTtqJj2i5hwUQk3tfThc
 3Ex2b1z2PrZw41f4Ba1iijFyfBXJhCDKDbtrEyCQ8Hjg1JUAoMaenMdCzwVmUVgWcrZV
 0PxueKMQhZw959AcNzcFMnDzCShYjNnztIOgG3bXVstAVhRGO5dKNrc6pZkXXRyn+A2B
 Ltug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=s8hhLwgIhU2/sosIgArVE4EJu0fvWf6z/Nekl4sBFGU=;
 fh=iqFqqEBg7Dud1mH5aCwSVWCLW1rH/Et+Q5WkkavK8jw=;
 b=O6KTqb+XbKJavuZzYCXhgAg/VScj3raqYKYJkQDHv5ERqOQabooNT0URuXyQhDzTUX
 HvuFHxK+vj0naMZ+5zumlaBmTCXB4DcGiWO+ijsZbeqAWR0c9DTvqqxp8wvDqHwOK0AB
 lz9k0gF9JGvdmMT5K5pih2Gy26mRhUy4+s7NXUEthksCjHXzl5TRGvMcrR82/rY0C9g6
 9GgbsvkVK6XEVmFlPGMapgSZNqyy5KF0OeUp9RHovk37k9IMA/WOo8/AxhbWvox4G4FG
 VVAQmG4vVZ/xr94wQSbWZvA8ai+IBijbv+UaMteIMbCmOEnnNaYQ4dtLf+649JAcOOrv
 JTKg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773248736; x=1773853536; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s8hhLwgIhU2/sosIgArVE4EJu0fvWf6z/Nekl4sBFGU=;
 b=ukJxvEFMty8wzC0vR8c5b5bBitLWch1ymK7GpYJkIKm+rv8Mnm6lPTKTTQbJlBish0
 ae5w6bNQZvFmMlkWCsuiMKe4NZQmTpsA+uWvAIBIcc1rxtpkT26kWF0fMqwxSSSCDAwb
 MhF3xlefFSIz7PMtjS+ryNq5ROi++ufgXpTXlFm5SSTVKON8yn/K4SmyvY6W0vW6eqoF
 tYSLO5iXv2Yh03BkC2GGGbl+6zWyNHVjqRBNdYGlX98a705RiVxhYPIUkAQ1+PuehaGM
 hRMxRdvrP5I7lYmk450XMpq8X3IlE7ghjHpg5kdc4VmtYiQ2ovmrGq8q7DjbuWmAZdjR
 MgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773248736; x=1773853536;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8hhLwgIhU2/sosIgArVE4EJu0fvWf6z/Nekl4sBFGU=;
 b=F15ldEP//7xKlpfyJnDNxbD6lkmNM1Fnjqs0xgD+hd6A05waoToGnpOpLH+MMAThjo
 iy7vxFHX2IDDjz4anNbltuPyibYgDiFXwOaEvKgDRTGsF9edzltRFJTH50yDjztySpaF
 wEvN/uQ1cxVH3ut25QWCz5e6q/hStKCADnRx42xUVPL7SbI85ZV5NhImyc4YCOK9rmzU
 2TEMdol+VfBv5T3yRLXQzyTOf2jxyKFv9iwAXXulqryZfcJvtPbpLsw0G+tFhdowdr9T
 8bx9QtfhCy4o1IYMsFJSHFSgkgQft6CNg1CtAWuA09H2nnVuKmmUbqYkVhQx9fa/1oVZ
 +rdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIuGRLrxRq0j7oLZh9Yn3JrUyJ1VgEMaVs7Ou+sbr2iGoZoDpxfq5CSf+PlEimO37bDX0Kxw19Hg==@nongnu.org
X-Gm-Message-State: AOJu0YyEVoOHC8dQZJkhuINwPxQdO7zXo/BXP2Ll8dZ0qdA5J7BxUn2p
 m+C8I6gYmv2YMYiMskI38ZfSe1+Lk61nfVGABrw2RjnbhTeoUpTueMHKIrKWaFOjejoNXgbAgd7
 9vHWNxOAGK3O65n6nLZxF0C8H5r9KBdGdy9PqZx7YIcHyA5kb+wYp
X-Gm-Gg: ATEYQzxwAm72CFB9qax3SKc7Imh7wkbN7yYV8Yogmt3XC5fBxbcx+pbANKYrCim3qsQ
 20DQFQNpr+PH7PWSbiWaLZcAa8SCIIRlA2W9l2XoyTmKc+FxUsjfwPp/x6mR6WZvfv3UMtMrfA5
 XaStJj0umSQ6IAzitCJwarWlf9WZ0gjed6jnGJdIBsHTERJ+zVrqnZgqddILqOghjMjQf3VxhHC
 xp7JxKXuXaGZXjQ3LvolWtcR0+hb7FvyJ61PSDdpB9gigaf2RApkzaOryv/u72lCWB4DxfaRBQM
 Ff3w3suV9mZdeuKiv81fxbQSUAEfZY9fTrOqXAvdI21JipitmrqN0fO6qHheiY4bSSM=
X-Received: by 2002:a05:690e:1595:20b0:649:cc0d:a99b with SMTP id
 956f58d0204a3-64d656a9681mr2304942d50.11.1773248735633; Wed, 11 Mar 2026
 10:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_1BF621A658E043C088A2681178D57ED14A09@qq.com>
 <a8e75e56-a34b-4df0-866e-3ce5828dd472@phytium.com.cn>
In-Reply-To: <a8e75e56-a34b-4df0-866e-3ce5828dd472@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Mar 2026 17:05:24 +0000
X-Gm-Features: AaiRm51nohGj-1LpdtU9r14KeB2EsJn9ggPWTylVdOQVeHhkL01hqU7w0bB__ys
Message-ID: <CAFEAcA8kPQwFFdhYWr5WQisAgSs3s4YOuvZm2UoFT83LF5dgHg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Fixed bugs in pl080
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: 1774596582@qq.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Wed, 11 Mar 2026 at 16:14, Tao Tang <tangtao1634@phytium.com.cn> wrote:
>
> Hi,
>
> It looks like three patches of this series were sent out-of-thread and
> are not attached to this cover letter.
>
> You may want to resend the full series, or resend those patches with
> In-Reply-To pointing to the Message-ID of this cover letter so they
> appear in the same thread:
>
> git
> send-email --in-reply-to="tencent_1BF621A658E043C088A2681178D57ED14A09@qq.com"
> xxxxx

It looks to me looking at the headers that the emails were sent with correct
message-id and in-reply-to headers, but something in the qq.com
mail infrastructure has re-written the message-IDs and broken the
threading.

-- PMM

