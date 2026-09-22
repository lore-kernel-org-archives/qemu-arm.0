Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7DAC98302
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Sep 2026 18:45:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x95U6-0006fj-KL; Tue, 22 Sep 2026 14:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x95Tz-0006eF-0d
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 14:44:49 -0400
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x95Tw-0006b3-FS
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 14:44:46 -0400
Received: by mail-pz2-x10.google.com with SMTP id
 41be03b00d2f7-cc1cebcb8d7so97759a12.0
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790102683; x=1790707483; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Qp3u3i0KCD/0y2GbFXqeUBFIy1oJGLlf739nf2oKQWk=;
 b=bEbR+h7YTz+rpg5GEiw1SSZYAi/mi6zoXXlSXDz3DnqIOj47lJ4bwGzq4626Lf62n1
 FevU1H0JGXgFX9AW5gha+0lXQMcWKmxFQpUmmbaPmACNQVEypsFfgbNZ47UgixKhJMZ2
 Fdu9MqBT+/Fnrc9TxjZ1+quxXspbOl2ZsErCf7o6djVCDlaUykRL8b2GOWgNvk5X0vTn
 PwlxuYeZfE76FA7JAQvduZM/mz8vpweoUBq3Fd4I4uGwvc8MhcqKbTkzc0RDkP0Eqra4
 j1G6fFE7562SJ9MWV0/2RIpbC6WtD4z4dTbJEhPAVTscMgUVEjQRMKw+lG15WTYa5UGA
 vEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790102683; x=1790707483;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Qp3u3i0KCD/0y2GbFXqeUBFIy1oJGLlf739nf2oKQWk=;
 b=YSwYfXcfWy9V8hR3eFy790hdcicv01Ulk28KrftNzRNNcB3856WM1n5oGjFytVFGEp
 AODoms2u6L22emSn4L56cQ1YWg8KI+/X8klAVr+rcMLOxAwtVRIWLM+s6pBZXaZ0RQ3A
 vb5z7i0VBgmq25Qn6Gmd9es7Id6QeMg1lOZDUicEVTzrbTghxR4Pf21MoEq5c6gEeis6
 imRmF0i5V7qrlar+RPwevaMiD85bBTAkWLne2+C+BFPD9D52tpEOui3orARPJXF6pg12
 IUFfyZK/YGuVbQ+SiCALLHVe43biOfFaycwUcCNvzUj8BbP5kcRRjyC/XVB9cS1lquQp
 wfJQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwAE2f4l9FpgsEuYSLft2WfcIqrOKKE3E8D+IOc2rSDwOnblJ0/v0eEigEQDINo7IwQrlOUVwMrBQ==@nongnu.org
X-Gm-Message-State: AFuF++mb/8mXRBWgoGXrmHHO/ja01nn1wv8N9fj5LubgiGRiTjBHDdTi
 Vw6/u11RI7e6vnGiMjUq5OBhfo3x1OsMUxk8+A6TUZUoQ+VY8HsF1P8znVhbbw1J2R8=
X-Gm-Gg: AYBFou2nVW9xvkuYwluiIAYgwOAJ68wSpxHdbwuiVdiMQL9uplzSTAv8e94Af91EYVW
 1HEWTse712TvDnFVyKEToR+7HcZwIaQf5qc3P6+DuxNVdkT0ADMA1LhU2mvDaZdAR/JlkBa1pf1
 UN/fytsozqQBlXpRmPfujoy2jIRtbSSXAM7+y9y2+bvdRE5RWrEPf4WIC7JccN4R2otXR0TPXtF
 HA6i3GwiJ+Be64fxYGQX9w7/Hk5ZYzOisCDeWEMCocRm8azZlWVSUMwai4sbKecIdR7eEeVZyNl
 bJ9PYaPKf8/PNgaMeZmBvYbSksSRDxHC7/tli8yg552tVT6+B0I6k4ZlL1/nBhXv1GeW4JIaYmX
 lAE1lSYLwqwUDhhq4IMk5bDlhPnJh+KUANV6otACgP4SGWW1RPTeWQUeCjSDcFW4wogUiOWPLFp
 WZzVCT78G2ZOdu43ep4ZYyyUlXLdd0JDH05mpTMeuFAWeYGekoS7Bi3PVD1G1Tqcx1j3qU9fcXy
 b5qzc1Y1l0eY/oF1sn75yMNIxAU4819cjMYDyw2
X-Received: by 2002:a05:6a20:a128:b0:3dd:a008:575c with SMTP id
 adf61e73a8af0-3ddf82fdbd3mr262772637.26.1790102682642; 
 Tue, 22 Sep 2026 11:44:42 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87d1e5fb67fsm200221b3a.58.2026.09.22.11.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 11:44:42 -0700 (PDT)
Message-ID: <d566b802-c7ee-4a5a-b9cc-2ed416e9daf0@linaro.org>
Date: Tue, 22 Sep 2026 11:44:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] target/arm: Un-inline arm_set_cpu_power_state()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
 <20260922164936.15189-7-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260922164936.15189-7-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x10.google.com
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

On 9/22/26 09:49, Philippe Mathieu-Daudé wrote:
> Move arm_set_cpu_power_state() from the header to arm-powerctl.c,
> keeping the power-state helper with the other power-control code.
> Restrict the call in arm_cpu_reset_hold() to system emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   target/arm/internals.h    | 8 +-------
>   target/arm/arm-powerctl.c | 7 +++++++
>   target/arm/cpu.c          | 4 ++--
>   3 files changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

