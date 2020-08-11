Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp393054lfy;
        Tue, 11 Aug 2020 05:20:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4rqkn2+zq5A3bSVtpTkRo94T79ZbpF6WA4t26g7VTucPJPTiK1Fo5whAhEpG5lhrVwEqK
X-Received: by 2002:a25:3a05:: with SMTP id h5mr47953650yba.296.1597148432067;
        Tue, 11 Aug 2020 05:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597148432; cv=none;
        d=google.com; s=arc-20160816;
        b=JRn0Z/F1yh2a5KqtA9MoVUK9QVG6OK8DLd9hICXZRCSX0ap0iJ+e+E0BclZVJX7r5E
         K0wwnXyA6oXZtwISzMkB6f5USEINcFOBS1J2wjPh4fH1X+1qrK/6apCxTos4FsqMoEWY
         XkVJLfCdKT0cGjzhzFe10srAt0lCs6fHJ9kj7dvvBYg+17fFfcN9hytRFxbZKSJH7M0A
         gcCjo22lY5YW3jMulP9u+mscdKLgWvKcydXJTZQiB++uHCSTHxFUUhXbg+nV7JHP5gIB
         eVY9Z+7aLIjUCpvtBJeB3VRDpJN1qtV8VZCiASg4+XIN1GTBuciNxe1kb1DeJnWYX64h
         Hvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=tasXQlAhulh1xqs4/Jtu33okRVHTUKddXMBo83ZXQx8=;
        b=MfnRSdGwkQGbsPNkMjoePh7gt9CSCi34agD3hRS+nguXeRW9h08JWaA9usVOp40kUl
         3N0dWYvvTZy/uysBxIG3oikgzPS7xl6dIyRgJ/+xcMKW1G431lpsZQCUxrGCD3tv6Asi
         TOTNFhOFf4WvYzBFfxIeAe1u+EPPTPqLtdNPAzrBHJtR0zpNTtbcP4qYQghOhitNWtm9
         T/9vKXU4DkVf801T7LeMZCY7X1n8ez5GlRTFb53oj7uF+UVQSSit5sP7TgMpYaik64L2
         uIyclsK26KTTWkU7qJz/eR0YDIzEj0pdtQUz5shhaKVwkwrKJLs/6YLXuEVe/Im0w+N1
         po1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ao5qsntn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i67si22489368ybb.71.2020.08.11.05.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Aug 2020 05:20:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ao5qsntn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5TGZ-0002E6-GF
	for alex.bennee@linaro.org; Tue, 11 Aug 2020 08:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1k5TGR-0002De-3d
 for qemu-arm@nongnu.org; Tue, 11 Aug 2020 08:20:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55269
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1k5TGO-0004La-91
 for qemu-arm@nongnu.org; Tue, 11 Aug 2020 08:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597148418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tasXQlAhulh1xqs4/Jtu33okRVHTUKddXMBo83ZXQx8=;
 b=Ao5qsntnJdmgkvAzeAX15tugpfnikFJWD3dm6PtZfruPO0N9eyPfJnTg+42GnlXNFYY5t3
 mlfEKHiM1VvwPYhHnePPK5yAep04310q4M6nBqNTPcBPkvvs3VZ9yfMQBxOfv4AnfEFZfs
 tUur2/VxIol7PupeB60VWXQhl64gQFQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-MXvWURVpMn-3kHSw3Nhnhw-1; Tue, 11 Aug 2020 08:20:13 -0400
X-MC-Unique: MXvWURVpMn-3kHSw3Nhnhw-1
Received: by mail-ej1-f71.google.com with SMTP id ew2so5017760ejb.8
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2020 05:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tasXQlAhulh1xqs4/Jtu33okRVHTUKddXMBo83ZXQx8=;
 b=KQBn+77jMbbfETKjo9d8+giYkLuEGzIqBefMV2gdmq/Q9QxA+JHwqD02t+SSAv/KMf
 PiZsGXEUaUTnZOp9QCngg/C9/FWCHOtZ5vtN5acAXPdkMoKBs8O7sVskjwCOk/a+fW/Q
 7gh4BqFsUicolGrUcpzIP9LPuBTuDqDEPyH7KSRZyUwfkk2n6K0Vqz1uJHdgC/USNdml
 GWXHflVpcii82dX0bvelGng3zIKMqV+heg+PdKKpugIwbw6KhOZc6piOtukM8wzz9zKM
 3wn0VjBpDW6nceTCDpzejMOkPgaeeGJYWpva7yWpT1F+iSAOuFVIbzGaXhfewPR5e7Qs
 9kGg==
X-Gm-Message-State: AOAM532Zk+zz1z5Ud+PsUVr3+OBsNunaGSHpoz58CBEXA8R8fkwookLC
 XcEs/fj//3JO2hU3DV/gIwDyI9D9TaU5cVGlMCCm7hjunYtWMQReduWjiw3i117YIluBVZnihsa
 ZeSjFBlisbT+edDrb2Fc0eGEhEngT
X-Received: by 2002:a17:906:3816:: with SMTP id
 v22mr25709996ejc.105.1597148411017; 
 Tue, 11 Aug 2020 05:20:11 -0700 (PDT)
X-Received: by 2002:a17:906:3816:: with SMTP id
 v22mr25709981ejc.105.1597148410782; 
 Tue, 11 Aug 2020 05:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-15-clg@kaod.org>
 <CAA8xKjVfG8cp_g6FDNxUCQ6dqiMHnf17eMNCE2Wz+Vr+grAprw@mail.gmail.com>
 <b0e8e4d3-5250-ec81-7ce5-146bba1d5130@kaod.org>
In-Reply-To: <b0e8e4d3-5250-ec81-7ce5-146bba1d5130@kaod.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Tue, 11 Aug 2020 14:20:00 +0200
Message-ID: <CAA8xKjW0GBdCeJ7=ApmAAEpVMJQLMJwTt2C60YZYSBUq0kdWZg@mail.gmail.com>
Subject: Re: [PATCH for-5.2 14/19] ftgmac100: Fix integer overflow in
 ftgmac100_do_tx()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mcascell@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 04:41:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Frederic Konrad <konrad.frederic@yahoo.fr>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Ziming Zhang <ezrakiez@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iS+J4Gfk9K11

On Mon, Aug 10, 2020 at 7:14 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 8/10/20 3:43 PM, Mauro Matteo Cascella wrote:
> > On Thu, Aug 6, 2020 at 3:21 PM C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
> >>
> >> When inserting the VLAN tag in packets, memmove() can generate an
> >> integer overflow for packets whose length is less than 12 bytes.
> >>
> >> Check length against the size of the ethernet header (14 bytes) to
> >> avoid the crash and return FTGMAC100_INT_XPKT_LOST status. This seems
> >> like a good modeling choice even if Aspeed does not specify anything
> >> in that case.
> >>
> >> Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
> >> Cc: Mauro Matteo Cascella <mcascell@redhat.com>
> >> Reported-by: Ziming Zhang <ezrakiez@gmail.com>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >> ---
> >>  hw/net/ftgmac100.c | 19 +++++++++++++++----
> >>  1 file changed, 15 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> >> index 280aa3d3a1e2..987b843fabc4 100644
> >> --- a/hw/net/ftgmac100.c
> >> +++ b/hw/net/ftgmac100.c
> >> @@ -540,10 +540,21 @@ static void ftgmac100_do_tx(FTGMAC100State *s, u=
int32_t tx_ring,
> >>                  s->isr |=3D FTGMAC100_INT_XPKT_LOST;
> >>                  len =3D  sizeof(s->frame) - frame_size - 4;
> >>              }
> >> -            memmove(ptr + 16, ptr + 12, len - 12);
> >> -            stw_be_p(ptr + 12, ETH_P_VLAN);
> >> -            stw_be_p(ptr + 14, bd.des1);
> >> -            len +=3D 4;
> >> +
> >> +            if (len < sizeof(struct eth_header)) {
> >> +                qemu_log_mask(LOG_GUEST_ERROR,
> >> +                         "%s: frame too small for VLAN insertion : %d=
 bytes\n",
> >> +                         __func__, len);
> >> +                s->isr |=3D FTGMAC100_INT_XPKT_LOST;
> >> +            } else {
> >> +                uint8_t *vlan_hdr =3D ptr + (ETH_ALEN * 2);
> >> +                uint8_t *payload =3D vlan_hdr + sizeof(struct vlan_he=
ader);
> >> +
> >> +                memmove(payload, vlan_hdr, len - (ETH_ALEN * 2));
> >> +                stw_be_p(vlan_hdr, ETH_P_VLAN);
> >> +                stw_be_p(vlan_hdr + 2, FTGMAC100_TXDES1_VLANTAG_CI(bd=
.des1));
> >> +                len +=3D sizeof(struct vlan_header);
> >> +            }
> >>          }
> >>
> >>          ptr +=3D len;
> >> --
> >> 2.25.4
> >>
> >
> > I can confirm that I can't reproduce the issue with the above patch. Th=
ank you.
> >
>
> Can I count that as a Tested-by ?
>
> Thanks,
>
> C.
>
>

Sure. I wonder whether we should make 'len' unsigned, though I think
it doesn't really matter due to FTGMAC100_TXDES0_TXBUF_SIZE. What do
you think?

Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>


--
Mauro Matteo Cascella, Red Hat Product Security
6F78 E20B 5935 928C F0A8  1A9D 4E55 23B8 BB34 10B0

