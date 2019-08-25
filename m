Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3162157wrs;
        Sun, 25 Aug 2019 14:41:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyS45XnOje2eVKk5D9Ga0WZVUS9edRBlaJ3cUTNWohImDgSheUCwuTC5cqvpg6qst1Px0Ck
X-Received: by 2002:a50:e68d:: with SMTP id z13mr15512892edm.142.1566769293230;
        Sun, 25 Aug 2019 14:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566769293; cv=none;
        d=google.com; s=arc-20160816;
        b=ymO4d+fROnvxWiqC3JvhWflL7izzo5wwHL9xA7KLib/bkT6RZ2TKuQxmwUkPODrVNM
         NFW+RVoPposOnhFbQSymeXeuYPYNDs5BVnLu2mug7n5/OYxpYDjKuAZleQrpeUt2yLGN
         heUZD7yH6g7xZ2YjQ2MAzCyppfmgcm+3d7cB9sJYllthRKH0kWeN4+TbAlUSefLxg5A8
         SnehsxotiKP0M+1fBTAB0vkpj1iR+Ncgsid3HPngR6+Djtz2o2DAzCzRvI4watZ4Ld+p
         ekouxEwk5NKu9xhvFvTNABMxrOMFXHfgirEtSyUOo7lUetddnF+NGIdGgynsnYPejtE+
         lB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5M/BENE3g3wpEqpY8tHw1eyLzNCYuKDcT9VPdpaRDr0=;
        b=Lzwz11zvCKXMDXxKy4QHaI1E4+h0l8V0yx38bhAbXgXkQBDAs7qjZvLb7RaX1BFF2Q
         kYXjLG/fBELzJBzZsQ8gRsod1vVe16IXCpPwy9R9qxJlossgtW6u4MVpmFFu+Tg8sEVv
         TrjUCs/giJZ4UHULtt3SoadBCZdfZjtRlQPHa9DVvIaMjW0HWxvj2ZG+TTmyHvbvPi4h
         bp+7kxsZbMj/Wn73kM4+He2yKVzTQQe8vjvPb5c3S3dHa0zFjfruaTI19cP6EnwcCLuv
         2vxB+LOBN5KxlY9jIx8qyz6yVhI/mWuYUPXjyALgC5IeiIpByMs6N13CHfrldL1p/5Vp
         aBXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ntGQrUmn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c41si5670592ede.32.2019.08.25.14.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 14:41:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ntGQrUmn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i20GS-0002kp-AI
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 17:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58546)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i20FS-0002LN-Tm
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:40:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i20FR-00029q-UN
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:40:30 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33399)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i20FR-000294-E6
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:40:29 -0400
Received: by mail-ot1-x344.google.com with SMTP id p23so9256377oto.0
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 14:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5M/BENE3g3wpEqpY8tHw1eyLzNCYuKDcT9VPdpaRDr0=;
 b=ntGQrUmneX5sgH/YLR5NpkUySmwdjPbwUn4PamiTsvZzeDoh+4am2acKXXWbZigFlP
 7eiX6bbVBxQU14CdxkjXSNawcFqPw/L4hq4VhPg2aT9B8MFy1QPiqIVi9wK4EKqBVnc6
 Pe7OxQ2fsc9IupXiQ10JVtGl9Hf5Pck2tGDXyfD+qWTVmCloJIOu/VMifqAyxn0Sa6zs
 R559ixl7eznBWeOBxd+E1iLq+N19eVBRMNzxsWOf+doSWzUzCKEZwU4HXgCAl7/BkMm9
 I9UVEoHtBjgHPZfgkmCBfAKre5ZzTvXUH745ICLdIYbC/pGuCDnhHE7YSi6la/NXnRnB
 eDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5M/BENE3g3wpEqpY8tHw1eyLzNCYuKDcT9VPdpaRDr0=;
 b=QLNFprtsT6o2RNtR0/MIBUf1ZNi5g4b+i/ATF0yxMCgZHLSw+2XAKXgnKbcvjElevq
 smnSytK4j+b+gJ50zNSXk5JMCOI8A/UH2ubE9xrcMi1nbfnUVD5IJ9Z143PDrqvalLnM
 2BR6OVumLumcLQQYvHn4kbUVoR67qKpKl6hCwN5fACQwCkbPHeaeHddOSeInW2tgPVeX
 5xYZKMeJbjklxkZYysOg9R2tHWgkHZ2173WiOPrbBXQ1TJvkk9GS+7NmwOxwcuckiin9
 uvIZt9yWM77u9yWSX2nx4BD4jjOr2UWf8iPzza+b7EtMTqQTuEYEmzvvJsMhIB2hT+kz
 qNxQ==
X-Gm-Message-State: APjAAAXnDXZlJCZ92tlxBjHnlpUoZruHgeNtZzzNUuHfAuEr8Q2bTsjG
 9mNecpO9ijeW/tCd2ePeY2w6ldDYhdYm4hrWvGQghg==
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr2164163oti.91.1566769228503; 
 Sun, 25 Aug 2019 14:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-53-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-53-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 22:40:17 +0100
Message-ID: <CAFEAcA-5PNFBar-KoHS2xaP_vZFJR3QzBh1Enwwjh4CdaSOA4w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v2 52/68] target/arm: Convert T16 branch
 and exchange
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +gYAGUI86c4k

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
