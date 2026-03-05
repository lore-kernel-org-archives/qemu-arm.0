Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A13FF513E1
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:18:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyH1s-0001xK-As; Thu, 05 Mar 2026 17:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyH1e-0001s7-Hf
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:18:36 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyH1c-0003ul-Gj
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:18:33 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so100177585e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772749111; x=1773353911; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wBjm8FaMShg+Lf4yeMTdR2D3dMvooi3WnbAMYx3fv50=;
 b=Zu9QxqWmLschoVyCahSWw93rKWXiq4InvGBG1TrKWJfjGgocC9gCAy+6TY4yXIfJ2B
 8t0hnJCMVhTpKwPFGm5M209YnK5gBkP/rhsUfgNmlcwc4EqcoajfCnnLg2oL2GyU177N
 3ZDVXRBkDlIbufKdcUHQOIqC4xF8YgYWeOZosRTsRzmCjlraWDGOYFzPRD9fHTloRw+J
 c3r7xBSvmErgYoWpoOe8zCA3d790bxOAbG9o/P2CPSKV543hDEKCdrjhHrWQmoHHceO6
 doGTGXFSSebcK5iXfTZDOto3S+WSJhASuGK3GoYKUxRwTwTVwqzCJ65oh5UKGJAgUUCd
 SuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772749111; x=1773353911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wBjm8FaMShg+Lf4yeMTdR2D3dMvooi3WnbAMYx3fv50=;
 b=hymkR2vmOSR7ixocC9WjT2UFRt4Pd4Ex6aZIpPAulQkGUVcsgMTl7AYsjL3+Areo5M
 B+mPWfRFiUC/krDmufqXZVsdoh2wLk9Mr/g6uziUz8tTdPJ4kn7T6888MD9FwVW4om/l
 mbBIB1oUCCaHSpvrlNMBzhBkwOquKLl4DBeRR60QVgdb1SzD2Gr+FBSZ8lseHsN6m823
 OQTQ4C18JOIa41S9DKC6Kc0TCTS3haPfVHj9XBJnLinFv+SwY7JDsIoXopn7KsmL6BWF
 WUEBefCUefNdgYZ0Qa86AdoboYlRhT1DCfrH7SFu84LUzSwekNEcoAQyt136qqX+JD/M
 ayrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb9VSw1JJqKKJm/uxPAKDxnRQFA3PwTz7nmDmMkMIxyNe02B6SHpeyXw569NnKs1Gr/yXaxpH3tg==@nongnu.org
X-Gm-Message-State: AOJu0Yx9k/UkHgG4A+Cn+2tlgAXHPbKuLTy4nHg0AE2mcOFnDLJoYkr0
 eX/h+cCE9w2pwvDxsclWvBnCKiH90+1FfckQNLSiiTqtl/YXlfOa9TVWmrV7Iczk8fw=
X-Gm-Gg: ATEYQzwNAQ8Bx4u90nYAOudqQwzS/xjudHCGjwJ5LfFsfrS38PwOvseHd3YBaMky13a
 RouEQBuiA0CLvQc7OP4PLVXHwNSC+ao/CG7SQzqNK1lw5k2SuihM82iCBZIOGqIXG1VJ/DNZNV/
 tylWbP+eyb7Z6IeKId97Aah7spEjewBtUMELE+PvRJh65qnNh4YI1nGq7kLVHmvm462FYlV9EmY
 bRcMuqCa9+kne7ZzaK6IeIlb9I+6z83st6mTsrrRwxH4tVuvM5E1H8CI0Gq+brNN/jsNIXjArCc
 6sV92xdro0HMnr7hzoLwbo+NRfGCgRANxZdtKEH7JDJv0NbrCIANgIwDvs0kclcjerqxojtn3U7
 Hi9YeBxSsh9Ky0KTWpodehNiN/7TkoWbeKT8LnD8bh+SlLrA0QRM8h/0cvG5Jgw65eAJM52yR+f
 ez0j1MV+Sx8Qp/0wePyN0BcStUluFZWsveQZ8FnnSTFreMcIMYhwEh2VHxtCu8PBKp3w==
X-Received: by 2002:a05:600c:1d26:b0:47d:5e02:14e5 with SMTP id
 5b1f17b1804b1-485198310e2mr133428435e9.5.1772749110637; 
 Thu, 05 Mar 2026 14:18:30 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851faf3938sm67572035e9.13.2026.03.05.14.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 14:18:29 -0800 (PST)
Message-ID: <5713f127-0545-4516-9674-a57878cf2f1f@linaro.org>
Date: Thu, 5 Mar 2026 23:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] hw/char/serial: Reuse fifo8_num_used()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, Troy Lee
 <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org, Helge Deller <deller@gmx.de>
References: <20260305220911.131508-1-shentey@gmail.com>
 <20260305220911.131508-8-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260305220911.131508-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 5/3/26 23:09, Bernhard Beschow wrote:
> Avoids accessing private fields of struct Fifo8. Now, TYPE_SERIAL only
> accesses struct Fifo8 through its methods.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/serial.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

