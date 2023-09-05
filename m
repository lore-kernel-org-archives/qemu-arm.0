Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp2159907ejb;
        Tue, 5 Sep 2023 10:20:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyCFdrQiza9tTbE5PiY79d2MaroOmdWx1tgQarVXukIhYNna1ueVyU89fIVFJ74L+CzetC
X-Received: by 2002:a0c:b455:0:b0:64a:6ae6:46f6 with SMTP id e21-20020a0cb455000000b0064a6ae646f6mr12403674qvf.2.1693934431680;
        Tue, 05 Sep 2023 10:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693934431; cv=none;
        d=google.com; s=arc-20160816;
        b=Zod9s2vbsbuSECowVezxuYbGy3tKJVyOkmn0pjDqR85nE5c282h1q6NIrXOi8y3AVl
         6i5TiCw4PB+bnrU46BRt+/bocnVugkPn1FTmsBrILhQFb2EUswqyvb3LnUSU83rkNAhv
         ZXwpjSdu4vqzk4xHphRa9pu2NIatzkthu5W8NM1dgQ9ZYGQGtnSzHThW3NEC0pXDGpTg
         LYmLTdP4youEaQ3s3cZT2JE2r/rh38VzjgZhtt1XpCiubkK9B4ML4EOWl+MYz+ImZY3Z
         q5uaTbqCxZldxao1MV0GxVaL2GTGJ2I+IhPxSunI4yKh/FfyqWz9l6UHFCwfQjaHzsC8
         tb0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ebZrz4bGd3XrfRekrLWO/sRf0ku+PeLQyVw4fgFTXVQ=;
        fh=ihGpZLYtTVJABlhQvXOjtAXrYdHhjwm7sfZuTce4v5g=;
        b=UOZitNiSGhukFqlD2hcjGOA1Lli3VfsyQ/a85Ve9BZKQcc/Qt2BMu3ur23XGy85dVW
         8/sAszGnhUg5xYF5fbKtNbl7rqXrLbFbz5nhVTM3K9pdQXSPNWOxTTv84u8GVVEuEzgm
         KzfQTjK00f00lse9Qk67rWMpj7EUYiVedwK+nFJBDUfZ+1l65H7dH9rZ2mjmq37uHxxj
         ++efgiRBLxtBnO0mElTZGfbFfHmMhOHRJhvAWEWF2aQlXWdvubaC4GpXdmzCvfuwHK5B
         AFScMJ8CBCSa2tYeo+hbUaUL8YY4TjQpeRvlIgqPqNFS53ii1+wYxDTcTw27y37MTwiX
         SqDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=id+CdfY7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17-20020a0c8f11000000b006437df19eb7si8403141qvd.420.2023.09.05.10.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Sep 2023 10:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=id+CdfY7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdZix-0008T9-2D; Tue, 05 Sep 2023 13:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qdZiv-0008RO-UF
 for qemu-arm@nongnu.org; Tue, 05 Sep 2023 13:20:21 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qdZit-0000tm-8s
 for qemu-arm@nongnu.org; Tue, 05 Sep 2023 13:20:21 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bf6ea270b2so14077715ad.0
 for <qemu-arm@nongnu.org>; Tue, 05 Sep 2023 10:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693934417; x=1694539217; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ebZrz4bGd3XrfRekrLWO/sRf0ku+PeLQyVw4fgFTXVQ=;
 b=id+CdfY7pLgKJz3i7bZdEuBYSVA8hnyKYtmx5Elh7QefolPVBiBMAzNb/e2Nr/1uaq
 1K7Eqojnps3IwPrze8TkRWdoJZtQwgka8Mq/szCKBDgxqy7Rm1+RpQd7uOUq8IkcKatD
 OJAfZ99AkEQ7K8p9zMkfe0fCYgGN6UdnCg69B1na0yDMdNizrnQt7w/P4CRTS0Ul8sly
 JaT9EgWbzQjYGjJKf23ErUI7QS41tUrkUJZOkUJE4NUcy1yjzb3PI5imY5+zfqs2apvF
 mBzLMoK1qTgv9YcHoPpTSeYL8ojYGgz0fZIquxoHiNuSkLgm45qTnoxjtTte2XYrvAxX
 fPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693934417; x=1694539217;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ebZrz4bGd3XrfRekrLWO/sRf0ku+PeLQyVw4fgFTXVQ=;
 b=DcDBonGTzF78MDu/kKmX5WbZz8A5lQSJnYeawZSEEmjb/gK+rg5K0vK0EAWZxqxrtN
 vIE7Fix2LCYkwh3AnMpAOMMvD25B/QZEmayptAuMgWg+qxVJMfVPs1pV4B6+GF03GlqE
 Jbxu7ZWp4iPwnVfOQZVuq4cz/9LrPrUiKgFN+/kH7jgR7gTOva+kmAk0Yx5aHzfYu3c6
 Nqro3b3c826WArHdmC5kFUb1rc7vmLpJDEG9BlZ+xAwEQ0ohHHP+5TsY+RNm4gzDaeO+
 8pfusabllv2DI2IG4B9Dq1FDez22yF7XQkUNIxYgyMOqQHV4AU6WE3yCCjHZytou37CN
 6RNg==
X-Gm-Message-State: AOJu0YwP2kpiwBEOfDDWQO2uKxQs2gZCl+K1/PvBbAUrj6TTjMlplMpr
 2nuPdnTxc1aNDWvW+dhS8KZKjw==
X-Received: by 2002:a17:902:c952:b0:1b8:a569:f980 with SMTP id
 i18-20020a170902c95200b001b8a569f980mr11022473pla.65.1693934417493; 
 Tue, 05 Sep 2023 10:20:17 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b001bba1475c92sm9562920plo.113.2023.09.05.10.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 10:20:17 -0700 (PDT)
Message-ID: <2b603970-f098-7758-2889-f21d965daffd@linaro.org>
Date: Tue, 5 Sep 2023 10:20:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] hw/intc/arm_gicv3: Simplify gicv3_class_name() logic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230905145651.8199-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230905145651.8199-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: QNIhcL/1B2jr

On 9/5/23 07:56, Philippe Mathieu-Daudé wrote:
> Simplify gicv3_class_name() logic. No functional change intended.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/intc/arm_gicv3_common.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
