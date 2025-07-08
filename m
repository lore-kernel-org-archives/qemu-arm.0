Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0E3C83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 21:29:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFDl-00049B-6H; Tue, 08 Jul 2025 16:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDoS-0005Qu-QF
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:17:12 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDoO-0007cP-OO
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:17:07 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-70100e9f709so2345816d6.0
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752002223; x=1752607023; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hhWCRVHslwq6uQ1RrYD5pYArFASP6BrAWb7d3H68MWU=;
 b=FQDmBkQ9DaWYcc+uB6qnLhcabMN+GfTlcpj1rjfhVFj0G2dmhBdCbwUDhZUZawPaS0
 CCB7ykQcebMK1vWC1lbmFLhAikiXhzLyAt0qWGuHRzbacOTdtOotrmj51nK52nBMe0jA
 2VRJdcTyjSA80bXij5ynPTCS47gjhQhwa47ROo5cJHGdWwUhZadA3oCYPribfxDXOYV4
 AktHTJqdDrVPv08HvzDwAffSfDe3yvM2DUCrcPnmLkal2v97mjttrmDPFC9rgz1Te4rJ
 lwal2JezGhAtd/lSY1FF6F52R4W3xIEBDOnByP3EXCzKJOCIFZwPbnolvHPH2zqsf9di
 gEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752002223; x=1752607023;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hhWCRVHslwq6uQ1RrYD5pYArFASP6BrAWb7d3H68MWU=;
 b=nl8l98yf91L4QJzMR3b6fh3rKDm7e3WbvX7uuWJ7dVD9P6GHg+sGMAnC6DR7SaUYtW
 6yFqkGtESXt8OjdXO9MuQz/xjuddkMYQRK8L4VsD5q0/dANd3r8JfM8GmnlkZQW/v5kA
 bdGZqG/qX5sCpqGfmKR0K4eY4qx6erZdQ/MZA923BDh1V5jNza1Cc8btsS1X0Ls7zZnn
 xivzpN8IgYkffmJrK9OJXKEyT2voJYGDFJyjWcUq2RSKNKTSRanGh/kt8H/UlbarV6qp
 MANR5n+4Iir3tEIDik2hyYRqNSFoNJZvKX9iD48j/I3kNJueopQMfEPCy0b8oozavjVx
 xpVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH4/s9UYmsU67pX9a1lJszxjUkIF2VKiCB6V1O8J9pB678JcQqXdB0O1nit3GUNJwPt4G1l6nn6g==@nongnu.org
X-Gm-Message-State: AOJu0YzJ7V+eVfh4vKZ2mYHoojM6iYRtuRTwNbG3KCZikCe1Q2bujr1p
 ES4WcvR23ZLS3u02zdmX2mfVp3qogwwzWYQjpyYycC9s6cE+kNywcZTe3AxY/6UVYVSdmEmAssk
 KwbhS
X-Gm-Gg: ASbGncsZzwP8hL15fDDYKtyN0uK8/nT1Gu6vg8c0VVpMvhIdQZZvP5gJMnGMCLxq2cE
 u+rsOiNr4Ee8QmW2AB/tl+NcclGn4e3oJNM9z4gaILSR93qge0lhWC/+fAgWPgsrPTN47AdKh/g
 vV1I707XOYVu/j0tK16PlJjsjhKWDNcFd1M9VXR5mR1hfv55KkKeKsCb2OrxR8m2ldifWjD0tkD
 d5CqDhniSBP5e/rR+QVnfnCBIJesNZrlwxd63V/PeIG5G837ToLaIHtOkvuGNt4d/T5iaIBvxnN
 6oc6zcNjIA5Z+qKbZmcn0i02N0O4GSIm3JIdhyBH+TvAtL5Gs1QwY2VP1eBPz7aFlT2v/hEHTKQ
 =
X-Google-Smtp-Source: AGHT+IHn7j7DwtC37mVnuJxSAyamU1ibclONru48BAOFY7tp15B+Io74D//xDBie9Udp6k0JPh09yw==
X-Received: by 2002:a05:6a20:ce47:b0:220:1843:3b7b with SMTP id
 adf61e73a8af0-22b6640dcabmr5437329637.4.1751995905836; 
 Tue, 08 Jul 2025 10:31:45 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee4509d0sm12056925a12.7.2025.07.08.10.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:31:45 -0700 (PDT)
Message-ID: <b30ca036-df53-41d3-9234-1f32070915df@linaro.org>
Date: Tue, 8 Jul 2025 10:31:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 1/8] target/qmp: Use target_cpu_type()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <arikalo@gmail.com>
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-qv1-xf2f.google.com
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

On 7/8/25 10:19 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/arm-qmp-cmds.c             | 3 ++-
>   target/loongarch/loongarch-qmp-cmds.c | 3 ++-
>   target/mips/system/mips-qmp-cmds.c    | 3 ++-
>   3 files changed, 6 insertions(+), 3 deletions(-) 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


