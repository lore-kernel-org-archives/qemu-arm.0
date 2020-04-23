Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2007244lfm;
        Thu, 23 Apr 2020 08:20:49 -0700 (PDT)
X-Google-Smtp-Source: APiQypJFqRArppEL4XbCFW0nPCYNfqwk8CpbldMptSbeKZi2X/ljBe4VV6vSnqkyF+ZOxJDf6LKo
X-Received: by 2002:a37:6496:: with SMTP id y144mr4345344qkb.206.1587655249044;
        Thu, 23 Apr 2020 08:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587655249; cv=none;
        d=google.com; s=arc-20160816;
        b=ZmDnF2h1yyJLhhDSFBAKCQiX8ze2ObwZvb3D27wSlYwd1DUN0WxzmNI8qF53Ii3Fuf
         BiTYBNR07TRgWjBD3CtJpzdfN8XI4xTCaasWtIQTMmniogffeGAs68HUGLGIoGqmVNJc
         Skd7i/PpqGyjFdi31pSQ+2NAe3/hfB4fmFGUqTz3Fh8GUYFfYKeGuXC8Ed0c5WaZA/Nq
         vmXgXpGK6e6RhB4IZmZVyx3R/kV3OAvtLJl/KBrP4HXAsWZ037tDioQcpslFC12K42HG
         pewjvj2eIxSgPduez5R7aJX3nmsMVKTtdbsphGhOxaN7+j+GImsj7XbCYHXCLJW7kuJj
         4NzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=anKrq4O1DLyoV0penGedZ0wa82xNn68i3MDKtOGLxjw=;
        b=a8jPf2QZcaH1XW9K8SR09NABbdU7tHThdins2o7kYKpxi0+hlnyYgP+Kz+AvVHmPTv
         B3f8hZCaZZqA5fXDEdv7XZxnr8P+FFN36Ehp/puT3YyDQXP7Imv3GkUtUiU/Fovx8VJK
         E7Y3liPf7qcrdIFVFUEDRdkIyHaOhaZeMjeJ5CazGqDHzfyh+L9qiQzKw3iUikenkADr
         cOrpaiwp7vp7Wiibvdu8A7845/Eod3Lm3du/wmdOaZu9YrBZU5vPv8x3uMwlivgmzpBZ
         T76cFRgCB6cwIVg6syPliAQ80ZmkZmDqY0UaOxZR77s61Oa3kSZ7aPF46J6zAP5Di5AZ
         RV0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vb2JLyG5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si1482441qtc.405.2020.04.23.08.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 08:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vb2JLyG5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRdei-0003kh-FH
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 11:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jRddH-0002AP-Qp
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 11:19:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jRddG-0004Z8-Tc
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 11:19:19 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jRddF-0004Y4-AP
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 11:19:18 -0400
Received: by mail-pg1-x535.google.com with SMTP id n16so3033822pgb.7
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2020 08:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=anKrq4O1DLyoV0penGedZ0wa82xNn68i3MDKtOGLxjw=;
 b=vb2JLyG5nI+4579N5RuAqe1p/ZHJ+RYIH6thkAxo/i2780daauzi4pZ4JIhmW0SgPf
 T8vRA7SPBYEmpbE0dg8fudCI7ORopZw+xj50NPH+bKYVTc2sj9asT0MZVAH22OZ2hCSG
 yehI28V5SvFbsUTSe2XCqJ3HdR5n0kFLyXlvxCUKTK2Ew0Z5DQJXAN1U61a2TJR/FZZr
 mU5g85URFRPV14nDBby6BaQVQfQk809iN1vcEQUOqaGSQ8q8aK4nrlMHhbBe3a58Aeji
 p9VGklktQWjjyxh6Ug0o/LHIyoo8z7tNaeB+MZI/WANJ0P7Tid8b7A1bnbRkE7ztXLK8
 mAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=anKrq4O1DLyoV0penGedZ0wa82xNn68i3MDKtOGLxjw=;
 b=NisTN0fb3QKhzRd/QIiYKrdTSOhbtE/HtWcOtuQWGh3s1ErluwlwhZdhNMI1blC+uA
 eCnoR61sH24BRA7YD85yb8VTTdm3rrS/Vzx5TbObOVlLNUEhtu9XoypkgBn8w3krkstv
 oOBdmt5VZ5o/Sxb7cs8d8SElzv7tKFejOL5EU5RDy7AUFtCo5Z1gEEsoGbToZEXq5cav
 msYh/2869Yt8PEGHEaZrV/Vg3YvfW7SJvr6u5tAEetbMTkftJjXe9h2bz5NkfZ++tXPP
 7tLYY3KkecxIYIFtCFNLfZDVseDfoU6r8+fZooBSJa5tNOmPGEtcIn4bRzFlZay5B20Z
 pSOQ==
X-Gm-Message-State: AGi0PubVQBvp/bLtNmX+bLgppQWXmrZ3PJ68GNB+Jjz6QMgyTxuDHj5O
 n4fqbsNH1IjFaRloc0GKO89Io4rND5c=
X-Received: by 2002:a62:146:: with SMTP id 67mr4207677pfb.169.1587655153721;
 Thu, 23 Apr 2020 08:19:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id e7sm2969649pfh.161.2020.04.23.08.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 08:19:12 -0700 (PDT)
Subject: Re: ARM SVE issues with non "standard" vector lengths
To: Laurent Desnogues <laurent.desnogues@gmail.com>
References: <CABoDooMSCvi4sxWS-a3cQksD3V5tnHCUbGPsxW69Ou4d1rpQZQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c5d4c91-c819-8bb5-2dc7-784cbdbfb789@linaro.org>
Date: Thu, 23 Apr 2020 08:19:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CABoDooMSCvi4sxWS-a3cQksD3V5tnHCUbGPsxW69Ou4d1rpQZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::535
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i5Dxz2mkdBR2

On 4/23/20 6:59 AM, Laurent Desnogues wrote:
> 2. sve_zip_p
> 
> This generates extraneous data in the higher part of the result.
> 
> I hit this when I got a wrong result on an instruction that ends up
> using sve_cntp which counts all bits set in each 64-bit chunk. There
> might be some other instructions beyond ZIP that generate extra data
> that would break sve_cntp.  So perhaps it'd be easier to fix sve_cmtp
> (and hope that it's the only function that uses bits beyond vector
> length...).

There are quite a few places that assume (and some that assert, such as the
load/store paths) that there are no predicate bits set beyond VL.

I will fix zip.


r~
