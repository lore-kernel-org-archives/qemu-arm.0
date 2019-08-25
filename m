Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3151644wrs;
        Sun, 25 Aug 2019 14:22:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzr9EkujJlxG7D3G2z7+ems4I39SyKmGvWxFF5reui6FXHSxsJfaVbeUMa2afqJPiALUOTT
X-Received: by 2002:a50:9053:: with SMTP id z19mr15223480edz.99.1566768176692;
        Sun, 25 Aug 2019 14:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566768176; cv=none;
        d=google.com; s=arc-20160816;
        b=DwSplWo+Ah0vPg6yE+zNq0cO5yw1joV8QiDxSP/toskWhNx+KozizTc3xxc4RIOOXl
         m2hh6QufyheWeOVD3dcwdTBNLecaiDZzfaHz7CSusN/bm0S7HcNuKtTmpLIyb4W6pj49
         sQboYyT8nXuFw62Q8J3COpc9soRHsJYUn60aFavfsxHrY6FoA2yLn2WqGJydjIA4QGRJ
         kSdXaiORAAWCNvcMaXdND384Eui9R1Pyz3Bz9N8aBrbN62Iz0lKeLruZlKYAiJwhp9SW
         9fd4YPpGx1xuWvvCaAf1JalyxT6KaBmvHqiidWmc/ZISRp4TTqw2qvGAKkhIOX0+TYBo
         GysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mK7Bm8jZeueEw55F5tr7uFjJzruMCF2YN6ZFMBAvKpI=;
        b=JD0L8uYWcdm/zzHUuaEq4IHbd8PC0QoEsZVFDwggYq//jfF6crznRFk18ZeofOmQiq
         6zwgkaFcyftnitnCxKwxcQWybFEMXWTCLcBno9pI5HGmR9T1x3a0IL+uC/iDtTeJRNgR
         Ln1wgsZKz+PjezCpaTjV70MecPvUbcRQyXmcmUuBUm1x5H3ydoRGTmUJLHcKVSDg03aN
         RVfjxfTyaz9D+ElxCbNMuZ1S++rbWIczj9CbQXQ3S9XXEMSRDcygPU1r+k8KWTBdQMIJ
         xrKRP/S/MKeH8sd6XnRtcuNFAShA25a3x6PnwW0eo8zJjYxKbywcsJDXmRuvWcb7+OI/
         cdgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="sPUyNPd/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si5621122edm.272.2019.08.25.14.22.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 14:22:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="sPUyNPd/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1zyR-0003Gu-OO
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 17:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1zy9-0003Gi-J9
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:22:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1zy8-00013R-Kr
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:22:37 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35934)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1zy8-00012w-H5
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:22:36 -0400
Received: by mail-ot1-x341.google.com with SMTP id k18so13436942otr.3
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 14:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mK7Bm8jZeueEw55F5tr7uFjJzruMCF2YN6ZFMBAvKpI=;
 b=sPUyNPd/FqNZbOdl7vCSHq6ybId77vemcb9WFLCFd2Ed0EPnYIxe34XLWCsPMUxSKa
 wSpNq8YIwP1PdajuWGddTo82RGOAotBxHWAdZfMP4xwH+b79FKRpemi49KfpCsczRcTf
 3QHdNfNrBZEQgN58k4DkzaVzlKzmD3oH9zoDJRQwsgsuWTLYxnzZcwC8VmY0K/u1ooEy
 bM+amhO0FUUphs4Mk23ICm3k5b9PI7wmZXEKYkeRw5ujzqRpSYGlx1325yM0bEEx/XgW
 +6DWk0XtxtzMnQiVCA1ok70j5tYw5rZQL0skl+lm4WhLGFVTsX5x2/1YKCOov6T7SKdt
 JlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mK7Bm8jZeueEw55F5tr7uFjJzruMCF2YN6ZFMBAvKpI=;
 b=Qh4WBPAt5CGkLnQjVnotgDn7ne/5qclmcvn2NxcTyvAWCWQxZv7uLVD+xNxhkOY7zy
 kqxFoiHWSoChyGClgFnpr5Z2gHLNSFUTjXaq+zzrBs2+nmUhawnGdOwdJ0unPd+HLF7F
 sPXU9RR75cGMPSa7doy9NyMPsfqyZ2p4F8RfhKHlbeb9prf+3Zj3xzG8gca/47ojPaVl
 USEU/El/uokPEsgZGzb7dP0fyO0PibjlE4HqjFP1JT9BJvzEHXc1CsZRWsdveHAQ7VlW
 Nl4osEcoyahsdAw1XXs19oZX5UchsS98oY1jC23XCmWwlOu1IEUwL3aukNqFNtCoVJ9I
 TFwQ==
X-Gm-Message-State: APjAAAXO/3scrYh8NCzmvoMAd56+eS9qryvzpg8kdK5yzmAI5YNF8yDO
 zP90cmPJnpdHSSYhBPBazdN2rbVLSOOyomlh4Hc+Ig==
X-Received: by 2002:a9d:6a94:: with SMTP id l20mr12162980otq.221.1566768155725; 
 Sun, 25 Aug 2019 14:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-48-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-48-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 22:22:24 +0100
Message-ID: <CAFEAcA_HZsEeYYdo2FpvV602ki-4XbyGr_+0tJv1PDRN=SeCPg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v2 47/68] target/arm: Convert T16 load/store
 (immediate offset)
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
X-TUID: aKOY0NBw5O+n

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 94 +++---------------------------------------
>  target/arm/t16.decode  | 33 +++++++++++++++
>  2 files changed, 38 insertions(+), 89 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
