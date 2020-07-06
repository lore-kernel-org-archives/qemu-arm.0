Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp145036lfm;
        Mon, 6 Jul 2020 09:41:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXVhMs54Dc74FqWXcQxTZrBVu4fzLEiN39JSST4RSbHTL0sflLdn4w8zlvoAZqvegeLBu8
X-Received: by 2002:a25:77cb:: with SMTP id s194mr68437319ybc.216.1594053696488;
        Mon, 06 Jul 2020 09:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594053696; cv=none;
        d=google.com; s=arc-20160816;
        b=Jrl9Pnt7ogTk1nT/9ROSzlVpD6zIF2On0wOAfGyyP+yoOWT/dxL/PHSjD1SdVOa6MT
         qrRIM1RoarA+E9e0JJiM3l2pWUaD2SA18aqDOnRBayykIQ/wmuIw90lajXNi+BK2OleA
         UcNyXc+rOBYz4pdioO9VoftJfAjVDvHmzMKedctPQ+UFmveBLUVqjvb3Zt3iBCy8Si0d
         ncvh5vObXekEJqjQ9RiGUrxUscRdGct0fP4mJ37YxUyyEci0F8CKi27sj4uG1dxcVbsb
         XvG573wr8BDoSeHk8JigTeuOETKtyWLwOrDLCnOUpBa7G1GPPULhqPNeLbLABDHzDPwO
         oTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Hte3oKrs3+MNLJi/r32ZEuHwrtV7cBrw01VPyRYeXCc=;
        b=ENV91PvYpKGyY8+8JJE7E1DwzQsywoLSF/ma3ly98/Ejjb6g4jzoOAYyBlFWZ0CJVV
         7AIcfPzxn3dZtQ6anjnzHDmKEdcCO6gddLquz/JoZkLsJ/r2JauH3eOcBE76KiQD9fzD
         QAcOy1213wKVc02ztoA+Wa4kpDsBSgEvHk1oSAAp0HSQnipAslgFMdJign9ujZR5HerL
         tgXy92Oh3JnlZOKLgxiwrQsmvf+80PIPSw/2Mypb2xEhwaHwC5rUwrFhszUn4JArGlnz
         X3Ka+A5h/sCLsEsyLwYzLRkXIhIIIPD5T5BRD6WOdXcOydptEM57m2PyQvEykwzSQ1VV
         ZIug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ge2BVElF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si18745396ybj.225.2020.07.06.09.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 09:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ge2BVElF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsUBT-0001zv-KU
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 12:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUBB-0001xZ-Gc; Mon, 06 Jul 2020 12:41:17 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:37461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUB7-0002yZ-Pl; Mon, 06 Jul 2020 12:41:16 -0400
Received: by mail-io1-xd32.google.com with SMTP id v6so26373667iob.4;
 Mon, 06 Jul 2020 09:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hte3oKrs3+MNLJi/r32ZEuHwrtV7cBrw01VPyRYeXCc=;
 b=ge2BVElF87zWZYhmdWxLDXCBVH+Rp4TQc6AMLbrFWz9uoFsdbBhB1qdu/AgFMt58Z1
 RYr7dDYaluNposp7Hl4enVaIqOMAX1Lu2T0KgdXXSK0WP6TBIhtSiS07usoi/UGaNvBQ
 qfQljiVIT10zdpPBk5e20oBaxIDdVucvjf+WRIlo7C2MKkf3/nPXxKQc9abuxEGEyopc
 hkfVNp33lxKGEGzFx9+PXXInzglBc4vyKaiQS92KIilPEdCDk5+zFV4S4WzE/Gc3mEc4
 elKSOr1yTqiZBnTaD0vcLw15dg4hgw2rCW6O+UcLqhTjLd25ZQtyJM+1b/x34DmB7Yjv
 BU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hte3oKrs3+MNLJi/r32ZEuHwrtV7cBrw01VPyRYeXCc=;
 b=sPY9a30V3ugexROAE1BFevtH7kxpltz5jm5lFNBuvqzpZ3ho5SeJSTQzgYe9NuQ1b4
 pSxZPXXBY05qrnSTLs8oc/R5A1zDu5RbWFU8p/xfxHbRKUxNLpEmoNbOXDuay8b3TFy8
 DOXQFQtscG47obpJVsh6YnrVCJyR0V9YSW9H5s8BlBr9hpKF/02N3uJxmh+37lKklzeC
 HnBdVISQH/DWu3L2GOo+fYloLzV/1h/GTYg/fztaxF7ITkBNbawpuY1u/8p4AabJDma6
 t1Rz/sG2AVR9G5PKciFftd0LdVL+H+wP1B3jim31COwL5ueYTLpngwx5K9eIj8wCrHju
 GFow==
X-Gm-Message-State: AOAM530rOLBHUOfMaL+XTFlgbm1k7+wyM1O3nazSykYDHWtfmbpYRVPo
 R6WxY9YnecBPiuK16l5PaKqbJ0yafCMe58Kg+90=
X-Received: by 2002:a6b:8dd1:: with SMTP id
 p200mr26312703iod.118.1594053672235; 
 Mon, 06 Jul 2020 09:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200605102230.21493-1-philmd@redhat.com>
 <7a456fdc-eb53-063b-1d5e-24472b4057d5@redhat.com>
In-Reply-To: <7a456fdc-eb53-063b-1d5e-24472b4057d5@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:31:25 -0700
Message-ID: <CAKmqyKPaQxw4Gw-Fi5X3PT2kBed+Z+iAAuobSAnfCd9hjZ_3QA@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] hw/sd/sdcard: Fix CVE-2020-13253 & cleanups
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XF7I6UF0Wb6q

On Mon, Jun 8, 2020 at 10:48 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Alistair,
>
> On 6/5/20 12:22 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Patches 2 & 3 fix CVE-2020-13253.
> > The rest are (accumulated) cleanups.
> >
> > Supersedes: <20200604182502.24228-1-f4bug@amsat.org>
> >
> > Philippe Mathieu-Daud=C3=A9 (11):
> >   MAINTAINERS: Cc qemu-block mailing list
> >   hw/sd/sdcard: Update coding style to make checkpatch.pl happy
> >   hw/sd/sdcard: Do not switch to ReceivingData if address is invalid
> >   hw/sd/sdcard: Restrict Class 6 commands to SCSD cards
> >   hw/sd/sdcard: Update the SDState documentation
> >   hw/sd/sdcard: Simplify cmd_valid_while_locked()
> >   hw/sd/sdcard: Constify sd_crc*()'s message argument
> >   hw/sd/sdcard: Make iolen unsigned
> >   hw/sd/sdcard: Correctly display the command name in trace events
> >   hw/sd/sdcard: Display offset in read/write_data() trace events
> >   hw/sd/sdcard: Simplify realize() a bit
>
> I forgot to Cc you.
>
> Since you already reviewed a bunch of SD patches in the
> past, do you mind having a look a this series? It should
> be quite trivial.

Hey,

Sorry I took so long but I have reviewed a few. Let me know if there
are anymore you want reviewed.

Alistair

>
> Thanks!
>
> Phil.
>
>
