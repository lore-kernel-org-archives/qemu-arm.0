Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5452382lfp;
        Tue, 4 Feb 2020 06:52:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqwW+cpqtXKs7T9YxadL8VKiRUhuCZttXDa0Q2XxeJVSE7vai4EPe7BkBsSWG5i3cxWr76cp
X-Received: by 2002:aed:2a86:: with SMTP id t6mr28064495qtd.81.1580827925648;
        Tue, 04 Feb 2020 06:52:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580827925; cv=none;
        d=google.com; s=arc-20160816;
        b=L5u1cvCmg12W3/DpCgvpSV3mNQeZ1gf51qr0y8mwgjQlLiW9+EfmdqHtYcrv2LPhN0
         nA5GXpTLUyqFlYQhoXgz+mSDDJxpjXbwGs5naRGZmolQaP6gogDOvbvo6kdSIJ7UB6En
         jrtvsmwsnTfrXenk/9BtVM4V7Pgl8LSkWseZ1/eiTAuXpDKDmiEdp+4U8XJtyys2FgBW
         7akpyARGLrQ/DBJMHNeWYd1+ol76UzJtQc5J4njGqZKtBkEB8u+KGX7psQ4/JWuG5FkY
         quLT0LjhBUQIfGNuae0bhxLgaHHvRUQN0BzFbxt4T/XsjoF1lhRDLQ7qDqW0oNS3Bse+
         t3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=wzuVTmFx9GZsjbitRVHvEpxLGLu+ZigsJcDI+U5riyY=;
        b=KKmwTWxHcrLO/o0rVXhrNA4eeA7x9A/5wTn19nHj15dMCS5emlZKC3Jue+alCJA2Hp
         4TFGb//c2defCR9FT9UOXI96b+GDEsKI0zWYapStxsgrzNXBai0jxmWdVNEzRudA7wJn
         eLw8gd/tHFPhCblVkjQEdHx7EvGPjrDnqGLvDPcCiOcJP5pOEjHBz42ZMhqv2oNbSJ3B
         9/ut7+bN2Sc/xCPlHqSvW4UQxpZSq9SQIkxJH7KsWIYgia3FYw/8wTz13XoScKeiocro
         /WTQylIJHNnQbMdUTp0X+ueWCau5/5doDK/xg8+orm+wlz0/T9KrDwwrb3/U8qXLrM6r
         JZfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="DJRod/8b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j35si12736214qtb.298.2020.02.04.06.52.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 06:52:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="DJRod/8b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyzYb-00068O-3N
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 09:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51086)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <max.lapshin@gmail.com>) id 1iyzYU-00068C-GH
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 09:51:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <max.lapshin@gmail.com>) id 1iyzYT-0000Vx-I8
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 09:51:58 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:32814)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <max.lapshin@gmail.com>)
 id 1iyzYT-0000N4-Ar
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 09:51:57 -0500
Received: by mail-wr1-x432.google.com with SMTP id u6so10137386wrt.0
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2020 06:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wzuVTmFx9GZsjbitRVHvEpxLGLu+ZigsJcDI+U5riyY=;
 b=DJRod/8bsGW1VKlIKN4HSsII9b+8hLSK3EWG8ZeYvWvIK3AqW4ycB5b/XzoorCV/LZ
 PvO59fX25JS9i1vLocHG0G+1EPY+jgh7EijOTZ2R3c8KsSG7Sy9EcaZ6QueA7h6kzMGk
 cKvhicUSaVLYMwI4Vq+fOxMxSnmtoh6B05Y0JF+8VWTEL9x+MM6MWbxQOOQyy7MnYld8
 Xbt9PnMEJZ7kPrgblVbD6mJhIm8rBLuNFOhAMR8mT92s42zTT+GTjO18Ew8pLtjzN10H
 wAHHwJWih7vtkbo0A8kfiQz04WxWTkZmBBm7dzMSKXfE4ZKRWA1sWFQ6Lpx7zMTqKRJ5
 Y4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wzuVTmFx9GZsjbitRVHvEpxLGLu+ZigsJcDI+U5riyY=;
 b=DMwcFPUqn8xCWj+cUnv7CKhsFpOpQeLLBQrBFPCyDOwVk2S7PaUr7cWf6aTVhijuou
 1v52NqK+LBg5EbMzwpkQTPL2wRFNAm3T5dFDYufkZ4KYPF9O6cqf8R+r4T+PGYeAfnFn
 W+hPAr9AJl0nfRi8pPcdQ6j/btsb7Wt2Vr8A3VEYIdsIGjDtWUt8yVIg0bVwVC62ry7O
 p0Vd4IjJ3SKaX507c0jzhJuwW1RcTOuzREitBguw7TIJWlOTwDEVRdDeZ/Sf/jZjClqR
 +OMltKBnBHVE53zV7x1YQGfFxkraHQru5UeBgmLxAxkFQy7kgi1Oi1E1zXgroxWrjWmr
 iEgg==
X-Gm-Message-State: APjAAAXtGQbJJGF2K1yYSunUewsFMAPUHAsldOfQAcL9uxSwipg9rT3f
 rLZaFbynijxCoP2n+9ClkUEdsQCxNxnS+sS9n4BaVA==
X-Received: by 2002:adf:d0c1:: with SMTP id z1mr24290790wrh.371.1580827915486; 
 Tue, 04 Feb 2020 06:51:55 -0800 (PST)
MIME-Version: 1.0
From: Max Lapshin <max.lapshin@gmail.com>
Date: Tue, 4 Feb 2020 17:51:44 +0300
Message-ID: <CAMxVRxC=2G7LrdwLf+oZBUiSfdP7JtPc=4ygkqtEvrCB4oRUYA@mail.gmail.com>
Subject: Support for nvidia jetson
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005a896e059dc12ecf"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
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
X-TUID: mHXpg0EGN9in

--0000000000005a896e059dc12ecf
Content-Type: text/plain; charset="UTF-8"

Hi.

I want to test nvidia jetson system (without its specific features, just
test that it loads and can communicate via internet).

Should I change/recompile kernel?

--0000000000005a896e059dc12ecf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi.<div><br></div><div>I want to test nvidia jetson system=
 (without its specific features, just test that it loads and can communicat=
e via internet).</div><div><br></div><div>Should I change/recompile kernel?=
</div><div><br></div><div><br></div></div>

--0000000000005a896e059dc12ecf--
