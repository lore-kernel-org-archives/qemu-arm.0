Received: by 10.182.105.169 with SMTP id gn9csp1086241obb;
        Mon, 9 Nov 2015 02:54:20 -0800 (PST)
X-Received: by 10.129.60.12 with SMTP id j12mr25818230ywa.76.1447066460110;
        Mon, 09 Nov 2015 02:54:20 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-yk0-x231.google.com (mail-yk0-x231.google.com. [2607:f8b0:4002:c07::231])
        by mx.google.com with ESMTPS id k8si7155223ywk.160.2015.11.09.02.54.20
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 02:54:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::231 as permitted sender) client-ip=2607:f8b0:4002:c07::231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::231 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by ykek133 with SMTP id k133so257674641yke.2
        for <alex.bennee@linaro.org>; Mon, 09 Nov 2015 02:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=T7YddyI4PpeDISkO3+ZrbYfGt4LvEOgbh+NvVyZq0jM=;
        b=F0UkGDdJuth0GQ9NawHdFPGZW09R0CGYx1uUc+U5bH1PMGDF/mdaacbKfT/mVLIe0U
         0Leb8alb7Xu7XgXYFmeyin58ovw4/i0idYGtEzOJki+9dt23x9w2z/TVWVr7aY7cCFT4
         wRvvxN/Hss8klu3ANPaggwxPlhIXSjMCLsG6OK/atzqf+wpmZou/w6ONsFjdhb9Z0u10
         7lS/xozMIrdn+EQr2LsdkHxKwCubZ6PmVHpMI2GLIeFbkbOBs22DiGadO4x0AC8xCHGj
         alLBxsb/BnSYJKiBgOlfUhqP4MvIrUEOa53N1dCZH65j44hb9CU0EurLcQuaK/GOEaEt
         C0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=T7YddyI4PpeDISkO3+ZrbYfGt4LvEOgbh+NvVyZq0jM=;
        b=QhtDKeBCw6ceMKpUiho7mPY4jQ2hMjRKY7QNY3Ps3RqED67E3ZvlgGJbxs70nwimNw
         Hev90eO6I0lRrt5xTC1/8Qx4AbRtseMjwH6xmACl5kCqMaTPQOUe7wLiII0njedWKmkf
         2eQ0aGOFs1KqFa4mxnKy1L8ZmECoR93opvGwiMXy0XYV02wMONaBcOpbuz951lCcL4BU
         BbIlkwXTFM/ZNuLpnOpA7Z1i5hQChp6Pxzfcwpkq8kaO5C1K9VoqhHhd7yefvR/dlVed
         GSyUBkxA4HKgzNuaDeTTCVxOlOiKbvVbFMV0SZuqecBpmwqqOENqIvhch6ryPX7FDnpY
         58qw==
X-Gm-Message-State: ALoCoQnlCsHWsHvSgUkvOjQzaaV2e+sX4rLzvHW1sL89XEHYI3ZK1shST+IK+C1bH8hztVtGxOMm
X-Received: by 10.129.57.133 with SMTP id g127mr22002074ywa.105.1447066459858;
 Mon, 09 Nov 2015 02:54:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 9 Nov 2015 02:54:00 -0800 (PST)
In-Reply-To: <56407A2C.7050906@redhat.com>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-9-git-send-email-peter.maydell@linaro.org> <56407A2C.7050906@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2015 10:54:00 +0000
Message-ID: <CAFEAcA-W1forLUTHf=NdqoiBUDT35PBAzveKq3XVC+xZb3QtTA@mail.gmail.com>
Subject: Re: [PATCH 08/16] exec.c: Have one io_mem_watch per AddressSpace
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-TUID: sSnUi1lBeNV+

On 9 November 2015 at 10:49, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 05/11/2015 19:15, Peter Maydell wrote:
>> @@ -2045,17 +2037,18 @@ static MemTxResult watch_mem_read(void *opaque, hwaddr addr, uint64_t *pdata,
>>  {
>>      MemTxResult res;
>>      uint64_t data;
>> +    AddressSpace *as = opaque;
>>
>>      check_watchpoint(addr & ~TARGET_PAGE_MASK, size, attrs, BP_MEM_READ);
>>      switch (size) {
>>      case 1:
>> -        data = address_space_ldub(&address_space_memory, addr, attrs, &res);
>> +        data = address_space_ldub(as, addr, attrs, &res);
>>          break;
>>      case 2:
>> -        data = address_space_lduw(&address_space_memory, addr, attrs, &res);
>> +        data = address_space_lduw(as, addr, attrs, &res);
>>          break;
>>      case 4:
>> -        data = address_space_ldl(&address_space_memory, addr, attrs, &res);
>> +        data = address_space_ldl(as, addr, attrs, &res);
>>          break;
>>      default: abort();
>>      }
>
> current_cpu is available here, so it should be possible to have only one
> io_mem_watch per CPU address space index (i.e. two).

So the opaque gives you the asidx and then you look at current_cpu's
cpu_ases[asidx]? Yeah, that works and is simpler. (Good argument for
making "number of ASes per CPU" a compile-time constant I guess.)

> But actually, if the address space can be derived from the attributes,
> you just need to fish the right address space out of current_cpu.
>
>> +    as->io_mem_watch = g_new0(MemoryRegion, 1);
>
> This is leaked when the address space goes away.  You can allocate it
> statically inside AddressSpace if my alternative plan from above doesn't
> work out.

Oh, right, it's not sufficient to unref it, it doesn't auto-free
itself when the refcount drops to 0.

thanks
-- PMM
