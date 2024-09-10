Received: by 2002:a05:7022:6591:b0:89:eff1:5568 with SMTP id bd17csp1246729dlb;
        Tue, 10 Sep 2024 07:36:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQ9l9IRTkydPMBu1eC376YCb7fT/m+o0G6VoelDepOgUkK3OE2D/SNgTJR8xrE63aIUOSYoM1hKgDcRA==@linaro.org
X-Google-Smtp-Source: AGHT+IF2flYS+z3qnGhAri2jIPRI4T5JjCV57fY3mcRVi3LfgdyiZ3t4ljM0qnFsR3KXNUZFT5o5
X-Received: by 2002:a05:6102:f0b:b0:493:bb35:d8f9 with SMTP id ada2fe7eead31-49bde13e7a9mr15845918137.5.1725978961634;
        Tue, 10 Sep 2024 07:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725978961; cv=none;
        d=google.com; s=arc-20240605;
        b=iwm8gEE/MrgjtYfVryIe1/itN6N/5JvREH4AASXORlwbo3WvGreCSQENyrjkBU6Rr1
         DZcpubjjGocqC+cAMh0AdNFzg/s6oWaJTOxlciaKIyPf+mB6j2eGrl4hlFALQDbl5wIB
         tcjv5U02gjEGvfGzeu2dMgQTIrtKEw9d16hcxPLJJMmgTuZyv8SJUYtscROiL5znAv3G
         BkJB9zwHOFr6bDLxSJhdP5iTlZTz9unfOsKgbQn2wM/OhGcee85+3cMCEp3Ko2okWFdI
         0XBCk+HzzhgBzaPNuw5ocHI66pZoqNXyKBa85uJA+viwiGOTRE9xJmqjaHXcy/yMlp7h
         mKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/ThHsnqzo118WatRvbc8JkNGEO1aD0jGfu2wbQopy0k=;
        fh=GGLMX96VFsgEncV3PHdXaknCm0B7tDbVV+waPFpXOKs=;
        b=DE11OhSnpX5LYXpa7Jn6VRagdemj9zJmwNpffXwnj4LTPThU1sad9D8AwryrhOIaPX
         o1ADk2cC2oMYKEHbsZDrxUo+my+V3H6qB1YN1nHhEdZBn5R1u+4MP/70q6uop5cyFgGt
         EIf0gtRY4TXOC6kzSM/jW71h/MO1f9p0Z3WSaIVzbymqPXmTEX2JmMmyOogx4F4yF4Yh
         02SvuZHOqYKLxOUpSSQDIWxjdyAkDdkKm2s+vkN+ru7XnnzOH0EHWmuWJf2f3efkiJbc
         zgz3A2lYU+Iu7GH0ah7s4V64rramzJ8PbDRb2U1W1h5E8SoMtDv+LM4RLQfaIIU1Pv6+
         7/4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T7KLIEyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49c16e0fb29si428852137.648.2024.09.10.07.36.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2024 07:36:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T7KLIEyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1so1yB-0001jJ-GG; Tue, 10 Sep 2024 10:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1so1yA-0001fu-My
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 10:35:50 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1so1y7-0001l2-Rp
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 10:35:50 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso29244566b.0
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2024 07:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725978946; x=1726583746; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ThHsnqzo118WatRvbc8JkNGEO1aD0jGfu2wbQopy0k=;
 b=T7KLIEyxEhSlLv/sPD50dgi+g+87dr4/iENdkPe41VWRDw/Bc5KUHNz+JMig2MiVzD
 bgkC2E6xqDzGASGfIFo/el7dj8za4blIRJeVBnyCrbxSwJ+Lhce6nlmo1APZA/rLp1pQ
 dnm4P3eW6UYwcys+BnBdGwdAv6RPQHDCsBaFjKOyLa11CRTgqp15i29lqdMHQwTijVa9
 S7KCbLGMCf42RedBpRVdbK7fOtSdyHPOHeq9qfTZM/YIMn6pkqSXFq2VfyxtRDNpa3yV
 vW+lGkyUQEbFtijVM2ZSx/q1izSMuYTFX4cjwvNL1C6CH8Dd33YKKbAPEiDTbXE6QMeh
 3n3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725978946; x=1726583746;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ThHsnqzo118WatRvbc8JkNGEO1aD0jGfu2wbQopy0k=;
 b=ukDQWitblU09WL0QQ8Wp3Xk7n2I0daEWp0QeHWDor6gJwWvkW+RL5TTvHKL8yjRoeo
 k4yKkOhUqnswjfrZGjCEJb9v0PukKXfasm+f4iGx9LpiHqOM/OPW4m4PsWOKOOIO0bWG
 lZdeBlQ3Xor6jHCOD5GYULP+/hsjbg/Y1VuymIpFDjBLS2wngHtAvO9v4A8NxFQ7w9vx
 +hMRyxNRODuYc7l2AEPKWH3ZOCh4n/6SM1bM8VhxjGzxPU5xl+ZE67ZTJHb7C2KT39zI
 OPeY+SYldUWKr5EARP4sufo6Lc27I9mEa5V2ViwSH+kC5SjHZ3ZfcjMgTsC7/X3mqxEV
 HQKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAlJ+h5RjnyK6MkyyMtNr63XCHZcYjajqyMgx9T4aWRJBd06hZuxI5vFJr737o/W8MPC4XkQxCyw==@nongnu.org
X-Gm-Message-State: AOJu0YyTJn6e80DvFAW8kHReSO7PiqsE5vnZ/jyr/6hchz539QyuffXE
 UmKgzkBxDGMY2tYT0VW+tOc+Dci//TEjJY2xT6Eg1Y0dpSbiNGmtfdeZQHaqpoFXqOlrJRFkCzV
 T
X-Received: by 2002:a17:906:bc24:b0:a8d:43c5:9a16 with SMTP id
 a640c23a62f3a-a8ffb1c213dmr129569166b.6.1725978946015; 
 Tue, 10 Sep 2024 07:35:46 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.217.32])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d40064sm491419566b.190.2024.09.10.07.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:35:45 -0700 (PDT)
Message-ID: <bdeaa715-84bb-42ea-a3ea-eec330150e87@linaro.org>
Date: Tue, 10 Sep 2024 16:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/29] target/arm: Convert FMOVI (scalar, immediate) to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20240909162240.647173-1-richard.henderson@linaro.org>
 <20240909162240.647173-13-richard.henderson@linaro.org>
 <678932dd-02e3-488d-8cb1-6f3d37c112ab@linaro.org>
 <CAFEAcA9s1FDB_rFoo6VrcCh_bdL4-sSnzGALSv_+MKCTR9WNgA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9s1FDB_rFoo6VrcCh_bdL4-sSnzGALSv_+MKCTR9WNgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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
X-TUID: 1udCBPaekxEt

On 10/9/24 14:27, Peter Maydell wrote:
> On Mon, 9 Sept 2024 at 23:24, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 9/9/24 18:22, Richard Henderson wrote:
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> I wonder, maybe you mispasted my previous R-b tags
>> with Peter's?
>> https://lore.kernel.org/qemu-devel/37096dc8-7827-4a4c-a27b-4f8343aa9c6c@linaro.org/
> 
> I gave the whole of the v1 series an r-by at the
> cover-letter level:
> https://lore.kernel.org/qemu-devel/CAFEAcA8vJxUUHWA_nUF-810fDhYyPggtc=HGFdp0QUa5segB=A@mail.gmail.com/

Oh indeed. I'll check the rest of the series for missing tags then.

Thanks,

Phil.
