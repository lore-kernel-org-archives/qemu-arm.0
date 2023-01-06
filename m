Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp394795ejc;
        Fri, 6 Jan 2023 08:09:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv4C6KhagAr6DfKWui3RQPOBjIAgzJI6LQd1vGd5Hc9Q1LFgAnJaU8/u1GphBcWHS5dDtzl
X-Received: by 2002:ac8:678b:0:b0:3a9:902d:414e with SMTP id b11-20020ac8678b000000b003a9902d414emr75112632qtp.15.1673021341633;
        Fri, 06 Jan 2023 08:09:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673021341; cv=none;
        d=google.com; s=arc-20160816;
        b=NnpTbelIFdwn/HWvCOt+6m85XIJ3BVw1tDMXU6uvFwrcxTeDPiV7Dn7lq9jneCNfYJ
         YsBOOQef90FlD3QqUR540V+lTVqvzBl/7eYbTAAH0r7xScrR0dzD689OyeaZW/DFXZGY
         g2SYidDVlIr+Zq3ohCZ351Fn2EgI9Xp+79nEGcxSitJuRlH5gC9IorRXVJHs0/cJfNbB
         iIMy39QKiuJAU/2dUWb527u2YNtasL0+kt8EeDaqeX7oyoI3+R7s6S9g2GyXZeVuk0Lk
         zbEQeLKOy2Qr2Dm9twVLV3CZ1cFvebKSM1P0MxMLHytF1L+cRid2KuCa6V9Yablkupw+
         JJ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4dlax77H4uvXVWqLO9PEEXMPFfDkYTs2ZfQKRtkiG7w=;
        b=a+oiwE9trYrwrbGvS/lm9ibXm2n3tiBjN6BKKFl4ir3roILLmWbtCeFlE3CWGqe9ST
         SJ2CqpM46xKu/kYfsBpu5bBO0vIm9Oz3wDEbgWB79J1Le/gDMmlrCjj/XNAQl6R+UyrU
         g8pbnQmp0XB2woTL4UHMV561ZRD/z3jbudzFv46k+OkytK9EAG5CiIMBS5YlDCJz6/HS
         TDTMahOOD41beskCxVqKnLoQNHjj6jbNpZU5QcoOeFtxr/mDqwc9Pb5v7itWpwvQXL0d
         ESUMHzlcJ0gHIlODIez4aZQFowXBwYphINmfWdJnIRh7b2vSvXKekNzhZ7qM3IoEo7Eg
         Y1Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BQplH//Z";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fx10-20020a05622a4aca00b003a4fdc8287dsi976476qtb.605.2023.01.06.08.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jan 2023 08:09:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BQplH//Z";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDpG6-0002gy-0c; Fri, 06 Jan 2023 11:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDpG4-0002gU-IT
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 11:07:52 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDpG2-0002uf-QN
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 11:07:52 -0500
Received: by mail-pg1-x52a.google.com with SMTP id e10so1425345pgc.9
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 08:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4dlax77H4uvXVWqLO9PEEXMPFfDkYTs2ZfQKRtkiG7w=;
 b=BQplH//ZFRL5mE/x1XPDjWOYk+WhSGI9YbzXa18/ASGw6T6zXlDyO/TdJJ63wdDwWL
 7Ubqj/KhKxdBrrZJWpm6lrMP+whypHb4puPuvKW5zia0m23yQUD8BEtC6TdD+lu2y+P2
 +QOCteUKAqgePk983oakwmeqyUJXM7LiupEpoHJaPquG11Q3vCg23vvoiIawcsYHPDe1
 NmhAUSB8EzGkP7ZI6XgJZ0pG6tTv7YbceqKIqOrYWq5QcA+niIdPo+XutxFgLtH9RDI1
 rBTmdydV+bcysR2ogV/5tQnqxR9F4cE7WiF3V4V4aP/0m8HhDMJoXZmrEZBNf1tXfkzT
 kd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4dlax77H4uvXVWqLO9PEEXMPFfDkYTs2ZfQKRtkiG7w=;
 b=Q0v2PfQjJi+1tao0pHdFKAtVJmuH+Mdp0ltR87Dq3u3OytegCI6XefH6x/E8QqShqx
 3c0fRqvRFcHLGkwI6EloN/C1LavYZEn5hjJnROq6wcone/0LHZt55kdLYR6g8aPgtu1r
 o4NoXTEX4mfEzStwpmoqsA34kHZUZaU1agph/Q5RzsyL61gKX0jx40RJsL2OoOt/bmb5
 qkgmJqNqI4ml9yk9d5h8/UBA0oKX01B6mZTwmhcZgb4ICqna5d1jwYfnYbnmDXWZR2/f
 jTxfBTeIVaXXxC2af1IcrCd2udjxCD6ftJryDIarkgYHoEbIfjSEwMOro3/4e4Jgkj4a
 i+0g==
X-Gm-Message-State: AFqh2kpzNctJ0yAoAy9Ib6for5aEbUovaisWViGBOMWsnl3Y5dAKQ9kw
 RaKX48zGAHJu0FhFNlCaUZ9nde4v4cIavh40MnlIRA==
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr3553633pgh.105.1673021269424; Fri, 06
 Jan 2023 08:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20230104190056.305143-1-richard.henderson@linaro.org>
In-Reply-To: <20230104190056.305143-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 16:07:38 +0000
Message-ID: <CAFEAcA8xvToadDqUd6hLJNF8QdCyXBN5dj4hoRaBCyUN3SsEWQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix sve_probe_page
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, idan.horowitz@gmail.com, 
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 30VMZHdf3Fe4

On Wed, 4 Jan 2023 at 19:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Don't dereference CPUTLBEntryFull until we verify that
> the page is valid.  Move the other user-only info field
> updates after the valid check to match.
>
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1412
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 14 +++++++++-----



Applied to target-arm.next, thanks.

-- PMM
