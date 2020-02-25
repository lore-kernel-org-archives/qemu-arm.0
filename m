Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1856987lfg;
        Tue, 25 Feb 2020 08:00:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqyzENJRQqK0vMYHO+gC3Gq7Z1sdPAvxqjFoJjPS2EnLJmsa7zkx928/81huam3NCFtc8PK9
X-Received: by 2002:ac8:425a:: with SMTP id r26mr54796027qtm.138.1582646433160;
        Tue, 25 Feb 2020 08:00:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582646433; cv=none;
        d=google.com; s=arc-20160816;
        b=h1R96n3PQStgDnpO9wP2Xeh+OG5OWL5s+gxkwBOj0WiwTYWOgoyv4HQ5fRZRYTz8OV
         lWy0NlAGz4ZT551bzNhUGQ1MMlQgXTuVVkROhwJP+4cbVAjVQ60geYNRMNpoSE0Dp1mE
         T2qp4ycooVd2WWF6IC6wvSFh7Usp2tXfe7myPR0eOhWzMyl7ZarEYgfxpN1jO0aZEAVd
         d6gzeCA8og+gYSTrlwGNFR3jE0UR7D792nYlUjkHpnsrac279GuYeQzHoCdWaQlTyutP
         ejB36GjW12GPwzEM/kjD2Q7TTS1YBhsNXgOofUdrKStnYq5XzcA+JE2xPiKOprKc9RfW
         QY1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NIjEmlzIoxEX8wD0uwi1dC8f6hSj0pPSYViBz77H6iI=;
        b=ZJcVbz+hsQB1lDZueW4xyJqsEtorUUs7QY/PjMkCLT5eTKIwpSLRKHFIg6h4/qpZ0u
         fKsqif2dqJoYc8a7YktfjUEbBCF3wo6+5cweHFqxMiARnihjwxOiiD4uD3AcVF2WRYjD
         cUT4Q5QoEeQQcZnob6bvyOMMIKDbkZw/FcIeOaGbHDzAHfS7HaYeSDllmvY/AfPzoPI/
         YP5T3UT/ALBjGL1BzPJzNhuiX7kxMrJSIenso5vYOsY1proGikNKZqK8t1gQQ4DfVljR
         Np4DUCob39VfLKgKYAHLwWGCUBZG90dpiTpA2kVeU76Gc0SHKSsvCGIfBp2/OsTf1ZuG
         PCOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xDdUI7cQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si7594705qtn.148.2020.02.25.08.00.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 08:00:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xDdUI7cQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6cdM-0003n4-IL
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 11:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36889)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6cd4-0003mY-8V
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 11:00:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6cd1-0001Fn-Kp
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 11:00:14 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:36820)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6cd1-0001F2-FN
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 11:00:11 -0500
Received: by mail-pj1-x1042.google.com with SMTP id gv17so1463340pjb.1
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 08:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NIjEmlzIoxEX8wD0uwi1dC8f6hSj0pPSYViBz77H6iI=;
 b=xDdUI7cQUYEfPBoguUrgoNxcvN/SXWTJRfWR6DFhsCn8ssc3Q+v8pSHXuLtwvT/68p
 r7u/3Gq2L+ZXUwTf5A4mqIckSLfEdntyPH/s3jqC9bljQ/avSrsh5l6jzxe/ufOd2kVd
 3ifFHMfIb4z5A37qoY+yBNMS8tkVy07E8dPSR5wVLIRiDqLQAmHnBvICeduMNZdTQ3Us
 OT9pMhJ0gfRhKiFMNXYgAgyv6B2Ujbj8ODRNgxYgEJG68ffgsyPfAcuTm+iBvbtY+PkS
 B3PMJT87N7rvbu2AY4+xVBEcnvATc032NlAskTx8XQJ4WgF8wxWlK/qTLq70DFp7BXhg
 d5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NIjEmlzIoxEX8wD0uwi1dC8f6hSj0pPSYViBz77H6iI=;
 b=CrbOwmHlDp94QBEEabo+eOBjKBhmKHOS/ST16YuvBwd6daNukL1i3zlFs0rFYiZQVq
 4IU5M7MslXo6YjCz9iCEqU6Z8bwK5AVzlcNU5Mz9wM4OEkvKyAlnELm8kJZGuYUsAkiZ
 8NemjElDW/Ez4A60E5r0zj8kbGtYVslUbS1cyQVH+rjZBTEcAHiHlvVguEV0KDzUxri3
 uyzvLfbexV9nSaNNAbExxptEeHXk4GMzWvTpjcGCnRItgmWEUCRFozaLArXUo2GRpBpf
 boVuzGmlWiZCk+VFQHyWMBe8ZjxF4tR/toPtio/uvM1E3NV1/08ks7EJmfQsS5pmjTPp
 FW3A==
X-Gm-Message-State: APjAAAWHZ0ep5KoR/TLUByp11os8PXrdansqOq11cDcEKmBEnHkegM01
 rcBYtoH919dXDUmKhyCeA4QKulGKMic=
X-Received: by 2002:a17:902:740c:: with SMTP id
 g12mr58691845pll.166.1582646410160; 
 Tue, 25 Feb 2020 08:00:10 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 h10sm17476563pfo.181.2020.02.25.08.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 08:00:09 -0800 (PST)
Subject: Re: [PATCH v2 05/17] target/arm: Improve ID_AA64PFR0 FP/SIMD
 validation
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200224222232.13807-1-richard.henderson@linaro.org>
 <20200224222232.13807-6-richard.henderson@linaro.org>
 <CAFEAcA9WZbZj_hPemTGr+Rkh--VmZt1eis189+ExuPVNipgo_A@mail.gmail.com>
 <49741058-7dbf-d20f-95ce-5bf9b5e5bdb2@linaro.org>
 <CAFEAcA9nZx0eCnQtjCdG2OZRK=pF-Afb9jtvGZ=dJTAbaVAL1Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ede96361-bc42-8ba3-4a63-fc37f02faa9e@linaro.org>
Date: Tue, 25 Feb 2020 08:00:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9nZx0eCnQtjCdG2OZRK=pF-Afb9jtvGZ=dJTAbaVAL1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-TUID: Symu2tvGXfHx

On 2/25/20 7:58 AM, Peter Maydell wrote:
>> Do you want me to add a tcg_enabled check, or shall we just drop the patch?
>> The existing test is good enough for just checking the command-line.
> 
> If it isn't a requirement for the rest of the series, let's just
> drop the patch.

It isn't; there should be no conflict dropping it.


r~
