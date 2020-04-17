Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp550436lfm;
        Fri, 17 Apr 2020 07:34:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypI4cFnOMKMgqFe3X3hhh/MshO285+pooXHAZy3Ze0zaFLkB2Z4dkJNO/ITXU1Z66+e5cw9z
X-Received: by 2002:a0c:ec07:: with SMTP id y7mr2996289qvo.183.1587134047128;
        Fri, 17 Apr 2020 07:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587134047; cv=none;
        d=google.com; s=arc-20160816;
        b=frzL5HG8esyZB8mX7NnmZE1INJkNcnpyzP55TQZb457FSNb0YDMuh7P15yD9DH0MIU
         ToFSHpDwi11fvHSVzLU2GPT9/wgAobw9kdzQvFo3g0TekjN8lMDO7AqvvDEjyBxK04Jp
         MkbsbPK+Xfn5J7uzq/nN4N5EYxYJ1E0PlKj7MFTrrW7DaH0INp4aT0W1PvfkU362YVU8
         DXxmfmx8G/gerI4UsEimZ14rxlueLrQtsipMPDsOEOMjXRd5pB0i9K67xWTlq/JT07p9
         DgXHrj8M0vjs7d2BbFcukNpwiEARlqsCHsgSNZacIR6aKpSg7XhdfBQ2UIGYJ88Ixrlj
         Hbww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uiNViT9fYax+iMO1ynhvuX33SM8iqyUJVdcCDtlD7hc=;
        b=ZIIMUqnp8DZce1npIY90c6ZpSvh8Z0TUNm6orxJAmqmPjqxydeLGMHt0MxzqwNXXvh
         SCISF0IjUa46JkvBX2YpG+H+N3CfSUD6ewN724XUG5NwC7CkRqD6xVYKdvWnqzIrmdmT
         Y1LB4ptN/L1Ar8ZeoMAVL+bigOaHWriSXGsYBShdHuNPT8TbunXOFLIGxA2syeJL55xQ
         7UIwX1s3pvKw+8W+t4QVF7lgno+ow3Z7XLTIUoPgGxEa7QWLyMQU7W5+KVAyVrCa2Mhz
         qEANflR8N3rqJAQNm1B5VdIlXqjQH21Q51qfnKNeAFG7YSWhXDLJIL6KVRh6DeAPbR89
         p1og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H26lmreT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b47si4070090qtk.399.2020.04.17.07.34.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 07:34:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H26lmreT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPS4E-0000Kv-J9
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 10:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44133)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jPS3Q-00089u-A5
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 10:33:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jPS3P-0003UD-1w
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 10:33:16 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:33161)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jPS3O-0003Se-U1; Fri, 17 Apr 2020 10:33:15 -0400
Received: by mail-il1-x143.google.com with SMTP id q10so944161ile.0;
 Fri, 17 Apr 2020 07:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uiNViT9fYax+iMO1ynhvuX33SM8iqyUJVdcCDtlD7hc=;
 b=H26lmreT4mFoRGzwbQu4O+MjnyzjRfQm5vOnRcyTYxhSNNfH2BKQe1U3oo+vAV+WT3
 6CwckoyhO1PQ9PQlRT5NQWUiQlIL+wa4C7PIczRUCEqUE7GJpCQ2AD/H7FtalqeH5IVF
 EyDNaKtkqVKTTSZurkGR09sV/a3LohyFyjIjsFHxMQDDanNT8yWsw4uJQsrdBeH+YzEa
 TqMZK/xE3ZYUbwhFA2fucqb7zwMT0mKI7Pw11+/67x9FkIharLEps8LGTKbAN+gxLdi/
 ce1iHw2/IciRODlN1hEk4gG4bM3fjXqVJtsQISIzvQzmPsbmlIe3+Xzfp2+uIipjyPJN
 0axQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uiNViT9fYax+iMO1ynhvuX33SM8iqyUJVdcCDtlD7hc=;
 b=gGGNME3WHKRDZi6nh+nowQ8ygK03j7vxldU6aqUrl+UBDFmSQQXdl+Jm04VgHjuCtu
 TCobVnuuUxt1VmmtCnRaPkKvKsWrNlDYxiPFHGL/gKfaamAPRopSMRP/W4V3url4+tjF
 781oAhPh11IyakRQz09JNJ1DojRQF2oqOAz4W1XTx9bkekK8OkSNmMCWKMyqO578IbNw
 UTnazkWTSZfgJW059B2baLlUF3lqk2fGtm6DT/OxxuVInB8L05G0MfxrthTzNuyUFQZT
 WwPVGw7465OErxYF+/0AwAZhObV2t8O9b4G55YJicnRYa5pFzPvQK0taW9HtYPrI5WeB
 ayAw==
X-Gm-Message-State: AGi0PuYMxyQdt0Avjo6PhmXsVGAw96VBZ8p8gUMZo8HMLJXKxiNCWe2g
 LyCkZFAzGds1M8QBR8V1vdtp8gmtL81cn9no7To=
X-Received: by 2002:a92:aa0f:: with SMTP id j15mr3267731ili.211.1587133994054; 
 Fri, 17 Apr 2020 07:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <1587048891-30493-1-git-send-email-sundeep.lkml@gmail.com>
 <CAFEAcA8AOSEK4w+AvyLgOc6gX83_XN7FVvU7kkxpuTuSO3cz9g@mail.gmail.com>
In-Reply-To: <CAFEAcA8AOSEK4w+AvyLgOc6gX83_XN7FVvU7kkxpuTuSO3cz9g@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Fri, 17 Apr 2020 20:03:03 +0530
Message-ID: <CALHRZurOmKAO64VM=wKtTFMVSU5hwZm_XyZjCrzY9r4AzkDRfA@mail.gmail.com>
Subject: Re: [Qemu devel PATCH v6 0/3] Add SmartFusion2 EMAC block
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::143
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sbhatta@marvell.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6s45owXEjzsX

Thanks Peter,

Sundeep

On Fri, Apr 17, 2020 at 7:27 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 16 Apr 2020 at 15:55, <sundeep.lkml@gmail.com> wrote:
> >
> > From: Subbaraya Sundeep <sbhatta@marvell.com>
> >
> > This patch set emulates Ethernet MAC block
> > present in Microsemi SmartFusion2 SoC.
> >
> > v6:
> >  Fixed destination address matching logic
> >  Added missing break in emac_write
> > v5:
> >  As per Philippe comments:
> >         Returned size in receive function
> >         Added link property to pass DMA memory
> >     Used FIELD() APIs
> >     Added mac_addr in emac state
> >     Used FIELD_EX32 and FIELD_DP32 APIs
> >     Simplified if else logics in emac_write/read
> > v4:
> >   Added loop back as per Jason's comment
> > v3:
> >   Added SmartFusion2 ethernet test to tests/acceptance
> > v2:
> >   No changes. Fixed Signed-off mail id in patch 2/2
>
> Applied to target-arm.next for 5.1, thanks.
>
> -- PMM
