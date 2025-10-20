Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6B3CCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 23:41:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAzUu-0008V2-HR; Mon, 20 Oct 2025 19:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAzUq-0008OE-VK
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:41:01 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAzUp-0001q7-4m
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:41:00 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-26e68904f0eso48766875ad.0
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 16:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761003656; x=1761608456; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=89zIpxTl84lAkkmrtDD9xBZQGR1ZTu/KuDU7YCtTn+o=;
 b=QMVj9ol8VKU42T15pIHAk5kIBQl4nYfJpB0JdOXS8Pw6YibL5MW7NtVD9d+qbMyWXv
 MhmUUn30t/FoQv1bNwSEAFFvtAPEpdMBSi8ao99Gt6dUlPEVEZQsT8Xw9aS5ELbfcC0D
 U8QhNozqzymdNFKERacm81bDXarpG9WmgxcxBU1p0rKEgusKgWHEQzY6oRwr4APuWwZj
 Bqs/xjKy1f582hakbepicxD/DFC7YcIg59JCpzE1lAFXNls+0xcrYA7WZaZxFPRAlMSy
 L2V+0nuDDsHlQew7XZJ77BosqBVFYbgl9OgdyJFSeJt6fpSlr0N6CsnQgZiHps79D+1t
 tFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761003656; x=1761608456;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=89zIpxTl84lAkkmrtDD9xBZQGR1ZTu/KuDU7YCtTn+o=;
 b=hEZj21bNWM5WAd/exFhSs9JM4Qzwf2v7DJ6Parz2ZxprMECRu1JStt0ANqb6iklRuM
 mbxxMyGQroW3S/9jZq43h+SpWsfSUgz9ag+B768w2VCu9u7aVMmbURFKpHZNzLJC+QbT
 9+9IvtPOdFcIdEiWOtiDrhvoxEZWjdPwKyInD2XYZd9VHE4O1bwNuwYWprR42UmnKNjI
 /A0SkIJrgAJI+WlfDCE+OzU1BmBEW3uI7wwb9vid04L1GCvDSPsZgLVNylpwfYmDk7Av
 uCc9mJ1kb0nuOUE1MEtKv53ycLWk4VCdDhQb9a8+bh/QFhZqQxtG15vhBuo15ZayIn9n
 cGqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFYFri2qkKPff360o4+GC5+71f1sfKDcmEoR86fKqhs95Es4XakL2ziE2Oos0/o7ySyYytl6DM8A==@nongnu.org
X-Gm-Message-State: AOJu0YzTo0vFjHDjBJ3GRH++KU1D4Ex+E8iBdORNobhPod07jShy3S/7
 eMO3D4ThY4+gYtr9FvS3eDb0JJ/jqLtbIOnlUwwyFA3LHQddmRG0BUm43fIP/dKpIds=
X-Gm-Gg: ASbGnctqxeHg2DoQlPADEKZsMZlUI3bn3sD9J5WCjX0/Fy6VUIJNkkFblnNdxxf+/UY
 zZ9/LiKjbmaxaxakAfAH5V1hMhK+NLiVhIrUEty43Ug7W1Daiqgme5FDXxOdtWEVPVrLtYvXWhL
 LSC74RC6EEAfJPTcKWlrF1THLXjno/bEErlu4ne93klweho9MxV6ICTAB5pm1aGaJwDpfgIx2yC
 8HK8kd57x2gm5fkbONcpLEpQxsQKAhIyrUGzlNEBGZxIvIBtZR3ljy0n8U9m6SPPgJxlnXoCyso
 OFIGJvB5Mp5Cbxga8jxjMzLTNNyMcVARDeOAO7YmjbfSUDvp1lRO1NEe/7/wl1EvrrSLwMGn9KB
 uOS9AqeaaNbQMapcmR8Chsto2FRt2XXwxj5QkMAPEMp4pyV7Ijm3dadmO0v/ES6o/pSHNso0UgE
 o+vWSF+ee3rPZkFaZ3YUx4E0cK
X-Google-Smtp-Source: AGHT+IFcUd4iUfAR/Ua8K6j1l80nQkXNBxU1Aw76CenzTkgg/hTYPtdTvD1Lq+fVcPuIldd9Kd+I2g==
X-Received: by 2002:a17:902:f647:b0:266:ddd:772f with SMTP id
 d9443c01a7336-290c9c89cc9mr179354515ad.9.1761003656100; 
 Mon, 20 Oct 2025 16:40:56 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471d5868sm90719655ad.60.2025.10.20.16.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 16:40:55 -0700 (PDT)
Message-ID: <2ef18301-d7ec-48bf-9f88-804ca460efc1@linaro.org>
Date: Mon, 20 Oct 2025 16:40:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 28/30] hw/arm/virt: Build only once
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Luc Michel <luc.michel@amd.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
 <20251020222010.68708-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251020222010.68708-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62d.google.com
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

On 2025-10-20 15:20, Philippe Mathieu-Daudé wrote:
> Previous commits removed the TARGET_AARCH64 uses in virt.c,
> we can now move it to arm_common_ss[] and build it once.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


