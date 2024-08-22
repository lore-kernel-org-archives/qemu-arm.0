Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp595661njb;
        Thu, 22 Aug 2024 04:39:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1bQQVyWJanvi+hMjBOiK7kZ3+F84AyRHykxWE5/ttYL42Sk3piId8d7j3a5ZwX/EO3EYkna0wAH4ftw==@linaro.org
X-Google-Smtp-Source: AGHT+IHrXeM492EnGXsx5kjw66/5euDcbTf6SnM1E6f53AEK4Wrdy0Mg5oWDRGYz4Ippy2p0N8xx
X-Received: by 2002:a05:6902:278a:b0:e16:506a:343c with SMTP id 3f1490d57ef6-e179031d159mr1769715276.30.1724326746314;
        Thu, 22 Aug 2024 04:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724326746; cv=none;
        d=google.com; s=arc-20160816;
        b=EirILBFLf8RIprj0DrwXXgyerwghGAQFY8F+ThvKqs+7GXUXyeR+4VO23siirTziSC
         am5JceINK4hpPlNYs39gbRywK2ANFhokDaEwA9ugBtbbygal2xeeBThHdRynXGt8pGf8
         RLaDdCVXed1srUV/Xae2mWdKl1a2ZM5vIfdK2CSCNL/4UTq34V+KsRwtMzcp5I19PbJs
         SzYKB2xaKYhtGBQXO05wpTY96wpL2LkW9hZFFwtKcW3LCzi/PASWRQ3tqADfiIqMyxhu
         tC8aI+tyCLoEBkoFpwVdI590iL/qVAMchdT4XzsKyYi/qVWWPnFFx/cbcVCLoZ4tUfO1
         Y7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sKoonnN54/9hQBKTTocCEj1szudt264Kdo7sCA5zYAw=;
        fh=Mekeje+VLmkPIWhaRBN7OSMS+J1cUVl9HkC36zUmp5k=;
        b=SJu/gFw9mrO0YaZjZRJeW8anjEXedRhdvw7Ku8s1axZ0meB+9MZnLHwDEUkqOrQT3z
         e53St7//gM1ggHWjjNEMU7fLK7gRS30chy0BcstV3tBGi+2hlaWzYk8rslTG12KkZAHb
         HEw2PYdh63TqOAIgehdv+dwjGz4LN23RuCMcwryfKoBTPKJkjvHxs+h7syxl1KEMyZne
         wQomf0pLnRSPxR2dGUWq34nol/DgFqXOuKErvIUOGiqyQe2s5VCzLbaLVMdt2lQalA1c
         fAeajI2dZG43l0ULTfNt0LR16hdoFdJz9ifCwLF4a+c3aOuudxKAWTnnLHYf/NVMwHxp
         qQ8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MHnVEf5n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c162d2f03csi15943386d6.121.2024.08.22.04.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 04:39:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MHnVEf5n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sh69S-0001bn-Qb; Thu, 22 Aug 2024 07:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sh69M-0001UY-T4
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 07:38:44 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sh69I-0005Ym-NH
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 07:38:43 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-428101fa30aso5201945e9.3
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 04:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724326716; x=1724931516; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sKoonnN54/9hQBKTTocCEj1szudt264Kdo7sCA5zYAw=;
 b=MHnVEf5nojwyZMTCMsLn52nMYlrubrTinYfce+9ruuJbVnb4qU2R14BZbTRosynVTu
 ikwrNOVU8MvgLuCoWWNy0TpkUjLc3LpnKRcjpiNwFXKXf62HnXHp65cL01IoD2r1r9qq
 zJlly21liOWmX+mHZ+3G1iyW8kcP7ttzPkofPwmYP+G1ISTmCsr9wOHeMANY75u1SI2m
 GBRkGelAbKPQliaUg3nUHvzMO1lE9EDqGMSR9dMAxWcGTOsIF5mqsAHayj26JVHIBQTE
 d64/JGPWsiF6//DtOlf8y2OKq2SaiQG/MNhzW5V8XSWSeq9tqmMG+XhiMPAQI/h1Dp4R
 rOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724326716; x=1724931516;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sKoonnN54/9hQBKTTocCEj1szudt264Kdo7sCA5zYAw=;
 b=n6OIyOd3AfrjUQVcuLYlsTHxMDgY5Z1K2VCdniiwvhQKQ/HQR3M8v0W9Ey2L/9ox6J
 G38QVQbwEOzP+EeY4p20dpbJCLLCkRWSwQ23pcOm8nSL8EB5S5VHSce3OTR0DmAIvfrx
 t1zghcgc45E5+RCYmvNef5ilrCHuS6u6jb7w1LUGtxReSAz/eLXLDrPlWHkFtGVrt2VX
 6I3YPmH9GBbNI/nsfJVC8+8fs4pdniNvYVSO7viQyk040h5foqzhQLWnzSzOrNk70iBY
 cWTZ+d/B4bC05KH8ZivyNAX6fYVdCaGQGVGFmMeTfyXM7tz89PUMlq+FT1gr9Y+4cGkY
 aRgg==
X-Gm-Message-State: AOJu0YxLuxobGL12OR2o80A9F2UivILSwOB7wM8lvyznY7a/mQsqFfBZ
 T6hty7Mw0ptav9KyB69ND7KdTs9tKjqdr6rNelANdh09fzVXHkwD/6DBsG99ceI=
X-Received: by 2002:a05:600c:1d18:b0:428:387:79ac with SMTP id
 5b1f17b1804b1-42abd1120ecmr38758535e9.6.1724326716165; 
 Thu, 22 Aug 2024 04:38:36 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.206.153])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac514e088sm22379575e9.8.2024.08.22.04.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 04:38:35 -0700 (PDT)
Message-ID: <57e94d73-66fc-48d1-aceb-6f4f2d888813@linaro.org>
Date: Thu, 22 Aug 2024 13:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional: Convert Aarch64 SBSA-Ref avocado tests
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>
References: <20240822113629.86618-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240822113629.86618-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: BEEzBGCjnnw/

On 22/8/24 13:36, Philippe Mathieu-Daudé wrote:
> Straight forward conversion. Since SBSA_FLASH files are not
> tarballs, use lzma_uncompress() method.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20240821082748.65853-1-thuth@redhat.com>
> ---
>   MAINTAINERS                                   |   2 +-
>   tests/functional/meson.build                  |   5 +
>   .../test_aarch64_sbsaref.py}                  | 135 ++++++------------
>   3 files changed, 53 insertions(+), 89 deletions(-)
>   rename tests/{avocado/machine_aarch64_sbsaref.py => functional/test_aarch64_sbsaref.py} (58%)
>   mode change 100644 => 100755

Forgot to squash:

-- >8 --
diff --git a/tests/functional/test_aarch64_sbsaref.py 
b/tests/functional/test_aarch64_sbsaref.py
index 5f9a5f7e37..a72add393a 100755
--- a/tests/functional/test_aarch64_sbsaref.py
+++ b/tests/functional/test_aarch64_sbsaref.py
@@ -78,5 +78,2 @@ def fetch_firmware(self):
      def test_sbsaref_edk2_firmware(self):
-        """
-        :avocado: tags=cpu:cortex-a57
-        """

@@ -145,6 +142,2 @@ def test_sbsaref_alpine_linux_max_pauth_impdef(self):
      def test_sbsaref_alpine_linux_max(self):
-        """
-        :avocado: tags=cpu:max
-        :avocado: tags=os:linux
-        """
          self.boot_alpine_linux("max")
---
