Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7062CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:41:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBwUy-0005Z0-K1; Thu, 23 Oct 2025 10:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwUq-0005Wi-Eq
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:40:57 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwUo-0003Cd-Cc
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:40:56 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-427007b1fe5so804901f8f.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761230452; x=1761835252; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IbKgAE2uNrIDuHHlNskaqajnAfIjgweZ0iP6Yko2TDY=;
 b=Gg5Zzo9JaCVp3ND7ucOi8NZJjqYxWzdqfqh8OHCzJHQFxQdJHV66Ezw/jwqIUqNIjp
 /QScWF1IZQ5eWkTMRdxCrXGlXe6miXEO9ixCEy2G8w93ixVtuIzhhDO4A+4T6V6W4mLb
 NzZj67P/UDJcAbAuvMKPacisdNflewslm5XXRN8JEC7iTxoRcfkbVzcpQE58owCrMti4
 EY1STYUbT8hm1ETwM73zs+blJn+bQuSzZklPrL30gIYSQxaOaADp0AbQ8T6NcA4Y2apk
 ryl6y7JaOyrGUOPd/B8EuNj3UBjoYjSgnug/VlGTXX0vBXcLRZBeQJhGA95YxSIb5mlf
 Qxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761230452; x=1761835252;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IbKgAE2uNrIDuHHlNskaqajnAfIjgweZ0iP6Yko2TDY=;
 b=Zf20RXgTLLDgsgR3Y0sTVexv+eiHaZK/9F4aDtR53x7kBSdQ/moMftuFIVrNj/Xig+
 scCBWuUIfWZ0WUfLiV+4z7XOeyQLyBikQQHkbTlrBp1yHVeZqZHPzvoxevcJ9KkTwgm7
 MDT0UIqI4xl+oxht50oUgaraGsBzTL2HDLG/PnqgISjSB5kOeW0dXDK+6AV/WPwMzA/r
 +7ixJz3HaFlLGipJfPdw5//fBgFPiXvpkUX4wEYBfkLo5knBw1OOY/YHfd7/FIodAGo9
 FJdCC3ZKnIa5xQ4xNUWc9kCukdgk3h9VHT4qUhcA+dSyffbiu0x4DadtMefU/0TEeo8c
 Gqnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUThEPixRo2dqeucntdP282oteUJ7njXPhn+LPhBR0t5KgY2NAolr1+jnzNAgmmO2niMzQuezcvxg==@nongnu.org
X-Gm-Message-State: AOJu0YxSsAxV668MOlY+kwuCHdkdmeampBbOZStbE2qRaXXoPyN0vDYn
 zzWoBrfBnA+GRufu8FCR+q4gsq5ymk46bpKSWkJzQwyi5k3jnVclAfq9eatb1urVMDc=
X-Gm-Gg: ASbGncvvqzstx+Krtq3aXL7cVzxcnIFh+n8WzOdf8uIonTF8kszDC2wjwvZk0mjXJWO
 Iw65e9fgcVkRHM0vJ0eUqwkusFKZ28QDLhWCdgmK+ANkMgWFVjidWjL6nsNjsPh8L2th+K7YMcX
 Ig5Gc2JOQtQnwbuVlJc9Yw0HDMMNVkovrDpzXxcScjiMmG58Uef0ZYvapos9eqEPCungHpehJnB
 ILAHRYLdcEM01CHwg8i+o7kC7PekGgrvtAgJ7ww+sqlcVtp/bcQUkHmRuihhYk4grdJlJEiNtLH
 VN2l284nrSIzjNrEpkBOV55zhLg/gKhsHGr78ppGdTiVSJ6aF2IeMfTIiP1CEfZMgkF6KEovd4S
 L8kwswnAYEyrQoOE6CYOf5ck6scsODcECw0V+F1cPv4Ioi9SiOh2seqOvP4FCjH9hTwOwoXxQfu
 If5CgvaYSwjf+MYo0LYf3ps7/XKcNUjKElfyeulgFzzSNUgzqn364D6A==
X-Google-Smtp-Source: AGHT+IEY4i3PZU6v2r3M8iTnFgj7CVpgKsLHcKK90UVPqV005BQxg6bl1pBn8xvzJUPDkJ5f7DhsEA==
X-Received: by 2002:a5d:5f48:0:b0:426:ff2f:9c15 with SMTP id
 ffacd0b85a97d-42704d83d04mr19381137f8f.5.1761230452107; 
 Thu, 23 Oct 2025 07:40:52 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897ff371sm4330603f8f.21.2025.10.23.07.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 07:40:51 -0700 (PDT)
Message-ID: <89e1f33a-2d3a-46dc-aeeb-b14f169d6b7a@linaro.org>
Date: Thu, 23 Oct 2025 16:40:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 37/58] accel/hvf: Simplify hvf_log_*
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20251023114638.5667-1-philmd@linaro.org>
 <20251023115311.6944-8-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251023115311.6944-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 23/10/25 13:52, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Rely on the AddressSpace and MemoryRegion structures
> rather than hvf_slot.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/hvf_int.h |  3 ---
>   accel/hvf/hvf-all.c      | 40 ++++++++++------------------------------
>   2 files changed, 10 insertions(+), 33 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

