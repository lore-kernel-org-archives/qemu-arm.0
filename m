Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1747416lfm;
        Thu, 16 Apr 2020 05:24:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypLZMPpDLkkG2b0vJscqarI9M3/K8zxHFcc9T1yQJzsvyJ3NwbwzLcIXUlC7xq9ljJrYETRT
X-Received: by 2002:a37:9c9:: with SMTP id 192mr31546467qkj.149.1587039840001;
        Thu, 16 Apr 2020 05:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587039839; cv=none;
        d=google.com; s=arc-20160816;
        b=mwMMD2+8W3a+RwHemtikqx51qpPeaHECeHKgAvf0/mRT5CTZq3JNXhm+aPkfovh1Ns
         BTNBWdqPDNPvh1CqteQatNLoqoDG8+oD0i1SCdsXNVQ4vr3H9iZB3vO1uhu2VqWSIYMB
         1R8X6lEVHVApP9C+Eye8CCHYKKtz7U/1HgNvUBBNt793TEoPuOdaMwa2B+TPY1A8oNNM
         DvHqeh+O5NFzzzkkfzr59l+h8dx+emkJqHKDhoYGgwFjrjWE7otrn1d3/siZVjFbAZ2k
         5zJrT9dWkKu2OUl1LVwz7E265e3VC8W7ZMvxKQX208I/yYb0wQj+qQuP6qqDiCJrplQH
         ps1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yLfuVwRrMu/a6rdozyYUe0pegeZw2lWd9zI9S2tbKfg=;
        b=uWUtfHKS96FxCfmwV0VsYZj41IVvQxDMLq4KK6oPaIFqgsBNbMahQT+wDx0dhM7XlY
         4R9y3gPBhmYv4VGc2FuKuziyhyWaCBe4r1XJkeVtVfmNg1onAfGrFJvQdBMRSLciLZGP
         3bdVIv5dUgIyMACtAzjUHn2TkJ5vEoBRJxwn5ZSMwtsJ2ILEue7yTkNXKuGpPHv4ZqWh
         Wy1IgTffltyOesH6Uu1kSc5L0w4SN97cPbNzPnqWMW1w0vj3WA/rXrmWBV4yYfIQKqR8
         o6+MQ0HT4FU3WWV97Dv/f1zkoLZCTQbrIHiRG9SQFSTG2LEBGgtVEMB8SMnGet5VPgHj
         R5lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KKlbo9ne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12si2811135qkz.166.2020.04.16.05.23.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 05:23:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KKlbo9ne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP3Yl-0008O9-F4
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 08:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53396)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP3YW-0008Nu-6Y
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 08:23:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP3YV-0005BF-6p
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 08:23:44 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44197)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP3YU-0005Ay-V9
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 08:23:43 -0400
Received: by mail-ot1-x344.google.com with SMTP id j4so2841373otr.11
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 05:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yLfuVwRrMu/a6rdozyYUe0pegeZw2lWd9zI9S2tbKfg=;
 b=KKlbo9nelFtrOgPHst8n/QYWspeynB/5W8NE3+XBdgl0bdC7Wo4AwNnQBgfUE7LPja
 xACHE6IG6u5qiUtGFYHdIHnPVBgmv5JgAc2ldec+dFQrLlUXPczaBWyxfs2PRYZObJ4n
 dmaWqECMaZHB+365mc1UJ12Zx2l6t5rtewg8BcQjj3RzzahcqsdgdxRl3dZJPQLUNVfB
 95+Rd1vHPFExO35TEHq4c0A6mAey9YO8F7o/LXUNnJMG4oKdCjXn9z/xOWi4SIZSBf0+
 0jghseNPKG1Uv3QIq7dZcARoN/4tF8X85b+nAxaUx9u4MHbb2BGOmEsZo8O6SZf9tIdT
 n54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLfuVwRrMu/a6rdozyYUe0pegeZw2lWd9zI9S2tbKfg=;
 b=c+yQ/1Yck5W+XvOdOgpbgv4Q5/4mOeZ4ZS8igL9CAZkr/gZYTYg6f8rPwHvHBJuynS
 o5ttnLdBB7cGNyIw9j48rvetdD3kh+xZeAegq27gRGAUIzPZjPvHG2clYt8YrZhycZae
 qw+a361dx+Ba9gX/svS5i8MX1g+YxPgfPqMT28mnfkeYEB22odXf246XLr6bZPuJ8kep
 NMeEREz6LGxcOc3//0+m7pbeiFuSzR+HZESPEjzlsDZKoUZENvIpe2NaqY6+px9YWhnd
 I7JPGxL2zPk1Nfmy207bhJysmcP3GtKCoqYDKDkAWPyzrZZqxqAKAFkozuzE7VcjxuS2
 6nAg==
X-Gm-Message-State: AGi0PubjibmaixorfpSl+BtZq6VZo/rF0XLklPWXftboKEfnfNu8Pbff
 wpZ4WYPjE9ilLnCo0oHIdT2WkdGc8lkDVjV59VgtKhKFtvc=
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr26839885oth.135.1587039821971; 
 Thu, 16 Apr 2020 05:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-6-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 13:23:30 +0100
Message-ID: <CAFEAcA8sBjb=05cDzYRvc9oBzJFGrTVokBbx6gqUNzPvskXoyA@mail.gmail.com>
Subject: Re: [PATCH 05/16] target/arm: Drop manual handling of
 set/clear_helper_retaddr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xHny31CUw5Du

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since we converted back to cpu_*_data_ra, we do not need to
> do this ourselves.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
