Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp292985ejc;
        Thu, 31 Aug 2023 17:38:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQcjL3guzFZQKR58qevSOxaAvyQR5DR6PiYGraubIqHjVQcWIY4EWXqDyHRBwR7r2mCyvo
X-Received: by 2002:a05:6214:1d2c:b0:64b:6e2b:20f4 with SMTP id f12-20020a0562141d2c00b0064b6e2b20f4mr5878918qvd.10.1693528728690;
        Thu, 31 Aug 2023 17:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693528728; cv=none;
        d=google.com; s=arc-20160816;
        b=EhEgH04Vy5Qz56NfM8QmvM/0eoVzoK49sOVse8p8NYd1TGoRlj5+fiAd0/2lh/oZ9C
         EXqSdS1a+Zv2R9+UjoMHk3pZRuucZfCcOFDdskxM73TuWmwBp+nsj5J83YvyGiWa3yJq
         eV6vGsLKGCs1So66oWzobo2xE1gMf6qGnnmrWYK80TSP+HICcb0ukEB+LiqXaCofPZdM
         9dXGwgyZwLrJsuNDUoTlnNV94Cj4W8ufo5tU8gdRgY7SeZoUAojuBwe6mY2Z0R51Q9vz
         X3s8E1m7YumQG0PBuBpBueThrbVbR/y+IIBWD4oGLtjW5Hp9b24C63UyvYv3ZdfZ0XGd
         kUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=taA0aY40AgM649B8wnCD0KFOwzw1i52mzgxmLn0otc8=;
        fh=c8XNGEc17OCxPg8zpIS7RZy0FxziqMB3lE46IjUm6To=;
        b=HIR0ZJQ9LrEomFSSjqPSI/ihDX0umWmow6k6sPSNiplbe4iGWStWHEyIUvSpr50uEc
         eJE1E3Lzu3esk60pmhdMmQEnv4oK0CjtFRT0j3RsVx5m4qjFBPK80mKXQXN0vyxwCYBH
         NhWGn50OZ1VHib62eeTevtkPjvuhn2FixloVLL18GoClD1RwRduibKMJau6G0Y3DYGhp
         pKSTxjJmdU3+G3z+eL16u795oK3vllr7jJFSXevuI1lvlT7UikgOaHMncjSeSAeL1jhl
         i0JlhoUa7Fi4kd3/ZOHJVIPi3C4iEvpH51yoWG+jCY+kr1E0jyiZjccrH4oogJwuRUkq
         ksBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uVUVMcj+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17-20020a0cdb91000000b0064a55b8a16csi1648762qvk.82.2023.08.31.17.38.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 17:38:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uVUVMcj+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbsBK-0001KT-VN; Thu, 31 Aug 2023 20:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbsBC-0001Hi-1L
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 20:38:30 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbsB8-0004P2-Jt
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 20:38:29 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68c3b9f8333so933425b3a.1
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 17:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693528703; x=1694133503; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=taA0aY40AgM649B8wnCD0KFOwzw1i52mzgxmLn0otc8=;
 b=uVUVMcj+ly/4XMDewHZLPUoIixmE+lL66C9Q2UsKNT4iqhOBSgwZs1e8hB9McqRL0o
 +KHVcNte9Ym4BiX8zLYcO0jITpb2vo/ALhT/4PSEEpTUhy/rkb2rgcWqGWvANXx60muP
 93WeQ2W0qfpsWXHpr4Wskh37BUVM+SLUH8hya+T+xrE/2PbAMfGnJr6O2RmYmrezvNb+
 Hu7hG9gx2FBCZHpVpVDPsdBmC7kxZ9kcM/UlYTYZ2oQNtKGabFNcoroQi4kPcgvg+mtA
 sfXI5cnojbKhmx6O4GfwsGBSsycc8DuQALWS78lXx5DClCt2uOHQ2UukaYWZTFD97KEU
 D9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693528703; x=1694133503;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=taA0aY40AgM649B8wnCD0KFOwzw1i52mzgxmLn0otc8=;
 b=R7S7TJdZ2iR7787bv9y0cBk9npXtxADtbP5Jwkm02B4mZjAu9rBQaV2YCSiYDWOipL
 QYTT5bo1yujo1kmCBvozoD3jgNvO1jH/gDjne2uIe4xWyixcK52ey249HAhY/kPcXWgt
 TWEGHYTp4LXzdyHDxkYHVmI87G01jO9KWc0Apn5W+Id7o6itjbfTpH0ws5EoJkE9qOwJ
 arC5PNLMXiG3L3oYHsZicWct6EhqfjpALQOj4XcnDr+Hf0I6q8xu01tuTCXy03nt9jFf
 nhVdUWc66wPyJtV8A9cmpgOMRchyavMM1+E/zW8N0uAasZS9uiB8TycHHm8GUSWpoYns
 uINg==
X-Gm-Message-State: AOJu0YxSzvL+6iqEJ8Qw3NUsByQIKHr9dplrhjzMR0Gje7Wy1pRRrsC6
 NLdi4KTUxDk2X3X9I82RmoNUlg==
X-Received: by 2002:a05:6a00:1786:b0:68a:5cf8:dae4 with SMTP id
 s6-20020a056a00178600b0068a5cf8dae4mr1591471pfg.3.1693528702922; 
 Thu, 31 Aug 2023 17:38:22 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a056a00270a00b0068a13b0b300sm1900522pfv.11.2023.08.31.17.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 17:38:22 -0700 (PDT)
Message-ID: <91f8724b-1f1d-6121-afc8-cc6446bf9359@linaro.org>
Date: Thu, 31 Aug 2023 17:38:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/11] tcg: Clean up local variable shadowing
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230831225607.30829-1-philmd@linaro.org>
 <20230831225607.30829-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230831225607.30829-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.478,
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
X-TUID: 61OQEXcqxOUn

On 8/31/23 15:55, Philippe Mathieu-Daudé wrote:
> -                    MemOp op = get_memop(oi);
> +                    MemOp o = get_memop(oi);

mop would be a more descriptive replacement.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
