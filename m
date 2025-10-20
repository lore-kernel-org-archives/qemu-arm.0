Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB34DCCD19F
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 23:02:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAytu-00055a-Th; Mon, 20 Oct 2025 19:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAytt-00051i-7u
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:02:49 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAytr-0005sB-F3
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:02:49 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-782e93932ffso4195521b3a.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 16:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761001366; x=1761606166; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z2um92yXr1aIjgkBdR9GQ5+cVtbbBFhBD83xlz0b/hA=;
 b=znI6V00BI6jYAwVBd8VD3y0NP81q+DxONSn6NmOVp3O8h4G/myqVlF1nkpbANHdzNj
 7zrd8LZX7XEsdy2EDsg6VuJtWjjHC+Q4b6WpWsZLNwkhBqv+hKHJhJPZRh+CivaGMnxp
 mW0RUeKQsMb8xd+Ev3CNwGW8vEhbsJSmZ4koPIvV9IbcqCrux1Vgwi6Ha91K/3N3xCLQ
 LY3jUsvjI5/dElpChClGyqkRNCEqQgk18N03EkZpP70HX2uAll7eyyHZoNG592QEC0hX
 5PrtlFYlOhevrIRHbXiJNrbkrmn0dF0EbIcXRjYJpvQyODX3x3G1i49eKB+Qf/KvbS19
 0xPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761001366; x=1761606166;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z2um92yXr1aIjgkBdR9GQ5+cVtbbBFhBD83xlz0b/hA=;
 b=iNSS3XGtvOwCeFfCZjbkjXi5gRMkX1uNR+Gz3p/7oLGeK+R3AnVaf6mT7lqU9C0xf+
 Il6xkiXOhpa7uYoQ5ORMXEc2Bz8/7AtgsnZ+Ls9pAOpr21Dh0ULbe0WQnVe3AGBcnk1Q
 HYHGB68hAGxkttC1esyLIhDCI0THv9ZPjsSCZUnFjaLbWrEeKK8tL7Eh7Jay9IOVq5zT
 +tQoxKvBzTnH11Fh39OBO5HtE7Op8kXraA8PRU0KPu6woSC1BMwYPD45WKsEFAlt0ugI
 O7TsJekwZ3gPJLf06MSutvtDq360BM197gggJgJhGuBTEq5nrwDp1LzFXSg3z3cAvRK/
 UkPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUefEcxDrUcfCd9k0D6cJ3HwXAaB6xMaJHRgwSauwRaJbu/U00+oCnPvtxnJavKBvLQEwn42M6PlA==@nongnu.org
X-Gm-Message-State: AOJu0YzpPnJ39nK8VKzZ6L13G2Tv9XAO4Hkbk0kSZKNbLxGMByT9hH07
 T3uOpvhe4gN+HIAbzEgoXi2lO8Bx9N+TNz2kqh4BGmqmYf5d/zWpwb4DnniCzKN1k/c=
X-Gm-Gg: ASbGncsubcAINcNIKTrb1O5WdO4FA6E/OSv5cqA3yS4qMUOBYaII7sItIrOXlu3V7eL
 gbl6EqPlK3J7VPk9QSW4PF6eSx2LfTCLEHyIa3sN77mSLlRcbZRmhEubmnh5fb9GR5nsTmbsNzm
 HOUdR1Jcgc6dO53+DBEm6aC7UtdAw2MU9ZPvL+96WEyE6SlaUqJhvVyaSWSfDAlhwYVMksgK4Ug
 28DfItokAQQjHvli4yOwMJs6FhQwHefYfmqbzepxioDZ0t3rClHlO7qn3NlIF/7AF0XAeMzVW0S
 9ZFghNrXrZISQ35V5amq1p/MBnMxWNfrxPdP75yqzF9aX7IPY+V1LinBL5GA7SfPeGNYlcGOIBu
 NGTUBhO23Q9wuEeuhmb9aKA921ok04dOv3j2CkB7lUvurHoDXqDvn1tR5DYXAUQ8Jl79H7koPSm
 +/9/04kYrir+kRWg==
X-Google-Smtp-Source: AGHT+IEBIyQN4SCFFQ7hdXsAs4JWBKK2NtyulPAwRd8PaO/NuVZIubmQec1t9h9KuJp8t5gwY+wKpw==
X-Received: by 2002:a17:90a:ec8b:b0:32e:a10b:ce48 with SMTP id
 98e67ed59e1d1-33bcf86c996mr21051673a91.12.1761001365852; 
 Mon, 20 Oct 2025 16:02:45 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33d5de14becsm9177503a91.10.2025.10.20.16.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 16:02:45 -0700 (PDT)
Message-ID: <f853622f-ac71-4e17-9f64-699e91636da2@linaro.org>
Date: Mon, 20 Oct 2025 16:02:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/30] hw/boards: Move DEFINE_MACHINE() definition
 closer to its doc string
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20251020220941.65269-1-philmd@linaro.org>
 <20251020220941.65269-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251020220941.65269-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42c.google.com
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

On 2025-10-20 15:09, Philippe Mathieu-Daudé wrote:
> Code movement to have the DEFINE_MACHINE() definition follow
> its usage documentation comment.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/boards.h | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


