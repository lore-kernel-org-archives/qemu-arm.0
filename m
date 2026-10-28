Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B745C606AB0F
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 19:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kHBnpJRb
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xM96s-0005ci-15; Wed, 28 Oct 2026 15:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xM96q-0005cN-SN
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 15:14:53 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xM96p-0004x2-3f
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 15:14:52 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa377c61so1965476a12.3
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 12:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793214887; cv=none;
 d=google.com; s=arc-20260327;
 b=O+5fseLZeHi0dKAe+UmIv7DlXju5zI5TwM1LA2+3EFPda0vmbx9uGaVtlKw+FzFfx7
 OQRxTuZRri4uI9hXqmdRp4pu9SUnJjVS8jjUhy7vbKKHGIyweg48AZNaJuXvca4u/yAu
 c7oTaPQh2xceDjh9SO8m4xErnkdN4z7p1RcLSuKKIZqG5sJG5QXVN9E+YLvlBmOtKKmH
 Sf6G5BgOwkIlPuxNvpSzXsw5yDdgZ4M0i4Vuiz+6mLK3mhCHomfWJ6OcBX1DTaDf56EM
 eI86M2EznAoClwAlRBqZwSt2J/X2l55gGMa4i1H6txp/DS0aOKlFhWn9M17nGIUECmnp
 VrrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=faK6rKBgMQPv3D/LENcLclP4Ya62UqVuzVudfJYBIeA=;
 fh=befLPKhY7X8hGZRvjJvA4by+fzrGSz8EJ5sDm5x0+4s=;
 b=p2X8g18jnyaXy+rZxfBMpGqIYE9zdnL9yEKfqIqKbKvLKw4ND7xhUi637HReCLAxbH
 RBRqekrxvH7DNjZArjoWhIeYx7otRbrwKJj2+W5VHEVcI9L+2rAzUJc3jXmXtjI1oC3C
 lTlp0ocokrH8usMhBj0igAdadj86ssfa007MDJ5aw7uQG4tDM00ncS367Yo4IAJmpWyy
 /wqqGGLjoM/8Wdwo81Aq1YFSoQJRr7mE80S/GJbVTI661yFCF1O90GhlItJD5J974HFn
 C5p8Jkc9iuP0P9AhMhG4s/Qb5M1kqpyGtunf1vH8lx/z2AHAmm3yY5dOAZ8/xbL4nSxY
 ZJpQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793214887; x=1793819687; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=faK6rKBgMQPv3D/LENcLclP4Ya62UqVuzVudfJYBIeA=;
 b=kHBnpJRbY+oL45ig0kTMyBqRcs6iwT/aQMHDo3wql+NnDegyVkLqwHOu8rsXbXA3Sa
 6qR6M11GH2FBVg9w362hTd+GDt2oHqv+pOH0UcAiE+HPE7F91Jp2A2eU8i8AITRLxrqB
 kv3d+grX5EsrAWeKJ3pZGlAM2r2tP9Px1vKNIornqXMOWxqmF9opuZL9qI7PYfrdPgxS
 bNt0p1xjJmAWFA2SJ/TyvUs00M8Mr/H6mZ3nCnx97j8duFJAfltoEEPG0GtwNbj/aVv9
 62y4cRpClwsMvl+UEv0xWfVHHUHp2jSBiPdkXzLw7jGCHkKdWFmlyPd5vt9EHTrGfFzf
 3jnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793214887; x=1793819687;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=faK6rKBgMQPv3D/LENcLclP4Ya62UqVuzVudfJYBIeA=;
 b=gIccxGBqSkPix3VBKVIsRIKKxoV8K/2JCpZpjH+/X4lHIHz+3HnMjUsYj5jnxp/A+o
 yJ2ZPVNFE/MoOubL9DOvqUNUwTosFMaLGMM1FX16gxI8bWY52RKKQop3SLNFAprCpWY6
 R5s7xhBLDPSjyyfuvk2RQWHasb2kukYANCp+0bod+78+QPn+BgQ19srkuOpoEkdJ4Zgw
 cNgsQHgHW3RiD+e9dRetbEbJVDFvkR0nR7pBwp4D0OtmdPMwAjuswjL6XeF9suCWCItF
 vVZvfYJoczPpaanohv4B85jWBNy9lMlGRrYzFKtryXxOje4eBNu/82w/nd4OlsLLHyqd
 TZPg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwhIaAyGWnlLb6HEWNYWTqnsdAFEQKnOoVesxym+9vnu8JW+UzdpLGBfsvVorLzRki37QFfEHAfbA==@nongnu.org
X-Gm-Message-State: AFq9FYIqF8bWwkdtkXSBqWtywsqw2UtLinWs0CRxKpoB/PTzH7Hv70ee
 B1qULepDjW3BQwAFVMZXxgL2niGcLDUVSdmZAaRuVrWNZsszEiF7CJf873GI2bzqDVVSjpvCfdi
 1uDfY50usb7qaz8bKBYX9KHoc+xh7Yn5Xni7NOgFX2g==
X-Gm-Gg: AYBFou0XjOHMXAOPInL0ITK6+9JTKyIKnAbusgjWfMp9K9zCBg1Bngg6OhACvdPMn90
 9iB3+Rm/+BBqWLQdi5KplIMv5E00a4HkP02q3wxVAhY2EWP2Wfm+/sixaLnuwXbJBQ/Hv7WC7LG
 uysO33WvQrKic5owb6Vvvtr7iulsu1D/Mckkq/ByFJBzWhAmQcIeEIsF5GXtT8xtX5nSoEDSR9m
 6Wopz+tXle6GsFZRQvDOb9XxZQmfnacklZQTZJ2tUJBIYZc6c1xvWok6VvF06YhS8lwtK35vxwz
 6J9OXh/+jmbM2CYGcsv8QZQVKKX8vA4UXPm0kKVtP9zM/cDomhizEvZZbdZk5IOeyqwnSgJ1e3l
 0lEvWfjwMOCFtAYPFr+mMJj06luSfqar2clEvA5qJE1MNJ3wL5ORfWoL2Ycytt5U0V02iSrqStx
 1YwN29WfCFDnAD9cb7qEdR
X-Received: by 2002:a17:907:724f:b0:c42:aec7:c805 with SMTP id
 a640c23a62f3a-c49bddacb95mr311770466b.3.1793214887373; Wed, 28 Oct 2026
 12:14:47 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028-stdout-path-baudrate-v1-1-34281c1f34ad@redhat.com>
In-Reply-To: <20261028-stdout-path-baudrate-v1-1-34281c1f34ad@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Oct 2026 19:14:35 +0000
X-Gm-Features: AclHuK_gHckEgw54qXS1HF21DocOKNo0-ohUutEL5tKCTgP3BTjT83-Our1gEUE
Message-ID: <CAFEAcA9t4-UCOY5fWy7VRuz7fXd-A1Dfo=OrDoMY9y03MBbkpg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: use alias and baudrate in stdout-path
To: Enric Balletbo i Serra <eballetb@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 at 18:29, Enric Balletbo i Serra
<eballetb@redhat.com> wrote:
>
> Set stdout-path to "serial0:115200n8" instead of the raw device node
> path, so that Linux can automatically configure the console from the
> device tree without requiring an explicit console=3D kernel argument.
> Apply the same fix to the secure UART stdout-path using "serial1:115200n8=
".
>
> Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
> ---
>  hw/arm/virt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0d56197dacee..d93850feafa4 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1529,8 +1529,9 @@ static void create_uart(const VirtMachineState *vms=
, int uart,
>                           clocknames, sizeof(clocknames));
>
>      if (uart =3D=3D VIRT_UART0) {
> -        qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", noden=
ame);
>          qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial0", nodename=
);
> +        qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path",
> +                                "serial0:115200n8");

Where is this binding documented? The kernel's Documentation/devicetree
doesn't mention chosen/stdout-path. The "Devicetree Specification"
v0.4 from devicetree.org says

"A string that specifies the full path to the node representing the device
to be used for boot console output. If the character =E2=80=9C:=E2=80=9D is=
 present in the
value it terminates the path. The value may be an alias. If the stdin-path
property is not specified, stdout-path should be assumed to define the
input device."

Which doesn't mention needing to specify baud rates at all, and sounds to
me like our current "nodename" is correct.

More generally, if the virt board's serial port is connected to something
virtual like stdout then the nominal baud rate is irrelevant, and if
it's connected passthrough to a real serial port then (a) our pl011
model doesn't actually implement that yet and (b) you would need to
match the actual baud rate the other end is expecting, which might
or might not be 115200. So what does this get us?

thanks
-- PMM

