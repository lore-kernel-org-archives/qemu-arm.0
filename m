Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C073C5DF94
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 16:45:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxSMM-0007UV-Bi; Fri, 21 Aug 2026 12:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxSMK-0007Tf-Fb
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 12:44:48 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxSMI-0000t6-0E
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 12:44:48 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-84a4d8fd6ecso1239351b3a.1
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787330684; x=1787935484; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AbqaBiunWuN/LvRZX1FaCwbCv223Zk9IBDABCk4POsg=;
 b=qq8EIPytYa/Voz7Gua0V72FgFgKBgjJ4xgl2jjCWqN0mkkzIABNnmMHXN5d/4MrWo4
 pd7DNF6fC45+iDky4XJ4zWA85+5N9nac7H7Cs+3yY8TxdDcM244QxKxN/gI/6IoUv5rS
 sX8C+i+JUdMzC2snzktmlrrGJEXk/yYhMcz0FB+AKs7jaPLR98fkfhgcpRZ0gvbuZc31
 V/CH9eNUS78BuvrfuVZdFVpaEoepBj+FLJJrIvs/jTTonIuRUQ2cHOwhr4i0PLy6ZAzD
 hJwUcSxL2jMWMIgA/Kvt8Dky5OJ2Ww2AiZJ6Nz8LVHpwijTCsk6eC0iDzaznZLm3Q4Ww
 Lo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787330684; x=1787935484;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AbqaBiunWuN/LvRZX1FaCwbCv223Zk9IBDABCk4POsg=;
 b=QqwPWxlAbkLAHTDh4VsIFXFZDVSNa8K/3aWItOHmYIjQBhpUTRk2moSpOktTpj28I3
 lNC8e37bRewiN2XvxJBJV+3YlXszQLyfq6wHP52BeKuCmKJ0gMDLwFOD2IOUUfn0ZTZ6
 5I/EoPn3xOPARhGD0sAsFesTgPepXZsJOrV51d3PZvoBZ/9Byw/uWCsQvFNLl4Ud0dC0
 JNBnC5doAN/ApCD9v4H8k6rAnqqQCMmA9zM8ziXzjTo8fksupDb7Ao/e6kTVzyZZqWvj
 /5v81lU8vv8lioI66hR9sxM8p/9rpSzHi2o3bpnEyTdcOK4GskYx5d7DFjkjZYpEKMfm
 kL1A==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro/roYcN/whTWjVxu4B+rUU8uSag2eYLnhJmPEdhQj0IgKqm3mYCvcJgxWJgFDkOKu3J7SVTnbkIQ==@nongnu.org
X-Gm-Message-State: AFuF++nzU3wGqiIgv1uJM3etBoZrkbfq2jrOvy+LsHCa1hVHKE9SL/2u
 q2hfvDtcDGcxGBbjljjDlNeSOP59lfAKgqJdO+CmdrX1cRAAotw2xmwAunMkvVqsK/o=
X-Gm-Gg: AR+sD13DLc2FdGi3Gg0l0vCvofBvmohGbKc5Ae8ych2gPSwmp9QgHVYivuurOnoXSuq
 bTNbzcA6RTUC+34hMnnnF5OFH0r/JIMS7PTxvq9h4MW8MGPor7RxDNQI0hZrHKUWgSfmV0xJ3Uf
 pqEnJx59S5xx5ouP2ipXvYLT1BFuKN7f8/Xrf1EJrA/Y3ZHbly8Ldc5FohjN8tM7OVofeb92Q2O
 Ias0MCyzDh7Bee+rFAXWJmTnQ7oGkvQkR9CVhRc0pdoM3t07QCb87xkei+eBvK98AsY/E92cOq9
 rlyl91RRBwAyq7cflJveg+Ltg9vWq8pRfkdPKrRrZp6QSYui9ROuZU4rwtmPtzW+6oFXr+XiXcC
 w8qr4dHoGrl0/ynyTA7E6/pysUk49oEVbvVsyEpXoFsppnQdWSki9gMKvUfzLuYvTE0RYADL27L
 wf0ZgMPFKrtATGQDXQo7vCVVuvTt9huO5hzKFw/hLvpKmAYHSRm+GFn7CTjonozVog/2uaPwole
 uU+
X-Received: by 2002:a05:6a00:4195:b0:84f:b01d:3693 with SMTP id
 d2e1a72fcca58-851fa05af7dmr13403307b3a.15.1787330684425; 
 Fri, 21 Aug 2026 09:44:44 -0700 (PDT)
Received: from [172.20.6.168] ([108.174.179.84])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851d366d65dsm3271690b3a.50.2026.08.21.09.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 09:44:44 -0700 (PDT)
Message-ID: <c9988841-9b74-4274-bf54-b7f5d411b70d@linaro.org>
Date: Fri, 21 Aug 2026 09:44:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] cpus: Add const-qualified CPU environment
 accessors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
 <20260821104950.32108-3-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260821104950.32108-3-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/21/26 03:49, Philippe Mathieu-Daudé wrote:
> +#define cpu_env(cpu) _Generic(*(cpu), \
> +        /* We validate that CPUArchState follows CPUState in cpu-target.c */ \

Out of date -- currently in target-info-stub.c.

r~

