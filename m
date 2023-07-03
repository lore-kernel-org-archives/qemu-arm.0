Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2089791ejy;
        Sun, 2 Jul 2023 23:24:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4WbvhHdUGORDGrZG7jJt4HzTrM+eREcdpss2m+NuwRtp5lpNG43RMyT1/hMhBQ5nVV1oCH
X-Received: by 2002:ac8:4e55:0:b0:401:e2bb:e423 with SMTP id e21-20020ac84e55000000b00401e2bbe423mr11241537qtw.55.1688365474723;
        Sun, 02 Jul 2023 23:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688365474; cv=none;
        d=google.com; s=arc-20160816;
        b=xZXPqR9p0Vl5wj8jH3ozs1R0b8Irj89XxNo0qkd33yhyh0oP0K83Wi4fndn/4bR5BD
         m5SX+Y57x44kKsUe1WOceNyGpoZyeLc4r038ARyBDV5JfC76l22KU6JxwyiECAaT2xBU
         QGTLnCr/P1dhHwAuUM4+UBpWQDbcFNjwVMJwSIKP+WPDdcRLBFMr3+JbFtFF7ZCJIqRv
         34JAk9ZRfZAonO9vv8uMzahHupbv7DJqUa7rK/tcaH5r+p1saPcSeA4ci0Y6gneh+pFi
         WdLOXZONr9SkEm3vOGleAnUv/Jps/I+dfMJ2U6rPa8iTZOk7zBn83ADJXY2QTMdZjYRd
         o1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=4pguoLjcaCAIS9WVe6zFE6TPqIxfCYwiZtN7MF4sCZg=;
        fh=Ds1b/2l5QebFMNAtDf8k4SI64N1ZJNlBKuV202q2SP8=;
        b=oGiihRyDbAfEbkAPuSykv9dviNFyDDPo9cunSoUkMNHJWvhJLdai0eT92D2kGCi/oW
         pek+n1dezng18ZKeKbC2zQXNLDETnUy6ylNkQQ+l2xtu4hMzIXmMC6XqIJH505QzyjSG
         /eh3aFrGRXZi1R9rg6GqH8N97XvNUPr19nNW8rZfHqsoG6/B11+ttCeTF2tfXZ7mdfNl
         GshwAynsG6YFmq/mAyKxsPrNJVAU2sQdPdeLHQglOCruWth2TEZ/UJ1CUdIH/cwPIuwN
         MrksIuZOzulk3KjjN3tzb0zn84ny1YaidVzJ10/aFhjxpV/NcjysY7iapGJDd3fq9wHF
         T6Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R9MGGYh0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10-20020ac87f8a000000b0040353e47eddsi2425802qtj.776.2023.07.02.23.24.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Jul 2023 23:24:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R9MGGYh0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGCz3-0006kt-T6; Mon, 03 Jul 2023 02:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1qGCz2-0006kc-2p
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 02:24:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1qGCyz-0000sx-Uh
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 02:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688365460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4pguoLjcaCAIS9WVe6zFE6TPqIxfCYwiZtN7MF4sCZg=;
 b=R9MGGYh0qjfb3gBYZ0BWEoQDhchzLzwjU5DuvM11md6l/NA0mChfcVHYejAaoQvA0M0bX/
 y8uLsoKbPbN7PoI34ssjArCdzVElO1bmfjncTc6ylKkgvALVrkAH7kmvzXyJHKGGTkBX/P
 /aawlr+TUNDYjIOdIIxndz66qgvhP2o=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-CfAdm7N_NdmCaNA5rdXAeg-1; Mon, 03 Jul 2023 02:24:19 -0400
X-MC-Unique: CfAdm7N_NdmCaNA5rdXAeg-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b6ad88815eso35502441fa.3
 for <qemu-arm@nongnu.org>; Sun, 02 Jul 2023 23:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688365458; x=1690957458;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pguoLjcaCAIS9WVe6zFE6TPqIxfCYwiZtN7MF4sCZg=;
 b=CYxFC/EPY4ifE4yCDEMuetG1AQ16f7IkxH7msypg4KxyuzDfYcq9YoomrH/wQo4zhY
 PRz6WYHlssIP2gtcdMs/0GeEmS9h7Ppv6H3NqclueEaRi80ag85nUW2JGS0rzL76F0KV
 7FjGNRmfp/plIPyNGorj6tftbv6ONh2OMsbOqbqmV353kyDdYdDCnAK4zG16vrW/yK/Y
 ywXaD/2iAZ9iMy34eLe6b7IMUaJROpwlMOZONjaJBnQbjOtdqA1QgduMcpo3oOn1UhIt
 TG+0LXltleLbIm5kF8kpvnjO1kFHkxfmb80alqiK9MQFS6Ixv/wUXldl9reb+IMFCrf+
 Xhrg==
X-Gm-Message-State: ABy/qLazz1WtTgQTfL9JJT6VKuvrA7hc02HMV9Jzq/g2y4rVMQAl21PK
 qmhYylvLlUxjxlJXFeegtFtzR7bFwTXwtdDCjXBoyhJwI+IAIRps54i2+l4t2z+mcRrxC5bWo8Z
 jcwlFQ2o4cqFjKw22Sq+9jOaQGcWQ
X-Received: by 2002:a2e:9856:0:b0:2b6:c349:e276 with SMTP id
 e22-20020a2e9856000000b002b6c349e276mr6236458ljj.20.1688365458188; 
 Sun, 02 Jul 2023 23:24:18 -0700 (PDT)
X-Received: by 2002:a2e:9856:0:b0:2b6:c349:e276 with SMTP id
 e22-20020a2e9856000000b002b6c349e276mr6236436ljj.20.1688365457865; Sun, 02
 Jul 2023 23:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230625015321.77987-1-bmeng@tinylab.org>
 <CAEUhbmXVL8YLEDgPhj9zxhAt70nMF5=TXn491-tCOxoHaF=+QA@mail.gmail.com>
In-Reply-To: <CAEUhbmXVL8YLEDgPhj9zxhAt70nMF5=TXn491-tCOxoHaF=+QA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 3 Jul 2023 14:24:06 +0800
Message-ID: <CACGkMEsirSC0Y-r_F+tvGim+S=uFB7LypjLjjjMz3htwdSj4ow@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] net: Pad short frames for network backends
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Bin Meng <bmeng@tinylab.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Helge Deller <deller@gmx.de>,
 Joel Stanley <joel@jms.id.au>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: H645AZnfA3y6

On Sun, Jul 2, 2023 at 9:35=E2=80=AFAM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sun, Jun 25, 2023 at 9:59=E2=80=AFAM Bin Meng <bmeng@tinylab.org> wrot=
e:
> >
> > The minimum Ethernet frame length is 60 bytes. For short frames with
> > smaller length like ARP packets (only 42 bytes), on a real world NIC
> > it can choose either padding its length to the minimum required 60
> > bytes, or sending it out directly to the wire. Such behavior can be
> > hardcoded or controled by a register bit. Similarly on the receive
> > path, NICs can choose either dropping such short frames directly or
> > handing them over to software to handle.
> >
> > On the other hand, for the network backends like SLiRP/TAP, they
> > don't expose a way to control the short frame behavior. As of today
> > they just send/receive data from/to the other end connected to them,
> > which means any sized packet is acceptable. So they can send and
> > receive short frames without any problem. It is observed that ARP
> > packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
> > these ARP packets to the other end which might be a NIC model that
> > does not allow short frames to pass through.
> >
> > To provide better compatibility, for packets sent from QEMU network
> > backends like SLiRP/TAP, we change to pad short frames before sending
> > it out to the other end, if the other end does not forbid it via the
> > nc->do_not_pad flag. This ensures a backend as an Ethernet sender
> > does not violate the spec. But with this change, the behavior of
> > dropping short frames from SLiRP/TAP interfaces in the NIC model
> > cannot be emulated because it always receives a packet that is spec
> > complaint. The capability of sending short frames from NIC models is
> > still supported and short frames can still pass through SLiRP/TAP.
> >
> > This series should be able to fix the issue as reported with some
> > NIC models before, that ARP requests get dropped, preventing the
> > guest from becoming visible on the network. It was workarounded in
> > these NIC models on the receive path, that when a short frame is
> > received, it is padded up to 60 bytes.
> >
> > Only the first 4 patches of the v5 series [1] were applied in QEMU 6.0,
> > and the reset was said to be queued for 6.1 but for some reason they
> > never landed in QEMU mainline.
> >
> > Hopefully this series will make it for QEMU 8.1.
> >
> > [1] https://lore.kernel.org/qemu-devel/859cd26a-feb2-ed62-98d5-764841a4=
68cf@redhat.com/
> >
> > Changes in v7:
> > - new patch: "hw/net: ftgmac100: Drop the small packet check in the rec=
eive path"
> >
>
> Ping?

I've queued this series.

Thanks

>

