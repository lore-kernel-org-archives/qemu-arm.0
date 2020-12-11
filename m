Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp148832lfq;
        Fri, 11 Dec 2020 06:49:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW75Uc726Am/FXJ+1CIpjDHJyhwlUO8RFpautWKsg+MxRMxtVNuImlQ9mIT6eQ9XJL+ite
X-Received: by 2002:a25:3b93:: with SMTP id i141mr19214700yba.499.1607698143233;
        Fri, 11 Dec 2020 06:49:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607698143; cv=none;
        d=google.com; s=arc-20160816;
        b=XYCUAN3pQNYFNrtLHCEc41Gv1CvP9LKPEp2ARsL6z7+BHHpRubkD0rUurJADhdKBQ0
         TQax0hJW088PEZ8DgCH1vBZ6+sAZ1DYc2EJqBRRfIIcSBIrkmZK4/qLv6ao3KpV/J58A
         BKBZYu87fYljYqu6zd6Q9BZcsAjxS5yzjcZiY1dExK/BASlECBsGy62jeJc4TPyitzG5
         cwMABUbz4nWod4GIuXcxy9eVcKe+qzxbSX4O6U3YtS4VL90flWRYd0+LqAnLaBMXSmmf
         y9SGqc9JnQ+B7WB0yWxo0nvxCjm+PvSBYouqsZf0ih0VTH/R0b/zoKY0/m9slHnmVwt2
         rZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PFf8RezM67PvJ05XLYcCmMVBzSoXGcsAzU/AhY4rV1Q=;
        b=PKfzzTVv+wnEziWzTAuZZhj/Sx5C86ama+oyOebx38s8i6lN9PWUNS0c1tauDBHDWy
         MgGpN5JWtjnNnW7CUP6gO8/dBD5OdX67qTKUpbHweKj09SaL9AKp3poqBBAX2IUkJ14K
         mVAHKWrGEH1HRudupdX3a+VL3VkVLwLsYF+nxGUBsuTSROVmAprFbN31Dp1F5+TBodzE
         va+n5CwMlosk3EgXf8pcKFbBvFsHK/ePwxtj461nycnqPUpF8vZ0DizStu0ZFfXRXqtq
         bkcVe4EaYsyFZfcaLeWcm0Ve1cZr1aIyg0YUaFiOcYrO4YQXILfWO7tdtR7O5vozJ5Vo
         fe1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uURBCfG6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h125si8713181yba.281.2020.12.11.06.49.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Dec 2020 06:49:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uURBCfG6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knjjC-0005OM-Jv
	for alex.bennee@linaro.org; Fri, 11 Dec 2020 09:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjih-0005MC-Li
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:48:31 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:46214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjig-0001Ju-1A
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:48:31 -0500
Received: by mail-ej1-x643.google.com with SMTP id bo9so12659912ejb.13
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PFf8RezM67PvJ05XLYcCmMVBzSoXGcsAzU/AhY4rV1Q=;
 b=uURBCfG6JXROVIsayNwcNlQ40vNSft2259U/EudyNejmxphaisPeTCr2gA+5lLqG8n
 HSDSdZhfUfJi7Ve9dmIR1oBtQYTuftd7jqR3kcsW989ENoaX6z3yGtVYlWS0vH60gpPI
 B1ue7ihhWi1zHyHPuHPfKiAlTieSpa7M05OcAdLWSYjcauQapANCB8cF2MSTIJ/dDe3W
 BWWFpk5/3B6xRwYx96uerGKhtuo7vZfuXqLeVxjcNoRQ1rSsLpb3O0xV5/HV0BTTvDnc
 MxBZCxvxqAG4gMWy2ITWi8ph8rsDZDR1u5k/BUnxvqEUg0Tnmkd7u2nkGkvqger4wywv
 wHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PFf8RezM67PvJ05XLYcCmMVBzSoXGcsAzU/AhY4rV1Q=;
 b=ldvDFTMof/KpxVbEdzZYo4Ok7zsMB+C6PxnuY2ZmyjH+pGG6YTAo7xUsGo9dXZBswb
 FDWG1MuleI0d4NrNnt64Iun9PwPXUzUHF8Vmagv4rqJmhsoaH69H6oZ11/9GvHppu5H5
 xkVufdwurVwqPcaKmORb13qn5/OrmVBzrJvTvjg0tOrbX7Kq0y08L8+X6Jz95SYEl1pG
 oEOlU9L0muB3ZFtuTmpJJWr2nxLSlWuP8vGd3HDDzhuWRJ624vOZgeGIpf3JXC+mp3zj
 rUwEFqiQB429eXTah6PwA1/Sh+Mu1UooFntJ+yziPtJrN0jSBtMqQvGYPGaQImWCO+gK
 ciLQ==
X-Gm-Message-State: AOAM530g1YX8Dr75D1/kCdj8OLfHAmVdUFJdutXzlon6XTmsWuGAFCog
 K/vun8MgiGGqUZfvlVHcZu4MUSVjjM5k8efm6Rp8/w==
X-Received: by 2002:a17:907:971c:: with SMTP id
 jg28mr11251008ejc.85.1607698106720; 
 Fri, 11 Dec 2020 06:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-5-leif@nuviainc.com>
In-Reply-To: <20201208122306.8933-5-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 14:48:15 +0000
Message-ID: <CAFEAcA9oXDLRA7UJTepqpBWHNDdbtghxjtYtUdEzb6ckeY00Pg@mail.gmail.com>
Subject: Re: [PATCH 4/5] target/arm: add aarch64 ID register fields to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UL2FyGIFd+QT

On Tue, 8 Dec 2020 at 12:23, Leif Lindholm <leif@nuviainc.com> wrote:
>
> Add entries present in ARM DDI 0487F.c (August 2020).
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
