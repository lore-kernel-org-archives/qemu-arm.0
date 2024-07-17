Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp697067njk;
        Wed, 17 Jul 2024 02:51:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSUv4QjLNT4J9BM2hJD7GlLdGH4VoneK8+MEa2+saPBEDRFoU1D0hYpmjtE/nsxR5cFcZus+Cj5z5lpPkjbzwDmoclBxK4
X-Google-Smtp-Source: AGHT+IFN47FM4ZNJHz3CAE+3WdU5sm6wWFRq5zHGff48rPXG5hAfjiR1DDZ3m4gaKvDzSaWNkT5p
X-Received: by 2002:a05:6214:21ad:b0:6b2:da7e:5cb7 with SMTP id 6a1803df08f44-6b78ca5f450mr13996046d6.5.1721209883920;
        Wed, 17 Jul 2024 02:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721209883; cv=none;
        d=google.com; s=arc-20160816;
        b=JhH/D/UjO7fYwTWNWF8b1p7WTv/Sa3ybQbVNeNN99G5Iv9zjrt0ok1vqOhMSKLZFKQ
         S1kKwI+BfPZhe4kZHWCOAM7KQRE/ypYOP3tAzpB96pLsTuNqKVidGIgZK0wQgfIaogN9
         kjVSovZyWVVjf1KfoSc6tSKYp9+5fQ2F4L6ouJjVykUUpwy8oe7uH6dHPLAgII+vHnDt
         tutk1dgbYgtanGfdZON2CueVnCkRCBdlNtdWUQGgzQxMbPLNAG4EfqFSBiIgZvtaDOxO
         9vxGxncfudLFD7Cs6sB6O1h6XfCdWqiJAgbQOYF3J5IbybxQZrO+GJUJV4MxnfGSWhFP
         K8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=33CZUV01UH7KCnwjrOcY5J3EZEYCj42FDXR7GwWei3I=;
        fh=c2VVkfaZweGZ65f6GnjpfF+wMS0VJNsfO47DtCCrw2E=;
        b=DMENK8q1w/gW4nkLgFvVPbFU2mEXCU2d6gnR+j2CMsMT9e/YxGPCddBuSFSc5DNWHN
         Pl2+Mf0Hx8taAd37nRrjaeQZGUaiC48TZ3Klr3t2DbjOL/EDtQy+pAAbLaxiEfjevqdL
         Vim799fmVbeoEpVX9Ru1yTDSoT1Zq5TCu/9pP40vGajBF9Q5JkdqC51kSUe0Hpvq8ktq
         yzXIv61OMXoZIW2ykRTZerkWpFcuInQcdS2r7oe9NySqEwiGnc4hYk/EMgzDMmB8BtWP
         WvTJor/RvdBopoEZUlK9QlOie7lCnPNNv4+o9p0jmikpCU0OmufqhIwKNySnVuMWbfDY
         ZEiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cA23mknF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a62098si93742946d6.533.2024.07.17.02.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 02:51:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cA23mknF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sU1JR-0001cy-Bu; Wed, 17 Jul 2024 05:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU1JM-0001Ug-Fl
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 05:51:00 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU1JJ-0001fU-Nk
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 05:50:59 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4279c10a40eso43134635e9.3
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2024 02:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721209852; x=1721814652; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=33CZUV01UH7KCnwjrOcY5J3EZEYCj42FDXR7GwWei3I=;
 b=cA23mknFj7Js8hJFJt//3ccwkkXZW50ZRM/ZsSKwDcw0a1v4O/etJH52n5qdvJgEAJ
 zK55A9aDXoV5W2XxkTzsC3FzbMDyejtp2Vhq84aQxrVzh6S7AlBWqIMuFEK92QpMtQgP
 N7vsGciwcA8zJIFtj2/ii67rB2e85AKm8UUFfS6acGtcEqE+V7ozkqBgQu633kdk9N1E
 VllWtnkMwZY9aajN6KoomRxSBdaCWAqAwmqIRqZ40FKe9RjHKzjlZNyszB9m1md7JSep
 qGNRFDN+yxjdjZew/rtuqxYSEYVTY5TqZ5LzAmp6d6A9Pmdsi+rj2ijXlH0J/Ct6pKTd
 Nakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721209852; x=1721814652;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=33CZUV01UH7KCnwjrOcY5J3EZEYCj42FDXR7GwWei3I=;
 b=vo9QTPeEAlBBNoPkLc4V5FQ1kstWs3kqBsfFtjfUHMhCpNV4PMRbOecYJbdRgeW1dB
 T4R9r88dP1WiP36NkoLinQIBcYBWvAle1OkVEwzHMWZnEcO8P0RL+5uP7XuRyYuZLGCI
 qdxvTdL9lhftxhRzTSYTUamTLGkee/5+foMJnA/gFKOQA5zzAOU+f4J05PFA73yijWZe
 rLl9p7mHXLNTPxyO6Vf6Wa09Gb8NWtFohawTcNL3ooHFYf2KLU3xB3pwWm45Dton2DRM
 yIzwdefba6aTxOIZx+zgPR8i2432mnLv7TFw4ZvW10iKa8NFamyHJjDPY0u3AyiHaaZ1
 EJsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDaTA0P+yObbVWvICdrL5tKbhe8WpOygjXG/qYYrybpx+jOwIfXxefYpu8S9rRUTyXNoxJCZhsh1Yuhn3Ry8YQO+NsTzs=
X-Gm-Message-State: AOJu0YwFMlGUZC/vMYI6E0f2VBxrg314FhgKJiFyXrKq8mdSeW4oMtJ4
 OrcCdaV97PAq7UAzJGBKZv5rp0myycNmUIvOWBcYsCCz3I6wF9lRrhI/3+9cg80=
X-Received: by 2002:a05:600c:4ec6:b0:426:6876:83bb with SMTP id
 5b1f17b1804b1-427c2cb368fmr8154805e9.17.1721209852558; 
 Wed, 17 Jul 2024 02:50:52 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680daccc91sm11211231f8f.53.2024.07.17.02.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 02:50:52 -0700 (PDT)
Message-ID: <60f76a76-709a-4f32-974c-c771a724d443@linaro.org>
Date: Wed, 17 Jul 2024 11:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] target/arm: Use tcg_gen_extract2_i64 for EXT
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20240717060903.205098-1-richard.henderson@linaro.org>
 <20240717060903.205098-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240717060903.205098-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E0b2cbOOL+3x

On 17/7/24 08:08, Richard Henderson wrote:
> The extract2 tcg op performs the same operation
> as the do_ext64 function.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 23 +++--------------------
>   1 file changed, 3 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

