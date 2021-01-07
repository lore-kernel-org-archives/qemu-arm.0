Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp545695lfq;
        Thu, 7 Jan 2021 11:14:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxr7GYmSucIkPA7og3QvzDVkxdHVKdgPw/zbKavs8nwpediBM8bGJmm4YLBAM7ax6uYPy42
X-Received: by 2002:a25:ef47:: with SMTP id w7mr288796ybm.509.1610046850320;
        Thu, 07 Jan 2021 11:14:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610046850; cv=none;
        d=google.com; s=arc-20160816;
        b=C1IfL2qG6vs36W20w8tufWeTiTzARK+l+CYgZQuCd0v+bQSUmbDMu9VcDfYjmUFkx9
         dxE+2YE+QjEQUrVbtht/2l6g6/eHgxpcOeR57ncZ047M/wkGF9SN25AJfW/OQpD0BWI7
         8MONhAe6grenEaeQa8E/ZC1Q5pqjXzl2q2GYRDlpYsEXVhenBMzadztrbIsj8lcDEqVG
         rlRS5VRxoz6ALwBaf18nPYuDbNDj6GKl5kg4Yjzwnrgo0zfbFFlnJEwD9WBtItVOqOy1
         OX3CHun0WnAk9mJKomVa/Si6TTq5tO+j6lG2OFA5UCmyEMgnQaVO+qbn6FqyLpGOyDZc
         3W3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NqHPJRonh2KweBPwVeTY9SnVPR9oPTzv3U0fhsNcdHs=;
        b=nU7rWyJDmguPoV3qnO2lH29pyuWJjKEGfATGblW7mJk+Kg/vJC7LcXIdiXlrJMM+ei
         V8WKDYvm2Fx/OIzmJ41UsdJIEt6WKgcez0gwvJvGb4ZqEbvhc9cjDAKKBKElOg8vaBvK
         9tedi1UCYsS4+Bx44MemJmG0bcvzxKmlYo0+p56jLG56xhDeGO8BHt/W/FnqamPqfypG
         L3uAut4M27Tsi8kbOh2Tr0aeSSLaBwLv/Imp96T6Ng0UsZ4ElVnHdFbHlcuuNtUsDiW9
         9/c9PBjpvHhY1UYipysJRNuPcYPsK+aIl8TX2ay+W2f/qhrdKZtNe3DgIv2DXk5Mg+XC
         fqvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DCyyLhON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si6510012ybp.490.2021.01.07.11.14.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 11:14:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DCyyLhON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxajZ-0005F8-N7
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 14:14:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxajQ-0005Ct-Cl
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 14:14:00 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:40983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxajO-0004vg-JM
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 14:14:00 -0500
Received: by mail-pg1-x532.google.com with SMTP id i7so5608563pgc.8
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 11:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NqHPJRonh2KweBPwVeTY9SnVPR9oPTzv3U0fhsNcdHs=;
 b=DCyyLhON/MisIOh44fNdv8bbwYCtt4zQoN/L+HH70UPRjRK0FmJdMATrI36KE0FwGS
 uauP8JF9kKovBv1Hg50plNghMl7v/+k4Zt9MLK3zzUqDrECAB/KCl8ULqiIFoG6uKnSM
 uqpHzM7gbPB4oVZJV1T1GxGZjYdNBY4WqNyVDcdJPjHeQ0SbtRm9eRj5kzd02NeFiWdM
 Toqm+cqSLuvEgss8sqAGD/sNkxSw2iqi6NONC5sDVN3sAN4RauqKbEgFsZ/oI/PHYvG9
 gfryEPkhwDHnvSf/vbOUWoI1MNfmHYJLTzzi2tOdDlP1tPNleUx+JDP1TlJB7CHqfOAn
 Xc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NqHPJRonh2KweBPwVeTY9SnVPR9oPTzv3U0fhsNcdHs=;
 b=MeNMdX7Vhggj6GngEAdB7U41PD1SaKXswaXNGFzLS9TYC7On6TVKXQv9br+2AQZyu1
 eeCRXZcWNkvL2VeCp5FwLKB2mnEplBHOG4EZ8cGjZMcUB2c+Lea6UenCVPUIbhdPWZtR
 jEsQQc0rRbj+ZTZTcbtVlVd3GansW5m8VaTS77J7MfZJUd+7eB2GAV10oxCS2tjKGkny
 01n/kPZ8AsQgmb8VLrY5jEFHX9R5/VpnFR6I73G8JZx2bSJaMwmXuDtsqSgT/194oMd5
 Sxt4yli+0kNRYcsAr/5ZPPj2mkDZY2AFH8O4M4drnC0mAPrA2snfIH3Url4W4q0vwLog
 MBiw==
X-Gm-Message-State: AOAM533ZnR2K2zPQskP1YyJKvq0GY+OhW0lF5Wjl0lGKIi1FhpqXR581
 N1FAeM2pYzNiOUVQa1Y6y0J4qw==
X-Received: by 2002:aa7:9685:0:b029:1a9:3a46:81eb with SMTP id
 f5-20020aa796850000b02901a93a4681ebmr79427pfk.20.1610046837026; 
 Thu, 07 Jan 2021 11:13:57 -0800 (PST)
Received: from [10.25.18.38] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id y5sm7051097pgs.90.2021.01.07.11.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 11:13:56 -0800 (PST)
Subject: Re: [PATCH] target/arm: Fix sve pred_desc decoding
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201230172522.33629-1-richard.henderson@linaro.org>
 <CAFEAcA_0J5UDcPf29y+9SEzfZdo8mG1toHAfHOMvqM6Kx=uChA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <97afe9a0-c5b1-8dfe-62a2-f3d0a1b55540@linaro.org>
Date: Thu, 7 Jan 2021 09:13:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_0J5UDcPf29y+9SEzfZdo8mG1toHAfHOMvqM6Kx=uChA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Joif9OJ+K8II

On 1/7/21 8:02 AM, Peter Maydell wrote:
>>  void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
>>  {
>> -    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
>> +    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
> 
> Why do we not get oprsz by extracting SIMD_OPRSZ_BITS starting at
> SIMD_OPRSZ_SHIFT ? (or even by calling simd_oprsz(), which
> certainly looks like it ought to be a helper function for
> extracting the oprsz...)

The predicate operations are small -- minimum 2 bytes -- and cannot encode with
the real simd_oprsz (minumum 8, then multiples of 16).

This is shear abuse of the SIMD_* defines.  You're right that I shouldn't have
done this in the first place, and should probably rename everything having to
do with predicates.


r~
