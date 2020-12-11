Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp203232lfq;
        Fri, 11 Dec 2020 07:51:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyu18PP4GGNrOq20Eg55HFVhIPWCWfrQAeiSKxSreCxt/JAnpmdXwtKnsSSQ0fghDR3X0GY
X-Received: by 2002:a5b:312:: with SMTP id j18mr20391478ybp.196.1607701894486;
        Fri, 11 Dec 2020 07:51:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607701894; cv=none;
        d=google.com; s=arc-20160816;
        b=cZP2cZSHbd7TD/QTFh6nSqC+6YyFO3JjS9w0K2qm317GPRE1BfrG3OYJaKBE34YcDj
         HcL4O4BbGnA5FyMiFRxfzaqbc9DmBQwiBy4FeQFa2yRvdNO+6d4l+IbccS3lfoNc6MBV
         /svRIOXiFy8SQaNFzswnFGkToqP7xLnbjKVZOscB/rTZK0FWFQAfsxeq2szizBB/tJ1K
         c/kc6q6oWWPdnyp4XwO905lo8GIO/lbS3digd9+9OOzqD0r8Th7MXdOQ4bzCxxQNVqAy
         VUV2zzExXHL2EFiQ+RTkrdnHGlJ4Ai0gS0iegiHnuYC7GpH1uT6AoJcvtBZ89paadtor
         hGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jMKwW2sA2znFMCHR/NCS7RwSc5jRFiydzhYhCFi+QF8=;
        b=RuAmi1u5tGtriXHvRVE5iBb1Qfcuj5qhdHIpJdwpD0iAnG+/RhpPBa3c0ZUL3/zzGJ
         aA2szYhndcV5moxaffasyyUYzUTCwalLW13FzK2Vt9hcTbBFpVNiDZal6eGP7aQ8hX0j
         6TdUGL/I3pFlQDFdhCddvSu10ULldPhlSobfWkzmANVMqEPI47rjy2kKlRbCZT6bSfSy
         JiAQhOp9NNoarZiF+ntPJ8/hXIrbdHnvf5f2gW5RTMiaF63HUP/9DTkzeTHBnPFTAHgt
         uRv7yOlpHEWgjJxwS8j2BS3LSO3EfRlCoH0m7D1gPsEFlWMIrbGS71flhu3Qz+49v+AS
         +aZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nX11ltdR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a62si9787978ybi.38.2020.12.11.07.51.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Dec 2020 07:51:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nX11ltdR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knkhh-0008Q4-SS
	for alex.bennee@linaro.org; Fri, 11 Dec 2020 10:51:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knkey-0004UV-Jo
 for qemu-arm@nongnu.org; Fri, 11 Dec 2020 10:48:48 -0500
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:40684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knket-0005nT-FV
 for qemu-arm@nongnu.org; Fri, 11 Dec 2020 10:48:42 -0500
Received: by mail-oo1-xc44.google.com with SMTP id 9so2238830ooy.7
 for <qemu-arm@nongnu.org>; Fri, 11 Dec 2020 07:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jMKwW2sA2znFMCHR/NCS7RwSc5jRFiydzhYhCFi+QF8=;
 b=nX11ltdR4IJyLVZiMgggghuZV4iRUyXYsQuc3aBrdx+e7u8eIm8d+SybBRxGbHyDtC
 DVq0/yGHDa8xpxvjaSlnbLRuKA73ibJI5of9Cmhnz8J6Q1B08X5DHqoZ3m17JXIB4lsR
 UVE+lhUsLt4xCruk6X4r1WToca4l/cLqIDNBHHv9zl44S+9ELcqjRS8kPn2bmeLQjGAX
 W+CUQVWbuelOsrTXys/zXfsyyL2FnZ3zsUALJ6Ycc21zZMrUrnl/QmKsd1H7lrCHW3eM
 UevdMEuK5saSmG9xZ0Ybbu2yh+HQki2KBqy3e8XxP6eoPGGBihqk23edYBfFzDocX2TA
 22bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jMKwW2sA2znFMCHR/NCS7RwSc5jRFiydzhYhCFi+QF8=;
 b=HVbBOwLFqlGANPtqQQy0793wCsVF8JX/8t+BxFlIhc0PiscZEX/g2yQ3qUDPUJ2e6B
 1rUu6gpdYJyc3IZcTsSMp+8TlSk4dLqgl6SZ6v8TS3kYhHxzsBmRp7FyzvsrWzsix6FH
 RBdalE/BvHmuNK/6x+9H5KCWY7Jgd2ds26EsK2CiRu0r+SxA7VJx/YkU48dC2mHwGViC
 BHeUUWWaXEuENQsM7Z858XUmMd3N3OiHOOBOwSquLQk1HaoCzxcd/ed8L/76FSJK8uQO
 tWjfK7r7hTGxK7rzBIOdthbkqGfZO8dfLD1oETWTwls7v4dzGoC4SfL3r5hlSiVHB6yS
 2Ceg==
X-Gm-Message-State: AOAM531PNCKGKoPNsUHMZ2EvQl0/+d8K35IuyfiJJpRkJKvfM1Yjt2dW
 EE1wBo3R9p5XBL3uSDW7vFdOag==
X-Received: by 2002:a4a:9563:: with SMTP id n32mr10619308ooi.53.1607701718342; 
 Fri, 11 Dec 2020 07:48:38 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t19sm2005211otp.36.2020.12.11.07.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 07:48:37 -0800 (PST)
Subject: Re: [PATCH v5 05/11] arm: Set PSCI to 0.2 for HVF
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
References: <20201211151300.85322-1-agraf@csgraf.de>
 <20201211151300.85322-6-agraf@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <830efda6-f421-75a3-a29f-ee6f80b7d1cb@linaro.org>
Date: Fri, 11 Dec 2020 09:48:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211151300.85322-6-agraf@csgraf.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc44.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BZMA/m+SPmNx

On 12/11/20 9:12 AM, Alexander Graf wrote:
> In Hypervisor.framework, we just pass PSCI calls straight on to the QEMU emulation
> of it. That means, if TCG is compatible with PSCI 0.2, so are we. Let's transpose
> that fact in code too.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
