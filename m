Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4597CC87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 22:02:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbLX-0007rS-Kq; Thu, 31 Jul 2025 18:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbDV-0000VW-Kv
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:53:38 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbDU-0003Nz-3N
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:53:37 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-313bb9b2f5bso1467397a91.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753998810; x=1754603610; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DHXRyKMnzxg/6ggWhbwy4YLfYFbHnA7EuTegUc83CZA=;
 b=V2J3qZdLZVwLgTScZN/lR8Qxmq1Ueo5ZZnVliydSqjLLX/Zn4WP5Tki3XDR5p14/M3
 ko/NgjV689npEd48qWs6dEnm5CJ1Cmfrb0hAbtPR3GAE3fLOf66by+jxN7hNEGqm3s4f
 10/FbNWb160xk/5tZhO5HlWg4DxJ36i3Pss3X5iUZw1KQQxnESXfAYjnBrLVKHTCIrEk
 H9ON12KaJACTEXSRElJUaiYqPm16e2bbsa8fVzKHrNZX3xE/yEJLRlF1IZph3rRYf/Nz
 R5gjXo6MKkORARyYe15Tc0lO6ARvGI/7MqI8B2oSgQnqy9qJzAP66kSePfVbXYLCastx
 sqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753998810; x=1754603610;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DHXRyKMnzxg/6ggWhbwy4YLfYFbHnA7EuTegUc83CZA=;
 b=k3unxu3Ay9QQAXPjsdIZFl5hgiOXyPRw0kTSu6YYEBcWaCgWMd22loKQNIl9sfNqGg
 /HnKUVKQNtOCR/aKOmWBENyX4ZOvD4uRqyRBrBXLwdjw0As9q360VwzpZP+XzwwaOcEH
 rgtBmWHZO0lcWfYL2OyGgKcqTCsa3uVqK8MVlXSwrpoHjz72WhXrypzOORcDE8EAF35f
 9ChWGIfvXNlWeTd9jf7sdo3CNRPxWFAKgK6Pcp6r9Bkylf5qVgfyct3UHnHLSZHnNp0Q
 StITwrlFr6cun4W5sAl9EP2AGJkce4lxuN/gmOTE4VOzuBMWNHBMQzBHz5jM1jv8RNcY
 U4iA==
X-Gm-Message-State: AOJu0YzGGVBiYJz4wMamgXU9ZGjvTSqV3Qab2KNBfDWlhi9a9DAhw6Tg
 VOvC+sq0GHpci5BJcaX5vJiLhbYsMHM9dfJZJ1eReBsagE0ydXD0eEXOulmmAvriZGk=
X-Gm-Gg: ASbGncvzFE2PSZVR3ap8VJWrt3BJpV22jmKzkXcSwgvXM2iw9fpBnG4hG4T31XOh1uj
 q77eKa0NfbMp0npeg8MKJd0KIucoVpESwFjFkUX7D2guOzt80tVC0UU4khU3OW6OCDgi/njvMf0
 ksinA9+qPDStwjvPF1TVfKK/hLgnHbzY0i5fdnvuw+uQpOh4G7dYcRp2oSoeb/4TfgEYa70unom
 p/yT4ktrnW2oVsFscNYJXk9HQs6iK+QFeL5JLLUWvjrPIP7Gi+5IeeTg+1ggSrTx2N8fYjaDLgM
 EN1d4B2z1yXx7uzEWrWvQKYjgv374gsYz0RqSFDEzA06AYG0Z19t/KGYH2Z+V97A7CBFiQL09xs
 3u//C0pyLbpvSMCJ/wmubH7Lzjn7hx+PeRHk=
X-Google-Smtp-Source: AGHT+IHSf110swpQwpS5WzSpWbG7QFH3WHiWTmnyuSNRf8/OnqRfzvo5+FUIFrfdnVcH3dp1VUCQtA==
X-Received: by 2002:a17:90a:d604:b0:31f:3029:8854 with SMTP id
 98e67ed59e1d1-31f5de5561dmr13010042a91.27.1753998810353; 
 Thu, 31 Jul 2025 14:53:30 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-320806818b0sm2848350a91.25.2025.07.31.14.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:53:29 -0700 (PDT)
Message-ID: <da506bc4-d07b-455b-8acf-d96b4fdca6e6@linaro.org>
Date: Thu, 31 Jul 2025 14:53:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 71/82] linux-user/aarch64: Implement prctls for GCS
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-72-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-72-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102d.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> This is PR_GET_SHADOW_STACK_STATUS, PR_SET_SHADOW_STACK_STATUS,
> and PR_LOCK_SHADOW_STACK_STATUS.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/aarch64/gcs-internal.h | 38 ++++++++++++
>   linux-user/aarch64/target_prctl.h | 96 +++++++++++++++++++++++++++++++
>   linux-user/qemu.h                 |  5 ++
>   linux-user/syscall.c              | 29 ++++++++++
>   4 files changed, 168 insertions(+)
>   create mode 100644 linux-user/aarch64/gcs-internal.h

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


