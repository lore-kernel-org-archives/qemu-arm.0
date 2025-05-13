Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp840040njb;
        Tue, 13 May 2025 16:00:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQKjMpKELWD6p/QxgYz8c/MqsYM7bcTr1rVV9xYOemsf0kgpqQKldpT60jJ/7DB0Jm0oF7/NeiYyo9NA==@linaro.org
X-Google-Smtp-Source: AGHT+IEFsbGvJPo+jyY8qvtZQ32GMtowVRTPdgxdrWPsD/TU74bLIK3kQHUMhkwMlFyA65Kiauda
X-Received: by 2002:a05:620a:170b:b0:7c5:5d4b:e63b with SMTP id af79cd13be357-7cd28846e3emr178963485a.38.1747177215781;
        Tue, 13 May 2025 16:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747177215; cv=none;
        d=google.com; s=arc-20240605;
        b=d43vN4WwGb5IXpZIo1I12DYVW9B5UDgbFK23WQIgBYLJJblhr5Fsf877pEkrGEm+FD
         qss7/wNFF6mbWvuHDNYLXzNGLtgKMgp5V8O5kUKQcWOSINPyFh4aWKFWPudr6PYj9ic/
         aysrQJKnMXozwP65Wvlgwse44tpkUrbefDSACQvoSoABFNL9KA09NFqKIrCwXsCNyz5G
         FiVgAdSMJ9M05as6ULJWoLbdkJrfg3Rhc8HNtPnJUd+OvuoLmBizTF5SfeG3pUx3Lwba
         VVkaNyFjKko+t8XbRqwlpZe3go+1FbA7sqbDbStEkeXVKmH+GL+MXNkNDtp66BLchgaV
         iA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Xr6pvRDOl5fOUkD0enej84TIYzBIxFNeAPylxEVfqr0=;
        fh=cnTvKeFA+vDLVmICX9TLN7z4eVwb9n/MHx47ALwb8Hw=;
        b=Odt4vf47VGgAVhiJh/UaEk41F0bq8RQ005CD/OscXBWCDwuyUGMKko0hMyWwAga9Vh
         x04+cn62j6g2xl+jR/VWrmQMiCwEy6eEJkpUS8pQ7j+6LOG12OVC/SOtcPPAUl4CpUiF
         B6kcl6ldlDkpWoTebySCnkJYwbsi1DuNctt0tCRsOzvo4f46ZyGaywqVcgvKzaMr21wS
         Aat2wW6q2gGzny7YBIqdvCaEw/6gUUSCawIA6QC9QRXk96AgWQnGS+N4bcI7+7eCv+Jk
         sog11rLk8r9a5HgfersrN0EzCtar9gDU2q4a6QI3InEeOsMyBUCfFt2NAXL2GwhB3PPc
         b73g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HjByJNRq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39e732dsi119936026d6.60.2025.05.13.16.00.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 16:00:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HjByJNRq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEybT-0008JB-Nt; Tue, 13 May 2025 19:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uEyb5-0008A8-Ax
 for qemu-arm@nongnu.org; Tue, 13 May 2025 18:59:41 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uEyb3-0003wC-M4
 for qemu-arm@nongnu.org; Tue, 13 May 2025 18:59:39 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-73712952e1cso6225812b3a.1
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 15:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747177175; x=1747781975; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xr6pvRDOl5fOUkD0enej84TIYzBIxFNeAPylxEVfqr0=;
 b=HjByJNRqvtmmvOt7rVOq1/GKKykKaKUCZmb29esfvd6ivznSioIRCiyp26OiXqj4Zs
 su88KMjZvqRIdsmzYlVyN2wOJNVb1UKFkm1Ottwn4LfORGVQEgcRxmdGd1RUyzzJRrDp
 qS2eE21d8B45TUTIrb/fPZzTPvRPHB1qoxquoWZKd87y7Red1DkKnqW7iLHmgEhB5T3i
 xid0eNnGPP2fbLQToyjibJCd4Fzwsc7ZwIbfwcu/3qB8tQw5cj4mVheOEscGXm/CJz44
 Y/UIvE3I30VoFPwCZ3fFmLt8Lk8Ctt7JqgM7rXUK0G2SQJmN7a7zGQR3EvuomDEE22iH
 Atzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747177175; x=1747781975;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xr6pvRDOl5fOUkD0enej84TIYzBIxFNeAPylxEVfqr0=;
 b=mw7fNVrlfFWTPNOePfAC0wzCMXVo8k1BS61othqMgBVKcdG65AHAi20/u3XTYjbbVl
 YXo1D1yrdNQpQ6LysKEHpcCbiu09Uic70t/NfT8Pq01LDauJQYnTkMY8/ncSN/z1QWhl
 ErS3b3hIRXknaXqNmSyGEprHy5xNFpdbMLpIsiFHZ19DwrxJw+q0qPp7x9w+h073WNUs
 qdCJAFaB9y/nVDlZW72h/AV6Ambh9aGtSHuUJSMrVLL5q/ejmWijkAhxSdByKewb897G
 zntRMVOUa7Zj4KRZRWIkXJ9YXAO5+H9jOmZXUf8xANi4JREwRUn5OuDB7jdhQtypOWrZ
 vLCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULO3T9KIIoP73wvCICw/D6phhGWCq72OHfeKdunN7jxyBU+n+8sI5VGK6HBVYbhq+GTfDlFXkMQQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx5PTrAqW8mftknOaFXGFD5Nwop/XW3ZbORnc0EThXTT/pKWfEb
 /w0p4zURECJRukjf8i7fRKrXimcijPY7uOnV0mTjiYXRefLy/iQ2nwIWgbx4o30=
X-Gm-Gg: ASbGnctLjSHRy9rJZLHzRH0JADLsY5bq3Aljqf02Omo5GYw/LM9nGGlMVrfVEtw2AzQ
 Y/EYCR00/Np16ipV/b2k5wTnVhsdawb2U4AA5rjneMiXaHWcsLdBSZsDIzM2bzep0Zz0YnTCB5h
 bnNjn42qjNA2LTrjp0iR2xWMoFTNPe5YQPUyrRQozQR71vNLFFgckMJp7h5TexqNaUQFsiz+coE
 QsCMZjEbIeAJKgNASmIIV8MhRSN0dTUTUqx6/2Euq7YRw5jAU2P8NY6GQUWWxfEQbxZAzUbXMAS
 qVUCw7p2EWJhLpnJowKlB+aSpLpCqXlFT2mdb77XP9cILFdhu1aKq2WbuMepsrfv
X-Received: by 2002:a05:6a00:a83:b0:740:596e:1489 with SMTP id
 d2e1a72fcca58-74289373d91mr1716246b3a.23.1747177175074; 
 Tue, 13 May 2025 15:59:35 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237761e45sm8218618b3a.81.2025.05.13.15.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 15:59:34 -0700 (PDT)
Message-ID: <336bbaad-b46e-4c6f-a903-181e6cc8adf1@linaro.org>
Date: Tue, 13 May 2025 15:59:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] target/arm/tcg-stubs: compile file once (system)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
 <20250513173928.77376-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250513173928.77376-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QTvLXv4HiblI

On 5/13/25 10:39 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

