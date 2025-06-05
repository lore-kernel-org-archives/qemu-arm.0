Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp524427njc;
        Thu, 5 Jun 2025 13:53:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUrLqZHKOScwxwh86MGZUwBqSTjGje5KzO2sO1uB2afWWYfvuahDofvlAqtxf0bfWucuPS4jzVfAEswg==@linaro.org
X-Google-Smtp-Source: AGHT+IEISS1B/R9Be/H/Be7jx+5nSJN9BocIJ/DYvAioJ127KN0YG1t7I3XrfKQMSWkgsVPnqI76
X-Received: by 2002:a05:620a:192a:b0:7d2:27ca:3b1 with SMTP id af79cd13be357-7d2298ec101mr184425185a.54.1749156812133;
        Thu, 05 Jun 2025 13:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749156812; cv=none;
        d=google.com; s=arc-20240605;
        b=eEZ5dE9lkzb4MtrmlcOUKhX31HQEgFIZsCD//fQKBuV087NsTKIykSgk1dDSOlRn1i
         LHN0fx4Q1AzOhRJCYuwrSuY2ixvbH94W3kyqh6fUx17Ma/dQLzZ4z+dQ+65+cEngDRdS
         NqtFCDN251ZHWv2K5AxWm9Zu4AyEmK4VVVarFDbEcdVoF0ziT5h9c7sJhUunCocorwra
         JmScJPO+Jhlx/vb1208xQuv1BBYUxXHV5Xr1nRKWsD6rR7ku3DKwMaAd3Ody5r9iqRlY
         YI9cH5srP5kR8qbqHDwAFrA5Ubp6rfCl1VTWZcOTNmCYDHOF21CZvzwXuQhOgF12Uo8i
         1lkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bCiC08QgAOdvHZ+FpduSbEpvSp/FB4ZBP3zDc4S0xWk=;
        fh=oF9S/dkq3cnkh1oYVj7lI3yw0Jhas8T4NuHYEZZFXlc=;
        b=ayG43/0pSyadpQbeTyKdypooMqdteWRSorJB+DuBGb5n4uz7LVBe0BqL+XcTQKa4DA
         KqgkPSRy5bdmF5zShY/BinTUx/ALnbA4AbA4tBp1QFR65eAY3HMtMIkcOevzMc2Zb+6+
         YC7PTyXHESpeP9F9binu9mDqyoTFGYLpjLAAF9gDqhmc9YT/ksDkgEqEAdKvjEr1/Oem
         VzbUTMUdPNyZR509kT9roGG4ra272Ooffo26ogNYz1T/Ew5Z5xB05hv8G+cOfSqaw02p
         5GOGGadIukBei0xx0+lG6yMh+BBo3weV2HCZmiP4iBjieFEd/LpDDgMf1vNJFPGF6nqa
         EpaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JIKU3KmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d2669c2eabsi26632485a.598.2025.06.05.13.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 13:53:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JIKU3KmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNHaO-0006Ut-HR; Thu, 05 Jun 2025 16:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uNHaL-0006QK-Rf
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 16:53:14 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uNHaJ-0000lt-28
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 16:53:13 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-7fd35b301bdso1325212a12.2
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 13:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749156788; x=1749761588; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bCiC08QgAOdvHZ+FpduSbEpvSp/FB4ZBP3zDc4S0xWk=;
 b=JIKU3KmXx0d/6UNWuMDAlInv0yguIBTDL+6DOCET0dVDebl7F6emw2xrLJnx2S4pGy
 p4CJ84xqme7v2FBsiwtYMZhzUsAx4LsIOGxAG6YA2JnPWnvkyw2qCM0cDmGIRqbQwJuu
 caNstIntz3fBSIdpSqE3r0CEJvdI1AD5JLU+qzctwKeSpH0d6ZJ/E/EyzZVfQbb/C88h
 a6arebFf+u3xwmYHeVBHYREJdrpjx2A1N9A2mivBTKX0u+AhGqoZxw7JLBpoAZZhFLYU
 ukLQsoL7SKfIgWKM9V3lIwHNvG2MD72yFDBSwaso8xShtQyssC43dMfHexUgfZbjiGjU
 j1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749156788; x=1749761588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bCiC08QgAOdvHZ+FpduSbEpvSp/FB4ZBP3zDc4S0xWk=;
 b=ZPRrK6236r+6JbxmfdB4GwVLNPg48Wde7VN4QsgqenefAGZrQ0P/3K1joE3JIM1Mr1
 rZJR9RdsGigmTnF27XhwwNdihSFi7WcwY3fkvxHUrLVRAW1EmuNiLj0r5rFkfZ9zowpn
 ULNMDe4CvMcuiwR9xHRAKPGf3daZru4unXj3nZ7XDXmDS8KOn57LiYHmAWSANKl/r1zb
 Irnt1SiIMTKq4W7lM7T5E0axujwIIZvqe6B+s2S4i4VvHZjAmUsOUi13knyrcHORUPcR
 NxXWEv4CpJczu/wL6/VSjKl6GSMrKhNyA1cizzFWQ0QjIOogtt0gr7V5Y+eKjbpRgADe
 oQUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHPyDLd/e03S/9/C8LOXw7iaxceLMgjn4n3krv/+rYPEvakSyHiFv0rmYjLFUKl041yCN5RSKRlQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw5Z647OmdTxYMaErYe1v05oT1mIy+UUIguqVtcJ4r+YR2jh9Wf
 xXy1cIXzhqMnDdtri0+lKa9VNAcFw6kt+wpH7xHxCmSrn7pT70rpWMt3oaJX9FcHR0M=
X-Gm-Gg: ASbGncvPSCA+WJIQsEQlvNJ1BKqSsrzxlf4sXedW1kR7Z8k+kynw516mB7gZESZeMGo
 yJDASobrfyc5orsmJJFAL4MT+bQTnfNFthBXg4TAyZuWKDqwK8ZKVAd1Cvfzs7wNZBFIRfozFbK
 HcqeIvFY6QIXeKs1od1YLs4XdotMkA1DYo597rWbOX11sX9wvmxWo5g3MdXnGVihwyKNi2n8zO+
 2evvRBqU3CFoGMEYjCxVa60IohLHKDq/pWUAX8s508TLUTx1I9TuKm4NfaciMQNRQ3d/Ovm9Uo4
 f0APdPNzoLxlyOB+87GETZl+4k3RNYC1/LD6eb8mi0UXrFcmix20CYAm9od9GVkheO91qNaz9Wm
 sunrVUp30aA==
X-Received: by 2002:a05:6a20:ac43:b0:21c:fbf0:21bb with SMTP id
 adf61e73a8af0-21ee68cbf59mr895784637.24.1749156788241; 
 Thu, 05 Jun 2025 13:53:08 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5f892f57sm107720a12.66.2025.06.05.13.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 13:53:07 -0700 (PDT)
Message-ID: <7832d31a-2707-4cc4-9838-f2ea4b6b2cea@linaro.org>
Date: Thu, 5 Jun 2025 13:53:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tests/unit/test-char: Avoid using g_alloca()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250605193540.59874-1-philmd@linaro.org>
 <20250605193540.59874-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250605193540.59874-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52d.google.com
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
X-TUID: RX+svCo6e6f0

On 6/5/25 12:35 PM, Philippe Mathieu-Daudé wrote:
> Do not use g_alloca(), simply allocate the CharBackend
> structure on the stack.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/unit/test-char.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c
> index 60a843b79d9..f30a39f61ff 100644
> --- a/tests/unit/test-char.c
> +++ b/tests/unit/test-char.c
> @@ -993,7 +993,7 @@ static void char_udp_test_internal(Chardev *reuse_chr, int sock)
>       struct sockaddr_in other;
>       SocketIdleData d = { 0, };
>       Chardev *chr;
> -    CharBackend *be;
> +    CharBackend stack_be, *be = &stack_be;
>       socklen_t alen = sizeof(other);
>       int ret;
>       char buf[10];
> @@ -1009,7 +1009,6 @@ static void char_udp_test_internal(Chardev *reuse_chr, int sock)
>           chr = qemu_chr_new("client", tmp, NULL);
>           g_assert_nonnull(chr);
>   
> -        be = g_alloca(sizeof(CharBackend));
>           qemu_chr_fe_init(be, chr, &error_abort);
>       }
>   

Would that be more simple to declare the variable, and use &be in the 
function code?
