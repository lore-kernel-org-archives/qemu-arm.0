Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11916055wrv;
        Fri, 26 Jul 2019 06:28:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzD3gWeBvfFkguY/+pd+gKWi3ITUbuS+wioYRim6y8tp0VKE+ox2rwc6ILtE++6OhGVG3bF
X-Received: by 2002:a17:906:ece7:: with SMTP id qt7mr73653212ejb.155.1564147685547;
        Fri, 26 Jul 2019 06:28:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564147685; cv=none;
        d=google.com; s=arc-20160816;
        b=DNcMQqb+nXrgJkWNRZvFpQljIGvKt43oz/tBY3RfZBmFtKZpyhk5wF4E/Mg4+oKL3h
         BR0D9FOZ25n6TdC5cbLOZa3R5t2kyrPbG72DeB1ztOuQAzyxLnVI2kERmk4+UK3mbFHZ
         EBecy/UTpOxmE/13BizAykheCcfL+0L29mpmgSl4SeoG42fOCQ+fSbGefPaiiqgZTkZW
         OMgs9qaqPKpEX3aQdZlAArX+4bA+1EpW5lNqIYQFoovPbdUXqORCR6gzpC8xv8ZTfQ1Q
         m21SC9pg7Y6/7bVH4WZtJs7bGl3jbaWPchJZnYOfIWPxkNlwykpVNNWoceJ1SQf4yZo1
         MWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=AeYQ99I0ZNzvORClQ/VunoCYa+uAza8hxjARLVddn+g=;
        b=X69asmcIbNtpYKRrXPXDvb01txUsu17U4AXCQqrnFs4usqmdByWa7ylxmCeZDiyBEi
         8Yg3N5Gc6hakMLuTmvr9u2r5mUhRydeZf+Zn9EXBda9/sllXPo0P5fh3Y0+XnxyzYwzC
         HZcU084MWnA8YAMlZtDOUgRQvaUrylZ/ecXWzVKBEjiUJmCOprMQY58MejpD2Vy7uqXU
         FmxTzsdl1QNCpH6oNCcDGnko/o2495xba1cjsgKkByxFVtNh+gnFyTLeaa0KbR0SlwdU
         9HJTHgDd6uR3htTd6jsr0VuwecXX8awktntw7FvW0j2VPEI6Pd+Hyi/hUduhPLgoxIT3
         qH4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dktL4Paf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6si10832375ejq.269.2019.07.26.06.28.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 06:28:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dktL4Paf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr0GS-0006gp-D8
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 09:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34233)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0GM-0006YJ-U0
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:27:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0GL-0000Cu-Ru
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:27:58 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43102)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0GL-0000AV-FI
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:27:57 -0400
Received: by mail-pl1-x62d.google.com with SMTP id 4so17791682pld.10
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AeYQ99I0ZNzvORClQ/VunoCYa+uAza8hxjARLVddn+g=;
 b=dktL4PafqHaYhKVS8jJxXCmbHP2YESh5KwEvAMb1/ZZommqyBc1vOsrbyTCSM2j9pw
 X/ca0xg5y+GQw8RrPABfFBhas+gWY3ovdSnUZPi09+tQvJRWPKoYNM23mQQ+hV/wvbDO
 gwtef88zaAe3hMfkuLv9hh3NJWTV6tP8OjGcOibDuFtdhv+rdjJBq7Ex3UD4kW1ssjdk
 FouDJEBBFixPrAArLBKBJk5T2IYQt0CSPj5KTpfYOxJ4DLJVahmNf7fJkjRQIaF0mHGx
 oTesPPOsPmlmYm0LLBFHw81H6Z4h3xWKakZWVBYoru3C28bLq2NZqGx1FNBYYHrTGr7m
 Dm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AeYQ99I0ZNzvORClQ/VunoCYa+uAza8hxjARLVddn+g=;
 b=hQ78OXb6fTL4Zczn4bAIUMxkgJ1IlL/wCUs9RGFehjJMXQJeNbV4Lf+dZMRYqi55Cs
 zg45H0WlT3EWY+rQ6rj3VE/2pVEWy+lA4HVbx8l0pGxDRLZHIsmxQBMC0M/vQtOcOA5z
 JNS/p6kJos7R6KoduDzzLMV6wXrEknUZuMvh/S5bb6w8I7DMtkp6cpnt0sBafBjMPDeK
 eykLwbPTovA/EkR6Jnz23CPTKyBlTWTm32E5xuLbwAVIXWZEugzyHJTfDEKrt9DTvpxO
 9U+w1LTd3HPcboSUW49qcMXd34jmFgeg/l2ocu89lzQ0XEEPqtDAp/do/j5Kf8eNTj+d
 0S9A==
X-Gm-Message-State: APjAAAUmScKhSJU5EU8pMewwpDI6hpA+MWEsL5125tq2LGJbrcynoaeJ
 /Ymi9U94VsvSuO2sPIPj8XINig==
X-Received: by 2002:a17:902:e20c:: with SMTP id
 ce12mr99544562plb.130.1564147676257; 
 Fri, 26 Jul 2019 06:27:56 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id z4sm85049697pfg.166.2019.07.26.06.27.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:27:55 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123405954.22175@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ae38e1f7-ee8c-8263-6e91-9a3dd1425ead@linaro.org>
Date: Fri, 26 Jul 2019 06:27:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123405954.22175@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 01/15] tcg: TCGMemOp is now
 accelerator independent MemOp
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, alex.williamson@redhat.com, arikalo@wavecomp.com,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HKouKBbHXeT3

On 7/25/19 11:43 PM, tony.nguyen@bt.com wrote:
> +#ifdef NEED_CPU_H
> +#ifdef ALIGNED_ONLY
> +    MO_ALIGN = 0,
> +    MO_UNALN = MO_AMASK,

You need the configure patch got TARGET_ALIGNED_ONLY that you posted separately
as patch 1 in order for this to work.

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
