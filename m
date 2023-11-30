Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp236081ejb;
        Thu, 30 Nov 2023 05:49:56 -0800 (PST)
X-Received: by 2002:a2e:8049:0:b0:2c9:b84a:1482 with SMTP id p9-20020a2e8049000000b002c9b84a1482mr5068078ljg.17.1701352196353;
        Thu, 30 Nov 2023 05:49:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701352196; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQ6mZAN3Sk0OBL5qOvZoiXQm6YA/IjAW5sQaJm8JgiqhbaVT92+BDt6MXyCMhKyHgp
         PappPXfxLIJGWzEkCrkzrEY7596NLDBtMK4jOrHv98y7iI9AN6uZAZC708vRB1u+6lH2
         C+hu/KiTLTlie5Ds2gDLATXer3gmqTk//6b0W6awzVx/yfcuzpT6NCua5YCTrRYCO/gw
         kuhUxI0B4OS5MkPnrWe1c4j1YFXKJrmon+1RpcjTV4ViDpVKm1XXU2QYwVl9uHE/uq5/
         Cqh6NH4SbI4qxKkYCNrwzHZXqqMipHz8xKJej9RbwHFhnGXALSIXAjaFdqfyE1ye4cMf
         +wpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MzXC86kI/230MRmOExolGBgQpce+zyW7qougvXLVSk8=;
        fh=vq6TxQ5MccBz0KdbaF/bByy5+pn65vn8lyysQZcYMWE=;
        b=oiWCUhFz1BXmDWeaXM3KhgBjEzQcZbfwWCFuCQhmZMkkWE9WwqO+WK8p8H4Iq2PDFg
         HrXZ3XeibIJIj03Q9OyX7jyZjSb3fRclpO4v+7mxigmZDPkqWRusFh/ixlqv1WM7CtUy
         yHjERKkRfenCksiJkydQoAf+Ga6fyHyMzd97J0J22xcrFBPShgNduTb9cIlHcX+IpJaB
         x31VsKxiM5QQ0mN6muUVp/K3vpvq3IhuSTHFzaRgb5j82i2qVbaMYy/KjdGZct3XTNlv
         ui88aD+JI7X5SSNz5kfCPtlpTYyZEPStU9Mu0vcE99Ub1xlu3k/3udfm3nLJ3dx8XOBY
         V2eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e57stsaJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d18-20020a05600c34d200b003fef8272b2fsor382849wmq.9.2023.11.30.05.49.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Nov 2023 05:49:56 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e57stsaJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701352196; x=1701956996; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MzXC86kI/230MRmOExolGBgQpce+zyW7qougvXLVSk8=;
        b=e57stsaJHyWH1yrMZjkp+HRYSDrfZFPZ5HbaRSYg4UUFDiv2vOr8Jvk7Akngh/iJjw
         4gEoxbbS3pU9z0cM9nMyDRWhTghXHCThwMNmw/R5NQmQ1/5vZfnd2ISo3i0N3V+D0Wfm
         VLd95WVIie/7VhMpvyiYhc7mMvxGKXXevbkVyJ2q8LgbCRUwgg6oBx1L3goS3YmAtSiA
         40tx/sCu4mbmL0MjvgnR3rmpdjJiUtUpPMbA+zP19C1Ug7N9+I//3NijAbUg7JfiRlMr
         Brmn5z96rN/zGlLmAmFRgJTTkBfCGasEivWK7ooNFAUfnCvTACPMlOuQBno5QMJza33v
         Gp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701352196; x=1701956996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzXC86kI/230MRmOExolGBgQpce+zyW7qougvXLVSk8=;
        b=baQ7tUs+kbV1v6ZbFW4LPo1ZeZg5FxDoAUGpbGQIfCwtlBhMP689faXjen32kDnbbo
         R3wUUwUwWdVjfnNijifgDCOb3H3xlEHwSBtHI5Zq32QeC/Jgdvn63bIajrZLid8NZbYv
         rdu5HaRjgQdaZw561S6zjTD4qMEsPa4/JITCaj7Lvh3jPtGuMemdzgK4aL3MTOykqpyE
         lWtQlaiEB2GhLZlZUM7LCxTHC+Xa2QT7W6kht8A02j7PLy2yz6+fBi/T/32IBSFIOvF0
         24DENQyvJWw9oODk4tj3MRvDhofsfG7IwpoVMHxj9BTvSMocIsw2hNEHbhqq1un/5okR
         Zrpw==
X-Gm-Message-State: AOJu0YwNEcDs8hUefakwa/9Qncfgs+w4STB1QT5KMXZm9s1cLLne2ZOy
	BDR1wQc6qHBsFnuoAxasK0B4PEWe
X-Google-Smtp-Source: AGHT+IGEZM/F60lbKf+pyOaxLGJZDqngSEf0GXts+oJS0AF+AGOPuKqrMqfmt5a2LHBk+wqKglvvAA==
X-Received: by 2002:adf:f588:0:b0:332:eb19:9530 with SMTP id f8-20020adff588000000b00332eb199530mr14573473wro.32.1701352195915;
        Thu, 30 Nov 2023 05:49:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr. [176.184.17.116])
        by smtp.gmail.com with ESMTPSA id h1-20020adfe981000000b00332f6202b82sm1595392wrm.9.2023.11.30.05.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 05:49:55 -0800 (PST)
Message-ID: <fcaff24d-0ced-4547-898f-a9b8bf49be45@linaro.org>
Date: Thu, 30 Nov 2023 14:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] Rename "QEMU global mutex" to "BQL" in comments and
 docs
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Hyman Huang <yong.huang@smartx.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Paul Durrant <paul@xen.org>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org, Jason Wang
 <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Huacai Chen <chenhuacai@kernel.org>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Jiri Slaby <jslaby@suse.cz>, Alexander Graf <agraf@csgraf.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Stafford Horne <shorne@gmail.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 John Snow <jsnow@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Michael Roth <michael.roth@amd.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Leonardo Bras
 <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-7-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231129212625.1051502-7-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: iVy+P+8KoPuf

On 29/11/23 22:26, Stefan Hajnoczi wrote:
> The term "QEMU global mutex" is identical to the more widely used Big
> QEMU Lock ("BQL"). Update the code comments and documentation to use
> "BQL" instead of "QEMU global mutex".
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   docs/devel/multi-thread-tcg.rst   |  7 +++----
>   docs/devel/qapi-code-gen.rst      |  2 +-
>   docs/devel/replay.rst             |  2 +-
>   docs/devel/multiple-iothreads.txt | 16 ++++++++--------
>   include/block/blockjob.h          |  6 +++---
>   include/io/task.h                 |  2 +-
>   include/qemu/coroutine-core.h     |  2 +-
>   include/qemu/coroutine.h          |  2 +-
>   hw/block/dataplane/virtio-blk.c   |  8 ++++----
>   hw/block/virtio-blk.c             |  2 +-
>   hw/scsi/virtio-scsi-dataplane.c   |  6 +++---
>   net/tap.c                         |  2 +-
>   12 files changed, 28 insertions(+), 29 deletions(-)


> diff --git a/include/block/blockjob.h b/include/block/blockjob.h
> index e594c10d23..b2bc7c04d6 100644
> --- a/include/block/blockjob.h
> +++ b/include/block/blockjob.h
> @@ -54,7 +54,7 @@ typedef struct BlockJob {
>   
>       /**
>        * Speed that was set with @block_job_set_speed.
> -     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
> +     * Always modified and read under BQL (GLOBAL_STATE_CODE).

"under the BQL"

>        */
>       int64_t speed;
>   
> @@ -66,7 +66,7 @@ typedef struct BlockJob {
>   
>       /**
>        * Block other operations when block job is running.
> -     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
> +     * Always modified and read under BQL (GLOBAL_STATE_CODE).

Ditto,

>        */
>       Error *blocker;
>   
> @@ -89,7 +89,7 @@ typedef struct BlockJob {
>   
>       /**
>        * BlockDriverStates that are involved in this block job.
> -     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
> +     * Always modified and read under BQL (GLOBAL_STATE_CODE).

Ditto.

>        */
>       GSList *nodes;
>   } BlockJob;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
