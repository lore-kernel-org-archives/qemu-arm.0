Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp671942ejt;
        Tue, 20 Jun 2023 23:36:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Hm8ggb9W71pmYAZW5LxN6Viz4tPs25RPm0bDDzKzgTxg4DWAN59Nh7eGijAy/mxF5KYeu
X-Received: by 2002:a05:620a:3b05:b0:762:4e28:8e3d with SMTP id tl5-20020a05620a3b0500b007624e288e3dmr9213767qkn.40.1687329401518;
        Tue, 20 Jun 2023 23:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687329401; cv=none;
        d=google.com; s=arc-20160816;
        b=Q2Y34PCJvA3p//nLzjvc8+Wq3/bOqp01yZhJ6tp2o8IACB/tvY69NMga4BOtL16XpO
         pgUMdzdG7UeO5cjOq98LMOJNppYJtdTgFlnEq14d3Ql9NFwzY2euchrN1BnLEltfw3j4
         IsR7IMgKO0mAqhOEjFATNqk03XkNnY53MYlRyOLJbtujnbJ35XZ0JrKu2ivr+Pahjkyo
         YC85abL5eAbdvbn/5cXApoIj8dc0uH2/WtRK85mKbxt1uwbQEIVVbls/z3oJTmEaWR/G
         khr1cpDDSOVeSM1pJBJxhhjLKsop+lNAXrP3YvnOm0AQBrMI42Rvyp/Xlz07D4Y1v518
         cCrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=E1922YpPcDrvKqrIN3oBTikN+/54fWK8SaVDSBVBzHM=;
        b=wQ3aRgFCXxcd9Q439RiyF25xwbVuobRffbYSxubN19k7hSxIEag+NPjZCsjOBFPUdn
         WS59V3YRy2FomNbxRNmnrg2Xbk9iPNQpRvXyAigACsf2cOLqfFjW/+0q+1uyR8N8mIeT
         LI7zl7Ky6zz9bWJNyVQKWwpWs+42IRNnp2Llf2ecYEIZwOFCXAAYdvl2A9WHSNxZMciP
         sL8o+zX/UdwvMU1rBa7y4aoDl22RHI/UHoaxEbDiivCaPRnZ8/ENbBxlNNUqI2w8e2Zf
         IfrmbZrbS7L+pDk2J3t/IpxkdmI+OvuAyaKVOWJX9cGd5g91SkIGl+IVupzbDsbjFXJd
         LX+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b="iJ/dyuUf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020a05620a01e600b0075f03c005a2si1462214qkn.208.2023.06.20.23.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 23:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b="iJ/dyuUf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBrRR-0001l9-QB; Wed, 21 Jun 2023 02:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qBrQj-0001bI-4Z; Wed, 21 Jun 2023 02:35:05 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qBrQh-000643-0J; Wed, 21 Jun 2023 02:35:00 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6b597fd6bc8so1193884a34.1; 
 Tue, 20 Jun 2023 23:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687329296; x=1689921296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=E1922YpPcDrvKqrIN3oBTikN+/54fWK8SaVDSBVBzHM=;
 b=iJ/dyuUfdIvrOznOeK1iZb7JVbHetObXBBUJpDljNhre4SrCLblpcfiInD7htJC+S6
 EI3hM5FFhcc//453x3Biv48mwYGgGhhlvcuW1mwBMhMCefl94N6nU+PA1wRdMIeQmc8d
 wK0N87DpzK8bIYE1f3ybpb2jItvWCy4bZhziX5YNMP5BK9O9LJXWny3uJaAxvz+DomAB
 pOswFpq5LzrSx5+CdyYfYShuXHChiwB/2GDqWzVedxXvrk9vciuzMNyCuaOZ5Ssd4DLy
 lAJ2KUAvQ0id21IKpPQo9gWlxrxqScA30lZL+d0w014iZaj0C8/pXKs5yDHrZ3W378ZQ
 LCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687329296; x=1689921296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E1922YpPcDrvKqrIN3oBTikN+/54fWK8SaVDSBVBzHM=;
 b=bI8l4F2MOr0hEZGQNwabvUPxl1EpJcCKVKq2S+2j5pFOuY1q7JoWQC+SNpUiZDoOhO
 xzM4KqDFpoJ6i1r2UQuBdLTG539JsUCPwYm40x8VNqn39xefz8SAlV503c7dW9UXiPHE
 UOEcJrx5EqOwNFzkULsx7TG3vblq1Rm5Kn0h1kaIZHyI0jOlhnIU1/Krl4nR3htanIU6
 9N7WyAbQ3fSv9Easdhy9DZEW4ZREDo3H6rbnrjmMJDYGjuu56H5KHQg/FT+J+FeauY4j
 /r0GhvWLXkWuRlx6eq63cvnelC0o2ws6P6T/y7oLLw84mIRdYlHYwhcVmvbdqKDWARoZ
 1UxQ==
X-Gm-Message-State: AC+VfDxu8GbFfo25obdhPcInKxeoCUGFgOoavwG0HeDcVwG2PyJJX74a
 FPLeGG6Uz73zcF4T+Y0ATBY=
X-Received: by 2002:a9d:6455:0:b0:6b3:d369:9c0a with SMTP id
 m21-20020a9d6455000000b006b3d3699c0amr8402238otl.19.1687329296326; 
 Tue, 20 Jun 2023 23:34:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a63e055000000b00502f4c62fd3sm2361080pgj.33.2023.06.20.23.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 23:34:54 -0700 (PDT)
Date: Tue, 20 Jun 2023 23:34:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v4 6/6] hw/riscv: Enable TPM backends
Message-ID: <d9007e92-c2d2-4ce6-aaf8-9d8d37b2d119@roeck-us.net>
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
 <20220420055248.960491-7-alistair.francis@opensource.wdc.com>
 <3c07be7c-4af2-4a2b-8b0a-236e2f6a4a62@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c07be7c-4af2-4a2b-8b0a-236e2f6a4a62@roeck-us.net>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: KheLwTS+qDri

On Mon, Jun 19, 2023 at 01:32:34PM -0700, Guenter Roeck wrote:
> Hi Alistair,
> 
> On Wed, Apr 20, 2022 at 03:52:48PM +1000, Alistair Francis wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> > 
> > Imply the TPM sysbus devices. This allows users to add TPM devices to
> > the RISC-V virt board.
> > 
> > This was tested by first creating an emulated TPM device:
> > 
> >     swtpm socket --tpm2 -t -d --tpmstate dir=/tmp/tpm \
> >         --ctrl type=unixio,path=swtpm-sock
> > 
> > Then launching QEMU with:
> > 
> >     -chardev socket,id=chrtpm,path=swtpm-sock \
> >     -tpmdev emulator,id=tpm0,chardev=chrtpm \
> >     -device tpm-tis-device,tpmdev=tpm0
> > 
> > The TPM device can be seen in the memory tree and the generated device
> > tree.
> > 
> I tried to get this working with qemu 8.0, but I did not have any success.
> I am quite sure I have the above command line correctly, and it does work
> with arm64. Any idea what I might be missing ?
> 

Answering my own question: Nothing. The problem is that the devicetree
is created too early, before the tpm device is instantiated/realized in
qemu. The tpm device therefore does not show up in devicetree, and the
tom device does not instantiate in Linux. The patch below fixes the problem
for me.

Any comments / thoughts ? Is that change acceptable, or should it be
implemented differently ?

Thanks,
Guenter

---
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e3efbee16..ea259d7ade 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1247,6 +1247,11 @@ static void virt_machine_done(Notifier *notifier, void *data)
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
 
+    /* create devicetree if not provided */
+    if (!machine->dtb) {
+        create_fdt(s, memmap);
+    }
+
     /*
      * Only direct boot kernel is currently supported for KVM VM,
      * so the "-bios" parameter is not supported when KVM is enabled.
@@ -1519,15 +1524,13 @@ static void virt_machine_init(MachineState *machine)
     }
     virt_flash_map(s, system_memory);
 
-    /* load/create device tree */
+    /* load device tree */
     if (machine->dtb) {
         machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
         if (!machine->fdt) {
             error_report("load_device_tree() failed");
             exit(1);
         }
-    } else {
-        create_fdt(s, memmap);
     }
 
     s->machine_done.notify = virt_machine_done;
