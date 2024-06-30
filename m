Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp920366njm;
        Sun, 30 Jun 2024 07:37:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXk/zdw5PeWr6vnHJohtUmSadzoPYx2xj42/5vV7cUpl0XZD1mBYhYLJBATHgR0OlQJ4+tQcLFrRJaqF+Jp7yBYyg6WWcWh
X-Google-Smtp-Source: AGHT+IFf+bW7xMVB5Dwo2LCzqnyI4iCJvuBIO51frPVm5s4NAtpKWnQdVL254Qx17IDORH8VelXP
X-Received: by 2002:a05:620a:8421:b0:79d:6cdf:c3d8 with SMTP id af79cd13be357-79d7b9f2147mr357371085a.44.1719758274463;
        Sun, 30 Jun 2024 07:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719758274; cv=none;
        d=google.com; s=arc-20160816;
        b=aDJqqS9tZla9cPvfkQBYUSKRo5/A6MbFpDJC2/Ki/EdXXpK1de0QozuCWAo/Y1/O14
         JKiTvsYhOZGcFLCKjsy0VAvRsPA4EKOnB2Bkvu4V7qeJ0zQ3Th1ecYeHT219YOn3n7pC
         LgBRwB6B/u+rHkAOyqiUzLC+uo5iOIg5Opa7hy8Kw2IbWeCPiMdRAhVSszJFomIL3ANy
         4yohY5F/oSzjxxhabUHcG+/spRbHKJRDJnMzVL9AObLmbvJ3zMDKBs2FIe0OEkVVseN/
         rE6WZbEv/JSA5/XDG000eO7Jbg2lXUUltVxxK5S3eMEOjFXRLJA7r39UBGOsq8jxah81
         uC9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rBVnAs2xl/0NxZ/O7dnmOmrhdhqjOITo/7X/ST5wHZM=;
        fh=7/oeeWTKyWb6PQq/6s+UKKPxUD0DDwCPwAp86BWTsXU=;
        b=h7z7wlN3OBEmS+ltmc1lOwpt3LAi3oJZompPtB2aM7kXKdJKmApXjjC/uf9n0L6Hbu
         IxuJXi1/JmsDdTt+ejow8L9Ikass3v1eSGPsZzf1/KnEFAR303aoYBqiAKbunzVqNflc
         N9kYBRQerrmDZnxXnm4PUvv9MTCYkeEK3rtQ2/oM5+mGAmPHBCohcTJhW6i3XLiCQmTK
         kmFIKX6wnDt7VJ1iQ9nBQ64AucikisVf4e20FSpHZdud79zyebzIo9edTwy8NUeH5A7a
         d/We5I2Otkz7HM2XeMHfeIyqf5PBj8t2f7oJke+PyAu9RQgjquNpxqm+ZOVTcmesyvoH
         Unsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=XkH8vdzh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d69260807si643706585a.38.2024.06.30.07.37.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jun 2024 07:37:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=XkH8vdzh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNvgb-0000vc-Vw; Sun, 30 Jun 2024 10:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1sNvga-0000vO-4a; Sun, 30 Jun 2024 10:37:48 -0400
Received: from sin.source.kernel.org ([145.40.73.55])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1sNvgX-0003Nk-Ab; Sun, 30 Jun 2024 10:37:47 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BF74DCE097C;
 Sun, 30 Jun 2024 14:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09BDC32786;
 Sun, 30 Jun 2024 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719758251;
 bh=RUlD5V3GMh260Zrkcqd8C6QU9LyipyBCh0FBuRULMeM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XkH8vdzheYXAwQD28fEPGy4zHhIRWjhxj2FVwTDNKojmRmbfSgbCXw0MTnQO4LKbT
 wpfooHCjA73qdVJU13FWzddhBHYbLDbvamqJfqIK3/Ff9Y7Sn3c2UNA8oeMv1wp06I
 82oU3GkJBmddeRKEt6i6PZxA3yYv0zvKx8Xzyo8MCfo+faMPqXBIVeWqal8iG9Kjxz
 qB11guanRnvvijaXZltu7DAiEtEhEKuDcdn488+oNsMMZoTe6igCZGo8wowi7bYyLp
 1k5ZOt/7d6RdR7B9iwjY0Y5MKsK7h3azfzi19/0U3Vz2XBlnfVAxJ//iY/p6UFDzzd
 uOh4RjH/WJDdw==
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ee4ab4076bso27843281fa.0; 
 Sun, 30 Jun 2024 07:37:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVL++31JYEFcGxouQOXY9bVwjE3L0YGc8RpS1MpMoVKpliU71xVWpz/JAPCcbRRlaTQZhNqewc9AI9gacgBtHAelgZr
X-Gm-Message-State: AOJu0YwSTyitk7Ex9GgjsBg2S2W2kxZIfxtMIAi5B4trJXIRsUlYS318
 B/lrBvckkj7eUrE/WsKZAFo0laFor6/mWrue0p+eZMnR3PpUdd/gKetDy7pg331vtC41dynsOGU
 hWXq4QZm2D+ta5/1/hJXA8novmAk=
X-Received: by 2002:a05:6512:39d3:b0:52c:dba9:55ff with SMTP id
 2adb3069b0e04-52e7b9113b3mr2461039e87.25.1719758250136; Sun, 30 Jun 2024
 07:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240620-b4-new-firmware-v3-0-29a3a2f1be1e@linaro.org>
 <20240620-b4-new-firmware-v3-1-29a3a2f1be1e@linaro.org>
In-Reply-To: <20240620-b4-new-firmware-v3-1-29a3a2f1be1e@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 30 Jun 2024 16:37:18 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGb9xVQ5E3oK_QX+3hKkMfCoA9jF5jkEeG6Eq9+zbHPHA@mail.gmail.com>
Message-ID: <CAMj1kXGb9xVQ5E3oK_QX+3hKkMfCoA9jF5jkEeG6Eq9+zbHPHA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] tests/avocado: update firmware for sbsa-ref
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Ard Biesheuvel <ardb+tianocore@kernel.org>, Rebecca Cran <rebecca@bsdio.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.73.55; envelope-from=ardb@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GhJEqpyuwtov

On Thu, 20 Jun 2024 at 12:20, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Update firmware to have graphics card memory fix from EDK2 commit
> c1d1910be6e04a8b1a73090cf2881fb698947a6e:
>
>     OvmfPkg/QemuVideoDxe: add feature PCD to remap framebuffer W/C
>
>     Some platforms (such as SBSA-QEMU on recent builds of the emulator) only
>     tolerate misaligned accesses to normal memory, and raise alignment
>     faults on such accesses to device memory, which is the default for PCIe
>     MMIO BARs.
>
>     When emulating a PCIe graphics controller, the framebuffer is typically
>     exposed via a MMIO BAR, while the disposition of the region is closer to
>     memory (no side effects on reads or writes, except for the changing
>     picture on the screen; direct random access to any pixel in the image).
>
>     In order to permit the use of such controllers on platforms that only
>     tolerate these types of accesses for normal memory, it is necessary to
>     remap the memory. Use the DXE services to set the desired capabilities
>     and attributes.
>
>     Hide this behavior under a feature PCD so only platforms that really
>     need it can enable it. (OVMF on x86 has no need for this)
>
> With this fix enabled we can boot sbsa-ref with more than one cpu core.
>

This requires an explanation: what does the number of CPU cores have
to do with the memory attributes used for the framebuffer?


> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  tests/avocado/machine_aarch64_sbsaref.py | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
> index 6bb82f2a03..e854ec6a1a 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -37,18 +37,18 @@ def fetch_firmware(self):
>
>          Used components:
>
> -        - Trusted Firmware 2.11.0
> -        - Tianocore EDK2 stable202405
> -        - Tianocore EDK2-platforms commit 4bbd0ed
> +        - Trusted Firmware         v2.11.0
> +        - Tianocore EDK2           4d4f569924
> +        - Tianocore EDK2-platforms 3f08401
>
>          """
>
>          # Secure BootRom (TF-A code)
>          fs0_xz_url = (
>              "https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/"
> -            "20240528-140808/edk2/SBSA_FLASH0.fd.xz"
> +            "20240619-148232/edk2/SBSA_FLASH0.fd.xz"
>          )
> -        fs0_xz_hash = "fa6004900b67172914c908b78557fec4d36a5f784f4c3dd08f49adb75e1892a9"
> +        fs0_xz_hash = "0c954842a590988f526984de22e21ae0ab9cb351a0c99a8a58e928f0c7359cf7"
>          tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash,
>                                        algorithm='sha256')
>          archive.extract(tar_xz_path, self.workdir)
> @@ -57,9 +57,9 @@ def fetch_firmware(self):
>          # Non-secure rom (UEFI and EFI variables)
>          fs1_xz_url = (
>              "https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/"
> -            "20240528-140808/edk2/SBSA_FLASH1.fd.xz"
> +            "20240619-148232/edk2/SBSA_FLASH1.fd.xz"
>          )
> -        fs1_xz_hash = "5f3747d4000bc416d9641e33ff4ac60c3cc8cb74ca51b6e932e58531c62eb6f7"
> +        fs1_xz_hash = "c6ec39374c4d79bb9e9cdeeb6db44732d90bb4a334cec92002b3f4b9cac4b5ee"
>          tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash,
>                                        algorithm='sha256')
>          archive.extract(tar_xz_path, self.workdir)
>
> --
> 2.45.1
>
