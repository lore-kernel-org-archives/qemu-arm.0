Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46041EA852A
	for <qemu-arm@archiver.kernel.org>; Sun,  8 Mar 2026 15:33:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzG7p-0005h5-PH; Sun, 08 Mar 2026 11:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzG7K-0005Rp-5V
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 11:32:36 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzG77-0006Cy-Lk
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 11:32:28 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4852f8ac7e9so14696815e9.1
 for <qemu-arm@nongnu.org>; Sun, 08 Mar 2026 08:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772983936; x=1773588736; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PrN4p/BD/fjYdU3wnZYTtnTYrSBl3tFrk2UtfU/gPkk=;
 b=S7edNOS2vPggKRoA8E8xBpo1c3CBTU9And1t2aeTxMKwkAhSe6Erds7i7IJtX1uZHt
 DgOG1x7yOQ8/NPUYtGnqAH9NoRp3SCMdltRqSId6EbQZDttO+PaXui+ttwyPB1+BBrtt
 mXOMO30zhdCQr2EIpqBRnYq/NJi+9JWkkpWMGT8x8VZsBV/KFLonq/QBM+y9X73AZiMM
 soENE3aqZ5ISgDQjf8VznD2yyrGVtcBRNL/D21krta1DGgah4IGVcgNXcn4dhFltQPI/
 JFuQsYWP+GnstlCQdCzyu1DRNXYSCAtiph3r2H7exWDiJXxp0sV2SktZ3lGspEfJpXsL
 uTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772983936; x=1773588736;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PrN4p/BD/fjYdU3wnZYTtnTYrSBl3tFrk2UtfU/gPkk=;
 b=eHByKSatDI7hx7/UYMzJMu4yeZbhImcybYzpJZvLPIf69vL/3Q2lN1cnPMJb06f2Jw
 9zyWhcJy2f60TjumSP493QkBygb4kQKaN7UYFzYhXsqD+6eHrjlpuFNqTDddRnSeSwK/
 B3RnvMKi9mJbiJRD65eJ+LOeln71ilcS15P/kgpiJtxYPduHrgZfEia7ZbmzkmbG72q3
 7AnY1HKbY+lQP09YZdNFAA3KqE/6nGCsH6yu0lz/kZk6hDJJnrpDUQZxdQJkVrxNnKUy
 /uODbfhH+ccNp+0EvNYVjzYjXOKHMIIfetj/6eKffzIKab9Nl7EqYUrZRvdgXyzskCKg
 b6aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqRXQtYXm/Bbcqs212BV65p0q4sJ3SRNDWoOrsZgtwNo90HjpDPmThMd2lwS+oaQaxXn9fa6xeIA==@nongnu.org
X-Gm-Message-State: AOJu0YzXNE5wgydZV6gVwQLdCWnwIvClYLQ3bDGFVGO08fhqSejeRmov
 LyNBWtM3AC44/jqsZvWavbjcifQ2J55oOdwxZn5N49FGAJtfR9oJH2dlv4VPpkD/JLs=
X-Gm-Gg: ATEYQzyoihCHgi98AyosyuzEHpKWy+SIxChcRgoJrctLrUNtvAkwUxtwWq+fMO1t8lQ
 jb/XgeY7D5VmymalmvcjpAGUTKqxelL4R68RarFHLn3EaUXVqX9wzhoDOr8B+kRJVJvUdexGtQ/
 yd2p/0TgBFbQbAt2lLY2KS4F5zLu/unrjIWmbSdMQ0oiz5mH9KMpMiIEO9l7V7KQj5vQsOI8dhn
 22cSfl33SonVxfblckvAlmItt/jXMGcsl2OLoPIgzHjpKlRIA2sOafQK+HyM3f21GusTEQIR2k6
 8oV2MH1AiYPOaU1AWLwnxiHkRqsWzp82wI2V+QltQLQbGeNQdlNLT86FmoG1m69zu+VmW6mNFv8
 u4Y3rS3daWRxgV6Hv4FfKMf+tlYK/gpClerwBDeRhTJgxBBQITZ74OOsQIQNUBVE+j4X8YleUkZ
 /iVqxhNC9kHVCqnhIbnCAkI4qwyuRhUA2Crxc6NpUbzCUuOKxkC0ohskjWqmwkokmQE4KTWRjs6
 C97
X-Received: by 2002:a05:600c:c8f:b0:483:2c98:4368 with SMTP id
 5b1f17b1804b1-4852695aec4mr144438865e9.18.1772983936230; 
 Sun, 08 Mar 2026 08:32:16 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae56300sm18516050f8f.37.2026.03.08.08.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Mar 2026 08:32:15 -0700 (PDT)
Message-ID: <3cb43c27-1eb9-430f-9414-26d582f0001c@linaro.org>
Date: Sun, 8 Mar 2026 16:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] hvf: arm: unbreak the x86 build
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Wei Liu <wei.liu@kernel.org>, Roman Bolshakov <rbolshakov@ddn.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>,
 Pedro Barbuda <pbarbuda@microsoft.com>
References: <20260307181856.2209-1-mohamed@unpredictable.fr>
 <20260307181856.2209-4-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260307181856.2209-4-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 7/3/26 19:18, Mohamed Mediouni wrote:
> We don't really have any great choices here, so use the __aarch64__ define to unbreak the x86 build.
> 
> Once the CI moves away from macOS 15.1 SDK to... 15.2 even we can get rid of these SME stubs horrible hacks.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr
> ---
>   target/arm/hvf_arm.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

