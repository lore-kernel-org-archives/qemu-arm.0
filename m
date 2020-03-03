Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp685022lfi;
        Tue, 3 Mar 2020 10:36:38 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsRKEToTx5Ep5sTJB9HvpQ71PoDRm9mnGSnut5RB64+YBY3WW594MamQgUtDPwRYrJuqGWA
X-Received: by 2002:a0c:d6cf:: with SMTP id l15mr5121107qvi.36.1583260598323;
        Tue, 03 Mar 2020 10:36:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583260598; cv=none;
        d=google.com; s=arc-20160816;
        b=hhXk9eNX+fB3Ak1ESLXF2R1IHZBpX5xJI44yijj95fgjoH3cpWmKE3Gb99fsm507EA
         zkQbPTMWB0licbyEqKITCZyySDSlN6caeI3XQNNrIYSqnRa14SRqFv5bRqLJJcrfLpTz
         9wJg9AlriyVnPA3a6zDJyGGmrl2lCi3cX/WuDvNOu3gEauEv8GMikN4DH0DlU3Cj6eoY
         +g8OLQ+o4Kf1zcu1HX+jOVdaNaMBJUk1PEva3CbDB9t9bn7w+SRb3omJS0scbPYv7q57
         oBumcBsPFJIwFSWa9KoZpEhO6AYUKPLpzZ5jhAC0nzWSToKgxZtWB1xVx9eOmjsKokF4
         5nDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=X1IImt7x0eAq2SbTkLrGAxxgYhVqi+DI9hniu2bAOn0=;
        b=wNeFQOCQbN+qRHCMCCbxa5waawm0vkvnX1A1ObR+/40dJHVJpjYnWvmVYNGyf4H9Fb
         xJcJQbtNokcNsXlNrrU9WTlFi/xC95+m3Xct3Y6pwELyeHvFMiII/0a/K6XqHajU33cB
         Bg1FwXapFJcxLUJgJP2tNdgkR3DC2/kQ+WAm5LpcaKiWaSMA8tLfGSvQCwX0kSTp2srz
         zckOJSMSHPFBa5ZsWC5mxZSq9wxhE+cYvdmsBw84dqHHkGMMAVQeOXVosLennFiXOtTA
         VqgE0ZAe5BYf86GMXMbu6r8lMRPQWMtLW9OG7Pfp2GQInB0TQZdLt+y6XB+qr0i7Ao14
         fFVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tKwoCzBx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g39si8221889qtc.209.2020.03.03.10.36.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 10:36:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tKwoCzBx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9CPF-0007AK-OZ
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 13:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49639)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j9CP7-00077U-N6
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:36:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j9CP6-0001tU-Mr
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:36:29 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:36702)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j9CP6-0001tK-GY
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:36:28 -0500
Received: by mail-pl1-x642.google.com with SMTP id g12so1719617plo.3
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2020 10:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=X1IImt7x0eAq2SbTkLrGAxxgYhVqi+DI9hniu2bAOn0=;
 b=tKwoCzBxA/V9S9qXJJnpWr1nMuk7nCAPpM7vYUhnEgz3vgk9QOc1jX7O2mfVgJAydD
 4lzCm6fUrV2xzKH7G7NPvDWco2M6Koc3urd5eEuQ7l5Nyau0bpgreldipIzHtolMC3R/
 WbR3DJBfDNaIvbLQGqK42PoRzFT+QZQB5gkuRegjpqvyevXbXkZaIqeWOasV9CtUq7ef
 pBKgeNgcjdsxUnUQDJl8Sf1wC0WVe8rmlZivPMigqBQ+jimuVPW0KHaJbrzMj8Z4Dtc4
 dC0A76VaEFMoc3W5g6cUIzoi4OVl5mVugKq+kXhzHtdF8UCegs5SIpreFwnzyKaIibNL
 8rYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X1IImt7x0eAq2SbTkLrGAxxgYhVqi+DI9hniu2bAOn0=;
 b=FuLgRLjlhtQBuajAyKu+kflI4SLp53IVHNXRT4fVSUK3o+JbPdsA+4Gke+wniVS2mc
 FQ8khCuivODgW93mWg0ywIjVCP2l1Y/UgX+rj/IOUwese3NMs8A1gRZ5U261OpGQ7wEb
 bb6ZUQupeQHPU/l9GSe8TMKdjL774gUY51FUlZtELI/Dry+FXjoY/ZYL3tlvyRUOOhU6
 hlBjxq8Zzpa+rpY7tHHpRPAnqMS5aB2MDHuVnYykvETLKa2QAlQ7SMMMPaY73k8r7+7o
 4oIYs74nhBtiooB7hVBBZFbfsr4Ac0UDTiOCIFMYgkuuCh72uZ7JjnhW17EldPvloH1D
 QvUw==
X-Gm-Message-State: ANhLgQ3idIORjGkoJmowXwRYBEP1HT6e7KN5lEHrKsRLavTBWhI1fHOz
 Q7wJR7jjrZwXZAZkYdT/d0p9wycdW4M=
X-Received: by 2002:a17:90a:b009:: with SMTP id
 x9mr5336433pjq.124.1583260587447; 
 Tue, 03 Mar 2020 10:36:27 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 z6sm351976pfq.39.2020.03.03.10.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 10:36:26 -0800 (PST)
Subject: Re: [PATCH 2/4] target/arm: Update hflags in trans_CPS_v7m()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200303174950.3298-1-peter.maydell@linaro.org>
 <20200303174950.3298-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4c321c94-8b3c-3099-aea9-ab3eebc66e99@linaro.org>
Date: Tue, 3 Mar 2020 10:36:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200303174950.3298-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-TUID: wCorU95r/mZp

On 3/3/20 9:49 AM, Peter Maydell wrote:
> For M-profile CPUs, the FAULTMASK value affects the CPU's MMU index
> (it changes the NegPri bit). We update the hflags after calls
> to the v7m_msr helper in trans_MSR_v7m() but forgot to do so
> in trans_CPS_v7m().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
