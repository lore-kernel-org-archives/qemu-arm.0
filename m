Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2078769lfk;
        Fri, 19 Nov 2021 02:54:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMHoyl9VryygA7HvjUE9Da8B3OPadePgSUE3zzVYR5VG645iskTENrXDwuv0CFboMowDeU
X-Received: by 2002:a05:6102:512b:: with SMTP id bm43mr93329670vsb.14.1637319282948;
        Fri, 19 Nov 2021 02:54:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637319282; cv=none;
        d=google.com; s=arc-20160816;
        b=B5obma64AaL1rdMTGix+9td5gajeO0g+pLpZ6MGCXBvXI9/4Ptfg5fk0y6x+V1UOaM
         M6/evfkFb/Hq2PNLGUDzJ7o8YhocgJ2n7TaBpxlyAPjiDmtG0tnGE+K7NL7cst9w80vG
         53L2widCUq9jykXjULl4qZT5A4pQvwAM7skMQaq9iX9MEkxe+UsU3UjRH/wbGOZOwRu9
         qryyEOfYSFu5QzXyHduzcSo3mr+Env1XsB4M62GR/bOeJWGbfI1/Ecaqn7RaqlANeY2Q
         Pme79MakJaIg0ASbnYVqthV63bvv+S5G1rJHnLpg+pHGDNmShIAMyQ35EEf7R+lpjiQ3
         BkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Zc/texVsq6WEJ7WgAdHOZkf5Ka98i0TKFzkK3XWxxU=;
        b=v1qDtNHFegTUxLokc0Uj03R3iZID6dP3NhBMHEP9lefG/K+/g6SNlBD/U9NsEWtzns
         0RoJNGfHkXee47OPapghxi3TczhQcbMUMg6UPxEggdVlCHdcmlHjdWlbAtKbeoWYTDWj
         8FjJ+AYoPruZLKbLwLX7AVB5LvLoRt3u8QYrsHrEOLjLnXCErm/l6HmyESflw8H0g4YR
         ezo/rq7ATmTtM03X8xgA26tkJ2zX1hAokHFsK0w2uFi6TT/MaVF/DwWuG84FQnMZM9WX
         f8MAJpUGL40BN8amK2liB+L5DjZHivlPRRK7QmiC1dsNEeDkJC8kvtqmPyk69rsUvJEG
         0soQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=LPY+mVvi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si1257075uak.146.2021.11.19.02.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Nov 2021 02:54:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=LPY+mVvi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mo1XW-0005v6-Ai
	for alex.bennee@linaro.org; Fri, 19 Nov 2021 05:54:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mo1XO-0005ux-Ca
 for qemu-arm@nongnu.org; Fri, 19 Nov 2021 05:54:34 -0500
Received: from [2a00:1450:4864:20::131] (port=35754
 helo=mail-lf1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mo1XM-0000Eo-QG
 for qemu-arm@nongnu.org; Fri, 19 Nov 2021 05:54:34 -0500
Received: by mail-lf1-x131.google.com with SMTP id u3so41486038lfl.2
 for <qemu-arm@nongnu.org>; Fri, 19 Nov 2021 02:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Zc/texVsq6WEJ7WgAdHOZkf5Ka98i0TKFzkK3XWxxU=;
 b=LPY+mVviX51IMCfxoDYQaBMZlqBv95bh08hMxl2LHhX8PMMgoaN9eEWv/aUcj1US2u
 1HXv6x3TVO1MU1z8nab0zjtPgaK3I2X1uLRklnaxK/mW9uZSiwA+iyQyPFOZgG9qxSNF
 RDe9IZCF68W+/jomFudOdeyqMlvdBJ3ZssI8Ei74nkHUYTBiZ/hcaUSAtOL0OCwzGxnG
 RG2pqPLYl4TBC3aGd2vbKLGmsTI8GS2Pu81G6UxjbgRbZTbbCOpOC2RM4Kk9lC714Gz0
 2ce94BeckxrTUiACAQ/hxlhMtUcoUXy6VFoX0XAFiQylRstpV773Fqc8oL9EIQ6wK770
 oNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Zc/texVsq6WEJ7WgAdHOZkf5Ka98i0TKFzkK3XWxxU=;
 b=CyPjRY6anG6ixrbY2U124lzbSfJLI02xbMEfC8UnHmC3RCNVxfYdTd0ciqf+7WbsKe
 upxvQQMl0ap5EwfdNq+MgymrOC54HduUnaSIMgbzlZ7GP+3lNfWY5iIkp/ZkG3PPDqDJ
 /kSucDccOgLLxxRcyHQ5rEW1csAUk3CrDchRG64LTPM74A/G3k9iHq5ocjg2/B/Pwbi5
 FEs60V+R/LrWJjIViolLrxeLqQ7D2wdveTp8QEuvNyd6nybVEryHvyULcOjwM11FIqlc
 +n2ew+6t7043KQBAK/Bc1v1Ed7Hvp6WY1L3EGR6FUfYMBJw2B7ferxw3YhS+gEym1fi5
 yrrg==
X-Gm-Message-State: AOAM533RUM+WXvTRbplwAOkzmfAGHWLQ0zVlXONtogHr0PVk2dVo5HNn
 TFBb3KlvGNd4abwlcP/a2KhHq5blPzVHzfgF5fk=
X-Received: by 2002:a2e:7611:: with SMTP id r17mr25405115ljc.519.1637319270550; 
 Fri, 19 Nov 2021 02:54:30 -0800 (PST)
MIME-Version: 1.0
References: <CAE=NcrYJfjF-pEiX-tY7NfiTbDfXtcxnk5AnBVwc2AX4cpeCrg@mail.gmail.com>
 <CAFEAcA-CKqZPF8A+WsXE7gLgOPPYncteomvMSOcAuLEkB9F-Ew@mail.gmail.com>
 <CAE=NcrbPW4LVihnZksOCJ6NcQQYkwJudbqrp-sUEx663+qyG5w@mail.gmail.com>
 <CAE=NcrYPqu9oa0UZM7VRDtUqQWg93spVOdRLQGs0hdHtqghGVg@mail.gmail.com>
 <CAFEAcA_uzvNuMx9KJa=Z_Dwuonf10ekTDUbNf9bZSVa+hNtHLg@mail.gmail.com>
In-Reply-To: <CAFEAcA_uzvNuMx9KJa=Z_Dwuonf10ekTDUbNf9bZSVa+hNtHLg@mail.gmail.com>
From: Janne Karhunen <janne.karhunen@gmail.com>
Date: Fri, 19 Nov 2021 12:54:19 +0200
Message-ID: <CAE=NcrY8GJZ-Py0n_24JDao0sJLcYoZ1TSK4RMLfkiWyOxPR3A@mail.gmail.com>
Subject: Re: softmmu 'at' instruction support
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::131
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=janne.karhunen@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: avOvKCQ1vT+w

On Thu, Nov 18, 2021 at 5:40 PM Peter Maydell <peter.maydell@linaro.org> wrote:

> > 11610     ttbr = regime_ttbr(env, mmu_idx, param.select);
> > (gdb) n
> > 11616     if (param.epd) {
> > (gdb) p/x ttbr
> > $1 = 0x41730000
> >
> > So it starts looking from the wrong table (off by one page) ... ?
>
> My guess is that your guest code and QEMU disagree about how aligned
> the page table needs to be, and that extra 1 in bit 12 is being
> cleared out because QEMU is implementing it as RES0.

I added bug because it still looks like one to me:
https://gitlab.com/qemu-project/qemu/-/issues/735

So 'at' reads in regime_ttbr:
10541         return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
(gdb) p/x env->cp15.ttbr0_el[regime_el(env, mmu_idx)]
$1 = 0x41730000

Which is wrong. The runtime reads:
10543         return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
(gdb) p/x env->cp15.ttbr1_el[regime_el(env, mmu_idx)]
$1 = 0x41731001

The determining factor about which one is used is in
aa64_va_parameters, and it's the bit 55:

    /*
     * Bit 55 is always between the two regions, and is canonical for
     * determining if address tagging is enabled.
     */
    select = extract64(va, 55, 1);
    if (!select) {

Which, IMHO, is just a Linux convention to set up the high bits.  I
can work around that issue by setting that bit, and then it goes a bit
further:

..
        target_ulong top_bits = sextract64(address, inputsize,
                                           addrsize - inputsize);
        if (-top_bits != param.select) {
..

And fails here. I can understand this check a bit better and arrange
it, but before going there I'd like to understand why this wasn't used
as TTBRN to 'regime_ttbr' ?
uint32_t el = regime_el(env, mmu_idx);

It determines the calling el just nicely before, but doesn't use this
and goes about using the magical bit 55?


--
Janne
