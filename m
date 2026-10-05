Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7A3CA5FFE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 14:36:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDjn2-0003eq-CS; Mon, 05 Oct 2026 10:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDjmy-0003dt-K6
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 10:35:36 -0400
Received: from mail-yx2-x0f.google.com ([2607:f8b0:4864:41::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDjmu-0002yN-Hp
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 10:35:35 -0400
Received: by mail-yx2-x0f.google.com with SMTP id
 00721157ae682-895eaf31683so12791717b3.0
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 07:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791210930; cv=none;
 d=google.com; s=arc-20260327;
 b=ZL6KFCwi81b8sM4CQ708NMTlnsKrN+aocioiRYLz3RZMVPK0T7ToqjS3ch6gOKQ8Co
 uQ8mtmYHs93ZbtU7472tTOfqpYji1hu5XyC9J42KhndwdiVoVby1dagkIpe0FgUlNo79
 nnc2KDkRklztiQqWDGzoTyNE5v+A+AvxwgXZ2ntNaOuK71tA5dzAGXPvmtciiNkByeGF
 iSIbiYm4QGdi+x1Xr+6vnAKFtJF12XCDE2lmoVy0K2gZMrZq/x2ExO1GbCOVLoWlnb4x
 MNmUIQkf4z3/1IzjbMWmO6zWBN1To92vhYmwy79st8QKudA6jh4dkyt+xpCH6aoGiO0p
 UQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6NZnBHmuIlQoH345NJt6JQtt6hS/i8mTlsrO4dCzUXQ=;
 fh=dvbXASaTgGJJwvmvFIhobQw3g5MWX9iw1sP0yw4GH8I=;
 b=UdM2+T8RbXdLP3UPe26KfUjkavKOfWGKuAx41lTMO0L2Y2thaN90dFl/emf6YdOKlZ
 UOYTOm52CCjI8PkY9AJmzo77Fj5gSWoYqHBnI9EmCzI+UwupR4oqCh3sCoUngA4XzteV
 YB/Izs8HficPnZGcQDwzn5su1IAClFsL/2NaMChQww2yCjxgx1F3aBg5tGvKQzpUmjrW
 qQB6zhwQmGOAPf5gXgBmvLb+PNVyOf8tS4Nkv2lB1ESiE/Tbd8bStQtAW/WkBNQUCOrk
 qz4p6/J1nlv/fQbdfFZsDGyNC4lYyYD4wnOtteBQ8UMgLeVSN9xfvKmkx49P52FiTGpO
 gmZA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791210930; x=1791815730; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6NZnBHmuIlQoH345NJt6JQtt6hS/i8mTlsrO4dCzUXQ=;
 b=X09LXh3I1iK3ze1TD/cKc36tRK94meuUeipFJK9hJBx0uWg95yhcVBWQATkNl4ZVy3
 mBB6FiFoqvoXQZGfSRILDZNir3P6AjekDJFPKtIQZMPR+X594GRwkup4Ob5PaA1ujW9i
 zlan3s576VhrhMcT8GnIcrZS26Mp4fg2tFvW8XlII2VFlwiqff3o1RA6hrMSsDQEsyC3
 T8lVnvdPTuXx6Y/2dpIOCivggfrQqa/xC4FZQBSrPhXHKwy5YzppIUarDVuHxTxhq6oe
 uJpzX7+XfXg7uKnGyXD/ydHjai1fDl1xpK8ceKWuwgu//MqrUE6NjIWHBQhNCE9AJyCZ
 CVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791210930; x=1791815730;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6NZnBHmuIlQoH345NJt6JQtt6hS/i8mTlsrO4dCzUXQ=;
 b=2a8tH6fFmFgWkAtWGsTclC93Q6BL8cWbHbpZ8/9NZAUJT7+XMwa+Tv4j8h8ZoNLaLy
 9wkA6eC1dp+bNnpeapazR5iQQTkDYhzPJKFpy7kYB43o84fCmJje0CbQ/hm2wcjtudvt
 90RtSqw4iwwuvd1nx3KKRHJ9LYO2FC64QE5vDnMXAZeD3cQmloCEOZQaCDUHKX8owNcO
 E/l1HFHnTuIAYhwR0EKQsGt27lQaVLZtW52I/i9Frowx4jtQm39y5Uh3zd8fGZCKco5/
 xaVxiwqz3AvPQyDuAvcmU4EuhNefdPlciMYvs+8Z07o6yRrqGghwA3rzZqdSLzgSkmzo
 f8Ig==
X-Forwarded-Encrypted: i=1;
 AKwUvByJGP4r4DWgl2GEIUHgKWOqnwDob9QWg/bjnTrKHImtpc7B/CruX6/y/pA2Zz7/w5ivHB14X2Ymog==@nongnu.org
X-Gm-Message-State: AFq9FYJc1PyTfENciD5QtsLiFddYyX3izaLN4btWO3PEv9XehaVW1KSM
 t0genYCLhB6xassJRHboq2R4+2IiXTTueEdjzrg9T2GTnh2VGOEADiET3sAPhpbISURvBvzPPAA
 WEJYXV9flrgXkVnO4FSQkQ9rnty5Vmxg=
X-Gm-Gg: AYBFou2Awu1jz8GQO+k/7czegQxrvZnJn//+d57rOCDh1/LswFvEbWM/fO/uoTuyPTk
 HRGJrDASAB/AEpefUwM5qV38Ut9RVYfoh7FXmNYybxniUwh/pslxit2Imngo+dUaoG9B6uh5EB+
 T47B6Q5Fffsae9lAOesUMkCY+rfn5UYvtLsDe1HvS7b7cKePXlIGXMY49bQJLy2kSiAyNuMAgpM
 TsnIKN1DnLLskATsjqSmPCVxApiO5+W9fMpF9+/wwsd03inpwOMYBf/wFrgkaGgSlZKKa9oEmsk
 y9OYK1bn59zNJ5ElbAQuhu52sgNpQDci1SO8BFn377xJHhWTSGbbL33nHMqmStqStT0qWbCOLxR
 81Xu8+QewcvkGC7Tt
X-Received: by 2002:a53:cb07:0:b0:676:8c39:1ec1 with SMTP id
 956f58d0204a3-677ac165d14mr2764073d50.128.1791210929525; Mon, 05 Oct 2026
 07:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20261005101800.10821-1-shentey@gmail.com>
 <20261005101800.10821-3-shentey@gmail.com>
In-Reply-To: <20261005101800.10821-3-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 22:35:18 +0800
X-Gm-Features: AclHuK8VjkzcGKGXWhndG6UrYWnZlFQGCWUfbdptdoZLGR2NHGy9x40EbLwQNEc
Message-ID: <CAEUhbmXwznFqCzuL3AhawhSEYwON0SyE1Yx7Y=0S5QUh=-4WTg@mail.gmail.com>
Subject: Re: [PATCH v3 02/31] hw/watchdog/wdt_imx2: Fix handling of write one
 once WCR bits
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Oct 5, 2026 at 6:22=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> In locked state, the WDE and WDT bits of the WCR register are one and
> need to be preserved when written. At the moment, the logic is reversed
> such that all but the locked bits are preserved in locked state. Fix
> that.
>
> Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog
> support")
> cc: qemu-stable
> Reported-by: Bin Meng <bin.meng@processmission.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/watchdog/wdt_imx2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

