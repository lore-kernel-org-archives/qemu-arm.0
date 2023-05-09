Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2671021ejq;
        Tue, 9 May 2023 05:12:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7JsvVB09esqeMUtU8VFSq4IqaC77pBu31YjJsViI1i4EBwhXNVjHH2CJ4/4p2/92EuVUR+
X-Received: by 2002:ad4:596a:0:b0:61a:ee15:4a93 with SMTP id eq10-20020ad4596a000000b0061aee154a93mr14650824qvb.28.1683634372340;
        Tue, 09 May 2023 05:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683634372; cv=none;
        d=google.com; s=arc-20160816;
        b=LjF1OrRc+cG5OtCdLhhOVZpxp06kD+eRTh5ucYcm2LIf57Ic/03tkXcJZw3yDQSiri
         RwxZiUTTXhGNyKaJMSJQ9SWzWYmnhvLESfFvpVRUpmd8bWwRA6AupZYZBdsh5Ltl4Hp0
         TVrYjb5eEvJOCDBPBAHjGdcrRCcH8/lO09xH+fdDPW2ax89wgdcIm/rzK6tu4vhqiHa5
         IgRkEvCsYFcehOGkA0oEPM7BoRAAmWGR+rcm7dSCIY4+BZFWn0Za9Fag4ClubCmgF1og
         LTXDzyCIEdKkPD1uPvUEll/zswcT1OxNNFdnbCjV7RJCGZab902Ub2q3UaYBe28PpObm
         FgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=SoinHz6iMwjXA3ffGSWaQONYfahVOdpHtjkPj73402Y=;
        b=i8XenURkdDCjhqL/ghBRDLEmaQlrL1YwOPxzQiwJ3debLqhP5PtRDKxYBpIDK9+4f4
         hl5CSZ1HxLOr7YRjBcR7DdWTLu9zcu10svSlcTvN0J1DaatTsJIcK9V+QognMBnPOZyz
         SvNk+BuQxhdGrFXwInPOua5Ca64TsDNflGRJxlOL9ldLjgNtzmDXtenIjkebxiXxeNfZ
         0LGWVhruv9qbNExDi4JCzPe3DVP7cur25n7ZA42B2rIVZnMZFUJqvCqQaOjgJaxVWHw+
         Y3KYTFmryW+LcNhAQ3dlMldWnu9PRJI992pi2WLjE8OZ93/vZFU7kmH4usN/eDQOhjcN
         aiSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zpZ81hiq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eo13-20020ad4594d000000b0061cf6bf685asi876390qvb.267.2023.05.09.05.12.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 May 2023 05:12:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zpZ81hiq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwMCd-0007g4-C6; Tue, 09 May 2023 08:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwMCc-0007fh-Mw
 for qemu-arm@nongnu.org; Tue, 09 May 2023 08:12:22 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwMCZ-00007T-NI
 for qemu-arm@nongnu.org; Tue, 09 May 2023 08:12:22 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bceaf07b8so10936155a12.3
 for <qemu-arm@nongnu.org>; Tue, 09 May 2023 05:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683634337; x=1686226337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SoinHz6iMwjXA3ffGSWaQONYfahVOdpHtjkPj73402Y=;
 b=zpZ81hiq3j3RKKgMY/xYC/pM26SqCtgLvwh3d3hadsNFbeNytiVurVGdhelh5vf7Vk
 2jbF/yTntCgnAJssV+JtXF4anwqQYOPzb4QG9KLizL0MJ988xhVZFM0HWDolXoA+06MN
 ZNX0bwAGS4/PZw8tt6uuG086fUHUdy87RtTYbRxYIj0pnnRdgmTBs58Y1NoLhtxm7aeh
 h/OvshLw+kGJA6HwOUWsHOWA/6N0A/pIbaaUjM9dkzydD34gameLM34ijEroToJO+Mxt
 DHrCc2Si7Ozg+Zl7rLEk9tbORhDZ6ShguDqWR+ObAbsZWocc2ePh01xEHvfU4QQAvRni
 +1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683634337; x=1686226337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SoinHz6iMwjXA3ffGSWaQONYfahVOdpHtjkPj73402Y=;
 b=C5HxuEBzbzHtNy1A+j3ALMj1FBmoQDPKYqsgbcqwwiITmMQNsYkjlhUiQrTWIZYaju
 7FteC/4VcfWQxwMSL9ZZgrYrKfK2atihtWysKurY5odtqdj5Xv/d7oTUIIDkLvyOpJgm
 OrlEK6/BCAuPChbbMbictpfUyERM6wPU0b5Jxi/BiglN2TCjGNoOHFHeMzZmS7S8PY4e
 +yeYfRbchn2MDY/0JEDr3uxG2M6hiG2twzRFWBMpDBoWB0mbzqUKqFJlF/x+J3HtL73o
 tNf/ZdkZbwCR6uIJon+7LhLSQ4ipmHNTMw3RoQjBNPy4XSR4RqG2mYSXud5TdKOFMnsV
 IxeQ==
X-Gm-Message-State: AC+VfDyAOP+N8VWQX+YUsMUJuQPT7FVsnEkiy+s7lMlfueKT6eh8pbBm
 yrysz3fg/CEjahJ5SggcCnGCPrumx2h5BVM91Bv9bw==
X-Received: by 2002:aa7:cf92:0:b0:50b:c3a3:be7c with SMTP id
 z18-20020aa7cf92000000b0050bc3a3be7cmr9828039edx.30.1683634337613; Tue, 09
 May 2023 05:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <11bf324.342.187b3418349.Coremail.wangyuquan1236@phytium.com.cn>
 <CAFEAcA9pa+uHGk34uCGX1ZHiCBDeDHXFLDFyVDAVvDxQScEChg@mail.gmail.com>
 <70009a13.15f.187bc308951.Coremail.wangyuquan1236@phytium.com.cn>
In-Reply-To: <70009a13.15f.187bc308951.Coremail.wangyuquan1236@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 13:12:06 +0100
Message-ID: <CAFEAcA-jZBiSL8vNzgcwUT2Lqtgf9JyyaQx7kD4j=Tc9neD_OQ@mail.gmail.com>
Subject: Re: Re: Problem of initialization of platform-ehci-usb in sbsa-ref
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
Cc: qemu-arm@nongnu.org, rad@semihalf.com, quic_llindhol@quicinc.com, 
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: fJhNUZmZgFyK

On Wed, 26 Apr 2023 at 07:11, Yuquan Wang <wangyuquan1236@phytium.com.cn> w=
rote:
>
> > On 2023-04-25 16:34:04, Peter Maydell replied:
> >
> > On Mon, 24 Apr 2023 at 13:33, =E7=8E=8B=E5=AE=87=E6=B3=89 <wangyuquan12=
36@phytium.com.cn> wrote:
> > > As a junior OS engineer, I met a problem of initialization of platfor=
m-ehci-usb in sbsa-ref recently.
> > >
> > > The result of sbsa-acs(UEFI Shell application) on sbsa-ref shows that=
 "Peripheral: Num of USB controllers: 0".
> > >
> > > And I found that the platform-ehci-usb in qemu is a 32-bits DMA devic=
e while our sbsa-ref machine does not own
> > >
> > > DRAM memory below 4G. It seems like a contradiction point.
> >
> > This definitely doesn't seem like an intentional thing.
> > What specifically do you mean by "32-bits DMA device" ?
> > Is our implementation of this device accidentally not
> > handling addresses above 4GB? Or is the specification of
> > the device itself limited to 4GB addresses? Or is this a
> > guest driver problem?

> Maybe the specific explanation is that qemu implements that:
> In hw/usb/hcd-ehci.c:
> void usb_ehci_init(EHCIState *s, DeviceState *dev)
> {
> ...
> "s->caps[0x08] =3D 0x80;"
>
> According to EHCI spec version 1.0 Section 2.2.4,
> the set of "0x80" on Host Controller Capability Parameters
> Register means this(qemu) EHCI Host Controller does not have
> 64-bit Addressing Capability.

Ah, I see; thanks for providing the reference to the spec
and the source code.

Gerd, is there a particular reason our EHCI controller only
claims to be able to do 32-bit DMA ? Should we give it a QOM
property so boards that only have RAM above the 4GB mark can
use it ? (Would the x86 PC benefit from allowing >4GB DMA?)

thanks
-- PMM
