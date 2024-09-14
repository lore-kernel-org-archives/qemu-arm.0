Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp209155njl;
        Sat, 14 Sep 2024 04:36:31 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWRGjwroKr9enGvRBPyPd9tXwJGI6ZGZlVO8SNDEF34U5B9XIFVab0AQWg+KqbaGlk3REHovqqg3GydAg==@linaro.org
X-Google-Smtp-Source: AGHT+IEyTu23tTHAllBWCjiWvHWnZ8sgIwhWJ1hzpriNwBJovVSiHLpkugttpYqqkONbmE2G3ovk
X-Received: by 2002:a05:622a:1214:b0:458:2b7b:c448 with SMTP id d75a77b69052e-4583c7ad96emr287642461cf.22.1726313791513;
        Sat, 14 Sep 2024 04:36:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1726313791; cv=pass;
        d=google.com; s=arc-20240605;
        b=jwSzdyC8njJUYOFlGhH4QbyjFSPYxldd74C5L3GKXAY6eWmv6AdfPfu0e/NaYNxc3K
         TxYz8YBiKuDLhg/8Kd2O1BITD8hVDb73DJ+4l5NYmjbR3b8RgiW0f1+RxLFsxrZ7R7j0
         wHU5BWwuzbk1ELJpYWCQ/Th78y+Q4F7blG3LrKedbE+tzm8Oc8n/e15WQ3ceubCXURqe
         09CgmV36lX+ftemnQOXSFoMif7IgYkjnSYFnvGjBZpgovhebTXwyxuAhjBJ0RzyVxLUC
         I+wsnar8l0QXcCeaaOFuf1zc5gNkOXA5y44lbK0F8w/FqGAtJN0hD678946slv5l0F68
         eqhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=8HWkc9NKCkmUjprmgEeSAxd+QEjohSYZtT2oI1bs3NQ=;
        fh=B6sqipkaAQ+OF2UgK3kcInK4GieGzJrLphHSdvBer70=;
        b=XL34hAvHiB2jYE0LW75W8DJBGHJy/LG4gTR6iEqSxnCVJCGEJNx7pIij+pXMj0Ue11
         5ipdVFUkn95rAgbw/s3WTXhQeEdP+NmtZrTXv+r/sN7sWqnsD8+Si7St2HwyxNX+u0rh
         jc0vK2ykOM+q0ApFfX9lnoLcNPFjaK3m3JhjHSsMa2r/hQP8zNAlVAHuLby6G7Elxrso
         X+9aXbqZgQLCxWdKiUVEZQm29vZOC/VDLnojEovO2z/DAIB0Zkb8k+8DLC8QHGS9S/OV
         t8otx5v+JWCv3oIaFTbleA29nB7dO3L/oNEtJGq35f8l8Bgt5xZw9ZnO/gUftO4Ir7c1
         bcuw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@hotmail.com header.s=selector1 header.b=KCsaYdsY;
       arc=pass (i=1);
       spf=pass (google.com: domain of junjie.mao@hotmail.com designates 2a01:111:f403:2819::806 as permitted sender) smtp.mailfrom=junjie.mao@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
Return-Path: <junjie.mao@hotmail.com>
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn20806.outbound.protection.outlook.com. [2a01:111:f403:2819::806])
        by mx.google.com with ESMTPS id d75a77b69052e-459aaf14c10si12255021cf.401.2024.09.14.04.36.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Sep 2024 04:36:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of junjie.mao@hotmail.com designates 2a01:111:f403:2819::806 as permitted sender) client-ip=2a01:111:f403:2819::806;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@hotmail.com header.s=selector1 header.b=KCsaYdsY;
       arc=pass (i=1);
       spf=pass (google.com: domain of junjie.mao@hotmail.com designates 2a01:111:f403:2819::806 as permitted sender) smtp.mailfrom=junjie.mao@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itUxlNpCU72UJOEABAkImr4Gvq9D3D5ZG3RTErHjiU/IRqiuG3VwmvIWCdU17DEoWI+bV2Djr83gmGi40krW0CBsaX9z65VcwgTKqNCJ7+aPpv1vdzp512Kv+2CLJHBpWsRIKAUbeeM4+ci6+CxSCXGKWR+TEWeLh/a4lxOyWDki2D3DSRtnlkQ7I1FCxsqJ4Y9hrBdryRdmTIHIqS2D1gIDU7VqW8JaMx8mRXMuj9rtA+rhvJfatvISpQTUeYxnn45ZmYOp2lq9aYEjN6mqJbgGOxJ0gKlyvRWpVWwBO6m6WlDUOs1EDxwhtOQOT0NEGEku0u9vIaz/VQHX9r9rZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HWkc9NKCkmUjprmgEeSAxd+QEjohSYZtT2oI1bs3NQ=;
 b=Aw6z9NbuqJyns4YzK4Lg3jaZokpbKs7w/b3vikzYU9r8AbASwy+G9k3Lhnj6GEHpeHYavClLMuPsJDjPniF7d5NJTZG3Oc3K7Kcv9eWlWBgPO2NFXIbhRqaaWQs0b99S00fsvQcTo8MBQx6UCSmjA3RSdqclLo820Nct2PVSj5am8Qnz5oGQzSp52ZbtNy5Rh6bfF2XA8zivONKnfOYZ1pO/dm4ePr2pAu9Do7dstYvqHtVLFJRf2lHNb+InUbbP/e9a97ZmRso6W0gMaQK0eCCxD3GE8DtT1UL6q948MCRCrSHQ23E3cs5y0aEPMQVtAX1sj2OCLozBF8u/JwKZ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HWkc9NKCkmUjprmgEeSAxd+QEjohSYZtT2oI1bs3NQ=;
 b=KCsaYdsY+3ZPOjdSuCRrHihhaVHdNSjpIDYs3DKSVyv5FUPneod0ptPgAm+WFenI28uZCAq1wOK9umTJvbd17xgCP0Mjf0oZFu8Aasb+tXb1ZIUkHOImkrBkkQghqTjlyrHfCymYMMien0aPrj9J3jpOm2oOAG5BzK6mzoy5rEw5Vv3XFTeq9wwWF3XYWBuvoFWmnvQCZVmHyUsGJtqk5y7jdib/WzI+93JwqFZ7O1UfENkEnQvXIBPq0IOJcieqg6xLBdxhSWP452sjHnD6J8LxzT8O7RHIi8jNvmSBSbnj3xZrcZ/vLEEbP8K9DXMOzBayQunbRQ8xO+9+XLq8jw==
Received: from SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:282::22)
 by SY8P300MB0202.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:267::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.21; Sat, 14 Sep
 2024 11:36:24 +0000
Received: from SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM
 ([fe80::aea3:2365:f9e8:5bd]) by SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM
 ([fe80::aea3:2365:f9e8:5bd%2]) with mapi id 15.20.7962.021; Sat, 14 Sep 2024
 11:36:24 +0000
From: Junjie Mao <junjie.mao@hotmail.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,
  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  Gustavo Romero
 <gustavo.romero@linaro.org>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Junjie Mao <junjie.mao@intel.com>,
  Zhao Liu <zhao1.liu@intel.com>,  John Snow <jsnow@redhat.com>,  Cleber
 Rosa <crosa@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Wainer dos
 Santos Moschetta <wainersm@redhat.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH v10 9/9] rust: add PL011 device model
References: <20240910-rust-pl011-v10-0-85a89ee33c40@linaro.org>
	<20240910-rust-pl011-v10-9-85a89ee33c40@linaro.org>
	<SY0P300MB102661760C7F4AC73EDBB70F95662@SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM>
Date: Sat, 14 Sep 2024 19:36:17 +0800
In-Reply-To: <SY0P300MB102661760C7F4AC73EDBB70F95662@SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM>
	(Junjie Mao's message of "Sat, 14 Sep 2024 16:03:40 +0800")
Message-ID:
 <SY0P300MB1026206D60F2AEC8788BDA1D95662@SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:282::22)
Return-Path: junjie.mao@hotmail.com
X-Microsoft-Original-Message-ID: <87ldzuii1a.fsf@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY0P300MB1026:EE_|SY8P300MB0202:EE_
X-MS-Office365-Filtering-Correlation-Id: f317029b-304b-4036-bb24-08dcd4b1766a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|15080799006|7092599003|461199028|5072599009|8060799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	AW7JFsRS3AmwiKg/Uzu54loS+XnbsxE9KcEUbh+JAwbeo2Szg0T5V0iQeAYf4kVMrqGCX2JNO8LeVEi1QUqCeIjiCWCbpjUWxNvjcHaPdaXRtUVYd6FF9qTnrswOAfRBCnDFpHTtObxGbJ3NgPmunb43w+6ve07knfV7pRwoNfhGRxSq+6lgFOUl4ZVSUT/X9Vkm2ZANLrYOVJNJvTLVHWQJRT8YTALDebgxCzl6Ckgedo7UMv85OQjkbYqS4D5j1DtBDyvs/06iP918zW5GPnxeoNTMXzMvEo1MZzt/cTwWXeRYzHAzQwDiZmOWpHIV42rGjwwFs3/Dp07lZSWjqnIHJjWkJKJC3zBSA23HrGxYqceoYQlS6enhPmeUjaNH+q1AB8pF7oQ8nucsQoTJJpvrEDZTxfpfr5oIlyNmectuToarAUS3Cv0vAN/6R6pRWo7XaAMC5Lg1sEnaETof4kTqfx8leJ8J4s7p++sdUS/raUwyJfTUollbLSGE+jIW9Pr0hXUs4w+qjr+0zgRNa0qqkSA6afDJfXWVtMPdAiORKG4wCM7zjn2sFLV7fbdsVDidvm1us2VQZj/ir4OrC9Ma3t/DxmaG4bonROGtze/TngHhoLVfUdSj5v/+2oPRX/DjtopFKm+aU2xAueKXj6LgsrKp6VCHlMnbRnZuIu18NMU185jPYXDVI6qq5GT8AnHfZhiVXTsKSghA5IkWnX8wlL4jj5IsM1w1qkMCGTk=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aSDqIMQCwgRVbg1Nipo/5Iu19wMFSqxEWHyLLQCOl+NDCsWwt9AHckpfQx/Y?=
 =?us-ascii?Q?bCFVtsuUg0iJsP46cypD82fGrrfmEUqgo6E6rq/RxtLJy79i/sARd4OlrBP0?=
 =?us-ascii?Q?RAvl/+03UX1miIRw7BptuA17gX3kQ4cMRvtgj7PP2qykvvmW+qJfA8dQDpQU?=
 =?us-ascii?Q?Rfn7NugD/d3uQM95W2JkmCp2glcpyqWbAr9DLA2sA8wNvrCGPenhc9LTekGK?=
 =?us-ascii?Q?X824lDexvsJNPfj50jas5LhKrjd4BNoon9u61hY/egMmMtMsqIsMXnqAb6bN?=
 =?us-ascii?Q?k1w7BV7P4Ts50i7bpEgGcZCFLGTWC6vRJqLhpwlCBX7oexxqac61dGps2xsb?=
 =?us-ascii?Q?2se9BOfiX0nuWk0KTByzRj2IrxQ2EA9cdyUxZlYU+SANDvM5w1H66vSZfh+p?=
 =?us-ascii?Q?uxjcRFBBDi3AwBX8EZ56fPzKHH/mtc88+f8RPq08C6/Z5aU4eYt8HJ3lEccv?=
 =?us-ascii?Q?2PJchTtQ68GB4l6ASjjm3ZFrmQf1CIzMgxUWc0yN/8K/Iz1rLKy1x5KjU52b?=
 =?us-ascii?Q?aHdvzNf695SOCoedrR8F35+LEG0H3IPrQ4TrT5oTfIK3aQIC76XY2z95penh?=
 =?us-ascii?Q?d8a8AgfczwcL33f8SfVkFOKIpZmfpI+oTCXvcPnQInlscPUZYdoZlnhl/y/+?=
 =?us-ascii?Q?RqpRWbLIDWwEzc6wgYUNBAOKXuvjrFT23fBkBobR6+4XIBYaJziZsVkyVB4K?=
 =?us-ascii?Q?fwWcokhawZLz+vw1MMM5WKgxqRB7zcsQwvO7HEx489D3w1aAJpg/7GivHY27?=
 =?us-ascii?Q?0SkWQ19Bksg+mitRhse53e0t01HwR9Do6EOfOvp9AcXqKcMAV6nJ3FW29V7D?=
 =?us-ascii?Q?AtDKs09ezkCR/uZkCmqNBDF8seTac5Zl+HtX1YieoWRqgaoMgnXKo8lRnuHR?=
 =?us-ascii?Q?Q6m1/v0frvExI+QVyFu+/RNBtCl0rUyVWkeFA8d5pP9BIOdsBP9KAfQKA6OQ?=
 =?us-ascii?Q?AB6UynVQR/pZvV2thiwLgHOD36KaMbFX1QhqRK6ELiKd3Om9uIRJlh1mv2d7?=
 =?us-ascii?Q?mfh1GEPsHNX6XJhZZvT4omPMRIA3R+vXuNLIYG0pq7BubyjnMMfCjRIp+Bg4?=
 =?us-ascii?Q?qYcJY165ryDtv/mJlJaSQnlKKqNbhHlt6CVs7pRRhfuszglNxF/ajytRkOd1?=
 =?us-ascii?Q?DLzqIiztO24nOlt22Tm0VY+dois16S96jYQ6ufhVPnarTBWhfPY13Qs0Q337?=
 =?us-ascii?Q?ro85L945o8ep1K7GdXDpDOgggLY84NOmaQ8sDNYG9ZSWxrSMYJChwmOhO54?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-448bf.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f317029b-304b-4036-bb24-08dcd4b1766a
X-MS-Exchange-CrossTenant-AuthSource: SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 11:36:24.2700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY8P300MB0202
X-TUID: 12y8P8bbA6mS

Junjie Mao <junjie.mao@hotmail.com> writes:

> Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:
>
>> This commit adds a re-implementation of hw/char/pl011.c in Rust.
>>
>> How to build:
>>
>> 1. Configure a QEMU build with:
>>    --enable-system --target-list=aarch64-softmmu --enable-rust
>> 2. Launching a VM with qemu-system-aarch64 should use the Rust version
>>    of the pl011 device
>>
>> Co-authored-by: Junjie Mao <junjie.mao@intel.com>
>> Co-authored-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Junjie Mao <junjie.mao@intel.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> ---
> [snip]
>> diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..6bd121b83ae831e838b05d83b67c698474b00b4a
>> --- /dev/null
>> +++ b/rust/hw/char/pl011/src/device.rs
>> @@ -0,0 +1,600 @@
>> +// Copyright 2024, Linaro Limited
>> +// Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +use core::{
>> +    ffi::{c_int, c_uchar, c_uint, c_void, CStr},
>> +    ptr::{addr_of, addr_of_mut, NonNull},
>> +};
>> +
>> +use qemu_api::{
>> +    bindings::{self, *},
>> +    definitions::ObjectImpl,
>> +};
>> +
>> +use crate::{
>> +    memory_ops::PL011_OPS,
>> +    registers::{self, Interrupt},
>> +    RegisterOffset,
>> +};
>> +
>> +static PL011_ID_ARM: [c_uchar; 8] = [0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1];
>> +
>> +const DATA_BREAK: u32 = 1 << 10;
>> +
>> +/// QEMU sourced constant.
>> +pub const PL011_FIFO_DEPTH: usize = 16_usize;
>> +
>> +#[repr(C)]
>> +#[derive(Debug, qemu_api_macros::Object)]
>> +/// PL011 Device Model in QEMU
>> +pub struct PL011State {
>> +    pub parent_obj: SysBusDevice,
>> +    pub iomem: MemoryRegion,
>> +    #[doc(alias = "fr")]
>> +    pub flags: registers::Flags,
>> +    #[doc(alias = "lcr")]
>> +    pub line_control: registers::LineControl,
>> +    #[doc(alias = "rsr")]
>> +    pub receive_status_error_clear: registers::ReceiveStatusErrorClear,
>> +    #[doc(alias = "cr")]
>> +    pub control: registers::Control,
>> +    pub dmacr: u32,
>> +    pub int_enabled: u32,
>> +    pub int_level: u32,
>> +    pub read_fifo: [u32; PL011_FIFO_DEPTH],
>> +    pub ilpr: u32,
>> +    pub ibrd: u32,
>> +    pub fbrd: u32,
>> +    pub ifl: u32,
>
> Some of the fields can be private to the implementation of PL011State.
>

Forgot to mention, all those are minor comments that came to my mind
when I studied your code. Feel free to defer them to future
series. Thanks.

-- 
Best Regards
Junjie Mao
