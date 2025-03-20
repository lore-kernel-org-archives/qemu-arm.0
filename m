Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp965992njc;
        Thu, 20 Mar 2025 07:04:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgRSBF1EZqBCmqMrcnsWwjhLYccI8qORRDuF+ZCdQlLGEOyfTHmZF8Js3JoTMq9PDum24bMhOfO+I3Xg==@linaro.org
X-Google-Smtp-Source: AGHT+IGRCmZPhKIlzwT6LFe0u0LYQdMzY2MkAO7Jyym6+RKikPz8DTXmaQNjYHHEQEzNbRf0DmdW
X-Received: by 2002:a2e:8653:0:b0:30b:9af5:9549 with SMTP id 38308e7fff4ca-30d7271374emr12993971fa.2.1742479443474;
        Thu, 20 Mar 2025 07:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742479443; cv=none;
        d=google.com; s=arc-20240605;
        b=KxD6K5eSYTm9NNf4DeHo5+LPrLtncPeyR3s3XY8cEtzQCmzrUqS95aIZ3c8MQLKpHz
         hvL/ks2Qs0vcVJLFm+fXxPQ/4YFiMARRa9/qcxXctNwGf+auWpRSx6cfIHCevGWnqBFR
         IgaEDbr5tzAVny7T+ma/2KWk9+syqwKwz0m9HHO0tx455TEJvsWF9ecXWsv7AXuD9Oaw
         5wBdCeJdUxYVYqXfYCYYZqax3cXLfc2uoF/Ay5NqlNxUHI17Gf4+hvAI5CxlH6daSY9L
         Knux6hOWe+hbUqz8lTHruLjGdoIvqLUCon3g0I4WsvptrjEqjLsjQ+5pmtGIP04dln7K
         H8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DWgshA8OTIIdBLqESPNQi1EevqOIJBOXPNBXtKqlBfQ=;
        fh=RNvZl0S28oBYS4dDoETKyv0n2uwZLBZ/kVeBppR5sjI=;
        b=Ge3vFLMdQOPU1P+onKT6oomgkxcihwQi2fH3zlHyc1pssEalnUQlKA60GYYac7VJNV
         TK3DOBfwq4LJa+xC+7LaGTpiziBbf59DNNMkybE9bBsliKtkM2Nz4nGtATm/iCnsv7Ek
         KSlQMobvCSkc2COfo/itJQH1Ge0jm9xOHtLhJdDRyLmJIdWl1CMCy51arByQTSXVO4Kb
         rODxCm/jbpQquBSlsJSk2P6BTeV1xBMuabP5m7s7uYeTnMilIrdBCU8LET5L0GYdfeS4
         /NTnxkCh6RuArYULHQsP3oPqVYGXeNl3NnuDrfxlORYVnC26LEZo1abyH0tI2kaA/Ltj
         ToCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eHx0ARgK;
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 38308e7fff4ca-30c3f0bf78fsi114274681fa.73.2025.03.20.07.04.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 07:04:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eHx0ARgK;
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1tvGUj-0005DD-U9; Thu, 20 Mar 2025 10:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tvGUf-00055i-9E
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 10:03:35 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tvGUY-0001Fd-Ot
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 10:03:32 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so12054195e9.0
 for <qemu-rust@nongnu.org>; Thu, 20 Mar 2025 07:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742479403; x=1743084203; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DWgshA8OTIIdBLqESPNQi1EevqOIJBOXPNBXtKqlBfQ=;
 b=eHx0ARgK4v4zJ2Z+3OZD7x+0TzlMi1BEuJqS4286LliQ1khzDeDNjVRhHPSfAvxaHT
 8KNG9pzriixovVL4IbM2IeeHCNG4/Tap5k/d0vtxXRJFdr8aNEyRKQESJYkTlWIU+Jx9
 i7eGXRMcDcz2DHCoFfHbP10KPcpSwjezjgzYPPZeB26clopkWJVeFnJkW/3mdAR1G2Dz
 WXdlidKhTdMc9uW4fWjvEGTmCViFF6CoC7HGXGIKEbcx+zJTp2chwOfUfdGQQQrPx8C3
 bvAFdIVxoFP7w8Ciz2B9nNmjMwbb+F/UL2C4oRGc2MbnJnzrLh72GfAsu5VVDshYHBL8
 OP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742479403; x=1743084203;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DWgshA8OTIIdBLqESPNQi1EevqOIJBOXPNBXtKqlBfQ=;
 b=KR1T9sEajhcT83wmwQcGyFH0i1gugwOsSIB2esTDAbfKofdEnlXoHMjQiUdtub3NfG
 n+K8/pnvZZoVscmj4NxxJRL7cinAjdgUpzODbXmStycBQgnDa7/ioWiBfQ5h3rSSyRva
 7bEVxbETxDzIKK+loQvbdsQ2fdAaO2hdyk4x/XsuFA9mUAttoFzAvzG4FGXd16ot/vDI
 kScsJCCfp9AbWXTfT5y7uCP6blCwUj6Nm82blOUyIHozLjSivkV9gBWGNkuoj21b6IFW
 11BcsTnrtCbIbT5l0Gp2G6BjG7BCxPXPokMENgcBXp9VfMK0dret8icHmvKnYwLwJJMP
 Vj4A==
X-Gm-Message-State: AOJu0YwnXIax/aa/tG5oabx/SJlOVV8KVjq9N3x1RmanQ7wZSWCCfxxy
 2YoHUdVgAoYxYi4xGVfU53XySE7jfBz9/kkDZqYu1AiDTNDEZzz2Mkr4bdeP+4M=
X-Gm-Gg: ASbGncs4ZE5RAoZ23BIqQ6AalbtubEbU2IXUDs1pcQnRR/L2g0odiMHNnqEQAQM0h3A
 wXU1X8TcuNnSK7qJvoB1bx4eJMQPNGL7i7094635PW9CGWEs03jRCVqnz8P0lF105F4kVdPBCBY
 BVWmZWTyG5jRtn4maww5PQQgpJjFwOyV0oTC0g4eP6ESW6mY+UcjMK+B+pj6loowuXYop56Qaca
 +ntl1ga1C0Qj0jX3IeZ/45REiea8PFPVD5RyayyfT5B2LiOuomSxhKA7krY8eECzaZ6StlQoXs6
 MQgniXT32Lti3oabPcM8Ydb9DiquwRPJrdH6yyll60Tljh2ZonxTyIGKexpiaMVYodpw2bWmHbq
 JAspEF30tyjl7
X-Received: by 2002:a5d:47ab:0:b0:391:23e6:f0ac with SMTP id
 ffacd0b85a97d-3997955ca8dmr3123367f8f.11.1742479402163; 
 Thu, 20 Mar 2025 07:03:22 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f43cbasm49379795e9.9.2025.03.20.07.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 07:03:21 -0700 (PDT)
Message-ID: <7bd9e9ee-8b0b-4e06-b513-b66339b33f89@linaro.org>
Date: Thu, 20 Mar 2025 15:03:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] rust: assertions: add static_assert
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250320133248.1679485-1-peter.maydell@linaro.org>
 <20250320133248.1679485-2-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250320133248.1679485-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 13YfRIVLDEyV

On 20/3/25 14:32, Peter Maydell wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> Add a new assertion that is similar to "const { assert!(...) }" but can be used
> outside functions and with older versions of Rust.  A similar macro is found in
> Linux, whereas the "static_assertions" crate has a const_assert macro that
> produces worse error messages.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Supersedes: <20250320113356.799412-1-pbonzini@redhat.com>

^ extraneous tag

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   rust/qemu-api/src/assertions.rs | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)

