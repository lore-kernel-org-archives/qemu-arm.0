Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2807733wrq;
        Thu, 24 Oct 2019 12:46:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+SKANQ+dsL3uX58xjwDa9wqUsY5X/+YK7IJGMj3gVsOFyLk+2VgkB5a10TISXcCMXYwXT
X-Received: by 2002:a05:620a:2052:: with SMTP id d18mr15283967qka.418.1571946404711;
        Thu, 24 Oct 2019 12:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571946404; cv=none;
        d=google.com; s=arc-20160816;
        b=qWiLComc9xeG9RwpLtW8ph1awKjsLkLSH+cL34z7GlZoQt/jwtIYumSnC4hyNMyOeu
         C7dYdzGfpC6KcFMhUHdvuY6vh1tKizo5UzhGV3dbBzhYfyj/7FWSQ3qApNPK534MFG8s
         D54vXMTioI+E8ok+IlMn4k3icrHoF8rBozPWynTCpiLKVObsmsmHDHduCWFZBL4t3D7D
         erGElsqjGvilMF1oG1ONtdOY9i45sAsZxwYCHofXO14alAyWFRTH+FakInn+RE/hSgOL
         kdupPQfX3A8byX64k5AmzIoxYztkS+6N31XWQj3Pk3iNqt7UGh9H+gJCM1lNBFOweJbU
         rbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lnAYmR6Fer1VdLam9d7Nb/NG6LPwhu4DS+4i9N3sN4s=;
        b=ahI5Tl+45uMox/ltnQyg4OLWnAumsxQ6lg6ErHIm72nQSu891jy4LCoHd8bahP+vHv
         sKp2C2GfjgWGL4g+nHW2tp5Lzn9Qp7lsMeL9NFjgb+BSDHFG2wSqy1uPpgCriDQdL+RV
         3zGM2KWlwDcdv18wgcEaHwGwdU1kieAA5P5pShW+WhJxV6ngHcN5Rn32n2RmPpA03PCn
         H/w0FVrC3FteCjLRT9kop81/tWuzzFydOhw3eBKQyKRr1DroPoLqrz4aO6pw33Pc01e4
         D7is46CCu4SDwZ/k6Tcvk/an7GcPGVwX616ayIaQQ1aN5NbuO4m5TSej8t6gCD2/0aaA
         6Iyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=K+tMb5cP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si6134926qvn.81.2019.10.24.12.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 12:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=K+tMb5cP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNj4G-0002n6-4G
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 15:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iNj3t-0002bR-7s
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 15:46:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iNj3q-0006It-Vk
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 15:46:20 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42744)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iNj3o-0006IC-Sl; Thu, 24 Oct 2019 15:46:17 -0400
Received: by mail-wr1-x444.google.com with SMTP id r1so17586823wrs.9;
 Thu, 24 Oct 2019 12:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lnAYmR6Fer1VdLam9d7Nb/NG6LPwhu4DS+4i9N3sN4s=;
 b=K+tMb5cPv1d1UgyE17ABor+OaHEn12rIc2ONtFYe8dal1FRHR10PimtqOShqfbpsiU
 lG+Xzx5RshheboW2wj6MXVxgBdKnLTENKZ2tE/wPW+P0HjsywV9NCargzw2g6hOoKLrk
 Vdvc5RY+Ys7CJaqR07fwNced0DcZVYmjda0el7B3MiVnQQTG0He8GbVKmwMwaVYSX574
 lAH73PoVE2WHKSY9/wNZsSPdy5JzCv+kOk3vqia1ymyfs0sOtV8ItTi1oT1gb2b9k3VO
 IfDVCjO2E2lZJiqggy4wyInkc13uZn/8zhk06+5+a1juAJNxzezg1V4r2g/9B5a0JjH7
 tyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lnAYmR6Fer1VdLam9d7Nb/NG6LPwhu4DS+4i9N3sN4s=;
 b=puzrzaIYvZWeWRNTM8BmNzh6UQ5TCE5FpMjteSEjZJAvbtFJMm7iIUgnGJJXvjyQa7
 +C7HoS98pCzkTUIuDuYVu0rXUK33RkIPba03T/1q60G7/1Aj4JIIT8bMK9BkVNJG33jM
 +vTpa5+wmY3AX1zaeSbQAeGIp9kbwc4qmzLK44HtWAHzrFHkeqkpg+dyvE8b1dNO8Xwo
 uP3X7HGNCyzFrAkIzcAJgMoprQMItmtzSPoE8SXGlty6xi4iXe61hDQj0S5LmSnPQ6RJ
 moX3mfQTqiQkqEWg4u651G7gVYzl8usXQd1e2hz7ubGJ3FL786P7H6iqS6EfiYddFz79
 m0vw==
X-Gm-Message-State: APjAAAXZYA/D1Nlsf9Ona6b6L3Z7+RErGhndzPBzoAfnYjX9uUXvORt0
 nuUAibMc72EMtA5JsnZb+fw=
X-Received: by 2002:a5d:5544:: with SMTP id g4mr5579310wrw.72.1571946373969;
 Thu, 24 Oct 2019 12:46:13 -0700 (PDT)
Received: from [192.168.1.115] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id c21sm3279245wmb.46.2019.10.24.12.46.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 12:46:13 -0700 (PDT)
Subject: Re: [PATCH v3 00/16] hw/arm/raspi: Add thermal/timer, improve address
 space, run U-boot
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191019234715.25750-1-f4bug@amsat.org>
 <CAFEAcA_WTyJ2AWZfKQSipFmn46ztG1XTL9sE9P2QDD7ob-FKFg@mail.gmail.com>
 <CAFEAcA-0qg+VbE6VQpdCAX5g6=GzZG18j_FoiamHR8YrKHrmFg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <345d8200-6b8d-2708-ef16-c34698a5bd9f@amsat.org>
Date: Thu, 24 Oct 2019 21:46:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-0qg+VbE6VQpdCAX5g6=GzZG18j_FoiamHR8YrKHrmFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Pete Batard <pete@akeo.ie>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5vtLzXKbaM7J

On 10/24/19 5:31 PM, Peter Maydell wrote:
> On Thu, 24 Oct 2019 at 14:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Sun, 20 Oct 2019 at 00:47, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> Since v2:
>>> - fixed issue in videocore address space
>>> - allow to start with some cores OFF (to boot firmwares)
>>> - add proof-of-concept test for '-smp cores=1' and U-boot
>>> - fixed my email setup
>>>
>>> Previous cover:
>>>
>>> Hi,
>>>
>>> Some patches from v1 are already merged. This v2 addresses the
>>> review comment from v1, and add patches to clean the memory
>>> space when using multiple cores.
>>>
>>> Laurent, if you test U-Boot with this patchset again, do you mind
>>> replying with a "Tested-by:" tag?
>>>
>>> The next patchset is probably about the interrupt controller blocks,
>>> then will come another one about the MBox/Properties.
>>>
>>> The last patch is unrelated to the series, but since I cleaned this
>>> for the raspi and the highbank is the only board with the same issue,
>>> I included the patch in this series.
>>
>> I'm going to apply 1-10 and 14 to target-arm.next.
>> (I've reviewed 10, and the rest have been reviewed.)
> 
> ...but that causes tests/boot-serial-test to throw
> a clang sanitizer error and then hang:
> 
> e104462:bionic:clang$ QTEST_QEMU_BINARY=arm-softmmu/qemu-system-arm
> ./tests/boot-serial-test
> /arm/boot-serial/raspi2:
> /home/petmay01/linaro/qemu-from-laptop/qemu/memory.c:2517:27: runtime
> error: null pointer passed as argument 2, which is declared to never
> be null
> /usr/include/stdlib.h:819:6: note: nonnull attribute specified here
> 
> The offending patch is "hw/arm/bcm2836: Use per CPU address spaces"
> (patch 7). So I'm dropping 7/8/9.

With -bios, raspi.c::setup_boot() we call
  -> load_image_targphys[_as]
     -> rom_add_file_fixed_as
        -> rom_add_file with mr=NULL, as=set

vl.c::main() call
  -> rom_check_and_register_reset

         if (!rom->mr) {
             as = rom->as;
         }
         section = memory_region_find(rom->mr
                                      ? rom->mr
                                      : get_system_memory(),
                                      rom->addr, 1);

In my patches I stop using system_memory, each CPU use its
own AS view on the GPU AXI bus.

Apparently we can not (yet) live without a system_memory bus.

At this point I can use the RAM memory region because
setup_boot() is called from raspi_init().

What is odd is load_image_targphys[_as]() get a 'addr' argument
(as an offset within the address space) but load_image_mr() don't
take offset, only loads at base (offset=0). Neither it takes a
'max_sz' argument.

This snippet fixed the issue:

-- >8 --
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 569d85c11a..eb84f74dc7 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -111,7 +111,8 @@ static void reset_secondary(ARMCPU *cpu, const 
struct arm_boot_info *info)
      cpu_set_pc(cs, info->smp_loader_start);
  }

-static void setup_boot(MachineState *machine, int version, size_t ram_size)
+static void setup_boot(MachineState *machine, int version,
+                       MemoryRegion *ram, size_t ram_size)
  {
      static struct arm_boot_info binfo;
      int r;
@@ -149,9 +150,9 @@ static void setup_boot(MachineState *machine, int 
version, size_t ram_size)
       */
      if (machine->firmware) {
          hwaddr firmware_addr = version == 3 ? FIRMWARE_ADDR_3 : 
FIRMWARE_ADDR_2;
+
          /* load the firmware image (typically kernel.img) */
-        r = load_image_targphys(machine->firmware, firmware_addr,
-                                ram_size - firmware_addr);
+        r = load_image_mr(machine->firmware, firmware_addr, ram);
          if (r < 0) {
              error_report("Failed to load firmware from %s", 
machine->firmware);
              exit(1);
@@ -211,7 +212,7 @@ static void raspi_init(MachineState *machine, int 
version)

      vcram_size = object_property_get_uint(OBJECT(&s->soc), "vcram-size",
                                            &error_abort);
-    setup_boot(machine, version, machine->ram_size - vcram_size);
+    setup_boot(machine, version, &s->ram, machine->ram_size - vcram_size);
  }

  static void raspi2_init(MachineState *machine)
diff --git a/hw/core/loader.c b/hw/core/loader.c
index a3f5333258..0f11d1104a 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -137,7 +137,7 @@ int load_image_targphys_as(const char *filename,
      return size;
  }

-int load_image_mr(const char *filename, MemoryRegion *mr)
+int load_image_mr(const char *filename, hwaddr addr, MemoryRegion *mr)
  {
      int size;

@@ -152,7 +152,7 @@ int load_image_mr(const char *filename, MemoryRegion 
*mr)
          return -1;
      }
      if (size > 0) {
-        if (rom_add_file_mr(filename, mr, -1) < 0) {
+        if (rom_add_file_mr(filename, addr, mr, -1) < 0) {
              return -1;
          }
      }
diff --git a/include/hw/loader.h b/include/hw/loader.h
index 48a96cd559..9cb47707de 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -65,6 +65,7 @@ int load_image_targphys(const char *filename, hwaddr,
  /**
   * load_image_mr: load an image into a memory region
   * @filename: Path to the image file
+ * @addr: Address to load the image to (relative to the memory region)
   * @mr: Memory Region to load into
   *
   * Load the specified file into the memory region.
@@ -73,7 +74,7 @@ int load_image_targphys(const char *filename, hwaddr,
   * If the file is larger than the memory region's size the call will fail.
   * Returns -1 on failure, or the size of the file.
   */
-int load_image_mr(const char *filename, MemoryRegion *mr);
+int load_image_mr(const char *filename, hwaddr addr, MemoryRegion *mr);

  /* This is the limit on the maximum uncompressed image size that
   * load_image_gzipped_buffer() and load_image_gzipped() will read. It 
prevents
@@ -293,8 +294,8 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict);
      rom_add_file(_f, NULL, _a, _i, false, NULL, NULL)
  #define rom_add_blob_fixed(_f, _b, _l, _a)      \
      rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL, NULL, true)
-#define rom_add_file_mr(_f, _mr, _i)            \
-    rom_add_file(_f, NULL, 0, _i, false, _mr, NULL)
+#define rom_add_file_mr(_f, _a, _mr, _i)            \
+    rom_add_file(_f, NULL, _a, _i, false, _mr, NULL)
  #define rom_add_file_as(_f, _as, _i)            \
      rom_add_file(_f, NULL, 0, _i, false, NULL, _as)
  #define rom_add_file_fixed_as(_f, _a, _i, _as)          \
---

rom_add_file_mr() is mostly used by ARM, so it'll be easy to
update the other calls.

Regards,

Phil.
