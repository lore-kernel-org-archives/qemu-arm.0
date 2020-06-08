Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5130845lfc;
        Mon, 8 Jun 2020 07:33:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3nptzTiW1mxNGLn0KhSQQQPnTNzfta2ZPPFDWaffFRj70RFp7b8IJmt2B1QwbQ7INHrdP
X-Received: by 2002:a25:2fc5:: with SMTP id v188mr37821758ybv.130.1591626792596;
        Mon, 08 Jun 2020 07:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591626792; cv=none;
        d=google.com; s=arc-20160816;
        b=KmbP7ZhJClaosDC3kiZoS54f22g3ptfpDz9y6lo1fDU+3Oad+8fI+xUJk75cD2aAtd
         OJaNA9siZkvFoesF4vOmDlafAz70ys2a5xxb9GX9jPHRVm1x+4nfL0jV0tpUheR88GTv
         nuhLyHSGM2mMTzsqrsOfDzFzVJt740zzYtBwkvNXwuMi0XKqLCNVCfF1C8+FUrwhyf4g
         JKAnAbS18MdeQ3RK7mfEenXoVBSKKuvUm76ngMMEurrDIu9y3J3gNH2iK3hjfP7URoE+
         +rlrSoy8kvTkgYXLSiES1h2/EFz5vewmvswg0ZwKeBA98oq4AzAipNy35A4so3daXBmb
         4wNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tPUSdgkNqRgn8rtdqR9ikhIUybs05cEFLM9cKDAxYO0=;
        b=fZJpXSULvD4r4BTkiUjRu417mr5PaL+OotZ46VYES5JKt65J3rQrJ6dZFVpzzqqLda
         KgKsQEPWuRrmIGiG7AjIjgJLl9yFJ2uBIW6jkWaO48IRtT0HRa1E7ha/xIfb8sSa5cYh
         QmbNzGFis/6JXTsl7FpRdJ9U7eRqNh9n8AKm9EftbD5BeFlZ20uk6x137xpFLoUaOCl7
         v05PpvCSYb2rhgtngddvKG5RrZ8tyZeiFh681ILUIkOVy+aDhKQFHhEEwF34DjyLb1Xm
         FJVDmWbVmRa5LFFV5PwZetAEsb3e7UMTrGgQNDySkKVwjYs7wHTetE9HVdhhe++rMARE
         dnBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CKOupgfe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si15102743ybm.26.2020.06.08.07.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 07:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CKOupgfe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiIps-0003Ro-0F
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 10:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jiIgO-0000rO-Fg
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 10:23:24 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jiIgN-0005LJ-8e
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 10:23:24 -0400
Received: by mail-ot1-x343.google.com with SMTP id g5so13756841otg.6
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tPUSdgkNqRgn8rtdqR9ikhIUybs05cEFLM9cKDAxYO0=;
 b=CKOupgfechEpD6aT26TaLux3dmyikxrLPP2RSXasIiRp0U8Ix2BTm0/RZW2AVtiesD
 i2HXbXlB0I1r9ijbxylXZ+lS1q+LmGmJnl+42dWw9qtCpbH3JeUV4ueUMgJ/V0WIITmh
 4WMDbhUA0d4iAiocf/zKQS+v575kaXMlzdqSnT0ubDd9ZFKX7a14Tcx+C6t8oBuWzu/y
 SU3YEPlCJnZzHb/6Hv0rlpsQpNYKIIH11qYwM9J/nnuRqRHjsPaz+TpcKAgE4pqfw+A+
 D3PH6g5AD0b9MJyJlQtvdpsnN5IymcJvciViGdYNnrZlc7I0hfS12/pcudxJIasxpP6E
 SmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tPUSdgkNqRgn8rtdqR9ikhIUybs05cEFLM9cKDAxYO0=;
 b=iDAOpLkGbQIJ1JbNzzIAJIOTWidqqSMQ2uHldtsR2dgwB3kwgs4jRyEzxW3CUaRU3w
 JXRL/dnwErT4EcSBGBLvAKStEUm9N2PZPAN5yBD5ZyWCDyYfDggCWQGR3A1iA5osAEYk
 GVJY6JVDWjWCH7k6qXj5LeebhCK3AaVS2+7f91Zd9EuzqzSq+GK35E+imwhTRehwYGqK
 8K830A22ez6ovq0YE21Nb2iCBlTwo8AYLAuibj452QszTieig4mLzOJZKZqlz42fV+EJ
 TQkNCcFLYARLMNrth1U5Dl5sOJnMVNwkW3JFQHBjcT+nZhq0bxYVY1idjfKN6BPOysRT
 otcQ==
X-Gm-Message-State: AOAM531K0xaQUDAKrf1jNWenJ0pn8XDVJ/fpUJcLuJdbLfINOohT/ilE
 zB7+F2eqNqFyc268XgpcYk/Lh9msDqzdPoM6BD853A==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr18273561ote.135.1591626201767; 
 Mon, 08 Jun 2020 07:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200528110444.20456-1-armbru@redhat.com>
 <20200528110444.20456-7-armbru@redhat.com>
In-Reply-To: <20200528110444.20456-7-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2020 15:23:10 +0100
Message-ID: <CAFEAcA_GC_ds0-qM-+-Dkza8CggP741Fv7i8T7+=R6abxUKRzg@mail.gmail.com>
Subject: Re: [PATCH v2 06/24] armv7m: Delete unused "ARM,
 bitband-memory" devices
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ef/HSUob8puI

On Thu, 28 May 2020 at 12:04, Markus Armbruster <armbru@redhat.com> wrote:
>
> These devices are optional, and enabled by property "enable-bitband".
> armv7m_instance_init() creates them unconditionally, because the
> property has not been set then.  armv7m_realize() realizes them only
> when the property is true.  Works, although it leaves unrealized
> devices hanging around in the QOM composition tree.  Affects machines
> microbit, mps2-an505, mps2-an521, musca-a, and musca-b1.
>
> Delete the unused devices by making armv7m_realize() unparent them.
> Visible in "info qom-tree"; here's the change for microbit:
>
>      /machine (microbit-machine)
>        /microbit.twi (microbit.i2c)
>          /microbit.twi[0] (qemu:memory-region)
>        /nrf51 (nrf51-soc)
>          /armv6m (armv7m)
>            /armv7m-container[0] (qemu:memory-region)
>     -      /bitband[0] (ARM,bitband-memory)
>     -        /bitband[0] (qemu:memory-region)
>     -      /bitband[1] (ARM,bitband-memory)
>     -        /bitband[0] (qemu:memory-region)
>            /cpu (cortex-m0-arm-cpu)
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
