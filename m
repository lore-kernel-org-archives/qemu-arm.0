Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BE2EDEBEB
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 19:43:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxVde-00061i-JP; Tue, 03 Mar 2026 14:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxVdZ-00060U-H2
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 14:42:33 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxVdX-0007lA-W0
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 14:42:33 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-439b7c2788dso1711564f8f.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 11:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772566950; x=1773171750; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZhrc4DYAQhRxd65bNwlgwb6AMDI/4IUd46/7qeG4f4=;
 b=DdNmIVAc0AZtR4aFT6Dg2wBUxIKaXMgmU2jIkFV4eSmxXxj0D3lojU80byF0bdtVRd
 Tqu6J++fwaTW65lKa/NcGrXOuyZZ560RtayiHOXbRFIf5xmk6scxGIhHz/kYSIdX5I1J
 WUgyNYZOfGpIx64Tdt3Sm6N2Xx9IIkKOi9QLh4DsXiNKjM+TacC7tqoBwp9gNRmzXpTi
 rpTPYxCP1P6s8+2kwz1rv8xHZK+pbdiLBa0ubFSS15TH5ZHtKqIwfOW4QiU/F6kfRkZk
 mjGaWSA5uBSWUb4EQlhkqGRzQUcuWdpKWRqgRFbj8+iAkr+8katIW6qh272xY1WH8zPU
 OjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772566950; x=1773171750;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vZhrc4DYAQhRxd65bNwlgwb6AMDI/4IUd46/7qeG4f4=;
 b=dRwSJRd99V4n16s23vPU9wxtSIxyKIBq+iM8kACr2acORQ3wYHJf6c1tHSnwC0BqvL
 cPPrTRFM1WiTUN6yusr2NUcK/yhGpiidu70ALeTVrT38qkCCxLG0K1ELWFhGvfUdI6wg
 kg7dueBPbIDwIPcsl/JJcpUQ4qt3iQtQcqqwmbFFHgdKsddk+/OQ0q25hdx6TxbB4v3n
 R2eVCFdEFva53sXxCOWTT47KIn9erEsI0TJ5hLUDcoXWvnnfJRgJLAy/MuC2Lz54tcTP
 VHwxa/E2S1fSoNk0VEkGaZ1+yjKOemUa3Wqclh6451sQjKezTJspKUJu1nj9MKw6nzf4
 ggxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIUNIfKMK1ybvbxp0tpbeGKmtOaRE5Bxf1Fd9sAU8ocfLR0/VqD1eE/14oYKTih4UmIXtwZxjakg==@nongnu.org
X-Gm-Message-State: AOJu0YzX4x9S3p4PdZBC90cj3zLzfK7jsNDX9/EZWgMpiCCNiV/x9lM9
 juyIwspcakXEPZ0Riin0+JjMPWbM5IABrBnTtuTjXcGaruoGb1sCr+QR
X-Gm-Gg: ATEYQzwlLBcdDNXtkAZpkrlvwgfGeoQyX3wMwLx40p1fRC6wYkfiC0TfXiNiGysUafb
 radSb2pxKilSPF2aS3p4tNaQ7qVe6uWyPc5pdeG9NywR6lrTjVXDltPiT5xMwE/LGPHDGQfH6ge
 aAnzsi/rpfUx97F2G/DML1r8KqXr6VxzQtXkTt97WZBCB6UkCTkh/ZTH7DmkQ/zcVp/yiv0ruSe
 WhR5HoGt9Ne32W6vn+eY0fL+6yzBPaoQb1+AlfguhiXcFFYMxufxdm0ODFKwgH23By1jbpI+jCD
 3Jyfn//WWN2ngsd9OKWO6trhyXYw3YdV0bE10uUTZSs35JQJQd1FR6bEyLp5dZ2vd7y+pYP+Vmd
 N+uaYwKUN6/gPO5fyPvOmDOCfYIX+zhLASc4RernlEJFG3gpd8xRWUJ0JTZSWFWIXSwq4KEyiaw
 0B6WBSvOMLd8cJUqWsVMY4SZMhgWft3hi88cts/pKnTqZzZUjiwvViaoZKB2K/ovdScvb46Vbjt
 8oubyVc0upr+ni0A46CMbnXGOstCwSb1OkAbpEjgkmulbOQS5gYmMolCg==
X-Received: by 2002:a05:6000:402a:b0:439:c550:d933 with SMTP id
 ffacd0b85a97d-439c550db5amr2812407f8f.41.1772566949675; 
 Tue, 03 Mar 2026 11:42:29 -0800 (PST)
Received: from ehlo.thunderbird.net
 (dynamic-2a02-3100-1c79-b600-f009-a6c9-39e7-d8fe.310.pool.telefonica.de.
 [2a02:3100:1c79:b600:f009:a6c9:39e7:d8fe])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c4489279sm4059553f8f.20.2026.03.03.11.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 11:42:29 -0800 (PST)
Date: Tue, 03 Mar 2026 18:43:32 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_08/12=5D_hw/char/serial=3A_Av?=
 =?US-ASCII?Q?oid_implicit_conversion_when_tracing?=
In-Reply-To: <CAFEAcA8+Xj=vgG5s9y1Mk=NcJKk2x6=x9RntR+3deaqtk-JThA@mail.gmail.com>
References: <20260302220254.1166849-1-shentey@gmail.com>
 <20260302220254.1166849-9-shentey@gmail.com>
 <CAFEAcA8+Xj=vgG5s9y1Mk=NcJKk2x6=x9RntR+3deaqtk-JThA@mail.gmail.com>
Message-ID: <408EC5FC-277C-4E54-8B68-44954464F01C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



Am 3=2E M=C3=A4rz 2026 11:34:01 UTC schrieb Peter Maydell <peter=2Emaydell=
@linaro=2Eorg>:
>On Mon, 2 Mar 2026 at 22:03, Bernhard Beschow <shentey@gmail=2Ecom> wrote=
:
>>
>> On 64 bit targets, the MemoryRegion API passes an address and a value a=
s
>> uint64_t, so use that for tracing=2E Keep the uint8_t for reading since
>> this is what the device model produces=2E On targets with less than 64
>> bits, uint64_t is wide enough to avoid narrowing=2E
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  hw/char/trace-events | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/char/trace-events b/hw/char/trace-events
>> index 9e74be2c14=2E=2Ea3fcc77287 100644
>> --- a/hw/char/trace-events
>> +++ b/hw/char/trace-events
>> @@ -5,8 +5,8 @@ parallel_ioport_read(const char *desc, uint16_t addr, u=
int8_t value) "read [%s]
>>  parallel_ioport_write(const char *desc, uint16_t addr, uint8_t value) =
"write [%s] addr 0x%02x val 0x%02x"
>>
>>  # serial=2Ec
>> -serial_read(uint16_t addr, uint8_t value) "read addr 0x%02x val 0x%02x=
"
>> -serial_write(uint16_t addr, uint8_t value) "write addr 0x%02x val 0x%0=
2x"
>> +serial_read(uint64_t addr, uint8_t value) "[0x%02" PRIx64 "] -> 0x%02"=
 PRIx8
>> +serial_write(uint64_t addr, uint64_t value) "[0x%02" PRIx64 "] <- 0x%0=
2" PRIx64
>>  serial_update_parameters(uint64_t baudrate, char parity, int data_bits=
, int stop_bits) "baudrate=3D%"PRIu64" parity=3D'%c' data=3D%d stop=3D%d"
>
>We know that the value being written fits in one byte, though,
>because we just asserted that size =3D=3D 1 before trace_serial_write()=
=2E

Well, we as humans know it but the compiler doesn't, so it will perform im=
plicit conversion=2E The format string will still print it as a byte=2E Any=
 issues with that?

Best regards,
Bernhard

>
>-- PMM

