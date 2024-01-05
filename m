Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp767979ejo;
        Fri, 5 Jan 2024 07:05:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVVBko4ERBXu4aTUMwrwV2LsQV3X+Ln868jkOTmliGPEq77H4KKQUTfRgm1ebyDwK3BQqg
X-Received: by 2002:a1f:e642:0:b0:4b7:31a2:fa90 with SMTP id d63-20020a1fe642000000b004b731a2fa90mr1892740vkh.22.1704467121437;
        Fri, 05 Jan 2024 07:05:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704467121; cv=none;
        d=google.com; s=arc-20160816;
        b=KMMV67pKGLVsErkSyMGC5gI83GhCuVMMuD8wCS6UlQcokQTYlJLtPsDCmEk2lO2lVn
         hvmIyH7w9e2CzXDaT00MzG4r9tBd7Wwe5p9sQyymJDU9GRT5mDhMHb9C+Z+diuaaRRLM
         JsEFUol8L73T4wrUatqfKHw0qdtUuKZm3UTwcmuYKt1zOquYFVm48bwFQXjrduHQOH3W
         viJdD/+UFkIo/k4gJCXD5Zg2RQY3pSBgloFQorxzD93JOblK4+347DRI2dsFB0rd/5/o
         Ki/vkz6Lpm9TZd6yv7AS9j2+Yj5SJb4yzX2oVk2cIAMoPCiiUjmH85WhNxEMpw60pW/F
         lJlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=G+b+UhhWUTTADKOHH3dFD6R5H8/Kn+xlE1Fw01Bx6hI=;
        fh=49AeW+NYNsG3hGxkZQvNw58/XIQ4V8cxM8Np40Mh5h4=;
        b=Tu2QdxfVtj1Ott0kJQ4mVGj02BnnMT27rPytv1hXJ5GiHM4LKrso58jiGpowI1c65K
         v9imUbtNeiEmpeR7wbFDEcl9n0FNA4cn826ioSm7+CTAJZNcJ+9nD+nXVac0QKewo9zW
         fbd9sJ7GtUKSkuCICahgWmOqvgSHtY29JWQCVyO+31S5dgv2lB6yQPN90R1XhrRMZEGT
         H3h3B5Oloc6/EbNckv1DRCebE4ITs0brJIcHXXgy2eN9UN2e8BwFtVP1z8FWYgIgVoHY
         UNQWrT7g/kRnNMM5TC4u84iiCGdZVWKioabQgT093Ob7j6q9Zx4hxWKp6DJDxnXhuHLU
         shLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=opWrk3RH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020a67ce89000000b004670980198asi148513vse.743.2024.01.05.07.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:05:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=opWrk3RH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLll1-0001rM-T7; Fri, 05 Jan 2024 10:05:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLlku-0001qT-4x
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:05:04 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLlkh-0000js-Rv
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:05:03 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e3a67ca9fso3394135e9.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704467088; x=1705071888; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G+b+UhhWUTTADKOHH3dFD6R5H8/Kn+xlE1Fw01Bx6hI=;
 b=opWrk3RH0wKJjf7hH+d8k0vIGi5OWXbJglJUpQIE898DICijgXvu2on/wfwx8IlMms
 BmFLBjvCcrAli5X6T3WidhRbsoBG/gZZXL5p0v6ivfwDmeaPN0DnRkv9gWnfyTB7h5Db
 ohW3OpyEK4gkDPqjyG0X8+Oz2qsB9Vp0X2Q2hlviqAJBcJxLJXVu4bJK4nYgobMePGhK
 rPNEG9zFwr4aHV84IY8Ek2ROHb7q8bsxt++YtdeVagR2jy/ChG5N/rrqWIw/5TkOXmE3
 KYHN0bkW3k7iVzRHa73a3PHR/o11hkL6d9F1ciHz4ZtrQUs7nuliVt1TapYESqr3WTxb
 yWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704467088; x=1705071888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G+b+UhhWUTTADKOHH3dFD6R5H8/Kn+xlE1Fw01Bx6hI=;
 b=qzKGpN5as9/37obvkC5nPR14Pzz23MYAOnB4zjQljY+SfA9Vm+18lhKaMuVoxkNjm3
 pTLfYnmCjcABjg4GjowcIRYWnTM3EfklPNEmFV1xX7qYek+uYrlw7lsyIXeYViX3ZPBl
 mUuYwEN3HZfrmbefwVQvKivHYUsE8YJF+299Bta6M+5TX0eM4yM76fA8Y2bR2/ubzSWF
 a7RFHKy08HA5kkZMKisBf0KTkBCRNe54P/3RQeyORSErcZFIgFkIdHvSiyxoeyVDuloS
 flB1NG2coELmh/JE9mSEd/+BPgHFfvcQRyO5wzoWQKIgk5K76hUqusM5AOMaV/WEp9IG
 GX7g==
X-Gm-Message-State: AOJu0Yz/pf3nMlnxOoGrShn5C+jVmThgXV3jm4PDY1Z8KYo7Q+cRje/8
 gMA7/ZuJD9CSqW6vhEk9T2oNw4B+P6ApHw==
X-Received: by 2002:a7b:cb97:0:b0:40d:8128:bc9e with SMTP id
 m23-20020a7bcb97000000b0040d8128bc9emr1441109wmi.163.1704467088670; 
 Fri, 05 Jan 2024 07:04:48 -0800 (PST)
Received: from [192.168.69.100] (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b0040e3733a32bsm1822953wmb.41.2024.01.05.07.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 07:04:48 -0800 (PST)
Message-ID: <b103923e-1f89-4dc6-8cb3-95f77878bd82@linaro.org>
Date: Fri, 5 Jan 2024 16:04:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 19/25] misc: Simplify qemu_prealloc_mem() calls
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C_=C3=A9_dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-20-philmd@linaro.org> <4ild1.0v3gsvmc0lqe@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <4ild1.0v3gsvmc0lqe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Yqr1Y9kiKMxj

On 22/11/23 08:38, Manos Pitsidianakis wrote:
> On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> 
> wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> 
> Commit message missing but indeed there's not much to say

I amended:

   Since qemu_prealloc_mem() returns whether or not an error
   occured, we don't need to check the @errp pointer. Remove
   local_err uses when we can return directly.

> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Thanks!
