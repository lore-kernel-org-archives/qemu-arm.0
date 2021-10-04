Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q18sm16658640wmc.7.2021.10.04.06.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 06:47:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0B1531FF96;
	Mon,  4 Oct 2021 14:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	f4bug@amsat.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 0/7] enabling RasperryPi 4 emulation - WIP state
Date: Mon,  4 Oct 2021 14:47:34 +0100
Message-Id: <20211004134742.2044280-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /vOJXS3Qer4L

Hi Phillipe,

I needed to test some Xen things on a model I could debug so I took
the liberty of re-basing you patches from a 2 years ago. Most of the
changes involve dropping patches since merged and dealing with the
resultant merging fallout. The fix I posted on Friday for the
calculation of the ram base for kernel loading is included. Other
tweaks involve moving the location of peri_base to what is indicated
by the DTBs (I'm still not sure where the Linux addresses come from,
does it re-map the physical address space somewhere?).

My testing ended at getting Xen to boot up and at least echo some
stuff to the console:

  ./qemu-system-aarch64 -machine raspi4b -serial mon:stdio -kernel ~/lsrc/xen/xen-only.cross.arm64/xen/xen -append "dom0_mem=1G,max:1G loglvl=all guest_loglvl=all console=d
  tuart dtuart=serial0 sync_console" -display none -dtb ./bcm2711-rpi-4-b.dtb            
  - UART enabled -                                                                      
  - Boot CPU booting -                       
  - Current EL 00000008 -                    
  - Initialize CPU -                                                                    
  - Turning on paging -               
  - Zero BSS -                                                                          
  - Ready -                             
  (XEN) Checking for initrd in /chosen
  (XEN) RAM: 0000000000000000 - 000000003bffffff            
  (XEN)                               
  (XEN) MODULE[0]: 0000000000200000 - 000000000034d0c8 Xen         
  (XEN) MODULE[1]: 0000000008000000 - 000000000801cea4 Device Tree 
  (XEN)  RESVD[0]: 0000000000000000 - 0000000000001000
  (XEN)                                
  (XEN)                               
  (XEN) Command line: <NULL>              
  (XEN) Domain heap initialised                                                         
  (XEN) Booting using Device Tree        
  (XEN) Platform: Raspberry Pi 4                                                        
  (XEN) No dtuart path configured
  (XEN) Bad console= option 'dtuart'

My next steps involve debugging Xen so I thought I'd post where I am
for the next person that wants to properly wire up the Pi4.

Alex Bennée (1):
  hw/arm: fix the position of vcram for raspi

Philippe Mathieu-Daudé (6):
  hw/misc/bcm2835_property: Add FIXME comment for uninitialized memory
  hw/misc/bcm2835_property: Handle the 'domain state' property
  hw/arm/bcm2835_peripherals: Map various BCM2711 blocks
  hw/arm/bcm2836: Add the BCM2711 which uses a GICv2
  hw/arm/bcm2838: Map the PCIe memory space
  hw/arm/raspi: Add the Raspberry Pi 4B board

 include/hw/arm/bcm2835_peripherals.h |  9 ++-
 include/hw/arm/bcm2836.h             |  3 +
 include/hw/arm/raspi_platform.h      | 14 +++++
 hw/arm/bcm2835_peripherals.c         | 38 +++++++++---
 hw/arm/bcm2836.c                     | 89 ++++++++++++++++++++++++++++
 hw/arm/raspi.c                       | 34 ++++++++---
 hw/misc/bcm2835_property.c           | 10 ++++
 7 files changed, 179 insertions(+), 18 deletions(-)

-- 
2.30.2
