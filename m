Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1295980njm;
        Mon, 1 Jul 2024 04:21:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzF+lVx7nLfxv8MRNgUQsKZ3z2Y8QLVT0wTFjy/wLOeyoBY3i66/QvnJuecAJjH2HrBT0KNtkYLKeVySE6OwZC43gTMsRE
X-Google-Smtp-Source: AGHT+IFMjYuHtvyZRprAPi8kTVCpzSuHN/qVGp2gjHpOhrcCWs/4XyJNOMTHNoPK7ZlqvurHYcsS
X-Received: by 2002:a81:7189:0:b0:61b:3356:f1b5 with SMTP id 00721157ae682-64c71cd8e7cmr76123257b3.28.1719832878520;
        Mon, 01 Jul 2024 04:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719832878; cv=none;
        d=google.com; s=arc-20160816;
        b=tFBlmF8SQu4U8cajG0tVQ/8uXEZRH0oDEBse1DAC1aW1dpr6m8rnohaSUOSKfrX4T0
         UNY951RZL7+ceu7qdBMLk58SvhekYvGL61OXcRjntKn1fZ36U+VCtToneGTjEvDd/+Ns
         sddARW3UAWY9DocxRuz1D20itIe8IyDP4q15sSGtecHcWKuLDFnIelldIww8Rzja20JX
         HaWQ8xhrD2adtdeMPv6ZJhgoi/33TMVojFFey8NB0YgMMxha7tnhZLPpyxe2OzkoBWbN
         vv4STSQX9PRLFUIt5YuJ/lJ55Jfdy1iyCc3q6nhQAE0D8Ut2LniiSCULcyIaC6Zxu6mP
         gDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HqYKcm1A89FEOMNRUkVlvdrvbaPWNfCd2gw1vOazbek=;
        fh=HRGvBFfjB9NW9Mvxiz2aj3CfwRM38GZ6dH5pxKl7+T0=;
        b=NCRJccO9M8aGpfTOWLoEFvD0iA61yzbQZjCMD5xYhqBP6Pl7B/1OmkHXie7j/wDTUd
         mWlpynIeUQR8uNk7LLPKUrj2Wl5EKtCeBTdYWHa1qelC7ugRsdo623xzH4ZSj5+zpqLo
         9Zgq3BZ4M+SYcaBAK6lowhDznJRmNAMkCSBqjX5cCYFrP3K7pFPSounFErxxZ5251ymv
         bhdsTTlPw5mNsEddwL3N+sidYEx+hcaNh8Di6C2uWVzY1C0CQvmSTEuJg053Qg4f+VJe
         2R7qYnP3i43PZVXMldHIxw9kP9l7sTmu1vWuLyz/fTRJUpgut5fTZ40El9FfNHeszFn/
         rJzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UTkl6yI5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44651485e88si74928271cf.331.2024.07.01.04.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 04:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UTkl6yI5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOF5v-0004eA-78; Mon, 01 Jul 2024 07:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOF5t-0004dZ-Ns
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 07:21:13 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOF5r-0004iL-Qa
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 07:21:13 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42578fe58a6so11747215e9.3
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2024 04:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719832870; x=1720437670; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HqYKcm1A89FEOMNRUkVlvdrvbaPWNfCd2gw1vOazbek=;
 b=UTkl6yI539ktzxHKza4YuZLfGfJ9hJx6dWoGYWjl7sePwnqxcGC/Xmmx9m6WVzvN4g
 4bzGaCY+6E274qQMn2iux7EC2js4Mzz1pfcerPqQ2z4tvNSfT+dJyri10F9TVAY37fl5
 LSV32wxOdR2xHOIwCcglXD5yPpXns99kbQdGgCIeqBRIJVvljVMDIWX8s0h0N9MEQb+h
 g6BIO2avCAwhmcshVU2x8dqteyLASuV6Uoabaydy0SARR4Mst1nK7uYeNjF0GZHXUnR6
 FG2nen0qTmY1Osd/nRHEYVuz9v1fuuuy0sY+wXDkDTyJO8AA5rnsjzvMCaDs0PCIp1Mu
 H6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719832870; x=1720437670;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HqYKcm1A89FEOMNRUkVlvdrvbaPWNfCd2gw1vOazbek=;
 b=e3xiGnrkRmkw+OCjqztIcbx0c3moXQMaedJHC8W6Zi9nt+GjWUJwp/Dg89FwStf0zf
 XyJwjBOavS3xmuF48MKz6Mbd5WBw9VWnvljU04qsULgbkKew50SWkWVIuz4z/QJqlvBl
 kyS1EmQvoBeIAibMHclmdZT9w9Pij80tEhm9VLWuVwPYyLsMGr+u0lDKCAdCR2zJBBkh
 0LGReUh7OadBALOGltEUvbDctnNgBBS0sAI9kopTvWVG8JKHfHw9a98eJt5+hq0Ev/L8
 YBh6WKTz+6aB3t1eGEf0wjGDBRVfC/tIT16ZfcOgBjb+rI3bkXKOp0EIibOeClj+GXAf
 gDKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS8uTfkYOxteZiVYlI+FYboI0QEDOeNHRYhq1Wa+iWEdEPGJ/zcoUIHXFA4GuTPSODLasF29a5Q6jICSbOsKErmEYQ
X-Gm-Message-State: AOJu0YwTgJrcLaB2DdTDWcJXL8YsbaYasieg7GqzZXQXipc0mHj4hj/N
 ZoZzDx8n3a9YGgvbiQ+cJ52OKLScqufH9b6plv32P9qnBgG0lnfKEm2yNze5ts0=
X-Received: by 2002:a05:600c:331e:b0:425:65be:3477 with SMTP id
 5b1f17b1804b1-4257a03c3b6mr39176545e9.18.1719832870480; 
 Mon, 01 Jul 2024 04:21:10 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.177.159])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4258014f8b7sm53525045e9.41.2024.07.01.04.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 04:21:10 -0700 (PDT)
Message-ID: <d2fa5c04-7e55-4051-a587-055c19cebfd6@linaro.org>
Date: Mon, 1 Jul 2024 13:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/14] hw/i386: remove obsolete manual deprecation
 reason string of i440fx machines
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, devel@lists.libvirt.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clegoate@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org
References: <20240620165742.1711389-1-berrange@redhat.com>
 <20240620165742.1711389-14-berrange@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240620165742.1711389-14-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: zjKXPI2vQ97v

On 20/6/24 18:57, Daniel P. Berrangé wrote:
> The automatic deprecation mechanism introduced in the preceeding patches
> will mark every i440fx machine upto and including 2.12 as deprecated. As
> such we can revert the manually added deprecation introduced in:
> 
>    commit 792b4fdd4eb8197bd6eb9e80a1dfaf0cb3b54aeb
>    Author: Philippe Mathieu-Daudé <philmd@linaro.org>
>    Date:   Wed Feb 28 10:34:35 2024 +0100
> 
>      hw/i386/pc: Deprecate 2.4 to 2.12 pc-i440fx machines
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/i386/pc_piix.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

