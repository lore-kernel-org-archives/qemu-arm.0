Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354A7606A32C
	for <qemu-arm@archiver.kernel.org>; Sat,  7 Nov 2026 18:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XIcR0GFZ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPlSw-0002WM-4L; Sat, 07 Nov 2026 13:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yukiya.takaki@gmail.com>)
 id 1xPlJr-0001io-Jr
 for qemu-arm@nongnu.org; Sat, 07 Nov 2026 13:39:16 -0500
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yukiya.takaki@gmail.com>)
 id 1xPlJp-0004FN-1P
 for qemu-arm@nongnu.org; Sat, 07 Nov 2026 13:39:15 -0500
Received: by mail-dl1-x122f.google.com with SMTP id
 a92af1059eb24-19305bcb72cso1618995c88.1
 for <qemu-arm@nongnu.org>; Sat, 07 Nov 2026 10:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794076750; x=1794681550; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=YpEg/lDvlZA/9XSlQlgteWdrCWq9LNtbMiRiaSbaG98=;
 b=XIcR0GFZfdNvn2NKcIqXDlXcr7t7h7R68c1zH7yyu0FNg96LHUSE1g86W6MIOQ0nXU
 75dkHbIHIEahxkVifI/muUe7n2MalulBDjdFYbAT4Gl4Q4HaEC1/rMwnqwhk3Pqimxdd
 0gtNwNAb48MNOigKJaCb6WwS2p68RL8/781HyJedbfV3MGmNKwi/vUjGUsVoQau4Xhk5
 gbOf4VBr7E00knPah1pPVxEe/MjQK++Sjr+kPQe75e0+twhIqQeZrccszB1rx2O95BU2
 PS8sxW4hsHJ3JqpBvitx/lsEyesOC7pI/v0XYypkQnDqyIeD7ClUMjiaFmjlyqst4osZ
 IL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794076750; x=1794681550;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YpEg/lDvlZA/9XSlQlgteWdrCWq9LNtbMiRiaSbaG98=;
 b=xExknqMOsTPUI/vVDWQOQEQD9LuEx3D6TRSl8EG20j9leNqYUTIFg3IYHI2Vzg9kR+
 WzMvGNnGdsqsfVnCpDIivVF+6Ekm0NUxVyVq7qAyJx2g3jPo30sLN50LgvXSeeGLRE7a
 Pz+J5qYc1o4gk9pgqs0xqQ14iNOMhSskBO2LFofCHNhbRq+vqVCLjgDgBOPEoUzX6YTS
 XP8zangCH7pLejzmgiMrfG/cJvC/N6+/wbRAA6E2Xa+9Q1lo8hewLKyeW/2EyPKVj1WL
 lQQ4e/GosvSfYcSwzXglTKA5B/rl5It6xpUYlj7H9cJhtvdKF44IdtVTo573r+VM5wY8
 jncQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEVKBa6Fc2ibwxxRrcI9/p96UbBmAwbr5JQ+dqB7CuJCDUqThSSncFSQpCREIj8zkmjqSBERKYI1A==@nongnu.org
X-Gm-Message-State: APuU4Z8OhmG23VVuiGUBb6IM/JvtNv/xgtVzgfzj5Ad6v/UugdYmPTtD
 m823+vavQ9Jm1umszzav6FM3Yfx8byDZyd3e3zI9sXEltCO9RdprP1XY
X-Gm-Gg: AYBFou3aHB+TNTEQfCS4e50ym8Kaq1ufa/5b2WgqjbLE0kgr/mNnVQppMMBe1rNrApF
 Fs9IXYwh25/oGfvTdcxY27ZbzX/et3JaOcYarFcl5rRdwFflQaspU9JkZdbhURqy3+Aeq7cistV
 7pBGKmh0bxw1RH3j5ddZaNpY4E4KnsVJZ7hrl+PeLn2MuwAbUaZIVQHxVXPU/OcFNNFE5EuQ1K/
 sAQuqXXPv+k2+X+q/VmMzECxyflU2lbbDOsR29Xjha2jc493GzTeEIQGFWgPAKOoErhpLtwQ+q8
 sOqy8htADs9FCzajJomVfdLG5ciREVb+AeLtkMGAgu00UDcxGmkro0hb8SjbOjgXx347FJuPbZ3
 t+Kef7MzYmbs6XclEdJV5TPegwIiL3IGOJqM/FqtYKG4fz/Fiquy8aGTPyNibp6MmplaZBPozPw
 7KSk8mDmyjqWTX76+Ib8jwSPpbXxzQogE2z4+Aevw0lrwV8D38IEHT9p4x6qx0ayGfzg5gJ5rcx
 6TWIVwWs4bs6WwwkOjhukRrIXwubXhdlw+LX05r1thSzh0Byw6IiBtgxkCPrVuxPgwN9fBpK20B
 aITHm9ZMibGdZ39UzAH9+ygiOxLDeeYXp+h7LckC6Ica3dYHfrOvw+9l2zbD17xxsgZALBPNSw=
 =
X-Received: by 2002:a05:693c:80c1:b0:36a:1732:1e7 with SMTP id
 5a478bee46e88-36f76d0f26emr8522418eec.31.1794076750215; 
 Sat, 07 Nov 2026 10:39:10 -0800 (PST)
Received: from ?IPV6:240d:1a:8bb:4a00:40e6:d5b1:9360:f028?
 ([240d:1a:8bb:4a00:40e6:d5b1:9360:f028])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36faa4b4680sm17118089eec.20.2026.11.07.10.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2026 10:39:09 -0800 (PST)
Message-ID: <0b67947b-e4ee-4e47-b61f-c6ae06501298@gmail.com>
Date: Sun, 8 Nov 2026 03:39:06 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/7] QEMU/hw/cxl: Allow CXL Type 3 memory regions to
 be initialized at guest boot
To: Jonathan Cameron <jic23@kernel.org>, Yukiya Takaki <fj2110jc@fujitsu.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Anisa Su <anisa.su@samsung.com>,
 Igor Mammedov <imammedo@redhat.com>, Junjie Cao <junjie.cao@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, linux-cxl@vger.kernel.org,
 qemu-arm@nongnu.org, "Wolski, Tomasz" <tomasz.wolski@fujitsu.com>,
 lizhijian@fujitsu.com, y-goto@fujitsu.com
References: <cover.1793003983.git.fj2110jc@fujitsu.com>
 <20261105215411.33262db7@jic23-hlaptop>
Content-Language: en-US
From: Yukiya Takaki <yukiya.takaki@gmail.com>
In-Reply-To: <20261105215411.33262db7@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122f;
 envelope-from=yukiya.takaki@gmail.com; helo=mail-dl1-x122f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 07 Nov 2026 13:48:37 -0500
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jonathan,

Thank you for your suggestion.

> On Mon, 26 Oct 2026 19:03:21 +0900
> Yukiya Takaki <fj2110jc@fujitsu.com> wrote:
>
>> Hello everyone,
>>
>> I’m a student intern, and this is my first time sending patches to an open source mailing list.
>>
>> This patch series configures QEMU’s CXL Type 3 devices so that guest operating systems can automatically discover
>> and create CXL regions during boot, aligning QEMU’s behavior with real hardware.
> Hi Yukiya,
>
> Interesting project.
>
>> Background and motivation
>>    Currently, during guest boot QEMU does not provide the information or register programming needed for the guest OS
>>    to initialize CXL Type 3 memory, so using it still requires an explicit action in the guest (for example, running the cxl create-region command).
>>    By contrast, on some physical systems the firmware automatically allocates CXL memory ranges and exposes them to the OS,
>>     allowing the Linux CXL driver to discover and create regions during boot.
>>    This patch series is a first, experimental attempt to reproduce that behavior in QEMU.
>>
>>    Some parts of this implementation are based on Li, Zhijian’s work in:
>>    https://github.com/zhijianli88/qemu/tree/program-decoder-v2
>>
>>    I would like to ask for feedback on whether this approach makes sense and whether I should continue to enhance it.
>>
>> Approach
>>    This patch first adds a program_hdm_decoder option to cxl-type3.
>>    When program-hdm-decoder is enabled on cxl-type3, QEMU will:
>>      1) program endpoint/host-bridge HDM decoder state,
>>      2) expose Type 3 ranges as E820_SOFT_RESERVED on x86,
>>      3) create memory-only NUMA nodes for those ranges,
>>      4) emit SRAT memory-affinity entries mapping each Type 3 HPA range to its node ID
>>
>>    On real hardware, HDM decoder programming and memory layout are typically handled by firmware, so they would ideally be managed by SeaBIOS.
>>    However, in the current QEMU/SeaBIOS model, E820 and SRAT are built on the QEMU side, and pushing HDM decoder programming
>>    into SeaBIOS would introduce additional complexity and risk inconsistencies.
> So, did you explore doing this in a similar fashion to PCI enumeration?
>
> That's done the bios and is very similar in that there is a mix of
> policy and rules in how it is configured that we really don't want
> in qemu.  With that ACPI tables are then built in QEMU that contain
> values read back from what was setup. The main thing I'm thinking of
> here is the PXB handling that relies on the bios having done the
> PCI enumeration first rather than doing it in qemu.
> The arm code is here
> https://elixir.bootlin.com/qemu/v11.1.3/source/hw/pci-host/gpex-acpi.c#L103
> x86 probably this:
> https://elixir.bootlin.com/qemu/v11.1.3/source/hw/i386/acpi-build.c#L1038
>
> My immediate instinct is that would look more like a conventional bios
> flow.  It would also have the significant benefit of putting the enumerating
> and configuration code into an open source bios, something I hoped would come out
> early ARM work on this (see linux plumbers - I think this is right session)
> https://lpc.events/event/16/contributions/1254/attachments/1113/2136/CXL%20Type-3%20device%20discovery,%20configuration%20in%20firmware%20and%20prepare%20ACPI%20tables%20for%20kernel%20usage.pdf
>
> Then we'd regenerate the SRAT, HMAT etc before handling to the OS.
> (I'm not sure this works for e820 having never touched that flow).
>
> There is a lot of policy involved in CXL configuration and I'd not
> want to replicate that part in QEMU. At best we'd want to pass
> some hints to the bios.
>
> Flow wise that would mean adding to acpi_build_update() some code
> to do the necessary srat and other table updates.  That would
> definitely work for the actual ACPI tables, but I gather e820 is
> rather different...  However, e820 real table is I think
> actually constructed by seabios so can that just make the
> necessary updates after programming the CXL decoders etc?
>
> Now if you did this on SBSA-ref and arm you'd have to do it
> all in the bios (as that generates everything) and the whole
> problem would be much more standard.
>
> Given we have that option on arm/sbsa-ref I don't currently
> see a reason to explore the bios flows on arm/virt.
>
> I also gather (from asking an LLM so might be wrong) that there
> are options that boot qemu on x86 with tables generated
> by the bios, not qemu.  Legacy path in seabios, coreboot and
> and ovmf path used with xen.  Maybe working with them avoids
> the extra complexity of bounce backwards and forwards between
> qemu and the firmware (though I think I'd probably avoid these).
>
> Anyhow, interested to see where you go with this.
> Definitely useful for those of us working with platforms that
> never do the bios programmed flow but have to test it when
> making changes!
>
> Jonathan

I was not aware of how the PCI enumeration and acpi_build_update() flow 
works.
Using this approach, I think we can automatically configure CXL Type 3 
memory
while keeping the allocation policy on the BIOS side, and then have QEMU
update the SRAT based on the programmed decoders.

Also, although I have only looked into the SeaBIOS code so far, some E820
entries are indeed added directly in SeaBIOS, so I think we can insert the
E820_SOFT_RESERVED entries on the SeaBIOS side as well.

I will work on v2 using this approach.

Best regards,
Yukiya


>> Testing
>>    We ran tests in the following environment and confirmed that CXL regions were created at boot, NUMA nodes were set up,
>>    and E820_SOFT_RESERVED entries appeared in the E820 table:
>>
>>    - BIOS: SeaBIOS c2a33ad9ad1452e23b41c4ac44a3bc6be8ebc4cf
>>    - CXL memory: 4 GB
>>    - CFMWS: 4 GB
>>    - Host bridge: 1
>>
>>    The following is the startup script.
>>
>>    sudo /path/to/qemu/build/qemu-system-x86_64 \
>>      -name guest=cxl \
>>      -nographic \
>>      -machine q35,accel=tcg,nvdimm=on,cxl=on \
>>      -cpu max -smp 4,sockets=4,cores=1,threads=1 \
>>      -m size=4G,slots=10,maxmem=20G \
>>      -drive file=/path/to/image.qcow2,format=qcow2,index=0,media=disk,id=hd \
>>      -bios /path/to/seabios/out/bios.bin \
>>      -nic bridge,br=virbr0,model=e1000e,mac=52:54:00:b5:4e:7c \
>>      -object memory-backend-ram,size=2G,id=m0 \
>>      -object memory-backend-ram,size=2G,id=m1 \
>>      -numa node,nodeid=0,cpus=0-1,memdev=m0 \
>>      -numa node,nodeid=1,cpus=2-3,memdev=m1 \
>>      -device pcie-root-port,id=pci-root,slot=4,bus=pcie.0,chassis=0 \
>>      -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1,hdm_for_passthrough=true \
>>      -device cxl-rp,port=0,id=root_port13,bus=cxl.1,chassis=0,slot=2 \
>>      -object memory-backend-ram,size=4G,share=on,id=vmem0 \
>>      -device cxl-type3,bus=root_port13,volatile-memdev=vmem0,id=cxl-vmem0,program-hdm-decoder=true \
>>      -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=4k
>>    
>>    Furthermore, we conducted the experiment in which we added two CXL Type3.
>>
>>    - CXL memory: 4 GB × 2
>>    - CFMWS: 4 GB × 2
>>
>>    The following is the startup script.
>>      
>>    sudo /path/to/qemu/build/qemu-system-x86_64 \
>>      -name guest=cxl \
>>      -nographic \
>>      -machine q35,accel=tcg,nvdimm=on,cxl=on,hmat=on \
>>      -cpu max -smp 4,sockets=4,cores=1,threads=1 \
>>      -m size=4G,slots=10,maxmem=20G \
>>      -drive file=/path/to/image.qcow2,format=qcow2,index=0,media=disk,id=hd \
>>      -bios /path/to/seabios/out/bios.bin \
>>      -nic bridge,br=virbr0,model=e1000e,mac=52:54:00:b5:4e:7c \
>>      -object memory-backend-ram,size=2G,id=m0 \
>>      -object memory-backend-ram,size=2G,id=m1 \
>>      -numa node,nodeid=0,cpus=0-1,memdev=m0 \
>>      -numa node,nodeid=1,cpus=2-3,memdev=m1 \
>>      -device pcie-root-port,id=pci-root,slot=4,bus=pcie.0,chassis=0 \
>>      -device pcie-root-port,id=pci-root-net,chassis=5,slot=5,bus=pcie.0 \
>>      -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1,hdm_for_passthrough=true \
>>      -device cxl-rp,port=0,id=root_port13,bus=cxl.1,chassis=0,slot=2 \
>>      -device cxl-rp,port=3,id=root_port14,bus=cxl.1,chassis=2,slot=4 \
>>      -object memory-backend-ram,size=4G,share=on,id=vmem0 \
>>      -object memory-backend-ram,size=4G,share=on,id=vmem1 \
>>      -device cxl-type3,bus=root_port13,volatile-memdev=vmem0,id=cxl-vmem0,program-hdm-decoder=true \
>>      -device cxl-type3,bus=root_port14,volatile-memdev=vmem1,id=cxl-vmem1,program-hdm-decoder=true \
>>      -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=4k,cxl-fmw.1.targets.0=cxl.1,cxl-fmw.1.size=4G,cxl-fmw.1.interleave-granularity=4k
>>
>>
>> How to use
>>    Specify the following parameters when starting QEMU:
>>
>>    - bios <SeaBIOS binary that includes commit c2a33ad9ad1452e23b41c4ac44a3bc6be8ebc4cf> to ensure that E820_SOFT_RESERVED entries are exposed
>>    - Add hmat=on to the -machine option [1]
>>    - Add program-hdm-decoder=true to each -device cxl-type3 option
>>      [1] On Linux, the kernel first checks E820_SOFT_RESERVED ranges. When multiple CXL Type 3 devices share a contiguous HPA range,
>>          these ranges tend to be merged into a single region, so the CXL driver cannot reliably initialize per‑device regions based on E820 alone.
>>          SRAT entries for CXL memory are therefore needed, and the guest seems to discard SRAT when `hmat=on` is not specified,
>>          so HMAT must be enabled.
>>
>> QEMU base commit: bddb785e791e415db38884848d068457e226f5e3
>>
>> TODO
>>    With the current implementation of this patch, the following configurations are either not supported or have not been sufficiently tested.
>>    As a result, automatic creation of CXL regions in the guest OS may fail:
>>
>>    - A CXL persistent memory device is included
>>    - Interleaved configurations
>>    - Cases where the memory size specified by CFMWS does not match the size of the CXL Type 3 backend memory
>>    - Configurations where CXL memory is attached via a switch
>>    - Multi-target CFMWS environments
>>    - ARM environments
>>    - HMAT does not yet include information about CXL memory devices
>>
>>    The following behaviors are also provisional implementations and may need further refinement:
>>     - A new NUMA node ID is assigned to each CXL memory device. This should be improved either to reflect more accurate NUMA distances for CXL memory,
>>       or to allow the NUMA node IDs to be specified by the user.
>>     - Assignment of CXL Type 3 devices to CFMWS address ranges. On physical systems, platform firmware typically generates CFMWS entries
>>       based on the detected CXL topology and its address-space allocation. In QEMU, however, CFMWS entries are configured explicitly
>>       through machine options. The current implementation therefore has to infer which CFMWS range should be used for each Type 3 device.
>>       This selection logic may need further refinement. Possible approaches include improving the selection and validation logic,
>>       adding an explicit option to associate each Type 3 device with a CFMWS entry,
>>       or generating CFMWS entries automatically from the configured CXL topology and devices.
>>     - HDM decoder reset sequencing and state reconstruction.
>>       The current implementation prevents the host bridge HDM decoder configuration from being overwritten later in the same reset
>>       by moving the common initialization of the host bridge component registers from the reset path to the realization path.
>>       However, ideally, after the registers have been restored to their reset values, the host bridge HDM decoder configuration
>>       automatically programmed by QEMU should be reconstructed as part of reset processing.
>>
>> Thanks,
>>
>> ------
>>
>> Yukiya Takaki (7):
>>    QEMU/hw/cxl: add program-hdm-decoder option for CXL Type 3 devices
>>    QEMU/hw/cxl:add HPA offset tracking for CXL Type 3 devices
>>    QEMU: hw/cxl: add helper to get HPA range for CXL Type 3
>>    QEMU/hw/cxl: auto‑program HDM decoders for CXL Type 3
>>    QEMU/hw/cxl: expose CXL Type 3 ranges as E820_SOFT_RESERVED on x86
>>    QEMU/hw/cxl: Create NUMA nodes for CXL Type 3 memory
>>    add CXL Type 3 memory ranges to SRAT
>>
>>   hw/acpi/cxl_type3.c                 |  30 +++++
>>   hw/acpi/meson.build                 |   1 +
>>   hw/arm/cxl.c                        |  10 ++
>>   hw/arm/meson.build                  |   2 +
>>   hw/cxl/cxl-host.c                   |  63 ++++++++++
>>   hw/i386/acpi-build.c                |   7 ++
>>   hw/i386/cxl.c                       |  11 ++
>>   hw/i386/meson.build                 |   1 +
>>   hw/i386/pc.c                        |   2 +
>>   hw/mem/cxl_type3.c                  | 177 ++++++++++++++++++++++++++++
>>   hw/pci-bridge/pci_expander_bridge.c |  13 +-
>>   include/hw/cxl/cxl.h                |   2 +
>>   include/hw/cxl/cxl_device.h         |   6 +
>>   include/hw/cxl/cxl_host.h           |   3 +
>>   include/hw/mem/cxl_type3.h          |   8 ++
>>   15 files changed, 334 insertions(+), 2 deletions(-)
>>   create mode 100644 hw/acpi/cxl_type3.c
>>   create mode 100644 hw/arm/cxl.c
>>   create mode 100644 hw/i386/cxl.c
>>   create mode 100644 include/hw/mem/cxl_type3.h
>>


