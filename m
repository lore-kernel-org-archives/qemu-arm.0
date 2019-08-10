Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9823725wrv;
        Fri, 9 Aug 2019 17:05:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxltlOL7liSB+1/cQlsl31QQeD5XHad1gB0UhIN5hQ9G4/EaOl66pv/jIV6W//CE976M27V
X-Received: by 2002:a0c:e483:: with SMTP id n3mr12111494qvl.234.1565395548280;
        Fri, 09 Aug 2019 17:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565395548; cv=none;
        d=google.com; s=arc-20160816;
        b=m3/x6+6BnA0INySCs5QO56AOV8m9U8DsWofbncvrCoC9gfmSVZZSLYrZxR+J/oyzDn
         EMpoMxA1klQ4FbWP859VWoq79VJfmlR0r7Skf00/g2rYuc1PqtJRDwnKjZYuVk9b9HJB
         ygu5c1zNnHpLRel00dW5KrCFSx0yjavvaS42+22pW+LLAe30+tTZjuLLfqGF/4WlVcZm
         brysPTt8Nqu6qwelBGfWXgSUo5S7jLcBqLKvUIIFhXXW+Lp56jwXj1ZPSvZvyFltLMkS
         KsAfwIszpqMMOXm7bLeYbhLsz0cBTZANl2N4daM5R+3Gs9vty1K2DAA6HdYnaQLaEC9n
         1v1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=KuOmabyGayKaxdTh8IaiojNUoRqfmhsr1PHH3EYV+d4=;
        b=mUSdWPdAO9st7hm0M8Z/3oJQefBcfUE3uq6hNHUkAPn7v+pbJRjocFp+LMnUTqBoyF
         +M+XXCXv44ZuiXJVxtZMmZcJY0NjnLfDqbOBSWEISE73yNDB0QFVjrMFOXwxur1GiIDN
         Hs7bmSIz6nYLWLTm2oXUS1KlU1T3R5PrKAspLmusaM+CrNGU7fchk6Wu+4UqUtMckj71
         EHLzkDmGB/6Q9+IiI8TexkFI+qaICwRN5B1hTDDWXXu68ZCA4kgS9F8k6L27LtF/oq8j
         RJffgR/vpm6HNzdbxUkda7T3efjzLpDN9Njw027Gisdp5YLC2DbIdvdAWsVu4e8+3Use
         Ty6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r5q7+dYY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z53si62321437qta.355.2019.08.09.17.05.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 17:05:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r5q7+dYY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hwEtH-0001t0-QH
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 20:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37506)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hwEtB-0001s2-Vf
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 20:05:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hwEtB-0003oV-0u
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 20:05:41 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42563)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hwEtA-0003o7-OH
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 20:05:40 -0400
Received: by mail-pf1-x442.google.com with SMTP id q10so46842531pff.9
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2019 17:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KuOmabyGayKaxdTh8IaiojNUoRqfmhsr1PHH3EYV+d4=;
 b=r5q7+dYYLIX0Vdl7lbg1ZZNbRhMdSgWp/GmIN/nGQ8Qpper3WuLjuOc1xAExaynogb
 jHvSt/0clHXfNF/gIbcTUzfM2CU+UM+A+HOnc29TjA/zt0BtWWecax/gCvnvCsEeietZ
 9Doc26lyU1INTiGO1vR63IUTudB0KqjfwpAVmdIZXcxGfuILuKPxy4fgk0jfaJc2QGTe
 j4Sgso+E20rwBthwR+Ezv7DuAI60aN6IrGP+EoTYlsoyFQrng37KvuN98msJAszdB3jd
 fZbBDIXbpdbMvsL1OdFrGw1aNGoAsVhBZ5sCY7LX31mY/L5iYeMBN6J+QnACDXnU1pHW
 jMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KuOmabyGayKaxdTh8IaiojNUoRqfmhsr1PHH3EYV+d4=;
 b=KSVkxtW6QZZg46EOULAJUtEALB9PCLyf2GB4Ue/NgkqzwLmEAEdMGwBAfkhpT/bC+v
 n+ilqJwiT+YLvnDPaExzRw2pKIpFJSMAo/uTNl6zLfx8ZWiAOx8mPCGcgL/IkVj6gVTj
 JvVSm1CpO9d791NJT7BJTMxE7Gr6oHrjWR3Or4ernETFALYnjlCUFeZh1PyRsTT/uvHp
 D8t9+DlbB1VhIoIqZXEmXxrOmy3ads+gvsSWLEokOlfuCc5Iuw7jDDDysymz07DOr5ld
 k6gIgBuwhcKehkpLpMkJpxWuEhhhcWntNe+w4VlBh6q65YAFaJHMjr94Z2TPN7XnaIB0
 r/sA==
X-Gm-Message-State: APjAAAW/FGftbyNR0CTi50TUr4JZE5FQX3u7X1vth61gQZF/Lec7M82B
 OTkdpUxoSlT5/4U0evV4BWv19g==
X-Received: by 2002:a17:90a:9f46:: with SMTP id
 q6mr6749833pjv.110.1565395539309; 
 Fri, 09 Aug 2019 17:05:39 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id y11sm107505702pfb.119.2019.08.09.17.05.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 17:05:38 -0700 (PDT)
To: Palmer Dabbelt <palmer@sifive.com>
References: <mhng-b7c59cf4-b345-4805-897a-bf6a1c2c7c99@palmer-si-x1e>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b45b234d-d367-941e-cb61-1d2dc76725e1@linaro.org>
Date: Fri, 9 Aug 2019 17:05:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <mhng-b7c59cf4-b345-4805-897a-bf6a1c2c7c99@palmer-si-x1e>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] target/riscv: Remove
 redundant declaration pragmas
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: om8uv0Tuqrni

On 8/9/19 10:43 AM, Palmer Dabbelt wrote:
> Acked-by: Palmer Dabbelt <palmer@sifive.com>
> 
> I assume you're taking this along with the rest though your tree.

Yes, that was my plan.


r~
