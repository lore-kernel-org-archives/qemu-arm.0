Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1334509lfm;
        Thu, 2 Jul 2020 03:16:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmFoNkwiLvof/uDJuFTfXiTllEXZPfgKPOLqUtlpfzIvb1WnHrdXa62JXtk1MkW7QQrJqP
X-Received: by 2002:a25:77cb:: with SMTP id s194mr37914261ybc.216.1593685005566;
        Thu, 02 Jul 2020 03:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593685005; cv=none;
        d=google.com; s=arc-20160816;
        b=aBmtvOY8g5tldUh+7lgQv8ggsj7UMImLuG2BEvWfMyjsLq23DtYygLcC5lsnTThkNj
         Mbp1WqQTsQeYb1R8bwg7MBTEILK9F0h0oU5A0AjCWeLEgRmWgQKLUNH7KwQRmsc3YK/D
         5JOxIEO6pRrVOFEi8VkiAGQWejGUuwF/s9kj43z/S3w0J51nsZ/0B2moZeTe0d0Mn2x/
         UwK1m77QK8cXympjhxXketZ9TeXSq0P9vxbVj4nojTN81S+EH+4J2ZIETO29LVH3fO40
         3jFg5qVXG/M5pg5ukNIKQz2BKNjV+v+6RFhzo/W7rqpHYxH0klxEeFQWUmXBbM8yatEx
         6H8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UWN2LvMR4+wZKOGbBatXV5yL1BBFMAl4Muf3y1lL4VU=;
        b=kBF/83OekV84G4Fit+sT0WBIZ8NfT0uEKk7BJDYDNii5eYe78ejKHiQdS02JVoCHkx
         8dBQEUypHoN3dl0fyNFQTFrx1SI4rzAC4XixtmUB7IUPC9oJgdu1QulLnN/YAn6xue+M
         6QdPPcy4gHww8FIAsrZNmUCsV8g8K2kyvBMMGau/WooVDf+Eqoh6qAfLerqfWgMjTVW6
         Vu5l7ECBRtP2BcdW0U9xaNglRpmVXb3wYFF2Iv5fmukKZs1tOb4s7od78GqUT2ug924g
         m4OI5P7AxpSj0iFCgrJPCxAL/NV1Tg4fjv4FUTw4VtIanUk1ExIAeH/blMHCYeZ8SPCK
         S6lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QyUIzuAF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v82si8539494ybb.285.2020.07.02.03.16.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 03:16:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QyUIzuAF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqwGq-0004YI-Tv
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 06:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jqwGT-0004XR-M5
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 06:16:25 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jqwGP-0006bC-Qn
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 06:16:19 -0400
Received: by mail-oi1-x243.google.com with SMTP id l63so21796755oih.13
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2020 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UWN2LvMR4+wZKOGbBatXV5yL1BBFMAl4Muf3y1lL4VU=;
 b=QyUIzuAFvOCWP+lznnzFPMNBMEHhzwywbqlFYnbs9mLGfsiqmC56K4FptLnzjKtIxc
 qoMn7P6y/4QWNO8WNNK9SpWUZ2DF04KcALOcUtnkd1S+KLiDJvLRkVwVZIWUPMeixwyM
 LF6uv0sRx/H0kdkKXEt3WCSEfO9ri2MQFElf9K7420YNJRFw/8SELzjUs7VZtaHmUjbX
 YLb8UmmpTNGd7vnaEixJYEFUH5g3r0qt9DSyxnN0kTcIHqh0/Um9WtLfeqixzHZfssk2
 zFxtdYQVYswGk5xGMrN9t2bsItCjHUf64p/VfbIQMVgyLb/9IdWrE/DLMjSAxqIJBrqL
 uzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UWN2LvMR4+wZKOGbBatXV5yL1BBFMAl4Muf3y1lL4VU=;
 b=rlSHVChRUmXk3XmnoaAYrvXC01m69OFPCVF3YIARwFDvL6DjY7+ahXvk64xYdnkjN6
 CdoQF6cJZNKVL/EI/+YB8eZyrdsjcZKRmn2yoRRjNS3v5Y2hzltm1I21pNbSqn56qeZ9
 4kFssr0svyQnUQtRdFeOjb4fkQq9U+uO3JG122P0u4GdncFt7U1STRcYyUJwOLABDLKE
 6WrikOhOsquLltXKb5DopT9vCKN5RQhPRrWYnqlb2CY1SPDl53r9dCMfKsPXWsosxJ3k
 vqshK3boYuPBGbMkoYNwszNSfvyk/KAHzQpnfpfnK5OirOg/yNfGRoTh15urO5OhXZhs
 7wdg==
X-Gm-Message-State: AOAM533conF8G+pNBRQkFnElpPRjVG+deDNp0ekZ//RD+966g+u8L/eY
 yzECP8ql6gQ+UaGqN3vp0o7WXdLNyqwiHwXVf2xgEg==
X-Received: by 2002:a54:4694:: with SMTP id k20mr22543911oic.146.1593684975090; 
 Thu, 02 Jul 2020 03:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200629140938.17566-1-drjones@redhat.com>
 <20200629140938.17566-4-drjones@redhat.com>
 <20200702055245-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200702055245-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Jul 2020 11:16:03 +0100
Message-ID: <CAFEAcA8EWAnXQ_9_S_7G0yY5EUJp0qshEPmpVuFf8943qfzn4Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm/virt-acpi-build: Only expose flash on older
 machine types
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jones <drjones@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 ard.biesheuvel@arm.com, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: me3jQwr8dFo8

On Thu, 2 Jul 2020 at 10:53, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Jun 29, 2020 at 04:09:37PM +0200, Andrew Jones wrote:
> > The flash device is exclusively for the host-controlled firmware, so
> > we should not expose it to the OS. Exposing it risks the OS messing
> > with it, which could break firmware runtime services and surprise the
> > OS when all its changes disappear after reboot.
> >
> > As firmware needs the device and uses DT, we leave the device exposed
> > there. It's up to firmware to remove the nodes from DT before sending
> > it on to the OS. However, there's no need to force firmware to remove
> > tables from ACPI (which it doesn't know how to do anyway), so we
> > simply don't add the tables in the first place. But, as we've been
> > adding the tables for quite some time and don't want to change the
> > default hardware exposed to versioned machines, then we only stop
> > exposing the flash device tables for 5.1 and later machine types.
> >
> > Suggested-by: Ard Biesheuvel <ard.biesheuvel@arm.com>
> > Suggested-by: Laszlo Ersek <lersek@redhat.com>
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
>
> So who's merging this? Mostly ACPI things so I guess my tree?
> If so can I get acks from ARM maintainers pls?

This is on my to-look-at queue but in theory I'm on holiday this week :-)

-- PMM
