Received: by 10.25.205.13 with SMTP id d13csp9905701lfg;
        Thu, 5 Jan 2017 11:46:30 -0800 (PST)
X-Received: by 10.200.49.148 with SMTP id h20mr67132734qte.204.1483645590190;
        Thu, 05 Jan 2017 11:46:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c190si38493108qkb.162.2017.01.05.11.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jan 2017 11:46:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPDzX-0004Ye-F4
	for alex.bennee@linaro.org; Thu, 05 Jan 2017 14:46:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david.engraf@sysgo.com>) id 1cPDzJ-0004RE-Pi
	for qemu-arm@nongnu.org; Thu, 05 Jan 2017 14:46:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david.engraf@sysgo.com>) id 1cPDzG-0004mH-M8
	for qemu-arm@nongnu.org; Thu, 05 Jan 2017 14:46:13 -0500
Received: from mail.sysgo.com ([176.9.12.79]:51422)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david.engraf@sysgo.com>)
	id 1cPDzG-0004m5-9I; Thu, 05 Jan 2017 14:46:10 -0500
To: Peter Maydell <peter.maydell@linaro.org>
References: <d15e8de4-f7d8-1c28-7e5e-31d0aa10819d@sysgo.com>
	<CAFEAcA8pXJ3g5e7rw6_FAhnbZfLOOoX-gaavyzKug0y=gDCuQQ@mail.gmail.com>
From: David Engraf <david.engraf@sysgo.com>
Message-ID: <23f1afdd-e9cb-95de-19b9-59a81941e374@sysgo.com>
Date: Thu, 5 Jan 2017 20:46:05 +0100
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8pXJ3g5e7rw6_FAhnbZfLOOoX-gaavyzKug0y=gDCuQQ@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------FBD59632452ACC9FB9791A3D"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 176.9.12.79
Subject: Re: [Qemu-arm] [PATCH] vexpress fix flash device-width
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +yXHkfVHqICX

This is a multi-part message in MIME format.
--------------FBD59632452ACC9FB9791A3D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 05.01.2017 um 19:32 schrieb Peter Maydell:
> On 22 December 2016 at 14:02, David Engraf <david.engraf@sysgo.com> wrote:
>> The current implementation uses width = 4 and device-width = 2 for the flash
>> configuration. When using u-boot or Linux, the flash is detected as 32 x 16
>> bit, thus the sector size is doubled to 512 KB. When u-boot sends a sector
>> erase, only the first 256 KB are erased because the QEMU flash
>> implementation uses the configured sector size of 256 KB and ignores the
>> width and device-width ratio.
>>
>> This patch will change device-width to 4, thus the width and device-width
>> are equal and u-boot detects the flash as 32 x 32 bit with the correct
>> sector size of 256 KB.
>
> Thanks for this patch. However I'm not sure it is correct, because
> I think the real hardware does have 2x16 devices here. On real vexpress
> TC2 if you boot Linux it detects the flash as:
> "8000000.flash: Found 2 x16 devices at 0x0 in 32-bit bank.
> Manufacturer ID 0x000089 Chip ID 0x008919"
>
> So while we presumably have a QEMU bug if this isn't behaving
> like the hardware, I don't think that changing the device-width to
> 4 is the right fix for it. Maybe:
>  * our erase implementation is broken?
>  * one of the other parameters we use to create the flash
>    is wrong?
>  * the calculation of the erase block information that we put in
>    the flash cfi_table[] is wrong?
>
> (Does u-boot hard-code the erase block sizes, or does
> it read them from the CFI data? QEMU's flash doesn't have the
> hardware's two-eraseblock-regions setup where part of the disk is
> 256K erase-blocks and part is 64K blocks, but if u-boot doesn't
> hardcode that it should be able to read the data from QEMU's
> flash implementation.)

u-boot and Linux are using the same way to detect the sector erase size:

size_ratio = info->portwidth / info->chipwidth;

In our case we have a width of 4 and a device-width of 2. Thus the per 
device sector erase size is doubled from 256K to 512K. This calculation 
is correct because an erase command is send to both chips, each erasing 
256K.

So there are two ways to fix this, depending how the QEMU property 
"sector-length" should be interpreted. If the parameter specifies the 
per device sector length, we have to fix the length in the erase 
command. The other way would be to expect "sector-length" as the overall 
sector size, which makes more sense in my eyes. Thus in our case this 
value is halved and the result is stored in the CFI table. BTW this is 
equal to blocks_per_device which is already calculated by the overall 
number of blocks divided by num_devices.

I did a quick test with the attached patch and it was working in Linux. 
Please have a look at the attached patch, if this is what you expect, I 
will send a new mail with the correct description.

> Also, for patches to QEMU we need you to provide a
> Signed-off-by: line to say that you're happy to contribute the
> patch to QEMU. More detail about what this means here:
> http://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line
> (the other details of patch formatting are mostly nice-to-haves,
> but the s-o-by line is a hard requirement.)

Sorry, forgot this.

Thanks
- David


--------------FBD59632452ACC9FB9791A3D
Content-Type: text/x-patch;
 name="fix_pflash_sector_len.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="fix_pflash_sector_len.patch"

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 5f0ee9d..8bb61e4 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -703,7 +703,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     pflash_t *pfl = CFI_PFLASH01(dev);
     uint64_t total_len;
     int ret;
-    uint64_t blocks_per_device, device_len;
+    uint64_t blocks_per_device, sector_len_per_device, device_len;
     int num_devices;
     Error *local_err = NULL;
 
@@ -727,7 +727,8 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
      */
     num_devices = pfl->device_width ? (pfl->bank_width / pfl->device_width) : 1;
     blocks_per_device = pfl->nb_blocs / num_devices;
-    device_len = pfl->sector_len * blocks_per_device;
+    sector_len_per_device = pfl->sector_len / num_devices;
+    device_len = sector_len_per_device * blocks_per_device;
 
     /* XXX: to be fixed */
 #if 0
@@ -839,8 +840,8 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     /* Erase block region 1 */
     pfl->cfi_table[0x2D] = blocks_per_device - 1;
     pfl->cfi_table[0x2E] = (blocks_per_device - 1) >> 8;
-    pfl->cfi_table[0x2F] = pfl->sector_len >> 8;
-    pfl->cfi_table[0x30] = pfl->sector_len >> 16;
+    pfl->cfi_table[0x2F] = sector_len_per_device >> 8;
+    pfl->cfi_table[0x30] = sector_len_per_device >> 16;
 
     /* Extended */
     pfl->cfi_table[0x31] = 'P';

--------------FBD59632452ACC9FB9791A3D--
