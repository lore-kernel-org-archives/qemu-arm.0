Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3066155ejb;
        Mon, 27 May 2024 02:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJbw7rP718AkPI2NQmS9q6JYL4wX+8AIrj7BLUX3T2pv9BQVo3e9pP2yZp0OzB7zY73ocxxdruVI+BsjG9tSAUv7O9PwR+
X-Google-Smtp-Source: AGHT+IFo6twFPsprrX3EFt7XLjz35PrTTiAtqInQA3dTfWgVcVwc7tejDifuZBqCfGy0niRQHJIE
X-Received: by 2002:ac8:5e0b:0:b0:43d:f7fe:21e3 with SMTP id d75a77b69052e-43fb0f066c3mr90468001cf.58.1716803620361;
        Mon, 27 May 2024 02:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716803620; cv=none;
        d=google.com; s=arc-20160816;
        b=qOSTN3srRkwM+TjSdBWmjiRTcf0p1rMwTT3Pm15m83+MWW7hucnF95qWzpJpGr6muO
         FvPJrvjMvPVeFtxpaPQm1rL3te04of0kdBAv/LF83LFpTs5Rj6cAmR/DLvuM/ap0z5ZU
         PvfiMKwXAWZYBom7Yt4LNVdFcDK1mdEBqCvbblkV9WvOzZ54yB+q4sBdrbwOclFB4SFh
         xhFeSf/kXfkW/cj5HD53BO5W+yS2vJasF07LvpCGb7McpDe1pZHi1q+0a0jHim9RylpG
         qgM2EIafi+JZdjOFb8qMiWrdo9iF5mcr4ciHIxal4Ph4+tE3R24kFaVOYyijho8PiHky
         Freg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TTvOFcRioRnhwU5iUk34BgipIQyxDh4f1bq5Rktqm/A=;
        fh=P49PNfUfMbWG2zkMs7aYFTNIxygZqLxzqinPY5yhrjw=;
        b=zGIxGcj3He1Ykth6VB8CWwrEeD70eiuoNXyHVvxnFbGw9KkB3d/Mm28HkWTY/8ccxd
         teaD1iU3dMR4h0zVNs981zqEOve7bSrfQLvWu97emXaZhfFbX2BE8uwU1SDDjwrl8cfa
         CN+GpbKA/vrja3Hg68yT+mGwI7dewtKwvQrfeVGyZlfdRns/+BID/lJNTx6BedjM+6Ye
         jUqwTVZ3NGEFyjlgckGJ8c/K8csDMRPbru6JHN8thIWUlRN42ywjmXqQb9yZVGFuML28
         rU+VQcVWG3Xdp836qqyRpv/jpiPnFxpJCdVM5tfq6zREDhjwID4nCrKA5UJHx+p9fTcD
         yEfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qZTABBJP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18e9ad0si84714361cf.777.2024.05.27.02.53.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 02:53:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qZTABBJP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBX2b-0005kO-3y; Mon, 27 May 2024 05:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBX2Y-0005jJ-HA
 for qemu-arm@nongnu.org; Mon, 27 May 2024 05:53:14 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBX2W-0008HD-Ck
 for qemu-arm@nongnu.org; Mon, 27 May 2024 05:53:14 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-356c4e926a3so1770419f8f.1
 for <qemu-arm@nongnu.org>; Mon, 27 May 2024 02:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716803590; x=1717408390; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TTvOFcRioRnhwU5iUk34BgipIQyxDh4f1bq5Rktqm/A=;
 b=qZTABBJPJF3dLRmW7Vxl8mFZJKr1KPqR64Z+sdySGXKsBsqBq1o6fohqJHuLuDC5lv
 VsIodYNNSNMCrteiK6DgZ6wXM3Ue2+eJ4JdopiMsTol27ermBH+r4GTOPR0Pb1M//MaZ
 ARxGCefxHgvRLjBG7hN7zDFuwkZEdxAlL+rJ0KX9+r/RNLKL/qc+1QX2Ej68FeuVC3UT
 wkbFUHPXVAojH4x9u50BaD5SSOp86XHFYBAVRR8Wr1me4lqRuK6l71cBbxWKKePrWcKf
 BpYYC62Fl/nIbIRfub/InTihkh8T1qjiCzSSjtRHRgEu1OvV1NY/oWfgPaJOPjjxl046
 i2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716803590; x=1717408390;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TTvOFcRioRnhwU5iUk34BgipIQyxDh4f1bq5Rktqm/A=;
 b=baAuZWIOh/UwDSmpdftv4fCAFXfYdC/7zAM3O/4nPR+TK3Y0vSnzH50d2L3NRos92v
 gNPWY9x8sbQz/Uq0/Hz94zux1KKpbXikZ6DPnLgBlYgiqqoMO4yaRQ2fz8KGWfSsQIwc
 7SAcU6P5uxgrGmSv2o/XP7n+l9dQk8I/MFmgxgVS00j9D4SUVIfqO9Ofa7NKs6lLVsRH
 GSPAQkHmX4Cc1wwjV3L+tjELSPtNIZdMdO+z2sQAx2nN/ByZ5OG7/HeQSjBIv7Pxw26W
 +mSEtYJfx2jVsiLC7tSibfzndF7tAqwqllH6mmEDm5ZOoHfOLN8XU8PsyPEq9+QscYCH
 orWQ==
X-Gm-Message-State: AOJu0YyqTPmDmkWdTXPWivxDg5FvF5LrNuDhYp5qb5IWYO0xmnzHhBa1
 lLqClYxDzhl3hzg1gopP/VZrPig9I/IdrNoYayymCWEFDfqAtQ2mvqoobmGwKeQ=
X-Received: by 2002:adf:f605:0:b0:351:d78e:875e with SMTP id
 ffacd0b85a97d-35526c271e2mr5889702f8f.14.1716803590214; 
 Mon, 27 May 2024 02:53:10 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3577505a218sm5416098f8f.31.2024.05.27.02.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 02:53:09 -0700 (PDT)
Message-ID: <f2b32bb7-409b-484a-b4c3-71ca40d9bbe2@linaro.org>
Date: Mon, 27 May 2024 11:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tests/avocado: sbsa-ref: switch from OpenBSD to
 FreeBSD
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>
References: <20240523183928.37809-1-marcin.juszkiewicz@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240523183928.37809-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dp3WzW3PFamh

On 23/5/24 20:39, Marcin Juszkiewicz wrote:
> FreeBSD has longer support cycle for stable release (14.x EoL in 2028)
> than OpenBSD (7.3 we used is already EoL). Also bugfixes are backported
> so we can stay on 14.x for longer.
> 
> Planned to upgrade to newer OpenBSD but we would have to wait for 7.6
> release to get Neoverse-V1/N2 support.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 65 ++++++++++++++++--------
>   1 file changed, 43 insertions(+), 22 deletions(-)
> 
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
> index 98c76c1ff7..c3c7c0e639 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -1,4 +1,4 @@
> -# Functional test that boots a Linux kernel and checks the console
> +# Functional test that boots a kernel and checks the console
>   #
>   # SPDX-FileCopyrightText: 2023-2024 Linaro Ltd.
>   # SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
> @@ -177,14 +177,14 @@ def test_sbsaref_alpine_linux_max(self):
>       # This tests the whole boot chain from EFI to Userspace
>       # We only boot a whole OS for the current top level CPU and GIC
>       # Other test profiles should use more minimal boots
> -    def boot_openbsd73(self, cpu):
> +    def boot_freebsd14(self, cpu):
>           self.fetch_firmware()
>   
>           img_url = (
> -            "https://cdn.openbsd.org/pub/OpenBSD/7.3/arm64/miniroot73.img"
> +            "https://download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES/14.0/FreeBSD-14.0-RELEASE-arm64-aarch64-bootonly.iso"
>           )
>   
> -        img_hash = "7fc2c75401d6f01fbfa25f4953f72ad7d7c18650056d30755c44b9c129b707e5"
> +        img_hash = "2f3ceb0ef6b1de53553abb9979a6d65f51b006dbfa985798b282812ecb758c1b"
>           img_path = self.fetch_asset(img_url, algorithm="sha256", asset_hash=img_hash)
>   
>           self.vm.set_console()
> @@ -196,43 +196,64 @@ def boot_openbsd73(self, cpu):
>           )
>   
>           self.vm.launch()
> -        wait_for_console_pattern(self,
> -                                 "Welcome to the OpenBSD/arm64"
> -                                 " 7.3 installation program.")
> +        wait_for_console_pattern(self, "Welcome to FreeBSD!")
>   
> -    def test_sbsaref_openbsd73_cortex_a57(self):
> +    def test_sbsaref_freebsd14_cortex_a57(self):
>           """
>           :avocado: tags=cpu:cortex-a57
> -        :avocado: tags=os:openbsd
> +        :avocado: tags=os:freebsd
>           """
> -        self.boot_openbsd73("cortex-a57")
> +        self.boot_freebsd14("cortex-a57")
>   
> -    def test_sbsaref_openbsd73_neoverse_n1(self):
> +    def test_sbsaref_freebsd14_neoverse_n1(self):
>           """
>           :avocado: tags=cpu:neoverse-n1
> -        :avocado: tags=os:openbsd
> +        :avocado: tags=os:freebsd
>           """
> -        self.boot_openbsd73("neoverse-n1")
> +        self.boot_freebsd14("neoverse-n1")
>   
> -    def test_sbsaref_openbsd73_max_pauth_off(self):
> +    def test_sbsaref_freebsd14_neoverse_n2_pauth_off(self):
> +        """
> +        :avocado: tags=cpu:neoverse-n2
> +        :avocado: tags=os:freebsd
> +        """
> +        self.boot_freebsd14("neoverse-n2,pauth=off")
> +
> +    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')

Nitpicking, maybe 'Test might timeout due to PAuth'? (few occurrences).

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    def test_sbsaref_freebsd14_neoverse_n2_pauth_impdef(self):
> +        """
> +        :avocado: tags=cpu:neoverse-n2
> +        :avocado: tags=os:freebsd
> +        """
> +        self.boot_freebsd14("neoverse-n2,pauth-impdef=on")
> +
> +    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
> +    def test_sbsaref_freebsd14_neoverse_n2(self):
> +        """
> +        :avocado: tags=cpu:neoverse-n2
> +        :avocado: tags=os:freebsd
> +        """
> +        self.boot_freebsd14("neoverse-n2")
> +
> +    def test_sbsaref_freebsd14_max_pauth_off(self):
>           """
>           :avocado: tags=cpu:max
> -        :avocado: tags=os:openbsd
> +        :avocado: tags=os:freebsd
>           """
> -        self.boot_openbsd73("max,pauth=off")
> +        self.boot_freebsd14("max,pauth=off")
>   
>       @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
> -    def test_sbsaref_openbsd73_max_pauth_impdef(self):
> +    def test_sbsaref_freebsd14_max_pauth_impdef(self):
>           """
>           :avocado: tags=cpu:max
> -        :avocado: tags=os:openbsd
> +        :avocado: tags=os:freebsd
>           """
> -        self.boot_openbsd73("max,pauth-impdef=on")
> +        self.boot_freebsd14("max,pauth-impdef=on")
>   
>       @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
> -    def test_sbsaref_openbsd73_max(self):
> +    def test_sbsaref_freebsd14_max(self):
>           """
>           :avocado: tags=cpu:max
> -        :avocado: tags=os:openbsd
> +        :avocado: tags=os:freebsd
>           """
> -        self.boot_openbsd73("max")
> +        self.boot_freebsd14("max")

