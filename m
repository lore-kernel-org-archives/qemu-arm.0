Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F4CD74969
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Dec 2025 09:00:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWWLr-0002TR-D3; Fri, 19 Dec 2025 04:00:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWWLh-0002Sm-AR
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 04:00:33 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWWLf-0000IW-PT
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 04:00:33 -0500
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso13406455e9.3
 for <qemu-arm@nongnu.org>; Fri, 19 Dec 2025 01:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766134830; x=1766739630; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iw8PYEkc2WSyzh1Yluz9dfu9Sd9QbaIlPFYP+JPcuCk=;
 b=ArvHUJmY8g5Qod2e3NTSxxn3tpnB3eKqqEB0AAkOf1SVvIK/icSHwVYeKvPJiuxVyr
 A3LJfEjQU1Ex9wd3YGaSJJtrc5NDS+q4n1PV//j/UdIiwreIhGn47i3E/mva9Zzo6trd
 7Mg7xENHKfqN2jmcYLadq4DezyvYjB8rj7ivdv78dcaOUGDZ1108dch2apLjlS0C4sja
 zsUr/DsvCN+Wb88bdD3PvjxzLwdWoi3G1JhsPFoy8FQdXKlZQlxOdvA538KdwXelxbI0
 HpcSEW2cJMQdC7VqsJpHBOoX4OUmqqhFnAZHcjyxoCTsQF0nl8sPu6sSKMjFKE2tyI6G
 q9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766134830; x=1766739630;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iw8PYEkc2WSyzh1Yluz9dfu9Sd9QbaIlPFYP+JPcuCk=;
 b=Z7G2ymtY+WtqwBkEdnPZuHH4MEpYGvEl7o6xhG9e79Sfnu71BzsAgpiInjgi2GpZR0
 WXr3voCMqshLnbIdwcRk4R1VvmJk37KzGFGQMD97L4VX7eYNSSL+AdDcNtxyQRsIRJiI
 9hRCT+cx4Hq0XRTZ4b5C3i7OmzKSQ24obIWkodNiJnFWpzgtZ8MpuGwtHzxQv2HNY2fH
 b67jPrXUdndF9ApkjWKnevzSxBy2G4dMozxIo9dobZZgX/aa/FD/5/+QxMciLpJojTn6
 nVEfJpwmeba5u6bJHHgzTBZJu7DUIsbH8Nr7C8a4ex+CHDErEPSEWayxIS+lWfQgJvJl
 VAXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYDoVtVi+6rOOeSRqqs+t7ludNZr14xx0a9wI4l3ajkN8Hc6HkMR/JFZ2CWYH6JsvoQ3o88fdHDg==@nongnu.org
X-Gm-Message-State: AOJu0YziOYMD2qZ41HoUa/wnF9LADeRC7WX3uvxCr4V3rJks+KOfzrLM
 A6hErKuHf3bUShVMWOCG1hjKWicJVDZ00wvmGqgIGYuqrJ4FbU5Opj9Govj/vcFcqew=
X-Gm-Gg: AY/fxX73sVrLUps0UCEA3lMYSafeTQ1O8I3dF5/Uw7Vd4dGBxuCY7iQr6fBXG+Tqyel
 xqjYG0rU+wQky44BLYxgTgCQDi4rsbRh4YcCt7sUlphMShej+CC9lvh+uIX1JNQC0/qtcbsz2Ww
 L5vmOo/E2/1VZm82KyBez2VN5P6vPftZS0eoIEYKTm3vdxcEpoCrq3WSHIrtSZFbWALo2z2nOli
 zwkbruzMdfpZBTXAI+ojmQCFH916UCJXGtOurl34LpTxqMf/bzC+bUgOSX2JPv4GMfpW75Ry5sR
 Zdi6Hpbs+3gCBwinYkIgbM0mqQTldAFNRdDwy1qMFHbo+LmzU4sjaiKTlw7VzTEX1+JGFPYn/q3
 8JaM4YdgCYtxLjyxSFkHEDNgkoGIodEwaUdio0kWI7jNLWxPAYf8HgEwKLuhhmxUc125g+VoyEt
 SDRNugegWiDFY97odHl+swUCT7IsEkedwBjCaGnI1jfil/XR8UWt0frQ==
X-Google-Smtp-Source: AGHT+IFRVSgdezUCKQozNx3Hfty7cZX9Jwxzz0Gqp3IwTeqDfNg+128s+G0UbRMVnTB5XARfeQXLiQ==
X-Received: by 2002:a05:600c:1d1d:b0:477:9c73:267f with SMTP id
 5b1f17b1804b1-47d195aa4bfmr20399925e9.33.1766134829266; 
 Fri, 19 Dec 2025 01:00:29 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3acdb87sm30562125e9.16.2025.12.19.01.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 01:00:28 -0800 (PST)
Message-ID: <19c5ae56-35ba-42fe-a330-fec28aad6999@linaro.org>
Date: Fri, 19 Dec 2025 10:00:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Machine max78000fthr not compiled in?
To: Markus Armbruster <armbru@redhat.com>,
 Jackson Donaldson <jackson88044@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <875xa27ss1.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <875xa27ss1.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x341.google.com
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

On 19/12/25 09:57, Markus Armbruster wrote:
> docs/system/arm/max78000.rst advises to use
> 
>    $ qemu-system-arm -machine max78000fthr -kernel max78000.bin -device loader,file=max78000.bin,addr=0x10000000
> 
> My locally built qemu-system-arm rejects this with
> 
>      qemu-system-arm: unsupported machine type: "max78000fthr"
>      Use -machine help to list supported machines
> 
> What's going wrong here?

See the fix:

https://lore.kernel.org/qemu-devel/20251218214306.63667-1-philmd@linaro.org/

