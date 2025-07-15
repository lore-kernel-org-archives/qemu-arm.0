Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A04AC83F17
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 22:10:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubnpy-0001jy-5E; Tue, 15 Jul 2025 18:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ubnpb-0001hL-Va
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 18:09:06 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ubnpZ-0004cX-DT
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 18:08:59 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c85so8729555a12.2
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 15:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752617335; x=1753222135; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WbniVntAWS0O9InHwMdwYEDk/2YqeRX6IOjMwHZx2Cs=;
 b=xMn9bOZFKQYQlw5YU8PxT8HEfNjuiR106OrXJP026vMgP3eCXhnrFZ4IpG8kS0NZk+
 fEMe5OH1mQyO5KFKdFMB772uyUmlRuEiue7L5GU2CiujmOGttPFXNqIM8J56dRwsRYc1
 dUy/rGlZ/rJRQTwd3sYesAnP//237Ni8+PdpkJ/iyjQO1Nsz3xNxHM04YgcwPuCKVZmC
 VB5HjcAq+Dg24Sh1M7dr/m2wVbQxL9xVWbblhNIitFk4x2BF8dEJVu88+8NqFyvOcGHX
 T/mb0MMVHOzwgjLug4B8WAgR4/GzTMIWo+nG5dikzjGFdMXCXvmonrrxd37J5wNgVIoF
 2orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752617335; x=1753222135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WbniVntAWS0O9InHwMdwYEDk/2YqeRX6IOjMwHZx2Cs=;
 b=LyVA278bX/rGSwZP1xa4Nk+pe2Ftyt1bDl2kg7qJCLMtJJ9BcjAqhZLLkxsYJ61UuS
 7UHbm6OmIjtC3ulc1FxmgBc9cuceoYhsjLAnhkKNobfiBZdZHjbt3t9JfZKNDqk5Auju
 MN7JxbnFN2qNpw17daYyoy6V2Er7/HtmvqEumHrpWg6Rc4nuKAYKwN2YuRoTSRU0eG3t
 qV98/ufHP28gw1HaAlsTmEfW9khU8CNz3Nr7ZTAafPikfFdRbWjI+iazIc6rWmdofSCZ
 /dNroL96piZKj5wykSka20e7ihBzbbKDNcJu72sW6ojoHpGoGVtUEbz7YHOwSgS5Qtwa
 OsmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB3mmcE/0NG3ZLLLEfQ+w1awFOjakjcD1lPpDCXDXZrlWIhL7yBe8dcUFtYXAORKNSbPkuoVqcqw==@nongnu.org
X-Gm-Message-State: AOJu0YyXrri4TeZyg1bEUOrDx3nr4/4iPGPkVXHOPJ4CyqYeMlPauXcc
 erlNYz8dxdyM8jUfd47MBGzOA4zG9UKlTj+AOfhrofOmggYZBnobtfH3uH2me6GtMaftkJTisjT
 QoT/A74bE/9bk1cC2I8TbIAesLtMpC1lZ49at0zbILDbyWP4i/VLTpAg=
X-Gm-Gg: ASbGncvYBq5JrWmT5eX0UqLOBiyQ+ZKPskupwKYmxGSEi5+J8rN5rX5NusnwxnxkraH
 ZYvRyrTwXkoy5TJw39kMOfg5n7cUFP7KfP7EbJ7hREaMdyBmnNQM1wlP0MIZs3DH/bEKqiQBSxA
 grQKaraBLUSnHgTkgv+ISidRVIzADC058MFKyFHX4a1fVDlyaAUtNJxggewI+E5UhmoIv62/hNa
 vrtBIc=
X-Google-Smtp-Source: AGHT+IGSQtvYjd//yq/bDy6fsvV1aE/yKqj/KDtMrHf9zQ0OwFXwjRO/YNwi1CCA1OOIkERVvaReqj29KPsN9vO1Wug=
X-Received: by 2002:a05:6402:5241:b0:607:4c8e:514d with SMTP id
 4fb4d7f45d1cf-61281e9ab0emr682124a12.6.1752617335286; Tue, 15 Jul 2025
 15:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250715212335.2215509-1-pierrick.bouvier@linaro.org>
 <20250715212335.2215509-2-pierrick.bouvier@linaro.org>
In-Reply-To: <20250715212335.2215509-2-pierrick.bouvier@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 16 Jul 2025 01:08:29 +0300
X-Gm-Features: Ac12FXxIJShM8aFQ5Z-qfgeT_LbdfJqoHcAZWL7jY2u4iqeLvCha_ZNBcVCVtnM
Message-ID: <CAAjaMXZHkOH9+c5x1reBm=o=y57sx-tajShQgKXweoDoeOvwEg@mail.gmail.com>
Subject: Re: [PATCH 1/2] tests/functional/test_aarch64_device_passthrough:
 update image
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, jean-philippe@linaro.org, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, gustavo.romero@linaro.org, 
 Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x529.google.com
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

On Wed, Jul 16, 2025 at 12:25=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> TF-A needs to be patched to enable support for FEAT_TCR2 and
> FEAT_SCTLR2. This new image contains updated firmware.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  tests/functional/test_aarch64_device_passthrough.py | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/tests/functional/test_aarch64_device_passthrough.py b/tests/=
functional/test_aarch64_device_passthrough.py
> index 1f3f158a9ff..73bb0df8aba 100755
> --- a/tests/functional/test_aarch64_device_passthrough.py
> +++ b/tests/functional/test_aarch64_device_passthrough.py
> @@ -77,15 +77,16 @@
>
>  class Aarch64DevicePassthrough(QemuSystemTest):
>
> -    # https://github.com/pbo-linaro/qemu-linux-stack
> +    # https://github.com/pbo-linaro/qemu-linux-stack/tree/device_passthr=
ough
> +    # $ ./build.sh && ./archive_artifacts.sh out.tar.xz
>      #
>      # Linux kernel is compiled with defconfig +
>      # IOMMUFD + VFIO_DEVICE_CDEV + ARM_SMMU_V3_IOMMUFD
>      # https://docs.kernel.org/driver-api/vfio.html#vfio-device-cde
>      ASSET_DEVICE_PASSTHROUGH_STACK =3D Asset(
> -        ('https://fileserver.linaro.org/s/fx5DXxBYme8dw2G/'
> -         'download/device_passthrough.tar.xz'),
> -         '812750b664d61c2986f2b149939ae28cafbd60d53e9c7e4b16e97143845e19=
6d')
> +        ('https://fileserver.linaro.org/s/bz9cjSGPgWJ2iQT/'
> +         'download/device_passthrough_v2.tar.xz'),
> +         '5e892ee9ea4d1348e673524485ecfb960f748dfdd76dbc396347b1781a4f42=
52')
>
>      # This tests the device passthrough implementation, by booting a VM
>      # supporting it with two nvme disks attached, and launching a nested=
 VM
> --
> 2.47.2
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Tested-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

