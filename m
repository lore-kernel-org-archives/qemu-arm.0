Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp662115njb;
        Thu, 22 Aug 2024 07:40:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNzOcDGsEV2tbzNYf3HyPUZBqeT6Nja7IE4YU9+fmlxqDSzOpJqCLhQyADwN7VbLGtFyVqVLGt/C07rw==@linaro.org
X-Google-Smtp-Source: AGHT+IGEs9DiXr9x56BuYmIAY3NB6KCIHk5Nz6FF8nx8H9p2NoCGGUma9cc3PilwHZS8xIsGU9oF
X-Received: by 2002:a05:6214:468e:b0:6bf:7474:348b with SMTP id 6a1803df08f44-6c155d6fe3cmr72553486d6.16.1724337613261;
        Thu, 22 Aug 2024 07:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724337613; cv=none;
        d=google.com; s=arc-20160816;
        b=oMw1FRNpO0a5qR/mCmWxSytL89OMeu4xIBLJIPLnzy40e/ltDvijYl4OAEqAndX4du
         vBpQj0FnDhIwgMcjpCMiyEJef/06YEMnJOOdHXERA1D4SNe7WQeKh+05ISzo1+VSJIlt
         26x1dH5JYQvlnP5jdUtEjABtHC9xPmJVoLvZwYlHnmeiz7O6Ehm/r6e/BgGPS4j5s7Pi
         bQxwvvMa5ud6+VcOz/veg/z513TSaFwGYqZk+qzBU3fXlOLknUdE9/RfaJTAHhUAVC22
         EqMjEoBQr0iXJ55M61vZh/KgNUzwXF4FBFRDNhL9ACJPD1saHgPR1migYJLkzn27v5DP
         bJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1ukufj80TaNtT2oOkSwasdrBCZNH2zbdV7sjzzAN8PE=;
        fh=xKTfezR+gOnvluSTFiLD6jAfh63AB7G2VjrtPVJyod4=;
        b=Aoqg1msTrnga/DZGEFuCwOO6sMB8g4WlhfWZHCL9TWXiSyW3bnzy+zKnaXagrWPXXy
         U/rJytUaIMLqB9TKCKoxVjK4crS2O8OiZHGLJunFhyx0DwSgcC8gxJFk2wmWZkiS03v8
         K0fzVA73/CHkUY5rlXibl4oHvVFxZN560fRLAENm0juTeIzfUvM+uJzRPTTNBXPGnakC
         ZBHSaldd8YssTYA+eakW7CPJ52fIKXMAlQG/dhj11DacgZAs5lM4Vdz6yy0gyj3zpV/E
         qhD7AZ4Y4mC0Kzbsh8V4Wur2hISa9DQTyqVdBArwPazKKJjb+99ZE96X01Q46W5IaaZ+
         1HlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wUfWHZne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c162dd48c2si19022666d6.357.2024.08.22.07.40.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 07:40:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wUfWHZne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sh8yd-0005G8-KG; Thu, 22 Aug 2024 10:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sh8ya-0005Ex-8D
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 10:39:48 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sh8yY-0000kB-Ii
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 10:39:48 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-428178fc07eso6306735e9.3
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 07:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724337584; x=1724942384; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ukufj80TaNtT2oOkSwasdrBCZNH2zbdV7sjzzAN8PE=;
 b=wUfWHZneYbR2rgb5h1fzXDm9LNYdYnPfQYhrVQvUokLRSguRG1xMJngFsQJK4q+ptu
 gl3XTF/ttew4dWFtjWytBYN8TK1RRqyUJkS572/cXPYs8qbeDPmsi+VSzRvYn901YZh/
 O6RjXdSSjwNOYx0DYi2FeahNlxTHjULmTMNNlBeyMebTiwEyO/xaCLzJl/FuIiltObTp
 oKgmnZRZnCzmMWtz76mwaIU1+ql3SqMzgFUWIlWNYBbq/tp9K/831FbsUCqVUY0zIuti
 3ds3j95v7T4GUVIYac4tAG6h4hRnFfDAitA+R4Axd3DB28skqAycMPK5mpyF3fCYlANh
 xjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724337584; x=1724942384;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ukufj80TaNtT2oOkSwasdrBCZNH2zbdV7sjzzAN8PE=;
 b=nkcC4y3Xa/1sjmgBc1AkOYRw46Xd8e6f8+RTlg1ZMQyiO0MSetWUdhB4vNzzEzg6Ol
 82fM2XrB+INl1oVjnic1QF5S94gF+RdK/H/HY2E5hNvZoo376frrNJ5kGJ4p0J6Wrxdg
 Nd0EuLn3pGp/wP7YvgDRXMdReoPDZ83PzN5GxQPCulUkip1sPEFsnYB/OVA+g7cSliui
 WbQb4jBs2kjtOGN3lmSxypoaDbDI60FNIHvWBGbbhvUDPQKktuWAIy/LkuQGWVvlifz2
 dThOsyt0myJpOeqVnSMZpcz4qfMnr0IpFZmwErZQzwkp9CTlJaEXBiG/Zo05x7Y/Of/r
 R+/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWKEzEA5KucOgS0QnQ+JOaU5eNmcjhTdomNAeS7uVS0Z/WAcJ/txSXJgD/r9HCAKXkZmc/MlmMsA==@nongnu.org
X-Gm-Message-State: AOJu0YwE0j8kcMArHzqiGrzI2Pe8mbBWYPwpLThwW2Yu+OLqLY/J/jNt
 GQsQM9vxzuus1o/Fv1rRid/6RFcfoLzgu0SgNQdG1fB+r4+0mA8OEjLVTHaMaDE=
X-Received: by 2002:a05:6000:1881:b0:362:8ec2:53d6 with SMTP id
 ffacd0b85a97d-3730905e28amr1791323f8f.61.1724337584189; 
 Thu, 22 Aug 2024 07:39:44 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.206.153])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730817a4bfsm1835886f8f.62.2024.08.22.07.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 07:39:43 -0700 (PDT)
Message-ID: <b3d054b9-4ede-489c-bca5-b61b046dea50@linaro.org>
Date: Thu, 22 Aug 2024 16:39:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional: Convert Aarch64 SBSA-Ref avocado
 tests
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240822114146.86838-1-philmd@linaro.org>
 <d8c744cf-0da1-42fc-92cc-f8bec8ca00e1@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <d8c744cf-0da1-42fc-92cc-f8bec8ca00e1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: rVv/E4N8/7f+

On 22/8/24 16:06, Marcin Juszkiewicz wrote:
> On 22.08.2024 13:41, Philippe Mathieu-Daudé wrote:
>>   # Timeouts for individual tests that can be slow e.g. with debugging 
>> enabled
>>   test_timeouts = {
>> +  'aarch64_sbsaref' : 180,
> 
> What kind of machine is able to run those tests in 180s? I bumped them 
> to 2400s and got timeout (Macbook with M1 Pro).
> 
> "make check-avocado" (with some AVOCADO_* vars to limit list of tests) 
> shown me which test is run and pass/fail for each.
> 
> "make check-functional-aarch64 V=1" shows me "1/4 
> qemu:func-thorough+func-aarch64-thorough+thorough / 
> func-aarch64-aarch64_sbsaref" and timeouts without information which 
> tests pass, which fail.
> 
> Maybe for QEMU project this is a progress. For me it is moving tests 
> from working ones to "sorry, timeout, find out why" ones.

Sorry for the annoyance of switching from one framework to another
one :/ Are you using Linux on your Macbook with M1 Pro? I'm using
macOS and these tests currently don't work, so for me this is a
huge win.

Most of the (long) time was spent in downloading the assets.

IIUC there is a way to pre-download without using the test timer
(apparently Richard and Daniel use it) but I haven't found the way
yet.

I'll check with Thomas how to tune these timeouts and return back
to you.

Regards,

Phil.
