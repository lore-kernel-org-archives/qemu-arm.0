Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93561CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 15:42:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDlpZ-0006Fv-I8; Tue, 28 Oct 2025 11:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDlpX-0006Ff-Gt
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 11:41:51 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDlpU-0004Il-Be
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 11:41:51 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b6d855ca585so249335566b.0
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 08:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761666101; x=1762270901; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WhEgdXYWOCMpTXbdV4K3qyicdeKHvfSYotTmYvSaLr0=;
 b=s0ID2jg9VTX8s0FnzMN4V4iwrfV8xJ2Dab4CryP3FCBf27vszUgEn7WT2cHv3qQ+Cx
 pSwmFQGcpeT9zkZaMKG35B7/nbhOpLHjJ5OJKb5k/0FOVjKWlvLFCpKlqso6avyLbdWx
 UO/NcyX1otTjbmP/HbhHblNwLFhUbLzBDNLcP5QChIOVfGSFhZt1QbTSdK/jkURFWFul
 He/xvp01EJ+QcGjMP8yjKsVPDh6fQLvBw/Q7/bJL7TKmctoLZouZgbNeKFIi5tmlw2kp
 uZY5i267G2GoCCRgQVYzS53InXHrgBNZT6rZmbf0BY6WnP3CJ6Oagz3EVB+C9GU1wD2p
 +AgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761666101; x=1762270901;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WhEgdXYWOCMpTXbdV4K3qyicdeKHvfSYotTmYvSaLr0=;
 b=LRL9iJ3HoAMUTnkCQMwpPJo4qp9tUtK3hvPZqJ2Rri3P0TyDBvKm3kW1K/9Wd7/FI/
 ZoauEx7SuePfuiARm33WPFt4tLyLIUrTyUadeL/avrz3rdxo9waSDlQwoSbYpRkaBDnC
 jeraMoA6vUIq/kIXUaDXZunLb9FyZwFSj+1R8sMrXwS4j84MiMKzu8fiewA3ynYRO4Xe
 +cJwauWt+WEf5hYcCOkaWNhEUt42E1vPD5lC/Vjaq9QliBwdQTEKbG4mAZ3DSuSjBtZG
 Ft1MCofYkbGmzDG99EmtDRZ7O50PFZXI/acRDynme00P08K2K0dVYteW/l5QQTRgzhVS
 K6Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU57wCCtLDVGKxLS9YJkEWXpzJw0svWrbkEsUJ0d44KSwiaJjMxZO/5yWOE5ZcpBrFVId42X4zng==@nongnu.org
X-Gm-Message-State: AOJu0YxlcsQ5fIWVJgVi1YwH3GWRbPj7HPEkv3CmVfy5XNsCBtB0liLs
 Xh1tvg+5Sp+dTBGPFqQeKzHrA3Y6VGsS9Fja2nW2e80vEjlyc0dJVSmYf+Ip2Ppn0eg=
X-Gm-Gg: ASbGncs3YCxYfYxPumzagm69r0ei44P27wxs+6crC/BH6cYqgixnZPN5YiHAMMOl/Pd
 MgQXh7ikkQL4Z1p7nJk8h06WQ4Ly+0TZpZ7j9Q+bkiY0hX9uIKeoL+q6HARiS/uRNvrHNlVc3sj
 rqBAlQnd+7bH6FTTRhcH6J3AP+tf7gAQF1orjzJ0mek3EoF1qdDUTCmLJFU7v1XWcJ9nCnnkb9I
 uqcqVlASWN2Ty+jCVjNxGADRybLZsnu6s99FrOKfbU8EAk9PnvWGjqctc1aQDqP0K1h6Yx/H0KE
 K0KTnuT84QdfAMO8IY2MSmY8nnJyrn1xx2pj0FDPXz+NcAM76BZt4oSgRyDCcnqfjXfoQFQr1DN
 kAeHfTjaa1l+TO3+M+DI8JZYRyGTiibj9uP16QKm95Q3q5pInLZfObGvLxzWFfytGEOtbrtmMkB
 09cncSvAgZlW/W7OZsy3ud8Vi7EDUO355coLWzn8kmGG4=
X-Google-Smtp-Source: AGHT+IE/puHvSMWEyCjrzg4pbCHIK1YQGEGPCiK0Sh6xj/E+FqUaE2OiocE8gFuoCvht5swqRzyejw==
X-Received: by 2002:a17:907:2d86:b0:b6d:3ad4:ecb5 with SMTP id
 a640c23a62f3a-b70328da2bdmr707566b.40.1761666101171; 
 Tue, 28 Oct 2025 08:41:41 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853f9a0fsm1117874166b.50.2025.10.28.08.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 08:41:40 -0700 (PDT)
Message-ID: <0d2fcc9b-ad42-4668-a8bd-9ecb70c9822e@linaro.org>
Date: Tue, 28 Oct 2025 16:41:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/59] target/arm/hvf: Consolidate
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
 <CAFEAcA-3SzHPmLc-huMnyNbZBnEwi5+fbPNuvCYJcvY7gYboEA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-3SzHPmLc-huMnyNbZBnEwi5+fbPNuvCYJcvY7gYboEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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

On 28/10/25 14:10, Peter Maydell wrote:
> On Tue, 28 Oct 2025 at 05:42, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Missing review: 15, 18, 26, 32, 33, 38 (up to #41 could be merged)
>>                  42, 43 (up to #49 could be merged)
>>                  50+
>>
>> Since v2:
>> - Improve host page size/mask uses (rth)
>> - Remove cpu_test_interrupt in hvf_wfi (rth)
> 
> Richard found an issue with patch 32, so I'm going to

IIUC this is not an issue, just a worry about performance,
whether getpagesize() implementation calls a syscall.
Anyway I'll cache the value locally -- or better, maybe
have qemu_real_host_page_size() doing that --.

> take patches 1-30 into target-arm.next (patch 31 is
> reviewed, but conceptually part of the next few patches
> in the set which use the new functions it defines).

Thanks, this is really helpful!

Phil.

