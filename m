Received: by 10.80.163.71 with SMTP id 65csp1649139edn;
        Mon, 26 Sep 2016 14:26:39 -0700 (PDT)
X-Received: by 10.237.36.200 with SMTP id u8mr24280865qtc.152.1474925199641;
        Mon, 26 Sep 2016 14:26:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a72si1878662qkg.290.2016.09.26.14.26.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Sep 2016 14:26:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bodQ7-0001i9-5W
	for alex.bennee@linaro.org; Mon, 26 Sep 2016 17:26:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bodQ3-0001hu-BF
	for qemu-arm@nongnu.org; Mon, 26 Sep 2016 17:26:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bodPy-000891-5X
	for qemu-arm@nongnu.org; Mon, 26 Sep 2016 17:26:34 -0400
Received: from mail-lf0-f46.google.com ([209.85.215.46]:35448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>)
	id 1bodPx-00084k-Nk; Mon, 26 Sep 2016 17:26:30 -0400
Received: by mail-lf0-f46.google.com with SMTP id l131so159815893lfl.2;
	Mon, 26 Sep 2016 14:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=vO+lLdj5CjVMC5R3qdAfSa4DFpagMjjeTR986M9bZrQ=;
	b=cE0qmuigwHYSVqGMzwSd23RuuPDH8oW6bXeDqIojKAlmRP+NDo+v257Pkp1UXpxG1o
	VXRU+ShnS6IraLQkeP8+bQ0nCdVfpaNuk4nWrtRT9cbUzdAHwQVRJJnjwOTN9AsXlPXm
	Sz8CvcugMaYKOAXN7zb+XzlPvA4CH0CaX4onv57XNj04LiVXEq1AtECXWTZ5/rc2zK+Z
	xQfq4KopKkwb5gHvDe7az+fIxRGXmtGuwOJYlUwuIlc9Dzmz2vESOVOKJKZV9SIThYQR
	hWv2w/vrY4H9MLSGiPwnzY/+pwoqm+6wen9I2iItyDQu/DdvU23oL2LMEZ4jngxdyxWR
	pNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=vO+lLdj5CjVMC5R3qdAfSa4DFpagMjjeTR986M9bZrQ=;
	b=W5tvHL3ME7xqFmzOKLSjTp3Jo6XrpLEKzERJPj8lHp9XSNTlSdybM/E2A9n8suAAxB
	BQpdEB0Cw+/Wbb/qd2Zsa63QHBcP3AFHwTU2bje5eRrhJNtUW2A3cj+Ows260c0eDANT
	aBwZQu+AJeyHfVR/VJ0lWaXzu6Lq10nv2/PFchHG3RSIzJPGoufQYgAq46Fs4j0I/HnD
	i+fQGPADQP2Rtc4osbq65/DiB2tHMOu7RIwiP5czjZDgx808m4yCjPhNb6v8344ZgSiv
	ub+44WNR/ic4n9VvRaMiPBKIeEdAbYawQoXHaSgv8zI3GUKHFh9T/0ioOwS/4HjH3pRB
	q9Jw==
X-Gm-Message-State: AE9vXwPHNtmZ4hgcBXEPz4sUynpCxavTYDsie0+MigNvpW423B+ooMVlFXXkhpamyO95RA==
X-Received: by 10.46.33.14 with SMTP id h14mr8049218ljh.22.1474925106307;
	Mon, 26 Sep 2016 14:25:06 -0700 (PDT)
Received: from [192.168.75.104] (89-70-175-65.dynamic.chello.pl.
	[89.70.175.65]) by smtp.gmail.com with ESMTPSA id
	g99sm3975535lji.43.2016.09.26.14.25.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 14:25:04 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	KONRAD Frederic <fred.konrad@greensocs.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
	<2c52c156-2a32-b437-acd2-af13faaef55d@kaod.org>
	<CAFEAcA_MOhS04HiAVWg5xB8xBQ=krfZC6OBnH+X7UBo2_rf1uA@mail.gmail.com>
	<673755bd-c971-eb34-99b6-ac874a0d9a98@kaod.org>
	<78e298ed-b182-0fdf-99b7-de0324665b33@gmail.com>
	<723852a7-a5ab-9acb-cea9-4a5637b8eada@kaod.org>
	<20160924085505.GA5931@toto>
	<0e9974da-2523-25a0-7c66-fa178f84818b@greensocs.com>
	<84c94d46-f40b-f19f-1505-ace622ae1f99@kaod.org>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <5fc2107d-6761-a01c-3240-599dc04c36d2@gmail.com>
Date: Mon, 26 Sep 2016 23:25:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <84c94d46-f40b-f19f-1505-ace622ae1f99@kaod.org>
Content-Type: multipart/alternative;
	boundary="------------6E7D537C8B01B932FCACFC83"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.46
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/7] m25p80: add a
 m25p80_set_rom_storage() routine
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	mark.burton@greensocs.com, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2gTjKCECeYM/

This is a multi-part message in MIME format.
--------------6E7D537C8B01B932FCACFC83
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



W dniu 26.09.2016 o 10:56, Cédric Le Goater pisze:
> On 09/26/2016 10:25 AM, KONRAD Frederic wrote:
>>
>> Le 24/09/2016 à 10:55, Edgar E. Iglesias a écrit :
>>> On Sat, Sep 24, 2016 at 10:25:39AM +0200, Cédric Le Goater wrote:
>>>> On 09/23/2016 08:26 PM, mar.krzeminski wrote:
>>>>> Hi Cedric,
>>>>>
>>>>> W dniu 23.09.2016 o 10:28, Cédric Le Goater pisze:
>>>>>> On 09/23/2016 10:17 AM, Peter Maydell wrote:
>>>>>>> On 23 September 2016 at 08:19, Cédric Le Goater <clg@kaod.org> wrote:
>>>>>>>> But the goal is to boot from the device, so I added a memory region alias
>>>>>>>> at 0 to trigger the flash module mmios at boot time, as this is where
>>>>>>>> u-boot expects to be.
>>>>>>>>
>>>>>>>> and I fell in this trap :/
>>>>>>>>
>>>>>>>>           aspeed_smc_flash_read: To 0x0 of size 1: 0xbe mode:0
>>>>>>>>           Bad ram pointer (nil)
>>>>>>>>           Aborted (core dumped)
>>>>>>>>
>>>>>>>> There is a failure in get_page_addr_code(), possibly because qemu uses
>>>>>>>> byte per byte reads of the code (cpu_ldub_code). But this is beyond my
>>>>>>>> understanding of qemu's internal.
>>>>>>> This is a bug in how we report the problem, but the underlying
>>>>>>> issue here is attempting to execute from something that's not RAM
>>>>>>> or ROM. You can't execute code out of something backed by MMIO.
>>>>>> OK. So I see two solutions. T
>>>>>>
>>>>>> The "brutal" one which is to copy the flash contents in a rom blob
>>>>>> at 0, but there is still an issue in getting access to the storage
>>>>>> anyhow, as it is internal to m25p80. Or we should get the name of the
>>>>>> backing file of the drive but I am not sure we are expected to do
>>>>>> that as I don't see any API for it.
>>>>>>
>>>>>> The other solution is something like this patch which lets the storage
>>>>>> of the flash device be assigned externally.
>>>>> Since I do not like dirty hacks in the code, I want just to suggest a
>>>>> workaround, that probably you will not like ;]
>>>> It's a feature ! :)
>>> CC: Mark and Fred
>>>
>>> I agree, I think these are fair attempts to try to solve a real problem.
>>>
>>>
>>>> I am just trying to find a solution to this issue. So, we could also
>>>> introduce a routine :
>>>>
>>>> +uint8_t *m25p80_get_storage(DeviceState *dev, uint32_t *size)
>>>> +{
>>>> +    Flash *s = M25P80(dev);
>>>> +
>>>> +    *size = s->size;
>>>> +    return s->storage;
>>>> +}
>>>>
>>>> and use rom_add_blob_fixed() with the return values. Maybe this is less
>>>> intrusive in the m25p80 device model flow. Thoughts ?
>>>>
>>>>> As Qemu expects that first running code will be in ROM or RAM memory,
>>>>> you can implement in your board -bios option that you will use to
>>>>> pass u-boot binary to rom memory, or even use generic loader functionality
>>>>> when it reach master.
>>>> but if we use -bios <file> to have a ROM, we will need to pass a second
>>>> time <file> as a drive to have a CS0 flash slave:
>>>>
>>>>      -bios "flash-palmetto-test"  \
>>>>      -drive file="flash-palmetto-test",format=raw,if=mtd \
>>>>      -drive file="palmetto.pnor",format=raw,if=mtd
>>>>
>>>> This feels awkward. The virt platform and vexpress forbid that for
>>>> instance.
Just to clarify, I mean a use of -bios option or generic loader just to 
allow this board to boot from u-boot
by directly potting u-boot in the memory where flash should be mapped.
I will not solve memory mapped flash problem at all..
>>>>
>>>> Are there any other platform with similar need ?
>>> Yes, ZynqMP has a linear memory mapping of SPI memory contents. It gets
>>> slightly more complicated there as the mapping supports various modes
>>> including parallel SPIs with striping done by the controller (i.e
>>> bytes as seen via the linearly mapped area are interleaved from multiple
>>> SPI memories).
>>>
>>> So a plain RAM mapping of m25p80_get_storage won't work.
>>>
>>> A ROM version of the linear data might work at controller level. The controller
>>> would have to populate the ROM area at startup (slow) and keep it in sync for all
>>> writes. We would also need to signal write events so that TCG can flush it's
>>> caches. TCG only keeps track of modifications being made to cached code if changes
>>> are done with writes to RAM area (not if they happen indirectly via other registers).
I was trying that in a very simple way, I stopped because I used 128MiB 
Flash (memory consumption
and speed).
>>>
>>> Another solution is to implement support in TCG to execute from MMIO mapped areas.
>>> We'd also need to solve the problem of signalling content changes to TCG.
>>>
>>> I think these approaches have some overlap. Personally, I think TCG executing from
>>> MMIO areas would be quite useful. It's also useful for QEMU & SystemC integration.
I can agree here, this could solve this problem, and allow to do more.
>> Hi,
>>
>> The solution we are preparing for this is to allow a MMIO region to execute code
>> as Edgar just suggested by adding two callbacks:
> Yes it seems the best option to boot.
>
> The SPI controller I am working on maintains a set of mapping windows for
> each flash slave. But it's up to software to make sure the window size and
> the flash size are in sync. So, in a qemu world, we will need some flexibility
> if we want to access directly the flash storage. I don't think this patch is
> the right approach though. Let's boot first.
I believe we agree here. Exposing underlying file is to big shortcut,
from the other hand it will allow to boot from flash.
>
>>    - one which allows to get a pointer from an MMIO region nothing if
>>      execution is not possible from it and some hint to know if it's
>>      readable, writable.
>>    - one function to "invalidate" the pointer which will flush the tb,
>>      etc.
> I don't know enough about TCG to comment, I am very willing to give it
> a try when ever you have something ready.
I am also interested in testing that.

Thanks,
Marcin
> Thanks,
>
> C.
>
>> We have fixed a second issue fairly linked to this: if we do a DMA access to the
>> MMIO areas it is split in 1,2,4 bytes transaction which is really slow.
>


--------------6E7D537C8B01B932FCACFC83
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">W dniu 26.09.2016 o 10:56, Cédric Le
      Goater pisze:<br>
    </div>
    <blockquote cite="mid:84c94d46-f40b-f19f-1505-ace622ae1f99@kaod.org"
      type="cite">
      <pre wrap="">On 09/26/2016 10:25 AM, KONRAD Frederic wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">

Le 24/09/2016 à 10:55, Edgar E. Iglesias a écrit :
</pre>
        <blockquote type="cite">
          <pre wrap="">On Sat, Sep 24, 2016 at 10:25:39AM +0200, Cédric Le Goater wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">On 09/23/2016 08:26 PM, mar.krzeminski wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="">Hi Cedric,

W dniu 23.09.2016 o 10:28, Cédric Le Goater pisze:
</pre>
              <blockquote type="cite">
                <pre wrap="">On 09/23/2016 10:17 AM, Peter Maydell wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="">On 23 September 2016 at 08:19, Cédric Le Goater <a class="moz-txt-link-rfc2396E" href="mailto:clg@kaod.org">&lt;clg@kaod.org&gt;</a> wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="">But the goal is to boot from the device, so I added a memory region alias
at 0 to trigger the flash module mmios at boot time, as this is where
u-boot expects to be.

and I fell in this trap :/

         aspeed_smc_flash_read: To 0x0 of size 1: 0xbe mode:0
         Bad ram pointer (nil)
         Aborted (core dumped)

There is a failure in get_page_addr_code(), possibly because qemu uses
byte per byte reads of the code (cpu_ldub_code). But this is beyond my
understanding of qemu's internal.
</pre>
                  </blockquote>
                  <pre wrap="">This is a bug in how we report the problem, but the underlying
issue here is attempting to execute from something that's not RAM
or ROM. You can't execute code out of something backed by MMIO.
</pre>
                </blockquote>
                <pre wrap="">OK. So I see two solutions. T

The "brutal" one which is to copy the flash contents in a rom blob
at 0, but there is still an issue in getting access to the storage
anyhow, as it is internal to m25p80. Or we should get the name of the
backing file of the drive but I am not sure we are expected to do
that as I don't see any API for it.

The other solution is something like this patch which lets the storage
of the flash device be assigned externally.
</pre>
              </blockquote>
              <pre wrap="">Since I do not like dirty hacks in the code, I want just to suggest a
workaround, that probably you will not like ;]
</pre>
            </blockquote>
            <pre wrap="">
It's a feature ! :)
</pre>
          </blockquote>
          <pre wrap="">
CC: Mark and Fred

I agree, I think these are fair attempts to try to solve a real problem.</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <blockquote cite="mid:84c94d46-f40b-f19f-1505-ace622ae1f99@kaod.org"
      type="cite">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">


</pre>
          <blockquote type="cite">
            <pre wrap="">I am just trying to find a solution to this issue. So, we could also
introduce a routine :

+uint8_t *m25p80_get_storage(DeviceState *dev, uint32_t *size)
+{
+    Flash *s = M25P80(dev);
+
+    *size = s-&gt;size;
+    return s-&gt;storage;
+}

and use rom_add_blob_fixed() with the return values. Maybe this is less
intrusive in the m25p80 device model flow. Thoughts ?

</pre>
            <blockquote type="cite">
              <pre wrap="">As Qemu expects that first running code will be in ROM or RAM memory,
you can implement in your board -bios option that you will use to
pass u-boot binary to rom memory, or even use generic loader functionality
when it reach master.
</pre>
            </blockquote>
            <pre wrap="">
but if we use -bios &lt;file&gt; to have a ROM, we will need to pass a second
time &lt;file&gt; as a drive to have a CS0 flash slave:

    -bios "flash-palmetto-test"  \
    -drive file="flash-palmetto-test",format=raw,if=mtd \
    -drive file="palmetto.pnor",format=raw,if=mtd

This feels awkward. The virt platform and vexpress forbid that for
instance.</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
    <font size="-1">Just to clarify, I mean a use of -bios option or
      generic loader just to allow this board to boot from u-boot<br>
      by directly potting u-boot in the memory where flash should be
      mapped.<br>
      I will not solve memory mapped flash problem at all..</font><br>
    <blockquote cite="mid:84c94d46-f40b-f19f-1505-ace622ae1f99@kaod.org"
      type="cite">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="">

Are there any other platform with similar need ?
</pre>
          </blockquote>
          <pre wrap="">
Yes, ZynqMP has a linear memory mapping of SPI memory contents. It gets
slightly more complicated there as the mapping supports various modes
including parallel SPIs with striping done by the controller (i.e
bytes as seen via the linearly mapped area are interleaved from multiple
SPI memories).

So a plain RAM mapping of m25p80_get_storage won't work.

A ROM version of the linear data might work at controller level. The controller
would have to populate the ROM area at startup (slow) and keep it in sync for all
writes. We would also need to signal write events so that TCG can flush it's
caches. TCG only keeps track of modifications being made to cached code if changes
are done with writes to RAM area (not if they happen indirectly via other registers).</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <font size="-1">I was trying that in a very simple way, I stopped
      because I used 128MiB Flash (memory consumption<br>
      and speed).</font><br>
    <blockquote cite="mid:84c94d46-f40b-f19f-1505-ace622ae1f99@kaod.org"
      type="cite">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">

Another solution is to implement support in TCG to execute from MMIO mapped areas.
We'd also need to solve the problem of signalling content changes to TCG.

I think these approaches have some overlap. Personally, I think TCG executing from
MMIO areas would be quite useful. It's also useful for QEMU &amp; SystemC integration.</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <font size="-1">I can agree here, this could solve this problem, and
      allow to do more.</font><br>
    <blockquote cite="mid:84c94d46-f40b-f19f-1505-ace622ae1f99@kaod.org"
      type="cite">
      <blockquote type="cite">
        <pre wrap="">
Hi,

The solution we are preparing for this is to allow a MMIO region to execute code 
as Edgar just suggested by adding two callbacks:
</pre>
      </blockquote>
      <pre wrap="">
Yes it seems the best option to boot. 

The SPI controller I am working on maintains a set of mapping windows for 
each flash slave. But it's up to software to make sure the window size and 
the flash size are in sync. So, in a qemu world, we will need some flexibility 
if we want to access directly the flash storage. I don't think this patch is 
the right approach though. Let's boot first. </pre>
    </blockquote>
    <font size="-1">I believe we agree here. Exposing underlying file is
      to big shortcut,<br>
      from the other hand it will allow to boot from flash.</font><br>
    <blockquote cite="mid:84c94d46-f40b-f19f-1505-ace622ae1f99@kaod.org"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">  - one which allows to get a pointer from an MMIO region nothing if
    execution is not possible from it and some hint to know if it's
    readable, writable.
  - one function to "invalidate" the pointer which will flush the tb,
    etc.
</pre>
      </blockquote>
      <pre wrap="">
I don't know enough about TCG to comment, I am very willing to give it 
a try when ever you have something ready.
</pre>
    </blockquote>
    <font size="-1">I am also interested in testing that.<br>
      <br>
      Thanks,<br>
      Marcin<br>
    </font>
    <blockquote cite="mid:84c94d46-f40b-f19f-1505-ace622ae1f99@kaod.org"
      type="cite">
      <pre wrap="">
Thanks,

C.

</pre>
      <blockquote type="cite">
        <pre wrap="">We have fixed a second issue fairly linked to this: if we do a DMA access to the 
MMIO areas it is split in 1,2,4 bytes transaction which is really slow.
</pre>
      </blockquote>
      <pre wrap="">

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------6E7D537C8B01B932FCACFC83--
