Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1789348ejb;
        Thu, 20 Jun 2024 00:02:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlG9Fb8a+1QEvpiRgVqXCWFmb52RcLt8MikZIFqkoo21HSAryRKrae6LEOoAyKXGfBeI7E/s4i9EeEc4pDKbG4ikfNIUje
X-Google-Smtp-Source: AGHT+IGZ3rrPTs75WjsoJtzbPjgtYYaXoKILTKNCVI+tMztODifQIlyvTDWOE2j3PQw5BiM/UDQT
X-Received: by 2002:a05:622a:164a:b0:43d:f61a:5871 with SMTP id d75a77b69052e-444a79d09a5mr53193161cf.27.1718866979024;
        Thu, 20 Jun 2024 00:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718866979; cv=none;
        d=google.com; s=arc-20160816;
        b=nvTtlCJDcGRlZW/uPaJ17ZmbJL3h1kK5IrDcK8ltE2odRquUvdchCJhNcLWVm7czJF
         a3hj3TOBlN2xla5KTxWYlws6ePgsiFKocoewBFljeVYu9+D7EPosZX8bXWrIJMFpyeY7
         e2Vfr0iDD691945fdlS320ykTebkm0YhsciuwjP9aC9bnZkop/URxWG4H6TKgOmkYxo8
         lt0JUaNiKPSs9bkn5DnwJPUAKXeMUk7kmwbS3Nv5Ge7GEzo88wlsbASjgXLi/+bHCt6z
         GkNv/Eo0BKqx8lyDlgs9+kZxY5dQfXI/8TEiU8LckF7S5mb9S8rDNn0tSO837ePDrzfk
         88fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Sg37o9GwsiwxQ8zvMynTyvvGgPLYYcf+aEXKs+qRkHU=;
        fh=Ms+y/yhLCnmq4zAyWOSjsvc3RLqN+btADyxJrYbATto=;
        b=nsQDka0QefPD6UU6WV/vjCUbBQq1DaDgcKgp02llezHfAjK0kCyxP0g/2lRVIgD1wu
         TdL2bjnT93KCgFoCJprgVAw59n3LUBYGoSd43OCGWqTf4AcBcOVLLZmr1K9w9IKEbblT
         QpNl6rRAfEyilos95Gqd4WwBIaogwv3YLl/AO3s888s/8plkNbP5uGFjPZYNqkW9zFCq
         t02h6OAnokMjVT7KCvEwUeJZc5svj4aZ1xmGukr2OyHqyP0WiY9oIDG+Ql3z/ATnRRLZ
         lo535mcJ+c1WUDWmHIOGORdViUtgxim9X70F5uciulvewysyxeDG2cJcZgnP19C9eZ04
         I2Fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lwg2IKSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f30f9e98si176586681cf.683.2024.06.20.00.02.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 00:02:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lwg2IKSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKBoa-0001cu-LY; Thu, 20 Jun 2024 03:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sKBoZ-0001ca-6z
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 03:02:35 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sKBoX-00071U-AS
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 03:02:34 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-36087277246so334211f8f.3
 for <qemu-arm@nongnu.org>; Thu, 20 Jun 2024 00:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718866951; x=1719471751; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sg37o9GwsiwxQ8zvMynTyvvGgPLYYcf+aEXKs+qRkHU=;
 b=Lwg2IKSrYT94hPGeMQZPn/1iyRFHuHe/j0tJx0bOGQOHYxzfruuQpHdHzyL/MMCgvg
 S/FLjk9j+W6PagYZ9pACFQG89v3g49Bzh4XAHlj6R/sRcfqLF+rT1a0vo09FJOb9Muzg
 j6IAIua9UO9fIzilBJilBDd9PATfu/IJv31oeMynjPWrdnLn3QYQLz/MCGRkhwcOZlLU
 thhfHSyreJVSHxZkj8IZ1Nn1PmbgeMij3DV6OtiE6smv5nxr6qxPSo0Z8Y6YYfL90sAM
 Ef31Fv5YlsQTbCobwqKb/euj4Ok7pck1KwDfkCcGkRXjK+MVkM/DIot2hkRDOPjHHlj6
 NHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718866951; x=1719471751;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sg37o9GwsiwxQ8zvMynTyvvGgPLYYcf+aEXKs+qRkHU=;
 b=oOUJGLnWp19oRzBaoKufuxITqVWzQ6RG4B7BwEklQvKq115UGVut/Jr39T0Ak6yRW/
 41Qp5tq2ZxNdgvOebF6BIyvLqertKE67O4EToEbIxrcKZrCvXVzhHBokoaw1T+/Ez13T
 DDW1Qb0GBGFwRlJHBp2jgUf+A+klobPakmK6Mk9Ig10GSF0pbYSutLN8UpA0cKXtAy+P
 psuFZv0GMVcozdJxKSMzSsjzFF80cu3QjlX3KYJ8sbl5O1x6eDrQbqmwVNeyWTcWpnNL
 Q+qRhw1t8FuRMF2A45wHaOAzCIjtC9z32upWYc+WD6z5nwteLLBXVPhYUn30L32RnPUu
 okhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9nNod+qZs3IEaUhQymgxKOWDL8U4TMSv3Z9OeQ1j2WA4m7If+eesV4I+qj3iRhSVd5GEJ5nCGU5Dhy1vVZDdUIJab
X-Gm-Message-State: AOJu0Yz9Dw6WR4T2SxpEVDZupS3m/PuT42DoiZHBhghiTVm45TEPRRU+
 tScHGBTphfzf3CLOvtBaZCk5c8L6UrwUZGUN7wkdcx8wx0icUXuvPWJyrW0esYM=
X-Received: by 2002:a5d:68d0:0:b0:35f:bc7:6e4f with SMTP id
 ffacd0b85a97d-36319d67ec5mr3632011f8f.64.1718866951417; 
 Thu, 20 Jun 2024 00:02:31 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.151.40])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-363ff2c934bsm2639694f8f.86.2024.06.20.00.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 00:02:30 -0700 (PDT)
Message-ID: <49dc3d36-1f4a-41b8-acd2-e758bebbfa87@linaro.org>
Date: Thu, 20 Jun 2024 09:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tests/avocado: update firmware for sbsa-ref
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org
References: <20240620060014.605563-1-marcin.juszkiewicz@linaro.org>
 <20240620060014.605563-3-marcin.juszkiewicz@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240620060014.605563-3-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: zDI21juxMCet

Hi Marcin,

On 20/6/24 08:00, Marcin Juszkiewicz wrote:
> Update firmware to have graphics card memory fix from EDK2 commit
> c1d1910be6e04a8b1a73090cf2881fb698947a6e:
> 
>      OvmfPkg/QemuVideoDxe: add feature PCD to remap framebuffer W/C
> 
>      Some platforms (such as SBSA-QEMU on recent builds of the emulator) only
>      tolerate misaligned accesses to normal memory, and raise alignment
>      faults on such accesses to device memory, which is the default for PCIe
>      MMIO BARs.
> 
>      When emulating a PCIe graphics controller, the framebuffer is typically
>      exposed via a MMIO BAR, while the disposition of the region is closer to
>      memory (no side effects on reads or writes, except for the changing
>      picture on the screen; direct random access to any pixel in the image).
> 
>      In order to permit the use of such controllers on platforms that only
>      tolerate these types of accesses for normal memory, it is necessary to
>      remap the memory. Use the DXE services to set the desired capabilities
>      and attributes.
> 
>      Hide this behavior under a feature PCD so only platforms that really
>      need it can enable it. (OVMF on x86 has no need for this)
> 
> With this fix enabled we can boot sbsa-ref with more than one cpu core.

To keep bisection working, don't we want this patch first, then the
previous one on top?

> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
> index 136b495096..e920bbf08c 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -37,18 +37,18 @@ def fetch_firmware(self):
>   
>           Used components:
>   
> -        - Trusted Firmware 2.11.0
> -        - Tianocore EDK2 stable202405
> -        - Tianocore EDK2-platforms commit 4bbd0ed
> +        - Trusted Firmware         v2.11.0
> +        - Tianocore EDK2           4d4f569924
> +        - Tianocore EDK2-platforms 3f08401
>   
>           """
>   
>           # Secure BootRom (TF-A code)
>           fs0_xz_url = (
>               "https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/"
> -            "20240528-140808/edk2/SBSA_FLASH0.fd.xz"
> +            "20240619-148232/edk2/SBSA_FLASH0.fd.xz"
>           )
> -        fs0_xz_hash = "fa6004900b67172914c908b78557fec4d36a5f784f4c3dd08f49adb75e1892a9"
> +        fs0_xz_hash = "0c954842a590988f526984de22e21ae0ab9cb351a0c99a8a58e928f0c7359cf7"
>           tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash,
>                                         algorithm='sha256')
>           archive.extract(tar_xz_path, self.workdir)
> @@ -57,9 +57,9 @@ def fetch_firmware(self):
>           # Non-secure rom (UEFI and EFI variables)
>           fs1_xz_url = (
>               "https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/"
> -            "20240528-140808/edk2/SBSA_FLASH1.fd.xz"
> +            "20240619-148232/edk2/SBSA_FLASH1.fd.xz"
>           )
> -        fs1_xz_hash = "5f3747d4000bc416d9641e33ff4ac60c3cc8cb74ca51b6e932e58531c62eb6f7"
> +        fs1_xz_hash = "c6ec39374c4d79bb9e9cdeeb6db44732d90bb4a334cec92002b3f4b9cac4b5ee"
>           tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash,
>                                         algorithm='sha256')
>           archive.extract(tar_xz_path, self.workdir)

