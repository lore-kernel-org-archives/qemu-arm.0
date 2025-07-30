Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A90BC87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 20:56:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDqj-0007hF-TN; Wed, 30 Jul 2025 16:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDPX-0006KH-Ej
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:28:27 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDPV-0004ON-S9
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:28:27 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-31ee880f7d2so268896a91.0
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753907304; x=1754512104; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mchl5aQJgXEcTBdFhrF4huPC8Whj59CsWg1DOihZU90=;
 b=j1S6FM1X4cleQAI0EHK/BLBpzK/nqxe1Smxz04LZ+l9hOCu0NVnl9E3uex7KrXHM84
 V9VA+bIoHdJSEym1U8By9fvEzRNcT4Rcu5jLT3U+lfsD2ViR2hSyA1pCBhdjlWFfTq0O
 6DgYcryAqO+q2wANw2j8hWywoVctWoIRq1mQCgMURgcDZ2X4lQN6OLsorYGcKzHTxb67
 3jD1kqc2hetLgtH7a4HamFre+EZSQLFTHytwAHWHGNCDV39zgFJxwAvaqIo6lOXdLJIP
 xMSPvATEdjzu/Xk4Na7kKuUxxNRPoBVgWRhfEdVWVytJiElv8/KjoM+p83QOC67iYJmv
 5S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753907304; x=1754512104;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mchl5aQJgXEcTBdFhrF4huPC8Whj59CsWg1DOihZU90=;
 b=LX0tC4ZuXhnl+3sg6MjEKMVOA8GBoOWmy6++9U97bF3M02ooJgGEJWRbbDRR8iZjyE
 eGwYiOj7wOuUGAdkAfJCkBsjgShRhzscAlxdL7ZNc+q0WchrhrGmKQsn2SED3A2jvtcL
 byNdYVzUdhbDImBLldRUF4JEJx2eTPAe3AXmnRwwOq4mrSFmuVMWUHXFWQJZMX7bjy3O
 0/Kct1LyHc0QJbnXjP1K4LXBMa4gB5Qszimd7G8edYtpgc4dp9t8D4AOMGB88d/dfLXh
 E3iEhPIPAjUcpW2KJS+AD47huawgdTxkR+f6ZBSbHK23u1diSr4O27RUIKZcGO/sM8CS
 EKwg==
X-Gm-Message-State: AOJu0YzqwK193GeMZgO405xWp5b0GX4Al1j68a7WN8HVWtLAp+k3Ak8T
 JSod6VVMapVMWtIKwEHJZMK6xvKzMIeOPd3EUehLbHCXMrpbg5xvymtNCkHAhqG4ZIM=
X-Gm-Gg: ASbGncvnYK5KFIVpUoCpMBeey5Y4l87ZLUgyVL/MOZwlKRhHn6qRoexS7IunNzKln6r
 Tnj0WQzsyduCX7BYVZ5MO2GHtLiVZfD8WndJNSGdAW5eXyHPcWN5atRm1h2wygniErzG0PVQ+8z
 CjOUFFDDmUM82VOWS8pth0/40Kck+4506STh4tRn4aVxKMNjiqEREAQJbegVWGsulMxBtbCgmna
 oxrEwEXjgP3Kj8DRrOJNKfXr+YlxiL8aNl60/xiZZpYhSXiVC7Bo87xcIx5yHLvddQPZn2C8nWQ
 FdxHCij6GSODiCbikWXWxh6WjYI7IqVJ583l4cd1obd8iM+gj8xSqdFMKLEH7ai8rj9+k+5rCty
 BoU2kro7oiWIgKv8pxV1F5jUp1OXzMbnEOcI=
X-Google-Smtp-Source: AGHT+IFA7n6ZMvqAk2gNrEFi9GMUdICC4HgviybEZXPYwCAZ50Tpt7we8PgCqI2vSso+ovNv3OtaOA==
X-Received: by 2002:a17:90b:538c:b0:313:f6fa:5bb3 with SMTP id
 98e67ed59e1d1-31f5de55640mr5919610a91.26.1753907304355; 
 Wed, 30 Jul 2025 13:28:24 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63f0cc41sm2743196a91.32.2025.07.30.13.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:28:23 -0700 (PDT)
Message-ID: <df5e8ce2-b578-47da-a82c-9642f2e5308c@linaro.org>
Date: Wed, 30 Jul 2025 13:28:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/82] target/arm: Skip permission check from
 arm_cpu_get_phys_page_attrs_debug
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-4-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102e.google.com
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> Do not require read permission when translating addresses
> for debugging purposes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


