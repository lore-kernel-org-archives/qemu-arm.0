Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1164268lfg;
        Fri, 19 Mar 2021 03:38:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKAfA342ENEEzfU3WHJUwDTDUbep01Re2pCYZ5ifn4eOlLtKcvsxoQ2kpISavJvd9YOstF
X-Received: by 2002:ac8:7fcd:: with SMTP id b13mr7218235qtk.68.1616150286999;
        Fri, 19 Mar 2021 03:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616150286; cv=none;
        d=google.com; s=arc-20160816;
        b=SpzU/SwmYrDb44BrDXV8le+u9XKOsOatZYNFeo4wNUla+fDz1scL0jLkoU/W0aFwL4
         CODRog7NZQkUVCW9TiDkXE22V3B/e0uo4stipLM/b8quCp3Pqap65FrYA9ukvTOFDy6M
         xE5KiFt5vKxB2IeLeiPomKvwSE1hmrKMrb/D7fVe21b5x3338NDIx8Rod4BI6RkeDEM1
         zBfyYs93V6u0hvztyq+Vn5j+boArk7KW4VJ9Vr8gViWdbwB0pbhlsVHp6RWD5+0TeJp2
         FFJcyzQx1a0WK+gsyPBwmpVxxVzK7c8DnKCI6ro1HxU24RRRrNOr2nz6EnDvEpS4K4v0
         Drbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4jvf5bcFfvGXKLM+TnNxYOZnE/uos+encql9wi4A1F0=;
        b=uLDvMWrx29+yVHG3Cbz7KTRzmMZ3n9+SHmboAneP3b+Aho9Gbvte+tDHZzyFrKERyl
         dTMk8JLu39fPUX0DtkpIyvWDdEz9CX4zmNhe4YXMZvdAxsL/aoqFa3xsAfefBsEITETL
         GL4Xs7j9S4wTMsktAT3bCNMFIH3P2wvH0OjCp/gvVIH47KWcakScP9cLjflKvJtrmUjT
         2EyOaQnIyOPo3cr/mQ7fkz/E8j7xmZd4wLsnHiEHPB20AqHoC2CtrP+aCI8SvZ9z+icd
         hqXPDPpG7/+p4WXB8N7dHf4PLJCisicfvb07bnZZp0lv7D25lRDcCcHCKLnAt/F79Hsc
         /Zfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DaLwt/UB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gy12si2894903qvb.9.2021.03.19.03.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Mar 2021 03:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DaLwt/UB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lNCW6-0007vG-C1
	for alex.bennee@linaro.org; Fri, 19 Mar 2021 06:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNCVy-0007v9-7p
 for qemu-arm@nongnu.org; Fri, 19 Mar 2021 06:37:58 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNCVw-0006ka-2y
 for qemu-arm@nongnu.org; Fri, 19 Mar 2021 06:37:58 -0400
Received: by mail-ej1-x62f.google.com with SMTP id k10so8885288ejg.0
 for <qemu-arm@nongnu.org>; Fri, 19 Mar 2021 03:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4jvf5bcFfvGXKLM+TnNxYOZnE/uos+encql9wi4A1F0=;
 b=DaLwt/UBUGgTCaBmKtgaIHfXKicPF4o+StHQJCGOuPky5Za3/bn1ZAbBuC04JfcFUg
 Dl+F+g7vzmHCyg/QyVMTVDAu/YWdC5yfOqH4r4qXk/LQ2V+8zVXGQIA0kaFzmPs2QbwR
 KZQY56enhs/815p7cjo5YhMbAZhhVZF+cup+p+FOIf4vx13pzH5dJwrMuLxBInL1ZNo9
 W1fq+nF2/7Gt2lwJKJZMSMxBfcTaYbjzghPyQqTXeatPTPEFp2blrJCjNVZ52pgUuJIx
 g5U6PjTTSL6J1tWa6osqYL2xf5PQhbYiyicFCseCSgmIXQzaqKIhU4/f56ajSjFYmN7U
 3NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4jvf5bcFfvGXKLM+TnNxYOZnE/uos+encql9wi4A1F0=;
 b=EYcoH1Lixubpdiig5FewUf9t/BqOwV5EKlsL+oBy/5OMc+T7m7itr7NCB9w7SVKMdV
 iYMr7a4ZiRpmx2DhhNHQmZcujDlAfSfc/N6gr20w0dfPwe+1wPSq0Xhe3Aqw6GN0tLfS
 WguQWd3Pr4T9luF3dDCN9aim7PjghMNwo/rMt/FibBdynloSjhvhwGjE1gF1ZK7NvRRq
 F8Xc3B4Fd/F/QueLUXUzvkQueD/n4Q+RweFg5SFGa1EmFSU6WiT+jUq9o20G9wlvKJgp
 7LER0O5/SRfcKQPH/a/S/5aSxCLjNG+f8M85JKYQxtPUcDxUcht83Tb/YTYkx1BZ7L2r
 HLAA==
X-Gm-Message-State: AOAM532a2JvHV1n0UnHpj9+yXmw7j29IHfEp4bu0LxZ20Qgdlarr2QHl
 k9Arslf+VnodRXdexOYOU4aGnRxAFBYBuKJgwO6WqQ==
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr3620072ejc.250.1616150274563; 
 Fri, 19 Mar 2021 03:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210318023801.18287-1-gshan@redhat.com>
In-Reply-To: <20210318023801.18287-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Mar 2021 10:37:29 +0000
Message-ID: <CAFEAcA_WGfC9RvGjTuNMm_mnykfFKAKdvNhLWQ8873JuGt9nJA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Disable pl011 clock migration if needed
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Shan Gavin <shan.gavin@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hf2Y8gY+Gv5X

On Thu, 18 Mar 2021 at 02:38, Gavin Shan <gshan@redhat.com> wrote:
>
> A clock is added by commit aac63e0e6ea3 ("hw/char/pl011: add a clock
> input") since v5.2.0 which corresponds to virt-5.2 machine type. It
> causes backwards migration failure from upstream to downstream (v5.1.0)
> when the machine type is specified with virt-5.1.
>
> This fixes the issue by following instructions from section "Connecting
> subsections to properties" in docs/devel/migration.rst. With this applied,
> the PL011 clock is migrated based on the machine type.
>
>    virt-5.2 or newer:  migration
>    virt-5.1 or older:  non-migration
>
> Cc: qemu-stable@nongnu.org # v5.2.0+
> Fixes: aac63e0e6ea3 ("hw/char/pl011: add a clock input")
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
