Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D983DC87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 22:11:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj3Ol-0008Sc-Lk; Mon, 04 Aug 2025 18:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uj3Oj-0008Pu-JI
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:11:13 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uj3Og-0003Zm-J1
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:11:13 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2400f746440so38111095ad.2
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 15:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754345469; x=1754950269; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2ExL1PbGsktdikVmDDukpgptDOebP7w7lhxIOKCwfZs=;
 b=TFZfPCd/VMqwkSPZeGuStUFr8qhcKjeIFhwOyPoHyisFhk975uRsPXzmzVifQw6bed
 QOknHhCb/YBoTuoighnCTYuiWeUgQtTinNpGc/zlVMRbmbJbrQyxgxUZv6IIUaJkAB6c
 jP/W99He4mHAAaIEnJ+WarYjT2nEfxdO39jAkOCgrq5/w12ykmw9/9SOIH4Ep7UEboZa
 kgdJez9htWaMOHsynhUmf1bDtF/iJGvhKxZk7Bcsk5pVMiK+CBjXRL0V851Mpy1hgKEk
 HLMUNsLqLWh7SvgQKr+reVOgWfBN3DVlyq1rdR5el6CNWqkx9Ezzn8Gmg6QIg7bxWVZl
 nalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754345469; x=1754950269;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ExL1PbGsktdikVmDDukpgptDOebP7w7lhxIOKCwfZs=;
 b=J0+wMx5t9OzXD3QE/+Minkr3fHV+Z8esc/OzPjnbAI6E1Nikizig0/+mFxuNNXq2zx
 vMl6ipxluHqBJN0DUOjG1GBiCgYgRS/GfxxwB9l0JNkXbaPzrNaFTF7ilYiFElSyOodd
 PCbriCMyCS9JN/LTzjHL/VCyqFuVgCQQZ2ZBsOBBC3UPiiqg5BZpfJqfE1GRRIESOKJt
 mYj9d/mSxQ4neDasvl/BaJ2Illh/w6xg3/Egp3VJ9iIK7bz5qqedYc8zPyYZsBJSgnMM
 TxdWC2/vUnV1O7qYlglRy0N7NIJiL2AZ1jaFmVjOC/zAMHdkhigzDNnZp5P1X65lWcJ4
 HdWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqjtHhjQs3fu/FVFmQIMs4CSLAeS9XIgebKSbxaXGRXMocUX0QouKnkxTW9wFC4EEKn0OQNGIC/g==@nongnu.org
X-Gm-Message-State: AOJu0YwARdil5yohZO85UOX44VKyXJJsGlfOXwBxp4ZzRVeRsr2EkqlV
 NyPotd+oiwc/zdsY67ixpHpG+cbMPOKjgIERfGKH7akF1a7zNNN5pPHFt3LlLshOXoE=
X-Gm-Gg: ASbGncv4UN+mqyCBtyev/UZih3/IP5Fxu56rGFmG9ASHF4CRpbP/yQdIlpKj8ZCETRy
 SSJBK49oAZ1priMKVRt8yd9RV5MkzXMQ842avuEU9CY+8mTspzOiD8j2egimvKLjilY2ESAGcbR
 QM3kFLgUU+kDGAxql6YLHA2DW0FCI2oQ9M28fCyXUYmqt3Gh7F+WVkesjJMQnr3JfuJjxNCjXyp
 +igoiCGXS8hPL9ScIIq3vgoXYgE8R7VuySob8bCvBwmWN+Hl3bmHJNyKBUMkCSpnKfazjWWTyfs
 3YUspebMqZ9YTbaMhpSE7WjeqDLszJhyE+k/DQQDTMZOEPrh/85jFeOppPD9yCdKQVJ6tWEKa34
 HE3twLzZMMM8yUyZyOGM5NkO2zGJHL51vc2yDNQjA
X-Google-Smtp-Source: AGHT+IESiGmG2bg+IN9p0bES235l1f+yWdjw/hLNc9qQrL0srP5VJ6/WtJucLXmAfsMsUSi4ym1n3A==
X-Received: by 2002:a17:902:db10:b0:234:df51:d16c with SMTP id
 d9443c01a7336-24247047121mr178638115ad.45.1754345468717; 
 Mon, 04 Aug 2025 15:11:08 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aac2a3sm118048685ad.165.2025.08.04.15.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 15:11:08 -0700 (PDT)
Message-ID: <203c77ad-f427-4493-8c6b-0fc07912d5f2@linaro.org>
Date: Tue, 5 Aug 2025 08:11:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] linux-user/aarch64: Check syndrome for EXCP_UDEF
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250725230849.13026-1-richard.henderson@linaro.org>
 <20250725230849.13026-3-richard.henderson@linaro.org>
 <CAFEAcA-6vUEiV0_dQftMKieOSMdo=KgzXJGgttJik9tjVCekhg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-6vUEiV0_dQftMKieOSMdo=KgzXJGgttJik9tjVCekhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 8/4/25 20:25, Peter Maydell wrote:
> I'm OK with leaving this as a FIXME with a comment like
> 
>           /*
>            * FIXME: The kernel fixes up wrong-option exceptions.
>            * For QEMU linux-user mode, you can only get these if
>            * the process is doing something silly (not executing
>            * the MOPS instructions in the required P/M/E sequence),
>            * so it is not a problem in practice that we do not.
>            *
>            * We ought ideally to implement the same "rewind to the
>            * start of the sequence" logic that the kernel does in
>            * arm64_mops_reset_regs(). In the meantime, deliver
>            * the guest a SIGILL, with the same ILLOPN si_code
>            * we've always used for this.
>            */

Thanks.  I've used this verbatim.


r~

