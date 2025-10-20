Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FA8CCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 23:02:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAytX-0004jJ-RX; Mon, 20 Oct 2025 19:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAytU-0004ih-PW
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:02:25 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAytT-0005pU-4M
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:02:24 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-77f67ba775aso6389393b3a.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 16:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761001341; x=1761606141; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lKQiBx3avU8YZ9m2YOG0TV0wASw9xoOxm5btFj6dHr0=;
 b=a0wwsFxx8NN7P07dE2juNHVmFaZk5gwbtkYtWJ4b7gQ/piavKZTZ1rQJ1MWP+QGuzZ
 5H3kzjustYORN9NOQY+fHakcwclw9w6/haUd7mx3eYhRANGbVmZZvWmio9BdBVBqfEXv
 5XsDVIwreCyw5AR0JFoYVEqsJU4JAco2MmqDKhTn+V+je94GDEgdWaSl+Hpr6eMaPBuY
 k1lYlO3N/XZ4dNmjs0TOdHzzOG3PtkfWpTY2twBSYJYnrb+q/WqqwHEoJs+F7o0Oq9Sg
 0hDTGr5u9ytXHXL4rzi4myCp62pjNBfJNm0SbgtfulgP2Ln8I3XsJRAacUiey4iaknLo
 KEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761001341; x=1761606141;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lKQiBx3avU8YZ9m2YOG0TV0wASw9xoOxm5btFj6dHr0=;
 b=ej053xYGQZNZGYXoEFGgWOsVuvy/AVLx8/6XeFQuhDNnBpiH8Fe+DNtIaJ8SrspQwc
 ayfo+a6x8f2Z6S7UbZ2ZU7LFkiamthC0ndqmtn/QWT8828U2aSjZMOx1Us30U7ZwtPPM
 UXlHOsqkYOfGJjWsQpzUj9xDROJ2IZVgXwNXFT2y+W8mvqjylwxLMFN9UjggtRM+2GLD
 JJH4dDHgIS4LmU0DKDdqY2MgHUUkgcYIF8tk/Kw3z2kpMQX0LTWjk9zpQOl6G10G+2aW
 ObZmufzqlmQFWz+efysWIv332Q8LNJ+utqQXDaBqncA2EQK7WOOYgr90rGx8BTzZ52kB
 Xctw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIyNEL7XexgneBgza7C/ug+COtMM4rioiILOEZSTW5cG3uwfgfmxJwsJFfG1Xbe0nJKoj6aZ/puA==@nongnu.org
X-Gm-Message-State: AOJu0Yx32iyP7bKJfn84bD7OMMJbpzBk1NLfwBlk8CzRzpCFSRAmFFIw
 9PgVsEMynJ8Rpf9sbzRTMEKqgZTW7YBu1DpfDQqY4lF+Fw3IiVTrBBybYy4IAscozdQ=
X-Gm-Gg: ASbGncvXgzI20OyQyfpxcDQOlH+GIv2cywQhKpxMimYAIE9n9Sw3ziSjhA+14/znnRM
 Jq4P8p+ob7hVa0QJepG15OjStfnJEjrQUY5fI93LeiCxiIDAB5J5nrsbRdtvB6pMur6cdkSo0gW
 IkeVm/2915XSlAhXD7vb46Nlhe0vEEr8pKnG5kmwCG6LEigrnBixEd+3wm90QVEPtYtUqc97eZh
 44LrUvrJ3Cc6Md7jgUHcLev8SbwG4dEkEWvFUqFoFVvIIBT5c+W2CHDqyR2QcV/QWYForH2fHs2
 JI/SKxyU+Aud0EVUT8eirxtKZbMz8sJzNPnXad0W9ziK+6as0xPS8+ForwepMUvT+WpMbtJGbrx
 HiPMxfI1JVsdKdfpaZCOAFVqHm/q3ech6m0pLTf8IiDYeOeO3QDN+smC4aJOLukCi6SYbDk83KO
 8B9MmU1gpTIGfMnf98NdXN0dW4
X-Google-Smtp-Source: AGHT+IH8M+1NSIqEwgfpM+kkITpLxR+XrCaSz4MoGC8fqcsZk0y39HZ5IrUf9IBkukGARrCWO+/wSw==
X-Received: by 2002:a05:6a20:5493:b0:334:84f7:5646 with SMTP id
 adf61e73a8af0-334a8650262mr21096957637.58.1761001341286; 
 Mon, 20 Oct 2025 16:02:21 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a22ff158bdsm9626215b3a.16.2025.10.20.16.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 16:02:20 -0700 (PDT)
Message-ID: <9c1e6a3c-2ef2-41c0-826e-88d5d0edbd25@linaro.org>
Date: Mon, 20 Oct 2025 16:02:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/30] hw/core: Filter machine list available for a
 particular target binary
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
 <20251020220941.65269-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251020220941.65269-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42e.google.com
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
> Binaries can register a QOM type to filter their machines
> by filling their TargetInfo::machine_typename field.
> 
> Commit 28502121be7 ("system/vl: Filter machine list available
> for a particular target binary") added the filter to
> machine_help_func() but missed the other places where the machine
> list must be filtered, such QMP 'query-machines' command used by
> QTests, and select_machine(). Fix that.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/core/machine-qmp-cmds.c | 4 +++-
>   monitor/qemu-config-qmp.c  | 3 ++-
>   system/vl.c                | 3 ++-
>   3 files changed, 7 insertions(+), 3 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


