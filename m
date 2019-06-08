Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1310406wrg;
        Sat, 8 Jun 2019 07:05:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJVLS2iLHCD5m4OBGD8ctSNwmlZYrzSm+e8/rHfqoZ/6XKO4rocPr7+b2NTCpzdBBcZA7d
X-Received: by 2002:a05:620a:13d1:: with SMTP id g17mr49023337qkl.121.1560002758431;
        Sat, 08 Jun 2019 07:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560002758; cv=none;
        d=google.com; s=arc-20160816;
        b=kz4mNupwNx1eFVoXhpyM4Um4bIC2aazWwaakTR/D14d5EP3Uf0KVSaKI1xsmc2FhtP
         QeKWyHoQ864lwsiJCLcNRolDHYMtJBwVBGDRI+qVPKOwLaOtElk9bxewa5AyLMLL8QAi
         ZKvq8nkZneFDWPfyn2he+31XyFthRhCgSg4uaHT08FNIGFCttuNc7lvfWUGeUF21Ufzt
         Kqbu5/Ed71lrWzjULUK5RRiw6F+/tx5AvOWQWEu+iyaBSCzxe2goih+OrajdKlFiEX5G
         9efMEVwbOP6iw0eW95s+NxeM5x6SD5p/5bDT/MuUkNfJ+XLbsVQxs7MR0OXIdWsdufRW
         anbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=+gNt5nsd+prMl1XgTZvIDAQT308e1Ir0MqfROFSwDQA=;
        b=EJYrpR8eKKuEkfLuxasL647FvS2IULM/lDNxEoaAEExAXZIdiOfE9AZKopVOZUuZZi
         bQPjdZF+Z1BoNqWenoONP5g0AMr4hiZwDEM7rZHjAkrNN612vb+PxSEhFqfkDqYTPoD/
         CWoyqD++zfWolqStEKB0Y/pOa/rXQTEj/8pClJTiD+zbb0mvHXwPSVZ9LRUJQPy8vKjD
         vb/zrQwSXwXBISmvIH4IuFZwdDeyyWWnclj1fFbe2S07t6Wsxdbqh5VaBtGgsbtiq7ql
         6M5C4kSKfcV37ZFNKEUZNlVVEOBNGs8KUTWS20oaqtwyAwIKkA68558Uc7TFR3CEG2hI
         iUZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=guztzd+P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q126si3435268qka.170.2019.06.08.07.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 07:05:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=guztzd+P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58642 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZbyo-0003QG-0D
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 10:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35649)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZbye-0003Mq-P2
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 10:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZbyd-0002Vz-MP
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 10:05:48 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34668)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZbyc-0002LR-DR
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 10:05:47 -0400
Received: by mail-ot1-x344.google.com with SMTP id z24so4486859oto.1
 for <qemu-arm@nongnu.org>; Sat, 08 Jun 2019 07:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+gNt5nsd+prMl1XgTZvIDAQT308e1Ir0MqfROFSwDQA=;
 b=guztzd+Pm/SzXrcJnJC9u1rx3gyflutdtpPi/4n7Wp3IQdGG2VBbDbvGq0t5LmBYf8
 ZUUEcobWZlnLV8hxU0FXXaM7dJXkJ0EcovWWBYX2xSBUPslfeEh/lbasiWyCGYAi0bwP
 PBSjBZa/eLkDzlqPUg3Pw7QklU46bzPeQ1h5PR/Y/VDQ2enpwjzcy0pceBbj+zQAI+j9
 5s+Xn2LZ4Zbewq8evJx49XMzG2pE9i2HjKLFH9cM8qtJ8YoIYMzgrQCxI1yzUOMVd8nV
 2QhXgWS3rndhQeYrqOayyBNZ7HDwzzD+Quxj3S2aFTZszK+0GfRgRW/Lmro3+8ZFDyUn
 QP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+gNt5nsd+prMl1XgTZvIDAQT308e1Ir0MqfROFSwDQA=;
 b=OGViqFSB6cxPZ7A5QGZ3nCaa+UXQdXUFDQt49G/8BYwNsccD8Jdz2A6/ZyGWDIC2zr
 pTTOXajNZ4jElbtwzSleOq+V7FOhC+uZYpLITxTiXA6K4rdPijrYFafKtvDYH6sbi6t9
 h+3Oeql6yoXzVj/h9VJt/sz4JEGCuCiDuZfjVljAG0wAoEo68I1I6Wr7KudUftfVuQ09
 MC43BH26fah3NLvA2RkYa6y0OcOxUcPMb/I5LLz3Uro6epiURKscvFZAvvJGVi0Rgaa3
 W5yHv3oND6LUyNSMysz8ZbGa3n8Df6ZB1TggWHbXnP3yiV8lzfkW6VyHx2uE6PLjhNJb
 4dow==
X-Gm-Message-State: APjAAAWl21tC9JyuLPZ/dCygoF2S1TBaTqdmZA6706oTzeXWc4PpasaJ
 GXpsDz9aR04Iqurf0gPCXmMQzw==
X-Received: by 2002:a9d:5907:: with SMTP id t7mr7740661oth.163.1560002737454; 
 Sat, 08 Jun 2019 07:05:37 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id n95sm1344410otn.65.2019.06.08.07.05.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 07:05:36 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2bd7f1c1-eb97-2cfb-fc6b-29ff52e189a0@linaro.org>
Date: Sat, 8 Jun 2019 09:05:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 17/42] target/arm: Remove VLDR/VSTR/VLDM/VSTM
 use of cpu_F0s and cpu_F0d
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
X-TUID: t+axPoh/PRXD

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Expand out the sequences in the new decoder VLDR/VSTR/VLDM/VSTM trans
> functions which perform the memory accesses by going via the TCG
> globals cpu_F0s and cpu_F0d, to use local TCG temps instead.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 46 +++++++++++++++++++++-------------
>  target/arm/translate.c         | 18 -------------
>  2 files changed, 28 insertions(+), 36 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

