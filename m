Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp178962wrs;
        Tue, 27 Aug 2019 20:11:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyj20MLDoXAYlVI/2jsZrQnm4h8I3ndU6lVbgRQnZWHH6c4TKGNYof8ldehOAj/RTwKRXce
X-Received: by 2002:a05:6402:292:: with SMTP id l18mr1814437edv.139.1566961868772;
        Tue, 27 Aug 2019 20:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566961868; cv=none;
        d=google.com; s=arc-20160816;
        b=Wq04zuGtMAU53uJQW2jGVmR+rXFF80GJIZfplaK9pQ335Rp4yTo+FeBBckjA0el4Qh
         We6Fr0XtZE/hnyeRdZ+YCxO8+JzIljXtLkHIfpsiC6lA6A8b/ojRqOXw76hJcQlChq5L
         biQ6iu+loet6RZouUQVyV1iqa08pHpoCWYBvUEduZbMlG0PvpU8ssOg6A7mdWP+Rmdap
         LTgkTj3hxAfsAy8FVfpxnVP4tjfkSnDE6BK4tb8nRO9ILoW6LNMAIDPapYC3nj2BQKwa
         OzW5cOGC6mrhlJbO1jubCA+Pvjo83d+EFubr9oOAe7a1GKG3oR68jHW5SuTDOXI7AumB
         RMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=I+QiUqgQsVXZ/r/D2tHrlqgwKL18nj0KcCB57zun25k=;
        b=nQs/2PQ9TtwRAda1Q/F2wW+WqMIf3hXF4BfCjKVCmtflcNPBIAF0UPQydJgP3LGVMB
         Gpn3dPtuZevWUqpHPN+m4l2AuViW4KLCGu9nep3O/z3iCuQ5YfHptT0ZOji6gNFQds4s
         k6wkeKQCMiQ6HSZvXu4PWmzCfnecMf8aSUmN9so394qgcYIkmPz62CF9WY9Qj/gbrTAy
         nOkKzuXd1WUxWfdNxDzXw9eptoT2+HnDHT8nZV5i+yaRaUCkVFYmT5/SBgDQdNoolGfZ
         pM0WRh0FotPwnxtvwoD+07SMDTge7xqsGnniecWteGb6Vbnm8Pp2EkswpTjeX+8l5lMY
         mQIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="UUxqW/6B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l23si413998edv.296.2019.08.27.20.11.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 20:11:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="UUxqW/6B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2oMV-00041z-Ia
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 23:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2oMK-00041V-9B
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 23:10:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2oMJ-0006U1-EE
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 23:10:56 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38592)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2oMJ-0006To-79
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 23:10:55 -0400
Received: by mail-pf1-x441.google.com with SMTP id o70so707350pfg.5
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 20:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I+QiUqgQsVXZ/r/D2tHrlqgwKL18nj0KcCB57zun25k=;
 b=UUxqW/6BwnInCs1XWRl/+yxST8ctOnYqNfHGCIDZHEwwoHjwY8PA85T0jxb/XS41zX
 6iZT3k/lemX8izQhRhz8aUR/NzRshGw8bxdZ1JU9N++xm9CPnRLoForr9zyqFpoesicR
 w5RKLWFXL1VCmDFOF3fmvVPeeO8Dtc1FUn9Nt2FpzlG5CW+GRY9z9n+6q5fyDoPnbvFU
 BXVsdbAOu98MWo3FCBHAA1KyoPqV1EUjShMvG1bhDkPJIW6n4d/fxYc7KX5DEcRf38N0
 XD0YSfLImfrVCeUKNIxZvjc5BZoETZxXDogVMQHfIGUwLuDr1/aCM+MEhDU7OErg/a1B
 X88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I+QiUqgQsVXZ/r/D2tHrlqgwKL18nj0KcCB57zun25k=;
 b=kI0vh3wdf4WTOkmndToh8tMrHbefsprAwhiF0EwR0uDlgCnxBBkEOio2lBtB/LkR7z
 C/6qVHBIltLRInh5gI1fZJTvbr3PsuQ77Tl71sAwTi75zzqwAw2hapTfkbl8xODi4P1K
 5gPgYNUoj6FKAkfwJx4C4SFpRNhuddfCZgCjc6XcEpROJX55m05Y6Wj4+RKxWFByaRyX
 d4Ur5+06G5VbepLdwRBaSJQzejbCGEmfKUiVsVnAL8yISWLLP/Iio+P3LY1zNgNvMPPX
 y31F80Nghb+ZeP0oyPesDOKP6IwLaKWfPQmmgGni6Wu0hEA2clq/0fg1+6g9X4Goocuf
 MB1g==
X-Gm-Message-State: APjAAAVhwy3wcEB+BJvCzxDmSq2nuG0OE9f8wBL01c8Ag12ggy35hjvF
 jtXBGBBA60yjzZ3BbhJD6NZuLQ==
X-Received: by 2002:a63:b919:: with SMTP id z25mr1492730pge.201.1566961853769; 
 Tue, 27 Aug 2019 20:10:53 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id r1sm661219pgv.70.2019.08.27.20.10.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 20:10:53 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190827121931.26836-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9a489815-8cea-02a3-d890-38a0ae0c486a@linaro.org>
Date: Tue, 27 Aug 2019 20:10:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827121931.26836-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Free TCG temps in
 trans_VMOV_64_sp()
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DYFb8Q4mD3vZ

On 8/27/19 5:19 AM, Peter Maydell wrote:
> The function neon_store_reg32() doesn't free the TCG temp that it
> is passed, so the caller must do that. We got this right in most
> places but forgot to free the TCG temps in trans_VMOV_64_sp().
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
