Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC144C79F9F
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Sep 2026 19:40:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x4kd8-00070a-A0; Thu, 10 Sep 2026 15:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x4kc9-0006i5-1w
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 15:39:24 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x4kbn-00070x-C8
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 15:39:04 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-cbedf433a99so211705a12.2
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2026 12:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789069073; x=1789673873; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kemQVwMWo+Pmh7khYCCQ7xNNC4nVIU38bFca7y07Vik=;
 b=L+rFK/vqzDmv4+uUQbShUEjunIO2TK+sChuhSL76injF0aCYgWmJ7HVwO1YkEDmyiA
 4pwgLnSZDM7byysQoL+nh1mgtRxHVEhzPGqHAiHUdbt+sCubSOtiqHn2G7zwv4gZdMzo
 zQK1fh7BL76xu7yjz6IekSmBpNyK5Aq7+BWWHeNasVWp3a2VbAZgP//afC39z9x2kPu7
 hE6wDNCYbBPffYIMGTbSc73+b4Zt/pWHX0sCUjU+A0sjIkeGGcQhdJlO6/fi1RV9FLDd
 ZMYWlRZN2cL3zRKLG6Ul4gXhwGG6P7O46FMuqDbzsfM8stMBaDuOEMv21+oWbR6L0bJX
 RibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789069073; x=1789673873;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kemQVwMWo+Pmh7khYCCQ7xNNC4nVIU38bFca7y07Vik=;
 b=YpqwHT4sh6OeCeHQIOvDg+CEPDO2CebJwPe3iT5e00SRiV72mrSf6/5R3GlZrczBFp
 AEC7fwHcAure3LuG83v3tJTjbP8wsFOWcVb4zAAqwo613LwhRKR5nAWe9VPMbMt0xGfy
 imXlb+E29kbLaPK7V97keDKByUb3zCJWu4k6smRAIphQeI0NCipBw8csTC1tftQbkn8q
 DKvoI9N2Ieu7Z39TpnSokDxSvBaUvLyjOgfJlFL6ATzmIAvr4LXqZRlJ1I0O28uUCyU8
 1XdsIoI3YiBzk4Kpib8SUV925M1qkbzIghZIbrATYBU/aow/o7QYqrP8GgvkUQr75pws
 VZxQ==
X-Gm-Message-State: AFuF++lbWXAkfvphuvbjCJVM/LK7RZbBfC72YvO0yclNg+vp18EQ8c4j
 e4uT88qLnGWJdaAM8NNNeC/C3PwI/P5j72gVLniOn23UnDu93f7LQ3u5FGsyKrm05y6TDZxlACa
 cTrmfQgQ=
X-Gm-Gg: AYBFou0nWEnDTKg3V6KU1S2PF+sucFE18fx1sinmUNqZf7iJsFuEXECZhugg4clz1Zl
 BEKxWSjKrPMofiQxIJhblLSFyE2MWx56M6HMe9iHe3RFeGD2p96OCR2eUDTtSGbVeOHMq2P20fx
 VmdblnbJexkXrXzvZWwnZb0+hu5RT624wJXP09FIjoTQ2rJ9jFx+mrHT33cs6P/KzKZNlgQVBFD
 qNVhYdw7xjb1Ch6YbPPQ7MXjaRTwLLA1mI49hOe8Ts8ClxaovmanIgl4FTUmCF3V9cllaVCTSFZ
 hg4lIACTiHmhPre+cM3eUC9hPlcKhTqPyW/tkdmaiP/g+kSC26qHrRIxXzVASKEucT0XjYMBJy8
 eTSv3NqmsRyYhKc7ykKNNgfZUIhUEcF0xSvQNIomyH0/NVEAlBrHTpor+IfOly8r4FBKL6wYzew
 VA8FAVOahQbytP/WTnPPfThycHQ0aF9VB8k6BDos4vUPkYQTP24LUBD7WPW45fl8Yd3QT0ffPRh
 xuhjh4fe0oCOKN5
X-Received: by 2002:a05:6a20:a120:b0:3d3:ae50:97c7 with SMTP id
 adf61e73a8af0-3daed7dcbedmr574184637.20.1789069073269; 
 Thu, 10 Sep 2026 12:37:53 -0700 (PDT)
Received: from [10.171.0.227] ([98.155.112.169])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33ba4ed295esm270264eec.15.2026.09.10.12.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 12:37:52 -0700 (PDT)
Message-ID: <e0769c98-0190-48cf-baf1-e22d6eaf4602@linaro.org>
Date: Thu, 10 Sep 2026 09:37:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] target/arm: Implement FEAT_IDTE3
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260806173123.333423-1-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260806173123.333423-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Ping.  Prerequisites now merged.

r~

On 8/6/26 07:31, Richard Henderson wrote:
> Based-on: 20260806172709.333300-1-richard.henderson@linaro.org
> ("[PATCH v2 0/6] target/arm: Implement FEAT_FGWTE3")
> 
> Changes for v2:
>    - Rebase on the max-v9 split.
>    - Continue to ignore HCR.TID3 in v7 for undefined ID regs.
> 
> r~
> 
> Richard Henderson (6):
>    target/arm: Rename isar_feature_aa64_idst
>    target/arm: Enable writes to SCR_EL3.TID{3,5}
>    target/arm: Implement HCR_EL2.TID3 trap on undefined TID3 registers
>    target/arm: Implement SCR_EL3.TID3
>    target/arm: Implement SCR_EL3.TID5
>    target/arm: Enable FEAT_IDTE3 for -cpu max
> 
>   target/arm/cpregs.h            |  8 ++++++++
>   target/arm/cpu-features.h      |  7 ++++++-
>   target/arm/cpu.h               |  2 ++
>   target/arm/tcg/helper-defs.h   |  1 +
>   target/arm/helper.c            | 37 ++++++++++++++++++++++++++++++----
>   target/arm/tcg/cpu64.c         |  4 ++++
>   target/arm/tcg/op_helper.c     | 23 ++++++++++++++++++++-
>   target/arm/tcg/translate-a64.c | 12 +++++++++--
>   target/arm/tcg/translate.c     | 18 +++++++++++++++++
>   docs/system/arm/emulation.rst  |  1 +
>   10 files changed, 105 insertions(+), 8 deletions(-)
> 


