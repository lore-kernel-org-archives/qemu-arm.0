Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7DEE67815
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Dec 2025 19:49:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vXlu5-0000UD-07; Mon, 22 Dec 2025 14:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vXlu3-0000TU-4W
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 14:49:11 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vXlu1-0004sI-L6
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 14:49:10 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-34be2be4b7cso2844121a91.3
 for <qemu-arm@nongnu.org>; Mon, 22 Dec 2025 11:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766432947; x=1767037747; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4RDqC2s5Rf7CR4RPBV2y3Y9+CGFfykEDEtuoCILmXic=;
 b=sxEPE6+esXhaBRBnO7bVTqw5LKp99AVKiY44fV4/sD0Mjayx2BzuhtVjcXo+5RzpDV
 7BQpAoE23TGa7fch69KWUDn6yfsnBpvK8wYdUB4zLLc0lsQtzPIMpGUTvCvejSWN7ZuT
 xj1l8gGek0Y113de4oqFdlr2RQCUhWnvlvKbkJZww4UKXj5+GFknUikrnBppCQ/KQJBb
 ZvIh84fs0YAdOcDqjGi7PJQfuUAAIl/O99p5gK5UcDASPHQV2K+bEmgR4zOkk8e0oAh9
 elukddrTptFIAWAMQeszB3byKoH/xcMJwD255sVs/aVXNX9O6dyWYW877lSk8pwJmSYd
 gNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766432947; x=1767037747;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4RDqC2s5Rf7CR4RPBV2y3Y9+CGFfykEDEtuoCILmXic=;
 b=SEQxdbymIR2WBZW1moNP13rYWg59subNEDpn+Vc7X2e4hehp8ogfoLpHXOLWCw77LW
 mgdTqxbqqARs2yVlvKiuFFvLxfLJdd3q3+yuDURlBQU/Xsf1Aq+fpjvRaa4cOzxVaY1J
 66lPHXxLvtyiJGbo9Pmo2nqM+HnM3ct79MJm0S9hzZwCvTIjBOG74KvJ6UMQGvycDdT1
 IEVTlCDfyliloLJMuuy1RtBdUFa68sAjU1oN//CI2JT2eBuc0C/TZtYWrLdzIZrkLd5R
 LMQiDhYiqoGvZCCk0aQEl7gbGa48aiVGTOlz6zfG2LXVitcO7wk55hG1romFbBMBOoN1
 CzJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV30CuAyuveQ0XxLLBTWeIF3Fj7MId+6vWYkXIZ1r+MEabirf24b/tT9m7DYyPTIMfddyY6CpkPYQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy0jI2lgv7BYTav+e3VbF+T2HQqVLgttabBzoor6PgDy7yeRrP8
 VrhdoEMy847uVjWz/W3ktQDbgordbWItQQxe8VjjnhrXm4TQe8Dsd0NzSmxXzH+0C4w=
X-Gm-Gg: AY/fxX5RiA22azHTAbQZ4gj7B/VjbdmRWMqIZ/YAdVw8poc8B5aIsp/mrlxpGuzJMwF
 zhVDrmZhtin9nT5fECijegoLzcQBsOKxzOKyN2WwYMWFS/3MArY/rnbFy6am6QwVU3BCD2lHyV0
 DMjo0+SyZ4ie6DNX9soyIvw1Hl/AoDOjtBf7oRvnnp8V9thYsftb4iNjYvy9Qv6AhRuCL8rw+aF
 OL8lgTyAM5WNj6ypQasVIiX60KqJDtsVoKSA4Jpv7yuxw5pI4pIMMVP4sLVOWIEWx/4P3aAhZjQ
 Lljmt6Iq0cSZfS3y+h+gM+85oPfaSq+DE12edEMiiygr8yIBGl9VRvEE5dis/b7nHkA/PKjv2nA
 lG/fyJl2ruLmgy6tOCNUHHbD6VSQz1L/5BSNtwtW4UQ1vlAwqp0tkCM3TqoiQlTGtYo7Nt8qQRW
 dmllunW8DnSL+dDPMrxqn7C4WhDOnDPZXaNwwl3IfXrdIomNCbOYxOlKE=
X-Google-Smtp-Source: AGHT+IHeK/OpXJbJiRVUu5y0Ij/X8x4UHsFQcuPvEpk4f7EGOJCSDOZug8PzwsZnEcpcLo4tkR285w==
X-Received: by 2002:a17:90b:2246:b0:34c:2db6:57a7 with SMTP id
 98e67ed59e1d1-34e921131b8mr10360572a91.8.1766432947390; 
 Mon, 22 Dec 2025 11:49:07 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e921b1666sm10660841a91.7.2025.12.22.11.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 11:49:06 -0800 (PST)
Message-ID: <3b55fef2-4f8a-4b4a-877a-737ce39a86af@linaro.org>
Date: Mon, 22 Dec 2025 11:49:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/12] target/arm: defer creation of gdb register
 until machine created
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alwalid Salama <asalama@qti.qualcomm.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mark Burton
 <mburton@qti.qualcomm.com>, Laurent Vivier <laurent@vivier.eu>,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20251219190849.238323-1-alex.bennee@linaro.org>
 <20251219190849.238323-11-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251219190849.238323-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102d.google.com
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

On 12/19/25 11:08 AM, Alex Bennée wrote:
> When running machine emulation we may create additional cp_regs for
> things like the GIC interface. To include them for gdbstub and plugins
> defer the creation until the machine is finalized.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


