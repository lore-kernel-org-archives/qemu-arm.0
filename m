Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2400642ejc;
        Wed, 13 Mar 2024 04:48:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUixefh92PoF1xcOmRcZmCiIzW4RMlrPfwgsRXCv83nmoXuHL9LPXXXCUOCbnS8Q47kIQpGZT0OyUhvSGMoNdlijf8QPtKL
X-Google-Smtp-Source: AGHT+IE/Zjwa42vFhutmL2I3kpzdUh03+3z6WhRTqTxpi1bWVzL7AzTCQ6ZYsjEjM8FsYom6BRNr
X-Received: by 2002:a67:bd0d:0:b0:472:a8e0:49fe with SMTP id y13-20020a67bd0d000000b00472a8e049femr6411285vsq.35.1710330523232;
        Wed, 13 Mar 2024 04:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710330523; cv=none;
        d=google.com; s=arc-20160816;
        b=gN2CvGACthAok9x0qwVV+pV2W/+46Fmet4a0pckgfR5kSSVrggyVJNamtEScOqqVDA
         Eb+4Z2JjGBZ3K8/v4JutgCoiFKRLaPc++4a1shcKgjtybLRAbeQLxuRnEwkqOMMgVR39
         6TCtudghiOJGIJd9ORLhmyka8u8lEnKgMyz+Q1zyhwneCXSPig8bDw4ySjKlr2q4Hzsw
         lSnKBJMYIvIvJqiBafDqr7iGpz5IsS28bQJ0eD871f8SzNbpRLwY/CujtcVaqbOO6HKR
         9SraLiDnEuvuP/AfJs27Z/5DbrSiIm+oZpdSPl8Er1v7w9Omn7UlfopJFoiK++OBv+Yt
         1WlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=F+W5Y8RtJa03LAoDXBw+AMMGMfEP05am0MeShuoDySM=;
        fh=X3RTuCX4IG6NVdWjgk/MUwCQw+bi2rZNtYwrR4KhfYE=;
        b=UFN5edv0e1dXsArxpQpsd97IbgSoTliLVcB/m+QYHCDICoafp3hjrXhktb4XucFzAs
         YzlcQYikTZzmeNfppkjmPo8L+/HzYrtGZbW9A3nGxYAYN8me5MHfw6jyrC/IXkmQQv1d
         J17Ts0RSfm3EO+ob1JgR9hyWAHr75oOwOdQ7GTaJdm19kh1r0MBP0TU4chdK4R3sjkyV
         jZWBDCjPlvegQZxRQU8d6ccw7Cljby+OjV66g9asV89RrhPuQh+07cERvTEk9jAJa1Lp
         oNGPBWw4P/ekqhj/BWdVabU0+qzVKb6ECgcXVXMxcEk5TtLTGc6zYAecHBTuHTWS04o2
         fpSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k7KikW3/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020a056214124f00b00690dc27fb97si4852668qvv.494.2024.03.13.04.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 04:48:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k7KikW3/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkN5z-0005Be-S0; Wed, 13 Mar 2024 07:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkN5y-0005Ak-3v
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 07:48:30 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkN5s-0003Ay-Je
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 07:48:29 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33e82c720f8so6080032f8f.3
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 04:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710330503; x=1710935303; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F+W5Y8RtJa03LAoDXBw+AMMGMfEP05am0MeShuoDySM=;
 b=k7KikW3/Tj+3x/rdUZLwG9kCFNb6hq7qf1l2r0DbYfL1UHDvMOhfNVSy07gBSBg0yn
 oGRXx6cPQF46NjllqD7VeUFSC6qOvLDZO76S3U1s62uY7KjTsDrByoCbf4VUv8HjynR3
 MO2ThUxOZ5BLnvDPOF4xLnpepg8Bnd2xN80ClFHO7xcLs3l3pwX46XbEayaVbniZxQtj
 bpQmKdWKOo4DpYMt6HjCcF8pSKaFUB5TrrciandJpAWli8xp+27P+gSOl5EHMCB2RoAF
 QXd0vpZ5OZdQHeYrRG0DNPZw5aiOXYJTNu6PtctkI62fZmNWaXaFRRdHCpmTbZsILGS8
 JgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710330503; x=1710935303;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F+W5Y8RtJa03LAoDXBw+AMMGMfEP05am0MeShuoDySM=;
 b=uhLxkWo0h2/fZVtR8vwPp9okdnqFMwOwkEQFyTSppoUhPVB5eoR7pKKXnPFeGTkZKB
 j1LLKERcWQx/3j6hlN5M2bQRz/7Xbl6rgY4j+KpWIQDvn5OlLkV5egQHuXo85CpM0fyV
 +G1pWiU5YdceHMvqsNBmXTHb9gVPGIHBXmghC1xWs1pZ8OufLwiMlgzigdcGxastDxAV
 bGZzVYocEvdkOv7QS7xibrptnHblU2KvLeh7Nagy9JNNsQPLVK55daTvOdcneRPl2ar0
 BrfTcg3IJlLzGPCvMk5/zf8YjP20OntxQr9r7+LmKuG3K8ILfk9Hd/emkDRrUczhNSs6
 iPNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIgn3aXjxPgbrWz6yIjSpDJPuKXS1BUpFD0eJ5aoGYY8SeWxDNa0ZLeyOAgsb/VBKohNuw3rOYH4l2YHbgPdr+oFdf
X-Gm-Message-State: AOJu0YzjQigyO7Ia5tlqqCcMjP4NDn0i6LkPXWGvhATEQwAk6EwFxk8B
 4TgXy3KPrdQcJjpIZJ20fF2fbs3VdK7NmhQfzGCzTsuHCyS2B5PHo32cddd+jVo=
X-Received: by 2002:adf:e9c8:0:b0:33e:3d71:445f with SMTP id
 l8-20020adfe9c8000000b0033e3d71445fmr1733791wrn.32.1710330503030; 
 Wed, 13 Mar 2024 04:48:23 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.182.179])
 by smtp.gmail.com with ESMTPSA id
 bo3-20020a056000068300b0033e9d0b3faasm6385589wrb.82.2024.03.13.04.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 04:48:22 -0700 (PDT)
Message-ID: <9ed09426-d507-4ae4-b04c-4bbf1f083b69@linaro.org>
Date: Wed, 13 Mar 2024 12:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] tests/avocado: update sbsa-ref firmware to latest
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>,
 qemu-arm@nongnu.org
References: <20240313-sbsa-ref-firmware-update-v1-0-e166703c5424@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240313-sbsa-ref-firmware-update-v1-0-e166703c5424@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Anqia6NLQpVM

Hi Marcin,

On 13/3/24 11:08, Marcin Juszkiewicz wrote:
> Updating sbsa-ref firmware for QEMU CI was manual task. Now it is
> replaced by CI job run on CodeLinaro Gitlab instance.
> 
> This patchset updates to current state:
> 
> - Trusted Firmware v2.10.2 (latest LTS)
> - Tianocore EDK2 stable202402 (latest release)
> 
> And Tianocore EDK2-platforms commit 085c2fb (edk2-platforms does not
> have releases).
> 
> Firmware images were built using Debian 'bookworm' cross gcc 12.2.0
> compiler.
> 
> And while I am in that file I dropped use of 'virtio-rng-pci' device as
> sbsa-ref is supposed to emulate physical hardware.
> 
> OpenBSD updated to 7.4 version.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
> Marcin Juszkiewicz (3):
>        tests/avocado: update sbsa-ref firmware
>        tests/avocado: drop virtio-rng from sbsa-ref tests
>        tests/avocado: use OpenBSD 7.4 for sbsa-ref

Hmm 'max' is timeouting:

  (1/7) test_sbsaref_edk2_firmware: PASS (9.99 s)
  (2/7) test_sbsaref_alpine_linux_cortex_a57: PASS (54.82 s)
  (3/7) test_sbsaref_alpine_linux_neoverse_n1: PASS (53.09 s)
  (4/7) test_sbsaref_alpine_linux_max: INTERRUPTED: Runner error 
occurred: Timeout reached... (180.51 s)
  (5/7) test_sbsaref_openbsd_cortex_a57: PASS (33.45 s)
  (6/7) test_sbsaref_openbsd_neoverse_n1: PASS (22.15 s)
  (7/7) test_sbsaref_openbsd_max: INTERRUPTED: Runner error occurred: 
Timeout reached... (180.42 s)
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 2 | 
CANCEL 0
JOB TIME   : 537.48 s

Using impdef pauth ...

-- >8 --
diff --git a/tests/avocado/machine_aarch64_sbsaref.py 
b/tests/avocado/machine_aarch64_sbsaref.py
index 94c9f81d72..d349ce73ae 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -156 +156 @@ def test_sbsaref_alpine_linux_max(self):
-        self.boot_alpine_linux("max")
+        self.boot_alpine_linux("max,pauth-impdef=on")
@@ -201 +201 @@ def test_sbsaref_openbsd_max(self):
-        self.boot_openbsd("max")
+        self.boot_openbsd("max,pauth-impdef=on")
---

... I still get:

  (1/7) test_sbsaref_edk2_firmware: PASS (5.56 s)
  (2/7) test_sbsaref_alpine_linux_cortex_a57: PASS (53.09 s)
  (3/7) test_sbsaref_alpine_linux_neoverse_n1: PASS (53.00 s)
  (4/7) test_sbsaref_alpine_linux_max: PASS (70.99 s)
  (5/7) test_sbsaref_openbsd_cortex_a57: PASS (22.63 s)
  (6/7) test_sbsaref_openbsd_neoverse_n1: PASS (22.56 s)
  (7/7) test_sbsaref_openbsd_max: INTERRUPTED: Timeout reached... (180.43 s)
RESULTS    : PASS 6 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 1 | 
CANCEL 0
JOB TIME   : 409.29 s

What about disabling path on openbsd and using @skip tags?

-- >8 --
diff --git a/tests/avocado/machine_aarch64_sbsaref.py 
b/tests/avocado/machine_aarch64_sbsaref.py
index 94c9f81d72..c6ee7332a9 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -142,2 +142,3 @@ def test_sbsaref_alpine_linux_cortex_a57(self):
          :avocado: tags=cpu:cortex-a57
+        :avocado: tags=os:linux
          """
@@ -148,2 +149,3 @@ def test_sbsaref_alpine_linux_neoverse_n1(self):
          :avocado: tags=cpu:neoverse-n1
+        :avocado: tags=os:linux
          """
@@ -151,2 +153,17 @@ def test_sbsaref_alpine_linux_neoverse_n1(self):

+    def test_sbsaref_alpine_linux_max_pauth_off(self):
+        """
+        :avocado: tags=cpu:max
+        :avocado: tags=os:linux
+        """
+        self.boot_alpine_linux("max,pauth=off")
+
+    def test_sbsaref_alpine_linux_max_pauth_impdef(self):
+        """
+        :avocado: tags=cpu:max
+        :avocado: tags=os:linux
+        """
+        self.boot_alpine_linux("max,pauth-impdef=on")
+
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might 
timeout')
      def test_sbsaref_alpine_linux_max(self):
@@ -154,2 +171,3 @@ def test_sbsaref_alpine_linux_max(self):
          :avocado: tags=cpu:max
+        :avocado: tags=os:linux
          """
@@ -186,3 +204,4 @@ def test_sbsaref_openbsd_cortex_a57(self):
          """
-        :avocado: tags=cpu:cortex-a57,os:openbsd
+        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=os:openbsd
          """
@@ -192,3 +211,4 @@ def test_sbsaref_openbsd_neoverse_n1(self):
          """
-        :avocado: tags=cpu:neoverse-n1,os:openbsd
+        :avocado: tags=cpu:neoverse-n1
+        :avocado: tags=os:openbsd
          """
@@ -196,7 +216,24 @@ def test_sbsaref_openbsd_neoverse_n1(self):

+    def test_sbsaref_openbsd_max_pauth_off(self):
+        """
+        :avocado: tags=cpu:max
+        :avocado: tags=os:openbsd
+        """
+        self.boot_openbsd("max,pauth=off")
+
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might 
timeout')
+    def test_sbsaref_openbsd_max_pauth_impdef(self):
+        """
+        :avocado: tags=cpu:max
+        :avocado: tags=os:openbsd
+        """
+        self.boot_openbsd("max,pauth-impdef=on")
+
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might 
timeout')
      def test_sbsaref_openbsd_max(self):
          """
-        :avocado: tags=cpu:max,os:openbsd
+        :avocado: tags=cpu:max
+        :avocado: tags=os:openbsd
          """
-        self.boot_openbsd("max")
+        self.boot_openbsd("max,pauth-impdef=on")

---

However OpenBSD still timeouts at 180s:

  (01/11) test_sbsaref_edk2_firmware: PASS (7.25 s)
  (02/11) test_sbsaref_alpine_linux_cortex_a57: PASS (54.30 s)
  (03/11) test_sbsaref_alpine_linux_neoverse_n1: PASS (52.25 s)
  (04/11) test_sbsaref_alpine_linux_max_pauth_off: PASS (53.31 s)
  (05/11) test_sbsaref_alpine_linux_max_pauth_impdef: PASS (72.72 s)
  (06/11) test_sbsaref_alpine_linux_max: SKIP: Test might timeout
  (07/11) test_sbsaref_openbsd_cortex_a57: PASS (22.37 s)
  (08/11) test_sbsaref_openbsd_neoverse_n1: PASS (22.98 s)
  (09/11) test_sbsaref_openbsd_max_pauth_off: INTERRUPTED: Timeout 
reached... (180.54 s)
  (10/11) test_sbsaref_openbsd_max_pauth_impdef: SKIP: Test might timeout
  (11/11) test_sbsaref_openbsd_max: SKIP: Test might timeout

Regards,

Phil.
