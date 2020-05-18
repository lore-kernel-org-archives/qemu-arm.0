Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2904324lfb;
        Mon, 18 May 2020 03:31:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCdRaLyqmqFpidmTSNQhOC7WUpPjQzrOt436szkPZbM/jeTkoGDMHqXulweECIMqmGrSIs
X-Received: by 2002:a37:9ec4:: with SMTP id h187mr15020676qke.72.1589797872920;
        Mon, 18 May 2020 03:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589797872; cv=none;
        d=google.com; s=arc-20160816;
        b=XS7d9EW0bZzoqGk3238t6ZAsFhIuCh2Uw0r0E52WCO2MIc3tiRqYM5xWHE+qv+BG6f
         18UIV35Aip6QTD2nbeAK3RRAcEx4scW8m+v1nRe/CPJk4Pry4s+jGW7lykCsW04Y/p16
         DliI5JWKriOlBnqkLB4vx638Zp+P++EryDFRiv/CFNX9S7d+U9qdP7ZNyC0vFpHe9B/p
         o5gQFfKUE5F73WPnXv9DSEhsk8mOfCd0cRVCqRC1IbasgAryOEHVW/zKmLrovfSMkPbj
         TaW5Ma8Sb7Emn42f1y0cPqqIknq1FH/vUPYQhEPWFvCnMRxEV2jQXiasXF8TYtfndqEb
         QTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o/GPKSYYNOf5fJUKvBnddpNIXiQERov0ePibcKwRAYE=;
        b=R2djWh+JAU3w5jgsk870D+OXtB+wr7SSUmLVXnPw3op6cnlOQD4rdzlrfKRA3bjD8v
         EiPDA0lmkIAub5Wgrhgk7AKLD6VVNu65SOU7bXFW9g37+sur5SB0SLvhhBNyHY038308
         tNsYtB9oKotNTZenJIH0ziKCx8+hleleYi23eph+jBFKymTwh2i2e2wIqgjsWOtooOFB
         dE9ERVXJ2kxA1CJVmahbH6sFn/KLlTzoZhW+z4jgxFMHFqNzIb6mBIC1RtWMAFdGL5N6
         jV6qe3DYzs44IhyQFEVz2wmbXoSeXBxEQED9XLQKSYGk05+tagft2Rf+c9S2+Cg4ehrx
         ujeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=esvvk8uE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si5056380qka.277.2020.05.18.03.31.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 03:31:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=esvvk8uE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jad3A-0001Ob-CE
	for alex.bennee@linaro.org; Mon, 18 May 2020 06:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jad2s-0001NA-R2
 for qemu-arm@nongnu.org; Mon, 18 May 2020 06:30:55 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jad2q-0002Nu-EL
 for qemu-arm@nongnu.org; Mon, 18 May 2020 06:30:54 -0400
Received: by mail-ot1-x341.google.com with SMTP id h7so621630otr.3
 for <qemu-arm@nongnu.org>; Mon, 18 May 2020 03:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o/GPKSYYNOf5fJUKvBnddpNIXiQERov0ePibcKwRAYE=;
 b=esvvk8uEE7eNEISZBQqwfRKzzMVqGxhNzrzureWb1rM13fbgpVmtOykXSRAN3NbM6g
 3m6ZgGJ3DbZwK5pJy8JtN4ddo1lUN+pRz4hyRllAKHXN1kRi6r84ewHgoZSrLcubzIXp
 rJhLDSm4jOK433VsnUjexKE3zl79/DEx2wR3o55pJ6aE53CYUIJogVsrRXECFZlgojB4
 TWC4/pgcamfvFF7qyaulB/KFdGEK4jxfSt6RGjT0JiDlssr9e/r85eA8j2hwnHoE6GOj
 s90pZ8bK4Sc55JvKh76OYZ3GO2bjrmi82K+myep1hjw5mE+oEiN0o/qs77rBoOjXwhdK
 Fg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o/GPKSYYNOf5fJUKvBnddpNIXiQERov0ePibcKwRAYE=;
 b=uDdRIzkU3vdTztYPqY6fhNaekSiV36gwLouCapwSQxUDtnzSht2lVxjozIe9EsrUGo
 bsSzSGtTpqzKHmDcTDX6JVX1OtQfPnSh8qkozPcr46Dv2dJFGFMBbvjkYERZo6lyQ5bK
 YQAW+vEFt36WSUErsu3Gts+o35JnoXLhj1LhC8b721vYXCxXK/8mPJ/KZejdAki9Ct5Y
 vamn2Y6daJppvQ7HPH4D4GihOKCoZRuYENyPgOeO86Jkpyd8W9wm+Kh/6DMrbLT6ye+T
 n22ql8UONinQsJ8aPT6IhtAAuDlyzb/EKPi4ewYOoBUWnvJSGkEG/nNldo3sRAzYaTnS
 Q0ew==
X-Gm-Message-State: AOAM531+m2Hn0pxFuuxkgkzELKQxasunZw77+iKnh4SYpemFqyCtJxDr
 ZRdidrYodrb/VCQhCaHe9BTDfvIX29Lah8RrgTY6Tw==
X-Received: by 2002:a9d:3623:: with SMTP id w32mr9904865otb.91.1589797851126; 
 Mon, 18 May 2020 03:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-3-armbru@redhat.com>
In-Reply-To: <20200518050408.4579-3-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 May 2020 11:30:40 +0100
Message-ID: <CAFEAcA-FKUHyG=bgJqPG49WZDXV8JGQqqZXOw49C8_h9mYS5iA@mail.gmail.com>
Subject: Re: [PATCH 02/24] display/xlnx_dp: Fix to realize "i2c-ddc" and
 "aux-to-i2c-bridge"
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /iGHKAvuaSvL

On Mon, 18 May 2020 at 06:04, Markus Armbruster <armbru@redhat.com> wrote:
>
> xlnx_dp_init() creates these two devices, but they're never realized.
> Affects machine xlnx-zcu102.
>
> I wonder how this ever worked.  If the "device becomes real only on
> realize" thing actually works, then we've always been missing these
> two devices, yet nobody noticed.

It depends entirely on the implementation of the device.
If it happens to do nothing in the realize method that
matters (eg i2c-ddc has no realize method and does the limited
amount of initialization it needs in instance_init) then the
device will (by lucky accident) work just fine.

We should really ideally have an assert() in the DeviceClass
reset that the device was realized, so we can keep this kind
of bug out of the codebase. (Last time I looked it wasn't obvious
exactly where to put the assert now that we have both legacy-reset
and three-phase-reset, unfortunately.)

thanks
-- PMM
