Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019DFCFA477
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Nov 2025 07:28:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vMLZ6-0007UL-L1; Fri, 21 Nov 2025 02:28:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vMLYf-0007B8-J3
 for qemu-arm@nongnu.org; Fri, 21 Nov 2025 02:27:56 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vMLXu-000625-7V
 for qemu-arm@nongnu.org; Fri, 21 Nov 2025 02:27:45 -0500
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-640a0812658so2756379a12.0
 for <qemu-arm@nongnu.org>; Thu, 20 Nov 2025 23:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763709828; x=1764314628; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cskrPK+QxONz4k3u1F4DSco9fXxNJt/HV0VjLhKecYo=;
 b=wh58dkKlSEar0vlcaE/hJ75wk8+MWriIRZepWXMTFcbHS0eBQVAsXi/cqttzfLFgLU
 lBcQXtkVTVD8oO3/hSim09EKtN/uMJ5vPDZkDPAd2oAlYmDvOWWnm+hDXIBPUjsOEqUT
 qva8/UNDorJDanFH4IwHi7O9Yx8iMvu2zKy9OgPAbWBQSpvFAH5XegJvfmPeiP5iBlOa
 +GUXBJnz3vay9XMISQ2/VXxXiy/PN0u130dLB18lfimXontVhhFysBuZHFh5rRWdKTSu
 FUPnBWKEyIE3YentEf8y4eqfEzKa7opb0XSH1Uft2Zz8TCV+GF6Y+rAYgjm+kGPt0Ww0
 yHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763709828; x=1764314628;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cskrPK+QxONz4k3u1F4DSco9fXxNJt/HV0VjLhKecYo=;
 b=i/EHP0HFDUGnRXf15PzyK6v+XPOtrwxkygFpOTIWZA3yCpnfaEkBy9t1NIVqwAkxNE
 nYmC5smltn6OkXZ2TGSsaezHPgyzomcNf8XVk8xjD379hemDbI9ZEyPJLnQvWjs0qn+I
 tDtiS65mURBpxtbdo6fKfDM72Pw7SzxH2Is7s0EDoUDSGmDVqQf3MzUzYB0JK18NnnDk
 yuw6cBOHgF5mKlL5yLjcF067HgSA3EzReheb27guo7qOyjVAp55i3PECz752uz836C3A
 VQVJxbMYNmeqjv3o+KNTitMsoExARjNO6A65eE8ap9r13HM5nzVdj2W1/q2MYGEdhi3v
 lWCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3Gl95VWmO4+wxQm+DD3G9s3ls50bqyjimWBdACh2tboIPr0uOBx/UwxU0aHY1cdBNspwC8ijMXA==@nongnu.org
X-Gm-Message-State: AOJu0YzDJKf8y0h3wXHEMLvxhnS4AQ/VQT1wwCnK3I/bbcKfQNBrs1cv
 nhnnMRYYXOUtSSVXoVmB3m02isoPL4bsX84+aF8VDWAoMuATb+PP7PYHl2UblKwdrzXIDBSYkm0
 rPaaCI5JlOZVs
X-Gm-Gg: ASbGncssXVeJKho7EcTpvmfCwZt8LC6HaDkytMv73we6CnLzoIdUHIA30RHuDRJ+wLu
 1goaFWpko8sTkUmLZHLptuDleAnue3kstPIvaY2zRzdBOjg6zG4gQCfxKRX0VHMGTX5zJPReKF4
 dy+ePczl221IZ3mvedS7ZWvNpdE+OudSQgVxRzNke6Qjm09IkmWV2jZdmk3ELpFeqtE/O3u3gi6
 8lQ1YWDQaBrYxOI8s0ZJe5+Tc1trayU97m8jo2UxtPaIK2l2Gl7bBtDM54yE9bszSok9f5Kzl04
 zE4jFc1BInlL38BGLX4DntDa6dnqmbWbO5ddjItRJ3PHluGnfuI834bTtfYvKBck5TMgTkuikch
 W97/p7dlZAxq9/n/ZBbrEBAgPEmXLldlKBM4UHoHI4nbTD+RpJTDLiEog4oYZh1aGld0Iwrd2+f
 yjydNltqbeXxc6Uxf1lrFR6GEZmvLQS6EkWnujKb3sWoNGwi13JBbBLw==
X-Google-Smtp-Source: AGHT+IGHN/KQ0bUk8m0DrtiIPbJyYZF2vimJtwu4hirLdJCh5xQio3RO8tP6oC4pcO1w1ZESKKMJsA==
X-Received: by 2002:a05:600c:4f88:b0:477:942:7521 with SMTP id
 5b1f17b1804b1-477c018afa2mr11704075e9.14.1763709163800; 
 Thu, 20 Nov 2025 23:12:43 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a96aa472sm85902195e9.0.2025.11.20.23.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 23:12:43 -0800 (PST)
Message-ID: <34ec72d0-dafa-418c-9372-d5d033a93c0d@linaro.org>
Date: Fri, 21 Nov 2025 08:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/armv7m: Disable reentrancy guard for
 v7m_sysreg_ns_ops MRs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20251114155304.2662414-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251114155304.2662414-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x543.google.com
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

On 14/11/25 16:53, Peter Maydell wrote:
> For M-profile cores which support TrustZone, there are some memory
> areas which are "NS aliases" -- a Secure access to these addresses
> really performs an NS access to a different part of the device.  We
> implement these using MemoryRegionOps read and write functions which
> pass the access on with adjusted attributes using
> memory_region_dispatch_read() and memory_region_dispatch_write().
> 
> Since the MR we are dispatching to is owned by the same device that
> owns the NS-alias MR (the TYPE_ARMV7M container object), this trips
> the reentrancy-guard that is applied by access_with_adjusted_size().
> 
> Mark the NS alias MemoryRegions as disable_reentrancy_guard; this is
> safe because v7m_sysreg_ns_read() and v7m_sysreg_ns_write() do not
> touch any of the device's state.  (Any further reentrancy attempts by
> the underlying MR will still be caught.)
> 
> Without this fix, an attempt to read from an address like 0xe002e010,
> which is a register in the NS systick alias, will fail and provoke
> 
>   qemu-system-arm: warning: Blocked re-entrant IO on MemoryRegion: v7m_systick at addr: 0x0
> 
> We didn't notice this earlier because almost all code accesses
> the registers and systick via the non-alias addresses; the NS
> aliases are only need for the rarer case of Secure code that needs
> to manage the NS timer or system state on behalf of NS code.
> 
> Note that although the v7m_systick_ops read and write functions
> also call memory_region_dispatch_{read,write}, this MR does not
> need to have the reentrancy-guard disabled because the underlying
> MR that it forwards to is owned by a different device (the
> TYPE_SYSTICK timer device).
> 
> Reported via a stackoverflow question:
> https://stackoverflow.com/questions/79808107/what-this-error-is-even-about-qemu-system-arm-warning-blocked-re-entrant-io
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/armv7m.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


