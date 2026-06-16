Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7673FCD98D2
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 04:48:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZLif-0005dy-Ii; Tue, 16 Jun 2026 00:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZLiZ-0005d2-C3
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 00:48:12 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZLiX-0000P0-DB
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 00:48:07 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2bf2e8ccca1so25815165ad.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 21:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781585284; x=1782190084; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XP41/zPWtx24Waa7WN4pze6KNOBrY/fHGcoRrC6BQ+8=;
 b=Jv88NmicGTHULH6rxeCDLYjK3FgyP5gEZsEileuTzR1uWYstghgrh7Eghq72Lozqh9
 +vbLY4OUEvvwWZ7AmGKmT/FFmUyvJMkvjn1m1ji9NrwO8QbQV+Hwhjil8H9AoTgT0tDl
 U+L4UGialqksA/gxypugV/ijxxmqCMMvYwM4YrijSL0if5PioHAjr49eebXLzAWrzH50
 GQrkDWIKbrCE/brGuxGjMqKRfKLL6izv6pBZdqrGissXfoZnHHM7XOWFJ0ykrgyoQCo3
 rLkT2CGVI/wuSRP1QXu80rHm1vdSIKdhv8dgkNhYWAexsWgPNLVkYIDFP5+Y/PwGVUFl
 iV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781585284; x=1782190084;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XP41/zPWtx24Waa7WN4pze6KNOBrY/fHGcoRrC6BQ+8=;
 b=ry5XCfwPTca3h+n1WhoYlPOX90vAHwPhqZRS6cCQeetNjasOTf7KVf8Z65UBnFjjDv
 eAp3bEhAPp7MCwCrWGM5uWxRhHmtxobhy2qGF3fiGGh+dRXXUH4PPUhQzdLQg5kViqjG
 QkSp3ddy4TyAG4BpS80hTgrZs0XMH8sXUtwZqnEIqns3yPwTqAwNKmx3fLIO6OaLC0rj
 njLT6kWK0CD+e+X0ZfZ2aXEjG3wra2wwYpC1XcbN80oFScjuZKrjhi/UxjukSqMmt2bP
 HD+XGXU9bZC8+n1PbEYn1Ob2iJnNPmmj2fs1V+AEy0fj3439CFh42Rdg6XhzrU9ko2tt
 k2xQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9aD96GpwZdgyBWkfRbWNt0hpTHH43dhKTIAnu16Nm1IGtcDHBUDBooj/TFwM/UbRwTITemsyFwag==@nongnu.org
X-Gm-Message-State: AOJu0YxUUEOiEONd/dSFG7HIX6wtDpC2KayA9RAloZhAXVlNSHSl2t6t
 PBmhv8vlzRM8OFZJ+lh8S/+MXsEiu3dZQ4+i1xiuaF59whGDN+hLLw1dUmbZx+SNzKE=
X-Gm-Gg: Acq92OGdyIZMjaLIau2ev5ef3o4pzXiQlPwdrC38gRC5cwnafsjNR0EY5hdvWM/D2fO
 ccMsL+wFTBaffC38KDVmVQv6DPJ1eaNt9hpSl8c3PZt7ILbAZONBwnMrmR6Iwkpo63Y+/qLJle4
 L22oaA9U2IxMWlaJn0gAdHDVlUawhfjQYxxUUIj1SA6xEpDnaOhOZ+zKJY7J9Xf0QFFvBgL8Xs7
 JzV4v1umkTk792CAEdOLfPw7lxYAiX2y9+HnjPp8VKU2cfy/raHYo7S67M5wVp7YCyr7Ex5Kn4d
 CE5dQKH+zKaIoz3VsGIc4gYGvPz55AxD8YH2o4WkC4Co0XtOZxuewo4u7OtSy/Q4dPyWyJKcwlN
 tR2U5e0YWlPrQ6qnWCUw88FptL5qlN6ReeAxS1HwTtDu0bpzvgNvstDGX8/hFwecHqwVEekGam+
 I3cuoLE8VtNx7pw0XLyhI17AWU7yVs2t3knoeXPVbRvWEF47Idq92goHV7zkVJ0sxK5vOK
X-Received: by 2002:a17:902:f54a:b0:2c0:a746:7aff with SMTP id
 d9443c01a7336-2c69a186b1amr21202235ad.24.1781585283627; 
 Mon, 15 Jun 2026 21:48:03 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c432c8ce89sm118135195ad.57.2026.06.15.21.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 21:48:03 -0700 (PDT)
Message-ID: <0038f601-7647-4547-a67a-c6a17fae26ca@linaro.org>
Date: Mon, 15 Jun 2026 21:48:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: "Michael S. Tsirkin" <mst@redhat.com>, Gavin Shan <gshan@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn,
 shan.gavin@gmail.com
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
 <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
 <20260615105556-mutt-send-email-mst@kernel.org>
 <CAFEAcA9Gi43qNZoZcGtq8ioffGwOc_XuhoFAjGx7-bt4U8qfxw@mail.gmail.com>
 <e399ceb9-bc4a-4ba6-8efd-ed2742d0853b@redhat.com>
 <20260615154054-mutt-send-email-mst@kernel.org>
 <22d55870-b521-4002-add7-791bce8ea96a@redhat.com>
 <20260615224658-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260615224658-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 6/15/26 21:23, Michael S. Tsirkin wrote:
> B. Also on x86, I do not see why we should not use memcpy for large
> accesses if we can. Better perf.

We have an example where memcpy writes to the same location 3 times.
This is not appropriate for any host.


r~

