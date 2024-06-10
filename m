Received: by 2002:a17:907:686:b0:a6f:1bf6:7fc1 with SMTP id wn6csp480903ejb;
        Sun, 9 Jun 2024 23:05:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMOrNAUG1uRIMHgKQ7k+ecp03fjg76g7/4IFWRvD3CXVtynHQjdxQBtPwZom6UvKpkF5zheZwuiV4Pq4I/wkuf2nAkR/ij
X-Google-Smtp-Source: AGHT+IHqtlYVQ/hFK5lOu6PRHaUznzK5sNFKxNoIMrpEpo0JbiI7j5Bf5pVUifz1nO4YP5+54XlT
X-Received: by 2002:a05:6808:13ca:b0:3d2:19da:9573 with SMTP id 5614622812f47-3d219da96b2mr9897428b6e.15.1717999534359;
        Sun, 09 Jun 2024 23:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717999534; cv=none;
        d=google.com; s=arc-20160816;
        b=L2ZYS490Nn5p+m7h7rltRefOqJYoZTFMVempbLvPXTeSk/B84W7wmeMyQWKF2NFK8W
         tU7O9VPVVDFVxFSQuKIpGJFZRr+HJfduwC0AVQb7NmM7WsWoPuT5tjUu0ku/M+bwf3dD
         do35v3qwjycrUmaDD1ngVbU4OGFQ7JFSHLLXGlK1EGULCCGG1L1e2tWE5rcUfE6NNfZn
         hTrf9cMxtKYLjwMq2X6oeGqPCVfqn+n9RTAicvDHUqSNxcgtQLAYJKqYE30Vo9dA9U+q
         Sw/f5ChTXyi8yiBlMJPRym69T64cx0ke6HMwu9KIREAq8GHQQ0zU5rV6wvD9FQOlva/x
         D9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Mz5HlpAGy/kiQYJ3EPXYuRg/Ok6CveWjBpoGnYhVKsc=;
        fh=1D7nN6XZk8w747bbJhCnZkJPKAAtXYXXwnkHXlTHNy0=;
        b=cSXm7OuGoptusBZoOcA1vA+THcBZkEBXiEUK781eVWeQq8XVnHPghavgH5/7tTbZkY
         lnd+lqOHlFqZrZ/A/nn1ZXETw0lseHNeeEfkIUqUFh7+mH4y5dOUj3Lh9f0bddPNxiIt
         Npo9SAxDmeWGAHyR5CwJhJqNUmUyun0/JinbQVMjCrqYFLRfF+lN0St+nxmsPiIwW4do
         vYuVVRHDr0EavH4x2TLPLMRa26bfD4TLJ6WPmbhPGfnzlV87P1ZAENc+NG0YnH1ks3O+
         4hrz3o5DBESxH78MMPtVtItIucdJ1eeEQ6HHBnvffpFPwPJgG5iMlxFHShwnFRxozgE1
         UPrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DWmapxjg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4405ca0ba7fsi42825371cf.17.2024.06.09.23.05.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Jun 2024 23:05:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DWmapxjg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sGY9K-0003K0-0X; Mon, 10 Jun 2024 02:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sGY9I-0003JZ-FB
 for qemu-arm@nongnu.org; Mon, 10 Jun 2024 02:04:56 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sGY9F-0000ni-Lq
 for qemu-arm@nongnu.org; Mon, 10 Jun 2024 02:04:54 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52c804e092dso1729652e87.2
 for <qemu-arm@nongnu.org>; Sun, 09 Jun 2024 23:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717999491; x=1718604291; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mz5HlpAGy/kiQYJ3EPXYuRg/Ok6CveWjBpoGnYhVKsc=;
 b=DWmapxjgPhWmiMSSTRDZsqrro0d/wsJ5Re8URq0C3UdPsNdHY6l88ou1gq723xIZsn
 yi1eCtLzAx7Os02IClYe9Zg4F3oNZSEtv62KBUgNQaDq7Rzc6swN5DJe3s9XKHOH7f0O
 qYD7h15Nu3wiBReiOcl4Au1yPTxx2ldC9wG0oxW6+mhqYlzHfiRj55+hO+HUK2085AM/
 BC/Du6eiCLz73GfKQqKIiLwl5nj0mz3n0QzLVaalmiSWxu/oJ1gOfjOrl8MZnkeD1bsK
 YzhMnbfJrITL3dOWJVFEpNLHT/JzirdVbnePq7VDKxfezjb9xJiK+9rU0UhbN4E2cdwd
 VrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717999491; x=1718604291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mz5HlpAGy/kiQYJ3EPXYuRg/Ok6CveWjBpoGnYhVKsc=;
 b=eQJ93jtoyPsFRhAlPo1WiXi6zTY/maFkyeHgp40vkmj+FjAh5i13T9lWac+EKeI2SS
 R2dmkeUpEdVLsLmUr+NGpyf+nIRClFVlldS6XyLRvJEpKn8kSVZqtSsijRXp6HUDzrrj
 8N7nGoHAlbLy7RgMSHkIJovh2nW9Pp1PQv1KfGZczg8E+ANqPsYj2RnT8GbPa6L31ycA
 7MPn/A/u8vfDA3NFCgT+Gs7wZkHKieR1z8M6yNZ4LotAsCUp9oayPkNDRl+T7bhvZwC6
 KvjFLrNSiVNQNVKHChNJlry14d8e4OTgdtQFWdLftYXvrk1Gid6OKJTExScph6bxx2K5
 cFDg==
X-Gm-Message-State: AOJu0YzBa5N5JjhrP9k6dRHy6+DkSwgJgPILmS8PPm6lVci3xRJdajId
 7AXrU24r9o8xpiDwWUUCLUQ+F/k8OZsKiLr0lXnlqVz+BPjosKXoah1d18S4epY=
X-Received: by 2002:a19:8c42:0:b0:52c:7fbf:39f6 with SMTP id
 2adb3069b0e04-52c7fbf3b15mr3517744e87.26.1717999490722; 
 Sun, 09 Jun 2024 23:04:50 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.129.242])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1d8369casm119024066b.225.2024.06.09.23.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jun 2024 23:04:50 -0700 (PDT)
Message-ID: <f04c5b61-2e73-4029-a614-a9c7686ec46d@linaro.org>
Date: Mon, 10 Jun 2024 08:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/xilinx_zynq: Fix IRQ/FIQ routing
To: Sebastian Huber <sebastian.huber@embedded-brains.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20240610052906.4432-1-sebastian.huber@embedded-brains.de>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240610052906.4432-1-sebastian.huber@embedded-brains.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
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
X-TUID: /BdmT+bzRXPh

On 10/6/24 07:29, Sebastian Huber wrote:
> Fix the system bus interrupt line to CPU core assignment.
> 
> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
> ---
>   hw/arm/xilinx_zynq.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

