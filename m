Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1396128lfk;
        Mon, 5 Jul 2021 10:04:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6ZjW/xZwC/7Eb8X/+DdaVoHhSxLGV/16FrVa6R8yi6b9IeqoTZ15oA9hiKFsf7Bc0U765
X-Received: by 2002:a17:906:f283:: with SMTP id gu3mr14364972ejb.415.1625504687963;
        Mon, 05 Jul 2021 10:04:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625504687; cv=none;
        d=google.com; s=arc-20160816;
        b=hzWnatBkC5P2X6TLm3tfabZDzUUcsGwV+ZRB9R5FtNAShWOt0L9smi+MPRobv3DWzV
         H+c5O8Xnjtumryy2c22JceQWZiym5wRp2KTluV6acPZGLsnK2cuk3vedZdsu2xqbzkJ1
         yPETNvtXevstO4FUJZAKQMQhTPfOzlke+pdCL2cQlTMDoOpVsxa7ve4z6gg6oMzy5xLu
         BGLOK9J32jD0EfqMnW8xJE0fBNEA1XneIy2XlROd16K4Bg9Y5AT1n9Uh6KdvMRk792K7
         zsCbg2rkwbE0H61gdpMbsQBGcbGTlRVRo+7Mn28rquoV3vb+EUoZi4DGObnorq/9BcS1
         jKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:to:from:subject:message-id
         :dkim-signature;
        bh=lyZ006BpTP0Cg0029ChDj40RT2X+XZOXlDQR2fqBnh8=;
        b=wbNcAGP0m7JHbo7mUJ8gBG81muApPAMqOZUMEFOJfIwygT3E5u4pJ41L2OC2UtsQPO
         MoeksgwhX91PB6+bJHiEBqRG0ld4LGsRLs+7vrRd4FDPvOPerb7bfmjSec51CTpQA47u
         UMBGaB/Tt1NU/CesK5g1d2KQVsBP1nDpIonoNSWGsCnsrC1EKrzDSNEQszynbpnW5+6T
         cyG1XV6deYCoZ/sU/c3XtOtHsDedLxneRnwq1fw+G7/pIqInW5VZneRFvBFFrVF4Jrw8
         ntDSf07Rs0YM8oH3YTIYMEQqvDl3wNQfWoZq3HBu2IPtqgKkc+d0H2gZSfjUp0vuv5Ev
         LJOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vJFJwUQM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si12036373edd.96.2021.07.05.10.04.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 10:04:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vJFJwUQM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0S1W-0001D2-Vf
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 13:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0S1I-0001Bl-HN
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 13:04:32 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:38813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0S1G-0001kq-MV
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 13:04:32 -0400
Received: by mail-qt1-x82d.google.com with SMTP id h11so9705782qtp.5
 for <qemu-arm@nongnu.org>; Mon, 05 Jul 2021 10:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lyZ006BpTP0Cg0029ChDj40RT2X+XZOXlDQR2fqBnh8=;
 b=vJFJwUQMW6FzYiG4Sni2H0KOlLNF22xu4tG6Eq9J7ywnvY7t9tAEXKj8b/ULqnc2Ia
 cklY7VoTU7eDFglaN/n7juvxKaQe4bPPV5tHxL36DCIAVoLT27zOzRV/n9MVN0q6kkFl
 3gJ0up92kNTtdKuHqkcDDidDV9wvxMyEQA/zLkHgreMB8V/mjUb1NcyDVqqL9I3upF9G
 9/CET1QGVPtCq0pliXV11kx3b1IgIb0qpP2XysOE1fQnEbMPL2uC4MNX7l2XxdNmZ8Fn
 dguFyKKTuTNqDzumKlJNxBfaD9BQVNhKcc6Fxoor01h43Vq1VXSMaFy7if2Vrd4YI6Uu
 zN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lyZ006BpTP0Cg0029ChDj40RT2X+XZOXlDQR2fqBnh8=;
 b=clvv2Odp1vPgUllMucb8KBf3wF7nVr3geTOIyZneUj5Q7llOYqHlvs5dX8VjHrRKDn
 R+R2iuCIOXQJVTwzSlQBAEby9MzwE5YxVG6Qbw09coe6D0pWy+swQU/swUD3A0IHMiNK
 dd50alN/vsJwn8ia8JLw97TvBSBujsRmhuQUND5rn5qNWYnY9qA5Z95TEp5XYIqpiWZr
 aNU/7whNIVF3KZkSS0ieBXbHbm1NBoTcuhpGlqPajyTN8VOvY5Njb9JdaSrYo3249qVB
 NVCD7KXsAIisiXenf2Ixh4KoYwjl8OozHdQAS+pAT1NE5NMlFqYcFSwPZU0FhPGtbexR
 Hh+Q==
X-Gm-Message-State: AOAM531WRwr80mN60EcB7UzD9K7HuCDa6W4nWYv8rjeNUfKgGIhjdsBX
 3xxzozRd2myzC5sB3VDYoXctVg==
X-Received: by 2002:ac8:674d:: with SMTP id n13mr10600618qtp.381.1625504669191; 
 Mon, 05 Jul 2021 10:04:29 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id x14sm3394174qta.90.2021.07.05.10.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 10:04:28 -0700 (PDT)
Message-ID: <916a2c2eb368835dbd17fe0b90be541abbebde93.camel@linaro.org>
Subject: Re: [PATCH v5 01/10] hw/intc: GICv3 ITS initial framework
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 05 Jul 2021 13:04:27 -0400
In-Reply-To: <CAFEAcA_vuHRWRjg-aQ4yk4UT6h_9bPdTT4wJS5SMLyPdADZVaw@mail.gmail.com>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-2-shashi.mallela@linaro.org>
 <CAFEAcA_u=3f6sborqD9opCQv1kJHQm0+Gm1ytWx2zSzjXJTd1A@mail.gmail.com>
 <a0dca113df5b0470668095ed1f759fd7a6f102f7.camel@linaro.org>
 <CAFEAcA_vuHRWRjg-aQ4yk4UT6h_9bPdTT4wJS5SMLyPdADZVaw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 32ZIJA4KpIJ1

On Mon, 2021-07-05 at 17:25 +0100, Peter Maydell wrote:
> On Mon, 5 Jul 2021 at 16:55, <shashi.mallela@linaro.org> wrote:
> > On Mon, 2021-07-05 at 15:58 +0100, Peter Maydell wrote:
> > > On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <
> > > shashi.mallela@linaro.org> wrote:
> > > > Added register definitions relevant to ITS,implemented overall
> > > > ITS device framework with stubs for ITS control and translater
> > > > regions read/write,extended ITS common to handle mmio init
> > > > between
> > > > existing kvm device and newer qemu device.
> > > > 
> > > > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > > > +static void gicv3_arm_its_realize(DeviceState *dev, Error
> > > > **errp)
> > > > +{
> > > > +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > > > +
> > > > +    gicv3_its_init_mmio(s, &gicv3_its_control_ops,
> > > > &gicv3_its_translation_ops);
> > > > +
> > > > +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> > > 
> > > Can you remind me why we make this check, please? When would we
> > > have created an ITS device but not have a GICv3 with LPI support?
> > This check applies to GIC's physical LPI support only as against
> > GIC's
> > virtual LPI support.
> 
> Right, but when would we have a GIC with no physical LPI support
> but an ITS is present ?
If we only support Direct injection of virtual interrupts (which can
have their own vPEID and the vPE table),then the ITS present could havejust virtual LPI support 
> 
> thanks
> -- PMM

