Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1947917ejb;
        Mon, 24 Jul 2023 08:15:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFy4qTaDTE4G0hmuIkIIM5wb+JTdH26ZzkgxfDc4GvF+laNdJfWiolaxIwzG3RwLmAxr6xq
X-Received: by 2002:a05:620a:bd5:b0:767:954:a743 with SMTP id s21-20020a05620a0bd500b007670954a743mr42584qki.51.1690211701823;
        Mon, 24 Jul 2023 08:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690211701; cv=none;
        d=google.com; s=arc-20160816;
        b=jZCOc+1zz1JsREv+AXnB/h1/k618NeaI4A5U9Fq01SbMTmjoI7AD0t8nyrIZmTNvjE
         bTuE9wPXABJvPYlKo3ptgQIAk8NtPMIYENhpV7nak0JrBI3sTi9N7qVoFiJ+TuU9+D2c
         Zgwb7mLe/lPUTtDNmJXp1zCLOP/hJlHR13MQRaJgBXvcg5yCLbtAZc45CzfoZwH7y4zp
         NndYF+AnYAac4ZjDdu17UWtti22NfcVrWE2HzABQZ8E70CkIKy1+lrr6JRa+2y4oA38l
         zxN/siClBNxW0mz+jLR5yyVxgtvom8sn+GMq4058akRFZ7UYBIkvwxCc7MWU1lDMtfoY
         q/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+PIm9T+rJycJHWPFWmaK4cVsimJSZoz3kUjvmFUlwh8=;
        fh=+z1B+zjfD+9s/PQ0BawBBF0/TwgIyPGW3RqHgii4OdU=;
        b=CUmbPQhIb3nEPtQ+PyEWI/KRjz9MOgjtfubaNZnnX3N6CB6CNpQrHMs3+3ZlHwX2yK
         5Ct9/EpmU1FmZMT5UygbqQJlR7U+PMpnLBo0kJjIc7pDxvh2leUx/i8RkYgxT7kUsysJ
         JnCXC+yjG5e87Tsfjcko7F5eWcOP+2Vgi2tLdqisiLs5E6/iiW8ph8yqKirSJSpUvIsL
         8JWtw3Htjk6VMnQhx3u5RqkfsMGtWJVHrsNVdD82jLqqpfV23vLkfUNrwhMb0Fge8h9Y
         d6aI+Sw0QXOP/a9FkMX90Wd0ZFafhIPIye8P0QbBGCEMkwD0F98WchReXK/HjVVHB2IY
         7Puw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MnEK+KHg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4-20020ac87c44000000b004009b446cd7si5339298qtv.258.2023.07.24.08.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jul 2023 08:15:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MnEK+KHg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNxGo-0005jE-2C; Mon, 24 Jul 2023 11:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qNxGl-0005ij-D8
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 11:14:43 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qNxGj-0007PN-07
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 11:14:43 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-52229d3b8c8so1996462a12.2
 for <qemu-arm@nongnu.org>; Mon, 24 Jul 2023 08:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690211673; x=1690816473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+PIm9T+rJycJHWPFWmaK4cVsimJSZoz3kUjvmFUlwh8=;
 b=MnEK+KHgVIAy00MJaSZWLghEnsWU5lVidTrRfYB0N2UmwZKtfMupA14Wvvc2gVkGbb
 kiGxe6ia5uapL1SY4Dq04yb6pRKQ8AYbR0TYHs/NfkBOGz/X2r5oXY2uyiK76ohevFIL
 vJrUip33jVwEY5v3gtc8iJoVR4i2U7us2CqXoX8vu6u6RZlx0A464YRixbpIxyQjLhIQ
 UCPDKk34+tBadlV8bhyheqIVyOWGRqwkCNpMQLi7li8WtubyzPOGp+HzFMeZADIaNwpA
 pEn3Pvv4uZioKQQgjOv7/jUEeny49MsjguxoP1VTdbThOXP6oTG37OG0f1BQVK2tVltE
 HRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690211673; x=1690816473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+PIm9T+rJycJHWPFWmaK4cVsimJSZoz3kUjvmFUlwh8=;
 b=B092tsDdzLdrduyckFzpK+VsAB+bREYm9otQ6/pBRib4PJEaNGPFtBPJS0fRygrHiY
 h1l3yOPxsf4Pz34M5FSoDyZw3eUtpY9MpSjRTQLOX7ijPREfgc+4k53+48w630CGPSvO
 s8UQ4fgFFlxjitoDVsU/huKvB1hcJv7CpuPZNLwv1hPu4vsN1LdeRxLIjUamEprZKWuc
 r/6uFg/EACPMT61T883IdLCI4OgTXZ+2z2wOfqyEWm8BiaqMK6iWgqCGMiTDflE475hg
 IUCITZ5kR/BiMsjbTcgh4Mxv5UJv3jGdqoJv9TgF7sQ35Jsrnr5rqzPqq5NmgLpROX4P
 KrRQ==
X-Gm-Message-State: ABy/qLaIvFYiaSpPzLRrjo82XFMABptk41ySrJ7+zDikhXrBU/3aEIM8
 hIbocxcF943TSV9dgPc9bX846CzhpajhaKdwfDIspg==
X-Received: by 2002:a05:6402:31f6:b0:522:3849:48db with SMTP id
 dy22-20020a05640231f600b00522384948dbmr1413115edb.3.1690211673475; Mon, 24
 Jul 2023 08:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230713054502.410911-1-gshan@redhat.com>
 <CAFEAcA8197FCwfNZrnxfO-87RveOko0Ju-KcTJOEi0vfjVtDKg@mail.gmail.com>
 <2d21e89f-c965-e8f1-3705-dfea8367fc7e@linaro.org>
 <CAFEAcA-XK0U0bPuAf4K7avdJqnmcibFX_swY1Weo_Tn3wHJ1fw@mail.gmail.com>
 <20230714135004.230c05b2@imammedo.users.ipa.redhat.com>
 <CAFEAcA92QFxN0at+5rk7yrfk1sj3tX-GcfZYYY5_=210np_j4g@mail.gmail.com>
 <20230717144455.6f02fde9@imammedo.users.ipa.redhat.com>
 <527ed3dc-b723-5c37-37e2-58d4266b1f32@redhat.com>
 <20230724170604.74b4ca0a@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230724170604.74b4ca0a@imammedo.users.ipa.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2023 16:14:22 +0100
Message-ID: <CAFEAcA-Tp7_vpGUea4W6cf3rTDqqGKy6VtsguDjiSAbRX=dL=Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm/virt: Use generic CPU invalidation
To: Igor Mammedov <imammedo@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com, 
 shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: isSGXrJ0UhiB

On Mon, 24 Jul 2023 at 16:06, Igor Mammedov <imammedo@redhat.com> wrote:
> I've seen others asking why you print type name instead of shorter cpu-model
> used on CLI. To do that would make you write a patch to implement reverse mapping.
> In some cases it's simple, in others plain impossible unless you can get
> access to -cpu foo stored somewhere.
>
> What I don't particularity like about adding reverse type->cpu_model mapping,
> is that it would complicate code to carter to QEMU's interface inconsistencies.
> And if you do it easy way (instead of fixing every target) touching only ARM,
> it will be spotty at best and just add to technical debt elsewhere ->
> more inconsistencies.
>
> What I'm proposing is for you to keep printing type names.
> So if others won't object to type names I'm more or less fine with your
> current approach.

I do object to type names, because the UI for choosing
a CPU ("-cpu whatever") does not take type names, it
takes CPU names. The QOM type names that those end up
being under the hood are a detail of QEMU's implementation
that we shouldn't expose to users in the help messages.

> Instead of adding type->cpu_model mapping (it's not the first time
> this particular question had arisen - there were similar patches before
> on qemu-devel), get rid of shortened cpu_model in user interface (-cpu)
> altogether and use CPU type name there.

I also think we should not do this, because it will break
a ton of existing command lines, and it's not clear it
has any benefit to users.

thanks
-- PMM
