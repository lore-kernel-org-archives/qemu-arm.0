Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508DDCD5BB0
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 19:01:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQV7k-0003oX-RS; Fri, 22 May 2026 15:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQV7j-0003ki-3n
 for qemu-arm@nongnu.org; Fri, 22 May 2026 15:01:31 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQV7h-0003fS-Jk
 for qemu-arm@nongnu.org; Fri, 22 May 2026 15:01:30 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-83659d38e38so3148258b3a.1
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 12:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779476488; x=1780081288; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U9tzhWUk1KOVQ6fQ6Hxfk6N0dM12WxUlPD7OOJcV4+k=;
 b=eKCJv/wHALkRytg9hiLq1UkPoxsamJ1OZ4/zhx0YamRlplY0HMEZ67OoTsoVeYu/7W
 Tp7dcBoaW28e7tk0c0riQ9HconvNrWruKXgL/sNVO6l+Ex2whmg2h+r6i8NCxTHZdmYl
 vSmhae064V2+7cwNb4CZnhUSGmEZEGBWazuLq9R+38w8gJwn3cqlsSCIF+4orGgdNLf4
 xcu4hcf/PRBu2xs1yo+XPZX5fwqJyD5MPS1HYKdmIMm0IwvVoj8inEuSLlG1UIUEhBIf
 +42Tqt6PQuOfY7dwL8xEJJsuiGpBM+kA91X3+23gdsgTTIDkn4E16Gpr6DlfQ3PfAbDV
 xLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779476488; x=1780081288;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U9tzhWUk1KOVQ6fQ6Hxfk6N0dM12WxUlPD7OOJcV4+k=;
 b=fG9SQjZzwhJpwZrc6h6nEy3v3mQFXd8NAwJCw7LqNIisYWhpQ0Z2Uuj/urazA8AaP6
 o1JIzM11BRUcaq0cXJkzCVRCYDVt2mHFryS6DKJRVBpOkwlwRkNpEZ7xe9FoXj9qb3yE
 EF7GAGOV2t4fuxMq3S2OvyvyQJ+dHt7XkysgLNYs36P7nOm+IZhoRBi+nYjNxqHU+jXK
 ppyus6YPV9zT0veO6aRz1hVxxA0eIOy0tSJzlOPPzG46bdrUADfJ1w4TLyoQMcbBjfLN
 vlZGZZxjMFWWo4L1c82YA1M8EaS7OVWEX9ef9lavZaDuQa6QwHNcuZXGqFcNp4UdG7sK
 H++w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/2LCIJ3fUt8VcH6Rv8e/9tgUm1XbVr9btUcy0HsNbFLgL6AG0FKs1LQ67Z1SgwZVvlcCLpxwITTg==@nongnu.org
X-Gm-Message-State: AOJu0Yzl2UQsCgnq9K/7dxCcrTsgc8QCVoDV5eg3/wwge09mxKdQoDe2
 XT56KRCEAuV0uA2HAMHD/AibsVlwpfFmHHSHHvdXOE22Pg/uuIdeeYX5AzS88QT0Ccw=
X-Gm-Gg: Acq92OEnEHL3FQHXbO/4CFhlMiRm01+om/xu2NpFI0SDg6pl0M+QMFiJqR+R0dKJ4hJ
 AHFOY00MCZgBaNMkgirKXoDRCSAZ+2AS//g2uLx8dnQTJ5czRqBKVu7sIp5tdAevFak2xrYUule
 26nEuaz9pvMc9eov6mXyP7Z7HdLocbQIFI5V5hxCmVfFy5vP2/xCwicrhmNd9bU+q2SLjLOMziA
 9SKykwsgUSFAjhxCJcMiRzGjDuGjbBTnrEgeYctMvA6m3tm0Z8eidKytsd3+97uJa3q3Eaopsi5
 5IzQFjCyHYD621mqYHUQGnDFTIfu6YpI0pQcm5rXO/mndVabV4Me2fJD3AoLMds3k8QbbOcJ4mT
 RD3kkYD6vGSqV+w7pboufpyr0mV41GWPXiCwkqq885hugvJr4nrkx/sVEzjgC1e4zYj7WvWapmd
 BFyhw9aCeAuMFfFBKLeTu+M4rLjaYjVbuoosWhqmrq
X-Received: by 2002:a05:6a00:2d8c:b0:82f:29fe:7239 with SMTP id
 d2e1a72fcca58-8415f5bf78dmr4584630b3a.50.1779476487667; 
 Fri, 22 May 2026 12:01:27 -0700 (PDT)
Received: from [192.168.64.111] ([50.78.183.177])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84164fb00b6sm3316173b3a.40.2026.05.22.12.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 12:01:27 -0700 (PDT)
Message-ID: <4cb0aec7-dd0e-4308-9600-b802bd16a74d@linaro.org>
Date: Fri, 22 May 2026 12:01:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/64] target/arm: Enable EnFPM bits for FEAT_FPMR
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-11-richard.henderson@linaro.org>
 <CAFEAcA8ibw4o3R6eJdtupAc8o0Tk2N5iWahDHwbuCdoCLKK5CQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA8ibw4o3R6eJdtupAc8o0Tk2N5iWahDHwbuCdoCLKK5CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

On 5/21/26 07:15, Peter Maydell wrote:
> I think we also need arm_emulate_firmware_reset() to
> set SCR_ENFPM, so we get the "emulating EL3 but starting
> guest at EL2" case right.
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Yep, thanks.

r~

