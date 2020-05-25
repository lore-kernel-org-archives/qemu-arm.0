Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2003684lfc;
        Mon, 25 May 2020 05:50:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/nY63ulOByInqSHUL2FJ+4Hgzo/VNaB9Q8/SdQuJEQtDm0zAP6tT++rVF6D1gOqpBxdyd
X-Received: by 2002:a25:846:: with SMTP id 67mr40577062ybi.210.1590411018833;
        Mon, 25 May 2020 05:50:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590411018; cv=none;
        d=google.com; s=arc-20160816;
        b=PfidFAwAvoQe6oD7VJiw3srjBRSQf3r0lsxbL7FLBTWzQW3EKyim67qGd6nbvEOn6w
         qnLOpv9W+OOAavCMxAt9KF6mfBATckvFJQ0bO2BCxNqHe1Z7zurWC3tmM/wqlTITYih7
         jAk4QRsKiYOc5774uNPQhoMlKlv3dVthfneJ16OvnZKJZI29hrp1PvILUM8HCDnwJUfo
         W6iQh1mMKRDHZVVvsOD2Q4is8ECZWpxSClfj0tI9tervPewyzC9MzKRW7c3hv0PPAWlA
         Pclw6bH0EJ8oZXc0OCrQtLBSZcjPTzC8dUHQRSJUnnWrU4HzTaWFflKNwR79G5CijYDk
         A8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CAKnaon9zo5ntl1jqDwL6CfW5kbbWJSVcRaKtg/ySyQ=;
        b=g+Sy02rZRxx50viDx4UJnn8H3/S8/0C/9DkYCFLu5wYt0raxhrvXYt1xuXei3a90u0
         vQjSu4MCPGc2yKmc/rdjc4zhO78GFm1D/PPyRzkMgcUveysMTfvZ3OTrDFML2mIcQDQ2
         aPp00Xz49/KToM+0oYWX7B+GmrQeUCKzF/bYKTko/61qnHBTD3vpRB7mzDdYvoLDFYJi
         AY9ypSqkcZWynTv6po5kTr2/mxYx3MckmMNqGk64bzUPpVxj72aVr9h3xsW3KH/LlH9W
         8JNH5t74w3w/9F3I3UdakPKLaK4/mspB24xKdp8/O0/4bl/fxhK1vcERuX4KkceLPQ6D
         aE/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JgOCApKu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j143si10383252ybj.99.2020.05.25.05.50.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 05:50:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JgOCApKu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdCYc-0002Pn-78
	for alex.bennee@linaro.org; Mon, 25 May 2020 08:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jdCYQ-0002PA-Hn
 for qemu-arm@nongnu.org; Mon, 25 May 2020 08:50:06 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jdCYP-00070A-KS
 for qemu-arm@nongnu.org; Mon, 25 May 2020 08:50:06 -0400
Received: by mail-oi1-x243.google.com with SMTP id b3so15878305oib.13
 for <qemu-arm@nongnu.org>; Mon, 25 May 2020 05:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CAKnaon9zo5ntl1jqDwL6CfW5kbbWJSVcRaKtg/ySyQ=;
 b=JgOCApKuQ5Qaj0/XqM0V/D84RhyKhBf7DLvj6tsHdM/fnqM9CJ+3uXAQVlOkNXIHkq
 UucoJllB61JiWiCxPoLuWb5b6WYHCTLEWb9RC3T8Oflh91hB5ERh/qruo9Sm8lUvJLyb
 +87yrqRKF0ppOYAqcgHdeG+xk6IMo2kKgJzKhXf532HTn/uV5FbTwWaVLrivMSAWxx3u
 14NFUvotzAG0fnDHXIx1bDc7jY5TVocbEa9K96f7nVO9wUsBIkYvmeaIbVqOsYZIhaII
 EzPnw1Bq/unZ/IMib1pefn01JL7F17thlk8jQyIgUfSeXC9s9o3/vW4L99F30gt0YGrk
 002w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CAKnaon9zo5ntl1jqDwL6CfW5kbbWJSVcRaKtg/ySyQ=;
 b=ZSUjBQ7FRWxJbHVz2XCZX/pk85FySkbMBb1JLjonPUmJa8K+C8twe1xC3Mupt5n7gn
 kMMhHpD7w7aZ/ZIuOXs6FndAvP9ELoCZ56zoeDPzTciKdwHZq2SMHGViqW6yDScZD3+Q
 lJhisKC9NdObw3qcSvg3psXC9NjEs2cwj1WnB3Xpm32OOMimYzEToi3YyfvpnYJi+jTv
 Akd/UDylKLNJA6B4OifUIL6jZqz/m1p7qNYHskBuBjYkVo8UlSTqh+CGdHOSdQbfPltS
 BZEPrVkneIZVXsMdWOBds7Ak/txSrPxL3m6AMP8VfczD5awdF+xA/Y++O8Bjnb3nKrNA
 FRRg==
X-Gm-Message-State: AOAM5304hguwhVdusQRlAqQgqXX/VCATcJgTKpHXzvZYZYzXjBO32edl
 7gHq03QmepYxpgwtsGOdEEM5uOH1CaZM0sRMP1N2NA==
X-Received: by 2002:aca:ed16:: with SMTP id l22mr10530103oih.146.1590411004556; 
 Mon, 25 May 2020 05:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-7-armbru@redhat.com>
 <CAFEAcA9UampZxo-4Z=6+LKkC9HLrdGYT5AcLyiGVYvgU5VE+cA@mail.gmail.com>
 <878shgh8be.fsf@dusky.pond.sub.org>
 <3ebe626e-0373-0eee-6a54-27a88d656122@redhat.com>
In-Reply-To: <3ebe626e-0373-0eee-6a54-27a88d656122@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 May 2020 13:49:53 +0100
Message-ID: <CAFEAcA_ddMMCJm+ykRdBxW5BpyMQHbZLAELr=fAGfs3H4TYXyw@mail.gmail.com>
Subject: Re: [PATCH 06/24] armv7m: Bury unwanted "ARM,bitband-memory" devices
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: qemu-arm <qemu-arm@nongnu.org>, "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pw+JJcT+p1Ki

On Mon, 25 May 2020 at 13:32, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 25/05/20 07:50, Markus Armbruster wrote:
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> >> On Mon, 18 May 2020 at 06:04, Markus Armbruster <armbru@redhat.com> wrote:
> >>> These devices are optional, and enabled by property "enable-bitband".
> >>> armv7m_instance_init() creates them unconditionally, because the
> >>> property has not been set then.  armv7m_realize() realizes them only
> >>> when the property is true.  Works, although it leaves unrealized
> >>> devices hanging around in the QOM composition tree.  Affects machines
> >>> microbit, mps2-an505, mps2-an521, musca-a, and musca-b1.
> >>>
> >>> Bury the unwanted devices by making armv7m_realize() unparent them.
> >>> Visible in "info qom-tree"; here's the change for microbit:
> >>
> >> What does "bury" mean here? To me it implies "they still
> >> exist but we've stuck them in a hole somewhere and covered
> >> them up", but the qom-tree delta suggests we've actually
> >> really deleted them?
> >
> > We really delete them now.
> >
> > "They've been lying dead in the streets; give them a decent burial".
> >
> > Would you like me to s/Bury/Delete/?
>
> "Bury unwanted" -> "Dispose of unused"?

Yeah, delete or dispose of would be clearer I think.

thanks
-- PMM
