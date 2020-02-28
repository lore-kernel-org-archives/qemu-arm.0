Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1177472lfg;
        Fri, 28 Feb 2020 14:24:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqyEa1mvbeJGSJVh7+jiZRet9r0zNrgqDE0eyVi3G0Pgi8hgP9rUrbvsuDCbvScpF6RP7w5J
X-Received: by 2002:a0c:fe10:: with SMTP id x16mr5659680qvr.188.1582928675892;
        Fri, 28 Feb 2020 14:24:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582928675; cv=none;
        d=google.com; s=arc-20160816;
        b=tAYwYIlj+1w28mmaAwMiDyOx/aWSikiL2LQU12VdF42jKZeeuNrWTMvegl+WsPoFRk
         AANc6D5IS3cEkKcjLGAOy3UwsG9AZYEh0vZWGis030eAxCYhwnDT/Pp2QHHnW+3vtFhn
         6U3ymg484sLyxNz350KhRlxfauuvKqtwXtERgOYSgpsAXFiUvTkYUXle790Cpc6ofRwO
         GbiADH8jcKje+u+Cu5YvR6rGoqnqG8FaRACDfLtcc75uHN3Hg4p7wp0uvwZWNPY1MRQi
         GbGfnvTLFXAfRc1ZTV0ZxX7QjJzrdwK5tT4AzGADKqv/5vzq821KqrYnp2ifkwZgQud9
         tv9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LDKcCQrJ4exTysNpbESaXVg67i7nnbIKyjv3uxqKM8c=;
        b=HvNZMEma+WFsodXyyIrQmmhJExDUBPa7ug6lGGtc/PxPPxFD0F81BRd9m9mhTOSSJE
         Q9F+7ugxLVREcsqisufvK4ThBqYv6WDJIiXuTVYafhWdwXDIhblDOE16HZ+mxiUvArhA
         xPsqyfi6FQR5XOn9lQdQjubNBSKrmF1Gez6Hev2UgNpgvHqZXNresj6T5K2ZiZ4Fg8Qo
         5nU57kpx4v2dPocAVnu6idzK5gg1ZE+jA3N6jdCp+c+LnMBQ7V3/Xt53O6bCJ+GqDxie
         TxaJCdW+St6Ac1/qgaiujU9eEXHcOAQpfdPq11LczV1L7elSzJR8Nud9xVPk0NuxXcdE
         OYmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ODMhL+jh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si1939123qvr.214.2020.02.28.14.24.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 14:24:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ODMhL+jh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7o3f-0008Oj-Bx
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 17:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44278)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7o3U-0008Nz-OK
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 17:24:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7o3T-0005Hy-Ku
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 17:24:24 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34969)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7o3T-0005Do-Dk
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 17:24:23 -0500
Received: by mail-pf1-x441.google.com with SMTP id i19so2422701pfa.2
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 14:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LDKcCQrJ4exTysNpbESaXVg67i7nnbIKyjv3uxqKM8c=;
 b=ODMhL+jh1Jyj14pdOKkkwznHPVvdTu25FHkvzUTbDTiUxVtokR0+6AFDl5l661J44q
 E5/WrigMrRRaUKwpC5Uu1+jyWff3yD9qi5Q3IGWwpny0WTWVpMj9CLYTLwd79E48eHY/
 LK+vAfxZoy3z8uJ3WYKf3p8phqPKy2ukQe79CKQBvR5AnfKMM0fw1tbYcCZFkk8v6JrO
 qnxeMazHghCvnnJKOmyv8fI+BY+jNFu1xqBjT1lbq0t4BvpySpNtOtTQeLmEChQb+i1h
 2D+RfMwBBHqBcR+wUbAqv1iFWnjy8VMkOYhZQ7EN/uFceru+1nVBDWXZgQ4Wh3ca3qlB
 VQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LDKcCQrJ4exTysNpbESaXVg67i7nnbIKyjv3uxqKM8c=;
 b=LoIewWhYRdEqHn+Gn8NaYMBDKmIT/XAiFrU7lFreA5oGLYLe9ZxBF5qLoKnJ73vGlO
 TdAIAlfd8GwPFWcl7bgnW4jI92mXkjQ8pUWrNLvuwbxOvveJO/ECRNYtCX1FqHwn4Xu1
 laW02Sfw+8yuKp/E81jH70fbeCeyX//8AANs9h51hmxGQIQKgxNUIOeEtqUMzbKEdDkw
 QyO/kok+Nhoy7i0UTLy2OwWVeH5P3+GgPVH5zey2wpnN+r6vyxTAfnxcdXoT23sDVpt2
 BLDKs+Q9d8ZM2HLFmmn/4AG/x1PleUA4ph3aCTuHQ9RMbZ+1vBL4n26rjQ4AXmTuBTAH
 yQXQ==
X-Gm-Message-State: APjAAAVDM70QpagX20AmSTOLnh/qbCdUSuYHpjfaWdi+qd5tBQ5PAK/0
 6rzsl3fqIUJd8bgft0ROL0vQT90Z+AY=
X-Received: by 2002:aa7:8299:: with SMTP id s25mr6256714pfm.261.1582928661951; 
 Fri, 28 Feb 2020 14:24:21 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 f9sm11994710pfd.141.2020.02.28.14.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 14:24:21 -0800 (PST)
Subject: Re: [PATCH v4 1/7] target/arm: Improve masking of HCR RES0 bits
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200225180831.26078-1-richard.henderson@linaro.org>
 <20200225180831.26078-2-richard.henderson@linaro.org>
 <CAFEAcA8ipK0nZioEgbNq5B1L-tqA+rzn-C2yyfet4_4yNVnYqA@mail.gmail.com>
 <e4a70637-f4b7-eaa7-237a-57053c5a63cc@linaro.org>
 <CAFEAcA-8a4eQXf+LRS3KLURyyEPpPm9uh6q6r6D-1-sh3t8Pdw@mail.gmail.com>
 <5c484ae5-b4da-8eae-c10a-547c670c89e5@linaro.org>
 <CAFEAcA96AZB765TizrPLJYfXhx=KUcb_feL3JK1WNmf5dRSR0w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08a6a113-4082-246c-2aeb-4424b921caa4@linaro.org>
Date: Fri, 28 Feb 2020 14:24:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA96AZB765TizrPLJYfXhx=KUcb_feL3JK1WNmf5dRSR0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-TUID: toQW9rkV+Pvd

On 2/28/20 11:03 AM, Peter Maydell wrote:
> It occurs to me that we should check what the required
> semantics are for the opposite half of the register
> if the guest writes to one half of it via hcr_writehigh()
> or hcr_writelow() -- is the un-accessed half supposed
> to stay exactly as it is, or is it ok for the
> RES0-for-aarch32 bits to get squashed in the process?
> That would seem at least a bit odd even if it's valid,
> so maybe better to do aarch32 RES0 masking in
> hcr_writehigh() and hcr_writelow()?

Hmm.  You're thinking of a situation in which

 1) EL3 invokes EL2 with aa64 which sets HCR_EL2,
 2) EL3 invokes EL2 in aa32 which sets HCR which
    as a side-effect clears some of the bits in HCR2
 3) EL3 invokes EL2 with aa64 again and HCR_EL2
    incorrectly has some high bits clear.

I can't find any language that explicitly says, but "architecturally mapped"
means that the bits backing the storage must be the same.  So while it isn't
legal for aa32 to set HCR2 bit 8 (HCR_EL2.APK), I imagine that it would still
read as written.

So I think you're correct that we shouldn't alter the half B when writing to
half A.

Perhaps I should do some masking for aa32 in arm_hcr_el2_eff.


r~
