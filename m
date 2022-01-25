Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2431552lfk;
        Tue, 25 Jan 2022 00:17:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzulNoG+w7BFBYYZRk5gqYh0lCFUq72KNVVJZgovAn65QAIqCUvrY1RaCd1vFmW2MCFzzaD
X-Received: by 2002:a17:907:7fa4:: with SMTP id qk36mr4367434ejc.461.1643098629945;
        Tue, 25 Jan 2022 00:17:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643098629; cv=none;
        d=google.com; s=arc-20160816;
        b=N7Pc0yt8ixxc4u6iOdWKq5+FXNs4ahxCVGXgA5wU5s/Hbh+M6slqS4RdM17AY4UnYZ
         tLDE5LYMeMCKp0jpumMybj0mDtbXeDbBVHv5a47pCTFpMidhJD1mHZG4zq8CrkYk6PkM
         yGd6xNb2bqvJ/hNmSvt7LmlotKwHJa1Tinkl6dTsdq+r1fYtw2r3nWotCZ5cnvbNzSY6
         jhXMkgOo25PEElY+SxoCa57U6/9P6hr8aXB6cOWI4EYVrKhFyglk4wlFHTkGZOycv3n+
         bhjtidVkRcAeaduNMsNggXo78icve4sdt223BRDCF9HgUV0pNns4966UUt+oxJ8jjOnN
         6xhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QowzXW3+zgILZlg+DAjYJz1IvhbppaLPnBfYtM/T8Js=;
        b=vrSVFTP963I8/Bzxn/Pmy4D5CUMBeBqlFQUwFvu5eU+8aLjGhsEnxfo2sAgOsMu32g
         aC/RAU4fecojvZvND/mVhHr4RWeme6xcoh9f+FR1mCi2x/hr3iF2mwyQueSFMFhYYXMj
         DtCaLjRYYjdZumFXgGOhUpCHKDYP/jh4LiTSP4oX9ezBpgdoO5rQR3Vgkxpn/CE+Ur3K
         C8KzcRr+2irnEXgCz0RX+Up3dD4Zzdc4/NiNPAlUKYTVy3bA/zqwmPK+Glvxf7F+oqt6
         Fj+/CwF1n6j5z0jpPU3bTONBo8b0XDpsh6Ey8UldUs7uRmcvy2rKAX8w01d7pA3yXWYk
         Si5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XOI5dSgT;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id n2si10268585edi.143.2022.01.25.00.17.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jan 2022 00:17:09 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XOI5dSgT;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643098628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QowzXW3+zgILZlg+DAjYJz1IvhbppaLPnBfYtM/T8Js=;
	b=XOI5dSgT25WL5a5T1xxNunC4bnSTh/egPb5c3clEK8Mk7obVOZwnggzsX2rnzM2Lxu/Ubh
	pcYnSnXCayT4A2bHPHpM+ITO61nsavwVNeYVWk2G03BaLE8/G/8iSZCUbwKQjfvcjjPInB
	EcmMDmJXFNiMKnkI69ZyjpwUmk1v0zA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-bAzvTe9APPa7pUgGMCsw2w-1; Tue, 25 Jan 2022 03:17:07 -0500
X-MC-Unique: bAzvTe9APPa7pUgGMCsw2w-1
Received: by mail-wr1-f72.google.com with SMTP id t13-20020adfa2cd000000b001d09443ee4fso2666404wra.3
        for <alex.bennee@linaro.org>; Tue, 25 Jan 2022 00:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QowzXW3+zgILZlg+DAjYJz1IvhbppaLPnBfYtM/T8Js=;
        b=YWq7wBSYf/lbRdUQd5YLVZ/x3O7VS25q9vQMkAiO67xhDhpR4Gp0FLRUwewjXnKZDW
         AorRIIqEAu0Q1pP9WYcsaRKN6nCB7yrYh3lukPtHlodbWwNNc8fbvmCjPctNbrIpvIXH
         beEe8CxuqxlYjst2bDi4FRygh7uNbGdOLHzyUNDQ1/kqbLnnutDXUWYncRu2WamXi3Sm
         r1r4blE3q8GNm0gFiRxkxgRdYNvj+W2F1CBQ27ofPuEX3GP/cee9Ewwetwa3xteMBrI5
         p89fB4wtVZwohUvNcTRLGicLVgPauzkRKnrj5WhYyL+psJyAJtcgd5sIrVLaG8NIpyJM
         znpw==
X-Gm-Message-State: AOAM531SgElr1l/6ZIr5Ghftj4vGw+zDUx4y834lHmHKWVkg6EskkfQ6
	388yFF0/csOR+5s9WPjHW1i+LsbTT99N7BNNeSgNnGGOGfpso4aFl9B/A3NnBehq6MPljseJrUy
	LnRLn4dYi43bN59I9jzA6UgfwZFiQGJQqI8Q18wfmxn9VoUJtZtwkQTuJBYfO7aM9
X-Received: by 2002:a1c:4407:: with SMTP id r7mr1794600wma.112.1643098626688;
        Tue, 25 Jan 2022 00:17:06 -0800 (PST)
X-Received: by 2002:a1c:4407:: with SMTP id r7mr1794573wma.112.1643098626396;
        Tue, 25 Jan 2022 00:17:06 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id d9sm17060642wrp.14.2022.01.25.00.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 00:17:05 -0800 (PST)
Message-ID: <9e8b013c-5340-0cd4-0bee-7b48ba4dc525@redhat.com>
Date: Tue, 25 Jan 2022 09:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 12/22] plugins: stxp test case from Aaron (!upstream)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, Luke.Craig@ll.mit.edu, Alexandre Iooss <erdnaxe@crans.org>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-13-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220124201608.604599-13-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: mCkL3PMblCEr

On 24/01/2022 21.15, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
> Message-ID: <YXCA62xdRDeueQR6@strawberry.localdomain>
> 
> ---
> [AJB] this was for testing, I think you can show the same stuff with
> the much more complete execlog now.
> ---
>   contrib/plugins/stxp-plugin.c     | 50 +++++++++++++++++++++++++++++++
>   tests/tcg/aarch64/stxp.c          | 28 +++++++++++++++++
>   contrib/plugins/Makefile          |  1 +
>   tests/tcg/aarch64/Makefile.target |  3 ++
>   4 files changed, 82 insertions(+)
>   create mode 100644 contrib/plugins/stxp-plugin.c
>   create mode 100644 tests/tcg/aarch64/stxp.c
> 
> diff --git a/contrib/plugins/stxp-plugin.c b/contrib/plugins/stxp-plugin.c
> new file mode 100644
> index 0000000000..432cf8c1ed
> --- /dev/null
> +++ b/contrib/plugins/stxp-plugin.c
> @@ -0,0 +1,50 @@
> +#include <stdio.h>
> +#include <stdarg.h>
> +#include <qemu-plugin.h>
> +
> +QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
> +
> +void qemu_logf(const char *str, ...)
> +{
> +    char message[1024];
> +    va_list args;
> +    va_start(args, str);
> +    vsnprintf(message, 1023, str, args);
> +
> +    qemu_plugin_outs(message);
> +
> +    va_end(args);
> +}
> +
> +void before_insn_cb(unsigned int cpu_index, void *udata)
> +{
> +    uint64_t pc = (uint64_t)udata;
> +    qemu_logf("Executing PC: 0x%" PRIx64 "\n", pc);
> +}
> +
> +static void mem_cb(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo, uint64_t va, void *udata)

Could you please break the line to avoid checkpatch errors:

ERROR: line over 90 characters
#63: FILE: contrib/plugins/stxp-plugin.c:25:
+static void mem_cb(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo, 
uint64_t va, void *udata)

ERROR: line over 90 characters
#77: FILE: contrib/plugins/stxp-plugin.c:39:
+        qemu_plugin_register_vcpu_insn_exec_cb(insn, before_insn_cb, 
QEMU_PLUGIN_CB_R_REGS, (void *)pc);

ERROR: line over 90 characters
#78: FILE: contrib/plugins/stxp-plugin.c:40:
+        qemu_plugin_register_vcpu_mem_cb(insn, mem_cb, 
QEMU_PLUGIN_CB_NO_REGS, QEMU_PLUGIN_MEM_RW, (void*)pc);

ERROR: "(foo*)" should be "(foo *)"
#78: FILE: contrib/plugins/stxp-plugin.c:40:
+        qemu_plugin_register_vcpu_mem_cb(insn, mem_cb, 
QEMU_PLUGIN_CB_NO_REGS, QEMU_PLUGIN_MEM_RW, (void*)pc);

total: 4 errors, 1 warnings, 92 lines checked

  Thanks,
   Thomas
