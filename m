Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3130001ejb;
        Tue, 21 Feb 2023 02:42:19 -0800 (PST)
X-Google-Smtp-Source: AK7set9rEBohSf8YDJbu3QueBfCMCVpyIpBkgjMkBvkd9rrvIgWjmjXWlKcarO55NuAMVJ6UvRiE
X-Received: by 2002:a05:622a:409:b0:3b9:b4f9:d362 with SMTP id n9-20020a05622a040900b003b9b4f9d362mr7261598qtx.43.1676976139120;
        Tue, 21 Feb 2023 02:42:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676976139; cv=none;
        d=google.com; s=arc-20160816;
        b=N7FZ9MSrLvuShNcKE1r0WJYck+upP6eN0mCa33d46c0zmyK1BBtSIrTzcXdRYsH53V
         emBeq1E0hzP1L0lMOvST0bfrJkpQ+p7EaePrQIOKShtrAM/rHyywGwi+hUYPAUp83Xl9
         xEiYC5q960OaZgn5VJ+pPgFCz1Ya1rUsvK3tjRtzKJnEiayB3qcM7HaIbGPFiKgyUOzc
         ajPXb7q8LNkCySSMzm6yMvJzZNpFxAv+IvB35N/rzaAgWUzfUo8KFVt9Cqsn81OLnDa2
         YqYndCyxOhEQQIS7OLD7vinWzdVcbXKAdRu+9bPDR3N/5U6eNqJJMKxRwo+6fcfBF8Kx
         9lUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3moPHpbvuIA9ByxiAvHIOIrfTc06CDbvVqlf7VsWaAk=;
        b=lRhwa0HaRE1pFtVmNS/CWNifnjQWxIJ7mvwG+kLVpfZv6orQCdltCJjWgolKGU9P1o
         i6DP+f0iOKv2KJ9MULjZ46jXoqGQNieB5UCtfgXym0wgbYDyOgH9xEjLhxJLnkGrZF7i
         r9NZ1nmKLc93NUP83nUb6XStfdS7G3Q1YF1li0rlrhrm5xnn70/44fLUs9xZrOC4mP1C
         AhlcK2OG9E8+nD+7aR+A7+YsbA3o+VxbgMN1GeqXwfjYAMvGnGN6fYxO7LcM0kDby5uD
         L5HUPOgJcbwJhJp86cQAj7GJzS/zsQYwXJ66MDj5sr/FAn36cpr9Oj5Uu3Ru36GvNFy7
         FAcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NhIy7JGA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020a37ab14000000b0072b8f05eae6si11491886qke.156.2023.02.21.02.42.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 02:42:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NhIy7JGA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUQ64-0000pD-Us; Tue, 21 Feb 2023 05:42:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUQ63-0000oS-Cl
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 05:42:07 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUQ61-0007pb-AG
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 05:42:06 -0500
Received: by mail-wm1-x32e.google.com with SMTP id o14so3213451wms.1
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 02:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3moPHpbvuIA9ByxiAvHIOIrfTc06CDbvVqlf7VsWaAk=;
 b=NhIy7JGAcd/oRywr4WfUYzxPiYk4AUcW+hAAEJdly26vfReTHfO8bUtHRB37+b/N3x
 aDqXxS9+08upJPm4tsKQv2ftzrEz4QpcR5B357JC5Ba+2edijeS+d1lfxpqwk8Re8ilS
 g0L6huD7e3jSoKys9iAHlZvJdITpyhxN7M+0TkCph0D6tb8tXKszOnJIgMCkA9GHFJAL
 kcSMMMNRxlEaEGgCL/STNZjYWtdKdCflO2OhhKyLFZSKPodkfiwBE1WQEx6lkAGweEM/
 Bx9xvb9WlSEyZmXjw2eBCcNUX9RRLOeBat5XolT/JDen08V+FPMmoCqxbOhsIzjpmm8m
 j2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3moPHpbvuIA9ByxiAvHIOIrfTc06CDbvVqlf7VsWaAk=;
 b=q/js3wYqCp/YxuGHuXegx6fYLjqtQ7Tkrw1JFItB4AGyOUTtN5b69pNvAXg54HqVK6
 wWH5ZFRlqzGPdya6BrjG1aPHvkImfWPpKN7zYu422nwXmLv+8xP13HOqKbkHlwhI4mo3
 kXo0oL6omoLFD7BqI8AAHoKG6mSG6Sd0XwMIfxHxTRBJU6jvEjG+0aNHjz7Oq6hOABnG
 BwZ1xK1Vk7ynyr19jVB8060kHTmaGSv7sdfILMNvIseKZDgx9BwsGO4rZL4C2sP80OLI
 whcYchddKYsmsuDGvrWrB9Egbz+dOBYaiZwkkJ9loxb8frtj0BibdneQ76Ksm5GiUhum
 D6pA==
X-Gm-Message-State: AO0yUKWu/8+VGzorMvsiMVyl1No7mpX7CRpv/FG9fXNNqF31FHrPZ7dm
 aFc+ST5vL0q7hpj7O5ZwmzZGWA==
X-Received: by 2002:a05:600c:4918:b0:3dc:42d2:aee4 with SMTP id
 f24-20020a05600c491800b003dc42d2aee4mr8727583wmp.25.1676976123794; 
 Tue, 21 Feb 2023 02:42:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p8-20020a1c7408000000b003b47b80cec3sm3369778wmc.42.2023.02.21.02.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:42:03 -0800 (PST)
Message-ID: <ac13c9ce-89e2-cd83-235d-be7bc0544284@linaro.org>
Date: Tue, 21 Feb 2023 11:42:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/21] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
 <20230220232626.429947-8-richard.henderson@linaro.org>
 <b1a5b38a-73ae-9610-676b-b27dd4c7195a@linaro.org>
 <bf06cdce-aa5f-98f3-4544-31d08d6bd55e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <bf06cdce-aa5f-98f3-4544-31d08d6bd55e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: pRcPqbovlplq

On 21/2/23 11:01, Richard Henderson wrote:
> On 2/20/23 21:56, Philippe Mathieu-Daudé wrote:
>> 'secure' & 'user' seem mutually exclusive. If we get short in bits,
>> they could be shared.
> 
> They are not.  ARM has Secure EL0, or secure user mode.

Oh, I misunderstood this field with user-emulation then (I tried
commenting it and my TCG/HVF build succeeded).

