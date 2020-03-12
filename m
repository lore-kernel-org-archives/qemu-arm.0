Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp656864lfc;
        Thu, 12 Mar 2020 06:41:57 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu7H0yz1MbR4fz/VWbbJ6x3zLgw54v2gKShKVhyPPZMU196m4eD6zJnTKXt4I17oW0ugE2v
X-Received: by 2002:aed:3f6c:: with SMTP id q41mr6358566qtf.183.1584020517113;
        Thu, 12 Mar 2020 06:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584020517; cv=none;
        d=google.com; s=arc-20160816;
        b=LDa1jg+4oPxm0KYmhKpi5w/juMMz40hTe20eA96KPLKFTy9VARJs0uuPuKsy3FbzNh
         p+ez9osEKskC73g79OpCsbNBLd3ofmJ26LuRxVFYB/0il9uFTYgikO/M3ZBlzatWUwG3
         w6ttqr+mj13OMzSPFXrpo5iZzcm33QjvTox4PiHpVfw2nx+66saKHpJqACc0Ofr4rI8+
         5SEb8vzBGgcbNYdLxsJYTZoiL4YiwrBRT2+JdsEMwko16Ildve8oBs3eR0jN+Hmmj1ug
         zeT97xqYKsSW58WOCxvyj2Ldvqg6ZfnjiW0f7j2WYQ0X+AuWk2nZzJD5SSj5J06outbz
         M0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a32ZZEX/gCmST/AYs/6Rmu6wb4d+7oXusEcXRkcl8sE=;
        b=DsmlKu1+Iosq0FA+c1rpQnhI3WXlwzOt/+gX86CuhAyBrsT2J9WvA/ycDy6LK9bp5p
         t+pfKqA2y7RXmeCi5pZNxS913lLBE5olXi7aqxYBTsVaGR65vZauEy8wEKIe6pxU2g/i
         sCBESlqQGy9m/3aGMCCcBLmOgPF5iOElGFVDw+VvBMB2aiRZmXA9Ko0CcqCCW+A0SJ9K
         9OdzfoUh3zuYCNDbVTZIkkK2QExkFIZHlpd/MHkDF1r/JoDRYvVwz777mChmtZ/MFcVm
         d41JrYwmK58rwbWxlIbUeC0Bz/Ur7Ni2QE23ENxKQNfBjWA/d0dl0Bg0VilX5ezqqJ8i
         zPzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cCgHebz0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s23si2941598qtn.88.2020.03.12.06.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 06:41:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cCgHebz0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCO60-0002fN-IQ
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 09:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55772)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCO5d-0002dc-CT
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 09:41:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCO5c-0002Cs-9Y
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 09:41:33 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35674)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCO5c-0002Bv-4t
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 09:41:32 -0400
Received: by mail-oi1-x244.google.com with SMTP id k8so4042909oik.2
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 06:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a32ZZEX/gCmST/AYs/6Rmu6wb4d+7oXusEcXRkcl8sE=;
 b=cCgHebz0/J7fQat7z1XmtWnPzPhHdwtheCnBsVxlbmxq/qi4zZm27pzjbYuC20tvFf
 iTyeCX9BqFzFNzP/z1ot2CtNS2na9gQt4SIteN9w7otMa50KN0th6l0ABGlGoU3MoNuG
 GhTWEUWKKHRc0SLc8y0u2o/U09PmOVyW/5frgicjjZGy3lnYiSKtIBj8wR0BtwVFfDVc
 9XpXMMXEXa7ppctOI9UwKvs2IKdHz+C1QfnwDRQZJ3onJY2MVCv7hiGkt09LqAz2zAHf
 2zyVRgIw5AytQqDLbZSWnrTuT8noLD7dxPQS8K5bg5lUaj/l1SqUJ/VLqSb3E6+op8A6
 Ud/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a32ZZEX/gCmST/AYs/6Rmu6wb4d+7oXusEcXRkcl8sE=;
 b=KEC9SO0K628AhwQBSw0cO7Djm6YpyirXch4XNVa0Ae1QNrvHSqK3Y9wFQYECzvW5AJ
 urgiTjWtOucL0JxMcAp6ufWA5HTPcDECTDuyL72dd5xyRcHK/2U/FulRe9FQKHTWZbsh
 cquBCbfst9pl8Ub8OnRBwyJdERXHHGxqoNSlwhxz1k3Fc5Qh5swUfP4WMFRSsmURRG7h
 ri3cAZBMKn/LSkH5c2mSOP5JXrwUex5pp6lixAWlVwXIVqMX9nf5X/kNQImg65WcUJ3I
 0QmZfdLQzwp2wK8ydzQRSazF5v5bnQ3d7tETZtpY9OY1IeG8wSVbOfiNfIfqeea/hedI
 fy4w==
X-Gm-Message-State: ANhLgQ3CR+UcjHvekGVJR/d7cMIoRRUN4C8ObPV46h4JzNN6d9y39b1c
 CpbVq1YVsv3e86b4OlPpL9SG5g/ytC+rfJiRD9425Q==
X-Received: by 2002:aca:c608:: with SMTP id w8mr2720087oif.163.1584020491007; 
 Thu, 12 Mar 2020 06:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200310215146.19688-1-linux@roeck-us.net>
In-Reply-To: <20200310215146.19688-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2020 13:41:19 +0000
Message-ID: <CAFEAcA8LM1bVGMMSAzNXGOmckah71MHQkUFyrhFbAMNqqeSCgA@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/arm: fsl-imx25: Connect eSDHC and USB controllers
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UyR6oAJas71i

On Tue, 10 Mar 2020 at 21:51, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The following two patches wire up eSDHC and USB controllers for fsl-imx25.
> With these patches in place, the imx25-pdk emulation can boot from SD cards
> and from USB.
>
> ----------------------------------------------------------------
> Guenter Roeck (2):
>       hw/arm: fsl-imx25: Wire up eSDHC controllers
>       hw/arm/fsl-imx25: Wire up USB controllers



Applied to target-arm.next, thanks.

-- PMM
