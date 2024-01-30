Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp983335ejk;
        Tue, 30 Jan 2024 09:49:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYGJCCgYjSWKMrBaHQdV1Yq64g1jqkcNoNdXZuCwwpVE2SPx7J4El9iuXAngUlO0BwhJZZ
X-Received: by 2002:ac8:5c4d:0:b0:42b:e140:a25b with SMTP id j13-20020ac85c4d000000b0042be140a25bmr643281qtj.114.1706636945364;
        Tue, 30 Jan 2024 09:49:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706636945; cv=none;
        d=google.com; s=arc-20160816;
        b=aNSNbijvoAd1sqaDyY4mhW92ll+FLIHbt9Nh4V682b2LtQQjT+rlB2/TG7eeBh6OpL
         5iEXzUxx8lpTM9sMXznAbpOYgm/lT0Q5+4jiGEjYAwggO81mIa+QnAH01hcJ7rRotDwn
         p8XvzCa+65xLnAmuwWgZBtbQ1KaoBMER3hQcIWsElinwOWkxTb9lhdDBRynv3NNH+hAc
         XUmBTq6Km9hbaH1Qfv6KMwiLDy36luEqY67+0QRRDfilL2N8hLlyFpmn/foNn0L4AVko
         utg7P6OxW+7EYweiPy4K1QamHd0q7PvkMhiB7xc5Z6mxKdRPN0mRm6KIK25yz2s0MiXi
         xIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4ajcHImPHMG5j+T6mgo3IE1RNBq4zS9VSGtDNA+nOrE=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=v7eCDy3xkXWfHaIjkS05HzHQ5PZT4nhIwiGahvEhfkCx7Ks3L2boT7NbNfrUX+2k1U
         GS+u61ybB8X8LhI6KJXxcff4vJPWMxLm9+6QV+n8NNpJfCB1t2x3MDAe4OuZeGCktTw8
         9ftHApyzbcCJpxqUebwv4Aqlhwm3TqMoVcSsYtmRPmVFp9tx7SwcdqtkW/MzXeLFfHOg
         Vb0Q7FJppKjLYwRBtntgbNgCJ/BviQ17A95j22VXPMiy+IT3wixZvitnXCJpZ2R2DQAj
         XqKghenCxE8gukik/IHkOXxgIAzjmHJ1bsaVge4f4+Pj6+X9sRdM+zULnzXygMkxZ/+N
         uTuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ncQkRzqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16-20020a05622a009000b0042aa6abad22si4824290qtw.279.2024.01.30.09.49.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 09:49:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ncQkRzqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUsDz-0008QL-86; Tue, 30 Jan 2024 12:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rUsDx-0008Pt-Dw
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 12:48:41 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rUsDv-0001xf-2o
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 12:48:41 -0500
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d057003864so15653871fa.3
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 09:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706636917; x=1707241717; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4ajcHImPHMG5j+T6mgo3IE1RNBq4zS9VSGtDNA+nOrE=;
 b=ncQkRzqS85l8eakvu6b8A36BzP9A9rFWX23a8SwAid0MDF+WxRUJWWIskAtoMxagaX
 9I7CYjVYMBUFCeK/Tn/Jk4aDscjyooKDWVDXqcoihz/AqGT0fhsegolxezHae68CdZtD
 DHzZWcG77MzX1Kz58kllkblKlL9Vx+f+hRrXx4w8aFXFQ5Vk0eklbV66iu6lZlhK+XaG
 tfxFR0rMblLQSQmcJR6EmecvRbghSjSP80aCtHoAsorjN8Dfj3sSjzbu853S9ex/PGsV
 GyiwM+qO3w5v+6dt5hT0dUYZGID86uV1Kw4khkXQMjAe+S2xeMpA1wEFopGmjB1Arkqb
 pLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706636917; x=1707241717;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ajcHImPHMG5j+T6mgo3IE1RNBq4zS9VSGtDNA+nOrE=;
 b=Bqb+fQJz4qKaT2BiRBxdPkNIg7AYLEUs98xMhMRn0UkQMBm+6zGT6TYxUDs9zXdWGh
 scGbaaXB+f5jxeBO9oVBJx3z/KWR5EfcVWnlRDoxolmbLMCy8TVSick8CEnP4TA/xBXE
 9bjxvTVw9g8/m71RtznUCw7y30x1ZE/2d5XgZ8SDWCY36lyRa3yXkS7g1OrbRgxXVftV
 LuM/eDv4jtEoaageXWyZuJAyNlz4Zf/008jjfLhqhq1lCQR4tVlP2zhb5wnfCXheT1N8
 dlQMRxQ2CnFBQxoofm8juL65eyXZ5mfq91A+4tBPL1fV1w6VU5bCYEkPsEN3Wdo9EFZA
 t0Cw==
X-Gm-Message-State: AOJu0YxJbQjPCgMqJyKzBRy5DotpLATfr+CwVnAvcj8QYh1pA2P8ezic
 Jtf9VsFnRIar4AO+fwu84SWd2QldTLTA1X64j/ogtY5mYa7ETZvpbl/EczbjNKCBrL6DuScw3rG
 TrAPhyhgRgljbXknj3sttc0BuZ9BJj97K7LhbDQ==
X-Received: by 2002:a05:651c:14f:b0:2cd:fafc:1700 with SMTP id
 c15-20020a05651c014f00b002cdfafc1700mr5411843ljd.53.1706636916836; Tue, 30
 Jan 2024 09:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20240125194247.1589037-1-nabihestefan@google.com>
 <20240125194247.1589037-2-nabihestefan@google.com>
In-Reply-To: <20240125194247.1589037-2-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jan 2024 17:48:25 +0000
Message-ID: <CAFEAcA94oEX6Rc9Gf7QPgNWjhhXfP4mXoacJmurbSF0h0U7ybA@mail.gmail.com>
Subject: Re: [PATCH v15 1/9] hw/misc: Add Nuvoton's PCI Mailbox Module
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x232.google.com
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
X-TUID: HreTt3aAB/q5

On Thu, 25 Jan 2024 at 19:42, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Hao Wu <wuhaotsh@google.com>
>
> The PCI Mailbox Module is a high-bandwidth communcation module
> between a Nuvoton BMC and CPU. It features 16KB RAM that are both
> accessible by the BMC and core CPU. and supports interrupt for
> both sides.
>
> This patch implements the BMC side of the PCI mailbox module.
> Communication with the core CPU is emulated via a chardev and
> will be in a follow-up patch.
>
> This patch also adds documentation on the PCIe Protocol used
> by the chardev device.
>
> Change-Id: Iaca22f81c4526927d437aa367079ed038faf43f2
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  docs/specs/pci_mbox_chardev.rst    | 159 ++++++++++++++

Sphinx insists that every .rst file under docs
is specifically listed in a table of contents somewhere.
In this case that means you should list the new file
in docs/specs/index.rst.

If you configure with '--enable-docs' that should ensure
that you have all the prerequisites to build the documentation
and you ought then to get an error message during build
about the missing toc entry problem, so you can be sure you've
fixed it correctly.

You'll also find that there are other markup syntax errors you
need to fix (eg on my system sphinx complains
"pci_mbox_chardev.rst:29:Unexpected indentation.").

You should also look at the generated HTML to make sure
it renders as you expect it to. I suspect that your ascii-art
diagrams of the protocol packets are not going to render
correctly as they stand.

>  hw/misc/meson.build                |   1 +
>  hw/misc/npcm7xx_pci_mbox.c         | 335 +++++++++++++++++++++++++++++
>  hw/misc/trace-events               |   5 +
>  include/hw/misc/npcm7xx_pci_mbox.h |  81 +++++++
>  5 files changed, 581 insertions(+)
>  create mode 100644 docs/specs/pci_mbox_chardev.rst
>  create mode 100644 hw/misc/npcm7xx_pci_mbox.c
>  create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h
>
> diff --git a/docs/specs/pci_mbox_chardev.rst b/docs/specs/pci_mbox_chardev.rst
> new file mode 100644
> index 0000000000..2a26e6bb8f
> --- /dev/null
> +++ b/docs/specs/pci_mbox_chardev.rst
> @@ -0,0 +1,159 @@
> +Remote PCIe Protocol
> +====================
> +
> +Design
> +------
> +The communication or this device is done via a chardev. It is bidirectional:

"of" ?

> +QEMU can send requests to devices and the device can send MSI/DMA requests
> +to QEMU. All registers are encoded in Little Endian.

Lower case for "little endian".

> +
> +To distinguish between the two types of messages, any message with an error
> +code described below is a response, otherwise it is a request. The remote
> +PCIe device is responsible for guaranteeing the messages sent out are
> +integrated.

What does it mean to "integrate" a message ?

> +
> +The highest bit for the first byte reflects whether a message is a request
> +or response - 0 for request and 1 for response.
> +
> +For responses, the rest of the bits reflect the error code.
> +For requests, the rest of the bit is the command code specified below.
> +
> +
> +Initialization
> +--------------
> +During initialization of the remote PCIe device in QEMU, it needs to specify
> +a few configuration parameters. The PCIe connector is responsible for
> +getting these configuration parameters and passing them in as QDev
> +properties
> +The fields include:
> + 1. PCI endpoint device identifiers (google3/platforms/asic_sw/proto/device_identifiers.proto).

A google internal filename isn't much use to the rest of us :-)

> +     a. Vendor ID
> +     b. Device ID
> +     c. Subsystem Vendor ID
> +     d. Subsystem Device ID
> +     e. Class Code
> +     f. Subclass
> +     g. Programming Interface
> +     h. Revision ID
> + 2. Number of BARs and the size of each BAR
> + 3. Whether DMA is supported.
> + 4. Number of MSI vectors supported (must be power of 2, up to 32)
> +
> +Request and Reponse Breakdowns
> +------------------------------
> +PCI Endpoint R/W Request
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +QEMU can send this request to endpoint.
> +ReadData
> +Request:
> ++------+------+--------+-----------+-----------+
> +| Byte | 0    | 0x1    | 0x2 ~ 0x9 | 0xa       |
> +| Data | 0x01 | bar_no | offset    | read_size |
> ++------+------+--------+-----------+-----------+
> +(read_size in number of bytes, must be between 1 and 8)
> +Response:
> +Success:
> ++------+------+-------------------+
> +| Byte | 0    | 0x1 ~ read_size+1 |
> +| Data | 0x80 | data              |
> ++------+------+-------------------+
> +Failure:
> ++------+-------------------+
> +| Byte | 0                 |
> +| Data | 0x80 | error_code |
> ++------+-------------------+

This doesn't seem to match what your test code does:
it sends an OP_READ 0x1 then a 4-byte offset then
a 1 byte size, with no "bar_no" field. Also there seems
to be some confusion of direction here -- the test
case is sending this command to QEMU, not receiving it
from QEMU.

You also don't seem to define what valid error codes are.

> +
> +WriteData
> +Request:
> ++------+------+--------+-----------+------------+------+
> +| Byte | 0    | 0x1    | 0x2 ~ 0x9 | 0xa        | 0xb~ |
> +| Data | 0x02 | bar_no | offset    | write_size | data |
> ++------+------+--------+-----------+------------+------+
> +(write_size in number of bytes, must be between 1 and 8)
> +Response:
> ++------+-------------------+
> +| Byte | 0                 |
> +| Data | 0x80 | error_code |
> ++------+-------------------+

Similarly the test code does not send a bar_no when it
does an OP_WRITE.

This version of your patches still do not pass "make check"
on a big-endian host:

# random seed: R02Sa53abdba65b5f469bda76c1ea679af7e
# port=51945
# starting QEMU: exec ./build/aarch64/qemu-system-aarch64 -qtest
unix:/tmp/qtest-1105084.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-1105084.qmp,id=char0 -mon
chardev=char0,mode=control -display none -audio none -machine
npcm750-evb -chardev
socket,id=npcm7xx-pcimbox-chr,host=localhost,port=51945,reconnect=10
-global driver=npcm7xx-pci-mbox,property=chardev,value=npcm7xx-pcimbox-chr
-accel qtest
1..3
# Start of aarch64 tests
# Start of npcm7xx_pci_mbox tests
ok 1 /aarch64/npcm7xx_pci_mbox/invalid_op
# sending 8 bytes
# response code: 0
# sending 4 bytes
# response code: 0
ok 2 /aarch64/npcm7xx_pci_mbox/read
# receiving 8 bytes
# response code: 0
# receiving 4 bytes
# response code: 0
**
ERROR:../../tests/qtest/npcm7xx_pci_mbox-test.c:215:test_guest_write:
assertion failed (strncmp(data, buf, len) == 0): (-1 == 0)
Bail out! ERROR:../../tests/qtest/npcm7xx_pci_mbox-test.c:215:test_guest_write:
assertion failed (strncmp(data, buf, len) == 0): (-1 == 0)
Aborted (core dumped)

Please find a big-endian system and make sure that "make check"
passes on it before submitting the next round of this patchset.


I think the reason for the failure is:

> +static void npcm7xx_pci_mbox_send_response(NPCM7xxPCIMBoxState *s, uint8_t code)
> +{
> +    qemu_chr_fe_write(&s->chr, &code, 1);
> +    if (code == NPCM7XX_PCI_MBOX_OK && s->op == NPCM7XX_PCI_MBOX_OP_READ) {
> +        qemu_chr_fe_write(&s->chr, (uint8_t *)(&s->data), s->size);

s->data is a uint64_t field, but here we cast its address
to a uint8_t* and then send that data directly out to the
chardev. That will send different data depending on the endianness
of the host. You need to send the s->size low-order bits
of s->data in little endian order, if that's what your protocol
spec defines, which you aren't doing.

Also, if you call qemu_chr_fe_write() you need to handle
the return value. This is a *non-blocking* write, and it
returns the number of bytes it managed to write. If this is
less then you asked for then you need to arrange to try again
later to write the rest of the data (eg using qemu_chr_fe_add_watch()
to arrange for a callback when the chardev frontend is ready
to accept more data).

(If working with the non-blocking write is really impossible,
then the blocking function is qemu_chr_fe_write_all(), but that
then has the possibility of hanging QEMU if the thing on the
other end of the chardev doesn't ever read the data.)

> +    }
> +}
> +
> +static void npcm7xx_pci_mbox_handle_read(NPCM7xxPCIMBoxState *s)
> +{
> +    uint8_t offset_bytes[4];
> +    MemTxResult r = memory_region_dispatch_read(
> +        &s->ram, s->offset, &s->data, MO_LE | size_memop(s->size),
> +        MEMTXATTRS_UNSPECIFIED);
> +
> +    stl_le_p(offset_bytes, r);

This is really weird. MemTxResult is a QEMU internal value
which tells you whether the transfer succeded or not, but we
do a byteswap to LE on it and then look at the least significant
byte in the array. That ends up with exactly the same thing that
you could have got by just passing 'r' as the argument to
npcm7xx_pci_mbox_send_response(). But you don't want to do
that anyway, because MemTxResult is a QEMU internal type, and you
need to convert from that to whatever your protocol defines as the
permitted/valid error/success values.

> +    npcm7xx_pci_mbox_send_response(s, offset_bytes[0]);
> +}
> +
> +static void npcm7xx_pci_mbox_handle_write(NPCM7xxPCIMBoxState *s)
> +{
> +    uint8_t offset_bytes[4];
> +    MemTxResult r = memory_region_dispatch_write(
> +        &s->ram, s->offset, s->data, MO_LE | size_memop(s->size),
> +        MEMTXATTRS_UNSPECIFIED);
> +
> +    stl_le_p(offset_bytes, r);
> +    npcm7xx_pci_mbox_send_response(s, offset_bytes[0]);

Same remarks here about weird use of stl_le_p().

> +}

> +static const VMStateDescription vmstate_npcm7xx_pci_mbox = {
> +    .name = "npcm7xx-pci-mbox-module",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, NPCM7xxPCIMBoxState,
> +                             NPCM7XX_PCI_MBOX_NR_REGS),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
> +// The chardev device is expected to run using Little Endian protocol
> +// All requests and responses should be expected to be in LE, and if
> +// not should be translated into LE to assure proper working of the device.

This is not in the standard QEMU comment style.

> +static Property npcm7xx_pci_mbox_properties[] = {
> +    DEFINE_PROP_CHR("chardev", NPCM7xxPCIMBoxState, chr),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void npcm7xx_pci_mbox_class_init(ObjectClass *klass, void *data)
> +{
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "NPCM7xx PCI Mailbox Controller";
> +    dc->vmsd = &vmstate_npcm7xx_pci_mbox;
> +    dc->realize = npcm7xx_pci_mbox_realize;
> +    rc->phases.enter = npcm7xx_pci_mbox_enter_reset;
> +    rc->phases.hold = npcm7xx_pci_mbox_hold_reset;
> +    device_class_set_props(dc, npcm7xx_pci_mbox_properties);
> +}
> +
> +static const TypeInfo npcm7xx_pci_mbox_info = {
> +    .name               = TYPE_NPCM7XX_PCI_MBOX,
> +    .parent             = TYPE_SYS_BUS_DEVICE,
> +    .instance_size      = sizeof(NPCM7xxPCIMBoxState),
> +    .class_init         = npcm7xx_pci_mbox_class_init,
> +    .instance_init      = npcm7xx_pci_mbox_init,
> +};
> +
> +static void npcm7xx_pci_mbox_register_type(void)
> +{
> +    type_register_static(&npcm7xx_pci_mbox_info);
> +}
> +type_init(npcm7xx_pci_mbox_register_type);

thanks
-- PMM
