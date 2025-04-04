Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4691985njd;
        Fri, 4 Apr 2025 03:50:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXl5sfreaWeiKX7YKO6FbTyQVdFtRzlpzs5kcAxmnzQ0HILXATQTFu976B96469CfgR7HgDTvbRYa2hAw==@linaro.org
X-Google-Smtp-Source: AGHT+IEyAWf962Kh1K+vFlSsVbpFeS9GcT7smH9LvQx/VWQOYlM7SPaXjNEA4hkRXSkFl6BrbPND
X-Received: by 2002:a05:6902:2805:b0:e6b:7cdf:b0f1 with SMTP id 3f1490d57ef6-e6e1c4420demr4381712276.38.1743763808478;
        Fri, 04 Apr 2025 03:50:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743763808; cv=none;
        d=google.com; s=arc-20240605;
        b=HmnDcgJAs3y0wDoR5lqLJmSSSzUvSPP/6gXtwyVPCnnfK3ze9ftq655YwZYDoasSWR
         i2R9ElSdPVXfM1g5Gsa61uc1I3Tj0Or2A0Z7awzB0JAnKQS34T5q2l54ShyA+6FeP102
         rDP/7820G0E06QwUE/C7AeS8qAlQxCf2l8U8NylgVeMijDXiPzF+a2ugYKQD8XpDUXTX
         9QoHKpuzFzUXYgh8s/reD1/e4ULTmG3+93K4cqqnUE7W4qxOgJ09jqQhjkAYoRahMK7l
         QDpJq563IUiYoyrTGN9pqpLjpcWlAPDNhPud7+psHaebco6PY9TpPI9DOfT4N+oTw2yZ
         dOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=ddYwADTyrqwJqBtWA7rQk7UmIqfDE1M0appHUMQyH6k=;
        fh=ooid+HsgIDLyowyld/QXJTLSBoTBuU/K7WrmQUeF25I=;
        b=V8Z0OMHjiObFaq+9th5lyvoXqKz1j6M2/8XDFmUyLLsNJfQc//5nPzSQR/MFYfPbRZ
         JhxsE/itgkm5uokjvJ95xAe3yBIaUNuULcBORZVZ9lAb06b7DBSCVmI4p64hhH+Mqxn0
         bstp2YivhsjTFXYUvhic0dNGGZxbT6MkJPRYV7xLo5lBuaLFFzjzHjDZHMlQxMmv6b+u
         /JNCvdYZtuWd/FEHWn4Z8M8krHqVM/nY4dJLoXvhlcb06189IAXv8kfYc+9kU+7Ppesg
         63kBDymh60qw3GDwETfu8er7Cd4SUUXllHBMrX95VDSkaz0GFW1keXMX+VjNyJ6JRAD1
         eo0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KkEQxnnZ;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e6e0c6ca672si4496472276.121.2025.04.04.03.50.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:50:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KkEQxnnZ;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743763808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddYwADTyrqwJqBtWA7rQk7UmIqfDE1M0appHUMQyH6k=;
	b=KkEQxnnZl1Z7pjTvNU0PVskL4dvzjWO4EscDAns2FpNolNIF6NVgrG590CI0lOvDAkbFz/
	L4GeDcBI+/5+HmOu42LgOQe/UnB+qiFVjqReIEABhT676DOmu3SW7NfSG13GpxH2Ne3JVW
	/n/L6LihbQyW0iEV/FsRfoCmfkezZgg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-xnEYgEFUM2GPu-nZl2QNBQ-1; Fri, 04 Apr 2025 06:50:05 -0400
X-MC-Unique: xnEYgEFUM2GPu-nZl2QNBQ-1
X-Mimecast-MFC-AGG-ID: xnEYgEFUM2GPu-nZl2QNBQ_1743763804
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d51bd9b45so12475795e9.1
        for <alex.bennee@linaro.org>; Fri, 04 Apr 2025 03:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743763804; x=1744368604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ys1LfRF5ONz/v75SJU9//rf+2uXauDMfR0ipKMSR4Q=;
        b=FlYW3JWunCLhv5jfz902+4Oc9eHRoprN3vPdt4K01wjEuTEKaK2xD0w80OMzy4E3sX
         Qv5eKE8DZHTZESuavKlhuX4W5HT5tGamSBYPkjsZXP1pmj/GUlqIbXEpTA0ViBTq98cD
         9AxT/tr78hLgWhNHrMYzX3RUZx/Kiyb9EEP6eHy+fffVYiiKWpcf7GyaYgw8Akop39mQ
         0gA19qPYhT7rLLYLhmtgRQciiHoBDS0flaCJZndTbX2fjmz4CgOuzHNHgvIMFUn4Pz8B
         LuFuibvwbSe/Y1xXQEoOur83mfggKzhJYpm0CaxtbFzyJsKAdPBN4IaFYBtPDKrFaiRu
         VVGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsctSSNm6uf/m6QH2TCVcX+hrXeIuxdmfXpOAzny+4jS8uC5DHcxd6P2B48Vjx/0CuiljsVdyL/2iexQ==@linaro.org
X-Gm-Message-State: AOJu0YwssJp1ZN1SolFODtB5h0LjrthSbeZUG5C6kH/mxQACqssk0Uko
	RZ7W+LHzhNxBZI22zV86jt1Lv3V1q4hE+8yzItPVj3/0v1ZFQv+HpvL0BXonBHx3ZJliioN4G18
	c892wZvqWjZgaG7CSCceKlhL0FCj2P1w/SKzZXuxx/vUrKJCt/cMIOg==
X-Gm-Gg: ASbGnculkdAmtaSkOFvP5Al2mrlhoRq+eSiotAttdJuNAteBVsyKG+7BEWplM2PgGTB
	s85fp13B103/mVpwRY9sAhCC4toOTeAAgYqjP6Us0j+Mn+sFzMFoAFK0d/EWB9bG/gcYsC+I+Sm
	PoWQNnwe+GW8tfS+Edq03DNK4/PmzwTH4VBOPxUaWD3SpUufytItNaTSKPBoykaW8uSDeSiCrtT
	IfL0TkQrJuBe/zctTN8yR3Ur9z2CTZWremzgwhgheWJlMLfLemU21Lg0NWb2drk+r+igLUFypJ7
	FZJouly667kdBtmY/9f/uDDtTYrDENIcHr73
X-Received: by 2002:a05:600c:1c92:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-43ecfa05104mr20018115e9.29.1743763803844;
        Fri, 04 Apr 2025 03:50:03 -0700 (PDT)
X-Received: by 2002:a05:600c:1c92:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-43ecfa05104mr20017795e9.29.1743763803450;
        Fri, 04 Apr 2025 03:50:03 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a7615sm42303545e9.9.2025.04.04.03.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:50:02 -0700 (PDT)
Date: Fri, 4 Apr 2025 12:50:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Gustavo Romero
 <gustavo.romero@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Ani Sinha <anisinha@redhat.com>, Udo
 Steinberg <udo@hypervisor.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones
 <ajones@ventanamicro.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Fabiano Rosas <farosas@suse.de>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>
Subject: Re: [PATCH-for-10.0? v2 11/14] qtest/bios-tables-test: Whitelist
 aarch64/virt 'its_off' variant blobs
Message-ID: <20250404125001.66c6eb61@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250403151829.44858-12-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
	<20250403151829.44858-12-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dxnyOHuwPv85q3PGdEeCvp6FqOS7bsBp9BNRmPAJK-Q_1743763804
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: q548O7qUTEEb

On Thu,  3 Apr 2025 17:18:26 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> We are going to fix the test_acpi_aarch64_virt_tcg_its_off()
> test. In preparation, copy the ACPI tables which will be
> altered as 'its_off' variants, and whitelist them.
>=20
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |   3 +++
>  tests/qtest/bios-tables-test.c              |   1 +
>  tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 0 -> 184 bytes
>  tests/data/acpi/aarch64/virt/FACP.its_off   | Bin 0 -> 276 bytes
>  tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 0 -> 236 bytes
>  5 files changed, 4 insertions(+)
>  create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
>  create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
>  create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
>=20
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
> index dfb8523c8bf..3421dd5adf3 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,4 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/APIC.its_off",
> +"tests/data/acpi/aarch64/virt/FACP.its_off",
> +"tests/data/acpi/aarch64/virt/IORT.its_off",

1) separate patch for this please=20

> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index baaf199e01c..55366bf4956 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2151,6 +2151,7 @@ static void test_acpi_aarch64_virt_tcg_its_off(void=
)
>      test_data data =3D {
>          .machine =3D "virt",
>          .arch =3D "aarch64",
> +        .variant =3D ".its_off",
>          .tcg_only =3D true,
>          .uefi_fl1 =3D "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 =3D "pc-bios/edk2-arm-vars.fd",
ditto

and the same for blobs below as well (commit message for those shall
contain relevant diff for changes or explain why there is none).
blobs update seems to be a bit confusing at this point (aka unexpected).

looking at this patch, I'd make a copy 1st, then '.variant =3D ".its_off",'=
 patch
and only then whitelist right before patches that would actually change
tables.

> diff --git a/tests/data/acpi/aarch64/virt/APIC.its_off b/tests/data/acpi/=
aarch64/virt/APIC.its_off
> new file mode 100644
> index 0000000000000000000000000000000000000000..c37d05d6e05805304f10afe73=
eb7cb9100fcccfa
> GIT binary patch
> literal 184
> zcmZ<^@O0k6z`($=3D+{xeBBUr&HBEVSz2pEB4AU24G0Uik$i-7~iVgWL^17JJ`2AFzr
> bgb+@aBn}xq0gwb2)Q)cq{30-g9B_L93G4|0
>=20
> literal 0
> HcmV?d00001
>=20
> diff --git a/tests/data/acpi/aarch64/virt/FACP.its_off b/tests/data/acpi/=
aarch64/virt/FACP.its_off
> new file mode 100644
> index 0000000000000000000000000000000000000000..606dac3fe4b55c31fd68b25d3=
a4127eeef227434
> GIT binary patch
> literal 276
> zcmZ>BbPf<<WME(uaq@Te2v%^42yj*a0-z8Bhz+8t3j|P&V`N}P6&N^PpsQ~v$aVnZ =20
> CVg~^L
>=20
> literal 0
> HcmV?d00001
>=20
> diff --git a/tests/data/acpi/aarch64/virt/IORT.its_off b/tests/data/acpi/=
aarch64/virt/IORT.its_off
> new file mode 100644
> index 0000000000000000000000000000000000000000..0fceb820d509e852ca0849baf=
568a8e93e426738
> GIT binary patch
> literal 236
> zcmebD4+?q1z`(#9?&R<65v<@85#X!<1dKp25F11@1F-=3DRgMkDCNC*yK9F_<M77!bR
> zUBI%eoFED&4;F$FSwK1)h;xBB2Py`m{{M%tVD>TjFfcO#g+N#Zh@s|zoCF3AP#UU@ =20
> R!2`+%Dg6Hr$N|zYvjDIZ5CH%H
>=20
> literal 0
> HcmV?d00001
>=20
