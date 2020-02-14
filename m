Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2350618lfp;
        Fri, 14 Feb 2020 12:32:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqwqyFgofn8mfNDBOyVDwD7FT4HO3TYEmqg4CalnYvl1usDKaMC9XAC+NSBGpc/fFYFOjsma
X-Received: by 2002:a05:620a:412:: with SMTP id 18mr4309460qkp.213.1581712368504;
        Fri, 14 Feb 2020 12:32:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581712368; cv=none;
        d=google.com; s=arc-20160816;
        b=mbGgUeqnG59NhS5grYyExIqZnYLa0lUpL2qwc+DD21sMTKz+LqIMrIzFu91pIrFLtM
         NhmSFk+HFqgBDW6Ni52ilchat4zG8PYuxSBC+TbYAbuy0ZkDs4IJMntQg3w5cjkVI5om
         2jiokz3QabMexYP0tIzfuYeG6pqrWLplG7EdSFx+ZIh0TaN5MJXj+u6REDBZg68N56lH
         OBoXLYAseX8zu5owU7Tn0oPpar2lquLIPg9WKQRYV1yGj136uFnkPK/TMEWVleNcXlYc
         Owt7hiHPmolNqeJEtFw+3i4503dEsTRpVvnSFz55VQ6ZRQIwfx499s9tjecGcDzwGwAL
         QuWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+PgIueiEHeE8hNvIiKSs71g7wCMFIuCfz2Pul38Bob4=;
        b=IPQCo1utM7JWqpHJBRvXcWHoFEyO56KASW0zX7T8T7viRhDHlNLyxykTl9/4pzdY1I
         IpXwxrrsVRpOtJyPSpdkma+40r7sqSUCTEp9mutIZnBMHgxsBtdmQJRFLEvikPjb8aGm
         fYwvBzbN5p6e4TKjSBx3lWhGVkHr0zaHkF1tmv7MIaI1c+YLEchZrTyoRyw3qt990FHz
         Gqzo2TKyTC4RqNHcnYuJrhbA60EeCmVuMajFoUEPJi5TXFJ+94QEaqGPN0X97SdvcFh6
         5Q2cWxkrNCm4NpVrVg4o3wG3U8zqqTdJTiVRsoNdgFqftqKUSEJmPsM3pDKhKp9zL2Pj
         zcwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wHpZX0nq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si3342794qkk.301.2020.02.14.12.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 12:32:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wHpZX0nq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2hdo-0003jc-0P
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 15:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55056)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hdf-0003hI-KS
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:32:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hde-0007lu-L2
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:32:39 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35625)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2hde-0007kz-Eq
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:32:38 -0500
Received: by mail-pg1-x542.google.com with SMTP id v23so2106630pgk.2
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 12:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+PgIueiEHeE8hNvIiKSs71g7wCMFIuCfz2Pul38Bob4=;
 b=wHpZX0nqtYXbob6cuzNzS/rkqJSLF6CxmppKaR8mDWBCo/jT/ij0ZqYzCjrfDI5Mnw
 Yf29mavflch03Msv1cEcintt3X2RXgdjk7Yc3eGD2zoA6sjlL2tNR4eiGDXqQ56EfTOp
 dMZ58SxX1VRGNX0+RaaHfs23isbOaU9T+7LRTLBQ8quGorICWF+tJh1k0a9iVTIBu23Q
 BIOVK5/+mpiXjbZYS3HXyFNQwOsQFItmqdIxVOHdZJnLJrryHlc5L7AkKo88zCSQOmHR
 h5PyWaU1OcUJ+ZMja1LGpKVc4RZJ5Cq5esYtVGVPfuh0aFLSiOpLUPRredS9V2SWK8Hn
 VgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+PgIueiEHeE8hNvIiKSs71g7wCMFIuCfz2Pul38Bob4=;
 b=hpjHWiLvycGZrcooK13nWI58wWWcijbargKtWv3szEfRdk+HgxPt+YAa9aEKzYu/Aa
 8/pVjwADAG5tkPzEf1e9wgRMpe0FqVsz+Q//Trj2/CWGJTcnAm3/Ntnq5/MfwKrWk+2M
 1IXhCc6mgkG2I+M6GMgFhTknTzhU38t6khUWXM+Kn7qVjp3+mZqP64cCOlX8fKT0bGLS
 w0wgCq+8BCeOQl3u5MMMgerSgYlPdMfsLbM9587kzAaJeG8hvUlrB5k0vnblPkCzEsYJ
 gNwpYZBUfKCnekkQZ5fzTgVnHwL2Vm9ywaRzTxUeqU9k/bZrLFVFayT5lBV1TdSj0ub7
 +SnQ==
X-Gm-Message-State: APjAAAVeN1985CKC15FlH4GVfIThoxeVeLgjrVpSrxuRT062RcTQpebH
 XVJlwnwVVNXQjFdk7NzZR+Tezg==
X-Received: by 2002:a62:8245:: with SMTP id w66mr5133395pfd.93.1581712357505; 
 Fri, 14 Feb 2020 12:32:37 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 ep2sm7275072pjb.31.2020.02.14.12.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 12:32:36 -0800 (PST)
Subject: Re: [PATCH v2 20/21] target/arm: Use FIELD_EX32 for testing 32-bit
 fields
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200214175116.9164-1-peter.maydell@linaro.org>
 <20200214175116.9164-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f657693f-af24-37fc-04e6-666cebf47a80@linaro.org>
Date: Fri, 14 Feb 2020 12:32:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214175116.9164-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: whyu6xCvX4nY

On 2/14/20 9:51 AM, Peter Maydell wrote:
> Cut-and-paste errors mean we're using FIELD_EX64() to extract fields from
> some 32-bit ID register fields. Use FIELD_EX32() instead. (This makes
> no difference in behaviour, it's just more consistent.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
