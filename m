Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp943881njk;
        Fri, 24 Jan 2025 08:58:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWSeOQybug+13M/Rjgb1VUX1lVZK5PMz5YR0aOESA6A1b2lm+cn1TWv7aAHsOtwDLtWbRkSYTLinQS23Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHds8k3j1Y7R3vLcRL5vTluEMJHSjKtS9mcbesgyQpadz5tXF3DpeAW6b8uyS5cDLVofDXq
X-Received: by 2002:a05:622a:1314:b0:467:79b4:a103 with SMTP id d75a77b69052e-46e12bc61c8mr428325941cf.51.1737737893748;
        Fri, 24 Jan 2025 08:58:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737737893; cv=none;
        d=google.com; s=arc-20240605;
        b=ku/XpeF4ZGcL890WLed2NtjZ41zYra7XachowfP0y9//5mz9wonydl36Z7uFK5OEWW
         bmbn5gXIZlTGqifclLJ7iRhGZzi8fYUWfl8PFvfin6Y2bKC6ohtbi/AIfnrkR7WwMiOS
         eHfUyr49/OHAxihiEv0846LENK6v8L0Gq718Z/qOmbHUwqWOC7fFsWCC6L+wotVVgCWw
         B+POdeGFpRq0F7CaJEWjxGlu4TeoQtVW+CWNBmzirK2fkJgvRrzsQUTWNSUFbWf/W2C6
         LF7rj4LsfRovDIQghXRlqyzPSQ5AUQ5q3Gw3t42LEOmVVJr6or3Tykd1lGFpBAfh4Uz0
         M87w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gXE15mkcNpzOGS5EJlj1b2+BpeJ5W5y/+0OTdAZnEfE=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=lu6kCzsrMWE41RlXorWpOVdaN4XNICyHSprkvdgYnfjqU3dBEQX1NiwQfLQFYDf75N
         ZToU+Y27OkYh2acTKs/pQO889cySaqGyBRDkX7fU+NbFC1BDhq7eos5LZQwzAfTFLbl4
         nJOCaMuakgyEo2jwanyZPa8ZAkobxkOvBXeUVcs+OIthiaajXiGctgkXcXjNrI6nF9ww
         Vgw4zBdA3F6KMli4mIJ+n8fxljmmi/CNUaCVeheZPp/RA3ixOCxtEOSnUn0ubS3ggWB1
         TNjFyrkmFpBskoCrBYvVJso5d8jyRpVHvFf+ZVlKL/iIKep/YKRztzoJ+97Z7bU37rVi
         I4Cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=axKg9WIB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b6b190si27874511cf.303.2025.01.24.08.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:58:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=axKg9WIB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMu7-0000Ct-Nh; Fri, 24 Jan 2025 11:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbMtz-0008TL-FD
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:51:29 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbMtx-0001ya-Bp
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:51:26 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2f43d17b0e3so4402186a91.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737737479; x=1738342279; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gXE15mkcNpzOGS5EJlj1b2+BpeJ5W5y/+0OTdAZnEfE=;
 b=axKg9WIBX05hkdW4fXdkJP9V/pYEWL1L+Cw5I+ufc0cXYVjR1qaVt38XwSlCBgRTdE
 xqEGRSal1uiTiXC4KcqCLiULYUtpLBR3Ax7Tntnn0DJPzeoo1Cw64ShCsNjiXxA0hF5p
 xkjY00CA6jlIFTk/ZjxoS3+eOTr+Z68L7pQMyXPJZyFS9Tr0pFV952aqvVIuuVmnG+FM
 j7ox+eCe6sR2cZMicMOKyJ+DPupgUkH0WLun+I3obMz69NNZaaiGuJ4C3uop7xagB213
 08ezOA+Bi7sk0Xc62O0STYTRpwjMY98DljO+xANYjaCNP1SM+elle2NTm2Cvtpk3tPt1
 ShmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737737479; x=1738342279;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gXE15mkcNpzOGS5EJlj1b2+BpeJ5W5y/+0OTdAZnEfE=;
 b=sa6CgH2ps5Kz9HkSQDMV4a/DJaW6sY2irrvMuUyDnpY7fPK1hsuDh4Fobm9M/FsKyX
 AEXjzCHeQDrvQf5rIG+Nwwkvj5b7F7I/1Jk6Ac21XwHk0i94KcEIeVMEGwYemLvUDOvD
 EgtCBUqNLTyoC6CSEBj+UxJy7VMCEmZrOwTm/04XgLxhBnBIXX61yxLi71lcayGdCnix
 8iBVn1wdVcAhv4FFRApcVeTmv1JO+y0Ue6FXF7CFwY+IAYzSNPn9m6Q+T5gFShZzSa/u
 UzRY8hh1xLUExsW4oA30gVtMhS6gNVGlDkdxfLJg7mM09Ksa81IPnWhRo+N0fAy/3KOT
 u2hw==
X-Gm-Message-State: AOJu0YzMOowjTdlEhq8pkwzxWX50/zJZACa1zOJ9KtV84XXs2dtxdKOH
 xYQri29WqDQlLEyVdT/tS/ojYUQSpvXkngKAfDqNfJD8mK/QlNCa6l3gvm7h8Ss=
X-Gm-Gg: ASbGnctvQWole4GGGjzzavdUBhhEUg4V0kWgjRlMlTuCkyNGzJ30grLiN9c1J1utcuP
 DNcVtBv4kIAY1nWjWNPEjT4CWQCDAkw7nywSFDCmk5w7PaQKAWC+xSYpMCTK0CLQTJfW9VjBmmi
 vt4z9Ci6/nC3fQ8d+zG5WV2Hk6viFOdyX19r8zkCk3LGCyZTwJrcdaCra5M17MR1xjxbrNb/nh1
 5p+ezx435iLmXsGgPC8ZvOr8ffI94Vs5n8Z49MlEj7tsJO19rr8JmB6kvJ8YjhLFHoBFZJMxo2l
 ZCrog2f27GJI0aOxND9P2tEn
X-Received: by 2002:a17:90b:5206:b0:2f5:63a:44f9 with SMTP id
 98e67ed59e1d1-2f782d4f189mr38966313a91.23.1737737479552; 
 Fri, 24 Jan 2025 08:51:19 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffa56160sm1971766a91.18.2025.01.24.08.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 08:51:19 -0800 (PST)
Message-ID: <f6e862cb-09ee-43f8-9131-4f80b0ad7b5c@linaro.org>
Date: Fri, 24 Jan 2025 08:51:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/28] target/rx: Ensure not being build on user emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: DHBfKvB2uWtn

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Currently only system emulation is supported.
> Assert no target code is built for user emulation.
> Remove #ifdef'ry since more work is required before
> being able to emulate a user process.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/rx/cpu.h    | 6 ++++--
>   target/rx/cpu.c    | 6 ------
>   target/rx/helper.c | 4 ----
>   3 files changed, 4 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
