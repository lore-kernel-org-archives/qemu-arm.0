Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F22C87FCB
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 12:08:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulnnV-0003YL-0u; Tue, 12 Aug 2025 08:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ulnnR-0003Xt-45
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 08:08:06 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ulnnN-0002hW-CO
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 08:08:04 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b4239091facso4008594a12.0
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 05:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755000478; x=1755605278; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SbWB1iGc4be68MUaR4nnqVpn7PNG4VIGPFufJoq+xv4=;
 b=HBWy+J5SOXmtIoUhrtLntpPawpw3kiTpQdvxIknjynao7VA3fxDaunm/BwZ8DUGfXw
 MRa1jTYwf6r7aGNqsO50tLKFIs1MzeV4vfSaXvMV5u3isRRpeDqiWPqWxCu44ZUkQeE/
 INZxFMojdZFA4ehiw4avvdOewYqlhNLYfzus8bk/C0BKvwqidpXY3vg5JfTolUOsQv7M
 b+dI8ciQPYAEonMef2G9rezRXXUnBr5THB02tA2galy3DCnaapbLdQieUwzg/amZ3zmW
 xOlnCL9LEfhAUGSt0pTFMZwn1rVd5ygrRVI4rb993GM8jHnR4g8QyFukThOS/gNov0eF
 N5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755000478; x=1755605278;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SbWB1iGc4be68MUaR4nnqVpn7PNG4VIGPFufJoq+xv4=;
 b=eTgY3AUKtGDLvxss4flSwNGI+OOO1uJkaHxT+Ai5gPAngrcX8xva5yd0M8OfiSZEq5
 o0qVBDffI7H4VUWKfDevShzg1Zpxb2sNpa6ylC17yT2qUYpfPrRRxmKe0yqmMhxiZy8g
 4mN+CZplVnm7rUhNnMHPimdMwtME3yfGT6FnlQb3JKA+7pyP4FNVrEndOJZWI+FWNmi9
 D+hHnEltj6DQUoNzK+OVf2eVIB53YfFDF1ZR2uGMtOjcnezxj65I1VjZqVglzCnyC7SJ
 13jTHtu9n30wcFzPMqajhe3SOqvLPclr1iPU1bEIYm3wX6vzDShwsRIWIs4JyNCtHin2
 AHog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfZtbTNta8aaZgxZ0BBSkD+G2DOwACFvBOGH05Yn/XxLHhrfI2Srkeh4kODFKGVALjupntFOn/xA==@nongnu.org
X-Gm-Message-State: AOJu0Yyzy0QgOESaQ7zLW+A35PEpg2pgWINJpwkq6bDCjnIHljlUTBsc
 4re+6/bph+IN/l5rOx4DCsP/MPzQTMc64LDEc/l4WWofpnveqF1/pStakHM55qqTWG8=
X-Gm-Gg: ASbGncunJbT3Dkml9y9UO6dG7u/h20t6XyBRb80UCxM9zt5iJaQICf+BryDSBswLM0k
 Apq2YaG95b/neyGNF5ERFneTwt2tTsnP2cgguVA1dfraZD2Y9h50uGsTC8dsqt4aw7uk8YT7eLn
 tbnnSHG3jOV3bDnaAOFmAzrc7aPOyLPioQf1ayXLHruGFx+6L98eMjVu4dy9ie4skGoaXjI5E8i
 SeNXUfaRIk3x/zi+tFeDg7FLmegPDSp0EGkfQJfgGRLc71dl5UOltT6qDsZQqlGG+tvWquqUSOR
 vG4xUly+ArIp9yQbtSkYd6pr3t92OFsU9PV7CcMTEqnLgb2EfqUyApziWBh1g1hkzvGat0o9+za
 +PKCMY/qTAfZ07kKzKHOYl2/MPCVe4sS/ZSoQkp5l
X-Google-Smtp-Source: AGHT+IE9W6uSA0T3OR6c9RVEJ+xwQbH8TZPRb06BVWl8UC2GUU1drrYqiiVsATnzDD62Lbos43evtg==
X-Received: by 2002:a17:902:fc50:b0:240:3c86:fe41 with SMTP id
 d9443c01a7336-242fc211f3fmr54226345ad.7.1755000478224; 
 Tue, 12 Aug 2025 05:07:58 -0700 (PDT)
Received: from [192.168.4.112] ([168.140.255.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-243017dd480sm14845385ad.33.2025.08.12.05.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 05:07:57 -0700 (PDT)
Message-ID: <411c904c-c2c4-412f-940e-5a9782bf58e3@linaro.org>
Date: Tue, 12 Aug 2025 22:07:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/85] target/arm: Implement FEAT_GCS
To: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <87jz39mcbi.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <87jz39mcbi.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/12/25 13:46, Thiago Jung Bauermann wrote:
> Most of the GDB tests pass. The only failure is in a test which sets the
> GCSPR in a process to a bogus value. This causes the process to get a
> SIGBUS:
> 
> (gdb) set $gcspr = 0xbadc0ffee
> (gdb) continue
> Continuing.
> 
> Program received signal SIGBUS, Bus error.
> normal_function0 () at /path/to/gdb/testsuite/gdb.arch/aarch64-gcs.c:121
> 121	  __asm__ volatile ("ret\n");
> 
> In the FVP emulator, the process gets a SIGSEGV instead, so that is what
> my test expects:
> 
> (gdb) set $gcspr = 0xbadc0ffee
> (gdb) continue
> Continuing.
> 
> Program received signal SIGSEGV, Segmentation fault.
> normal_function0 () at /path/to/gdb/testsuite/gdb.arch/aarch64-gcs.c:121
> 121	  __asm__ volatile ("ret\n");
> 
> I don't know whether this is a bug or just a different permissible
> behaviour, in which case I can easily adjust my test to expect either
> signal.

I may have forgotten to set the gcs bit in the iss2 field along the unaligned access path. 
  I'll see if I can verify this hypothesis.


r~

