Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BD0D3B7EA
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Dec 2025 07:05:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSrmJ-000462-OG; Tue, 09 Dec 2025 02:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vSrmH-00045e-Oy
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 02:04:53 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vSrmG-0008AP-Ax
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 02:04:53 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so68405055e9.2
 for <qemu-arm@nongnu.org>; Mon, 08 Dec 2025 23:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765263891; x=1765868691; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QGKChLnUunsnUJjT7oMEbVbmOl4mVWwh6ouqgJUqt+8=;
 b=rzpecLT8mJ6gOLW4XlEzXKajINIk4zrq2WDHuTfK1pTJ6h7IfCzyUU3Xz0TqNNEH1a
 JogDfpcuTAbQ9OGkcdKhFgZitl+uQlYzRGfTeNT165WE/XxqGdjETgkCFXuN5Y3rZpOF
 SZ5cTOt1QyYpRQM0ke5j4AzgFRbdYrJzJLhSYXWTD3tbGv8ndjYs8yTCJV7iXswqOS//
 QHHfkgsBhuPTpw4xr1W0A3/c6QwocBh4lFE2pNGZouxnpF+kKfFzfmamIRQNmG2fVbEC
 yaU0I/AzOY3m7T4Mf96Wi408WbuxVv0fg9/vO4BuDnNmM3L69R8uzYMolBLiQNmRvYJZ
 guSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765263891; x=1765868691;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QGKChLnUunsnUJjT7oMEbVbmOl4mVWwh6ouqgJUqt+8=;
 b=IwPUZHwMTW61A0GgJ+RDvFPrcE2+EGENnCK2XDn9RLEBA6UOEi9BxohCoojO9hEgY5
 rqQDbo9E6BvbGYV7123zaUTcO9BJILSb5ORaFSENq5QwR3g9+smcSX+qJVbXJW5qi16A
 G4943aGpi2kMOra54FTSMJLEgqCLBzFAhv+lBjJ+wVrgmaXwcreLssFMEDsedrPq4v4q
 F9kqU9mo5Rf9aOjmHmhHSMn9KGlvJpY7STalz41I+KZ4U14FzVW8V3UXywlWdm68XGti
 WsxGXj/gvjEg75sLp/A6DdCYGUsxslfXWF3Gk9NoUsYh27J14cPMeeFsWCaQ1FSDwdQv
 9wTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg9xmOev3GRcu2uLfWTU0oNq9+PFoG3YlojBUtOu+hJcvsqIAfXv6Jk9bNU2NDZogOLMijVs7q/Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx7C1wxU2vGg5/gtY6Zjk0r20PNBNyEodRxtFkqT/BkCioO7sgn
 6po5haqOLoYRs+jTME8p7jPCgpo5iA2WsuWBCEuGlE2fEmJWbIIuLJDpqNerDk+9JuA=
X-Gm-Gg: ASbGncvRufgLfusM72zSLmAnaHaDutHUCIVbz5rDf8VuJnG6jJhM+LgEEni1g88HEsT
 YAKY3Y0OtvK8Rz7FO80p6nPX31pXWNPXrAaxmdLvOOGvR7hk8l/D3vSa6SMPblbiXWs5wzGECCp
 zF3mSxsuPU3XnFtPBscgGWsqqUMh/If+47Iy6I6e9ex5mrQD0rok/MgA8chWL1xV/y/sPFmWjnt
 daAQE36pUqzbUqCi6hI8Xlf3CFyWXBkD5iT4OtOPEWQfG5nwboY/EbKJba2CgB6jQcCpnfpViPw
 NkwlIGINJDDDkOj/XFu5B4M5YJz6UdGDsWvkYehdp98P5iMLJObIZMMwKHN1gfKmkRMef9RtGva
 aEQqggou9uH8WBxyLazOAQ1K9fX/F1OdweCyj3g9ijj83GUhgmBHJDUUAissdcOxB56POy53qEO
 UfGXvCi3bM8Q5vk5Z+Dv5Evx9ydA1hxhIFLfjNCs1dL1UrMPI9T5uJ/Q==
X-Google-Smtp-Source: AGHT+IE19qbibLv5YO/fGiwGZ6R3+MYj1lRge+Fb/99uW536dItekgFFaENUY8LHdW5PiubKa4NhNA==
X-Received: by 2002:a05:600c:3105:b0:477:8985:4036 with SMTP id
 5b1f17b1804b1-47939df14ddmr87694335e9.1.1765263890616; 
 Mon, 08 Dec 2025 23:04:50 -0800 (PST)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7d6eb296sm23193285e9.1.2025.12.08.23.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 23:04:50 -0800 (PST)
Message-ID: <c77de6e3-51f9-44f3-a4e7-776c2b9ab63b@linaro.org>
Date: Tue, 9 Dec 2025 08:04:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/arm: ensure PSCI register updates are flushed
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-devel@nongnu.org, Mads Ynddal <mads@ynddal.dk>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>
References: <20251205151115.2035930-1-alex.bennee@linaro.org>
 <20251205151115.2035930-3-alex.bennee@linaro.org>
 <ff000682-b14d-4152-88b3-cb2761b60bc1@linux.dev>
 <87zf7shped.fsf@draig.linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87zf7shped.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/12/25 18:08, Alex Bennée wrote:

> --8<---------------cut here---------------start------------->8---
> target/arm: make HV_EXIT_REASON_CANCELED leave main loop
> 
> Without this we can spin tightly in the main HVF dispatch loop and
> never release the lock long enough.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> 
> 1 file changed, 1 insertion(+)
>  target/arm/hvf/hvf.c | 1 +
> 
> modified    target/arm/hvf/hvf.c
> @@ -2020,6 +2020,7 @@ static int hvf_handle_vmexit(CPUState *cpu, hv_vcpu_exit_t *exit)
>           break;
>       case HV_EXIT_REASON_CANCELED:
>           /* we got kicked, no exit to process */
> +        ret = -1;
>           break;
>       default:
>           g_assert_not_reached();
> --8<---------------cut here---------------end--------------->8---


