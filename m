Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1919600lfm;
        Thu, 23 Apr 2020 07:00:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypLjb7y8Ct0X3vzDNElrRuIIj523CFG5KsNZuMThBS22TpY2swjFRy8OIgZSuZUnTcC3CvXr
X-Received: by 2002:a37:4ac2:: with SMTP id x185mr3703898qka.413.1587650434780;
        Thu, 23 Apr 2020 07:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587650434; cv=none;
        d=google.com; s=arc-20160816;
        b=H2WjYuXtPrFodEhOs+QBvfMmwzYC7QiHv8sVHLLP6S1RZy/3pLeCadZCNQAKhRZyp3
         ljND+9q5NR/rO5/v4Seg1/vxyhiXpMPSCwYmlmcIrj0vc7qlmcUyMIo1JOt7bIuP5tWK
         bjNwjbYq3CU0C6T9KNxes3Nn2q7+GBJ+FXgkgRsbnvHlG1JaJ0Fseui1VVqzCFVtZ7EX
         HzeORWOYODBBQJOzm7MaFL38cZKNN3rtj6op4CqW4wO7ZtkjXEQiRHsj6Ok9M9hK1fJt
         k/uEH0SzzvSbaw1Fy8KeRzUO+h9ZE6IISCtHdWQ35FitW37ijZdsPD4dGNSRjBX7UkSe
         vTdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=1Veq6mG2B8JnNKQTwvwzYM2kK+gwYoC6JbcJRjXkwHc=;
        b=pEa307OeXcdckQLDgJVcg//ea+bHBecEn+2k1nQ1S1z4uQfqKXi8WXFKoSSU2Ur5+e
         zR/BHnfgzQ3jOm321ohAP86+cqMxrHNqIJazh7+UplBQU/M7Y1yNz0Hew2tIJr+GV1kS
         felstAu8+99044/++GLPI5wMaRy1+UH4mq9jcNfnQUoP0UIZwyLQ26kCnZAC6fLR39og
         3uEKqVyeVEjuh0rOgOb7IJHFB1n97QbnKn11Zvmzn35kTs8ULpJkluVBuC7VXHpczzEW
         IC4AJz7NcdDCX5Wxn/DLwuIvOnT/SipmLlZSIjq1tloGraPknPlO2oVCEtrWdwANyUh5
         /NIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hclDnROM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si1593247qvq.139.2020.04.23.07.00.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 07:00:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hclDnROM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRcP3-0006cz-8i
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 10:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50268)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jRcOJ-0005zS-Tw
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 09:59:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jRcOJ-0001ja-Dl
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 09:59:47 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:33410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1jRcOJ-0001jN-15
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 09:59:47 -0400
Received: by mail-io1-xd2d.google.com with SMTP id o127so6484953iof.0
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2020 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=1Veq6mG2B8JnNKQTwvwzYM2kK+gwYoC6JbcJRjXkwHc=;
 b=hclDnROM2sNpVKciG6+lrGauq/tO7yVRa2H2CVuec+wJHw6LXlsmtlxjXC0bFDfMKi
 TdkwqxX1XQYfQPw/gsWygSp1if5eLeFE57biS5zJDxfszgi06Wmjo4QcrkPRTP7VZT+H
 z1N7YFL3NCmHXyPDGt+BBVVSpUZa0VNKPzgsYJu4ZeDZt1whZxMoVDKwieZHOHIDjfOe
 TATE8yOQRCoXRCtU3/DYHQB5zsD7oECpzOd47/prTCntCBo2Pb/oukuHlx3m0nJQuMCg
 PhgQ9Zi0RdcY6LuADMFgX6q59jvOfBO85mVUMu2bVNhp8CCTzdTiRwZdQ40ntGyyRLMi
 ixYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=1Veq6mG2B8JnNKQTwvwzYM2kK+gwYoC6JbcJRjXkwHc=;
 b=H1E199/v4BTD+Nr52lkydhMaYj2bQFGeoVEOi+ibBehiydG4Rniw+7M++ByHITURgk
 NnrGF404B5RZTgz+7ITBEYOaYx9RNCeVbsjPXouZSN4JP6ut9vajFacmNJRCatf2uv/v
 4lRQIoqadk4kFfs5xgbZcQwbySlK+T7NbY6wW+VC2hY//FM35wQFeEJqQsWQAWSZ6bCX
 KwEEUVP8AeFYWkkRJ01+Y4nLdLBSvC/kLW57aay7DpH42P7brsX8zo18vz4Lrc2Xdg0h
 WVVOxLqhNsx74ZsebUjmTYqwdsNOCjCqnmLgEDw0HPx+Iz6FeKO/YZDDImpBQic5vxjK
 0FxA==
X-Gm-Message-State: AGi0PuYTrGIG0sIR3kwwGhkl5srIiP891jce/6XbtkpRjOaRqyVC+zoI
 Q9Osn3dB1yQJuXlmmsDGkQ/9cJih6wMnzRnj3vM=
X-Received: by 2002:a6b:7843:: with SMTP id h3mr3794044iop.202.1587650385323; 
 Thu, 23 Apr 2020 06:59:45 -0700 (PDT)
MIME-Version: 1.0
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Thu, 23 Apr 2020 15:59:46 +0200
Message-ID: <CABoDooMSCvi4sxWS-a3cQksD3V5tnHCUbGPsxW69Ou4d1rpQZQ@mail.gmail.com>
Subject: ARM SVE issues with non "standard" vector lengths
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=laurent.desnogues@gmail.com; helo=mail-io1-xd2d.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d2d
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
X-TUID: eocHxeikKkeA

Hello,

I found the following issues in SVE while playing with a vector length
of 640-bit.

1. sve_uzp_p

I think the comment about VL not being a power of 2 should be that VL
is not a multiple of 512-bit elements with VL > 512 (not sure how to
phrase that properly).

        if (oprsz & 15) {
            d[i] = compress_bits(n[2 * i] >> odd, esz);
Here n[2 * i + 1] should be taken into account.

            for (i = 0; i < oprsz_16; i++) {
                l = m[2 * i + 0];
                h = m[2 * i + 1];
                l = compress_bits(l >> odd, esz);
                h = compress_bits(h >> odd, esz);
                tmp_m.p[i] = l + (h << 32);
            }
            tmp_m.p[i] = compress_bits(m[2 * i] >> odd, esz);
Here m[2 * i + 1] should be taken into account.

2. sve_zip_p

This generates extraneous data in the higher part of the result.

I hit this when I got a wrong result on an instruction that ends up
using sve_cntp which counts all bits set in each 64-bit chunk. There
might be some other instructions beyond ZIP that generate extra data
that would break sve_cntp.  So perhaps it'd be easier to fix sve_cmtp
(and hope that it's the only function that uses bits beyond vector
length...).

I hope I got all of this correctly I'm not familiar with that
implementation of SVE :)

Thanks,

Laurent
