Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1904331lfp;
        Thu, 30 Jan 2020 05:41:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqyf4TMvq22ihnJ7rqDLGWGRUMCrXOdBV07qmRfKrjxWNXwGv5g+XKF8vzpmaZl1+GbBnfUH
X-Received: by 2002:ae9:efc5:: with SMTP id d188mr5220844qkg.178.1580391714551;
        Thu, 30 Jan 2020 05:41:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580391714; cv=none;
        d=google.com; s=arc-20160816;
        b=Z2bjM4neJrTnfYc7+4luiN8k/iAF/OVJa5FcUfEsmKnQFPtSEVg79gJK0QAfug1E7i
         qq5knijh8T6UzMbLU8QL1qOR0vYTuQXIe10gURFcUPziBjYN8LfrRurIpa7GwD7KvpY2
         jrdkefQQ6OHNbYwsUnJmQDX0RfS/LzSv/gPZpEFg/2wUEjto1hhKGg0QpqgNCCELlLKF
         5P85jInk3FqnJ4d/3UtP9D+S37JCuButvknFx2EqKBW9gLH76HF3Near7rxh1xuA/IlR
         KE/UGD8f54WNwQ/hbb2oX4HCNqiWum7ZJylvMjzqAT87siY/iSLa6l+7kfVL2Ax6qky6
         xm/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ut6Se2R8QN544z+VLTdjev2SS9Vm3bNo+oL5Ci2TgM8=;
        b=DVgL+cYQfoOvzbyxCm724lhDQd96HX3TjtPbfO9FoUvUF5dXmyu96FQMGZq7MQA8i7
         +KIb615T+w8FNmvRnxczrP6Yumv4WipqXoiK1MJwZVaNyCiu/dQNIJbAFPVauqJCeOcm
         5G5HGF7+OUkXtrtk5Hxydq6+jT8JiYBir9hP6ksPnb5jJq2DR//bgXkpLQsqqB3S5hdb
         X/tvg8swJ9s9Y1+0zCbEJnogLnPNRVj1C7f3D4/GHLKIWW+QyxANuuaqSNIA+oKusKyp
         DqOpI18EZaqWS+pFbVHPQyn6PfNEF491Q+rdlaMVF2+5kHDH4vROnWgs47OIZmVHNaq0
         91gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=joTB+Zoo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si3668243qkh.314.2020.01.30.05.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2020 05:41:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=joTB+Zoo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixA4w-0006dA-0M
	for alex.bennee@linaro.org; Thu, 30 Jan 2020 08:41:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49066)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ixA4C-0005xc-Qo
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 08:41:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ixA4B-0003XH-Ka
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 08:41:08 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:32887)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ixA4B-0003Vp-Dv
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 08:41:07 -0500
Received: by mail-oi1-x242.google.com with SMTP id q81so3555415oig.0
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2020 05:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ut6Se2R8QN544z+VLTdjev2SS9Vm3bNo+oL5Ci2TgM8=;
 b=joTB+ZooBZUxaooP5gpi1099q/YM2UxHrRs+5C2MPudTBxP37fBW2fpJNIaQF2dDNB
 qW+6DgK2+LrfrCh91+qz2SluoryYniBWWr9H7VMfTwkjU5ihRifAR8PV0hcd/d/w9doH
 4ab03DSZ1MiI++2Tvzd1M6M/pumW3j2kOuLX/I/5yzsQLsqCVB+NqrSmaliIL1evJzdi
 tz2rZAVgUvR1nQ4FoSPqtXIyh/X7Pjh1KcfBnFNetpkQ2DiZG/h84h77hTR+hqKmEuN8
 WbYCZ0MSO7UABpFgTUUgqep6p9t4gCS/Wpj51YyXOjCaR9FGNP/tZ1QEE77RAfwiVkIv
 UfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ut6Se2R8QN544z+VLTdjev2SS9Vm3bNo+oL5Ci2TgM8=;
 b=ck/4MPIR2BTe03kPoaRD3V6Mz6LhiKAxUAf/EXHe8yyaRQQgH2yIxK1Mqva9WLIPq6
 UlxQ5Fk4Z+otAV++Nvb4MdAPf1Q3eKULt8cKGkUaYT9pAbtfAQy4tKgDy2HvSfo+LHap
 gOUqiS6ym5hQibjQlPT0SUBYxgdXlRzApzVRJr/Nel/wY+ZNzGEiTYCgDjyud0SLJ2ML
 KBRggCM9Vwn1ukR94Qmf6GWpNzm+BlkW2LtBwk7y/hLzP1ekmmNi1LWdxFv0ZvF603gn
 8KpFfKF7gBrBo6pxWQ7fW5feef7y/obh6JBduCWrf+TB6m3jt7zQwm1Tdx7Y1qtSGxnM
 XdZA==
X-Gm-Message-State: APjAAAVAII8Ko7Q0TzxsOP1e6D8Oh3/PE5g3akYCTBcXvwkkPHtQPPXL
 eryiGa5+aHKQ0VhNVrRISJz+H8eyZ0/uokLvdieZcQ==
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr2874648oif.163.1580391666479; 
 Thu, 30 Jan 2020 05:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20200114103433.30534-1-clg@kaod.org>
In-Reply-To: <20200114103433.30534-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jan 2020 13:40:55 +0000
Message-ID: <CAFEAcA_M=xmh7CNT0RjQoORTBcF3LKt7o__J4HCOAC_KG4t6nQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] aspeed: extensions and fixes
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y8H3413f2Id+

On Tue, 14 Jan 2020 at 10:34, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hi,
>
> Here is a short series adding :
>
>  - a new eMMC controller model for the AST2600 SoC (Andrew)
>  - accessors to control the led state of the pca9552 device (Joel)
>  - a 'execute-in-place' property to boot directly from CE0



Applied to target-arm.next, thanks (I fixed up patch 1 to
use device_class_set_props()).

-- PMM
