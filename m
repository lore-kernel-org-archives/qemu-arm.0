Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2516586njb;
        Mon, 9 Dec 2024 03:59:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCWLyjLG84ytsPbMZ9HI80+z9rpm17UB5fag1eagGSTq30fVKe3g4SXDV7GQCHgyqKhIHY4a2KYIaL1w==@linaro.org
X-Google-Smtp-Source: AGHT+IF+6yjvwRsY77Ggz16Hvh/lI/QUGVBmrXiXYWqWH0i4Fh8Lw8UQPuTVMqXfxJ8MwW4K1XSI
X-Received: by 2002:a05:620a:2443:b0:7b6:d0be:ca21 with SMTP id af79cd13be357-7b6d0becb6bmr805000085a.33.1733745593510;
        Mon, 09 Dec 2024 03:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733745593; cv=none;
        d=google.com; s=arc-20240605;
        b=A2/hAXRSfVIpdGd58yoFa8zkZn+j9hEE640Dq/L+rBU6VdJOKsdiDujKluU+dVMWE7
         OIRT/ludAm4VUQcoQBgmiHgWAPXa7D1WtYdWZF7r2SQo9mDVDQ4SKKsW3AtJO21A8Qyi
         XvygcOr9lua8GIPGH52tBWuXZGm5JiJ/6lk5jtBCdXuWoqEgHDDPM6Tq0O+oBRIiReNz
         MD+4G0cJa0JkTGRT+gv4cORRU7n8mdC5rIskFuXu9YUjpZuACmwFBZM/SilC+LAYtNWF
         tx+wOPTQ4ELvMiwk7qY5LZP2zHANpu1vbb5UFSagVHB8CGZ/eGd/o4I7PCozRr8NKbO2
         4fhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=4vojw8frOjl9kNfFVzXH0Y0rZmY0Gljxd0QJGKiqQAY=;
        fh=kOLBEd+P3piIGbSFKtFr1njuJFTlSIYHam060KEFu6g=;
        b=CXGlWeMKdHQc3ImQa7x3Zf4vQe5wVTEGHKxTF1xpcvG42/Cbggmw5OxS2cuao0z02m
         DbmOzC5T7WWwWKmf/rF3LooWkhAEPk3A1Zag3mYGIbisA7wNjujpdPIpZq/joIQeJnps
         6kpFocuBQoexu7xcb4qnEJXR+Srjjdo0WE8eeQDl1rjnjeWmefzN8NqiuQ0pgubZPclz
         FYHVk6Bx+ZtPJ5aIeg4BrjDGPXqRPFuVuOvUYYSoj+ZnJ1+SVaPUveX3de52N6K7Bqvi
         qNF12eNMJERRvqsT51dBXVlYckQgXt/nmfgH/3Xif6/M8pBhB+OwWz5KgXhudlsUbd5F
         R1dg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JU+ljYdx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5aa0302si1120091285a.384.2024.12.09.03.59.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 03:59:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JU+ljYdx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKcQN-0003Ly-6h; Mon, 09 Dec 2024 06:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tKcQL-0003Lm-Rq
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 06:59:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tKcQK-0001HE-4w
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 06:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733745574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4vojw8frOjl9kNfFVzXH0Y0rZmY0Gljxd0QJGKiqQAY=;
 b=JU+ljYdxweXWonAoAOufbSnfX0oQ72fP0/TtqkWPqTX9CPhWf+3q1fYsIBLGDfHyuINYAR
 29SVq6MMow4iagfRpbYMmiYazKYiXej8HY1XM085aF60GCv2tfchCbyekWUa3Vdv8AXXYy
 989aU22rhEuG6vFre4xPjOvh4mDk6Y0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-CDI7TJTSPfKDSA4xLwA2dw-1; Mon, 09 Dec 2024 06:59:33 -0500
X-MC-Unique: CDI7TJTSPfKDSA4xLwA2dw-1
X-Mimecast-MFC-AGG-ID: CDI7TJTSPfKDSA4xLwA2dw
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-434f5573794so6217295e9.0
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2024 03:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733745572; x=1734350372;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4vojw8frOjl9kNfFVzXH0Y0rZmY0Gljxd0QJGKiqQAY=;
 b=Iw2l0BAHfHN9Fgh/nvZwZoX/5uUM5Q4dgfCrj+3B1kC/3j+SBsVLu8zpsUP1VMyIsc
 9kZMMhWKCy1pC6ZEwhGo3D3esZYfI5nkAYZ5+ZbQz57Vd4LvIGuMun+vHF8Jp2NsO3Kb
 ROnze+yP3sNjAiSl/YYP+gNrftLsDB8ms9XDxstPLlp8uv0dzUEnn8EbsBmIaQupYrxA
 7v00UhcFFRnogJ0/kEDIy2OuskM+WhCUK9uWGW9TiS74Lqyu/7GH1OVWNJ/PGuOS4YAY
 cY3BMLh2shohxbC51PXtGbK6lHgICMx+xfde98W/ih1F6BtpP1+h75thpyfJpSdOS7Lc
 SatA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIv0fFGifuFmtEEKp+aeGjzX6g8sfTgh61nJXSfWcr21Pp5wtMpMLNc0TrD5K99Zww3qIYi4p4Ow==@nongnu.org
X-Gm-Message-State: AOJu0YyeUcZs6/mE+6mxqZfmmmcKP7PZ4N7hQDTqY1fdWRai5e2jqI84
 0VgDBUvMa7KslxOoxUed7HA1MLdHVdBFAKZVTvo2flleu0tVBBjdwOLct7ez4oAxDM6W53qoIlH
 NfYn1ECSMuRUOziDN0NOCqP/zOohO6eBRsEX/nVAi5owiKParaQ==
X-Gm-Gg: ASbGnct+G8mWYTwDBckB6k0pIBUx/qOPWQKLBarJFcUTdi8Amll4lGxL6/VLQ7nmNLH
 /zGfpOvaVg1o39qzcy8OrtcmcUFfHlTkxhuZ4wWbwDhOB+skXeSqvAzGXV0XV9ffiBBn+Qs/dXK
 aLlsw8QTXMsBXHn4td9p3TQR5AL6Tgvbzjg9Oxrkd5BTSC8JbnP81RY+OWqtygVS0d34xpYZe2b
 m8/PFo9s3jiVlKE4wjMmTtmj3hSuXFcWhaRWzEIX7h7NXpfvfSqRvYX/eLu+O49iSberUj4134W
 Y8E=
X-Received: by 2002:a05:600c:4f0d:b0:434:f03c:7843 with SMTP id
 5b1f17b1804b1-434fff55ccbmr1416015e9.19.1733745572316; 
 Mon, 09 Dec 2024 03:59:32 -0800 (PST)
X-Received: by 2002:a05:600c:4f0d:b0:434:f03c:7843 with SMTP id
 5b1f17b1804b1-434fff55ccbmr1415825e9.19.1733745571997; 
 Mon, 09 Dec 2024 03:59:31 -0800 (PST)
Received: from [192.168.0.6] (ip-109-42-49-52.web.vodafone.de. [109.42.49.52])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d43809fdsm101349045e9.1.2024.12.09.03.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 03:59:31 -0800 (PST)
Message-ID: <7c614e7b-900a-4a0d-a727-eba6986f9398@redhat.com>
Date: Mon, 9 Dec 2024 12:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] tests/functional: Introduce a specific test for
 rainier-bmc machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20241206131132.520911-1-clg@redhat.com>
 <20241206131132.520911-7-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241206131132.520911-7-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sYR037TR4Uu9JrKBhNqu8JX3MoMttVOGSNfWAt55oaY_1733745572
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wPY+5opRFJWt

On 06/12/2024 14.11, Cédric Le Goater wrote:
> This simply moves the rainier-bmc test to a new test file. No changes
> in the test. The test_arm_aspeed.py is deleted.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/meson.build                  |  4 ++--
>   ...m_aspeed.py => test_arm_aspeed_rainier.py} | 22 +++++--------------
>   2 files changed, 7 insertions(+), 19 deletions(-)
>   rename tests/functional/{test_arm_aspeed.py => test_arm_aspeed_rainier.py} (71%)
>   mode change 100755 => 100644

Reviewed-by: Thomas Huth <thuth@redhat.com>

