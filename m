Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp545404njb;
        Thu, 27 Feb 2025 14:23:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVwMc0MVkuUZAJEme84kzlArIPbUM2M2pBjA6hW86EzI9FLAI1raMrILbnbP9vvM9eAW/LxsxUt0d4t2A==@linaro.org
X-Google-Smtp-Source: AGHT+IH8salebAS8o9pwYrFJ2apBOmV/SwtMZUMQUZwgbyCOdIvmWeBVsirwhylHunPdfaGMZlXK
X-Received: by 2002:a05:6214:2241:b0:6e6:65df:557a with SMTP id 6a1803df08f44-6e8a0d7bdcamr21923576d6.31.1740695011193;
        Thu, 27 Feb 2025 14:23:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740695011; cv=none;
        d=google.com; s=arc-20240605;
        b=LMppNDHjBzULextm+YRo6x+k0zWGlwhqYOKeE1LldWQ4h9RzPVVfaLHCdJAfbZpq7z
         lquwS2gf1+4itym4vmDT9hrplRXoiroTEXCGfsx2sV5yuGPFDUx4tAbIb3oW6jkM+kP+
         kIGfaJVHUQDS396dRBqpqq4ErfmTesZP1JNUp01koZbdhRsAbEarAzgWwrdFjsaKm1cV
         N3xCjWRPOJZGWHNSaqAIkaxC6sFW/sPfzQ8DdE/08sAFRlJ6Y9AiLQlhudn4yw8zZpLt
         YjcriCkNwnojb3qhQriJihrxshN8xIXTGBQ9yMAUwsBkg0o7KuThlHEx26f1k6E6Ux7F
         35oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=3pGOEac6/oJsONdfzBlfSR6QH6lKZTWAL29EPkt8F1I=;
        fh=EFSBikIgIEIN/l5QoirnwnD7BrkXNmOzcbfMiRkkG1I=;
        b=JX635sZah4ojHrbPu8f5AjvwPtrln9sTx2mSMPECMGpSIa3Z+dfhgDchq5NRO1VZzl
         JVdin8hqkOCXzWHrrX2gdS7z+lMtN+UUTuNfAJSmqu6/TisqE9nNnQEI520gvqgjIkhr
         BEExKfHjgBXCJaC9RLyXmDBLh+yFUeqpx15/Han2GrCKB1Rp22VyrUKaf6S2yG3gKU47
         deB1fHXqJuTLlMSL26+bO3FQYWhqd0aYxgogcxVDixO9YedZVwPMLCsbZf0RIRbgcs6O
         iDN4yG5DgLpjCoM09MACPqvodM+0mGQtnOZfnrjHIA58uORnl2cmgoY2Re8/4L0cMKlL
         cTGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kYVmT/Ox";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e897600992si20254226d6.131.2025.02.27.14.23.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 14:23:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kYVmT/Ox";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnmHw-00058A-Ct; Thu, 27 Feb 2025 17:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tnmHu-000555-SK
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 17:23:26 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tnmHt-0002R0-7m
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 17:23:26 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-390dd3654aeso855043f8f.2
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 14:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740695003; x=1741299803; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3pGOEac6/oJsONdfzBlfSR6QH6lKZTWAL29EPkt8F1I=;
 b=kYVmT/Ox8YNXs2JFTj2L9IDxiYY2qy6OjNYc8wvbQ5S22f229jRKxZnyvOj5j0phiw
 CiTaY+VgtNSci0TPWlUq0I7RljARAQd6NGXA06u6r8r7/wfxN+gWiM+7cFpJCSJM+gC+
 8sE1A7gzutXWR4XiHZVdIUjH7jHmiXV0kaq5qq4M+/yWMj72pUQcv26SXg+vGiOa198Y
 K++Zk8pQ4+J8ocRY8MQK/0hPV35ZPFivxwdfrLz2kAKJWGL3nj0OZTruN2aZaySPxpw2
 QyFGlV8rVuikLXmvTxSqdpqtEHk8saAFF7T1PBI462b75FemsbNA3w75S4fPQhROUfue
 tO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740695003; x=1741299803;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3pGOEac6/oJsONdfzBlfSR6QH6lKZTWAL29EPkt8F1I=;
 b=dDFC7oK9YQE1B80wKtILkaHZhjPEEizCg0qpLNoX8MHKE1mtcEfazf+ybLZwrx+JYT
 BiIFmmL+wswtK+oH//9/6yUxGCGYjU5OIJ9tSl5guJNLfP0b8Y9Ee5qL2kL3P0fVJ1vI
 L1mlgSePWeh49HkR1XQEpLWDUc5xeQIAjmoIW9ZgqvhbDe2N4XrtuJlHv77f6KggZu0T
 udXiIezBVEIFMvZIQBpR8dnbDqZidi1TVvjJhfhobAYsLReVCzzTwiph0BqwSNXUKZWE
 V/2b5X0HYUhelaZWRUzMgH7c1LXtD+JGWwLSDqfHRFzwbtiGZj/ON1yQQxv7sEBvQDu3
 zx3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3CAj/gczNdiTcCwqmVrUzdGouNeTWpWqUWVvU/QjAflW41iLbGkIJBZlEgptsKRso/M2frB0P6g==@nongnu.org
X-Gm-Message-State: AOJu0YzKZT60vONmrU7t2toKWEmLXrCtP3z1rZ/J8ipt7r2jQ3u6JLqU
 w9o8s+1uaUvFYVXDgsH0KR6DolSTwyM5+BTUh9nSb6ydqvliAdtH7eZ3Z4UnWMw=
X-Gm-Gg: ASbGncvg2XCPyiG4CuKkUCdrCMuxbxGScvxbAzKkIBDwpX7zxYxq182aExU+TRdhD5F
 GVRjdH3/O6AYfnl26BS24ZMG1xPd91L5kfxnbCSAqHlMtn+58DmaOu4/Cb25VX9cmnk0ogt+cf2
 M95UgoSw1lOS2mRe7P/g8S2z5xZOE5Menm4dcWazgJDrUu6gQqiFyAo8cTJGhI7/0aAWTOX218J
 AxF09S0wviwLJgN+ApFZqBRZWkrmmbUGQW2dBfaggN1x84eLgRh3k6uySJppPdfxPg1WKQ5PHRX
 t7nwT6+nxFG9MimzEEv5vJGrbqXSGYoTRtj4zmz+dBZPAbHjFAIFoHm3YZ8Qy758qneKFQ==
X-Received: by 2002:a5d:5848:0:b0:38f:295e:6331 with SMTP id
 ffacd0b85a97d-390ec7d09abmr655889f8f.19.1740695003585; 
 Thu, 27 Feb 2025 14:23:23 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a6d0asm3203562f8f.27.2025.02.27.14.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 14:23:23 -0800 (PST)
Message-ID: <9abaa8f1-b2bc-41f7-913e-0c427106de7e@linaro.org>
Date: Thu, 27 Feb 2025 23:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/arm: Drop unused address_offset from
 op_addr_{rr, ri}_post()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250227142746.1698904-1-peter.maydell@linaro.org>
 <20250227142746.1698904-4-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250227142746.1698904-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: YuXJ07j9P8wv

On 27/2/25 15:27, Peter Maydell wrote:
> All the callers of op_addr_rr_post() and op_addr_ri_post() now pass in
> zero for the address_offset, so we can remove that argument.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

