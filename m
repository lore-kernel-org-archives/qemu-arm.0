Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp1586387njb;
        Thu, 9 Jan 2025 06:54:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWgU4xItCteD5fQhqEVOjz1IkiMo+QmKgvfYr25MvvWzh0TPHhT8i4p2uWnQUNCMY5+xQfF4UitO7mOeg==@linaro.org
X-Google-Smtp-Source: AGHT+IEYBuvsu44WlsQUbAMSo69beqYdWpAyDtcyRJ59QY7OPF4njkDaw7HoVWAU+msEK4RZlFFi
X-Received: by 2002:a05:6122:2a50:b0:51b:10a0:331c with SMTP id 71dfb90a1353d-51c6c3a149cmr5910014e0c.5.1736434440950;
        Thu, 09 Jan 2025 06:54:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736434440; cv=none;
        d=google.com; s=arc-20240605;
        b=RHMb/AQeHYCTSuNmgQNTY4IoRS3hHe1NcG8e642I0VKUGIvMqziaCNQpVhn73iMCJj
         5TaaEM+0xJ7axJ+EZ4lToEGYWaoQk8k16PDfazQcbyScllSzq3dkKV3R55XmWSNfqTZW
         7FT20z+sHAarnXO7k1be1XLdVJtl4mlELh1cPQyycZYw2493JyBzT4q13CYgmkv9SE96
         U9nsUQzouXO6HlK5L93h0PQsg5pkOqhnfZGUVHv/kjPl/zXUcFBygqdlJhBEIQ+et32c
         CiDMfLCKjwsfN/Ebu3mRhssElWADfyyy04HzFTLWLJU+bSYxGoN29bkH0iwnvjB6HXpn
         ebzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=inJzFej73TPHFT71Py5dLswF5pzHTQpW3Y3CRSOF++g=;
        fh=t5Qy4ORhrefvPat6x+Tnj+FfxdT9+EVSKSV801qsFHo=;
        b=Bwnb4rE2S0/9z+ddkrCc9KcGbTjjwqoSmWs6AVbbZrUieZUH0vfV6Xve1Dw40ScZSF
         P9PtFAF/dfegCzSAZf080rZQMdx925EF2gu0fiIwKxECjIJMApb7KyD34RCsf++w6/1O
         7KxQo5GOe6XXIoHw4XcpIkXf1zOMo2yUS0vSStDaXspXmZ7nroVC63kAat5+R/B06yiZ
         kavjZeIspwPfQlA1J3omGc7WDDyNtV4iPJTqr1+BNt21FYqAVyIfFFlQPO3cknYDov1v
         Wz+Gt4kzDTA1SeFHr8FP0LsyhfNaEsTabBuz+vtypv/d/fBg7aERPbyWIbpR/FCLYWm3
         +4/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M7T+4WBl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51c7fedb977si481740e0c.246.2025.01.09.06.54.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2025 06:54:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M7T+4WBl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVtuv-00075D-Lo; Thu, 09 Jan 2025 09:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVtur-0006xC-GX
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 09:53:45 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVtup-0000X3-U8
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 09:53:45 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so736599f8f.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jan 2025 06:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736434422; x=1737039222; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=inJzFej73TPHFT71Py5dLswF5pzHTQpW3Y3CRSOF++g=;
 b=M7T+4WBlLxqA800PphvgR/+BYQ/ldnG9ri/V7GRT8PYlycVMS4On9x9UWirM5jNbcV
 usvrzOkXwMojsw5on90nNhVhgN7znp25Ujna9snXa5FVJ1hYv3inQX1c2Fc3CZ17L1I2
 85eO2TUqa9ZqAVtOhp+Pc9S3+nY0umIbTxjKPbDKQN7j+JcBZIi6ik9N+MOG71qCFzjI
 5fvNvNMqrgWwiQ3n0tYtSQd5nV6DxyfYIUcZArSQG1RpKLEiQjqgQiD6HTGTEWt7Rmjg
 ttErnDX3jE3DD18O7w7r6o/fVm9h2yYCcQ6Zl71Nkw2as3+7SLBGsSCwOYslnttR41JT
 hgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736434422; x=1737039222;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=inJzFej73TPHFT71Py5dLswF5pzHTQpW3Y3CRSOF++g=;
 b=DJXNU/h4412mEa1wI4LsBjeeJVDvY+KvtTNQnkBGmuvhNBA7LVCATZJoBpGzlOc058
 SXHSInYlsD0lB+4lz2VVvYTj02FX89BifAfWzDzVQD6N6COqVBynOYqP2sgyKu0iVmWq
 21sPgzlbQDDeEbv1KtPnnvOSrdVYk/k15jkM1TbilCN4cR35jJWt04Qfw9i6Mv0BZhV0
 VxMdXlSWi4MK/N9/0ETTE1Y5+sL93qpYHPJpNr3e2EuZqjZ15xluqjd/Cl57+c9XybOd
 fUd0R48hCAQ6VyfHPvtEWtsxSaVzU4jkoSfZaHuEJo3+DeD8zVrOUv0yNGpUQbh8frw0
 SUzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+Zwz+3DvkvcOdsAfsdCdcSe8Hv8SS09bAqUQV62bE7WV5RW1hPYT/vMjwNg/jbXaSwiVQdArwew==@nongnu.org
X-Gm-Message-State: AOJu0YwaMy8NsMcUwFmu4ymxy67KHLt7G8q+HMUNxrUGyt5RS5Rl9Wy6
 ZM/crGkCJbq/70EM4Gk8xJsrNroENz7dlVJQwzh5+r2vV9g6BC5yADDimeFAC/I=
X-Gm-Gg: ASbGnctnFiBwb90cpI8kdrrnTIG0h3BL5IM3DTa97MBWz/Ahi0DBBwbjMoFhXxyNQ6G
 v7V5DDZ4E3m1C6rSoVAuE7sfarTHRxamVXiJ+IQQZENIckKBTnxkqJozVBBf58ORj5VdPlfsNuk
 OBIRufRBbbHlQOnZtF5wPDEKcjXMem2uuJoxmy2gCc34w+7qs3DRcZ+p7aGn/1/038e4dRlfgvD
 9NjEyOZPpLY5mVtttqd4m7+C6cj8KMJw/wRYYGto7vy8nURp5hK+SFOCpLcGwFkf9r5tNz4Mf4o
 reYKnQ+s0oMP4OFoVIQOLJezUtw=
X-Received: by 2002:a5d:59ab:0:b0:386:37f5:99f6 with SMTP id
 ffacd0b85a97d-38a8733bf6dmr6692948f8f.53.1736434421831; 
 Thu, 09 Jan 2025 06:53:41 -0800 (PST)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e383df8sm2070161f8f.38.2025.01.09.06.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 06:53:41 -0800 (PST)
Message-ID: <c60aba0d-1813-4809-8b97-95178a599506@linaro.org>
Date: Thu, 9 Jan 2025 15:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] MAINTAINERS: remove myself from sbsa-ref
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org
References: <20241218123055.11220-1-marcin.juszkiewicz@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241218123055.11220-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 3MoTxae0szw1

On 18/12/24 13:30, Marcin Juszkiewicz wrote:
> I am ending my time with Linaro and do not have plans to continue
> working on SBSA Reference Platform anymore.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)

Patch queued, thanks.
