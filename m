Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp504259lfm;
        Fri, 10 Jul 2020 02:28:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAb2F/F+BvovOE59SzzgokbrOULUxqmYVlo8MBGn2ptmG5bXRUIN/Dnef04BzWRXBiXG5C
X-Received: by 2002:a25:618e:: with SMTP id v136mr21603079ybb.432.1594373281577;
        Fri, 10 Jul 2020 02:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594373281; cv=none;
        d=google.com; s=arc-20160816;
        b=zJsQR28CQORT61jEFDFni1ofOhEBJFnw5wk2OJl4NzlkMtQu4ZSzBpeB1PCW0sJtB7
         QEFB/K19ohYIzGmsJHz2jQgw78swuRMj759WxafGYHja9hwpkKhDTaD0MMdinXidvwaj
         JRluf5J0Zdj6nU8P2ALEjmyTd8WSoO1UwC1CK/1vnV+bWhp9qARObt39vwhPAZJdUNiq
         QbJ1fJA23Kdq8kze8H4EbEDtPCaZPOvMHtjeqMpIqzlHLDxDIlsPYvh5fq4vbUY+jxA4
         WPLK7ggyddjpiKlLwoeTpXlO/hKDpUOM0tM+/zObbBXsu+zitCm0XMJRd51x+8TQF5rR
         5s9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GYM42a/VZW3mHzxpnAoFOcjsD85ZFQks0Wc0kJQbPTw=;
        b=hR8j3xS6ck+uoeFDhDOvPkTdIu7+f+yyWwCrmV/+q8gQd+UGo+0qLd1z1rTsCcrATF
         8KBpZ2ayotg/5zH8w5L949jeO8iIQCX7LAXCAOgqvrflY3WXRVjCt9MXSmJ6b1EohS6T
         yMP70DdYjrPH+IMKvR5wJc98dXRVcYNRGskuE3Z4FbBJPKEuJcJwhEDQaQDqQzf5syLL
         AMUNPpt1teFrpKiCKrZmhpqyPia17KefYKMs5gDrEb2jmVsVT0sV8Ek/sUR84MlxD0dN
         hAE8GmX3ECYDniysYVyjalxtgrBqEI327qXj+lgvcVrG6QifNEYuIvkbAACwj9sg6ceH
         19+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=njxIO1tT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si4961015ybn.65.2020.07.10.02.28.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 02:28:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=njxIO1tT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtpK5-00076j-02
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 05:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jtpJv-00073y-SZ; Fri, 10 Jul 2020 05:27:52 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:46738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jtpJu-0004Ey-4v; Fri, 10 Jul 2020 05:27:51 -0400
Received: by mail-yb1-xb44.google.com with SMTP id 2so2367960ybr.13;
 Fri, 10 Jul 2020 02:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GYM42a/VZW3mHzxpnAoFOcjsD85ZFQks0Wc0kJQbPTw=;
 b=njxIO1tTsGluVRCPdb4etDQQ7j8XEB96TsXRKLJorfNIteMJvf9J0koSYDLGmMv7r7
 CCZkIiW9RkjFKwxfxJZqB36muqsULrXsviCtsxF5araA5cgcrUvzmW8ZuT7RmkNQFQpp
 ENZiiIPFvYHtaZj0SNfCtT83z9uYAo4//3LQH79qYNexuh6A0L6Y/Ak3QP7ucwLcVna5
 9JwmMePbWnQ3stA5YfivP2ORZzHwRcdqM8wIFQw/b9l+bMOfPxjh+3rbWOJatQkI6cX4
 fta8fKcpr0Rn6XKqJCWNJrIb/NFerEnl93R6BENrEAhaWiX2JLwDVLZNQ6tcDXulL5As
 ySsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GYM42a/VZW3mHzxpnAoFOcjsD85ZFQks0Wc0kJQbPTw=;
 b=MOYHfyQPC9lWOgQWp5Cazg5WFcqtJ0trK+qtPx+lA1Y7KJqbWfJLUL0t898GFAipKr
 W9YfmIWAoKvJnff5PqcCRGTAN67+VT9ka/PlKVUqRewn21G+Y4TCN7VSjw5dlUmvhkLO
 QVKpi1YZ4Dq3NiOSphZD7spnc2atntL5AgRzGQho587XFlSLLuE+Q9k2i8VMRxK9asll
 pVvSDIT9CSl/7QJsyiGh33xxrl+i2c2qFhN962ztuRigFRnB4FgYb/aVhRDKEPE6fIH3
 lYpbYq6dXs2Rjamsw52DhB79JbpOW5P6TjvxI+AAmVA03WzXLAOXQfZ3Do0IM+97LBaA
 0KXg==
X-Gm-Message-State: AOAM530piUwggc15ebQKEh2gb0M+ESiFlroaGRcCxFr2dDpT4U6xABo/
 UXygXdh2vJG/TgDIF5csn8aQCvl7soVyCk55mGw=
X-Received: by 2002:a25:5806:: with SMTP id m6mr83374149ybb.152.1594373268329; 
 Fri, 10 Jul 2020 02:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200705220731.28101-1-f4bug@amsat.org>
In-Reply-To: <20200705220731.28101-1-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 10 Jul 2020 17:27:37 +0800
Message-ID: <CAEUhbmXV1ZvL3N7di0HgVnGmMB69H=RTFFET=3+VLyK+e3Dj8A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] hw/sd: Deprecate the SPI mode and the SPI to SD
 adapter
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Pragnesh Patel <pragnesh.patel@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <huth@tuxfamily.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 libvir-list@redhat.com, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ue7AAJmHSapW

Hi Philippe,

On Mon, Jul 6, 2020 at 6:07 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> I tried to maintain the SPI mode because it is useful in
> tiny embedded devices, and thought it would be helpful for
> the AVR MCUs.
> As AVR was blocked, I thought it was wise to deprecate the
> SPI mode as users are interested in the faster MMC mode.
> Today Thomas surprised me by posting an update of it!
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg720089.html
>
> I'm still posting this as RFC to discuss, but I'm reconsiderating
> keeping this mode a bit more.
>

AFAIK, SiFive folks (Pragnesh in cc) are investigating supporting QSPI
model on "sifive_u" machine, and it will definitely use this SPI over
SD model.

In fact, the QSPI is the last big gap in the "sifive_u" machine to
make it a complete platform for hardware replacement.

Regards,
Bin
