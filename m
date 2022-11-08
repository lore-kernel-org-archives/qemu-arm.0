Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3763195ejx;
        Tue, 8 Nov 2022 02:09:47 -0800 (PST)
X-Received: by 2002:a05:600c:1508:b0:3cf:6cc1:c3b4 with SMTP id b8-20020a05600c150800b003cf6cc1c3b4mr33575946wmg.156.1667902186916;
        Tue, 08 Nov 2022 02:09:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667902186; cv=none;
        d=google.com; s=arc-20160816;
        b=kaOmmcLi9Ehbj+Xd337hb1yO5uSep/nIFUblPmck1YpxWkvKN6dWk7Jvw7dCtYh26f
         V+vghiKqCPCLMFUtnYG3h2iHeLW71yr/0kzkiuPwBlfblu+QoLYiRGC4D8iPM787S3fZ
         yqVVWM0iwXd9vJHB8r59MMxrqPXk0yRCfV0M2MCBWXrPtKHm0sRDHsNXa60SfglGQ/Ul
         en5r8LZbtBRfxnMV5qlYee3G3D8opmh4ytPUoGqHO3dcQ61whnEal3ZeGKNkcO+paHyI
         qf2IaN4jQuU2wlQBHT7FGLqELGP8zp6P5NF2kfaiyZTkmCwInPqqNjDDiArihxHeF4EY
         5MQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PBuuYhT1JpZhLn9k4HBlA5caR0RMHj1xng42owFfgzk=;
        b=GGAm5PQIWwRwBz895fCi/yjFgQ7q4Sn0l8B9te3SqafQ2Pu8nC8RnCC+Ol0wQNT24G
         oHsHts3OoB57rO4Bg5Vvc8waF2i3F5zxEOG+AIdIC1F9m/XHv733Ak0+NHirYodkUMIp
         1TtgXtSEDJLIlPsVkOj538cpeFZczVLU0ScRDi9bJAr8u0xFy07jqk9sMJjjfVkzy7Kd
         TymtWegws2iJ8xZq3tReghVv1Aqxvs4TDJFTqTo1YnUq8+95FWR5e/oqYss8nrhP0WJK
         cOIzZUlhcxQpb75ybzCH3KKor4FMBxb7c3B0/JuV2VPX25RrnWVOSUfhye/jeK5DjvHY
         tNkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=PVevaqfG;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u18-20020adfb212000000b0023622d65cb9sor4233176wra.71.2022.11.08.02.09.46
        (Google Transport Security);
        Tue, 08 Nov 2022 02:09:46 -0800 (PST)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=PVevaqfG;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PBuuYhT1JpZhLn9k4HBlA5caR0RMHj1xng42owFfgzk=;
        b=PVevaqfG2bG3Q15g5/Q02LvDxIbahRsrzXEIQmtS/LTtuM8inWMhGItU5Y9cxncxUU
         6GDBazTaGt7g8xAHulWDkRM4qIdmGCc+qEjdlOtKy6X7RVEltafpGRvQweu8tFlpENeE
         E7gAiu15CY9uhjgYxxwwOGcHS87Fq0bImU7h+L6lVsei3BhxKYKWpYT7Y4zvtyQgjpyA
         HX3ascxys744kTk9Yl8VaDSdCy2pZZ4UYJ235ktvFZpZos9XMPYF4dBzvOwpPzspyoox
         OQjPUrhXlhI64ILgI+d8znc7I+L2bYYMcMUBH7amsLZBVw+68rv/ukWF2sL57W6xjwxn
         T5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBuuYhT1JpZhLn9k4HBlA5caR0RMHj1xng42owFfgzk=;
        b=adZFsqSK+odfhzlPyTP16JVczWxp1i5Mv8/XiJ2/lPR1xOmoronw/3H0+tacY/bpZ0
         FOnLOkbUOy4z2QMMzeFkm1Ey9KDL1io0MjEIatiU6by1inu2Gc0VSLSI0f/psRMVyZgp
         L5luBlfthO7Fzd+63/ckaiM6agdTfSahifBDKX4S3klP4iq/NpoOaZyKiGdijQN4KVZk
         4MGs2DBHHbRPWnYqoTDzXzAyfXXAGucN8v8AXPQ2nUzPZG3WC2jr9pf4m2F0+IWIplJI
         SzESKqznqD/IjgR0FRqNEJLucAsSpwXk7MxRMzMJLcVD8I7YWModT1vhTIUaUb/N7Jux
         q5lQ==
X-Gm-Message-State: ACrzQf0Q+ocTsK7UfEJPcwXkqe+GRQJRNeqQm0+kDoFokJsP92x3tqR9
	DZZmS829pUQZ+uUGEHvEYCfzfHWXAlJ83MNduYw=
X-Google-Smtp-Source: AMsMyM72fG9tXGcFww3l+94QhKy33EpMprb+NlccQjFR128c0V+kTmFsBqDeJdK9fkGVZ1FEmHFUhCB+f2fO/d2IUBI=
X-Received: by 2002:adf:ea10:0:b0:236:ec3e:869d with SMTP id
 q16-20020adfea10000000b00236ec3e869dmr23416470wrm.33.1667902186330; Tue, 08
 Nov 2022 02:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20221104184101.6923-1-fcagnin@quarkslab.com> <20221104184101.6923-3-fcagnin@quarkslab.com>
 <2B918171-9464-40DC-AE11-D25E60858370@ynddal.dk>
In-Reply-To: <2B918171-9464-40DC-AE11-D25E60858370@ynddal.dk>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Tue, 8 Nov 2022 11:09:35 +0100
Message-ID: <CAF8_6KmwMCiNcC-romHoGZhcpPph71b3qv7yn9RHQArV3Q+nDA@mail.gmail.com>
Subject: Re: [PATCH 2/3] hvf: implement guest debugging on Apple Silicon hosts
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com, 
	Peter Maydell <peter.maydell@linaro.org>, "open list:ARM cores" <qemu-arm@nongnu.org>, 
	Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>, 
	Francesco Cagnin <fcagnin@quarkslab.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: VtQzPuwnG2pm

Mads, thanks for the review and feedbacks. I worked on this a few months
ago but only managed to have it published now, I'm sorry for work being
done twice.

I'll add support for SSTEP_NOIRQ as you suggested.

For multi-core systems there's no particular issue, just I'm not
familiar with all of these topics and I'm asking for good practices. KVM
saves breakpoints information in struct 'KVMState', and following the
same approach I've updated struct 'HVFState' to store equivalent data.
To keep separate information for each cpu, KVM uses field 'kvm_state' in
struct 'CPUState' (see 'include/hw/core/cpu.h'), but at the moment
there's no analogous field for the HVF state (which is instead defined
as a single global variable in 'accel/hvf/hvf-accel-ops.c'). Should we
add a new field to 'CPUState' for the HVF state, or take a different
approach?

For your last question regarding `hv_vcpu_set_trap_debug_exceptions()`,
I think it's possible to move it to `hvf_arch_update_guest_debug()` but
I'm not confident about `hvf_arch_init_vcpu()`, I will experiment again.
