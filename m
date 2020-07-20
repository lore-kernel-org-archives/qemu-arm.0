Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2077044lfm;
        Mon, 20 Jul 2020 02:38:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzvfjZxtv8n/Ofps9liXkNItEly52EIiVi+u8Hu3QLVkDm+SlwUJyTEIrzaadt2Tz33V6J
X-Received: by 2002:a25:aa08:: with SMTP id s8mr35492475ybi.282.1595237933961;
        Mon, 20 Jul 2020 02:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595237933; cv=none;
        d=google.com; s=arc-20160816;
        b=Ov53QrpTdCqw4Uk8ypkgXK+J1oQj5O95FTHdAsiV1V87ajFvf2zgmvuafpDN7kx/3K
         JmnHpsRHahQQIq4n5lEoedgcyI/deANrDNsKz4wROTRvilYeI9xLIyCXzpg2H75gE9O8
         2vVWwHppmOVzQ3uFGmTMCJhC+g6efdT19x0tmWV9iHm6J+c+6C6/bctx5ReuBNjYI3R4
         xU8LKBWFhEfhcFyWkziSjPpqX27X0D9EPxOPj6q19utaaeSCZRcJ9Z/madm3rEb94Utk
         +freHJzbbDvp8IpUwhYyStGMOy5qpHimJ8Vybep3YG4sv4oZLBCmnbSkNdf1SIjEPZsW
         T5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3ZKCJK17LggfFsY25YbupU2IJSnrJviKGCGX4ioJjK8=;
        b=rzZgfwcVNLMcIyqqll9REWg29CEpGUemnaCs0Ab/KXqi3uk/h4RkWB/7O97lXjfVlg
         bC17LQ/ODzHXxEXDLlGVqdvcW/BPU3hik4bYprPauyC7nFx+FM6Jb0wjzyFEmnBfsX4y
         0+jRwZwWUf+2cI4YCKgNDKIZOEL+Mm+misQch5AKL81d+NSVVd8oN6+SmqQR2tYslQGI
         pukw+khfIZbGY+7AEslxwUvT6ClCVn0OelIhWfcH8OXLZ/PlwORCuUp568gIErd3gisw
         pcO4PeQULxLrXiCWvBkxErzWvxfvlFajp0CxakmEeYeXNQUA0/EjxTKpowVu3UPB5soZ
         VeVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p/bQG/o2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si16201224ybr.208.2020.07.20.02.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 02:38:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p/bQG/o2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jxSG5-0006jM-Bk
	for alex.bennee@linaro.org; Mon, 20 Jul 2020 05:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxSFy-0006j5-IX
 for qemu-arm@nongnu.org; Mon, 20 Jul 2020 05:38:46 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:47002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxSFw-0004Fo-SU
 for qemu-arm@nongnu.org; Mon, 20 Jul 2020 05:38:46 -0400
Received: by mail-ot1-x341.google.com with SMTP id n24so11632965otr.13
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2020 02:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=3ZKCJK17LggfFsY25YbupU2IJSnrJviKGCGX4ioJjK8=;
 b=p/bQG/o28XcazZ4AA8C7f7DqLWz1hhPu7nu6OUgEAuuDrzjFs6mID16GdCFJed4K+P
 QR18KOcNoinfXnGRtL4eyecouwKhvSI9kAqzkjPEOCT7KA1BgnDZCRRO6z3mMD2FkZnS
 88y8R/NKqc6RIK2hySfd2KOXSOI9fyt63s1lkGAjWGqAn3wssRBFB8gv/nCwDYJCnFXZ
 YIY//UHCfCzm9SnczjjlgboZjb01A7LFazImbnNI0yJTqexZLGqC5c3WI5XmCzOL5gKB
 zob5m4od1xGEYU7qDY5D3TLa/AKZKAkY5l20Eb76gReaSlur0tguEuqURadcx3uA/1/c
 aR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=3ZKCJK17LggfFsY25YbupU2IJSnrJviKGCGX4ioJjK8=;
 b=TaCd6Hkjl4noHXhachOnIWpc41vDxCHKyGl0/k7za2+SsHu82zy3gbOLC0P7XWdTVX
 TJDbFmSSW0lwhyvElNNzMNvNEPnxVRapbol/02csYbOJBwYhliJ0nuJxf7xR54xOPrgv
 qeUz/M8kypc/d9vAzbp8sSILV3FwgTgTYWhhOazYBLqkeSsuAByUwpi61ujoTEISH238
 teuJhhU/va4CIraI5OzWq8EE5zl6aYYG0Y8MYaH7M5dSKC5vI84a6367GZZn3JnUnxZN
 QorNXvcZessY+TV1unzSpM+HJ4EG3733sltaCgoHJ0xCFy5yhocVnfYkgo9M96WHzPLs
 dHgw==
X-Gm-Message-State: AOAM531EXXbqufbzwT1ko4dpaNsjti4slby158T6NgPo/1bsfL6bv54y
 zy8CamPtPn8CAIqAqpTEaSE/s1y66pSlreeeZgKKzmo/
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr18960533ota.91.1595237923481; 
 Mon, 20 Jul 2020 02:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200713175746.5936-1-peter.maydell@linaro.org>
In-Reply-To: <20200713175746.5936-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jul 2020 10:38:32 +0100
Message-ID: <CAFEAcA-BKB0ar4EJAF=dLtSx5jeHxWQToqMvj1P2mXf2TJtm-g@mail.gmail.com>
Subject: Re: [PATCH for-5.1 0/4] Document virt and a few other Arm boards
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_TONAME_EQ_TOLOCAL_SHORT=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F/6qzyojdCrY

On Mon, 13 Jul 2020 at 18:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This series adds some documentation to the system manual for
> previously undocumented Arm board types.

Applied to target-arm.next for 5.1 with the minor wording
tweaks/additions suggested by various reviewers -- thanks!

-- PMM
