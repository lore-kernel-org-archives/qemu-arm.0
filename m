Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp2931371lfg;
        Sun, 11 Jul 2021 23:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk00otOp4Wz+yTLW/e2dSXJ8Bc74zZjQ3KpGxMHNAhf7NUK3yE/or59/Be+/1iquTxw9TQ
X-Received: by 2002:a05:620a:14b5:: with SMTP id x21mr13457051qkj.148.1626072399171;
        Sun, 11 Jul 2021 23:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626072399; cv=none;
        d=google.com; s=arc-20160816;
        b=vyGeWhEIuUwyMSyfM0MOD1DjxZUin1/CbEcUwCswec4REE7uNYENTI3BB9nuxP5e1K
         2rnKQTGcl/nFwL0Yid0FDCnuwZZGh9KNIvwFBlm4OdRUiRrRXQP2VJv9dPYlf+TJa8qc
         PEwZa4hmr7X92C7u7JipXJigbljU4TEyiBzqmVXG1L1Akd0tx4A6oud1tIK+Ubo+Rs77
         j6Yf1FfiL6eGmduhEY/f90T2cl8J2ovNTvXKcdmpTQYq5qsvVJDOGyExtnW1CZNbSWwR
         1wPtNldNn+AD37fM2eKp0SqYN3CanjeaTVqqB5chLbMq+zPYMjhmxiTw3x/8dWgF7MMS
         mJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Kpa6qCAKa6XVOiLrG4orWec/FhNhx9J1kectI2Akcc=;
        b=RE+K9Q0sbRVI2fnB+4YXDPOeAOugc7+z7+4OKLGAzgALk6PfgxJdHGrQ+KZN49uxud
         ROO63FIB84wYLFUX3ff1nvjbk7ZFhEygN64truFj2HaeAebhtchCM2l57eO+7dOjw8Jy
         qd38AlgALKTfozJqs3+THFnWZ2y/OLauBog4SMB1X5L5UzpMAFHfyOPTDhVd4Zx0QPlf
         sXAb6phG6hOd0Yz0H1yUBIjSlsmVcJCvz1bjIGV5Rb0fVP2yuQV4zupiEDYsbHb8t5vV
         SzEtnln+lxwPZa7mkWSqBZJqQJXyy/aANnp0ID2YmPBNEQeki20FUfUisj6AlEn1k0iy
         QXfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J+if3pQH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 33si12258390qtf.347.2021.07.11.23.46.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jul 2021 23:46:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J+if3pQH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m2piA-0004GG-IJ
	for alex.bennee@linaro.org; Mon, 12 Jul 2021 02:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1m2phi-0004G2-D2; Mon, 12 Jul 2021 02:46:11 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:42922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1m2phg-0008PR-DK; Mon, 12 Jul 2021 02:46:10 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 f93-20020a9d03e60000b02904b1f1d7c5f4so17080149otf.9; 
 Sun, 11 Jul 2021 23:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Kpa6qCAKa6XVOiLrG4orWec/FhNhx9J1kectI2Akcc=;
 b=J+if3pQH2MRsD8sEcBJaLNgcQhhCcoWxRxEoS0XpGV/hhX2aSpMVccuIoEKePGBYCu
 bmKYyoA6xw44mWA23XPHz8092iXiHsJxd9+TlEADhzRXHvo2PwTRwAaHanGfutfMdxtn
 L8XsB7TfIphu9w8kaJyTusCrZxD6cD00hFwPl+DT1GHuYQZECCcOiGTHbbLVQ3PRREAy
 /cccsdWhE/pB0WcYBIQwjcqgAE7s79KaGqMYX70gdHBQVBEB2K8fS1aeesPuKRvwnoiW
 C5lzKRhQBPPt6On2oKChl96WyQKEYDVkqv4ANCcIX2Mtphg43uULhkjFd5xXJltkE9DV
 yP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Kpa6qCAKa6XVOiLrG4orWec/FhNhx9J1kectI2Akcc=;
 b=g9SlGUGqubbqpGR5tzLNZkBU8tUUw8VHo4dNsw4XYkm+9pNoNQxN2oOz8iY6aqyd+F
 Qx8u1DLE7UFHrNxv1yTw4Ag/pUc520FGX89xQmccYHO2kjx9XhMm1hkdmqheSaoeDnuC
 vgPx+A97DUC5pRTuIccQEWGAqqMPP8EZIqLcb4nf/DMO7Iumu5xpjAzMnaqUSW+SMAy0
 8MLkzBd82UbL91+sq5/iwxTSsF9dZg/l9E9G2OPpI0BiBA7CKZsC7606lvQ76m9/xPLl
 XTLQRE+rUDyizaYws9KAAr6ZpvkQToo5BOROyPfKKt5W3sQJ3jk9lkDb9hYB/Kbs9lFp
 SwMA==
X-Gm-Message-State: AOAM530LhQNghO5zTnQPQ3ki0OugO8YwXN9DhEOjPDpAYJ9s75j7D1tW
 zH6yE/nu+xMhQiV06EjW52W7DWRwfKgpMr3Mf8Q=
X-Received: by 2002:a05:6830:14c1:: with SMTP id
 t1mr35503594otq.181.1626072366928; 
 Sun, 11 Jul 2021 23:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAAKa2jmatcBonTYeZCHnE4TR543FKQR4Lrv2iMKaZUprXH=3ng@mail.gmail.com>
 <1437061986.489095.1625809641822@mail.yahoo.com>
 <CAAKa2jksX=Sco3-ETvue8d4wpyoFBSzgOGua9Z8WyOfeY8jEFQ@mail.gmail.com>
 <b524c816-b1ed-458a-9fd7-f303afc9bf04@www.fastmail.com>
 <916126920.406872.1626068020282@mail.yahoo.com>
In-Reply-To: <916126920.406872.1626068020282@mail.yahoo.com>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Mon, 12 Jul 2021 14:45:42 +0800
Message-ID: <CAAKa2jkR-QvcYVnSi1tQ0Uam0YcF_22fbqa_qqjsm10y0THpPQ@mail.gmail.com>
Subject: Re: [QEMU-SECURITY] Out-of-bounds read in xlnx_dp_read
To: P J P <pj.pandit@yahoo.co.in>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=cyruscyliu@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mathias Payer <mathias.payer@epfl.ch>,
 "yajin@vm-kernel.org" <yajin@vm-kernel.org>, Alistair <alistair@alistair23.me>,
 "qemu-security@nongnu.org" <qemu-security@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mc63basKNfnc

On Mon, Jul 12, 2021 at 1:33 PM P J P <pjp@fedoraproject.org> wrote:
>
> Hello Qiang, Alistair
>
> On Sun, Jul 11, 2021, at 6:17 PM, Qiang Liu wrote:
> > On Fri, Jul 9, 2021 at 1:47 PM P J P <pjp@fedoraproject.org> wrote:
> >>> * Is it reproducible with the KVM virtualization support?
> >
> > No, it is not. I got an aarch64 host yesterday and tested this
> > machine. The answer is no.
>
> * Okay. Thank you for the confirmation.
>
> On Monday, 12 July, 2021, 08:21:49 am IST, Alistair <alistair@alistair23.me> wrote:
> >As it doesn't effect KVM I don't think we need a CVE or to merge the patch quietly,
> >so it should be ok to just send to the list. Someone let me know if they think otherwise though.
>
> * Right. Since it does not affect KVM virtualization use case, it is not treated as a security issue.
>   No CVE requried.
>
> * Nonetheless, we should fix it as a regular bug. It is okay to send the proposed patch
>   to the qemu-devel list for further review.
I can do this as soon as possible.

Best,
Qiang
