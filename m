Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp285487lft;
        Wed, 29 Jun 2022 02:11:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tyyiX4HbTkh7jMdgRGz5NuTaWNSc9/5ygvFgDGIjTnimsCuWZDxbcW8tpESihls6TnkICg
X-Received: by 2002:a5d:47cf:0:b0:21b:b58b:99c5 with SMTP id o15-20020a5d47cf000000b0021bb58b99c5mr2031626wrc.348.1656493910889;
        Wed, 29 Jun 2022 02:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656493910; cv=none;
        d=google.com; s=arc-20160816;
        b=WBeDgSoYTvcZekE2JjEx+Ji1k/OqYacgV4xveEdbuLPNq9NChwEg/KVDv4tRjEVviV
         xY+MoMEtAU7pOeDBvFarc7m1m0Y7jaryKvMrWFH1hVAwUkH0xMyx+wuregYgEtyEZ0D7
         sQ6bV2tpvzh5vmzmCwrpaE6YkilX75w3GxgxZMvh9fNpcmRAH2ZHzMpUXJ75qRyXcW3R
         LWgQUOt8y24LDhyJx+dhB7n8PMYpiFOc+IMsu5Uj9U5Cz8Ph0dEhIL55D9FC5Z+/9212
         Z5ndcC4RvD+6XZV54IdDTGHK3l/iR/8XY7zFOtNT5j2pwwcK1fQqYK24CjksA8MK3X+M
         44XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=nbRa7isW7Wi12aDqgAoVBX6KPW4E++xKdkuJ5vw41j0=;
        b=Bqr62cqs2jxR6OHZKrjLVyFyT0GG97a2c7SYxHh4x6QyDOQX0mX+v473qoYpsyqvmt
         giyLfv5Byk9oyfJulcIfkHta8ipFrAJ9yPe8NRLP/63SdvEvAAU8frRM5S2uYxPAnjjl
         pLLcL6xLSZO0Ko81BQBv0HcJ+XI3HaO3tvrjR1x3qkMJHo1W96AEgDPd9OetyNv47Snk
         hIkV6WnkeKFweA7fN5javwqx6znP/vCK7eF2ujOzk1p3ETqr70x6oFOOp3pUAdgMxOVz
         lDBs01obrTn5TKN1/DjWoZ77yq0YFlqKDqMSNB+L984qbGQt3FF+7of/DjJaWyrTYkjY
         yDmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 46.105.77.235 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 10.mo548.mail-out.ovh.net (10.mo548.mail-out.ovh.net. [46.105.77.235])
        by mx.google.com with ESMTPS id o5-20020a5d6485000000b002102babc86dsi13907711wri.461.2022.06.29.02.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 02:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 46.105.77.235 as permitted sender) client-ip=46.105.77.235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 46.105.77.235 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
	by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 1AE0B2342E;
	Wed, 29 Jun 2022 09:11:49 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 29 Jun
 2022 11:11:47 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-107S001f78a9792-2ec0-47f7-acd0-c1fa29db8345,
                    74A1F81DE4F8936248B5873BB0AED4007818FEC6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <07128acf-329a-f372-c48c-0c3cb498d3d0@kaod.org>
Date: Wed, 29 Jun 2022 11:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 12/14] aspeed: Make aspeed_board_init_flashes public
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Peter Delevoryas <pdel@fb.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
	<andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
	"eduardo@habkost.net" <eduardo@habkost.net>, "marcel.apfelbaum@gmail.com"
	<marcel.apfelbaum@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, "ani@anisinha.ca" <ani@anisinha.ca>, Cameron Esfahani via
	<qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220623102617.2164175-1-pdel@fb.com>
 <20220623102617.2164175-13-pdel@fb.com>
 <e5f51f14-fe75-0d55-6588-a3ca2565f760@kaod.org>
 <EC44C0BD-7BC0-4BDE-9A41-CB1EAA90EC87@fb.com>
 <e07ec4fe-6968-b19a-e649-298a9aaccba5@kaod.org>
In-Reply-To: <e07ec4fe-6968-b19a-e649-298a9aaccba5@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 25e948f2-421f-4e4c-973d-d6eb1ac5a2f4
X-Ovh-Tracer-Id: 1680968560965356350
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffhvfevfhgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeijeehieevueeltdfhheehleettdfgteekvefggfeuudejgfefjefgteeuleelgeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheegke
X-TUID: U2eiLYe2AYBo

On 6/24/22 18:50, Cédric Le Goater wrote:
> On 6/23/22 20:43, Peter Delevoryas wrote:
>>
>>
>>> On Jun 23, 2022, at 8:09 AM, Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> On 6/23/22 12:26, Peter Delevoryas wrote:
>>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>>
>>> Let's start simple without flash support. We should be able to
>>> load FW blobs in each CPU address space using loader devices.
>>
>> Actually, I was unable to do this, perhaps because the fb OpenBMC
>> boot sequence is a little weird. I specifically _needed_ to have
>> a flash device which maps the firmware in at 0x2000_0000, because
>> the fb OpenBMC U-Boot SPL jumps to that address to start executing
>> from flash? I think this is also why fb OpenBMC machines can be so slow.
>>
>> $ ./build/qemu-system-arm -machine fby35 \
>>      -device loader,file=fby35.mtd,addr=0,cpu-num=0 -nographic \
>>      -d int -drive file=fby35.mtd,format=raw,if=mtd
> 
> 
> 
> Ideally we should be booting from the flash device directly using
> the machine option '-M ast2600-evb,execute-in-place=true' like HW
> does. Instructions are fetched using SPI transfers. But the amount
> of code generated is tremendous. See some profiling below for a
> run which barely reaches DRAM training in U-Boot.

Some more profiling on both ast2500 and ast2600 machines shows :


* ast2600-evb,execute-in-place=true :

Type               Object  Call site                Wait Time (s)         Count  Average (us)
---------------------------------------------------------------------------------------------
BQL mutex  0x564dc03922e0  accel/tcg/cputlb.c:1365       14.21443      32909927          0.43
condvar    0x564dc0f02988  util/thread-pool.c:90         10.02312            56     178984.32
condvar    [           2]  softmmu/cpus.c:423             0.10051             6      16752.04
BQL mutex  0x564dc03922e0  util/rcu.c:269                 0.04372             4      10930.60
BQL mutex  0x564dc03922e0  cpus-common.c:341              0.00151             8        189.16
condvar    0x564dc0390360  cpus-common.c:176              0.00092             8        115.04
condvar    0x564dc0392280  softmmu/cpus.c:642             0.00013             2         65.04
condvar    0x564dc0392240  softmmu/cpus.c:571             0.00010             2         49.54
BQL mutex  0x564dc03922e0  accel/tcg/cputlb.c:1426        0.00006           467          0.14
condvar    0x564dc03903a0  cpus-common.c:206              0.00004             8          5.28
---------------------------------------------------------------------------------------------


* ast2500-evb,execute-in-place=true :

Type               Object  Call site                Wait Time (s)         Count  Average (us)
---------------------------------------------------------------------------------------------
condvar    0x55a581137f88  util/thread-pool.c:90         10.01158            28     357556.50
BQL mutex  0x55a57f0e02e0  accel/tcg/cputlb.c:1365        0.29886      14394475          0.02
condvar    0x55a5814cb5a0  softmmu/cpus.c:423             0.02182             2      10912.44
BQL mutex  0x55a57f0e02e0  util/rcu.c:269                 0.01420             4       3549.56
mutex      0x55a5813381c0  tcg/region.c:204               0.00007          3052          0.02
condvar    0x55a57f0e0280  softmmu/cpus.c:642             0.00006             1         59.79
mutex      [           2]  chardev/char.c:118             0.00003          1492          0.02
BQL mutex  0x55a57f0e02e0  util/main-loop.c:318           0.00002            34          0.72
BQL mutex  0x55a57f0e02e0  accel/tcg/cputlb.c:1426        0.00002           973          0.02
condvar    0x55a57f0e0240  softmmu/cpus.c:571             0.00002             1         15.16
---------------------------------------------------------------------------------------------

C.



> 
> * execute-in-place=true
> 
> Each sample counts as 0.01 seconds.
>    %   cumulative   self              self     total
>   time   seconds   seconds    calls  ns/call  ns/call  name
> 100.00      0.02     0.02   164276   121.75   121.75  memory_region_init_rom_device
>    0.00      0.02     0.00 1610346008     0.00     0.00  tcg_code_capacity
>    0.00      0.02     0.00 567612621     0.00     0.00  type_register_static_array
>    0.00      0.02     0.00 328886191     0.00     0.00  do_common_semihosting
>    0.00      0.02     0.00 297215811     0.00     0.00  container_get
>    0.00      0.02     0.00 292670030     0.00     0.00  arm_cpu_tlb_fill
>    0.00      0.02     0.00 195416119     0.00     0.00  arm_cpu_register_gdb_regs_for_features
>    0.00      0.02     0.00 193326677     0.00     0.00  object_type_get_instance_size
>    0.00      0.02     0.00 182365829     0.00     0.00  tcg_op_insert_after
>    0.00      0.02     0.00 150668458     0.00     0.00  plugin_gen_tb_end
>    0.00      0.02     0.00 142171940     0.00     0.00  gen_new_label
>    0.00      0.02     0.00 133200628     0.00     0.00  smbios_build_type_38_table
>    0.00      0.02     0.00 130540338     0.00     0.00  object_dynamic_cast_assert
>    0.00      0.02     0.00 129223195     0.00     0.00  cpu_loop_exit_atomic
>    0.00      0.02     0.00 121759298     0.00     0.00  tcg_remove_ops_after
>    0.00      0.02     0.00 116887887     0.00     0.00  in_code_gen_buffer
>    0.00      0.02     0.00 111803833     0.00     0.00  tcg_emit_op
>    0.00      0.02     0.00 106052221     0.00     0.00  object_class_dynamic_cast_assert
>    0.00      0.02     0.00 99704054     0.00     0.00  __jit_debug_register_code
>    0.00      0.02     0.00 97812458     0.00     0.00  object_get_class
>    0.00      0.02     0.00 88952594     0.00     0.00  tcg_splitwx_to_rx
>    0.00      0.02     0.00 85790920     0.00     0.00  object_class_dynamic_cast
>    0.00      0.02     0.00 73780673     0.00     0.00  helper_exit_atomic
>    0.00      0.02     0.00 65337482     0.00     0.00  tcg_op_supported
>    0.00      0.02     0.00 61213619     0.00     0.00  tcg_func_start
>    0.00      0.02     0.00 54477684     0.00     0.00  tcg_flush_softmmu_tlb
>    0.00      0.02     0.00 53968980     0.00     0.00  tcg_temp_new_internal
>    0.00      0.02     0.00 51526008     0.00     0.00  qemu_in_vcpu_thread
>    0.00      0.02     0.00 40750952     0.00     0.00  pflash_cfi02_register
>    0.00      0.02     0.00 38039442     0.00     0.00  tcg_gen_op2
>    0.00      0.02     0.00 37068039     0.00     0.00  tcg_gen_op1
>    0.00      0.02     0.00 36473276     0.00     0.00  tcg_gen_op3
>    0.00      0.02     0.00 36310225     0.00     0.00  gen_gvec_uaba
>    0.00      0.02     0.00 30985436     0.00     0.00  tb_set_jmp_target
>    0.00      0.02     0.00 30291796     0.00     0.00  tcg_constant_internal
>    0.00      0.02     0.00 29857950     0.00     0.00  ssi_transfer
> 
> * execute-in-place=false
> 
> Each sample counts as 0.01 seconds.
>    %   cumulative   self              self     total
>   time   seconds   seconds    calls  ns/call  ns/call  name
>   40.00      0.02     0.02   551149    36.29    36.29  aspeed_board_init_flashes
>   20.00      0.03     0.01  3937238     2.54     2.54  register_cp_regs_for_features
>   20.00      0.04     0.01   674096    14.83    14.83  gen_gvec_uaba
>   20.00      0.05     0.01   457461    21.86    21.86  finalize_target_page_bits
>    0.00      0.05     0.00  5364258     0.00     0.00  arm_gt_hvtimer_cb
>    0.00      0.05     0.00  2467532     0.00     0.00  helper_neon_narrow_sat_s8
>    0.00      0.05     0.00  2431860     0.00     0.00  opb_opb2fsi_address
>    0.00      0.05     0.00  1828453     0.00     0.00  cpsr_read
>    0.00      0.05     0.00  1820659     0.00     0.00  cpu_get_tb_cpu_state
>    0.00      0.05     0.00  1441344     0.00     0.00  arm_cpu_tlb_fill
>    0.00      0.05     0.00  1427177     0.00     0.00  cxl_usp_to_cstate
>    0.00      0.05     0.00  1161059     0.00     5.85  aarch64_sync_64_to_32
>    0.00      0.05     0.00   886523     0.00     0.00  helper_iwmmxt_maxsb
>    0.00      0.05     0.00   831393     0.00     0.00  arm_log_exception
>    0.00      0.05     0.00   746940     0.00     0.00  helper_v7m_preserve_fp_state
>    0.00      0.05     0.00   728354     0.00     0.00  hmp_calc_dirty_rate
>    0.00      0.05     0.00   681634     0.00     0.00  helper_sadd8
>    0.00      0.05     0.00   487743     0.00     7.14  qmp_query_cpu_definitions
>    0.00      0.05     0.00   420528     0.00     0.00  arm_v7m_cpu_do_interrupt
>    0.00      0.05     0.00   382245     0.00     0.00  helper_ssub8
>    0.00      0.05     0.00   374192     0.00     0.00  helper_usub8
>    0.00      0.05     0.00   347199     0.00     0.00  usb_msd_load_request
>    0.00      0.05     0.00   325862     0.00     0.00  target_disas
>    0.00      0.05     0.00   322375     0.00     0.00  arm_hcrx_el2_eff
>    0.00      0.05     0.00   317835     0.00     0.00  virtio_bus_device_iommu_enabled
>    0.00      0.05     0.00   309559     0.00     0.00  mig_throttle_counter_reset
>    0.00      0.05     0.00   301557     0.00     0.00  ram_bytes_remaining
>    0.00      0.05     0.00   292888     0.00     0.00  helper_v7m_blxns
>    0.00      0.05     0.00   289093     0.00     0.00  tpm_util_show_buffer
>    0.00      0.05     0.00   274156     0.00     0.00  helper_sxtb16
>    0.00      0.05     0.00   273588     0.00     0.00  write_v7m_exception
>    0.00      0.05     0.00   271619     0.00     0.00  page_size_init
>    0.00      0.05     0.00   270247     0.00     0.00  qemu_fdt_setprop_sized_cells_from_array
>    0.00      0.05     0.00   229643     0.00    14.69  helper_neon_addl_u32
