Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 199sm10204588wmj.30.2017.07.11.09.26.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 09:26:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 355093E0BE6;
	Tue, 11 Jul 2017 17:26:21 +0100 (BST)
References: <20170711025703.24194-1-f4bug@amsat.org> <20170711025703.24194-2-f4bug@amsat.org> <446cc0e3-dd49-e088-85f1-0caf1d42fbf8@amsat.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-arm@nongnu.org, Anthony Perard <anthony.perard@citrix.com>, Marcelo Tosatti <mtosatti@redhat.com>, xen-arm@lists.xen.org, Anoob Soman <anoob.soman@citrix.com>, Juergen Gross <jgross@suse.com>, Anthony Xu <anthony.xu@intel.com>, Paul Durrant <paul.durrant@citrix.com>
Subject: Re: [RFC PATCH 1/3] configure: disable Xen PCI Passthrough on !x86 archs
In-reply-to: <446cc0e3-dd49-e088-85f1-0caf1d42fbf8@amsat.org>
Date: Tue, 11 Jul 2017 17:26:21 +0100
Message-ID: <87iniz9byq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 9TOiuMcQgnOl


Philippe Mathieu-Daudé <f4bug@amsat.org> writes:

> It seems our minds crossed at the same time since Alex/Pablo fixed it
> and got merged in master as b5ed2e11ef39 "build: disable Xen on ARM"
> so this patch is no more necessary.
>
> Alex/Pablo, any thought on patch 2 regarding xen-mapcache.h?

Pass, I know little of Xen on ARM other than I think it doesn't need
QEMU for device emulation. IIRC the use of QEMU on x86 is to handle the
weird set of devices you can get on a PC without bloating the
hypervisor. ARM is a lot simpler in that regard.

>
> Phil.
>
> On 07/10/2017 11:57 PM, Philippe Mathieu-Daudé wrote:
>> linking on Linux debian/stretch/arm64 with libxen-4.8:
>>
>>      hw/xen/xen_pt.o: In function `xen_pt_pci_read_config':
>>      qemu/hw/xen/xen_pt.c:206: undefined reference to `xen_shutdown_fatal_error'
>>      hw/xen/xen_pt.o: In function `xen_igd_passthrough_isa_bridge_create':
>>      qemu/hw/xen/xen_pt.c:698: undefined reference to `igd_passthrough_isa_bridge_create'
>>      hw/xen/xen_pt.o: In function `xen_pt_pci_write_config':
>>      qemu/hw/xen/xen_pt.c:355: undefined reference to `xen_shutdown_fatal_error'
>>      hw/xen/xen_pt_config_init.o: In function `xen_pt_status_reg_init':
>>      qemu/hw/xen/xen_pt_config_init.c:281: undefined reference to `xen_shutdown_fatal_error'
>>      qemu/hw/xen/xen_pt_config_init.c:275: undefined reference to `xen_shutdown_fatal_error'
>>      hw/xen/xen_pt_graphics.o: In function `get_vgabios':
>>      qemu/hw/xen/xen_pt_graphics.c:135: undefined reference to `pci_assign_dev_load_option_rom'
>>      collect2: error: ld returned 1 exit status
>>      Makefile:197: recipe for target 'qemu-system-aarch64' failed
>>      make[1]: *** [qemu-system-aarch64] Error 1
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   configure | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 806658c98b..e4b173405a 100755
>> --- a/configure
>> +++ b/configure
>> @@ -2344,8 +2344,15 @@ EOF
>>   fi
>>     if test "$xen_pci_passthrough" != "no"; then
>> -  if test "$xen" = "yes" && test "$linux" = "yes"; then
>> -    xen_pci_passthrough=yes
>> +  if test "$xen" = "yes"; then
>> +    case "$cpu" in
>> +    i386|x32|x86_64)
>> +        if test "$linux" = "yes"; then
>> +            xen_pci_passthrough=yes
>> +        fi ;;
>> +    *)  echo "Disabling Xen PCI Passthrough (not implemented on $cpu)"
>> +        xen_pci_passthrough=no ;;
>> +    esac
>>     else
>>       if test "$xen_pci_passthrough" = "yes"; then
>>         error_exit "User requested feature Xen PCI Passthrough" \
>>


--
Alex Bennée
